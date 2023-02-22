# Creation of user using post and multiple validation using match keyword
Feature: Individual assertion and match in post request

  Background: 
    * url 'https://api.instantwebtools.net'
    * def reqPayload = read('classpath:src/test/resources/karatedata/input/reqLoad.json')
        
  @tag7 @regression
  Scenario: Individual assertion and match in post request
    Given path '/v1/passenger'
    * print reqPayload
    And request reqPayload
    When method POST
    Then status 200
    * print response
    Then match response._id == '#present'
    And match response.name == "John Doe"
    And match response $.trips == 250
    # And match response $ == { name: "John Doe"}
    # And match response == { name: "John Doe"}
   # And match response $ == { _id: "#present"}

   