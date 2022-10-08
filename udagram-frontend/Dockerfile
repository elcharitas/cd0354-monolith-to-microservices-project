## Build
FROM node:14.15.5-alpine3.13 as build
# Create app directory
WORKDIR /usr/src/app
# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
COPY package.json ./
COPY pnpm-lock.yaml ./
RUN npm install -g pnpm
RUN SHELL="bash" pnpm setup; source /root/.bashrc; pnpm install -g @ionic/cli
RUN source /root/.bashrc; pnpm i
# Bundle app source
COPY . .
RUN source /root/.bashrc; ionic build
## Run 
FROM nginx:alpine
#COPY www /usr/share/nginx/html
COPY --from=build /usr/src/app/www /usr/share/nginx/html