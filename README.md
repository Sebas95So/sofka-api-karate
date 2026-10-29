# Ejercicio 2 - Pruebas API con Karate

## Descripción

Proyecto de automatización de pruebas de servicios REST para las funcionalidades de registro (`signup`) e inicio de sesión (`login`) de Demoblaze.

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
| Registro (`signup`) | POST | `https://api.demoblaze.com/signup` |
| Inicio de sesión (`login`) | POST | `https://api.demoblaze.com/login` |

## Casos de prueba

1. Crear un usuario nuevo mediante `signup`.
2. Intentar registrar un usuario que ya existe.
3. Iniciar sesión con usuario y contraseña correctos.
4. Intentar iniciar sesión con una contraseña incorrecta.

Los escenarios utilizan nombres de usuario generados dinámicamente para reducir conflictos con registros anteriores.

## Requisitos previos

Antes de ejecutar el proyecto, instala:

- Java JDK 17.
- Apache Maven.
- Git.

Verifica que estén disponibles ejecutando estos comandos en una terminal:

```bash
java -version
mvn -version
git --version
```

## Cómo obtener y ejecutar el proyecto

### 1. Clonar el repositorio

```bash
git clone https://github.com/Sebas95So/sofka-api-karate.git
```

### 2. Entrar en la carpeta del proyecto

```bash
cd sofka-api-karate
```

### 3. Ejecutar las pruebas

```bash
mvn clean test
```

Maven descargará las dependencias necesarias y ejecutará los escenarios configurados en el proyecto. Se necesita conexión a internet para descargar dependencias y acceder a la API de Demoblaze.

### 4. Revisar el resultado

Al finalizar, revisa el resumen de Maven en la terminal. La ejecución correcta debe mostrar `BUILD SUCCESS` y no debe registrar fallos ni errores de pruebas.

Para abrir el reporte HTML de Karate, busca el siguiente archivo después de la ejecución:

```text
target/karate-reports/karate-summary.html
```

Puedes abrirlo con un navegador web. Si no se genera el reporte, revisa primero la salida de Maven para identificar errores de configuración o ejecución.

## Validaciones principales

- Se comprueba el código HTTP de las respuestas.
- Para el registro duplicado, se valida el mensaje `This user already exist.`.
- Para el inicio de sesión correcto, se comprueba que la respuesta contenga `Auth_token:`.
- Para el inicio de sesión con contraseña incorrecta, se valida el mensaje `Wrong password.`.

En los escenarios probados, Demoblaze respondió con HTTP 200 incluso cuando la respuesta indicaba un error de negocio. Por ello, también se valida el contenido de la respuesta y no únicamente el código HTTP.

## Archivos principales

- `pom.xml`: configuración de Maven y dependencias.
- `src/test/java/demoblaze.feature`: escenarios de prueba escritos con Karate.
- `src/test/java/DemoblazeTest.java`: clase de ejecución de las pruebas.
- `conclusiones.txt`: hallazgos y conclusiones del ejercicio.

## Notas

Los resultados pueden variar si cambia el comportamiento o la disponibilidad de la API de Demoblaze. Los usuarios se generan dinámicamente para reducir conflictos con registros anteriores.