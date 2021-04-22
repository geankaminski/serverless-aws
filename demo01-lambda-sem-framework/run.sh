# criar arquivo de políticas se segurança

politicas.json

# criar role de segurança na aws

aws iam create-role \
    --role-name lambda-exemplo \
    --assume-role-policy-document file://politicas.json \
    | tee logs/role.log

# criar arquivo com conteúdo e zipa-lo

zip function.zip index.js
(no windows clicar com o direito e selecionar enviar para -> pasta compactada)

aws lambda create-function \
    --function-name hello-cli \
    --zip-file fileb://function.zip \
    --handler index.handler \
    --runtime nodejs12.x \
    --role arn:aws:iam::925099487196:role/lambda-exemplo
    | tee logs/lambda-create.log

# invocar o lambda!

aws lambda invoke \
    --function-name hello-cli \
    --log-type Tail \
    logs/lambda-exec.log

# atualizar e zipar o index

novamente: zip function.zip index.js
(no windows clicar com o direito e selecionar enviar para -> pasta compactada)

# atualizar lambda

aws lambda update-function-code \
    --zip-file fileb://function.zip \
    --function-name hello-cli \
    --publish | tee logs/lambda-update.log

# invocar e ver resultado

aws lambda invoke \
    --function-name hello-cli \
    --log-type Tail logs/lambda-exec-update.log

# remover 

aws lambda delete-function \
    --function-name hello-cli

aws iam delete-role \
    --role-name lambda-exemplo