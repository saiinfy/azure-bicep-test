// param location string= 'westus3'
// param storageName string = 'gstoragesai199467'

// resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
//   name: storageName
//   location: location
//   kind: 'StorageV2'
//   sku: {
//     name: 'premium_LRS'
//   }
// }

param location string = resourceGroup().location
param name string = 'space'
param storageAccountName string= '${toLower(name)}${uniqueString(resourceGroup().id)}'

resource storageaccount 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: storageAccountName
  location:location
  kind: 'StorageV2'
  sku: {
    name: 'Premium_LRS'
  }
  properties:{
    accessTier: 'Hot'
  }
}


resource appserviceplan 'Microsoft.Web/serverfarms@2021-02-01' = {
  name: 'xyz${storageAccountName}'
  location: location
  kind: 'linux'
  sku: {
    name: 'F1'
  }
  properties: {
    reserved: true
  }
}


resource webapp 'Microsoft.Web/sites@2023-01-01' = {
  name: 'zed${storageAccountName}'
  location: location
  kind: 'app'
  properties: {
    serverFarmId: appserviceplan.id
    httpsOnly: true
  }
}


