page 50258 "jdi TTS Demo Gateway List"
{

    ApplicationArea = All;
    Caption = 'TTS Demo Gateways';
    PageType = List;
    SourceTable = "jdi TTS Demo Gateway";
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
            }
            repeater(General)
            {
                Caption = 'Gateways';
                field("application_id"; Rec.gateway_id)
                {
                    ApplicationArea = All;
                }
                field(eui; Rec."eui")
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
            action(GetGateways)
            {
                Caption = 'Load Gateways';
                ApplicationArea = All;
                Image = Refresh;

                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                Scope = Page;

                trigger OnAction()
                var
                    GatewayAPI: Codeunit "jdi TTS API Gateway";
                    JResponse: JsonObject;
                    Param: Dictionary of [Enum "jdi TTS Param GetGateways", Text];
                    GetGatewaysParam: Enum "jdi TTS Param GetGateways";
                begin
                    Param.Add(GetGatewaysParam::AuthToken, GetDefaultAPIKey());
                    if GatewayAPI.GetGateways(Cluster, APIVersion, Param, JResponse) then
                        ProcessJsonRespone(JResponse);
                end;
            }
        }
    }

    local procedure ProcessJsonRespone(JObject: JsonObject)
    var
        JGatewaysToken: JsonToken;
        JGatewayToken: JsonToken;
        JGatewayObject: JsonObject;

        JIdsToken: JsonToken;
        JIdToken: JsonToken;
        JCreatedatToken: JsonToken;
        JUpdatedatToken: JsonToken;
        Jeu1Token: JsonToken;

        gatewayId: Text[50];
        eui: Text[50];
        createdat: DateTime;
        updatedat: DateTime;
    begin
        Rec.DeleteAll(false);

        JObject.Get('gateways', JGatewaysToken);

        foreach JGatewayToken in JGatewaysToken.AsArray() do begin
            JGatewayObject := JGatewayToken.AsObject();

            if JGatewayObject.Get('created_at', JCreatedatToken) then
                createdat := JCreatedatToken.AsValue().AsDateTime();

            if JGatewayObject.Get('updated_at', JUpdatedatToken) then
                updatedat := JUpdatedatToken.AsValue().AsDateTime();

            if JGatewayObject.Get('ids', JIdsToken) then begin
                if JIdsToken.AsObject().Get('gateway_id', JIdToken) then
                    gatewayId := JIdToken.AsValue().AsText();

                if JIdsToken.AsObject().Get('eui', Jeu1Token) then
                    eui := JIdToken.AsValue().AsText();
            end;

            CreateGateway(gatewayId, eui, createdat, updatedat);
        end;
    end;

    local procedure CreateGateway(gatewayId: Text[50]; eui: Text[50]; createdat: DateTime; updatedat: DateTime)
    begin
        Rec.Init();
        Rec.gateway_id := gatewayId;
        Rec.eui := eui;
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
        Cluster: Enum "jdi TTS Cluster Address";
        APIVersion: Enum "jdi TTS API GetGateways";

}
