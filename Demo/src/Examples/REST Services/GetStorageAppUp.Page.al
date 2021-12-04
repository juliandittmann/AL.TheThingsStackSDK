page 50256 "jdi TTS Demo GetStorageAppUp"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'The Things Stack Demo Storage (Manual)';
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

            action(TestGetStorageApplicationUp)
            {
                ApplicationArea = All;
                Image = TestFile;
                ToolTip = 'TestGetStorageApplicationUp';

                trigger OnAction()
                var
                    StorageAPI: Codeunit "jdi TTS API Storage";
                    JResponse: JsonObject;
                    HttpResponse: HttpResponseMessage;

                    Cluster: Enum "jdi TTS Cluster Address";
                    APIVerion: Enum "jdi TTS API GetStoredAppUp";
                    Param: Dictionary of [Enum "jdi TTS Param GetStoredAppUp", Text];
                    GetStoredAppUpParam: Enum "jdi TTS Param GetStoredAppUp";
                begin
                    Cluster := Cluster::eu1;
                    APIVerion := APIVerion::v3;

                    Clear(Param);
                    Param.Add(GetStoredAppUpParam::"AuthToken", GetDefaultAPIKey());
                    Param.Add(GetStoredAppUpParam::application_ids, '<applicatonId>');
                    Param.Add(GetStoredAppUpParam::end_device_ids, '<deviceId>');
                    Param.Add(GetStoredAppUpParam::type, 'uplink_message');
                    Param.Add(GetStoredAppUpParam::limit, '10');

                    StorageAPI.GetStoredApplicationUp(Cluster, APIVerion, Param, JResponse);
                    StorageAPI.GetStoredApplicationUp(Cluster, APIVerion, Param, HttpResponse);
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