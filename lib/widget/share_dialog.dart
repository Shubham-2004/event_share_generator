import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';
import 'package:share_card_open/domain/models/apimodels.dart';
import 'package:flutter/services.dart'; // For clipboard functionality

class ShareDialog extends StatefulWidget {
  final String imageUrl;
  final String message;
  final ImageData data; // Ensure this is the correct type for your model

  const ShareDialog({
    required this.imageUrl,
    required this.message,
    required this.data,
  });

  @override
  _ShareDialogState createState() => _ShareDialogState();
}

class _ShareDialogState extends State<ShareDialog> {
  String? _backgroundImage = ''; // Initial image
  Color? _backgroundColor;
  LinearGradient? _backgroundGradient;
  final GlobalKey _globalKey = GlobalKey();
  bool _isSharing = false;
  bool _isImageBackground = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _ensureWidgetIsPainted();
      // _shareContent(); // Comment this line to prevent automatic sharing
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Share Image'),
        backgroundColor: const Color.fromARGB(255, 252, 252, 252),
      ),
      backgroundColor: Color.fromARGB(255, 191, 250, 114),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Expanded(
                            child: RepaintBoundary(
                              key: _globalKey,
                              child: Card(
                                color: _backgroundColor,
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: _backgroundGradient,
                                    image: _backgroundImage != null
                                        ? DecorationImage(
                                            image:
                                                AssetImage(_backgroundImage!),
                                            fit: BoxFit.cover,
                                          )
                                        : null,
                                  ),
                                  // Optional color overlay for better readability
                                  child: Padding(
                                    padding: const EdgeInsets.all(24.0),
                                    child: Transform.rotate(
                                      angle: _isImageBackground ? 90 : 0.0,
                                      child: Card(
                                        color: Colors
                                            .transparent, // Set card color with some transparency
                                        elevation:
                                            0.1, // Set elevation for shadow effect
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              10), // Adjust border radius as needed
                                        ),
                                        // Rotate slightly if image is selected
                                        child: Padding(
                                          padding: const EdgeInsets.all(
                                              16.0), // Adjust padding as needed
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                child: Image.network(
                                                  widget.imageUrl,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              SizedBox(height: 8.0),
                                              Text(
                                                'June 08, Saturday',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              SizedBox(height: 8.0),
                                              Text(
                                                'Oddo Community Days',
                                                style: TextStyle(
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              SizedBox(height: 8.0),
                                              Text(
                                                'YMCA International Center',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Image.asset(
                                                'assets/ae-logo-vector.png',
                                                height: 75,
                                                width: 75,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 16.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  _updateBackground(
                                      null, Colors.blue[300], null);
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 4.0),
                                  width: 35.0,
                                  height: 35.0,
                                  decoration: BoxDecoration(
                                    color: Colors.blue[300],
                                    shape: BoxShape.circle,
                                    border: _backgroundColor == Colors.blue[300]
                                        ? Border.all(
                                            color: const Color.fromRGBO(
                                                0, 0, 0, 1),
                                            width: 1.5,
                                          )
                                        : null,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  _updateBackground(
                                    null,
                                    null,
                                    LinearGradient(
                                      colors: [
                                        Colors.blue[900]!,
                                        Colors.blue[300]!
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                  );
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 4.0),
                                  width: 35.0,
                                  height: 35.0,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.blue[900]!,
                                        Colors.blue[300]!
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    shape: BoxShape.circle,
                                    border: _backgroundGradient != null
                                        ? Border.all(
                                            color: const Color.fromRGBO(
                                                0, 0, 0, 1),
                                            width: 1.5,
                                          )
                                        : null,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  _updateBackground(
                                      'assets/OIP (1).jpeg', null, null);
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 4.0),
                                  width: 35.0,
                                  height: 35.0,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('assets/OIP (1).jpeg'),
                                      fit: BoxFit.cover,
                                    ),
                                    shape: BoxShape.circle,
                                    border: _backgroundImage ==
                                            'assets/OIP (1).jpeg'
                                        ? Border.all(
                                            color: const Color.fromRGBO(
                                                0, 0, 0, 1),
                                            width: 1.5,
                                          )
                                        : null,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 120,
            color: Colors.black,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.copy,
                    color: Colors.white,
                    size: 28,
                  ),
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: widget.imageUrl))
                        .then((_) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Link copied to clipboard!')),
                      );
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.snapchat, color: Colors.yellow, size: 28),
                  onPressed: () {
                    _shareContent(); // Implement Snapchat share functionality
                  },
                ),
                IconButton(
                  icon: Icon(Icons.message, color: Colors.blue, size: 28),
                  onPressed: () {
                    _shareContent(); // Implement Messages share functionality
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.share,
                    color: Colors.white,
                    size: 28,
                  ),
                  onPressed: () {
                    _shareContent(); // General share functionality
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _ensureWidgetIsPainted() async {
    RenderRepaintBoundary boundary =
        _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    while (boundary.debugNeedsPaint) {
      await Future.delayed(Duration(milliseconds: 20));
      boundary = _globalKey.currentContext!.findRenderObject()
          as RenderRepaintBoundary;
    }
  }

  Future<void> _shareContent() async {
    setState(() {
      _isSharing = true;
    });
    try {
      RenderRepaintBoundary boundary = _globalKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      final tempDir = await getTemporaryDirectory();
      final file = await File('${tempDir.path}/image.png').create();
      await file.writeAsBytes(pngBytes);

      await Share.shareFiles([file.path], text: widget.message);
    } catch (e) {
      print("Error sharing content: ${e.toString()}");
    } finally {
      setState(() {
        _isSharing = false;
      });
    }
  }

  void _updateBackground(
      String? image, Color? color, LinearGradient? gradient) {
    setState(() {
      _backgroundImage = image;
      _backgroundColor = color;
      _backgroundGradient = gradient;
    });
  }
}
