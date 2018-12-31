page 50000 "Salesperson Commission"
{
    // version NC1.0

    PageType = List;
    SourceTable = "Salesperson Commission";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Salesperson Code";"Salesperson Code")
                {
                }
                field("From Date";"From Date")
                {
                }
                field("To Date";"To Date")
                {
                }
                field("Commission %";"Commission %")
                {
                }
            }
        }
    }

    actions
    {
    }
}

