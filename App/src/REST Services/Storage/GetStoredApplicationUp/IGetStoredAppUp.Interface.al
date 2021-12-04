interface "jdi TTS IGetStoredAppUp"
{
    Access = Public;
    procedure GetStoredApplicationUp(Cluster: Enum "jdi TTS Cluster Address"; Parameter: Dictionary of [Enum "jdi TTS Param GetStoredAppUp", Text]; var HttpResponse: HttpResponseMessage): Boolean;
    procedure GetStoredApplicationUp(Cluster: Enum "jdi TTS Cluster Address"; Parameter: Dictionary of [Enum "jdi TTS Param GetStoredAppUp", Text]; var JsonResponse: JsonObject): Boolean;
}