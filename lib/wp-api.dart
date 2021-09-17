import 'dart:convert';

import 'package:http/http.dart' as http;

Future<List> fetchPost() async {
  final response = await http.get(
      Uri.parse('https://codersangam.com/index.php/wp-json/wp/v2/posts?_embed'),
      headers: {"Accept": "application/json"});
  var data = jsonDecode(response.body);
  return data;
}

Future fetchPostImage(href) async {
  final response = await http
      .get(Uri.parse('href'), headers: {"Accept": "application/json"});
  var data = jsonDecode(response.body);
  return data;
}
