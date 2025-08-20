FROM node:20-alpine
WORKDIR /app
ENV NODE_ENV=production
COPY package*.json ./
RUN npm install --only=production
COPY . .
EXPOSE 3002
HEALTHCHECK CMD wget -qO- http://localhost:3002/health || exit 1
CMD ["node", "index.js"]
