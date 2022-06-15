[![Build Status](https://143.198.251.8/buildStatus/icon?job=simpleproj)](https://143.198.251.8/job/simpleproj/)
## Compose sample application
### Python/FastAPI application

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


