# Stocks
Simple Stocks App

Overview 

**Stocks App**

A stocks app that shows a list of stock symbols and prices for a set of stocks parsed from JSON endpoints. The App
1. Handles loading, error and empty states
2. Displays the returned information in a list 

Dev Data
1. Successfull API Call: https://storage.googleapis.com/cash-homework/cash-stocks-api/portfolio.json
2. Successfull API Call with malformed data (should show error): https://storage.googleapis.com/cash-homework/cash-stocks-api/portfolio_malformed.json
3. Successfull API Call with empty data: https://storage.googleapis.com/cash-homework/cash-stocks-api/portfolio_empty.json

User Story
**Load Stocks Feed **
Load and shows a list of stock symbols and prices for a set of stocks parsed from JSON endpoints

**Acceptance Criteria **
AC1: Feed shows loading indicator when the feed API call starts  
Given that as user I have opened the app
Then I should see a loading indicator as the feed loads 

AC2: Feed hides loading indicator when the feed API call succeeds 
Given that as user I have opened the app and the feed is loading 
When when the feed API call suceeds 
Then the loading indicator disapears

AC3: Feed hides loading indicator when the feed API call fails 
Given that as user I have opened the app and the feed is loading 
When when the feed API call fails
Then the loading indicator disapears

AC4: Feed is visible to user when the feed API call succeeds and returns usable data 
Given that as user I have opened the app and the feed is loading 
When when the feed API call suceeds and returns usable data 
Then the loading indicator disapears
And the a list of stocks is visible to the user

AC4: Feed empty state is visible to the user when the feed API call succeeds and returns empty no data  
Given that as user I have opened the app and the feed is loading 
When when the feed API call suceeds but returns no usable data 
Then the loading indicator disapears
And the empty feed state is visible to the user

AC4: Error alert is shown when the load feed API call fails 
Given that as user I have opened the app and the feed is loading 
When when the feed API call fails 
Then the loading indicator disapears
And the an error alert is shown
