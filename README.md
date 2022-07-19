## Compose sample application
### Python/FastAPI application

The purpose of this project is to showcase Bunnyshell features.

The focus is on the integration with Jenkins. Please use the BlueOcean plugin and set the AUTH_TOKEN and PROJECT as global variables in your Jenkins system.

Project structure:
```
├── docker-compose.yaml
├── Dockerfile
├── requirements.txt
├── app
    ├── main.py
    ├── __init__.py

```

[_docker-compose.yaml_](docker-compose.yaml)
```
services:
  api:
    build: .
    container_name: fastapi-application
    environment:
      PORT: 80
    ports:
      - '80:80'
    restart: "no"

```


