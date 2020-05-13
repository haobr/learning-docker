# BUILDER PHASE
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# RUN PHASE
FROM nginx
#Copy folder từ phase BUILDER
COPY --from=builder /app/build /usr/share/nginx/html