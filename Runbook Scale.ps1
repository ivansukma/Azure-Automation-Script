$errorActionPreference = "Stop"

Write-Output "--- Connecting to Azure using MSI..."
Connect-AzAccount -Identity

Write-Output "--- Reading variables...."
$rg = Get-AutomationVariable -Name 'rg-name'
$servicePlan = Get-AutomationVariable -Name 'service-plan-name'
$sk = Get-AutomationVariable -Name 'scale-down-sku'

Write-Output "--- Processing '$servicePlan' App Service Plan..."
$currentAppServicePlan = Get-AzAppServicePlan -ResourceGroupName $rg -Name $servicePlan

Write-Output "--- Converting '$servicePlan' to '$sk'..."
Set-AzAppServicePlan -ResourceGroupName $rg -Name $servicePlan -Tier $sk
Write-Output "--- Done!'"
