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
        child: Column(
          children: [
            Text(
              'Count from Second Screen: ${counter.count}',
              style: const TextStyle(fontSize: 24),
            ),
            //
            // What are differences between read, watch, of?
            // .of == watch?
            // .of can control list, but watch not?
            //
            /*
            
            Use context.watch for most cases where you need to display provider data and want the widget to rebuild on changes.

            Use context.read when you only need the current value and don't care about future updates (e.g., inside event handlers).

            So read is a better choice? How to test this?

            */
            Text(
              'Read: ${context.read<Counter>().count}',
              style: const TextStyle(fontSize: 24),
            ),
            Text(
              'Watch: ${context.watch<Counter>().count}',
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
