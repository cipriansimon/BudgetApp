require 'watir'
require 'cucumber'
require 'rspec'
require 'selenium-webdriver'


Selenium::WebDriver::Chrome.driver_path="C:/Chromedriver/chromedriver.exe"

Given(/^a user goes to the Budget App$/) do
  @browser = Watir::Browser.new :chrome
  @browser.window.maximize
  @browser.goto "https://budgeting-a937b.firebaseapp.com/budget"
end

When(/^they input "([^"]*)" with description "([^"]*)" cost of "([^"]*)"$/) do |arg1, arg2, arg3|
  @browser.element(name: "categoryId").click
  @browser.option(:text, "#{arg1}").click
  @browser.text_field(name: "description").set "#{arg2}"
  @browser.text_field(name: "value").set "#{arg3}"
end


And(/^press Add$/) do
  @browser.button(type: "submit").click
end

And(/^sees the Total Inflow value$/) do
  @total_inflow_initial_value = @browser.element(:class => ['sG1fB _1yrus']).text.tr('$','').chomp('.00').tap{|s| s.delete!(',')}.to_i
  puts @total_inflow_initial_value
end

Then(/^budget app should add new record in the table with "([^"]*)" category$/) do |arg|
  new_category = @browser.table(:class => "opmhI")[7][1].text
  expected_category = "#{arg}"
  @browser.text.include?("#{arg}").should == true
  expect(expected_category).to eq(new_category)
  @browser.close
end

Then(/^the total inflow should increase by "([^"]*)"$/) do |arg|
  @total_inflow_final_value = @browser.element(:class => ['sG1fB _1yrus']).text.tr('$','').chomp('.00').tap{|s| s.delete!(',')}.to_i
  @final_value = @total_inflow_final_value - @total_inflow_initial_value
  @expected_value = "#{arg}".to_i
  expect(@final_value).to eq(@expected_value)
  @browser.close
end


Then(/^the Add button remains disabled$/) do
  puts is_button_disabled = @browser.button(type: "submit").disabled?
  expected_value = true
  expect(is_button_disabled).to eq(expected_value)
  @browser.close
end


Then(/^budget app should add new record in the table with "([^"]*)" category and "([^"]*)" description$/) do |arg1, arg2|
  @browser.text.include?("#{arg1}").should == true
  @browser  .text.include?("#{arg2}").should == true
  expected_description = @browser.table(:class => "opmhI")[7][1].text
  actual_description = "#{arg2}"
  expect(expected_description).to eq(actual_description)
  @browser.close
end


Then(/^the Working Balance bellow the table should display the balance in "([^"]*)" with a \- in front$/) do |arg|
  working_balance_value = @browser.element(:xpath => "//*[@id='root']/main/section/div/div/div[5]/div/div[1]").text
  working_balance_color = @browser.element(:xpath => "//*[@id='root']/main/section/div/div/div[5]/div/div[1]").style("color")
  color_compare = working_balance_color.eql?("#{arg}")
  expected_color = "#{arg}"
  expect(working_balance_color).to eq(expected_color)
  expect(working_balance_value).to include("-")
  @browser.close if @browser
end
