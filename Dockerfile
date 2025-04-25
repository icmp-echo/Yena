FROM nvidia/cuda:12.1.0-base-ubuntu22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    python3 python3-pip git curl wget unzip \
    build-essential nodejs npm \
    && apt-get clean

RUN pip3 install --upgrade pip
RUN pip3 install torch deepspeed langchain autogen openai flask fastapi uvicorn
RUN npm install -g hardhat vercel firebase-tools

WORKDIR /workspace/yena
COPY . .

CMD ["python3", "agents/commander_agent.py"]
