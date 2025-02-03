# ¿Cómo usar la integración Terraform?

## 1. Terraform mongodb

Para preparar y aplicar la configuración con Terraform, sigue estos pasos:

### 1.1 Configuración de Credenciales AWS

  - Crea un archivo `terraform.tfvars` en el directorio `terraform/mongodb` y agrega las siguientes variables:

  ```hcl
    [profile-name]
    aws_access_key_id = TU_CLAVE_DE_ACCESO
    aws_secret_access_key = TU_CLAVE_SECRETA
  ```  

  Reemplaza profile-name, TU_CLAVE_DE_ACCESO, y TU_CLAVE_SECRETA con tus propios valores.

### 1.2 Creación de par de claves en AWS

  - Ve a la consola de AWS y navega hasta el servicio EC2.
  - En el panel de navegación izquierdo, selecciona "Key Pairs".
  - Crea un nuevo par de claves y asegúrate de descargarlo y guardar el nombre del par de claves para uso posterior.

### 1.3 Inicialización de Terraform

  - Navega hasta el directorio `terraform/mongodb`.
  - Ejecuta el comando `terraform init` para inicializar el directorio de trabajo.

  ```bash
  terraform init
  ```

### 1.4 Planificacion de la infraestructura

  - Ejecuta el comando `terraform validate` para validar la configuración.

  ```bash
  terraform validate
  ```

### 1.5 Planificación de la infraestructura

  - Ejecuta el comando `terraform plan` para crear un plan de ejecución.

  ```bash
  terraform plan -out mean_stack
  ```

### 1.6 Aplicación de la infraestructura

  - Ejecuta el comando `terraform apply` para crear los recursos.

  ```bash
  terraform apply "mean_stack"
  ```

  Para este caso te solicitara entre las variables la region, puedes responder con la region ```us-east-1``` y la zona de disponibilidad ```us-east-1a```.

### 1.7 Destrucción de la infraestructura

  - Ejecuta el comando `terraform destroy` para eliminar los recursos.

  ```bash
  terraform destroy
  ```

### 1.8 Fallo en la creación de la instancia

  - Si la instancia no se crea correctamente, ejecuta el comando `terraform plan -out mean_stack -destroy` nuevamente.

  ```bash
  terraform plan -out mean_stack -destroy
  ```

  - Luego, ejecuta el comando `terraform apply "mean_stack"` para eliminar los recursos.

  ```bash
  terraform apply "mean_stack"
  ```

## 2. Terraform nginx - nodejs