codeunit 52415 "jdi TTS au1 Cluster" implements "jdi TTS IClusterAddress"
{
    Access = Internal;
    Description = 'For further documentation visit: https://www.thethingsindustries.com/docs/getting-started/ttn/addresses/';

    procedure GetAPIEndpoint(): Text;
    var
        lAPIEndpointTxt: Label 'https://au1.cloud.thethings.network', Locked = true;
    begin
        exit(lAPIEndpointTxt);
    end;

    procedure GetOAuthEndpoint(): Text
    var
        lOAuthEndpointTxt: Label 'https://au1.cloud.thethings.network/oauth', Locked = true;
    begin
        exit(lOAuthEndpointTxt);
    end;

}