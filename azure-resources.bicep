param location string= 'westus3'
param storageName string = 'gstoragesai199467'

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: storageName
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'premium_LRS'
  }
}

