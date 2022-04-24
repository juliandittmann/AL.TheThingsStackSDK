permissionset 50350 "jdi TTS Test SDK"
{
    Caption = 'The Things Stack SDK Test';
    Assignable = true;
    Access = Public;
    IncludedPermissionSets = "jdi TTS SDK";
    Permissions =
        codeunit "jdi TTS Test Install" = X,
        codeunit "jdi TTS Test Upgrade" = X,
        codeunit "jdi TTS Test Helper" = X,
        codeunit "jdi TTS Test API Gateway" = X,
        codeunit "jdi TTS Test API Application" = X,
        codeunit "jdi TTS Test API Device" = X,
        codeunit "jdi TTS Test API Storage" = X;
}