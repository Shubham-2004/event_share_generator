import 'package:flutter/material.dart';
import 'package:share_card_open/presentation/show_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ShowCardScreen(),
      );
}
