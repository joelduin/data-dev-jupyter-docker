ARG BASE_CONTAINER=jupyter/minimal-notebook
FROM $BASE_CONTAINER

USER root

# Install curl & wget

RUN apt-get update && apt-get install -y curl wget

# Install aws-cli

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
unzip awscliv2.zip && \
sudo ./aws/install

RUN aws --version

#Install jupyter resource usage 

RUN conda install -c conda-forge jupyter-resource-usage

# Clone repo to create env

RUN git clone https://github.com/TiendaNube/data-dev-jupyter-docker.git /home/jupyter-datascience-dev/ 

RUN cd /home/jupyter-datascience-dev

# 1 dirso367

RUN conda env create -q -f /home/jupyter-datascience-dev/environments/yml/environment_dirso367.yml
SHELL ["conda","run","-n","dirso367","/bin/bash","-c"]
RUN python -m ipykernel install --name dirso367 --display-name "dirso367"

#2 JoelEnv

RUN conda env create -q -f /home/jupyter-datascience-dev/environments/yml/environment_JoelEnv.yml
SHELL ["conda","run","-n","JoelEnv","/bin/bash","-c"]
RUN python -m ipykernel install --name JoelEnv --display-name "JoelEnv"

# 3 dcparrarincon

RUN conda env create -q -f /home/jupyter-datascience-dev/environments/yml/environment_dcparrarincon.yml
SHELL ["conda","run","-n","dcparrarincon","/bin/bash","-c"]
RUN python -m ipykernel install --name dcparrarincon --display-name "dcparrarincon"

# 4 marienv

RUN conda env create -q -f /home/jupyter-datascience-dev/environments/yml/environment_marienv.yml
SHELL ["conda","run","-n","marienv","/bin/bash","-c"]
RUN python -m ipykernel install --name marienv --display-name "marienv"

# 5 dirso_env

RUN conda env create -q -f /home/jupyter-datascience-dev/environments/yml/environment_dirso_env.yml
SHELL ["conda","run","-n","dirso_env","/bin/bash","-c"]
RUN python -m ipykernel install --name dirso_env --display-name "dirso_env"

# 6 ianca_env

RUN conda env create -q -f /home/jupyter-datascience-dev/environments/yml/environment_ianca_env.yml
SHELL ["conda","run","-n","ianca_env","/bin/bash","-c"]
RUN python -m ipykernel install --name ianca_env --display-name "ianca_env"

# 7 nmori

RUN conda env create -q -f /home/jupyter-datascience-dev/environments/yml/environment_nmori.yml
SHELL ["conda","run","-n","nmori","/bin/bash","-c"]
RUN python -m ipykernel install --name nmori --display-name "nmori"

# 8 rodrienv

RUN conda env create -q -f /home/jupyter-datascience-dev/environments/yml/environment_rodrienv.yml
SHELL ["conda","run","-n","rodrienv","/bin/bash","-c"]
RUN python -m ipykernel install --name rodrienv --display-name "rodrienv"

# 9 dirso_tensor_flow

RUN conda env create -q -f /home/jupyter-datascience-dev/environments/yml/environment_dirso_tensor_flow.yml
SHELL ["conda","run","-n","dirso_tensor_flow","/bin/bash","-c"]
RUN python -m ipykernel install --name dirso_tensor_flow --display-name "dirso_tensor_flow"

# 10 lucas_env

RUN conda env create -q -f /home/jupyter-datascience-dev/environments/yml/environment_lucas_env.yml
SHELL ["conda","run","-n","lucas_env","/bin/bash","-c"]
RUN python -m ipykernel install --name lucas_env --display-name "lucas_env"

# 11 jonas

RUN conda env create -q -f /home/jupyter-datascience-dev/environments/yml/environment_jonas.yml
SHELL ["conda","run","-n","jonas","/bin/bash","-c"]
RUN python -m ipykernel install --name jonas --display-name "jonas"

# 12 pabloenv

RUN conda env create -q -f /home/jupyter-datascience-dev/environments/yml/environment_pabloenv.yml
SHELL ["conda","run","-n","pabloenv","/bin/bash","-c"]
RUN python -m ipykernel install --name pabloenv --display-name "pabloenv"

# 13 sofi_env

RUN conda env create -q -f /home/jupyter-datascience-dev/environments/yml/environment_sofi_env.yml
SHELL ["conda","run","-n","sofi_env","/bin/bash","-c"]
RUN python -m ipykernel install --name sofi_env --display-name "sofi_env"

# 14 jaime

RUN conda env create -q -f /home/jupyter-datascience-dev/environments/yml/environment_jaime.yml
SHELL ["conda","run","-n","jaime","/bin/bash","-c"]
RUN python -m ipykernel install --name jaime --display-name "jaime"

# 15 guido_env

RUN conda env create -q -f /home/jupyter-datascience-dev/envs/environment_guido.yml
SHELL ["conda","run","-n","guido_env","/bin/bash","-c"]
RUN python -m ipykernel install --name guido_env --display-name "guido_env"

# 16 uru_env

RUN conda env create -q -f /home/jupyter-datascience-dev/envs/environment_uru.yml
SHELL ["conda","run","-n","uru_env","/bin/bash","-c"]
RUN python -m ipykernel install --name uru_env --display-name "uru_env"