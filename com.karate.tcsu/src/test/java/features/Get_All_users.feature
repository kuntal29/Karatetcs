Feature: To get list of all users

  # nomral scenario  with varibale header
  @regression
  Scenario: To get list of all users
    * def request_header = {Connection:'keep-alive', app-id:'63e34b4eaadca1cf796f0535',Content-Type:'application/json'}
    Given headers request_header
    * print request_header
    When url 'https://dummyapi.io/data/v1/user?limit=1'
    When method GET
    Then status 200

  # Validation scenario  Full json  match
  @smoke @regression
  Scenario: To get list of all users
    * def request_header = {Connection:'keep-alive', app-id:'63e34b4eaadca1cf796f0535',Content-Type:'application/json'}
    Given headers request_header
    * print request_header
    When url 'https://dummyapi.io/data/v1/user?limit=5'
    When method GET
    Then status 200
    * match response ==
      """
      {
      "data": [
          {
              "id": "60d0fe4f5311236168a109ca",
              "title": "ms",
              "firstName": "Sara",
              "lastName": "Andersen",
              "picture": "https://randomuser.me/api/portraits/women/58.jpg"
          },
          {
              "id": "60d0fe4f5311236168a109cb",
              "title": "miss",
              "firstName": "Edita",
              "lastName": "Vestering",
              "picture": "https://randomuser.me/api/portraits/med/women/89.jpg"
          },
          {
              "id": "60d0fe4f5311236168a109cc",
              "title": "ms",
              "firstName": "Adina",
              "lastName": "Barbosa",
              "picture": "https://randomuser.me/api/portraits/med/women/28.jpg"
          },
          {
              "id": "60d0fe4f5311236168a109cd",
              "title": "mr",
              "firstName": "Roberto",
              "lastName": "Vega",
              "picture": "https://randomuser.me/api/portraits/med/men/25.jpg"
          },
          {
              "id": "60d0fe4f5311236168a109ce",
              "title": "mr",
              "firstName": "Rudi",
              "lastName": "Droste",
              "picture": "https://randomuser.me/api/portraits/med/men/83.jpg"
          }
      ],
      "total": 99,
      "page": 0,
      "limit": 5
      }
      """

  # validation scenario  Full response match through json output file
  @tag4 @regression
  Scenario: To get list of all users
    * def request_header = {Connection:'keep-alive', app-id:'63e34b4eaadca1cf796f0535',Content-Type:'application/json'}
    * def expectedJson = read('classpath:src/test/resources/karatedata/output/Get_list_all_user_output.json')
    Given headers request_header
    * print request_header
    When url 'https://dummyapi.io/data/v1/user?limit=5'
    When method GET
    Then status 200
    * match response == expectedJson
