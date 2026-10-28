cat > README.md <<'EOF'
# Ejercicio 2 - Pruebas API con Karate

## Descripción

Proyecto de automatización de pruebas de servicios REST para la funcionalidad de registro (signup) e inicio de sesión (login) de Demoblaze.

Sitio web: https://www.demoblaze.com/

## Tecnologías utilizadas

- Java 17
- Karate 1.5.1
- JUnit 5
- Apache Maven
- Git y GitHub

## Endpoints probados

| Servicio | Método | Endpoint |
|---|---|---|
| Registro (signup) | POST | https://api.demoblaze.com/signup |
| Inicio de sesión (login) | POST | https://api.demoblaze.com/login |

## Casos de prueba

1. Crear un usuario nuevo mediante signup.
2. Intentar registrar un usuario que ya existe.
3. Iniciar sesión con usuario y contraseña correctos.
4. Intentar iniciar sesión con una contraseña incorrecta.

Los escenarios utilizan nombres de usuario generados dinámicamente para reducir conflictos con registros anteriores.

## Requisitos previos

- Java JDK 17.
- Apache Maven.
- Git.

Verificar las instalaciones:

```bash
java -version
mvn -version
git --version