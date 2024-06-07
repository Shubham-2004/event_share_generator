import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:share_card_open/domain/models/apimodels.dart';

class ShareDialog extends StatefulWidget {
  final ImageData data;
  final String message;

  const ShareDialog({required this.data, required this.message});

  @override
  _ShareDialogState createState() => _ShareDialogState();
}

class _ShareDialogState extends State<ShareDialog> {
  String? _backgroundImage = 'assets/download.jpeg'; // Initial image
  Color? _backgroundColor;
  LinearGradient? _backgroundGradient;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Background color for the outer area
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Container(
            height: 600.0,
            width: 400.0,
            decoration: BoxDecoration(
              color: _backgroundColor,
              gradient: _backgroundGradient,
              image: _backgroundImage != null
                  ? DecorationImage(
                      image: AssetImage(_backgroundImage!),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: Column(
              children: [
                Container(
                  height: 500.0, // Height for the dialog content
                  child: Dialog(
                    backgroundColor: Colors.white,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0), // Add padding here
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment
                              .start, // Align contents to the left
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
                              'June 08, Saturday',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.blue),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'Oddo Community Days',
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'YMCA International Center',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 104, 103, 103)),
                            ),
                            Image.asset(
                              'assets/ae-logo-vector.png',
                              height: 85,
                              width: 85,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                // Row for selectable colors
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _backgroundImage = null;
                            _backgroundColor = Colors.blue[300];
                            _backgroundGradient = null;
                          });
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
                                    color: const Color.fromRGBO(0, 0, 0, 1),
                                    width: 1.5,
                                  )
                                : null,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _backgroundImage = null;
                            _backgroundColor = null;
                            _backgroundGradient = LinearGradient(
                              colors: [
                                Colors.blue[900]!,
                                Colors.blue[300]!
                              ], // Dark blue to light blue
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            );
                          });
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
                              ], // Dark blue to light blue
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            shape: BoxShape.circle,
                            border: _backgroundGradient != null
                                ? Border.all(
                                    color: const Color.fromRGBO(0, 0, 0, 1),
                                    width: 1.5,
                                  )
                                : null,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _backgroundImage = 'assets/OIP (1).jpeg';
                            _backgroundColor = null;
                            _backgroundGradient = null;
                          });
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
                            border: _backgroundImage == 'assets/OIP (1).jpeg'
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
                // Row for sharing options
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Share.share(widget.message);
                    },
                    child: Text('Share'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
