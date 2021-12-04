codeunit 52407 "jdi TTS eu1 Cluster" implements "jdi TTS IClusterAddress"
{
    Access = Internal;

    procedure GetAPIEndpoint(): Text;
    var
        lAPIEndpointTxt: Label 'https://eu1.cloud.thethings.network', Locked = true;
    begin
        exit(lAPIEndpointTxt);
    end;

    procedure GetOAuthEndpoint(): Text
    var
        lOAuthEndpointTxt: Label 'https://eu1.cloud.thethings.network/oauth', Locked = true;
    begin
        exit(lOAuthEndpointTxt);
    end;

}