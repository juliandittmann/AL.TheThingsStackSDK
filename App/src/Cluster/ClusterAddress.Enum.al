enum 52400 "jdi TTS Cluster Address" implements "jdi TTS IClusterAddress"
{
    Access = Public;
    Extensible = true;
    DefaultImplementation = "jdi TTS IClusterAddress" = "jdi TTS Default Cluster";

    value(0; "eu1")
    {
        Caption = 'Europe 1 (Ireland)';
        Implementation = "jdi TTS IClusterAddress" = "jdi TTS eu1 Cluster";
    }
    value(1; "nam1")
    {
        Caption = 'North America 1 (California USA)';
        Implementation = "jdi TTS IClusterAddress" = "jdi TTS nam1 Cluster";
    }
    value(2; "au1")
    {
        Caption = 'Australia 1 (Sydney Australia)';
        Implementation = "jdi TTS IClusterAddress" = "jdi TTS au1 Cluster";
    }
}