enum 52400 "jdi TTS Cluster Address" implements "jdi TTS IClusterAddress"
{
    Access = Public;
    Extensible = true;
    DefaultImplementation = "jdi TTS IClusterAddress" = "jdi TTS Default Cluster";

    value(0; "eu1")
    {
        Caption = 'Europe 1 (Ireland)';
        Implementation = "jdi TTS IClusterAddress" = "jdi TTS EU1 Cluster";
    }
}