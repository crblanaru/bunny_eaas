from fastapi import FastAPI
import os
import random

app = FastAPI()


@app.get("/")
def hello_world():
    api_key = os.getenv('API_KEY')
    my_rand = random.randint(100,999)
    return {"bunnyshell-neo": "is_amazing", "api_keys": api_key}
    #return {"bunnyshell-neo": "is_amazing", "api_keyz": api_key, "random": my_rand}
