FROM node:14-alpine  # Versión más ligera

WORKDIR /app

# Copia solo lo necesario para instalar dependencias
COPY package.json ./

# Instala dependencias limpias
RUN npm install --production --silent

# Copia el resto de la aplicación
COPY . .

# Variables de entorno
ENV NODE_ENV=production

# Build de producción
RUN npm run build

# Servidor estático
RUN npm install -g serve
EXPOSE 3000
CMD ["serve", "-s", "build", "-l", "3000"]