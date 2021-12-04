enum 52407 "jdi TTS API GetStoredAppUp" implements "jdi TTS IGetStoredAppUp"
{
    Extensible = true;
    Access = Public;
    DefaultImplementation = "jdi TTS IGetStoredAppUp" = "jdi TTS GetStoredAppUpv3";
    value(0; "v3")
    {
        Caption = 'v3';
        Implementation = "jdi TTS IGetStoredAppUp" = "jdi TTS GetStoredAppUpv3";
    }
}