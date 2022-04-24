codeunit 52353 "jdi TTS Demo GetGateways"
{
    Access = Internal;
    Description = 'Code sample how to use GetGateways API';
    local procedure GetDevices()
    var
        GatewayAPI: Codeunit "jdi TTS API Gateway";
        JResponse: JsonObject;
        HttpResponse: HttpResponseMessage;

        Cluster: Enum "jdi TTS Cluster Address";
        APIVerion: Enum "jdi TTS API GetGateways";
        Param: Dictionary of [Enum "jdi TTS Param GetGateways", Text];
        GetDevicesParam: Enum "jdi TTS Param GetGateways";
    begin
        Clear(Param);
        Param.Add(GetDevicesParam::"AuthToken", '<Insert AuthToken>');

        //Return value JsonObject
        GatewayAPI.GetGateways(Cluster::eu1, APIVerion::v3, Param, JResponse);
        GatewayAPI.GetGateways(Cluster::eu1, APIVerion::v3, Param, HttpResponse);
    end;
}