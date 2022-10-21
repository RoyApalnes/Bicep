// Main template
 
targetScope = 'subscription'
 
param appName string = 'FirstBicepDeployment'
param orgId string = '0x${substring(subscription().subscriptionId, 0, 4)}'
param environment string = 'Dev'
 
var tags = {
  WorkloadName: 'FirstBicepDeployment'
  DataClassification: 'Non-business'
  Criticality: 'Low'
  BusinessUnit: 'Demo'
  ApplicationName: appName
  Env: environment
}
var location = deployment().location
var rgName = toLower('rg-${appName}-${environment}-001')
 
resource rgDemoDeployment 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: rgName
  location: location
  tags: tags
  properties: {}
}
 
module demoDeployment './MyFristBicepDeployment.bicep' = {
  name: 'demoDeployment'
  scope: rgDemoDeployment
  params: {
    appName: appName
    orgId: orgId
    environment: environment
    tags: tags
  }
  dependsOn: [
    rgDemoDeployment
  ]
}
