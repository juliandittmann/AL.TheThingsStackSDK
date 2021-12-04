page 50254 "jdi TTS Demo GetDevices"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'The Things Stack Demo Device (Manual)';
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

            action(TestGetDevices)
            {
                ApplicationArea = All;
                Image = TestFile;
                ToolTip = 'TestGetDevices';

                trigger OnAction()
                var
                    DeviceAPI: Codeunit "jdi TTS API Device";
                    JResponse: JsonObject;
                    HttpResponse: HttpResponseMessage;

                    Cluster: Enum "jdi TTS Cluster Address";
                    APIVerion: Enum "jdi TTS API GetDevices";
                    Param: Dictionary of [Enum "jdi TTS Param GetDevices", Text];
                    GetDevicesParam: Enum "jdi TTS Param GetDevices";
                begin
                    Cluster := Cluster::eu1;
                    APIVerion := APIVerion::v3;

                    Clear(Param);
                    Param.Add(GetDevicesParam::"AuthToken", GetDefaultAPIKey());
                    Param.Add(GetDevicesParam::ApplicationID, '<Your Application Id>');

                    DeviceAPI.GetDevices(Cluster, APIVerion, Param, JResponse);
                    DeviceAPI.GetDevices(Cluster, APIVerion, Param, HttpResponse);
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