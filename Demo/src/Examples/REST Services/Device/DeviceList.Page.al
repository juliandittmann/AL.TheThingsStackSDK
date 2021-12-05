page 50259 "jdi TTS Demo Device List"
{

    ApplicationArea = All;
    Caption = 'TTS Demo Devices';
    PageType = List;
    SourceTable = "jdi TTS Demo Device";
    UsageCategory = Lists;
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;

    layout
    {
        area(content)
        {
            group(Settings)
            {
                field(Cluster; Cluster)
                {
                    Caption = 'Cluster';
                    ApplicationArea = all;
                }
                field(APIVersion; APIVersion)
                {
                    Caption = 'API Version';
                    ApplicationArea = all;
                }
                field(ApplicationId; ApplicationId)
                {
                    Caption = 'ApplicationId';
                    ApplicationArea = all;
                }
            }
            repeater(General)
            {
                Caption = 'Devices';
                field("device_id"; Rec.device_id)
                {
                    ApplicationArea = All;
                }
                field("application_id"; Rec.application_id)
                {
                    ApplicationArea = all;
                }
                field("dev_eui"; Rec.dev_eui)
                {
                    ApplicationArea = all;
                }
                field("join_eui"; Rec.join_eui)
                {
                    ApplicationArea = all;
                }
                field("created_at"; Rec.created_at)
                {
                    ApplicationArea = All;
                }
                field("updated_at"; Rec.updated_at)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(GetApplications)
            {
                Caption = 'Load Devices';
                ApplicationArea = All;
                Image = MoveDown;

                trigger OnAction()
                var
                    DeviceAPI: Codeunit "jdi TTS API Device";
                    JResponse: JsonObject;
                    Param: Dictionary of [Enum "jdi TTS Param GetDevices", Text];
                    GetDevicesParam: Enum "jdi TTS Param GetDevices";
                begin
                    Param.Add(GetDevicesParam::AuthToken, GetDefaultAPIKey());
                    Param.Add(GetDevicesParam::ApplicationID, ApplicationId);
                    if DeviceAPI.GetDevices(Cluster, APIVersion, Param, JResponse) then
                        ProcessJsonRespone(JResponse);
                end;
            }
        }
    }

    local procedure ProcessJsonRespone(JObject: JsonObject)
    var
        JDevicesToken: JsonToken;
        JDeviceToken: JsonToken;
        JDeviceObject: JsonObject;

        JIdsToken: JsonToken;
        JApplicationIdsToken: JsonToken;
        JIdToken: JsonToken;
        JCreatedatToken: JsonToken;
        JUpdatedatToken: JsonToken;
        JapplicationIdToken: JsonToken;
        JdeveuiToken: JsonToken;
        JjoineuiToken: JsonToken;

        deviceId: Code[50];
        applicationId: Code[50];
        deveui: Code[50];
        joineui: Code[50];
        createdat: DateTime;
        updatedat: DateTime;
    begin
        Rec.DeleteAll(false);

        JObject.Get('end_devices', JDevicesToken);

        foreach JDeviceToken in JDevicesToken.AsArray() do begin
            JDeviceObject := JDeviceToken.AsObject();

            if JDeviceObject.Get('created_at', JCreatedatToken) then
                createdat := JCreatedatToken.AsValue().AsDateTime();

            if JDeviceObject.Get('updated_at', JUpdatedatToken) then
                updatedat := JUpdatedatToken.AsValue().AsDateTime();

            if JDeviceObject.Get('ids', JIdsToken) then begin
                if JIdsToken.AsObject().Get('device_id', JIdToken) then
                    deviceId := JIdToken.AsValue().AsCode();

                if JIdsToken.AsObject().Get('dev_eui', JdeveuiToken) then
                    deveui := JdeveuiToken.AsValue().AsCode();

                if JIdsToken.AsObject().Get('join_eui', JjoineuiToken) then
                    joineui := JjoineuiToken.AsValue().AsCode();

                if JIdsToken.AsObject().Get('application_ids', JApplicationIdsToken) then
                    if JApplicationIdsToken.AsObject().Get('application_id', JapplicationIdToken) then
                        applicationId := JapplicationIdToken.AsValue().AsCode();
            end;



            CreateDevice(deviceId, applicationId, deveui, joineui, createdat, updatedat);
        end;
    end;

    local procedure CreateDevice(deviceId: Code[50]; applicationId: Code[50]; deveui: Code[50]; joineui: Code[50]; createdat: DateTime; updatedat: DateTime)
    begin
        Rec.Init();
        Rec.device_id := deviceId;
        Rec.application_id := applicationId;
        Rec.dev_eui := deveui;
        Rec.join_eui := joineui;
        Rec.created_at := createdat;
        Rec.updated_at := updatedat;
        Rec.Insert();
    end;

    local procedure GetDefaultAPIKey(): Text
    var
        TTSSDKDemoSetup: Record "jdi TTS Demo Setup";
    begin
        if TTSSDKDemoSetup.Get() then
            exit(TTSSDKDemoSetup.GetDefaultAPIKey());
    end;

    var

        ApplicationId: Text;
        Cluster: Enum "jdi TTS Cluster Address";
        APIVersion: Enum "jdi TTS API GetDevices";

}
