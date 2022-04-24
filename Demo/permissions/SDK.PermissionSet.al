permissionset 52350 "jdi TTS Demo SDK"
{
    Caption = 'The Things Stack SDK Demo';
    Assignable = true;
    Access = Public;
    IncludedPermissionSets = "jdi TTS SDK";
    Permissions =
        tabledata "jdi TTS Demo API Key" = RIMD,
        tabledata "jdi TTS Demo Application" = RIMD,
        tabledata "jdi TTS Demo Device" = RIMD,
        tabledata "jdi TTS Demo Gateway" = RIMD,
        tabledata "jdi TTS Demo Setup" = RIMD,
        tabledata "jdi TTS Demo Storage" = RIMD,
        page "jdi TTS Demo Setup Card" = X,
        page "jdi TTS Demo API Key Card" = X,
        page "jdi TTS Demo API Key List" = X,
        page "jdi TTS Demo Application List" = X,
        page "jdi TTS Demo Device List" = X,
        page "jdi TTS Demo Gateway List" = X,
        page "jdi TTS Demo Storage List" = X,
        codeunit "jdi TTS Demo Install" = X,
        codeunit "jdi TTS Demo Upgrade" = X,
        codeunit "jdi TTS Demo GetApplications" = X,
        codeunit "jdi TTS Demo GetDevices" = X,
        codeunit "jdi TTS Demo GetGateways" = X,
        codeunit "jdi TTS Demo GetStorage" = X;
}