# 1️⃣ Imagem base
FROM python:3.11-slim

# 2️⃣ Configurações do Python
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

# 3️⃣ Instala dependências do sistema e do Python
RUN apt-get update && apt-get install -y \
        build-essential \
        curl \
        && pip install --upgrade pip \
        && pip install fastapi uvicorn \
        && apt-get remove -y build-essential \
        && apt-get autoremove -y \
        && rm -rf /var/lib/apt/lists/*

# 4️⃣ Copia todo o código da aplicação
COPY . .

# 5️⃣ Expõe a porta usada pela FastAPI
EXPOSE 6000

# 6️⃣ Comando para rodar a API
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "6000"]
