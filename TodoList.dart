import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Task {
  String text;
  bool isDone;
  Task(this.text, {this.isDone = false});
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
                // タスクリスト表示（削除ボタン付き）
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
                // 入力欄
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
                // 追加ボタン
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
