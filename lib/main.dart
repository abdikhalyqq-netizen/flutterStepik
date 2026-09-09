import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  bool _loading = false;
  double _progressValue = 0.0;

  @override
  void initState() {
    _loading = false;
    _progressValue = 0.0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: Text(
            "salem alem",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight(500),
            ),
          ),
        ),
        backgroundColor: Colors.blue,
        body: Center(
          child: Container(
            padding: EdgeInsets.all(30),
            child: _loading
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "inst:@alikoshhrd",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 38,
                          fontWeight: FontWeight(700),
                        ),
                      ),
                      Container(
                        child: Image(
                          image: AssetImage('assets/images/inst.jpeg'),
                        ),
                      ),
                      Text(
                        "My Instagram",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight(700),
                        ),
                      ),
                      LinearProgressIndicator(
                        value: _progressValue,
                        color: const Color.fromARGB(255, 20, 20, 22),
                      ),
                      Text(
                        "you have ${_progressValue * 100} seconds",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight(700),
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      Text(
                        "kalaisyyn?",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight(700),
                        ),
                      ),
                      Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage("assets/images/ali.jpeg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        "alikoshhrd",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "If you want to see my Instagram",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      SizedBox(
                        width: 250,
                        height: 60,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _loading = !_loading;

                              _updateProgress();
                            });
                          },
                          child: Text(
                            "See my Instagram",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight(800),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _loading = !_loading;
              _updateProgress();
            });
          },
          child: Icon(Icons.present_to_all),
        ),
      ),
    );
  }

  void _updateProgress() {
    const oneSec = const Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer t) {
      setState(() {
        _progressValue += 0.2;
        if (_progressValue.toStringAsFixed(1) == '1.0') {
          _loading = false;
          _progressValue = 0.0;
          return;
        }
      });
    });
  }
}
