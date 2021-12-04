codeunit 52401 "jdi TTS API Gateway"
{
    Access = Public;
    Description = 'The Things Stack Gateway API';

    procedure GetGateways(Cluster: Enum "jdi TTS Cluster Address"; APIVersion: Enum "jdi TTS API GetGateways"; Parameter: Dictionary of [Enum "jdi TTS Param GetGateways", Text]; var JsonResponse: JsonObject): Boolean
    var
        IGetGateways: Interface "jdi TTS IGetGateways";
    begin
        IGetGateways := APIVersion;
        IGetGateways.GetGateways(Cluster, CopyParameter(Parameter), JsonResponse);
    end;

    procedure GetGateways(Cluster: Enum "jdi TTS Cluster Address"; APIVersion: Enum "jdi TTS API GetGateways"; Parameter: Dictionary of [Enum "jdi TTS Param GetGateways", Text]; var HttpResponse: HttpResponseMessage): Boolean
    var
        IGetGateways: Interface "jdi TTS IGetGateways";
    begin
        IGetGateways := APIVersion;
        IGetGateways.GetGateways(Cluster, CopyParameter(Parameter), HttpResponse);
    end;

    local procedure CopyParameter(Parameter: Dictionary of [Enum "jdi TTS Param GetGateways", Text]) ParameterCopy: Dictionary of [enum "jdi TTS Param GetGateways", Text];
    var
        ParamKeys: List of [Enum "jdi TTS Param GetGateways"];
        GetGatewaysParameter: Enum "jdi TTS Param GetGateways";
    begin
        Clear(ParameterCopy);
        ParamKeys := Parameter.Keys;
        foreach GetGatewaysParameter in ParamKeys do
            ParameterCopy.Add(GetGatewaysParameter, Parameter.Get(GetGatewaysParameter));
    end;
}