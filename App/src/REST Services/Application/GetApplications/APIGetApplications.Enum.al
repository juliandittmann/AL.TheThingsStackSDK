enum 52401 "jdi TTS API GetApplications" implements "jdi TTS IGetApplications"
{
    Extensible = true;
    Access = Public;
    DefaultImplementation = "jdi TTS IGetApplications" = "jdi TTS GetApplicationsv3";
    value(0; "v3")
    {
        Caption = 'v3';
        Implementation = "jdi TTS IGetApplications" = "jdi TTS GetApplicationsv3";
    }
}