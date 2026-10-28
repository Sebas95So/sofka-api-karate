
Feature: Pruebas API de Demoblaze

  Background:
    * url 'https://api.demoblaze.com'

  Scenario: Registrar un usuario nuevo
    * def usuario = 'qa_' + java.util.UUID.randomUUID().toString().replace('-', '')
    * def clave = 'Sofka123'
    * def body = { username: '#(usuario)', password: '#(clave)' }

    Given path 'signup'
    And request body
    When method post
    Then status 200
    * print 'Usuario registrado:', usuario
    * print 'Respuesta del registro:', response

  Scenario: Intentar registrar un usuario existente
    * def usuario = 'qa_duplicado_' + java.util.UUID.randomUUID().toString().replace('-', '')
    * def clave = 'Sofka123'
    * def body = { username: '#(usuario)', password: '#(clave)' }

    Given path 'signup'
    And request body
    When method post
    Then status 200

    Given path 'signup'
    And request body
    When method post
    Then status 200
    * match response.errorMessage == 'This user already exist.'
    * print 'Respuesta del registro duplicado:', response

  Scenario: Login con usuario y contraseña correctos
    * def usuario = 'qa_login_' + java.util.UUID.randomUUID().toString().replace('-', '')
    * def clave = 'Sofka123'
    * def bodyRegistro = { username: '#(usuario)', password: '#(clave)' }

    Given path 'signup'
    And request bodyRegistro
    When method post
    Then status 200

    * def bodyLogin = { username: '#(usuario)', password: '#(clave)' }

    Given path 'login'
    And request bodyLogin
    When method post
    Then status 200
    * match response contains 'Auth_token:'
    * print 'Respuesta del login correcto:', response

  Scenario: Login con contraseña incorrecta
    * def usuario = 'qa_login_error_' + java.util.UUID.randomUUID().toString().replace('-', '')
    * def clave = 'Sofka123'
    * def bodyRegistro = { username: '#(usuario)', password: '#(clave)' }

    Given path 'signup'
    And request bodyRegistro
    When method post
    Then status 200

    * def bodyLogin = { username: '#(usuario)', password: 'ClaveIncorrecta123' }

    Given path 'login'
    And request bodyLogin
    When method post
    Then status 200
    * match response.errorMessage == 'Wrong password.'
    * print 'Respuesta del login incorrecto:', response
