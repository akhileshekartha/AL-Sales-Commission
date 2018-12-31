tableextension 50000 salessetup extends "Sales & Receivables Setup"
{
    fields
    {
        field(50000; "Enable Salesperson Commission"; boolean)
        {

        }
    }

}
tableextension 50001 SalesPerson extends "Salesperson/Purchaser"
{
    fields
    {
        field(50000; "Commission Amount"; Decimal)
        {
            FieldClass =FlowField;
            CalcFormula = sum("Commission Ledger Entry"."Commission Amount" where ("Salesperson Code"=field("Code")));

        } 
}

}
