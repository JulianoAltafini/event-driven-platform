#!/bin/bash

# === Configura variáveis de ambiente para LocalStack ===
export AWS_ACCESS_KEY_ID=test
export AWS_SECRET_ACCESS_KEY=test
export AWS_DEFAULT_REGION=us-east-1
export LOCALSTACK=http://localhost:4567

echo "=== Variáveis de ambiente configuradas ==="

# === Criar bucket S3 ===
echo "=== Criando bucket S3: event-bucket ==="
aws --endpoint-url=$LOCALSTACK s3 mb s3://event-bucket

# Listar buckets
echo "=== Listando buckets ==="
aws --endpoint-url=$LOCALSTACK s3 ls

# === Criar fila SQS ===
echo "=== Criando fila SQS: event-queue ==="
aws --endpoint-url=$LOCALSTACK sqs create-queue --queue-name event-queue

# Listar filas
echo "=== Listando filas SQS ==="
aws --endpoint-url=$LOCALSTACK sqs list-queues

# === Enviar mensagem para SQS ===
echo "=== Enviando mensagem para event-queue ==="
aws --endpoint-url=$LOCALSTACK sqs send-message \
  --queue-url http://localhost:4567/000000000000/event-queue \
  --message-body "Hello Event-Driven!"

# === Receber mensagem da fila ===
echo "=== Recebendo mensagem da fila ==="
aws --endpoint-url=$LOCALSTACK sqs receive-message \
  --queue-url http://localhost:4567/000000000000/event-queue

# === Criar arquivo de teste e enviar para S3 ===
echo "Hello LocalStack" > teste.txt
echo "=== Enviando teste.txt para bucket S3 ==="
aws --endpoint-url=$LOCALSTACK s3 cp teste.txt s3://event-bucket/teste.txt

# Listar conteúdo do bucket
echo "=== Listando conteúdo do bucket ==="
aws --endpoint-url=$LOCALSTACK s3 ls s3://event-bucket

echo "=== Teste completo finalizado! ==="
