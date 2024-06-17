import 'package:discuss_tech/counter.dart';
import 'package:discuss_tech/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: ChangeNotifierProvider(
            create: (context) => Counter(),
            child: const MyHomePage(title: 'Flutter Demo Home Page')));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Count: ${counter.count}',
              style: const TextStyle(fontSize: 24),
            ),
            ElevatedButton(
              onPressed: () => counter.increment(),
              child: const Text('Increment'),
            ),
            TextButton(
              onPressed: () {
                // Error can not find
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (_) => const SecondScreen()));
                //
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => ChangeNotifierProvider(
                            create: (_) => Counter(),
                            child: const SecondScreen())));
              },
              child: const Text('Go to Second Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
