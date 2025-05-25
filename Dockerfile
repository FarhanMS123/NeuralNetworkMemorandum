# docker build --no-cache -t inb . --debug --progress plain
# docker run -it --rm -v "$(pwd)":/home/app --workdir /home/app condaforge/miniforge3
# docker run -p 8080:80 inb
# docker system prune -a -f

FROM condaforge/miniforge3:latest AS build

RUN mkdir -p /home/tmp

WORKDIR /home/app
COPY . .

ENV DEBIAN_FRONTEND=noninteractive

# RUN apt update -y
# RUN apt-get install -y libcairo2-dev pkg-config python3-dev

RUN conda install -n base -c conda-forge conda mamba micromamba conda-libmamba-solver --yes
RUN conda clean --all --yes
# RUN conda config --set solver mamba

RUN mamba env update -n base --file build-environment.yml --yes
# RUN mamba env update -n base --file environment.yml                 # no --yes, because of mamba==1
RUN mamba run -n base python -m pip install -r requirements.txt --root-user-action ignore

# RUN TMPDIR=$(mktemp -d)
# RUN rsync -av --exclude 'content' ./ content/
# RUN cp -a $(ls -A | grep -v '^content$') content/
# shopt -s extglob && cp -r !("content") content/

RUN mamba run -n base jupyter lite build --contents ./ --output-dir /home/dist

FROM nginx AS serve

COPY --from=build /home/dist /usr/share/nginx/html

EXPOSE 80