page 50252 "jdi TTS Demo GetApplications"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'The Things Stack Demo Application (Manual)';
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

            action(TestGetApplications)
            {
                ApplicationArea = All;
                Image = TestFile;
                ToolTip = 'TestGetApplications';

                trigger OnAction()
                var
                    ApplicationAPI: Codeunit "jdi TTS API Application";
                    JResponse: JsonObject;
                    HttpResponse: HttpResponseMessage;

                    Cluster: Enum "jdi TTS Cluster Address";
                    APIVerion: Enum "jdi TTS API GetApplications";
                    Param: Dictionary of [Enum "jdi TTS Param GetApplications", Text];
                    GetApplicationsParam: Enum "jdi TTS Param GetApplications";
                begin
                    Cluster := Cluster::eu1;
                    APIVerion := APIVerion::v3;

                    Clear(Param);
                    Param.Add(GetApplicationsParam::"key", GetKey());

                    ApplicationAPI.GetApplications(Cluster, APIVerion, Param, JResponse);
                    ApplicationAPI.GetApplications(Cluster, APIVerion, Param, HttpResponse);
                end;
            }

        }
    }

    local procedure GetKey(): Text
    begin
        exit('');
    end;
}