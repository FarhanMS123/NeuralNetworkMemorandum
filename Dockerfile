FROM condaforge/miniforge3:latest as build

RUN mkdir -p /home/tmp

WORKDIR /home/app
COPY . .

# RUN conda update -n base -c conda-forge conda
RUN conda clean --all --yes
# RUN conda env create -f build-environment.yml -C
RUN conda env create -f build-environment.yml
# RUN conda init
# RUN conda activate build-env
RUN TMPDIR=/home/tmp conda run -n build-env python -m pip install -r requirements.txt

RUN rm -rf /home/tmp/*
RUN TMPDIR=/home/tmp conda run -n build-env jupyter lite build --contents content --output-dir /home/dist

FROM nginx as serve

COPY --from=build /home/dist /usr/share/nginx/html

EXPOSE 80