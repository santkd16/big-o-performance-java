FROM node:14
WORKDIR /app

# Primero copia solo package.json
COPY package.json ./

# Instala dependencias (esto generará package-lock.json internamente)
RUN npm install

# Luego copia todo el resto
COPY . .

EXPOSE 3000
CMD ["npm", "start"]