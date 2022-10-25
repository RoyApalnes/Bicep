// Main template
 
targetScope = 'subscription'
 
param appName string = 'SecondBicepDeployment'
param environment string = 'Dev'
param location string = 'westeurope'
@secure()
param vmPass string
 
var rgName = toLower('rg-${appName}-${environment}-001')
 
resource rgDemoDeployment 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: rgName
  location: location
  properties: {}
}
 
module demoDeployment './SecondBicepDeployment.bicep' = {
  name: 'demoDeployment'
  scope: rgDemoDeployment
  params: {
    vmUserName: 'myadmin'
    vmPass: vmPass
    windowsOrlinux: 'windows'
    location: location
  }
}
