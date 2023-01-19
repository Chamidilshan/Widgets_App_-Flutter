import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Open Bottom Sheet'),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(40.0),
                        bottom: Radius.circular(40.0),
                      )
                    ),
                    builder: (context) => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('This is bottom sheet'),
                        SizedBox(
                          height: 20.0,
                        ),
                  Center(
                    child: ElevatedButton(
                      child: Text('Close'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                        SizedBox(
                          height: 10.0,
                        ),
                        ExpansionTile(
                          title: Text(
                            'Android',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          children: [
                            ListTile(title: Text('Java', style: TextStyle(fontSize: 10.0),),
                              onTap: () {},
                            ),
                            ListTile(title: Text('Kotlin', style: TextStyle(fontSize: 10.0),),
                              onTap: () {},
                            ),
                            ListTile(title: Text('Flutter', style: TextStyle(fontSize: 10.0),),
                              onTap: () {},
                            ),
                            ListTile(title: Text('Kotlin', style: TextStyle(fontSize: 10.0),),
                              onTap: () {},
                            ),
                          ],
                          onExpansionChanged: (isExpanded){
                            print('Expanded: $isExpanded');
                          },
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        CheckboxListTile(
                          title: Text(
                            'This app has more features'
                          ),
                          controlAffinity: ListTileControlAffinity.leading,
                          value: isChecked, onChanged: (value){
                          setState(() {
                            isChecked = value!;
                          });
                        },
                        activeColor: Colors.red,
                          checkColor: Colors.white,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text(
                                      'Welcome To Flutter'
                                    ),
                                    content: Text(
                                      'Flutter is an open source UI toolkit for building beautiful, natively compiled applications for mobile, web, desktop, and embedded devices from a single codebase. Flutter is primarily funded by Google with contributors from all around the world.'
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                            'Cancel'
                                        ),
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                              'OK'
                                          ),
                                      ),
                                    ],
                                  ),
                              );
                            },
                            child: Text(
                              'Open Dialog'
                            ),
                        ),
                      ],
                    ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
