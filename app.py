from flask import Flask
from os import environ
app = Flask(__name__)

@app.route('/')
def hello_world():
    return {x:environ.get(x) for x in environ}
