
# Creation of user using post and multiple validation using match keyword and reading request json form inut folder
@regression
Feature: To validate the creation of user using post

  @tag2 @regression
  Scenario: to create user by post
    Given url 'https://reqres.in/api/users'
    And request {name:'john', job:'qalead'}
    When method POST
    Then status 201
   
   @tag5 @regression
   Scenario: by reading request body from json file
   * def reqBody = read('classpath:src/test/resources/karatedata/input/RequestbodyforCreateuser.json')
    Given url 'https://reqres.in/api/users'
    And request reqBody
    When method POST
    Then status 201
    * print response 
    Then match response.name == "Raj"
    Then match response.job == "Lead"
    
   @tag6 @regression
   Scenario: by reading dynamic data and valdating with dyamic input
   * def reqBody = read('classpath:src/test/resources/karatedata/input/RequestbodyforCreateuser.json')
    Given url 'https://reqres.in/api/users'
    And request reqBody
    When method POST
    Then status 201
    * print response 
    Then match response.name == "Raj"
    And match response.job == "Lead"