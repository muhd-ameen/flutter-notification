import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final String? payload;
  const SecondPage({
    Key? key,
    required this.payload,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text("payload Page"),
      ),
      body: Center(
        child: Text(payload ?? 'Ajmals'),
      ),
    );
  }
}
