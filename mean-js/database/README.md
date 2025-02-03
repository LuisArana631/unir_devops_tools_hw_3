# Contenedor de Docker con MongoDB

Este documento proporciona instrucciones sobre cómo ejecutar MongoDB dentro de un contenedor de Docker usando la imagen oficial de MongoDB.

## Pasos para configurar el contenedor

### 1. Descargar la Imagen de MongoDB

Primero, necesitas descargar la última versión de la imagen oficial de MongoDB y mongo-express desde Docker Hub: 

```bash
docker pull mongo
docker pull mongo-express
```

### 2. Crear una Red de Docker

Crea una red de Docker para conectar los contenedores de MongoDB y mongo-express:

```bash
docker network create mongo-network
```


### 3. Crear y Ejecutar el Contenedor de MongoDB

Para crear y ejecutar un contenedor de MongoDB, usa el siguiente comando:

```bash
docker run --name my-mongo --network mongo-network -p 27017:27017 -d mongo
```

Detalles del Comando:
--name my-mongo: Asigna el nombre my-mongo al contenedor.
-p 27017:27017: Mapea el puerto 27017 del contenedor al puerto 27017 de tu máquina host.
-d: Ejecuta el contenedor en modo "detached", permitiendo que corra en el fondo.

### 4. Crear y Ejecutar el Contenedor de mongo-express

Para crear y ejecutar un contenedor de mongo-express, usa el siguiente comando:

```bash
docker run --name my-mongo-express --network mongo-network -p 8081:8081 -d \
-e ME_CONFIG_MONGODB_SERVER=my-mongo \
-e ME_CONFIG_BASICAUTH_USERNAME=admin \
-e ME_CONFIG_BASICAUTH_PASSWORD=admin \
mongo-express
```

Detalles del Comando:
--name my-mongo-express: Asigna el nombre my-mongo-express al contenedor.
-p 8081:8081: Mapea el puerto 8081 del contenedor al puerto 8081 de tu máquina host.
-e ME_CONFIG_MONGODB_SERVER=my-mongo: Configura la variable de entorno ME_CONFIG_MONGODB_SERVER con el nombre del contenedor de MongoDB.
- d: Ejecuta el contenedor en modo "detached", permitiendo que corra en el fondo.


### 3. Verificar el Contenedor de MongoDB

Para verificar que el contenedor de MongoDB está en ejecución, ejecuta el siguiente comando:

```bash
docker ps
```

Este comando mostrará una lista de todos los contenedores en ejecución en tu máquina.

### 4. Conectar a la Instancia de MongoDB

Para conectarte a la instancia de MongoDB dentro del contenedor, ejecuta el siguiente comando:

```bash
docker exec -it my-mongo mongosh
docker exec -it my-mongo-express /bin/bash
```

Este comando abrirá una consola de MongoDB donde puedes ejecutar comandos de MongoDB.

### 5. Detener y Eliminar el Contenedor de MongoDB

Para detener y eliminar el contenedor de MongoDB, ejecuta los siguientes comandos:

```bash
docker stop my-mongo
docker rm my-mongo
```

Estos comandos detendrán y eliminarán el contenedor de MongoDB de tu máquina.

