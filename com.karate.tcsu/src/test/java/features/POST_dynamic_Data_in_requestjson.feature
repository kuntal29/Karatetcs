# REading dynamic data from request json file and using in post request
@regression
Feature: to create users in post request using dyanamic ways

  #Background:
  #* def now = function(){ return java.lang.System.currentTimeMillis() }
  #* def randomString = function(){ return RandomStringUtils.randomAlphanumeric(17).toUpperCase() }
  #* def name = 'Test' + now()
  # * print randomString
  #* request { name: '#(name)' }
  @test @regression
  Scenario: by reading dynamic request body from json file way 1
    * def now = function(){ return java.lang.System.currentTimeMillis() }
    * def name = 'Test' + now()
    * print name
    Given url 'https://reqres.in/api/users'
    And request { name: '#(name)', job:"QA" }
    When method POST
    Then status 201
    * print response
    Then match response.name == name
    Then match response.job == "QA"

  @test @regression
  Scenario: by reading dynamic request body from json file way 2
    Given url 'https://reqres.in/api/users'
    * def getDate = function(){ return java.lang.System.nanoTime() }
    * def time = getDate()
    * def randomString = 'user' + time + '_Test'
    * print userName
    And request { name: '#(randomString)', job:"QA" }
    When method POST
    Then status 201
    * print response
    Then match response.name == randomString
    Then match response.job == "QA"

  @test @regression
  Scenario: by reading dynamic request body from json file way 3
    Given url 'https://reqres.in/api/users'
    * def CommonUtility = Java.type('utilities.CommonUtility')
    * def date = CommonUtility.getDate()
    * def time = CommonUtility.getTime()
    * def userName = 'user' + date + time
    * print userName
    And request { name: '#(userName)', job:"QA" }
    When method POST
    Then status 201
    * print response
    Then match response.name == userName
    Then match response.job == "QA"
