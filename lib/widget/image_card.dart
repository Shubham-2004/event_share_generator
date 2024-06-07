import 'package:flutter/material.dart';
import 'package:share_card_open/domain/models/apimodels.dart';

class ImageCard extends StatefulWidget {
  final ImageData data;
  final Function(BuildContext, ImageData) onShare;

  const ImageCard({required this.data, required this.onShare});

  @override
  State<ImageCard> createState() => _ImageCardState();
}

class _ImageCardState extends State<ImageCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(widget.data.imageUrl),
            ),
            SizedBox(height: 8.0),
            Text(widget.data.title, style: TextStyle(fontSize: 18.0)),
            SizedBox(height: 8.0),
            Text('Date: ${widget.data.date}'),
            SizedBox(height: 8.0),
            Text('Time: ${widget.data.time}'),
            SizedBox(height: 8.0),
            Row(
              children: [
                Spacer(),
                IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () => widget.onShare(context, widget.data),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
