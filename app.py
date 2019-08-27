from requests import get
from flask import Flask, jsonify
from os import environ
app = Flask(__name__)

EC2_METADATA_ENDPOINT='http://169.254.169.254/latest/dynamic/instance-identity/document'

@app.route('/')
def root():
    return jsonify({ 'routes' : [ str(url) for url in app.url_map.iter_rules()] })

@app.route('/environ')
def envvars():
    return jsonify({ x : str(environ.get(x)) for x in environ })

@app.route('/ec2-metadata')
@app.route('/ec2-metadata/<key>')
def ec2_metadata(key=None):
     response = get(EC2_METADATA_ENDPOINT)
     response_json = response.json()
     return jsonify(response_json.get(key, f'"{key}" there is no such key, you can try those {", ".join(response_json.keys())}') if key else response_json)
