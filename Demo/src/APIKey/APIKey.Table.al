table 52350 "jdi TTS Demo API Key"
{
    DataClassification = AccountData;
    LookupPageId = "jdi TTS Demo API Key List";
    Access = Internal;

    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = CustomerContent;
        }

        field(2; Description; Text[50])
        {
            DataClassification = CustomerContent;
        }


        field(3; "API Key"; Guid)
        {
            DataClassification = EndUserPseudonymousIdentifiers;
        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    trigger OnDelete()
    begin
        RemoveAPIKey();
    end;


    [NonDebuggable]
    procedure SetAPIKey(NewAPIKey: Text)
    begin
        if IsNullGuid("API Key") then
            "API Key" := CreateGuid();

        if not EncryptionEnabled() then
            IsolatedStorage.Set(CopyStr("API Key", 1, 200), NewAPIKey, DataScope::Module)
        else
            IsolatedStorage.SetEncrypted(CopyStr("API Key", 1, 200), NewAPIKey, DataScope::Module);
    end;

    [NonDebuggable]
    procedure GetAPIKey(): Text
    var
        APIKey: Text;
    begin
        if not IsNullGuid("API Key") and IsolatedStorage.Get("API Key", DataScope::Module, APIKey) then
            exit(APIKey);
    end;

    [NonDebuggable]
    procedure HasAPIKey(): Boolean
    begin
        exit(GetAPIKey() <> '');
    end;

    [NonDebuggable]
    procedure RemoveAPIKey()
    begin
        if not IsNullGuid("API Key") then
            IsolatedStorage.Delete("API Key", DataScope::Module);

        Clear("API Key");
    end;


}