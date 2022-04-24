table 52354 "jdi TTS Demo Storage"
{
    TableType = Temporary;

    fields
    {
        field(1; "received_at"; DateTime)
        {
            Editable = false;
        }
        field(2; "decoded_payload"; Text[250])
        {
            Editable = false;
        }
    }

    keys
    {
        key(PK; "received_at")
        {
            Clustered = true;
        }
    }
}