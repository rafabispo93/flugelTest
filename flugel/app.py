# -*- coding: utf-8 -*-
import os, json
from flask import Flask, request
import sys


app = Flask(__name__, instance_relative_config=True)


@app.route('/')
def index():
    response = {
        'msg': 'Hello World',
        'id_response': 200
    }
    return json.dumps(response), int(response['id_response'])
