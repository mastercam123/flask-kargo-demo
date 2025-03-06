from flask import Flask
import os

app = Flask(__name__)

@app.route("/")
def home():
    image_version = os.getenv("IMAGE_VERSION", "unknown")
    return "Hello from Flask in Kargo for 1st time ! 🚀 Version: " + image_version

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
