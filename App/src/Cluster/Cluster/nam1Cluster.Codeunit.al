codeunit 52414 "jdi TTS nam1 Cluster" implements "jdi TTS IClusterAddress"
{
    Access = Internal;

    procedure GetAPIEndpoint(): Text;
    var
        lAPIEndpointTxt: Label 'https://nam1.cloud.thethings.network', Locked = true;
    begin
        exit(lAPIEndpointTxt);
    end;

    procedure GetOAuthEndpoint(): Text
    var
        lOAuthEndpointTxt: Label 'https://nam1.cloud.thethings.network/oauth', Locked = true;
    begin
        exit(lOAuthEndpointTxt);
    end;

}