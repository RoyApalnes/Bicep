@allowed({
  'Windows'
  'Linux'
  })
  
  @description('''
  - To deploy a Windows VM use the value "Windows"
  - To deploy a Linux VM use the value "Linux"
  ''')
  
  param WindowsOrLinux string


  var image = {
    windows: {
    publisher: 'MicrosoftWindowsServer'
    offer: 'WindowsServer'
    sku: '2022-Datacenter'
    version: 'latest'
    }
    linux: {
    publisher: 'Canonical'
    offer: 'UbuntuServer'
    sku: '22.04-LTS'
    version: 'latest'
    }
  }

resource vm
'Microsoft.Compute/virtualMachine@2021-03-01' = {

  storageProfile: {
    imageReference: {
      publisher: image[WindowsOrlinux].publisher
      offer: image[WindowsOrlinux].offer
      sku: image[WindowsOrlinux].sku
      version: image[WindowsOrlinux].version
      }
    }
}
