# validation through output.json file
Feature: To get list of all users by reading expected output json file

  @smoke @regression
  Scenario: To get list of all users by reading json file - read function
    * def request_header = {Connection:'keep-alive', app-id:'63e34b4eaadca1cf796f0535',Content-Type:'application/json'}
    * def expectedjson = read('classpath:src/test/resources/karatedata/input/Get_list_all_users.json')
    Given headers request_header
    When url 'https://dummyapi.io/data/v1/user?limit=5'
    When method GET
    Then status 200
    * match response == expectedjson