from flask import Flask
app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello World!, hello mrwillbarnz"
    return "This is the simplest Python App ever!"
    return "This is a new line!"
    return "This is another line!"

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8000)
