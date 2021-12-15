codeunit 52412 "jdi TTS GetGatewaysv3" implements "jdi TTS IGetGateways"
{
    Access = Internal;
    procedure GetGateways(Cluster: Enum "jdi TTS Cluster Address"; Parameter: Dictionary of [enum "jdi TTS Param GetGateways", Text]; var HttpResponse: HttpResponseMessage): Boolean;
    var
        RESTHelper: Codeunit "jdi TTS REST Helper";
        UriBuilder: Codeunit "Uri Builder";
        Uri: Codeunit Uri;
        GetDeviceParamenter: Enum "jdi TTS Param GetGateways";
    begin
        UriBuilder.Init(BuildAPIUrl(Cluster));
        UriBuilder.GetUri(Uri);

        if RESTHelper.InvokeWebRequest(Uri.GetAbsoluteUri(), Parameter.Get(GetDeviceParamenter::"AuthToken"), HttpResponse) then
            exit(HttpResponse.IsSuccessStatusCode());
    end;

    procedure GetGateways(Cluster: Enum "jdi TTS Cluster Address"; Parameter: Dictionary of [enum "jdi TTS Param GetGateways", Text]; var JsonResponse: JsonObject): Boolean;
    var
        RESTHelper: Codeunit "jdi TTS REST Helper";
        HttpResponse: HttpResponseMessage;
    begin
        GetGateways(Cluster, Parameter, HttpResponse);
        exit(RESTHelper.ProcessHttpResponseMessage(HttpResponse, JsonResponse));
    end;

    local procedure BuildAPIUrl(Cluster: Enum "jdi TTS Cluster Address"): Text
    var
        ICluster: Interface "jdi TTS IClusterAddress";
        ApplicationsHttpBindingLbl: Label '/api/v3/gateways', Locked = true;
    begin
        ICluster := Cluster;
        exit(ICluster.GetAPIEndpoint() + ApplicationsHttpBindingLbl);
    end;

}