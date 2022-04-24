table 52355 "jdi TTS Demo Application"
{
    DataClassification = CustomerContent;
    TableType = Temporary;

    fields
    {
        field(1; "application_id"; Text[50])
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