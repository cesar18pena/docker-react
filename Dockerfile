FROM node:10.16- as builder
WORKDIR '/usr/app'
COPY package.son .
RUN npm install
COPY . .
RUN npm run build

FROM nginx

COPY --from=builder /usr/app/build /usr/share/nginx/html

