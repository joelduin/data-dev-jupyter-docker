# Jupyter Docker for Tiendanube/Nuvemshop Data Team :rocket:

Repositorio que contiene la infraestructura necesaria para utilizar Servidorcito 3.0

Construido sobre Docker a partir de la imagen oficial de [Jupyter Docker Stacks](https://jupyter-docker-stacks.readthedocs.io/en/latest/index.html)

Instalado sobre EC2 (data-gp3)

#### Ingresar a Jupyter

```ssh -N -L "localhost:8884:10.1.103.91:8885" ubuntu@vpn-us.linkedstore.com & ```

## Conectarse al servidor Jupyter via command line

1) `nube ssh 10.1.103.91`
2) `docker ps -a` (Ver el nombre de contenedor)
3) `docker exec -it data-dev-jupyter-docker_jupyter-data_1 /bin/bash`

## Comandos Útiles

#### Listar environments instalados:

- ```conda info --envs```
  
#### Activar environment

- ```source activate MY_ENV```

#### Librerías

> <sub> *Existen dos formas de instalar librerías, de forma **temporal** y de forma **permanente**.
> Cuando se necesita necesita instalar una librería de forma inmediata y probar su funcionamiento vamos a instalarla de forma **temporal**.
> Una vez que se sabemos que esa libreria funciona y se requiere utilizar de forma regular, la instalamos de forma **permanente*** </sub>

##### Instalar librería de forma temporal

1) [Activar environment](#activar-environment)
2) Instalar librería vía conda/pip

> **Importante:** Si no se instala la librería de forma permanante, la misma dejará de existir cuando el contenedor de Docker se reinicie


##### Instalar librería de forma permanente

1) Ingresar a la carpeta de requerimientos dentro del repo `/environments/requirements`
2) Buscar archivo de requerimiento correspondiente al envronment
3) Editar el archivo y agregar al final la librería y versión que deseamos instalar

> **Importante:** Si no se indica la version de la librería a instalar, por defecto instalará siempre la última versión disponible

4) Guardar, commitear y pushear

#### Environments

> <sub>*Existen dos formas de instalar environments, de forma **temporal** y de forma **permanente**.
> Cuando se necesita necesita instalar un environments de forma inmediata y probar su funcionamiento vamos a instalarla de forma **temporal**. *(Ejemplo: Queremos probar una nueva version de Python)*
> Una vez que se sabemos que ese environment funciona y se requiere utilizar de forma regular, lo instalamos de forma **permanente***</sub> 


##### Crear environment de forma temporal

   - Los environments dentro del contenedor son creados via *[conda](https://conda.io/projects/conda/en/latest/index.html)*, existen múltiples formas de crear un nuevo environment. *[[Conda managing environments](https://conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html)]*

##### Crear environment de forma permanente

> Los environments permanentes son creados desde un archivo [YML](https://conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html#creating-an-environment-file-manually)

*Se toma como ejemplo la creación de guido_env*

1) Ingresar a la carpeta de requerimientos dentro del repo `/environments/requirements` y crear un nuevo file con las librerías que necesitamos.
2) Ingresar a la carpeta de requerimientos dentro del repo `/environments/yml`
3) Crear archivo yml con la siguiente estructura:


```
name: guido_env
dependencies:
  - python=3.7
  - ipykernel
  - matplotlib
  - pip
  - pip:
    - -r file:/home/jupyter-datascience-dev/environments/requirements/requirements_guido.txt
```

**name:** Nombre del environment.

**dependencies:** indicar la versión de Python a utilizar.

**pip:** Mediante `-r file:` indicamos el path dentro del contendor de docker donde se encuentra el file de requerimientos correspondiente a nuestro env.

3) Abrir el archivo `Dockerfile` dentro del directorio raíz de nuestro repo.
4) Agregar al final del archivo las siguientes 4 líneas de código.

```
# 15 guido_env
 
RUN conda env create -q -f /home/jupyter-datascience-dev/environments/yml/environment_guido.yml
SHELL ["conda","run","-n","guido_env","/bin/bash","-c"]
RUN python -m ipykernel install --name guido_env --display-name "guido_env"

```

5) Guardar, commitear y pushear

> **IMPORTANTE:** El cambio se vera reflejado en el próximo build del contenedor de Docker, el mismo se realiza de forma automatica, 1 vez por semana durante el fin de semana
