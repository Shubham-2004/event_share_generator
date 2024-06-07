import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:share_card_open/domain/models/apimodels.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ShareDialog extends StatefulWidget {
  final ImageData data;
  final String message;

  const ShareDialog({required this.data, required this.message});

  @override
  _ShareDialogState createState() => _ShareDialogState();
}

class _ShareDialogState extends State<ShareDialog> {
  Color _cardColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: _cardColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
              child: Image.network(widget.data.imageUrl),
            ),
            SizedBox(height: 8.0),
            Text(
              'June 08 , Saturday',
              style: TextStyle(fontSize: 14, color: Colors.blue),
            ),
            SizedBox(height: 8.0),
            Text('Oddo Community Days',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700)),
            SizedBox(height: 8.0),
            Text(
              'YMCA International Center',
              style: TextStyle(
                  fontSize: 14, color: Color.fromARGB(255, 104, 103, 103)),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Image.asset(
                    'assets/logo.png',
                    height: 35,
                    width: 35,
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(
                      Icons.color_lens,
                      size: 35,
                    ),
                    onPressed: () {
                      _pickColor(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _pickColor(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (Color color in [
                      Colors.red,
                      Colors.blue,
                      Colors.green,
                      Colors.yellow,
                      Colors.orange,
                      Colors.purple,
                      Colors.pink,
                      Colors.teal,
                      Colors.cyan,
                      Colors.lime,
                      Colors.brown,
                      Colors.grey,
                    ])
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _cardColor = color;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 4.0),
                          width: 35.0,
                          height: 35.0,
                          decoration: BoxDecoration(
                            color: color,
                            shape: BoxShape.circle,
                            border: _cardColor == color
                                ? Border.all(
                                    color: const Color.fromRGBO(0, 0, 0, 1),
                                    width: 1.5,
                                  )
                                : null,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                child: Text('Done'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
