import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

/// アプリのルートウィジェット
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'タスク管理アプリ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFF2196f3),
        canvasColor: const Color(0xFFfafafa),
      ),
      home: MyHomePage(),
    );
  }
}

/// タスクを表すモデルクラス
class Task {
  String text;        // タスクの内容
  bool done;          // 実行済みかどうか
  DateTime date;      // 日付（追加日時）
  TimeOfDay time;     // 時刻（追加時間）

  Task({
    required this.text,
    this.done = false,
    required this.date,
    required this.time,
  });
}

/// ホーム画面のStatefulWidget
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

/// ホーム画面の状態管理クラス
class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  List<Task> tasks = [];             // タスクのリスト
  TextEditingController controller = TextEditingController();  // 入力用コントローラ

  DateTime? selectedDate;           // 選択された日付
  TimeOfDay? selectedTime;          // 選択された時間

  late TabController tabController;  // タブ切り替え用コントローラ

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    tabController.dispose();
    super.dispose();
  }

  /// FloatingActionButton押下時に呼ばれる。新規タスク追加用の入力ダイアログを表示する。
  void fabPressed() {
    selectedDate = DateTime.now();
    selectedTime = TimeOfDay.now();

    controller.clear();

    showDialog(
      context: context,
      builder: (context) {
        return _buildTaskDialog(
          title: 'タスク追加',
          onSubmit: submitTask,
        );
      },
    );
  }

  /// 新規タスク追加処理
  void submitTask() {
    String text = controller.text.trim();

    if (text.isEmpty) {
      // 空文字は追加しない
      return;
    }
    if (selectedDate == null || selectedTime == null) {
      selectedDate ??= DateTime.now();
      selectedTime ??= TimeOfDay.now();
    }

    setState(() {
      tasks.add(Task(
        text: text,
        done: false,
        date: selectedDate!,
        time: selectedTime!,
      ));
    });

    Navigator.pop(context);
  }

  /// タスクの実行済み状態をトグルする
  void toggleDone(int index, bool? value) {
    if (value == null) return;
    setState(() {
      tasks[index].done = value;
    });
  }

  /// 実行済みタスクの削除処理（確認ダイアログ付き）
  void deleteTask(int index) async {
    bool? confirmed = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('削除確認'),
          content: Text('本当にこのタスクを削除しますか？'),
          actions: [
            TextButton(
              child: Text('キャンセル'),
              onPressed: () => Navigator.pop(context, false),
            ),
            ElevatedButton(
              child: Text('削除'),
              onPressed: () => Navigator.pop(context, true),
            ),
          ],
        );
      },
    );

    if (confirmed == true) {
      setState(() {
        tasks.removeAt(index);
      });
    }
  }

  /// タスク編集用ダイアログ表示
  /// 引数indexは編集対象のタスクのリストインデックス
  void editTask(int index) {
    Task task = tasks[index];
    // 編集内容をコントローラ・変数にセット
    controller.text = task.text;
    selectedDate = task.date;
    selectedTime = task.time;

    showDialog(
      context: context,
      builder: (context) {
        return _buildTaskDialog(
          title: 'タスク編集',
          onSubmit: () {
            String text = controller.text.trim();
            if (text.isEmpty) {
              // 空なら更新しない（閉じるだけ）
              Navigator.pop(context);
              return;
            }
            if (selectedDate == null || selectedTime == null) {
              selectedDate ??= DateTime.now();
              selectedTime ??= TimeOfDay.now();
            }

            setState(() {
              tasks[index].text = text;
              tasks[index].date = selectedDate!;
              tasks[index].time = selectedTime!;
            });

            Navigator.pop(context);
          },
        );
      },
    );
  }

  /// タスク追加・編集用ダイアログの共通ウィジェット
  /// title: ダイアログタイトル
  /// onSubmit: 決定ボタン押下時の処理
  Widget _buildTaskDialog({
    required String title,
    required VoidCallback onSubmit,
  }) {
    return AlertDialog(
      title: Text(title),
      content: StatefulBuilder(
        builder: (context, setStateDialog) {
          // ダイアログ内で日付・時間選択のUIの状態更新用
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                autofocus: true,
                controller: controller,
                maxLines: null,
                onSubmitted: (_) => onSubmit(),
              ),
              SizedBox(height: 12),

              // 日付選択ボタン
              TextButton.icon(
                icon: Icon(Icons.date_range),
                label: Text(selectedDate != null
                    ? "${selectedDate!.year}/${selectedDate!.month}/${selectedDate!.day}"
                    : '日付を選択'),
                onPressed: () async {
                  DateTime? date = await showDatePicker(
                    context: context,
                    initialDate: selectedDate ?? DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (date != null) {
                    setStateDialog(() {
                      selectedDate = date;
                    });
                  }
                },
              ),

              // 時間選択ボタン
              TextButton.icon(
                icon: Icon(Icons.access_time),
                label: Text(selectedTime != null
                    ? selectedTime!.format(context)
                    : '時刻を選択'),
                onPressed: () async {
                  TimeOfDay? time = await showTimePicker(
                    context: context,
                    initialTime: selectedTime ?? TimeOfDay.now(),
                  );
                  if (time != null) {
                    setStateDialog(() {
                      selectedTime = time;
                    });
                  }
                },
              ),
            ],
          );
        },
      ),
      actions: [
        TextButton(
          child: Text('キャンセル'),
          onPressed: () => Navigator.pop(context),
        ),
        ElevatedButton(
          child: Text('決定'),
          onPressed: onSubmit,
        ),
      ],
    );
  }

  /// タスク一覧ウィジェット（チェックボックス・削除ボタン付き）
  Widget taskListView(bool doneFilter) {
    final filteredTasks = tasks
        .asMap()
        .entries
        .where((entry) => entry.value.done == doneFilter)
        .toList();

    if (filteredTasks.isEmpty) {
      return Center(child: Text(doneFilter ? '実行済みのタスクはありません' : '現在のタスクはありません'));
    }

    return ListView.builder(
      itemCount: filteredTasks.length,
      itemBuilder: (context, i) {
        final index = filteredTasks[i].key;
        final task = filteredTasks[i].value;

        return ListTile(
          leading: Checkbox(
            value: task.done,
            onChanged: (doneFilter)
                ? null // 実行済みタスクのチェックボックスは操作不可
                : (value) => toggleDone(index, value),
          ),

          /// タスクテキスト部分をタップすると編集ダイアログを開く
          title: GestureDetector(
            onTap: doneFilter ? null : () => editTask(index),
            child: Text(task.text),
          ),

          subtitle: Text(
              "${task.date.year}/${task.date.month}/${task.date.day} ${task.time.format(context)}"),
          trailing: doneFilter
              ? IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => deleteTask(index),
            tooltip: '削除',
          )
              : null,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('タスク管理アプリ'),
        bottom: TabBar(
          controller: tabController,
          tabs: [
            Tab(text: '現在のタスク'),
            Tab(text: '実行済みのタスク'),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          taskListView(false),
          taskListView(true),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: fabPressed,
        tooltip: 'タスク追加',
      ),
    );
  }
}
