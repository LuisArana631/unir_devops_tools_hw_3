# Configuración del Entorno

Para ejecutar correctamente el backend de esta aplicación, es necesario realizar una serie de configuraciones previas relacionadas con las variables de entorno y las dependencias necesarias.

## Pasos para Configurar el Entorno

### 1. Crear un Archivo de Variables de Entorno

Primero, debes crear un archivo .env en la raíz del proyecto. Este archivo debe contener las siguientes variables de entorno necesarias para la configuración de la base de datos y el puerto del servidor:

```plaintext
DB_CNN=mongodb://localhost:27017/devops_unir
PORT=3000
```

Asegúrate de que los valores asignados a estas variables sean correctos y correspondan a tu entorno de desarrollo local o producción.

### 2. Instalar las Dependencias del Proyecto

Para instalar las dependencias del proyecto, ejecuta el siguiente comando en la raíz del proyecto:

```bash
npm install
```

Este comando instalará todas las dependencias necesarias para ejecutar el backend de la aplicación.

### 3. Ejecutar el Servidor

Una vez que hayas configurado las variables de entorno y las dependencias del proyecto, puedes ejecutar el servidor usando el siguiente comando:

```bash
npm run start
```

Este comando iniciará el servidor en el puerto especificado en el archivo .env y establecerá la conexión con la base de datos MongoDB.

### 4. Ejemplos de peticiones

Para probar el funcionamiento del servidor, puedes realizar peticiones HTTP a las siguientes rutas:

#### Obtener datos

```plaintext
curl -X GET http://localhost:3000/api/tasks
```

#### Crear un nuevo dato

```plaintext
curl -X POST http://localhost:3000/api/tasks -H "Content-Type: application/json" -d '{"title":"Nueva Tarea", "description":"Descripción de la nueva tarea"}'
```

#### Actualizar un dato existente

```plaintext
curl -X PUT http://localhost:3000/api/tasks/1 -H "Content-Type: application/json" -d '{"title":"Nueva Tarea Mod", "description":"Descripción de la nueva tarea"}'
```

#### Eliminar un dato existente

```plaintext
curl -X DELETE http://localhost:3000/api/tasks/1
```