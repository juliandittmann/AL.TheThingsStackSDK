interface "jdi TTS IGetApplications"
{
    procedure GetApplications(Cluster: Enum "jdi TTS Cluster Address"; Parameter: Dictionary of [Enum "jdi TTS Param GetApplications", Text]; var HttpResponse: HttpResponseMessage): Boolean;
    procedure GetApplications(Cluster: Enum "jdi TTS Cluster Address"; Parameter: Dictionary of [Enum "jdi TTS Param GetApplications", Text]; var JsonResponse: JsonObject): Boolean;
}