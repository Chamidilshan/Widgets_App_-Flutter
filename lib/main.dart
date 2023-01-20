import 'package:curved_navigation_bar/curved_navigation_bar.dart';
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
      debugShowCheckedModeBanner: false,
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
  List<String> items = ['Dart', 'Kotlin', 'Java'];
  String? selectedItem = 'Dart';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Widgets App'),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                  context: context,
                    delegate: MySearchDelegate(),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications_active),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: Colors.deepPurple,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.deepPurple,
        color: Colors.deepPurple.shade200,
        animationDuration: Duration(microseconds: 300),
        onTap: (index) {
          print(index);
        },
        items: [
          Icon(Icons.home),
          Icon(Icons.favorite),
          Icon(Icons.settings)
        ],
      ),
      body: SafeArea(
        child: Center(
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
                          DropdownButton<String>(
                            value: selectedItem,
                              items: items.map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(item),),
                              ).toList(),
                              onChanged: (item) => {
                              setState(() => selectedItem = item)
                              }
                          )
                        ],
                      ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MySearchDelegate extends SearchDelegate{
  List<String> suggestions = [
    'Sri Lanka',
    'India',
    'Nepal',
    'Pakistan',
    'Bangaladesh'
  ];
  List<String> searchResults = [
    'Sri Lanka',
    'India',
    'Nepal',
    'Pakistan',
    'Bangaladesh'
  ];

  @override
  Widget? buildLeading(BuildContext context){
    IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    IconButton(
      icon: Icon(Icons.clear),
      onPressed: () {
        if(query.isEmpty){
          close(context, null);
        } else{
          query = '';
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = searchResults.where((searchResult){
      final result = searchResult.toLowerCase();
      final input = query.toLowerCase();

      return result.contains(input);
    }).toList();

    return ListView.builder(
      itemCount: suggestions.length,
        itemBuilder: (context, index){
        final suggestion = suggestions[index];

        return ListTile(
          title: Text(suggestion),
          onTap: () {
            query = suggestion;

            showResults(context);
          },
        );
        }
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }
}