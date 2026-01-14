# Event Driven Platform

Projeto de testes e aprendizado sobre arquitetura **event-driven** usando **LocalStack**, **S3**, **SQS** e **Docker**.

---

##  Sobre o projeto

Este projeto simula um **ambiente AWS local** utilizando o LocalStack. 
Ele permite criar buckets S3, filas SQS e testar o envio/recebimento de mensagens e uploads de arquivos, **sem precisar de conta AWS real**. 

O objetivo é estudar e demonstrar conceitos de **event-driven architecture** de forma prática e gratuita.

---

##  Tecnologias utilizadas

- **LocalStack** – simula serviços AWS localmente 
- **Docker** – containerização do LocalStack 
- **AWS CLI** – interação com S3 e SQS 
- **Bash Script** – automatiza criação de buckets, filas, envio de mensagens e uploads 
- **Git/GitHub** – versionamento do projeto 

---

##  Pré-requisitos

- Docker instalado (ou usar Cloud Shell com Docker) 
- AWS CLI instalado 
- Git (para clonar o repositório) 

---

##  Estrutura do projeto

event-driven-platform/
├── docker-compose.yml # Configuração do LocalStack
├── test-flow.sh # Script de teste completo
├── README.md # Documentação do projeto
├── .gitignore # Arquivos ignorados (teste.txt, logs)


---

##  Como rodar o projeto

1. Clone o repositório:

```bash
git clone https://github.com/JulianoAltafini/event-driven-platform.git
cd event-driven-platform

export AWS_ACCESS_KEY_ID=test
export AWS_SECRET_ACCESS_KEY=test
export AWS_DEFAULT_REGION=us-east-1
export LOCALSTACK=http://localhost:4567

3.Suba o LocalStack com Docker Compose:

docker-compose up -d


4.Execute o script de teste completo:

./test-flow.sh

Feito por Juliano Altafini | LinkedIn https://www.linkedin.com/in/juliano-altafini-a866a921/


