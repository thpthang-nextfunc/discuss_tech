import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Center(
        child: Text(
          // Why can't it listen changes?
          'Count from Second Screen: ${counter.count}',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
