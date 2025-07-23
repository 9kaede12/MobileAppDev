import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(KakeiboApp());
}

class Record {
  DateTime date;
  String category;
  int amount;
  String note;

  Record(
      {required this.date,
        required this.category,
        required this.amount,
        this.note = ''});

  Map<String, dynamic> toJson() => {
    'date': date.toIso8601String(),
    'category': category,
    'amount': amount,
    'note': note,
  };

  factory Record.fromJson(Map<String, dynamic> json) => Record(
    date: DateTime.parse(json['date']),
    category: json['category'],
    amount: json['amount'],
    note: json['note'] ?? '',
  );
}

class KakeiboApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '家計簿アプリ',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Record> records = [];
  final String _recordFile = 'records.json';

  int selectedYear = DateTime.now().year;
  int selectedMonth = DateTime.now().month;

  @override
  void initState() {
    super.initState();
    _loadRecords();
  }

  Future<File> _getLocalFile(String filename) async {
    final dir = await getApplicationDocumentsDirectory();
    return File('${dir.path}/$filename');
  }

  Future<void> _saveRecords() async {
    final file = await _getLocalFile(_recordFile);
    final jsonStr = jsonEncode(records.map((r) => r.toJson()).toList());
    await file.writeAsString(jsonStr);
  }

  Future<void> _loadRecords() async {
    try {
      final file = await _getLocalFile(_recordFile);
      if (!await file.exists()) return;
      final contents = await file.readAsString();
      final jsonData = jsonDecode(contents);
      setState(() {
        records = (jsonData as List).map((e) => Record.fromJson(e)).toList();
        records.sort((a, b) => b.date.compareTo(a.date));
      });
    } catch (e) {
      print('読み込みエラー: $e');
    }
  }

  void _addRecord(Record record) {
    setState(() {
      records.add(record);
      records.sort((a, b) => b.date.compareTo(a.date));
    });
    _saveRecords();
  }

  void _deleteRecord(int index) {
    setState(() {
      records.removeAt(index);
    });
    _saveRecords();
  }

  void _showCupertinoDatePicker() {
    DateTime initialDate = DateTime(selectedYear, selectedMonth, 1);
    showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        height: 250,
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: initialDate,
                minimumDate: DateTime(2000, 1),
                maximumDate: DateTime(2100, 12),
                onDateTimeChanged: (DateTime newDate) {
                  setState(() {
                    selectedYear = newDate.year;
                    selectedMonth = newDate.month;
                  });
                },
              ),
            ),
            CupertinoButton(
              child: Text('閉じる'),
              onPressed: () => Navigator.pop(context),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat('#,###');

    // 選択した年月の収入と支出を抽出
    final filteredRecords = records.where((r) =>
    r.date.year == selectedYear && r.date.month == selectedMonth).toList();

    final incomeRecords = filteredRecords.where((r) => r.amount >= 0).toList();
    final expenseRecords = filteredRecords.where((r) => r.amount < 0).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('家計簿アプリ'),
        actions: [
          IconButton(
            icon: Icon(Icons.bar_chart),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => SummaryPage(records: records)),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                icon: Icon(Icons.calendar_today),
                label: Text('$selectedYear 年 $selectedMonth 月'),
                onPressed: _showCupertinoDatePicker,
              ),
            ],
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.green[50],
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('収入', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green[800])),
                        ),
                        Expanded(
                          child: incomeRecords.isEmpty
                              ? Center(child: Text('収入の記録なし'))
                              : ListView.builder(
                              itemCount: incomeRecords.length,
                              itemBuilder: (_, index) {
                                final r = incomeRecords[index];
                                final amount = formatter.format(r.amount);
                                return ListTile(
                                  title: Text('${r.category}  +$amount 円'),
                                  subtitle: Text('${DateFormat('yyyy/MM/dd').format(r.date)}  ${r.note}'),
                                  trailing: IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () {
                                      _deleteRecord(records.indexOf(r));
                                    },
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
                VerticalDivider(width: 1),
                Expanded(
                  child: Container(
                    color: Colors.red[50],
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('支出', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red[800])),
                        ),
                        Expanded(
                          child: expenseRecords.isEmpty
                              ? Center(child: Text('支出の記録なし'))
                              : ListView.builder(
                              itemCount: expenseRecords.length,
                              itemBuilder: (_, index) {
                                final r = expenseRecords[index];
                                final amount = formatter.format(r.amount.abs());
                                return ListTile(
                                  title: Text('${r.category}  -$amount 円'),
                                  subtitle: Text('${DateFormat('yyyy/MM/dd').format(r.date)}  ${r.note}'),
                                  trailing: IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () {
                                      _deleteRecord(records.indexOf(r));
                                    },
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          final newRecord = await Navigator.push<Record>(
            context,
            MaterialPageRoute(builder: (_) => AddRecordPage()),
          );
          if (newRecord != null) _addRecord(newRecord);
        },
      ),
    );
  }
}

class AddRecordPage extends StatefulWidget {
  @override
  _AddRecordPageState createState() => _AddRecordPageState();
}

class _AddRecordPageState extends State<AddRecordPage> {
  final _formKey = GlobalKey<FormState>();
  DateTime _selectedDate = DateTime.now();
  String _category = '';
  int? _amount;
  String _note = '';
  bool _isIncome = true;
  final String _categoryFile = 'categories.json';

  List<String> _categories = ['食費', '交通費', '給料', '娯楽'];

  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  Future<File> _getLocalFile(String filename) async {
    final dir = await getApplicationDocumentsDirectory();
    return File('${dir.path}/$filename');
  }

  Future<void> _saveCategories() async {
    final file = await _getLocalFile(_categoryFile);
    await file.writeAsString(jsonEncode(_categories));
  }

  Future<void> _loadCategories() async {
    try {
      final file = await _getLocalFile(_categoryFile);
      if (await file.exists()) {
        final contents = await file.readAsString();
        setState(() {
          _categories = List<String>.from(jsonDecode(contents));
        });
      }
    } catch (e) {
      print("カテゴリ読み込みエラー: $e");
    }
  }

  void _showAddCategoryDialog() {
    String newCategory = '';
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('新しいカテゴリを追加'),
        content: TextField(
          autofocus: true,
          decoration: InputDecoration(hintText: 'カテゴリ名'),
          onChanged: (value) => newCategory = value,
        ),
        actions: [
          TextButton(
            child: Text('キャンセル'),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: Text('追加'),
            onPressed: () {
              if (newCategory.isNotEmpty && !_categories.contains(newCategory)) {
                setState(() {
                  _categories.add(newCategory);
                  _category = newCategory;
                });
                _saveCategories();
              }
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  void _openCategoryManagement() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => CategoryManagementPage(categories: _categories),
      ),
    );
    _loadCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('記録追加'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: _openCategoryManagement,
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              ListTile(
                title:
                Text('日付: ${DateFormat('yyyy/MM/dd').format(_selectedDate)}'),
                trailing: Icon(Icons.calendar_today),
                onTap: () async {
                  final d = await showDatePicker(
                    context: context,
                    initialDate: _selectedDate,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (d != null) setState(() => _selectedDate = d);
                },
              ),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'カテゴリ'),
                value: _categories.contains(_category) ? _category : null,
                items: [
                  ..._categories
                      .map((cat) => DropdownMenuItem(value: cat, child: Text(cat))),
                  DropdownMenuItem(
                      value: '新しいカテゴリを追加',
                      child: Text('＋ 新しいカテゴリを追加')),
                ],
                onChanged: (value) {
                  if (value == '新しいカテゴリを追加') {
                    _showAddCategoryDialog();
                  } else {
                    setState(() => _category = value ?? '');
                  }
                },
                validator: (value) =>
                value == null || value.isEmpty ? 'カテゴリを選んでください' : null,
              ),
              SwitchListTile(
                title: Text('収入として記録'),
                value: _isIncome,
                onChanged: (val) => setState(() => _isIncome = val),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: '金額'),
                keyboardType: TextInputType.number,
                validator: (v) => v == null
                    ? '金額を入力してください'
                    : v.isEmpty
                    ? '金額を入力してください'
                    : int.tryParse(v) == null
                    ? '数値で入力してください'
                    : null,
                onSaved: (v) => _amount = int.tryParse(v!),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'メモ'),
                onSaved: (v) => _note = v ?? '',
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text('追加'),
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    _formKey.currentState?.save();
                    Navigator.pop(
                        context,
                        Record(
                          date: _selectedDate,
                          category: _category,
                          amount: _isIncome ? _amount! : -_amount!,
                          note: _note,
                        ));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryManagementPage extends StatefulWidget {
  final List<String> categories;

  CategoryManagementPage({required this.categories});

  @override
  _CategoryManagementPageState createState() => _CategoryManagementPageState();
}

class _CategoryManagementPageState extends State<CategoryManagementPage> {
  late List<String> _categories;

  @override
  void initState() {
    super.initState();
    _categories = List<String>.from(widget.categories);
  }

  Future<File> _getLocalFile(String filename) async {
    final dir = await getApplicationDocumentsDirectory();
    return File('${dir.path}/$filename');
  }

  Future<void> _saveCategories() async {
    final file = await _getLocalFile('categories.json');
    await file.writeAsString(jsonEncode(_categories));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('カテゴリ管理'),
      ),
      body: ListView.builder(
        itemCount: _categories.length,
        itemBuilder: (_, index) {
          return ListTile(
            title: Text(_categories[index]),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  _categories.removeAt(index);
                });
                _saveCategories();
              },
            ),
          );
        },
      ),
    );
  }
}

class SummaryPage extends StatelessWidget {
  final List<Record> records;
  SummaryPage({required this.records});

  Map<String, int> _calculateByMonth() {
    Map<String, int> totals = {};
    for (var r in records) {
      final key = DateFormat('yyyy-MM').format(r.date);
      totals[key] = (totals[key] ?? 0) + r.amount;
    }
    return totals;
  }

  Map<String, int> _calculateByYear() {
    Map<String, int> totals = {};
    for (var r in records) {
      final key = DateFormat('yyyy').format(r.date);
      totals[key] = (totals[key] ?? 0) + r.amount;
    }
    return totals;
  }

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat('#,###');
    final monthly = _calculateByMonth();
    final yearly = _calculateByYear();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('収支集計'),
          bottom: TabBar(tabs: [Tab(text: '月別'), Tab(text: '年別')]),
        ),
        body: TabBarView(
          children: [
            _buildList(monthly, formatter),
            _buildList(yearly, formatter),
          ],
        ),
      ),
    );
  }

  Widget _buildList(Map<String, int> data, NumberFormat formatter) {
    final keys = data.keys.toList()..sort((a, b) => b.compareTo(a));
    return ListView(
      children: keys.map((key) {
        final value = data[key]!;
        final display = formatter.format(value);
        return ListTile(
          title: Text(key),
          trailing: Text('$display 円'),
        );
      }).toList(),
    );
  }
}
