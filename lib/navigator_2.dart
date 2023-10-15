import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  final _navigatorKey = GlobalKey<NavigatorState>();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      home: const HomePage(),
      routes: {
        '/detail': (context) => const DetailPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Push the DetailPage onto the navigation stack.
            Navigator.pushNamed(context, '/detail');
          },
          child: const Text('Go to Detail'),
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Pop the DetailPage from the navigation stack.
            Navigator.pop(context);
          },
          child: const Text('Go Home'),
        ),
      ),
    );
  }
}

// void main() {
//   setUrlStrategy(PathUrlStrategy());
//   runApp(MyApp());
// }
