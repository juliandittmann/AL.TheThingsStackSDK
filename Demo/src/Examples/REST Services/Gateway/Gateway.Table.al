table 50253 "jdi TTS Demo Gateway"
{
    TableType = Temporary;

    fields
    {
        field(1; "gateway_id"; Text[50])
        {
            Editable = false;
        }
        field(2; eui; Text[50])
        {
            Editable = false;
        }
        field(3; "created_at"; DateTime)
        {
            Editable = false;
        }
        field(4; "updated_at"; DateTime)
        {
            Editable = false;
        }
    }

    keys
    {
        key(PK; "gateway_id")
        {
            Clustered = true;
        }
    }
}