from flask import Flask, render_template, redirect, url_for
import os


DEBUG = os.environ.get('DEBUG')
PORT = os.environ.get('PORT')

app = Flask(__name__)


@app.route('/')
def home():
    return redirect(url_for('productos'))


@app.route('/productos')
def productos():

    products = [
        {"name": "PS5", "stock": True},
        {"name": "Switch 2", "stock": False},
        {"name": "PS5 Pro", "stock": False},
        {"name": "XBOX", "stock": True},
    ]

    return render_template('productos.html', list=products)


@app.route('/contacto')
def caca():
    return None


if __name__ == '__main__':
    app.run(debug=DEBUG, port=PORT)
