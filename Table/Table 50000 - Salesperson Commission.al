table 50000 "Salesperson Commission"
{
    // version NC1.0


    fields
    {
        field(1;"Salesperson Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Salesperson/Purchaser".Code;
        }
        field(2;"From Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(3;"To Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Commission %";Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Salesperson Code")
        {
        }
    }

    fieldgroups
    {
    }
}

