table 50254 "jdi TTS Demo Device"
{
    TableType = Temporary;

    fields
    {
        field(1; "device_id"; Code[50])
        {
            Editable = false;
        }
        field(2; "application_id"; Code[50])
        {
            Editable = false;
        }
        field(3; "dev_eui"; Code[50])
        {
            Editable = false;
        }
        field(4; "join_eui"; Code[50])
        {
            Editable = false;
        }
        field(5; "created_at"; DateTime)
        {
            Editable = false;
        }
        field(6; "updated_at"; DateTime)
        {
            Editable = false;
        }
    }

    keys
    {
        key(PK; "device_id")
        {
            Clustered = true;
        }
    }
}