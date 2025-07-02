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

