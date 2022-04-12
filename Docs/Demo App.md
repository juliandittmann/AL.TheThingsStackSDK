# Demo App

The Demo app provides a showcase scenario how to use AL.TheThingsStackSDK. 

# Install

Before you can install the demo app you need to install the TheThingsStackSDK first.

Get the latest Demo App: https://juliandittmann.blob.core.windows.net/al-thethingsstacksdk-preview/latest/testapps.zip

Install via BCContainerhelper: 

> PS&gt; Publish-BcContainerApp -containerName $containername -appFile "https://juliandittmann.blob.core.windows.net/al-thethingsstacksdk-preview/latest/testapps.zip -sync -install -skipVerification

# Setup

Search for "TTS Demo Setup" and set a Default API Key.  

![TTSSetup](/Docs/assets/TTSSetup.png)
Now you are ready to go.


# Usage scenarios

## Get Gateways

Search for "TTS Demo Gateways". Select a cluster and click "Load Gateways".

![TTSGateways](/Docs/assets/TTS%20Demo%20Gateways.png)

Your registered gateways are shown.


## Get Applications

Search for "TTS Demo Applications". Select a cluster and click "Load Applications".

![TTSGateways](/Docs/assets/TTS%20Demo%20Applications.png)

Clicking "Show Devices" to load the Devices that are registered to the application.

## Get Devices

Search for "TTS Demo Devices". Select a cluster and fill the ApplicationId. To receive the data click "Load Devices".

![TTSDevices](/Docs/assets/TTS%20Demo%20Devices.png)

Click "Show Storage" to open the TTS Demo Storage page.

## Get Storage

Search for "TTS Demo Storage". Select a cluster and fill the ApplicationId,DeviceId To receive the data click "Load Storage".

![TTSStorage](/Docs/assets/TTS%20Demo%20Storage.png)


