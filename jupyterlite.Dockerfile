# docker build --no-cache -t inb -f jupyterlite.Dockerfile .

FROM condaforge/miniforge3:latest as build

RUN mkdir -p /home/tmp

WORKDIR /home/app
COPY . .

RUN conda run -n base python -m pip install -r requirements.txt
RUN conda run -n base jupyter lite build --contents content --output-dir /home/dist

FROM nginx as serve

COPY --from=build /home/dist /usr/share/nginx/html

EXPOSE 80