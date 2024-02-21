from flask import Flask, request, jsonify
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

@app.route('/registrar_persona', methods=['POST'])
def registrar_persona():
    if request.method == 'POST':
        datos = request.get_json()  # Obtener los datos JSON enviados en la solicitud
        if datos:
            print("Datos recibidos:", datos)
            return jsonify({"message": "Datos recibidos correctamente"}), 200
        else:
            return jsonify({"error": "No se recibieron datos JSON"}), 400
        
@app.route('/iniciar_sesion', methods=['POST'])
def iniciar_sesion():
    if request.method == 'POST':
        datos = request.get_json()  # Obtener los datos JSON enviados en la solicitud
        if datos and 'usuario' in datos and 'contrasena' in datos:
            usuario = datos['usuario']
            contrasena = datos['contrasena']
            # Aquí puedes realizar la autenticación del usuario con el correo y contraseña recibidos
            print("Datos de inicio de sesión recibidos - Correo:", usuario, ", contraseña:", contrasena)
            return jsonify({"message": "Datos de inicio de sesión recibidos correctamente"}), 200
        else:
            return jsonify({"error": "Datos de inicio de sesión incompletos o no válidos"}), 400

@app.route('/registrar_usuario', methods=['POST'])
def registrar_usuario():
    if request.method == 'POST':
        datos = request.get_json()  # Obtener los datos JSON enviados en la solicitud
        if datos:
            print("Datos recibidos:", datos)
            return jsonify({"message": "Datos recibidos correctamente"}), 200
        else:
            return jsonify({"error": "No se recibieron datos JSON"}), 400

if __name__ == '__main__':
    app.run(debug=True)