import 'package:flutter/material.dart';

class AudiosScreen extends StatefulWidget {
  const AudiosScreen({super.key});

  @override
  State<AudiosScreen> createState() => _AudiosScreenState();
}

class _AudiosScreenState extends State<AudiosScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Welcome to the Audios Screen'));
  }
}
