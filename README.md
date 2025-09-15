# Kupparpeak
A shell script to convert some environment variables from .env file to JS Code.

## Input Command
```bash
ALLOWED_VARS="PORT,HOST,CLIENT_ID,REDIRECT_URI" ./env2js.sh test_env
```

## Output Result
```bash
Config.PORT = "3000"
Config.HOST = "localhost"
Config.CLIENT_ID = "com.example.client.id"
Config.REDIRECT_URI = "uri.redirect.example.com"
```
