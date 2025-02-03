# Contenedor de Docker con MongoDB

Este documento proporciona instrucciones sobre cómo ejecutar MongoDB dentro de un contenedor de Docker usando la imagen oficial de MongoDB.

## Pasos para configurar el contenedor

### 1. Descargar la Imagen de MongoDB

Primero, necesitas descargar la última versión de la imagen oficial de MongoDB desde Docker Hub:

```bash
docker pull mongo
```

### 2. Crear y Ejecutar el Contenedor de MongoDB

Para crear y ejecutar un contenedor de MongoDB, usa el siguiente comando:

```bash
docker run --name my-mongo -p 27017:27017 -d mongo
```

Detalles del Comando:
--name my-mongo: Asigna el nombre my-mongo al contenedor.
-p 27017:27017: Mapea el puerto 27017 del contenedor al puerto 27017 de tu máquina host.
-d: Ejecuta el contenedor en modo "detached", permitiendo que corra en el fondo.

### 3. Verificar el Contenedor de MongoDB

Para verificar que el contenedor de MongoDB está en ejecución, ejecuta el siguiente comando:

```bash
docker ps
```

Este comando mostrará una lista de todos los contenedores en ejecución en tu máquina.

### 4. Conectar a la Instancia de MongoDB

Para conectarte a la instancia de MongoDB dentro del contenedor, ejecuta el siguiente comando:

```bash
docker exec -it my-mongo mongo
```

Este comando abrirá una consola de MongoDB donde puedes ejecutar comandos de MongoDB.

### 5. Detener y Eliminar el Contenedor de MongoDB

Para detener y eliminar el contenedor de MongoDB, ejecuta los siguientes comandos:

```bash
docker stop my-mongo
docker rm my-mongo
```

Estos comandos detendrán y eliminarán el contenedor de MongoDB de tu máquina.

