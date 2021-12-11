page 50260 "jdi TTS Demo Storage List"
{

    ApplicationArea = All;
    Caption = 'TTS Demo Storage';
    PageType = List;
    SourceTable = "jdi TTS Demo Storage";
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
                field(DeviceId; DeviceId)
                {
                    Caption = 'DeviceId';
                    ApplicationArea = all;
                }
                field(Type; ActionType)
                {
                    Caption = 'Type';
                    ApplicationArea = All;
                }

            }
            repeater(General)
            {
                field("received_at"; Rec.received_at)
                {
                    ApplicationArea = All;
                }
                field("decoded_payload"; Rec."decoded_payload")
                {
                    ApplicationArea = all;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(GetStorage)
            {
                Caption = 'Load Storage';
                ApplicationArea = All;
                Image = Download;

                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                Scope = Page;

                trigger OnAction()
                var
                    StorageAPI: Codeunit "jdi TTS API Storage";
                    JResponse: JsonObject;
                    Param: Dictionary of [Enum "jdi TTS Param GetStoredAppUp", Text];
                    GetGatewaysParam: Enum "jdi TTS Param GetStoredAppUp";
                begin
                    Param.Add(GetGatewaysParam::AuthToken, GetDefaultAPIKey());
                    Param.Add(GetGatewaysParam::application_ids, ApplicationId);
                    Param.Add(GetGatewaysParam::end_device_ids, DeviceId);
                    Param.Add(GetGatewaysParam::type, ActionType);

                    if StorageAPI.GetStoredApplicationUp(Cluster, APIVersion, Param, JResponse) then
                        ProcessJsonRespone(JResponse);
                end;
            }
        }
    }

    local procedure ProcessJsonRespone(JObject: JsonObject)
    var
        JStoragesToken: JsonToken;
        JStorageToken: JsonToken;
        JStorageObject: JsonObject;
        JResultJObject: JsonObject;


        JResultToken: JsonToken;
        JdecodedpayloadToken: JsonToken;

        JRecieveddateToken: JsonToken;
        JUplinkMessageToken: JsonToken;


        recievedat: DateTime;
        decodedpayload: Text;
    begin
        Rec.DeleteAll(false);

        JObject.Get('results', JStoragesToken);

        foreach JStorageToken in JStoragesToken.AsArray() do begin
            JStorageObject := JStorageToken.AsObject();

            if JStorageObject.Get('result', JResultToken) then begin
                JResultJObject := JResultToken.AsObject();

                if JResultJObject.Get('received_at', JRecieveddateToken) then
                    Evaluate(recievedat, JRecieveddateToken.AsValue().AsText());

                if JResultJObject.Get(ActionType, JUplinkMessageToken) then
                    if JUplinkMessageToken.AsObject().Get('decoded_payload', JdecodedpayloadToken) then
                        JdecodedpayloadToken.AsObject().WriteTo(decodedpayload);

                CreateStorage(recievedat, decodedpayload);
            end;
        end;
    end;

    local procedure CreateStorage(RecievedAt: DateTime; DecodedPayload: Text)
    begin
        Rec.Init();
        Rec.received_at := RecievedAt;
        Rec.decoded_payload := DecodedPayload;
        Rec.Insert();
    end;

    local procedure GetDefaultAPIKey(): Text
    var
        TTSSDKDemoSetup: Record "jdi TTS Demo Setup";
    begin
        if TTSSDKDemoSetup.Get() then
            exit(TTSSDKDemoSetup.GetDefaultAPIKey());
    end;

    procedure SetApplicationId(_applicationId: Text)
    begin
        ApplicationId := _applicationId;
    end;

    procedure SetDeviceId(_deviceId: Text)
    begin
        DeviceId := _deviceId;
    end;

    trigger OnInit()
    begin
        ActionType := 'uplink_message';
    end;

    var
        ApplicationId: Text[50];
        DeviceId: Text[50];
        ActionType: Text;

        Cluster: Enum "jdi TTS Cluster Address";
        APIVersion: Enum "jdi TTS API GetStoredAppUp";

}
