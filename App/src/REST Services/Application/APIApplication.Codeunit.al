codeunit 52400 "jdi TTS API Application"
{
    Access = Public;
    Description = 'The Things Stack Application API. For further documentation vistis: https://www.thethingsindustries.com/docs/reference/api/application/';

    procedure GetApplications(Cluster: Enum "jdi TTS Cluster Address"; APIVersion: Enum "jdi TTS API GetApplications"; Parameter: Dictionary of [Enum "jdi TTS Param GetApplications", Text]; var JsonResponse: JsonObject): Boolean
    var
        IGetApplications: Interface "jdi TTS IGetApplications";
    begin
        IGetApplications := APIVersion;
        exit(IGetApplications.GetApplications(Cluster, CopyParameter(Parameter), JsonResponse));
    end;

    procedure GetApplications(Cluster: Enum "jdi TTS Cluster Address"; APIVersion: Enum "jdi TTS API GetApplications"; Parameter: Dictionary of [Enum "jdi TTS Param GetApplications", Text]; var HttpResponse: HttpResponseMessage): Boolean
    var
        IGetApplications: Interface "jdi TTS IGetApplications";
    begin
        IGetApplications := APIVersion;
        exit(IGetApplications.GetApplications(Cluster, CopyParameter(Parameter), HttpResponse));
    end;

    local procedure CopyParameter(Parameter: Dictionary of [Enum "jdi TTS Param GetApplications", Text]) ParameterCopy: Dictionary of [enum "jdi TTS Param GetApplications", Text];
    var
        ParamKeys: List of [Enum "jdi TTS Param GetApplications"];
        GetApplicationsParameter: Enum "jdi TTS Param GetApplications";
    begin
        Clear(ParameterCopy);
        ParamKeys := Parameter.Keys;
        foreach GetApplicationsParameter in ParamKeys do
            ParameterCopy.Add(GetApplicationsParameter, Parameter.Get(GetApplicationsParameter));
    end;
}