codeunit 52411 "jdi TTS GetDevicesv3" implements "jdi TTS IGetDevices"
{
    Access = Internal;
    procedure GetDevices(Cluster: Enum "jdi TTS Cluster Address"; Parameter: Dictionary of [enum "jdi TTS Param GetDevices", Text]; var HttpResponse: HttpResponseMessage): Boolean;
    var
        RESTHelper: Codeunit "jdi TTS REST Helper";
        UriBuilder: Codeunit "Uri Builder";
        Uri: Codeunit Uri;
        GetDeviceParamenter: Enum "jdi TTS Param GetDevices";
    begin
        UriBuilder.Init(BuildAPIUrl(Cluster, Parameter.Get(GetDeviceParamenter::ApplicationID)));
        UriBuilder.GetUri(Uri);

        exit(RESTHelper.InvokeWebRequest(Uri.GetAbsoluteUri(), Parameter.Get(GetDeviceParamenter::"AuthToken"), HttpResponse));
    end;

    procedure GetDevices(Cluster: Enum "jdi TTS Cluster Address"; Parameter: Dictionary of [enum "jdi TTS Param GetDevices", Text]; var JsonResponse: JsonObject): Boolean;
    var
        RESTHelper: Codeunit "jdi TTS REST Helper";
        HttpResponse: HttpResponseMessage;
    begin
        GetDevices(Cluster, Parameter, HttpResponse);
        exit(RESTHelper.ProcessHttpResponseMessage(HttpResponse, JsonResponse));
    end;

    local procedure BuildAPIUrl(Cluster: Enum "jdi TTS Cluster Address"; ApplicationId: Text): Text
    var
        ICluster: Interface "jdi TTS IClusterAddress";
        ApplicationsHttpBindingLbl: Label '/api/v3/applications/%1/devices', Locked = true;
    begin
        ICluster := Cluster;
        exit(StrSubstNo(ICluster.GetAPIEndpoint() + ApplicationsHttpBindingLbl, ApplicationId));
    end;

}