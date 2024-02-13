param location string= 'westus3'
param storageName string = 'gstorage'

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: storageName
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'premium_LRS'
  }
}

