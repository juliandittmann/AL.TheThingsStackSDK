codeunit 52405 "jdi TTS API Device"
{
    Access = Public;
    Description = 'The Things Stack Device API';

    procedure GetDevices(Cluster: Enum "jdi TTS Cluster Address"; APIVersion: Enum "jdi TTS API GetDevices"; Parameter: Dictionary of [Enum "jdi TTS Param GetDevices", Text]; var JsonResponse: JsonObject): Boolean
    var
        IGetDevices: Interface "jdi TTS IGetDevices";
    begin
        IGetDevices := APIVersion;
        IGetDevices.GetDevices(Cluster, CopyParameter(Parameter), JsonResponse);
    end;

    procedure GetDevices(Cluster: Enum "jdi TTS Cluster Address"; APIVersion: Enum "jdi TTS API GetDevices"; Parameter: Dictionary of [Enum "jdi TTS Param GetDevices", Text]; var HttpResponse: HttpResponseMessage): Boolean
    var
        IGetDevices: Interface "jdi TTS IGetDevices";
    begin
        IGetDevices := APIVersion;
        IGetDevices.GetDevices(Cluster, CopyParameter(Parameter), HttpResponse);
    end;

    local procedure CopyParameter(Parameter: Dictionary of [Enum "jdi TTS Param GetDevices", Text]) ParameterCopy: Dictionary of [enum "jdi TTS Param GetDevices", Text];
    var
        ParamKeys: List of [Enum "jdi TTS Param GetDevices"];
        GetDevicesParameter: Enum "jdi TTS Param GetDevices";
    begin
        Clear(ParameterCopy);
        ParamKeys := Parameter.Keys;
        foreach GetDevicesParameter in ParamKeys do
            ParameterCopy.Add(GetDevicesParameter, Parameter.Get(GetDevicesParameter));
    end;
}