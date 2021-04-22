# instalar

npm init -y
npm i aws-sdk
sls deploy
sls invoke local -f img-analysis
sls deploy
sls invoke -f img-analysis
sls invoke -f img-analysis --log
sls invoke local -f img-analysis --path request.json
