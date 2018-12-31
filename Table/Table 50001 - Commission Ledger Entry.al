table 50001 "Commission Ledger Entry"
{
    // version NC1.0
DrillDownPageId = 50001;
LookupPageId  = 50001;

    fields
    {
        field(1; "Entry No"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Salesperson Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Document No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Posting Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Document Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Commission %"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Commission Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Created Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "User id"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Entry No")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert();
    begin
        lvRecCommissionLedgerEntry.RESET;
        if lvRecCommissionLedgerEntry.FINDLAST then
            "Entry No" := lvRecCommissionLedgerEntry."Entry No" + 1
        else
            "Entry No" := 1;
    end;

    var
        lvRecCommissionLedgerEntry: Record "Commission Ledger Entry";
}

