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

   なぜ setState() が必要か  
   Flutter は状態が変更されたことを自動では検出しません。  
   手動で setState() を呼び出して「UIを更新してください」と伝える必要があります。

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
  <summary>内容を見る</summary>

  `MaterialApp` は、Flutterでマテリアルデザインを適用したアプリケーションを作成するための基本ウィジェットです。  
  画面全体のテーマ設定やナビゲーション、ローカライズなどの機能を包括的に提供します。
  
  ---
  
  ### 主な役割・特徴
  
  - マテリアルデザインに基づいたUIコンポーネントの提供  
  - アプリのテーマ設定（色、フォントなど）の管理  
  - ルーティング（画面遷移）を簡単に設定可能  
  - ローカライズ（多言語対応）機能のサポート  
  - アプリ全体の設定を一括管理
  
  ---
  
  ### 使用例
  
  ```dart
  MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: MyHomePage(),
    routes: {
      '/settings': (context) => SettingsPage(),
    },
  );
  ```
</details>

## MainAxisAlignment と CrossAxisAlignment について

<details>
  <summary>内容を見る</summary>

Flutterのレイアウトウィジェット、特に `Row` と `Column` の中で、子ウィジェットの配置を制御するためのプロパティです。

---

### MainAxisAlignment

- `Row` の場合：**水平方向（横方向）**の配置を制御  
- `Column` の場合：**垂直方向（縦方向）**の配置を制御

例：

- `MainAxisAlignment.start`：先頭から詰める  
- `MainAxisAlignment.center`：中央に配置  
- `MainAxisAlignment.end`：末尾に配置  
- `MainAxisAlignment.spaceBetween`：両端に寄せ、間隔を均等に空ける  
- `MainAxisAlignment.spaceAround`：間隔を均等に空ける（両端も余白あり）  
- `MainAxisAlignment.spaceEvenly`：均等な間隔で配置

---

### CrossAxisAlignment

- `Row` の場合：**垂直方向（縦方向）**の配置を制御  
- `Column` の場合：**水平方向（横方向）**の配置を制御

例：

- `CrossAxisAlignment.start`：クロス軸の開始側に揃える  
- `CrossAxisAlignment.center`：クロス軸の中央に揃える  
- `CrossAxisAlignment.end`：クロス軸の終了側に揃える  
- `CrossAxisAlignment.stretch`：子ウィジェットをクロス軸方向に引き伸ばす

---

### まとめ

| プロパティ名          | Rowの場合の軸 | Columnの場合の軸 | 説明                      |
|----------------------|---------------|-----------------|---------------------------|
| MainAxisAlignment    | 横方向        | 縦方向          | 主軸方向の子ウィジェット配置 |
| CrossAxisAlignment   | 縦方向        | 横方向          | 主軸と垂直の方向（交差軸）の子ウィジェット配置 |

</details>

## RawMaterialButtonについて

<details>
  <summary>内容を見る</summary>

`RawMaterialButton`はFlutterのボタンの中でも自由度が高く、  
デフォルトのスタイルに依存せずに背景色や形状、影などを細かくカスタマイズできるボタンウィジェットです。

- 他の標準ボタン（ElevatedButtonなど）とは異なり、スタイルがほぼ無い状態で提供される  
- デザインをゼロから自由に作りたいときに便利

### 使用例

```dart
RawMaterialButton(
  onPressed: () {
    print('Pressed');
  },
  fillColor: Colors.blue,        // 背景色
  shape: CircleBorder(),         // 円形にする
  elevation: 4.0,                // 影の深さ
  padding: EdgeInsets.all(16.0), // 内側の余白
  child: Icon(Icons.add, color: Colors.white),
)
```
</details>

## onPressed と onChanged について

<details>
  <summary>内容を見る</summary>

  Flutterでは、ユーザーの操作に応じて処理を実行するために `onPressed` や `onChanged` などのイベントハンドラを使用します。  
  この2つはよく使われるが、**発火のタイミングと用途が異なる**点に注意が必要です。
  
  ---
  
  ### onPressed
  
  - **ボタンなどのウィジェットが押されたとき**に呼び出されるイベント
  - 例えば `ElevatedButton` や `IconButton`、`RawMaterialButton` などで使用される
  
  ```dart
  ElevatedButton(
    onPressed: () {
      print("ボタンが押されました");
    },
    child: Text("押す"),
  )
  ```
</details>

## Navigatorクラスについて

<details>
  <summary>内容を見る</summary>

  `Navigator` クラスは、Flutterで画面遷移（ページ遷移）を行うために使われるウィジェットです。  
  スタック構造（LIFO）を使ってページを管理しており、新しい画面を「積み上げる（push）」、戻るときに「取り出す（pop）」という操作を行います。
  
  ---
  
  ### 基本的な使い方
  
  #### 画面を遷移する（push）
  
  ```dart
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => SecondPage()),
  );
  ```

  #### 画面を戻る（pop）
  ```dart
  Navigator.pop(context);
  ```

   [Navigatorクラス](https://github.com/9kaede12/MobileAppDev/blob/main/Navigator.dart)
</details>

## Drawerウィジェットについて

<details>
  <summary>内容を見る</summary>

  `Drawer` ウィジェットは、アプリの**サイドメニュー（ナビゲーションドロワー）**を実装するためのFlutter標準のウィジェットです。  
  画面の左端または右端からスワイプ、あるいはアイコンをタップすることで表示され、  
  **ナビゲーション機能**や**ユーザー設定項目**などを一覧としてまとめる場面でよく使われます。
  
  ---
  
  ### 特徴
  
  - アプリ上部の `AppBar` にメニューアイコン（ハンバーガーアイコン）を表示して開閉することが多い
  - `ListView`, `ListTile`, `UserAccountsDrawerHeader` などと組み合わせて使うことで柔軟なメニュー構成が可能
  - ユーザーが画面をスワイプするだけでアクセスできる利便性の高いUIパターン
  
  ---
  
  ### 使用例（簡略）
  
  ```dart
  Scaffold(
    appBar: AppBar(title: Text('Home')),
    drawer: Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text('メニュー', style: TextStyle(color: Colors.white)),
          ),
          ListTile(
            title: Text('ホーム'),
            onTap: () {
              // ナビゲーション処理
            },
          ),
        ],
      ),
    ),
    body: Center(child: Text('メイン画面')),
  )
  ```
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

## Future について

<details>
  <summary>内容を見る</summary>

  `Future` は、**非同期処理の結果を後から受け取るためのオブジェクト**です。  
  例えば、ファイルの読み書きやネットワーク通信、時間のかかる処理など、即座に値を返せない関数に使われます。
  
  ---
  
  ### 特徴
  
  - `Future<T>` は「将来的に `T` 型の値を返す予定」という意味
    - 例：`Future<String>`、`Future<File>`、`Future<Directory>` など
  - 実際の処理完了までに時間がかかるため、`await` を使って待つのが基本
  
  ---
  
  ### 使用例
  
  #### 非同期メソッドの定義
  
  ```dart
  Future<String> fetchMessage() async {
    await Future.delayed(Duration(seconds: 2));
    return "取得完了";
  }
  ```
</details>

## 保存先ディレクトリの取得

<details>
  <summary>内容を見る</summary>

  Flutterアプリで**ファイルの読み書き**を行う際には、ユーザーがアクセスできるディレクトリではなく、  
  アプリ専用の「**書き込み可能なディレクトリ**」を使う必要があります。
  
  そのために使うのが、`path_provider` パッケージの `getApplicationDocumentsDirectory()` メソッドです。
  
  ---
  
  ### 使用例
  
  ```dart
  import 'package:path_provider/path_provider.dart';
  
  Future<void> getDirectoryPath() async {
    final dir = await getApplicationDocumentsDirectory();
    print('保存先ディレクトリ: ${dir.path}');
  }
  ```
  このコードでは、非同期でディレクトリを取得し、アプリ内のファイル保存場所として使用できます。

</details>

## 保存処理について

<details>
  <summary>内容を見る</summary>

  Flutterアプリでタスクリストなどのデータをローカルに保存する際、  
  データを **JSON形式** に変換してテキストファイルに書き込むのが一般的です。
  
  以下はその一例です。
  
  ---
  
  ### 処理内容
  
  1. `List<Task>` → `List<Map<String, dynamic>>` に変換（`toJson()`）
  2. それを `jsonEncode()` で文字列に変換
  3. ファイルに書き込む（`writeAsString()`）
  
  ---
  
  ### 保存処理のコード例
  
  ```dart
  final jsonStr = jsonEncode(_tasks.map((t) => t.toJson()).toList());
  await file.writeAsString(jsonStr);
  ```
</details>

## 読み込み処理について

<details>
  <summary>内容を見る</summary>

  Flutterアプリで保存したJSONファイルからタスクリストを読み込む際の基本的な処理です。
  
  ---
  
  ### 処理の流れ
  
  1. ファイルを非同期でテキストとして読み込む  
  2. 読み込んだJSON文字列を `jsonDecode()` で `List<Map>` に変換  
  3. 各Mapを `Task.fromJson()` で `Task` インスタンスに復元  
  4. 既存の `_tasks` リストをクリアし、新しいタスク群で更新  
  5. `setState()` を呼んでUIを更新
  
  ---
  
  ### コード例
  
  ```dart
  final contents = await file.readAsString();
  final jsonData = jsonDecode(contents);
  _tasks.clear();
  _tasks.addAll((jsonData as List).map((e) => Task.fromJson(e)));
  setState(() {});
  ```
</details>

## Firebaseについて
<details>
  <summary>内容を見る</summary>

  FirebaseはFlutterと同じくGoogleが中心となって開発を進めているため、相性の良い組み合わせと言えます。

  ### Firebaseに登録
  Firebaseにアカウント登録していない場合は、[Firebase](https://firebase.google.com/?hl=ja) このリンクから登録ができます。
</details>
