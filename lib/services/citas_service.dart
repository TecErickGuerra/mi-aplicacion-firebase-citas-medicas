import 'package:cloud_firestore/cloud_firestore.dart';

class CitasService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String collection = 'citas_prueba';

  // Agregar la cita de prueba específica que solicita el profesor
  Future<void> agregarCitaPrueba() async {
    try {
      await _firestore.collection(collection).add({
        'paciente': 'Erick Estrella',
        'sintoma': 'Dolor de cabeza',
        'fecha': '2025-09-20',
        'timestamp': FieldValue.serverTimestamp(),
      });
      print('Cita de prueba agregada exitosamente');
    } catch (e) {
      print('Error al agregar cita de prueba: $e');
      rethrow;
    }
  }

  // Obtener todas las citas en tiempo real
  Stream<QuerySnapshot> obtenerCitas() {
    return _firestore
        .collection(collection)
        .orderBy('timestamp', descending: true)
        .snapshots();
  }

  // Agregar cita personalizada
  Future<void> agregarCita({
    required String paciente,
    required String sintoma,
    required String fecha,
  }) async {
    try {
      await _firestore.collection(collection).add({
        'paciente': paciente,
        'sintoma': sintoma,
        'fecha': fecha,
        'timestamp': FieldValue.serverTimestamp(),
      });
      print('Cita agregada exitosamente: $paciente');
    } catch (e) {
      print('Error al agregar cita: $e');
      rethrow;
    }
  }

  // Eliminar una cita
  Future<void> eliminarCita(String documentId) async {
    try {
      await _firestore.collection(collection).doc(documentId).delete();
      print('Cita eliminada exitosamente: $documentId');
    } catch (e) {
      print('Error al eliminar cita: $e');
      rethrow;
    }
  }

  // Método para verificar conexión con Firebase
  Future<bool> verificarConexion() async {
    try {
      await _firestore.collection('test').limit(1).get();
      return true;
    } catch (e) {
      print('Error de conexión con Firebase: $e');
      return false;
    }
  }
}