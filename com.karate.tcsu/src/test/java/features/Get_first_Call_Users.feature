Feature: To get list of all users

  # nomral scenario  with headers and methods
  @regression
  Scenario: To get list of all users
    * def request_header = {Connection:'keep-alive', app-id:'63e34b4eaadca1cf796f0535',Content-Type:'application/json'}
    Given headers request_header
    * print request_header
    When url 'https://dummyapi.io/data/v1/user?limit=1'
    When method GET
    Then status 200
