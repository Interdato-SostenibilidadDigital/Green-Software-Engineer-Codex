param(
    [Parameter(Mandatory = $true, Position = 0, ValueFromRemainingArguments = $true)]
    [string[]] $Domains,

    [switch] $Json
)

$ErrorActionPreference = "Stop"

function Normalize-Hostname {
    param([string] $InputValue)

    $value = $InputValue.Trim()
    if ([string]::IsNullOrWhiteSpace($value)) {
        throw "El dominio no puede estar vacio."
    }

    if ($value -match "^[a-zA-Z][a-zA-Z0-9+.-]*://") {
        $uri = [System.Uri]::new($value)
        return $uri.Host.ToLowerInvariant()
    }

    $withoutPath = ($value -split "/")[0]
    $withoutPort = ($withoutPath -split ":")[0]
    return $withoutPort.ToLowerInvariant()
}

function Invoke-Greencheck {
    param([string] $Hostname)

    $endpoint = "https://api.thegreenwebfoundation.org/api/v3/greencheck/$Hostname"
    try {
        $response = Invoke-RestMethod -Method Get -Uri $endpoint -Headers @{
            Accept = "application/json"
            "User-Agent" = "Interdato-Green-Software-Engineer-Codex"
        }

        [pscustomobject]@{
            domain = $Hostname
            status = if ($response.green) { "green" } else { "grey" }
            green = [bool] $response.green
            hosted_by = $response.hosted_by
            hosted_by_website = $response.hosted_by_website
            modified = $response.modified
            supporting_documents = $response.supporting_documents
            source = "The Green Web Foundation Greencheck API"
            source_url = $endpoint
            interpretation = "Evidencia de hosting para el dominio consultado; no certifica el sistema completo ni reemplaza una linea base SCI."
        }
    }
    catch {
        [pscustomobject]@{
            domain = $Hostname
            status = "unknown"
            green = $null
            hosted_by = $null
            hosted_by_website = $null
            modified = $null
            supporting_documents = @()
            source = "The Green Web Foundation Greencheck API"
            source_url = $endpoint
            interpretation = "No se pudo consultar el dominio. Verifica conectividad, formato del dominio o disponibilidad del API."
            error = $_.Exception.Message
        }
    }
}

$results = foreach ($domain in $Domains) {
    $hostname = Normalize-Hostname -InputValue $domain
    Invoke-Greencheck -Hostname $hostname
}

if ($Json) {
    $results | ConvertTo-Json -Depth 6
    exit 0
}

foreach ($result in $results) {
    Write-Output "Dominio: $($result.domain)"
    Write-Output "Resultado: $($result.status)"
    Write-Output "Green hosting: $($result.green)"
    Write-Output "Proveedor detectado: $($result.hosted_by)"
    Write-Output "Sitio del proveedor: $($result.hosted_by_website)"
    Write-Output "Ultima actualizacion: $($result.modified)"
    Write-Output "Fuente: $($result.source)"
    Write-Output "URL fuente: $($result.source_url)"

    if ($result.supporting_documents -and $result.supporting_documents.Count -gt 0) {
        Write-Output "Evidencia:"
        foreach ($document in $result.supporting_documents) {
            Write-Output "- $($document.title): $($document.link)"
        }
    }
    else {
        Write-Output "Evidencia: no disponible en la respuesta."
    }

    Write-Output "Interpretacion: $($result.interpretation)"
    if ($result.error) {
        Write-Output "Error: $($result.error)"
    }
    Write-Output ""
}
