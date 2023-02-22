# utilizing karate-config file for url and other data (dynamic url)
@regression
Feature: config feature demo

  Background: 
    * url baseUrl
    * def request_headers = {Connection:'keep-alive', app-id:'63e34b4eaadca1cf796f0535',Content-Type:'application/json'}
    * headers request_headers

  @tag10 @regression
  Scenario: To read data from config file
    Given print name

  # nomral scenario  with headers and methods
  @tag11 @regression
  Scenario: To get list of all users
    Given path '/user'
    And param limit = 2
    * print baseUrl
    When method GET
    Then status 200
