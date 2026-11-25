import os
from flask import Flask, jsonify

app = Flask(__name__)

VERSION = os.getenv("APP_VERSION", "1.0.0")
ENVIRONMENT = os.getenv("APP_ENV", "development")


@app.route("/app1/")
@app.route("/app1")
def home():
    return f"""
    <!DOCTYPE html>
    <html lang="pl">
    <head>
        <meta charset="UTF-8">
        <title>InfoApp</title>
        <style>
            body {{
                font-family: Arial, sans-serif;
                background: #eef2f7;
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
        </style>
    </head>
    <body>
        <div class="card">
            <h1>InfoApp</h1>
            <p>Application information page</p>
            <p>Environment: {ENVIRONMENT}</p>
            <p>Version: {VERSION}</p>
        </div>
    </body>
    </html>
    """


@app.route("/app1/health")
def health():
    return jsonify(
        status="healthy",
        application="InfoApp",
        version=VERSION
    ), 200


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5001)
