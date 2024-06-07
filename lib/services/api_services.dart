import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:share_card_open/domain/models/apimodels.dart';
import 'package:share_card_open/services/api_endpoints.dart';

class ApiService {
  final BaseUrl _baseUrl;

  ApiService(this._baseUrl);

  Future<ImageData> fetchData() async {
    final response = await http.get(Uri.parse(_baseUrl.url));
    if (response.statusCode == 200) {
      return ImageData.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }
}
