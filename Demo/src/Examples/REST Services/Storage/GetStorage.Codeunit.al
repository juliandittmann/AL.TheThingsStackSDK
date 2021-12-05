codeunit 50255 "jdi TTS Demo GetStorage"
{
    Access = Internal;
    Description = 'Code sample how to use GetStorage API';
    local procedure GetStorage()
    var
        StorageAPI: Codeunit "jdi TTS API Storage";
        JResponse: JsonObject;
        HttpResponse: HttpResponseMessage;

        Cluster: Enum "jdi TTS Cluster Address";
        APIVerion: Enum "jdi TTS API GetStoredAppUp";
        Param: Dictionary of [Enum "jdi TTS Param GetStoredAppUp", Text];
        GetStoredAppUpParam: Enum "jdi TTS Param GetStoredAppUp";
    begin
        Clear(Param);
        Param.Add(GetStoredAppUpParam::"AuthToken", '<AuthToken');
        Param.Add(GetStoredAppUpParam::application_ids, '<applicatonId>');
        Param.Add(GetStoredAppUpParam::end_device_ids, '<deviceId>');
        Param.Add(GetStoredAppUpParam::type, '<Type>'); //For a list of Type visit: https://www.thethingsindustries.com/docs/reference/api/storage_integration/

        //Return value JsonObject
        StorageAPI.GetStoredApplicationUp(Cluster::eu1, APIVerion::v3, Param, JResponse);

        //Return value HttpResponse
        StorageAPI.GetStoredApplicationUp(Cluster::eu1, APIVerion::v3, Param, HttpResponse);
    end;
}