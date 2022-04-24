codeunit 52351 "jdi TTS Demo GetApplications"
{
    Access = Internal;
    Description = 'Code sample how to use GetApplications API';

    local procedure GetApplications()
    var
        ApplicationAPI: Codeunit "jdi TTS API Application";
        JResponse: JsonObject;
        HttpResponse: HttpResponseMessage;

        Cluster: Enum "jdi TTS Cluster Address";
        APIVerion: Enum "jdi TTS API GetApplications";
        Param: Dictionary of [Enum "jdi TTS Param GetApplications", Text];
        GetApplicationsParam: Enum "jdi TTS Param GetApplications";
    begin
        Clear(Param);
        Param.Add(GetApplicationsParam::"AuthToken", '<InsertAuthToken>');

        //Return value JsonObject
        ApplicationAPI.GetApplications(Cluster::eu1, APIVerion::v3, Param, JResponse);

        //Return value HttpResponse
        ApplicationAPI.GetApplications(Cluster::eu1, APIVerion::v3, Param, HttpResponse);
    end;
}