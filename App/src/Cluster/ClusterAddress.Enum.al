enum 52400 "jdi TTS Cluster Address" implements "jdi TTS IClusterAddress"
{
    Access = Public;
    Extensible = true;

    value(0; "eu1")
    {
        Implementation = "jdi TTS IClusterAddress" = "jdi TTS EU1 Cluster";
    }
}