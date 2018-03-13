#Project Title
Budgeting assignment resolution automation testing - My first contact with ruby
Budget Sample app is a basic bugeting application designed to have a better track of one's expense and incomes. It comes with a reporting tool.

## Prerequisites
[testing was conducted on the live demo](https://budgeting-a937b.firebaseapp.com/).
[Test plan for the applications can be found here](TestPlan/Test_Plan_Budge_Sample_Application.doc)
Clone (enter_link_here) project. The testing part is in the e2e folder of the application. 

### Installing

gem install cucumber
gem install watir
gem install watir-webdriver
gem install rspec
bundler install (from rubymine indea)
modify line: Selenium::WebDriver::Chrome.driver_path="C:/Chromedriver/chromedriver.exe" in budgetApp_add.rb file with the location of the chrome driver on the computer


## Running the tests
Go to the root of the test project (the e2e folder) and type:
cucumber
To have a basic report, go to: 
cd /e2e/features
cucumber BudgetApp_Add.feature --format html --out report.html --format pretty
The report is available in the same location

The test can also be ran from rubymine or any other idea, by running the BudgetApp_add.features file
Test are using cucumber for BDD so the features file is easy to read by the business team

### Break down into end to end tests
The automation tests test scenarios described in the test plan. 
The scenarios were chosen by the qa (me:) ) randomly, by following the requirements in the qa-automation-assignment.md file
Test were conducted only on the 'Budge' page, the 'Reports' are in plann to be tested at a future date.
The tests cover the main functionality, addition of income/expense, validation on different fields and contain a failling test, that is detailed in the test plan.
For ease of acces I am adding the scenario that is covered by the automation tests and is failling here: 

 "Given a user goes to the Budget App, when the calculator is displayed and TI<TO, then the WB field contains the correct extraction of TI – TO and is displayed in red with a '-'"
 
 
## Built With
cucumber v.3.1.0
ruby 2.5.0p0 (2017-12-25 revision 61468) [x64-mingw32]
watir 6.10.3
RubyMine #RM-173.4548.40, trial version

## Author
Ciprian Simon
 
 




