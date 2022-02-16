# Zona Horaria automatica
$BingKey = "byoJpMSSF7x7Tho5ahSt~eZbnREBPSTw2UcM0WKLnJQ~Aq0LRgrExtkkJ1j-jp8Wv3cxNM2Ihlqvj3rToZosmHovF5taaNro8sr2A_ZxRaoi"
$IPInfo = Invoke-RestMethod http://ipinfo.io/json
$Location = $IPInfo.loc
Write-Host “Country : “$IPInfo.country
Write-Host “Public IP Address : “$IPInfo.ip
Write-Host “Location : “$IPInfo.loc
$BingTimeZoneURL = “http://dev.virtualearth.net/REST/v1/TimeZone/$Location” + “?key=$BingKey”
$ResultTZ = Invoke-RestMethod $BingTimeZoneURL
$WindowsTZ = $ResultTZ.resourceSets.resources.timeZone.windowsTimeZoneId
If (![string]::IsNullOrEmpty($WindowsTZ))
{
Get-TimeZone -id $WindowsTZ
##Set-TimeZone -id $WindowsTZ
}
 Write-Host 'Completed!' -ForegroundColor Green