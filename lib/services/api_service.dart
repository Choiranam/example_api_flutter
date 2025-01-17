import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/post_model.dart';

class ApiService {
  final String baseUrl = 'https://restcountries.com/v3.1/all';

  Future<List<PostModel>> fetchPosts() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((json) => PostModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load countries');
    }
  }
}
