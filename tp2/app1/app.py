from flask import Flask, render_template, redirect, url_for
import os


DEBUG = os.environ.get('DEBUG')
PORT = os.environ.get('PORT')

app = Flask(__name__)

@app.get('/')
def home():
    return 'Please insert your name on url/'

@app.get('/<name>')
def index(name):
    return render_template('index.html', name=name)

@app.get('/contacto')
def contacto():
    return render_template('contacto.html', nombre='Francisco', padron='114777')
    

if __name__ == '__main__':
    app.run(debug=DEBUG, port=PORT)

 
    