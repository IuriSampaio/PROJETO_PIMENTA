FROM node:latest as node
RUN npm i -g npm@7.11.1

WORKDIR /usr/app
COPY . /usr/app

WORKDIR /usr/app/API_SO
RUN npm i --silent
EXPOSE 3000
CMD ["npm","run","start:dev"]

WORKDIR /usr/app/front-so
RUN npm i
CMD ["npm","run","build"]

FROM nginx:alpine
VOLUME /var/cache/nginx
COPY --from=node /usr/app/front-so/dist/front-so /usr/share/nginx/html
COPY --from=node /usr/app/front-so/nginx.conf /etc/nginx/conf.d/default.conf
