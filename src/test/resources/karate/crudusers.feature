#Author: Adriana Dotor
#As a user, I inform that in this file basic practice scenarios were built

Feature: As a user, I need to make a crud

  Background:
    * url api.uri
    * configure driver = { type: 'classPath', encoding: 'utf-8', package: 'utils' }
    * def miClass = Java.type('utils.Data')
    * def miObjet = new miClass()
    * def miVariable = miObjet.numberRandom

  Scenario: Test GET 1
    Given path '/users?page=' + miVariable
    When method GET
    Then status 200
    * print response

  Scenario: Test GET 2
    Given path '/users/2'
    When method GET
    Then match response == {"data": {"id": 2,"email": "janet.weaver@reqres.in","first_name": "Janet","last_name": "Weaver","avatar": "https://reqres.in/img/faces/2-image.jpg"},"support": {"url": "https://reqres.in/#support-heading","text": "To keep ReqRes free, contributions towards server costs are appreciated!"}}
    * print response

  Scenario: Test GET 3
    Given path '/users/2'
    When method GET
    Then match responseType == 'json'
    * print response

  Scenario: Test GET 4
    Given path '/users/2'
    When method GET
    Then match $..first_name contains 'Janet'
    * print response

  Scenario: Test GET 5
    Given path '/users/2'
    When method GET
    Then match response.data[0].name == 'cerulean'
    * print response

  Scenario: Test POST
    Given path '/users'
    And request '{"name": "morpheus","job": "leader"}'
    When method POST
    Then status 201
    * print response

  Scenario: Test POST 2
    Given path '/users'
    And request '{"name": "morpheus","job": "leader"}'
    When method POST
    Then status 201
    And assert responseTime < 1000
    * print responseTime

  Scenario Outline: Test POST 3
    Given path '/users'
    And request '{"name": "<name>","job": "<job>"}'
    When method POST
    Then status 201
    * print response

    Examples:
      | name  | job        |
      | Juan  | Trabajador |
      | Pedro | Chef       |


  Scenario: Test DELETE
    Given path '/users/661'
    When method DELETE
    Then status 204
    * print response

  Scenario Outline: Test DELETE 2
    Given path '/users/<page>'
    When method DELETE
    Then status 204
    * print response

    Examples:
      | page |
      | 5    |
      | 6    |
      | 7    |

  Scenario: Test PUT
    Given path '/users/2'
    And request '{"name": "Dylan","job": "Ingeniero"}'
    When method PUT
    Then status 200
    * print response


  Scenario Outline: Test PUT 2
    Given path '/users/<page>'
    And request '{"name": "<name>","job": "<job>"}'
    When method PUT
    Then status 200
    * print response

    Examples:
      | page | name  | job       |
      | 4    | Juan  | Obrero    |
      | 3    | Pedro | Ingeniero |