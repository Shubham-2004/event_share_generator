import 'package:flutter/material.dart';
import 'package:share_card_open/domain/models/apimodels.dart';

class ImageCard extends StatelessWidget {
  final ImageData data;
  final Function(BuildContext, ImageData) onShare;

  const ImageCard({required this.data, required this.onShare});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(data.imageUrl),
            ),
            SizedBox(height: 8.0),
            Text(data.title, style: TextStyle(fontSize: 18.0)),
            SizedBox(height: 8.0),
            Text('Date: ${data.date}'),
            SizedBox(height: 8.0),
            Text('Time: ${data.time}'),
            SizedBox(height: 8.0),
            Row(
              children: [
                Spacer(),
                IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () => onShare(context, data),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
