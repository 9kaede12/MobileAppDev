# 学んだことについて記述していく

## StatelessWidgetクラスについて
<details>
  <summary>内容を見る</summary>

   `StatelessWidget` は、**状態を持たないウィジェット**です。  
   表示内容が固定されていて、ユーザー操作やアプリの状態変化によって変わらない場合に使います。
   
   ---
   
   - 一度描画されたら、基本的に再描画されても同じ内容を表示する
   - 状態を持たないため、処理がシンプルで軽量
   - ボタンやテキスト、アイコンなどの静的な要素に向いている
   
   ---
   
   ### 使用例
   
   ```dart
   class GreetingWidget extends StatelessWidget {
     final String message;
   
     GreetingWidget({required this.message});
   
     @override
     Widget build(BuildContext context) {
       return Text(message, style: TextStyle(fontSize: 24));
     }
   }
   ```
</details>

## StatefulWidgetクラスについて
<details>
  <summary>内容を見る</summary>

   `StatefulWidget` は、状態（State）を持つウィジェットです。  
   ユーザーの操作や時間の経過によって、ウィジェットの内容を変化させたいときに使用します。
   
   ---
   
   `StatefulWidget` は2つのクラスに分かれて構成されます。
   
   1. `StatefulWidget` 本体クラス  
      → ウィジェットのエントリーポイント  
   2. `State` クラス  
      → 実際の状態管理とUI描画を行う `build()` メソッドを持つ
   
   ---
   
   ### 使用例
   
   ```dart
   class CounterPage extends StatefulWidget {
     @override
     _CounterPageState createState() => _CounterPageState();
   }
   
   class _CounterPageState extends State<CounterPage> {
     int _counter = 0;
   
     void _increment() {
       setState(() {
         _counter++;
       });
     }
   
     @override
     Widget build(BuildContext context) {
       return Scaffold(
         appBar: AppBar(title: Text('カウンター')),
         body: Center(child: Text('$_counter', style: TextStyle(fontSize: 32))),
         floatingActionButton: FloatingActionButton(
           onPressed: _increment,
           child: Icon(Icons.add),
         ),
       );
     }
   }
   ```
</details>

## MaterialAppクラスについて
<details>
   <summary>内容</summary>

   MaterialAppクラスとは、マテリアルデザインによるウィジェットの作成を行います。  
   マテリアルデザインとは異なるデバイス・プラットフォームによりユーザーが感じる見た目や感じ方などを同じものとする目的のもと、作られた視覚的デザイン言語と呼ばれています。
</details>

## MainAxisAlignmentとCrossAxisAlignmentについて
<details>
   <summary>内容</summary>
   
   MainAxisAlignmentは、Columnなら縦方向の配置の操作で、Rowなら横方向の配置の操作を行い、  
   CrossAxisAligmentは、Columnなら横方向の配置の操作で、Rowなら縦方向の配置の操作を行うものだとわかりました。
</details>

## RawMaterialButtonについて
<details>
   <summary>内容</summary>

   これは設定が他の要因で影響を受けないボタンで、独立して自由に背景色などを好きなように設定することができます。
</details>

## onPressedとonChangedについて
<details>
   <summary>内容</summary>
   
   onPressedはクリックされたときに処理が実行されるのに対して、onChangedは何かが変化すると処理が実行されます。  
   例えばテキストが変更したりなどリアルタイムに処理を実行することができます。
</details>

## Navigatorクラスについて
<details>
   <summary>内容</summary>

   よくみたことあるやつ。ということは使う頻度がそれだけ高いってことなので、コードを残しておく。[Navigatorクラス](https://github.com/9kaede12/MobileAppDev/blob/main/Navigator.dart)
</details>

## Drawerウィジェットについて
<details>
   <summary>内容</summary>

   これもGithubやYouTubeなんかでよく見るやつ。  
   こちらも、色々なアプリやWebサイトなので見るくらい使う頻度が高いということなので、コードを残しておく。[Drawerウィジェット](https://github.com/9kaede12/MobileAppDev/blob/main/Drawer.dart)
</details>

## Todoリストの作成
<details>
   <summary>内容</summary>

   [flutterstudio](https://flutterstudio.app/)を参考にウィジェットを選びました。  
   ウィジェットを組み合わせていく上で、つまづいたところに関してはchatgptを活用して解決を行なっていきました。  
   ### 現状の機能
   1. チェックボックスの追加
      チェックボックスを追加してチェックをつけるとタスクに取り消し線が入ります。
   2. 削除ボタンの追加
      削除ボタンを追加して終わったタスクを消すことができるようにしました。
   3. ファイルの保存・読み込み処理の追加
      保存と読み込みボタンを追加して、登録したタスクをファイルに保存・読み込みができるようにしました。
   
   実際のコードは[こちら](https://github.com/9kaede12/MobileAppDev/blob/main/TodoList.dart)です。
</details>

## Futureについて
<details>
   <summary>内容</summary>

   FutureとはFuture<File>やFuture<Directory>などで使われるもので、非同期メソッドの戻り値として返される特殊なオブジェクトです。
</details>

## 保存先ディレクトリの取得
<details>
   <summary>内容</summary>

   <pre>final dir = await getApplicationDocumentsDirectory();</pre>
   `getApplicationDocumentsDirectory()` を使って、アプリ専用の「書き込み可能ディレクトリ」のパスを非同期で取得します。
</details>

## 保存処理について
<details>
   <summary>内容</summary>
   
   <pre>
   final jsonStr = jsonEncode(_tasks.map((t) => t.toJson()).toList());
   await file.writeAsString(jsonStr);
   </pre>
   タスクリスト `_tasks` を `toJson()` で Map のリストに変換し、`jsonEncode()` でJSON文字列に変換した後、ファイルに書き込んで保存します。保存完了後は `_showDialog()` によってユーザーに通知されます。
</details>

## 読み込み処理について
<details>
   <summary>内容</summary>
   
   <pre>
   final contents = await file.readAsString();
   final jsonData = jsonDecode(contents);
   _tasks.clear();
   _tasks.addAll((jsonData as List).map((e) => Task.fromJson(e)));
   </pre>
   `tasks.json` を読み込んでJSON文字列を `List<Map>` にデコードし、各要素を `Task.fromJson()` で Task インスタンスに復元します。  
   その後 `_tasks` を更新し、`setState()` によってUIに反映されます。
</details>

