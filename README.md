# Actividad 3
# MEAN Stack Application

Este proyecto es una aplicación CRUD (Crear, Leer, Actualizar, Eliminar) desarrollada utilizando el stack MEAN (MongoDB, Express, Angular, Node.js). La aplicación permite gestionar tareas a través de una interfaz web.

## Estructura del Proyecto

El proyecto está dividido en tres partes principales:

1. **Backend**: Implementado con Node.js y Express, maneja las operaciones CRUD y la conexión a la base de datos MongoDB.
2. **Frontend**: Desarrollado con Angular, proporciona la interfaz de usuario para interactuar con la aplicación.
3. **Terraform**: Utilizado para la infraestructura como código, permite desplegar la base de datos MongoDB en AWS.

## Backend

El backend se encuentra en el directorio `mean-js/backend` y está compuesto por los siguientes archivos y directorios:

- `index.js`: Archivo principal que configura y arranca el servidor Express.
- `database.js`: Configuración de la conexión a la base de datos MongoDB utilizando Mongoose.
- `models/task.js`: Modelo de datos para las tareas.
- `routes/task.routes.js`: Rutas para las operaciones CRUD de las tareas.
- `package.json`: Archivo de configuración de npm con las dependencias y scripts del proyecto.

### Configuración del Entorno

Para ejecutar el backend, sigue estos pasos:

1. Crea un archivo `.env` en la raíz del proyecto con las siguientes variables de entorno:

    ```plaintext
    DB_CNN=mongodb://localhost:27017/devops_unir
    PORT=3000
    ```

2. Instala las dependencias del proyecto:

    ```bash
    npm install
    ```

3. Inicia el servidor:

    ```bash
    npm run start
    ```

El servidor estará disponible en [http://localhost:3000](http://_vscodecontentref_/0).

## Frontend

El frontend se encuentra en el directorio [frontend](http://_vscodecontentref_/1) y está compuesto por los siguientes archivos y directorios:

- `src/app`: Contiene los componentes y servicios de Angular.
- [index.html](http://_vscodecontentref_/2): Archivo HTML principal.
- [main.ts](http://_vscodecontentref_/3): Archivo principal de Angular.
- [angular.json](http://_vscodecontentref_/4): Archivo de configuración de Angular CLI.
- [package.json](http://_vscodecontentref_/5): Archivo de configuración de npm con las dependencias y scripts del proyecto.

### Desarrollo

Para iniciar el servidor de desarrollo, ejecuta:

```bash
ng serve