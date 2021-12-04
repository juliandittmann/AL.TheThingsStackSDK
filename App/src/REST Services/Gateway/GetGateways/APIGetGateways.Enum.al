enum 52405 "jdi TTS API GetGateways" implements "jdi TTS IGetGateways"
{
    Extensible = true;
    Access = Public;
    DefaultImplementation = "jdi TTS IGetGateways" = "jdi TTS GetGatewaysv3";
    value(0; "v3")
    {
        Caption = 'v3';
        Implementation = "jdi TTS IGetGateways" = "jdi TTS GetGatewaysv3";
    }
}