import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

import '../models/motel.dart';

class MotelService {
  final String apiUrl;
  final Client client;

  MotelService({
    this.apiUrl = 'https://www.jsonkeeper.com/b/1IXK',
    Client? client,
  }) : client = client ?? Client();

  Future<List<Motel>> getMotels() async {
    try {
      final response = await client.get(Uri.parse(apiUrl), headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=utf-8'
      });

      if (response.statusCode != 200) {
        throw HttpException('Failed to load motels: ${response.statusCode}');
      }

      final data = json.decode(response.body);
      final List<dynamic> motelsList =
          data['data']?['moteis'] as List<dynamic>? ?? [];

      return motelsList
          .map((json) => Motel.fromJson(json as Map<String, dynamic>))
          .toList();
    } on FormatException catch (e) {
      throw Exception('Invalid JSON format: $e');
    } on HttpException catch (e) {
      throw Exception('HTTP error: $e');
    } catch (e) {
      throw Exception('Failed to load motels: $e');
    }
  }
}
