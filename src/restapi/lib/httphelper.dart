import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'pizza.dart';

class HttpHelper {
  static final HttpHelper _instance = HttpHelper._internal();
  factory HttpHelper() => _instance;
  HttpHelper._internal();

  // Pastikan URL ini benar sesuai Mock Server kamu
  final String authority = '07l4z.wiremockapi.cloud';

  // ================= GET =================
  Future<List<Pizza>> getPizzaList() async {
    final Uri url = Uri.https(authority, '/pizzalist');
    try {
      final response = await http.get(url);
      if (response.statusCode == HttpStatus.ok) {
        final List jsonResponse = json.decode(response.body);
        return jsonResponse.map((e) => Pizza.fromJson(e)).toList();
      } else {
        print('GET Error: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('GET Connection Error: $e');
      return [];
    }
  }

  // ================= POST =================
  Future<bool> postPizza(Pizza pizza) async {
    final Uri url = Uri.https(authority, '/pizzalist');
    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: json.encode(pizza.toJson()),
      );

      // LOG UNTUK DEBUGGING
      print('POST Status: ${response.statusCode}');
      print('POST Body: ${response.body}');

      return response.statusCode == HttpStatus.ok ||
          response.statusCode == HttpStatus.created;
    } catch (e) {
      print('POST Error: $e');
      return false;
    }
  }

  // ================= PUT =================
  Future<bool> putPizza(Pizza pizza) async {
    // Note: Kadang PUT butuh ID di URL (misal: /pizzalist/1),
    // tapi ini saya ikutin kodemu yg lama (/pizzalist)
    final Uri url = Uri.https(authority, '/pizzalist');

    try {
      final response = await http.put(
        url,
        headers: {"Content-Type": "application/json"},
        body: json.encode(pizza.toJson()),
      );

      // LOG UNTUK DEBUGGING
      print('PUT Status: ${response.statusCode}');
      print('PUT Body: ${response.body}');

      return response.statusCode == HttpStatus.ok;
    } catch (e) {
      print('PUT Error: $e');
      return false;
    }
  }

  // ================= DELETE =================
  Future<bool> deletePizza(int id) async {
    final Uri url = Uri.https(authority, '/pizza/$id');
    try {
      final response = await http.delete(url);
      print('DELETE Status: ${response.statusCode}');
      return response.statusCode == HttpStatus.ok;
    } catch (e) {
      print('DELETE Error: $e');
      return false;
    }
  }
}
