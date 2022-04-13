[![Current](https://github.com/juliandittmann/AL.TheThingsStackSDK/actions/workflows/current.yml/badge.svg)](https://github.com/juliandittmann/AL.TheThingsStackSDK/actions/workflows/current.yml)

# AL.TheThingsStackSDK for Dynamics 365 Business Central

This is a SDK which provides API access to The Things Stack. Take a look at the [Getting Started documentation](./Docs/Getting%20Started.md). The Things Stack SDK provides the following functionality:

- GetApplications
- GetDevices
- GetGateways
- GetStoredApplicationUp

## What is The Things Stack?

The Things Stack is an enterprise grade LoRaWAN network server, built on an open source core. The Things Stack allows you to build and manage LoRaWAN networks on your own hardware or in the cloud. Reference: [here](https://www.thethingsindustries.com/docs/getting-started/what-is-tts/)

## App Packages (Preview)

There are download links to the latest app packages. 

Links:

 * App: https://juliandittmann.blob.core.windows.net/al-thethingsstacksdk-preview/latest/apps.zip

* Runtimepackages: https://juliandittmann.blob.core.windows.net/al-thethingsstacksdk-preview/latest/runtimepackages.zip

* Testapp & Demo App: https://juliandittmann.blob.core.windows.net/al-thethingsstacksdk-preview/latest/testapps.zip

Install via BCContainerhelper: 

> PS&gt; Publish-BcContainerApp -containerName $containername -appFile "https://juliandittmann.blob.core.windows.net/al-thethingsstacksdk-preview/latest/apps.zip" -sync -install


Note: To get previous versions replace "latest" with the version. 

Example: */latest/apps.zip -> */20.0.20.0/apps.zip

## License 

MIT
 
See [License](LICENSE) for full license text.
