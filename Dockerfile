# Usar imagem base do Node
FROM node:14-alpine

# Diretório de trabalho dentro do contêiner
WORKDIR /app

# Copiar os arquivos de dependência primeiro (para caching)
COPY package*.json ./

# Instalar dependências
RUN npm install

# Copiar o resto dos arquivos para o diretório de trabalho
COPY . .

# Gerar a documentação e preparar para o servidor
RUN npm run prestart

# Expor a porta que o servidor HTTP vai escutar
EXPOSE 8080

# Comando para iniciar o servidor
CMD ["npm", "start"]


