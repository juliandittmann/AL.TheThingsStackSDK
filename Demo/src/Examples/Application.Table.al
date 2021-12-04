table 50252 "jdi TTS Demo Application"
{
    DataClassification = CustomerContent;
    TableType = Temporary;

    fields
    {
        field(1; "application_id"; Code[50])
        {
            DataClassification = CustomerContent;
            Editable = false;
        }

        field(2; "created_at"; DateTime)
        {
            Editable = false;
        }
        field(3; "updated_at"; DateTime)
        {
            Editable = false;
        }

    }

    keys
    {
        key(PK; application_id)
        {
            Clustered = true;
        }
    }
}