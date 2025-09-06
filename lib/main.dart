import 'package:flutter/material.dart';

import 'package:fortune_cookie/providers/FortuneModel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => FortuneModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fortune Cookies App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 182, 185, 4),
        ),
      ),
      home: MyHomePage(title: ''),
    );
  }
}

// ignore: must_be_immutable
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //int _counter = 0;

  @override
  Widget build(BuildContext context) {
    final fortune = Provider.of<FortuneModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text("Fortune Cookies"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/Daco_5127713.png',
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  fortune.currentFortune,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),

            ElevatedButton(
              onPressed: () => fortune.getNewFortune(),
              child: Text('Get Fortune'),
            ),
          ],
        ),
      ),
    );
  }
}
