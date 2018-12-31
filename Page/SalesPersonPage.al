pageextension 50000 enablecommission extends "Sales & Receivables Setup"
{
    layout
    {
        addlast(General)
        {
            field("Enable Salesperson Commission"; "Enable Salesperson Commission")
            {

            }
        }
    }
}
pageextension 50001 SalespersonAction extends "Salesperson/Purchaser Card"
{
    layout
    {
        addlast(General)
        {
            field("Commission Amount"; "Commission Amount")
            {
                Editable = false;
                Style = StrongAccent;
            }
        }
    }
    actions
    {
        addlast(Creation)
        {

            Action(CommissionEntry)
            {
                Caption = 'Commission Entries';
                RunObject = page "Commission Ledger Entry";
                RunPageLink = "Salesperson Code" = field (Code);
                Image = OpportunitiesList;
            }


            Action(SalespersonCommission)
            {
                Caption = 'Commission Setup';
                RunObject = page "Salesperson Commission";
                RunPageLink = "Salesperson Code" = field (Code);
                Image = SetupLines;
            }
        }

    }
}

pageextension 50002 SalespersonListAction extends "Salespersons/Purchasers"
{
      layout
    {
        addlast(Control1)
        {
            field("Commission Amount"; "Commission Amount")
            {
                Editable = false;
                Style = StrongAccent;
            }
        }
    }
    actions
    {
        addlast(Creation)
        {

            Action(CommissionEntry)
            {
                Caption = 'Commission Entries';
                RunObject = page "Commission Ledger Entry";
                RunPageLink = "Salesperson Code" = field (Code);
                Image = OpportunitiesList;
            }


            Action(SalespersonCommission)
            {
                Caption = 'Commission Setup';
                RunObject = page "Salesperson Commission";
                RunPageLink = "Salesperson Code" = field (Code);
                Image = SetupLines;
            }
        }
    }
}
