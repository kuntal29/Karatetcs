#  Using background for baseurl from karate config and read json output for validation
@regression
Feature: To get list of all users by URL set in background header and url

  Background: 
    * url baseUrl
    * def request_headers = {Connection:'keep-alive', app-id:'63e34b4eaadca1cf796f0535',Content-Type:'application/json'}

  @tag01 @smoke @regression
  Scenario: To validate list of all users by background header and url
    * def expectedjson = read('classpath:src/test/resources/karatedata/output/Get_list_all_user_output.json')
    Given headers request_headers
    * print request_headers
    And path '/user'
    And param limit = 2
    When method GET
    Then status 200
    * match response == expectedjson
