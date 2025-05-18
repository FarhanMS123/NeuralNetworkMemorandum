# docker build --no-cache -t inb . --debug --progress plain
# docker run -it --rm -v "$(pwd)":/home/app condaforge/miniforge3
# docker run -p 8080:80 inb

FROM condaforge/miniforge3:latest as build

RUN mkdir -p /home/tmp

WORKDIR /home/app
COPY . .

RUN conda update -n base -c conda-forge conda mamba --yes
RUN conda clean --all --yes

RUN conda env update -n base -f build-environment.yml
RUN conda env create -f environment.yml
RUN conda run -n base python -m pip install -r requirements.txt

# RUN TMPDIR=$(mktemp -d)
RUN rsync -av --exclude 'content' ./ content/
RUN conda run -n base jupyter lite build --contents content --output-dir /home/dist

FROM nginx as serve

COPY --from=build /home/dist /usr/share/nginx/html

EXPOSE 80