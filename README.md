# Jupyter Docker for Tiendanube/Nuvemshop Data Team :rocket:

Repositorio que contiene la infraestrucutra necesaria para utilizar Servidorcito 3.0

Construido sobre Docker a partir de la imagen oficial de [Jupyter Docker Stacks](https://jupyter-docker-stacks.readthedocs.io/en/latest/index.html)

Instalado sobre EC2 (data-gp3)

####Ingresar a Jupyter

```ssh -N -L "localhost:8884:10.1.103.91:8888" ubuntu@vpn-us.linkedstore.com & ```

## Conectarse al servidor Jupyter via command line

1) `nube ssh 10.1.103.91`
2) `docker ps -a` (Ver el nombre de contenedor)
3) `docker exec -it data-dev-jupyter-docker_jupyter-data_1 /bin/bash`

## Comandos Utiles

#### Listar environments instalados:

- ```conda info --envs```
  
#### Activar environment

- ```source activate MY_ENV```

#### Librerías

##### Intalar librería de forma temporal

1) [Activar environment](#activar-environment)
2) Instalar libreria via conda/pip

> **Importante:** Si no se instala la librería de forma permanante, la misma dejará de existir cuando el contenedor de Docker se reinicie


##### Intalar librería de forma permanente

1) Ingresar a la carpeta de requerimientos dentro del repo `/environments/requirements`
2) Buscar archivo de requerimiento correspondiente al envronment
3) Editar el archivo y agregar al final la librería y version que deseamos instalar

> **Importante:** Si no se indica la version de la librería a instalr, por defecto instalará siempre la ultima versión disponible

4) Guardar, commitear y pushear

#### Environments

##### Crear environment de forma temporal

   - Los environments dentro del contenedor son creados via *[conda](https://conda.io/projects/conda/en/latest/index.html)*, existen multiples formas de crear un nuevo environment. *[[Conda managing environments](https://conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html)]*

##### Crear environment de forma permanente

> Los environments permanentes son creados desde un archivo [YML](https://conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html#creating-an-environment-file-manually)

1) Ingresar a la carpeta de requerimientos dentro del repo `/environments/requirements` y crear un nuevo file con las librerias que necesitamos.
2) Ingresar a la carpeta de requerimientos dentro del repo `/environments/yml`
3) Crear archivo yml con la siguiente estructura:

*Ejemplo: guido_env*
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

**name:** Nombre del environment
**dependencies:** indicar la versión de Python a utilizar
**pip:** Mediante `-r file:` indicamos el path dentro del contendor de docker donde se encuentra el file de requerimientos correspondiente a nuestro env.

3) Abrir el archivo `Dockerfile` dentro del directorio raiz de nuestro repo.
4) Agregar al final del archivo lo siguientes comandos.

```
# 15 guido_env
 
RUN conda env create -q -f /home/jupyter-datascience-dev/environments/yml/environment_guido.yml
SHELL ["conda","run","-n","guido_env","/bin/bash","-c"]
RUN python -m ipykernel install --name guido_env --display-name "guido_env"

```