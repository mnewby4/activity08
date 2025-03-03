import 'package:flutter/material.dart';
import 'helper.dart';
DatabaseHelper myHelper = DatabaseHelper();

Future<void> main() async {
  await myHelper.init();
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
      home: const MyHomePage(title: 'Activity 08'),
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
  @override
  void initState() {
    super.initState();
  }

  void _insert() async {
    Map<String, dynamic> myRow = {
      DatabaseHelper.columnName: 'TESTNAME',
      DatabaseHelper.columnAge: 21
    };

    myHelper.insert(myRow);
    print('Insert successful!');
    print(await _display());
  }

  void _delete() async {
    myHelper.delete(14);
    List<Map<String, dynamic>> result = await myHelper.queryAllRows();
    print(await _display());
    /*int _rowCount = await myHelper.queryRowCount();
    print(_rowCount);*/
  }

  Future<List<Map<String, dynamic>>> _display() async {
    return await myHelper.queryAllRows();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _insert, 
              child: Text('Add a row'),
            ),
            ElevatedButton(
              onPressed: _delete, 
              child: Text('Delete a row'),
            ),
          ],
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),*/ // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
