import 'package:flutter/material.dart';
import 'package:share_card_open/services/api_endpoints.dart';
import 'package:share_card_open/services/api_services.dart';
import 'package:share_card_open/widget/image_card.dart';
import 'package:share_card_open/widget/share_dialog.dart';
import 'package:share_card_open/domain/models/apimodels.dart';

class ShowCardScreen extends StatefulWidget {
  @override
  _ShowCardScreenState createState() => _ShowCardScreenState();
}

class _ShowCardScreenState extends State<ShowCardScreen> {
  final ApiService _apiService = ApiService(BaseUrl());

  Future<ImageData> _fetchData() => _apiService.fetchData();

  void _onShare(BuildContext context, ImageData data) async {
    final message = '''
      ${data.title}

      Date: ${data.date}
      Time: ${data.time}
      ${data.imageUrl}

      #Flutter #Image #Share
    ''';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ShareDialog(data: data, message: message);
      },
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Image with Share'),
        ),
        body: FutureBuilder<ImageData>(
          future: _fetchData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data!;
              return ImageCard(data: data, onShare: _onShare);
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      );
}
