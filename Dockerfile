FROM node:alpine as buildphase

WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .
RUN npm run build

FROM nginx as runphase
COPY --from=buildphase /app/build /usr/share/nginx/html
