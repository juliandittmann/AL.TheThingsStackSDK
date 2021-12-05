codeunit 50253 "jdi TTS Demo GetDevices"
{
    Access = Internal;
    Description = 'Code sample how to use GetDevices API';
    local procedure GetDevices()
    var
        DeviceAPI: Codeunit "jdi TTS API Device";
        JResponse: JsonObject;
        HttpResponse: HttpResponseMessage;

        Cluster: Enum "jdi TTS Cluster Address";
        APIVerion: Enum "jdi TTS API GetDevices";
        Param: Dictionary of [Enum "jdi TTS Param GetDevices", Text];
        GetDevicesParam: Enum "jdi TTS Param GetDevices";
    begin
        Clear(Param);
        Param.Add(GetDevicesParam::"AuthToken", '<Insert AuthToken>');
        Param.Add(GetDevicesParam::ApplicationID, '<Insert ApplicationId>');

        //Return value JsonObject
        DeviceAPI.GetDevices(Cluster::eu1, APIVerion::v3, Param, JResponse);

        //Return value HttpResponse
        DeviceAPI.GetDevices(Cluster::eu1, APIVerion::v3, Param, HttpResponse);
    end;
}