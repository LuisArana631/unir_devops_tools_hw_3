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

  - Ejecuta el comando `terraform plan` para ver los recursos que se crearán.

  ```bash
  terraform plan
  ```

### 1.5 Aplicación de la infraestructura

  - Ejecuta el comando `terraform apply` para crear los recursos.

  ```bash
  terraform apply
  ```

### 1.6 Destrucción de la infraestructura

  - Ejecuta el comando `terraform destroy` para eliminar los recursos.

  ```bash
  terraform destroy
  ```


## 2. Terraform nginx - nodejs