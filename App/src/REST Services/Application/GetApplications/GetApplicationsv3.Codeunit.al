codeunit 52410 "jdi TTS GetApplicationsv3" implements "jdi TTS IGetApplications"
{
    Access = Internal;
    procedure GetApplications(Cluster: Enum "jdi TTS Cluster Address"; Parameter: Dictionary of [enum "jdi TTS Param GetApplications", Text]; var HttpResponse: HttpResponseMessage): Boolean;
    var
        RESTHelper: Codeunit "jdi TTS REST Helper";
        UriBuilder: Codeunit "Uri Builder";
        Uri: Codeunit Uri;
        GetApplicationParamenter: Enum "jdi TTS Param GetApplications";
    begin
        UriBuilder.Init(BuildAPIUrl(Cluster));
        UriBuilder.GetUri(Uri);

        if RESTHelper.InvokeWebRequest(Uri.GetAbsoluteUri(), Parameter.Get(GetApplicationParamenter::"AuthToken"), HttpResponse) then
            exit(HttpResponse.IsSuccessStatusCode());
    end;

    procedure GetApplications(Cluster: Enum "jdi TTS Cluster Address"; Parameter: Dictionary of [enum "jdi TTS Param GetApplications", Text]; var JsonResponse: JsonObject): Boolean;
    var
        RESTHelper: Codeunit "jdi TTS REST Helper";
        HttpResponse: HttpResponseMessage;
    begin
        GetApplications(Cluster, Parameter, HttpResponse);
        exit(RESTHelper.ProcessHttpResponseMessage(HttpResponse, JsonResponse));
    end;

    local procedure BuildAPIUrl(Cluster: Enum "jdi TTS Cluster Address"): Text
    var
        ICluster: Interface "jdi TTS IClusterAddress";
        ApplicationsHttpBindingLbl: Label '/api/v3/applications', Locked = true;
    begin
        ICluster := Cluster;
        exit(ICluster.GetAPIEndpoint() + ApplicationsHttpBindingLbl);
    end;

}