import 'dart:convert';
import 'dart:developer';

import 'package:tp_flutter/core/models/Tag.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static Future<List<Tag>> getTags() async {
    try {
      final response = await http.get(Uri.parse('https://mocki.io/v1/2d4ef870-bcfa-4c28-be39-dd8344826a2f'));

      if (response.statusCode < 200 || response.statusCode >= 400) {
        throw Error();
      }

      final data = json.decode(response.body);
      return (data as List<dynamic>?)?.map((e) => Tag.fromJson(e)).toList() ?? [];
    } catch (error) {
      log('Error while retrieving tags.', error: error);
      rethrow;
    }
  }
}