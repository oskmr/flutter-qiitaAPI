import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:qiita/article.dart';

class GetArticle {
  Future<List<Article>> getArticle() async {
    final response = await http.get(
      Uri.parse (
          'https://qiita.com/api/v2/tags/flutter/items?page=1&per_page=15'
      ),
    );
    if (response.statusCode == 200) {
      List<dynamic> objects = jsonDecode(response.body);
      return objects.map((object) => Article.fromMap(object)).toList();
    } else {
      throw Exception('Failed to Load Article');
    }
  }
}