# instalar

npm i -g serverless

# sls inicializar

sls

# sempre fazer deploy do ambiente antes para verificar se está tudo ok

sls deploy

# invocar na AWS

sls invoke -f hello

# invocar local

sls invoke local -f hello --log

# configurar dashboard

serverless dashboard

# logs

sls logs -f hello --tail

# remover tudo

sls remove
