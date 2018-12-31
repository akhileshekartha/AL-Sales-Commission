codeunit 50000 "Update Commission"
{
    // version NC1.0


    trigger OnRun();
    begin
    end;

    [EventSubscriber(ObjectType::Codeunit, 80, 'OnBeforePostCustomerEntry', '', false, false)]
    local procedure fUpdateCommission(var GenJnlLine : Record "Gen. Journal Line";SalesHeader : Record "Sales Header";var TotalSalesLine : Record "Sales Line";var TotalSalesLineLCY : Record "Sales Line");
    var
        lvRecSalesSetup : Record "Sales & Receivables Setup";
        lvRecCommissionEntry : Record "Commission Ledger Entry";
        lvRecSalesCommission : Record "Salesperson Commission";
    begin
        if not SalesHeader.Invoice then
          exit;

        lvRecSalesSetup.GET;
        if not lvRecSalesSetup."Enable Salesperson Commission" then
          exit;

        lvRecSalesCommission.RESET;
        lvRecSalesCommission.SETRANGE("Salesperson Code",SalesHeader."Salesperson Code");
        lvRecSalesCommission.SETFILTER("From Date",'<=%1',SalesHeader."Posting Date");
        lvRecSalesCommission.SETFILTER("To Date",'>=%1',SalesHeader."Posting Date");
        if lvRecSalesCommission.FINDSET then repeat
          if SalesHeader."Posting Date" in [ lvRecSalesCommission."From Date" .. lvRecSalesCommission."To Date" ] then begin
            lvRecCommissionEntry.INIT;
            lvRecCommissionEntry."Salesperson Code"  := SalesHeader."Salesperson Code";
            lvRecCommissionEntry."Document No."      := GenJnlLine."Document No.";
            lvRecCommissionEntry."Posting Date"      := SalesHeader."Posting Date";
            lvRecCommissionEntry."Document Date"     := SalesHeader."Document Date";
            lvRecCommissionEntry.Description         := GenJnlLine.Description;
            lvRecCommissionEntry."Document Amount"   := GenJnlLine.Amount;
            lvRecCommissionEntry."Commission %"      := lvRecSalesCommission."Commission %";
            lvRecCommissionEntry."Commission Amount" := (GenJnlLine.Amount * lvRecSalesCommission."Commission %" )/100;
            lvRecCommissionEntry."Created Date"      := TODAY;
            lvRecCommissionEntry."User id"           := USERID;
            lvRecCommissionEntry.INSERT(true);
          end;
        until lvRecSalesCommission.NEXT = 0
    end;
}

