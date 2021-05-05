# Setup

## App

La app ha sido desplegada a: https://desolate-mountain-70963.herokuapp.com

Puedes hacer login como admin: 
  - Usuario: admin@example.com
  - Contraseña: password

Hacer check_in y check_out, puedes coger un número privado de un empleado y probar esta funcionalidad:

  - https://desolate-mountain-70963.herokuapp.com/logs/check_in
  - https://desolate-mountain-70963.herokuapp.com/logs/check_out

## Integrantes
  - Angelina Moreno Robledo
  - Eusebio Ajas Santos
  - Javier Fernando Chi Ortiz
  - Roberto Antonio Velasco Munguía

## Pasos para ejecutar el proyecto

1. Instalar las dependencias con: `bundle install` y `yarn install`
2. Configurar base de datos:
   - Crear y ajustar `config/database.yml` basandose en `config/database.yml.example` 
   - Ejecutar `rails db:setup`
3. Ejecutar el proyecto con: `rails server` y `bin/webpack-dev-server`
4. Ejecutar pruebas de RSpec con: `rspec`

## Ver resultados rubycritic y sandi_meter

1. Ejecutar `rake code_quality`
