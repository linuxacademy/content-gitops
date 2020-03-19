from flask import Flask
app = Flask(__name__)

@app.route("/")
def hello():
    return "Yo yo yo, whatsup"

@app.route("/food")
def food():
    return "Indian Buffet"

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8000)
