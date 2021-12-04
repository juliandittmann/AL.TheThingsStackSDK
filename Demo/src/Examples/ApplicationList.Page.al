page 50257 "jdi TTS Demo Application List"
{

    ApplicationArea = All;
    Caption = 'TTS Demo Applications';
    PageType = List;
    SourceTable = "jdi TTS Demo Application";
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
                Caption = 'Applications';
                field("application_id"; Rec.application_id)
                {
                    ApplicationArea = All;
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
                Caption = 'Load applications';
                ApplicationArea = All;
                Image = MoveDown;

                trigger OnAction()
                var
                    ApplicationAPI: Codeunit "jdi TTS API Application";
                    JResponse: JsonObject;
                    Param: Dictionary of [Enum "jdi TTS Param GetApplications", Text];
                    GetApplicationsParam: Enum "jdi TTS Param GetApplications";
                begin
                    Param.Add(GetApplicationsParam::AuthToken, GetDefaultAPIKey());
                    if ApplicationAPI.GetApplications(Cluster, APIVersion, Param, JResponse) then
                        ProcessJsonRespone(JResponse);
                end;
            }
        }
    }

    local procedure ProcessJsonRespone(JObject: JsonObject)
    var
        JApplicationsToken: JsonToken;
        JApplicationToken: JsonToken;
        JApplicationObject: JsonObject;

        JIdsToken: JsonToken;
        JIdToken: JsonToken;
        JCreatedatToken: JsonToken;
        JUpdatedatToken: JsonToken;

        applicationId: Code[50];
        createdat: DateTime;
        updatedat: DateTime;
    begin
        Rec.DeleteAll(false);

        JObject.Get('applications', JApplicationsToken);

        foreach JApplicationToken in JApplicationsToken.AsArray() do begin
            JApplicationObject := JApplicationToken.AsObject();

            if JApplicationObject.Get('created_at', JCreatedatToken) then
                createdat := JCreatedatToken.AsValue().AsDateTime();

            if JApplicationObject.Get('updated_at', JUpdatedatToken) then
                updatedat := JUpdatedatToken.AsValue().AsDateTime();

            if JApplicationObject.Get('ids', JIdsToken) then
                if JIdsToken.AsObject().Get('application_id', JIdToken) then
                    applicationId := JIdToken.AsValue().AsCode();

            CreateApplication(applicationId, createdat, updatedat);
        end;

    end;

    local procedure CreateApplication(applicationId: Code[50]; createdat: DateTime; updatedat: DateTime)
    begin
        Rec.Init();
        Rec.application_id := applicationId;
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
        APIVersion: Enum "jdi TTS API GetApplications";

}
