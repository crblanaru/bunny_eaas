from asyncore import write
from fastapi import FastAPI
import os
import random

app = FastAPI()


@app.get("/")
def hello_world():
    api_key = os.getenv('API_KEY')
    db_endpoint = os.getenv('DBENDPOINT')
    my_rand = random.randint(100,999)
    with open('/var/log/dog_breeds.txt', 'w') as writer:
        writer.write(str(my_rand))
        writer.write('\n')
    # Further file processing goes here
    return {"bunnyshell-neo": "is_amazing", "api_key": api_key, "db_endpoints": db_endpoint}
    #return {"bunnyshell-neo": "is_amazing", "api_key": api_key, "random": my_rand}
