import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MyApp());
}

class Task {
  String text;
  bool isDone;

  Task(this.text, {this.isDone = false});

  Map<String, dynamic> toJson() => {
    'text': text,
    'isDone': isDone,
  };

  Task.fromJson(Map<String, dynamic> json)
      : text = json['text'],
        isDone = json['isDone'];
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todoリスト',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xff2196f3),
        canvasColor: const Color(0xfffafafa),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Task> _tasks = [];
  final TextEditingController _controller = TextEditingController();
  final String _filename = 'tasks.json';

  @override
  void initState() {
    super.initState();
    _loadTasks(); // 起動時に読み込み
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void buttonPressed() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    setState(() {
      _tasks.add(Task(text));
      _controller.clear();
    });
  }

  void toggleDone(int index, bool? value) {
    setState(() {
      _tasks[index].isDone = value ?? false;
    });
  }

  void deleteTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  Future<File> _getLocalFile() async {
    final dir = await getApplicationDocumentsDirectory();
    return File('${dir.path}/$_filename');
  }

  Future<void> _saveTasks() async {
    final file = await _getLocalFile();
    final jsonStr = jsonEncode(_tasks.map((t) => t.toJson()).toList());
    await file.writeAsString(jsonStr);
    _showDialog("保存しました", "タスクをファイルに保存しました。");
  }

  Future<void> _loadTasks() async {
    try {
      final file = await _getLocalFile();
      if (!(await file.exists())) {
        _showDialog("読み込み失敗", "保存されたタスクが見つかりません。");
        return;
      }
      final contents = await file.readAsString();
      final jsonData = jsonDecode(contents);
      setState(() {
        _tasks.clear();
        _tasks.addAll((jsonData as List).map((e) => Task.fromJson(e)));
      });
      _showDialog("読み込み成功", "タスクを読み込みました。");
    } catch (e) {
      _showDialog("エラー", "読み込み中にエラーが発生しました。\n$e");
    }
  }

  void _showDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          ElevatedButton(
            child: Text("OK"),
            onPressed: () => Navigator.of(context).pop(),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todoアプリ'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(height: 20),
                ..._tasks.asMap().entries.map((entry) {
                  final idx = entry.key;
                  final task = entry.value;
                  return Row(
                    children: [
                      Expanded(
                        child: CheckboxListTile(
                          title: Text(
                            task.text,
                            style: TextStyle(
                              fontSize: 28.0,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Roboto",
                              decoration: task.isDone
                                  ? TextDecoration.lineThrough
                                  : null,
                              color:
                              task.isDone ? Colors.grey : Colors.black,
                            ),
                          ),
                          value: task.isDone,
                          onChanged: (bool? value) => toggleDone(idx, value),
                          controlAffinity: ListTileControlAffinity.leading,
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => deleteTask(idx),
                      ),
                    ],
                  );
                }).toList(),
                SizedBox(height: 20),
                TextField(
                  controller: _controller,
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Roboto",
                  ),
                  decoration: InputDecoration(
                    hintText: 'Enter task',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  child: Text(
                    "＋",
                    style: TextStyle(
                      fontSize: 32.0,
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w400,
                      fontFamily: "Roboto",
                    ),
                  ),
                  onPressed: buttonPressed,
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        child: Text("保存"),
                        onPressed: _saveTasks,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        child: Text("読み込み"),
                        onPressed: _loadTasks,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
