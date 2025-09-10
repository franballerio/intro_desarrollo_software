from flask import Flask, render_template, redirect, url_for
import os


DEBUG = os.environ.get('DEBUG')
PORT = os.environ.get('PORT')

app = Flask(__name__)

@app.get('/')
def home():
    return render_template('index.html')
    

if __name__ == '__main__':
    app.run(debug=DEBUG, port=PORT)

 
    