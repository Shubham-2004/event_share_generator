import 'package:flutter/material.dart';
import 'package:share_card_open/domain/models/apimodels.dart';

class ImageCard extends StatelessWidget {
  final ImageData data;
  final Function(BuildContext, ImageData) onShare;
  final String? backgroundImage;
  final Color? backgroundColor;
  final LinearGradient? backgroundGradient;

  const ImageCard({
    required this.data,
    required this.onShare,
    this.backgroundImage,
    this.backgroundColor,
    this.backgroundGradient,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          gradient: backgroundGradient,
          image: backgroundImage != null
              ? DecorationImage(
                  image: AssetImage(backgroundImage!),
                  fit: BoxFit.cover,
                )
              : null,
        ),
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
      ),
    );
  }
}
