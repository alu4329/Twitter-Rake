# Práctica 2 - SYTW

## Víctor Plaza Martín


### Descripción de la Práctica

Práctica: Accediendo a Twitter y Mostrando los últimos twitts en una página

Convierta el programa de ejemplo usado en la sección Ejemplo en Ruby: Accediendo a Twitter en una aplicación Rack que muestre en su página los últimos twitts de una lista de usuarios obtenidos desde un formulario (puede modificar/diseñar la interfaz como crea conveniente) 


#### Glosario de archivos

<ul>
  <li>TwitterRake.rb - Archivo Ruby donde se encuentra implementada la práctica</li>
  <li>Rakefile - Archivo de ejecución de Ruby </li>
  <li>Gemfile - Archivo donde se encuentran las gemas usadas y sus versiones</li>
  <li>.gitignore - Archivo donde se especifican los archivos que no deseamos añadir al control de versiones</li>
  <li>.ruby-version - Archivo que contiene la versión de ruby sobre la que trabajamos</li>
</ul>

#### Instrucciones de la práctica

Al contar con un archivo Rakefile, la ejecución de la práctica se realiza de manera sencilla a través del comando "Rake" ya que el método esta declarado para default. 
Se ha desarrollado una aplicación de servicio web a través del host que nos proporciona Thin por el cual un usuario puede ver el último tweet de uno o varios usuarios de manera ordenada.
