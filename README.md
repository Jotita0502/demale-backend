# Demale Backend

## Descripción

Backend del sistema web Demale, desarrollado con Spring Boot para la gestión logística de productos, clientes, envíos, conductores, rutas, vehículos y puntos de acopio. Expone servicios REST consumidos por el frontend Angular.

## Funcionalidades

* Gestión de clientes.
* Registro y administración de productos.
* Gestión de envíos.
* CRUD de rutas.
* CRUD de vehículos.
* Gestión de conductores.
* Control de estados de productos.
* Relación entre productos y envíos mediante detalle de envío.
* Integración con base de datos MySQL.
* Endpoints REST para consumo desde Angular.

## Tecnologías utilizadas

* Java
* Spring Boot
* Spring Data JPA
* Hibernate
* MySQL
* Maven
* REST API
* Git y GitHub

## Requisitos

* Java 21
* Maven
* MySQL
* MySQL Workbench

## Instalación

Clonar el repositorio:

```bash
git clone https://github.com/Jotita0502/demale-backend.git
```

Ingresar al proyecto:

```bash
cd demale-backend
```

Configurar la conexión a la base de datos en:

```text
src/main/resources/application.properties
```

Ejecutar el backend:

```bash
mvn spring-boot:run
```

El backend se ejecutará en:

```text
http://localhost:8080
```

## Endpoints principales

```text
GET    /api/clientes/buscar?query=
POST   /api/clientes/registrar
GET    /api/productos
POST   /api/productos/registrar
GET    /api/productos/en-almacen
GET    /api/envios
POST   /api/envios
GET    /api/envios/{id}
PUT    /api/envios/{id}
DELETE /api/envios/{id}
GET    /api/conductores/dropdown
GET    /api/vehiculos/dropdown
GET    /api/rutas/dropdown
```

## Base de datos

El proyecto utiliza MySQL. Se recomienda agregar un archivo `.sql` de respaldo en una carpeta:

```text
database/
```

## Frontend relacionado

Repositorio frontend:

```text
https://github.com/Jotita0502/demale-frontend
```

## Autor

Joaquín Ricardo Conde Espíritu
Ingeniería de Sistemas Computacionales
Universidad Privada del Norte
