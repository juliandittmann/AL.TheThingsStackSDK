enum 52403 "jdi TTS API GetDevices" implements "jdi TTS IGetDevices"
{
    Extensible = true;
    DefaultImplementation = "jdi TTS IGetDevices" = "jdi TTS GetDevicesv3";
    value(0; "v3")
    {
        Caption = 'v3';
        Implementation = "jdi TTS IGetDevices" = "jdi TTS GetDevicesv3";
    }
}