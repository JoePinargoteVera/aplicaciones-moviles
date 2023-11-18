import 'package:flutter/material.dart';
import 'package:asincronia/services/mockapi.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'asincronía',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'asincronía'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isLoading1 = false;
  bool isLoading2 = false;
  bool isLoading3 = false;

  int ferrariResult = 0;
  int hyundaiResult = 0;
  int fisherPriceResult = 0;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));

    // int counter = 0;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                ),
                onPressed: () async {
                  setState(() {
                    isLoading1 = true;
                  });
                  ferrariResult = await MockApi().getFerrariInteger();
                  print('Ferrari: $ferrariResult');
                  setState(() {
                    isLoading1 = false;
                  });
                },
                child: const Icon(
                  Icons.bolt_rounded,
                  size: 80,
                  textDirection: TextDirection.ltr,
                  color: Colors.white,
                ),
              ),
              AnimatedContainer(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(5),
                  duration: isLoading1 ? const Duration(seconds: 1) : Duration.zero,
                  width: isLoading1 ? MediaQuery.of(context).size.width : 0,
                  curve: Curves.easeInOut,
                  color: Colors.yellow),
              Text(
                ferrariResult.toString(),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown,
                ),
                onPressed: () async {
                  setState(() {
                    isLoading2 = true;
                  });
                  hyundaiResult = await MockApi().getHyundaiInteger();
                  print('Hyundai: $hyundaiResult');
                  setState(() {
                    isLoading2 = false;
                  });
                },
                child: const Icon(Icons.airport_shuttle, size: 80),
              ),
              AnimatedContainer(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(5),
                  duration: isLoading2 ? const Duration(seconds: 4) : Duration.zero,
                  width: isLoading2 ? MediaQuery.of(context).size.width : 0,
                  curve: Curves.easeInOut,
                  color: Colors.brown),
              Text(
                hyundaiResult.toString(),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                ),
                onPressed: () async {
                  setState(() {
                    isLoading3 = true;
                  });
                  fisherPriceResult = await MockApi().getFisherPriceInteger();
                  print('Fisher Price: $fisherPriceResult');
                  setState(() {
                    isLoading3 = false;
                  });
                },
                child: const Icon(Icons.directions_run, size: 80),
              ),
              AnimatedContainer(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(5),
                  duration: isLoading3 ? const Duration(seconds: 11) : Duration.zero,
                  width: isLoading3 ? MediaQuery.of(context).size.width : 0,
                  curve: Curves.easeInOut,
                  color: Colors.pink),
              Text(
                fisherPriceResult.toString(),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
