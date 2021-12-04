interface "jdi TTS IGetGateways"
{
    Access = Public;
    procedure GetGateways(Cluster: Enum "jdi TTS Cluster Address"; Parameter: Dictionary of [Enum "jdi TTS Param GetGateways", Text]; var HttpResponse: HttpResponseMessage): Boolean;
    procedure GetGateways(Cluster: Enum "jdi TTS Cluster Address"; Parameter: Dictionary of [Enum "jdi TTS Param GetGateways", Text]; var JsonResponse: JsonObject): Boolean;
}