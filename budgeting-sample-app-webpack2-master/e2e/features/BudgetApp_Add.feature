Feature: Budget App Add Functionality


Scenario: Users can add a specific cost on the Budget App
  Given a user goes to the Budget App
  When they input "Travel" with description "Summer vacation" cost of "2000"
  And press Add
  Then budget app should add new record in the table with "Summer vacation" category

Scenario: User cannot add expense if the value field has letters entered
  Given a user goes to the Budget App
  When they input "Taxes" with description "tax time" cost of "10041e"
  Then the Add button remains disabled

Scenario: User can add a specific cost/income on the Budget App without a description
  Given a user goes to the Budget App
  When they input "Misc" with description "" cost of "34"
  And press Add
  Then budget app should add new record in the table with "Misc" category and "" description

Scenario: User sees the total inflow increase with the correct amount when adding an income
  Given a user goes to the Budget App
  And sees the Total Inflow value
  When they input "Income" with description "some extra income" cost of "5000"
  And press Add
  Then the total inflow should increase by "5000"

#failling scenario-the value in the Working Balance remains in green even when it should be displayed in red because the expense are larger than the incomes
Scenario: If the Total Outflow is greater than the Total Inflow, the Working Balance should be displayed in red with a '-' in front
  Given a user goes to the Budget App
  When they input "Health" with description "operation" cost of "10000"
  And press Add
  Then the Working Balance bellow the table should display the balance in "rgb(235, 42, 42)" with a - in front


