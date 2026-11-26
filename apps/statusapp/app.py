import os
from flask import Flask, jsonify

app = Flask(__name__)

VERSION = os.getenv("APP_VERSION", "1.0.0")
ENVIRONMENT = os.getenv("APP_ENV", "development")


@app.route("/app2/")
@app.route("/app2")
def home():
    return f"""
    <!DOCTYPE html>
    <html lang="pl">
    <head>
        <meta charset="UTF-8">
        <title>StatusApp</title>
        <style>
            body {{
                font-family: Arial, sans-serif;
                background: #eef7f0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }}
            .card {{
                background: white;
                padding: 40px;
                border-radius: 12px;
                text-align: center;
                box-shadow: 0 4px 15px #0002;
            }}
            .status {{
                color: green;
                font-weight: bold;
            }}
        </style>
    </head>
    <body>
        <div class="card">
            <h1>StatusApp</h1>
            <p>Application status page</p>
            <p class="status">Service is running</p>
            <p>Environment: {ENVIRONMENT}</p>
            <p>Version: {VERSION}</p>
        </div>
    </body>
    </html>
    """


@app.route("/app2/health")
def health():
    return jsonify(
        status="healthy",
        application="StatusApp",
        version=VERSION
    ), 200


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5002)
