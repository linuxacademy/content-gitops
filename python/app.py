from flask import Flask
app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello LA Student! Again Again 3rd time lucky wow test pull request from master"

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8000)
