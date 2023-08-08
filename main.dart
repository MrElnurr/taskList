import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> items = [];
  TextEditingController _textEditingController = TextEditingController();

  bool isDelete = false;

  void _addItem() {
    setState(() {
      items.add(_textEditingController.text);
      _textEditingController.clear();
    });
  }

  void _removeItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task'),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  isDelete = !isDelete;
                });
              },
              icon: Icon(Icons.visibility)),
          IconButton(
              onPressed: () {
                setState(() {
                  items.clear();
                });
              },
              icon: Icon(Icons.delete))
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: _addItem,
                  icon: Icon(Icons.add),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                    title: Text(items[index]),
                    trailing: isDelete
                        ? IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () => _removeItem(index),
                          )
                        : null);
              },
            ),
          ),
        ],
      ),
    );
  }
}
