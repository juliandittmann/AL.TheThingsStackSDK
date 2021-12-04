page 50255 "jdi TTS Demo GetGateways"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'The Things Stack Demo Gateways (Manual)';
    layout
    {
        area(Content)
        {
            group(GroupName)
            {

            }
        }
    }

    actions
    {
        area(Processing)
        {

            action(TestGetGateways)
            {
                ApplicationArea = All;
                Image = TestFile;
                ToolTip = 'TestGetGateways';

                trigger OnAction()
                var
                    GatewayAPI: Codeunit "jdi TTS API Gateway";
                    JResponse: JsonObject;
                    HttpResponse: HttpResponseMessage;

                    Cluster: Enum "jdi TTS Cluster Address";
                    APIVerion: Enum "jdi TTS API GetGateways";
                    Param: Dictionary of [Enum "jdi TTS Param GetGateways", Text];
                    GetDevicesParam: Enum "jdi TTS Param GetGateways";
                begin
                    Cluster := Cluster::eu1;
                    APIVerion := APIVerion::v3;

                    Clear(Param);
                    Param.Add(GetDevicesParam::"AuthToken", GetDefaultAPIKey());

                    GatewayAPI.GetGateways(Cluster, APIVerion, Param, JResponse);
                    GatewayAPI.GetGateways(Cluster, APIVerion, Param, HttpResponse);
                end;
            }
        }
    }

    local procedure GetDefaultAPIKey(): Text
    var
        TTSSDKDemoSetup: Record "jdi TTS Demo Setup";
    begin
        if TTSSDKDemoSetup.Get() then
            exit(TTSSDKDemoSetup.GetDefaultAPIKey());
    end;
}