# -*- coding: utf-8 -*-
import os, json
from flask import Flask, request
import sys


app = Flask(__name__, instance_relative_config=True)


@app.route('/')
def index():
    return 'Olá mundo'
