# This script checks for Quality Gate status for a SonarQube Project
[CmdletBinding()]
Param(
    # Define Sonar Token
    [Parameter (Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [String] $SonarToken,

    # Define SonarQube Server URI
    [Parameter (Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [String] $SonarServerName,

    # Define Project Key
    [Parameter (Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [String] $SonarProjectKey
)

$Token = [System.Text.Encoding]::UTF8.GetBytes($SonarToken + ":")
$TokenInBase64 = [System.Convert]::ToBase64String($Token)
 
$basicAuth = [string]::Format("Basic {0}", $TokenInBase64)
$Headers = @{ Authorization = $basicAuth }
 
$QualityGateResult = Invoke-RestMethod -Method Get -Uri http://$SonarServerName/api/qualitygates/project_status?projectKey=$SonarProjectKey -Headers $Headers
$QualityGateResult | ConvertTo-Json | Write-Host
 
if ($QualityGateResult.projectStatus.status -eq "OK"){
    Write-Host "Quality Gate Succeeded"
}
else{
    throw "Quality gate failed. Please check and fix the issues by reviewing the same."
}


