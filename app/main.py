from fastapi import FastAPI
import os
import random

app = FastAPI()


@app.get("/")
def hello_world():
    api_key = os.getenv('API_KEY')
    db_endpoint = os.getenv('DBENDPOINT')
    my_rand = random.randint(100,999)
    #return {"bunnyshell-neo": "is_amazing", "api_key": api_key, "db_endpoints": db_endpoint}
    return {"bunnyshell-neo": "is_amazing", "api_key": api_key, "random": my_rand}
#feature gamma
