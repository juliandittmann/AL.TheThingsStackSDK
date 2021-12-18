permissionset 52400 "jdi TTS SDK"
{
    Caption = 'The Things Stack SDK';
    Assignable = false;
    Access = Public;

    Permissions =
        codeunit "jdi TTS Install" = X,
        codeunit "jdi TTS Upgrade" = X,
        codeunit "jdi TTS App Mgt." = X,
        codeunit "jdi TTS Default Cluster" = X,
        codeunit "jdi TTS eu1 Cluster" = X,
        codeunit "jdi TTS au1 Cluster" = X,
        codeunit "jdi TTS nam1 Cluster" = X,
        codeunit "jdi TTS API Application" = X,
        codeunit "jdi TTS API Gateway" = X,
        codeunit "jdi TTS API Device" = X,
        codeunit "jdi TTS API Storage" = X,
        codeunit "jdi TTS GetApplicationsv3" = X,
        codeunit "jdi TTS GetDevicesv3" = X,
        codeunit "jdi TTS GetGatewaysv3" = X,
        codeunit "jdi TTS GetStoredAppUpv3" = X,
        codeunit "jdi TTS REST Helper" = X;
}