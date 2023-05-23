$errorActionPreference = "Stop"
try
{
   Write-Output "--- Connecting to Azure using MSI..."
    Connect-AzAccount -Identity
}
catch {
    Write-Error -Message $_.Exception
    throw $_.Exception
}

Write-Output "--- Reading variables...."
$resourceGroup = "rg-name"
$appServicePlan = "appserviceplaname"
$sku = "Tier"
$WorkerSize = "Small/Medium/Larger"

Write-Output "--- Processing '$appServicePlan' App Service Plan..."

Write-Output "--- Converting '$servicePlan' to '$sku'..."
Set-AzAppServicePlan -Name $appServicePlan -ResourceGroupName $resourceGroup -Tier $sku -WorkerSize $WorkerSize
Write-Output "--- Done!'"

