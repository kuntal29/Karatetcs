@regression
Feature: to use bearer tokem in get list of users

# To pass any token value in header authorization using karate config (access token in karate config)
  Background: 
    * url  baseUrl2
    # not working * def accessToken ={Authorization: 'Bearer c32ea72185d02a78f0002c095ae6f4dbd33fec70c0bb3b58d082e340986a76fa'
    * print baseUrl2
    * print accessToken

  @tag12 @regression
  Scenario: to use bearer tokem in get list of users
    Given header Authorization = 'Bearer '+ accessToken
    And path '/users'
    When method GET
    Then status 200
