import 'package:flutter/material.dart';

class DasganuMaharajScreen extends StatefulWidget {
  const DasganuMaharajScreen({super.key});

  @override
  State<DasganuMaharajScreen> createState() => _DasganuMaharajScreenState();
}

class _DasganuMaharajScreenState extends State<DasganuMaharajScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dasganu Maharaj')),
      body: Center(child: Text('Welcome to the Dasganu Maharaj Screen')),
    );
  }
}
