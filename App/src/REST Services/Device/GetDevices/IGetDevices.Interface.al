interface "jdi TTS IGetDevices"
{
    procedure GetDevices(Cluster: Enum "jdi TTS Cluster Address"; Parameter: Dictionary of [Enum "jdi TTS Param GetDevices", Text]; var HttpResponse: HttpResponseMessage): Boolean;
    procedure GetDevices(Cluster: Enum "jdi TTS Cluster Address"; Parameter: Dictionary of [Enum "jdi TTS Param GetDevices", Text]; var JsonResponse: JsonObject): Boolean;
}