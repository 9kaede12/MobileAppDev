# 学んだことについて記述していく

## マテリアルデザインについて
<details>
  <summary>内容をみる</summary>

  Flutter は Google が提供する UI フレームワークであり、マテリアルデザイン（Material Design）を標準で採用しています。`MaterialApp`、`Scaffold`、`AppBar` などのウィジェットが提供されており、視覚的一貫性と操作性を保った UI を構築できます。
  
  ---
  
  ## MaterialApp
  
  アプリ全体のテーマやナビゲーション設定を担うウィジェットです。
  
  ```dart
  void main() {
    runApp(MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    ));
  }
  ```
  
  ---
  
  ## Scaffold
  
  マテリアルデザインの基本レイアウト構造を提供するウィジェットです。
  
  ```dart
  Scaffold(
    appBar: AppBar(title: Text('ホーム')),
    body: Center(child: Text('ようこそ！')),
    floatingActionButton: FloatingActionButton(
      onPressed: () {},
      child: Icon(Icons.add),
    ),
  );
  ```
  
  ---
  
  ## AppBar
  
  画面上部に表示されるアプリバーです。タイトルやアクションアイコンを含めることができます。
  
  ```dart
  AppBar(
    title: Text('タイトル'),
    actions: [
      IconButton(
        icon: Icon(Icons.search),
        onPressed: () {},
      ),
    ],
  )
  ```
  
  ---
  
  ## FloatingActionButton
  
  主なアクションを強調するために使用される円形ボタンです。
  
  ```dart
  FloatingActionButton(
    onPressed: () {
      // アクション処理
    },
    child: Icon(Icons.add),
  )
  ```
  
  ---
  
  ## ボタンの種類
  
  ```dart
  TextButton(
    onPressed: () {},
    child: Text('Text Button'),
  )
  
  ElevatedButton(
    onPressed: () {},
    child: Text('Elevated Button'),
  )
  
  OutlinedButton(
    onPressed: () {},
    child: Text('Outlined Button'),
  )
  ```
  
  ---
  
  ## ThemeData と ColorScheme
  
  アプリ全体の見た目を設定できます。
  
  ```dart
  MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.indigo,
      brightness: Brightness.light,
    ),
  )
  ```
  
  ColorScheme を使ったカスタマイズ：
  
  ```dart
  theme: ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
  )
  ```
  
  ---
  
  ## Material 3 (Material You) の利用
  
  Flutter 3.0以降、Material 3 に対応したテーマ指定が可能です。
  
  ```dart
  MaterialApp(
    theme: ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
    ),
  )
  ```
  
  ---
  
  ## よく使うマテリアルウィジェット
  
  | ウィジェット名 | 説明 |
  |----------------|------|
  | Card           | 情報のまとまりを示すカード表示 |
  | ListTile       | リスト表示のための標準ウィジェット |
  | Dialog         | ポップアップダイアログ |
  | SnackBar       | 画面下部に一時的に表示される通知 |
  | Drawer         | ナビゲーションドロワー（サイドメニュー） |
  
  ---
  
  ## その他の注意点
  
  - Cupertino ウィジェットとの併用も可能。
  - Flutter Web やデスクトップでもマテリアルデザインをそのまま適用可能。
  - `MaterialApp.router` を使うことで Navigator 2.0 による高度なルーティングが可能。
  
  ---
  
  ## 参考リンク
  
  - https://m3.material.io/
  - https://api.flutter.dev/flutter/material/material-library.html
  - https://docs.flutter.dev/cookbook/design/themes

</details>

## コンストラクタについて
<details>
  <summary>内容をみる</summary>

  FlutterはDart言語で書かれており、クラスのインスタンス化時に使う「コンストラクタ」は非常に重要な概念です。このドキュメントでは、Dartの代表的なコンストラクタの書き方を紹介します。
  
  ---
  
  ## 基本のコンストラクタ
  
  ```dart
  class Person {
    String name;
    int age;
  
    Person(String name, int age) {
      this.name = name;
      this.age = age;
    }
  }
  ```
  
  ### 短縮記法
  
  ```dart
  class Person {
    String name;
    int age;
  
    Person(this.name, this.age);
  }
  ```
  
  ---
  
  ## 名前付きコンストラクタ
  
  ```dart
  class Person {
    String name;
    int age;
  
    Person(this.name, this.age);
  
    Person.guest() {
      name = 'Guest';
      age = 0;
    }
  }
  ```
  
  ---
  
  ## 名前付きパラメータ
  
  ```dart
  class Book {
    String title;
    String author;
  
    Book({required this.title, required this.author});
  }
  
  void main() {
    var b = Book(title: '1984', author: 'George Orwell');
  }
  ```
  
  ---
  
  ## デフォルト値
  
  ```dart
  class User {
    String name;
    bool isAdmin;
  
    User({this.name = 'Guest', this.isAdmin = false});
  }
  ```
  
  ---
  
  ## 初期化リスト（initializer list）
  
  ```dart
  class Point {
    final int x;
    final int y;
  
    Point(int a, int b) : x = a, y = b;
  }
  ```
  
  ---
  
  ## コンストラクタ内での処理
  
  ```dart
  class Timer {
    int seconds;
  
    Timer(int s) {
      if (s < 0) {
        throw ArgumentError('秒数は0以上である必要があります');
      }
      seconds = s;
    }
  }
  ```
  
  ---
  
  ## const コンストラクタ
  
  ```dart
  class Color {
    final int red;
    final int green;
    final int blue;
  
    const Color(this.red, this.green, this.blue);
  }
  
  const black = Color(0, 0, 0);
  ```
  
  ---
  
  ## コンストラクタの構文まとめ
  
  | 構文例                     | 用途                            |
  |----------------------------|---------------------------------|
  | `ClassName()`              | 通常のコンストラクタ            |
  | `ClassName.name()`         | 名前付きコンストラクタ          |
  | `ClassName({required ...})`| 名前付きパラメータ              |
  | `: field = value`          | 初期化リスト（final 変数など）  |
  | `const ClassName(...)`     | イミュータブルな定数生成        |
  
  ---
  
  ## 参考リンク
  
  - https://dart.dev/language/constructors
  - https://docs.flutter.dev/development/data-and-backend/json#creating-model-classes

</details>

## StatelessWidgetクラスについて
<details>
  <summary>内容を見る</summary>
  
  Flutter では UI を構築するために Widget クラスを継承してウィジェットを定義します。その中でも `StatelessWidget` は状態を持たないウィジェットを定義する際に使います。
  
  `StatelessWidget` は、**一度生成されると不変な UI コンポーネント**を表します。状態（State）を持たないため、ユーザーの操作などによって UI を変化させる必要がないときに使用します。
  
  ---
  
  ## 最小の StatelessWidget の例
  
  ```dart
  import 'package:flutter/material.dart';
  
  void main() {
    runApp(MyApp());
  }
  
  class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        title: 'Stateless Demo',
        home: MyHomePage(),
      );
    }
  }
  
  class MyHomePage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: Text('ホーム')),
        body: Center(
          child: Text('これは StatelessWidget の例です'),
        ),
      );
    }
  }
  ```
  
  ---
  
  ## 特徴
  
  - クラスは `StatelessWidget` を継承する
  - `build(BuildContext context)` メソッドをオーバーライドする
  - UI を返す
  - 外部から受け取ったパラメータ（final）で UI を構築する
  
  ---
  
  ## プロパティ付きの例
  
  ```dart
  class Greeting extends StatelessWidget {
    final String name;
  
    const Greeting({required this.name});
  
    @override
    Widget build(BuildContext context) {
      return Text('こんにちは、$name さん');
    }
  }
  ```
  
  使用例：
  
  ```dart
  Greeting(name: '太郎');
  ```
  
  ---
  
  ## StatelessWidget と StatefulWidget の違い
  
  | 比較項目       | StatelessWidget                   | StatefulWidget                    |
  |----------------|-----------------------------------|-----------------------------------|
  | 状態管理       | 不可（変更なし）                  | 可能（setStateで変更）            |
  | UIの更新        | 外部からの変更でのみ               | 内部状態の変化でUI更新が可能       |
  | パフォーマンス | 高い                              | 状態更新のたびに再構築が必要       |
  | 用途例         | ラベルやアイコン、ボタンなど      | 入力フォーム、タブ、アニメーションなど |
  
  ---
  
  ## StatelessWidget が適している場面
  
  - 静的なテキストや画像表示
  - 表示内容がプロパティのみで決まる UI
  - 一度表示すれば変更されないウィジェット
  
  ---
  
  ## 参考リンク
  
  - https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html
  - https://docs.flutter.dev/development/ui/widgets-intro

</details>

## StatefulWidgetクラスについて
<details>
  <summary>内容を見る</summary>
  
  Flutter では、状態（State）を持つウィジェットを作成するときに `StatefulWidget` クラスを使います。`StatefulWidget` はユーザー操作やデータの変化に応じて UI を動的に更新できるウィジェットです。
  
  ---
  
  ## StatefulWidget の基本構造
  
  `StatefulWidget` は2つのクラスで構成されます。
  
  1. `StatefulWidget` クラス本体（不変部分）  
  2. 状態を管理する `State` クラス（可変部分）
  
  ---
  
  ## 最小の StatefulWidget の例
  
  ```dart
  import 'package:flutter/material.dart';
  
  void main() {
    runApp(MyApp());
  }
  
  class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        title: 'Stateful Demo',
        home: CounterPage(),
      );
    }
  }
  
  class CounterPage extends StatefulWidget {
    @override
    _CounterPageState createState() => _CounterPageState();
  }
  
  class _CounterPageState extends State<CounterPage> {
    int _counter = 0;
  
    void _increment() {
      setState(() {
        _counter++;  // 状態を更新するとUIが再構築される
      });
    }
  
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: Text('StatefulWidgetの例')),
        body: Center(
          child: Text(
            'ボタンが押された回数: $_counter',
            style: TextStyle(fontSize: 24),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _increment,
          child: Icon(Icons.add),
        ),
      );
    }
  }
  ```
  
  ---
  
  ## 特徴
  
  - `StatefulWidget` は不変であり、実際の状態の変更は `State` クラス内で管理
  - 状態を変化させたいときは `setState()` メソッドを呼び出す
  - `setState()` を呼ぶと `build()` が再実行され、UIが更新される
  
  ---
  
  ## `StatefulWidget` と `StatelessWidget` の違い
  
  | 項目                 | StatefulWidget                     | StatelessWidget                   |
  |----------------------|----------------------------------|---------------------------------|
  | 状態の有無           | 状態を持ち、変更可能              | 状態を持たず不変                 |
  | UIの更新トリガー     | `setState()`で状態を変更すると再構築 | プロパティが変わったときのみ再構築 |
  | 用途例               | 入力フォーム、カウンター、アニメーション | 静的テキストや画像、アイコン     |
  
  ---
  
  ## 状態を持つウィジェット作成のポイント
  
  - `StatefulWidget` クラスは不変で軽量にする  
  - 状態を持つロジックは必ず `State` クラスに書く  
  - UIの再描画は `setState()` で通知する
  
  ---
  
  ## 参考リンク
  
  - https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html  
  - https://docs.flutter.dev/development/ui/interactive  

</details>

## MaterialAppクラスについて
<details>
  <summary>内容を見る</summary>

  `MaterialApp` は Flutter のマテリアルデザインアプリのルートとなるウィジェットです。アプリ全体のテーマ設定やナビゲーション、ローカライズなど、多くの機能を一元的に管理します。
  
  ---
  
  ## 主な役割と特徴
  
  - アプリのタイトルやテーマを設定する
  - ルーティング（画面遷移）の管理
  - ローカライズ（多言語対応）の設定
  - マテリアルデザインの基本設定をまとめる
  - デフォルトのフォントやスタイルを提供
  
  ---
  
  ## 基本的な使い方
  
  ```dart
  import 'package:flutter/material.dart';
  
  void main() {
    runApp(MaterialApp(
      title: 'My Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    ));
  }
  
  class MyHomePage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('ホーム'),
        ),
        body: Center(
          child: Text('MaterialAppの基本例'),
        ),
      );
    }
  }
  ```
  
  ---
  
  ## 主なプロパティ
  
  | プロパティ名        | 説明                                        |
  |--------------------|---------------------------------------------|
  | `title`            | アプリのタイトル（主にタスクスイッチャーに表示） |
  | `theme`            | アプリ全体のテーマを設定（色やフォントなど）       |
  | `darkTheme`        | ダークモード時のテーマ設定                       |
  | `themeMode`        | 明るいテーマとダークテーマの切替設定               |
  | `home`             | 最初に表示するウィジェット                         |
  | `routes`           | 名前付きルートのマップ（画面遷移先の登録）           |
  | `initialRoute`     | 最初に表示するルートの名前                           |
  | `navigatorKey`     | ナビゲーターのグローバルキー                         |
  | `localizationsDelegates` | 多言語対応のためのローカライズデリゲート               |
  | `debugShowCheckedModeBanner` | デバッグ時の「DEBUG」バナーの表示切替（falseで非表示）   |
  | `useMaterial3`     | Material Design 3 (Material You) の有効化           |
  
  ---
  
  ## ルーティング例
  
  ```dart
  MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => HomePage(),
      '/settings': (context) => SettingsPage(),
    },
  )
  ```
  
  ---
  
  ## Material 3 の有効化
  
  Flutter 3.x以降では `useMaterial3` を true にすることで Material You デザインが適用されます。
  
  ```dart
  MaterialApp(
    theme: ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
    ),
    home: MyHomePage(),
  )
  ```
  
  ---
  
  ## 参考リンク
  
  - https://api.flutter.dev/flutter/material/MaterialApp-class.html  
  - https://docs.flutter.dev/development/ui/widgets/material#materialapp

</details>

## MainAxisAlignment と CrossAxisAlignment について

<details>
  <summary>内容を見る</summary>

  Flutter のレイアウトウィジェット（特に `Row` や `Column`）でよく使う配置方法を指定するための列挙型です。
  
  ---
  
  ## MainAxisAlignment
  
  - メイン軸（`Row` の場合は水平方向、`Column` の場合は垂直方向）に沿った子ウィジェットの配置方法を指定します。
  
  ### 主な値
  
  | 値                   | 説明                             |
  |----------------------|----------------------------------|
  | `start`              | メイン軸の開始位置に揃える       |
  | `end`                | メイン軸の終了位置に揃える       |
  | `center`             | メイン軸の中央に揃える           |
  | `spaceBetween`       | 子ウィジェット間のスペースを均等に配分（端は詰める） |
  | `spaceAround`        | 子ウィジェット間のスペースを均等に配分（端も同等のスペース） |
  | `spaceEvenly`        | 子ウィジェット間のスペースと端のスペースを均等に配分 |
  
  ### 例
  
  ```dart
  Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text('左'),
      Text('中央'),
      Text('右'),
    ],
  )
  ```
  
  ---
  
  ## CrossAxisAlignment
  
  - クロス軸（`Row` の場合は垂直方向、`Column` の場合は水平方向）に沿った子ウィジェットの配置方法を指定します。
  
  ### 主な値
  
  | 値                   | 説明                             |
  |----------------------|----------------------------------|
  | `start`              | クロス軸の開始位置に揃える       |
  | `end`                | クロス軸の終了位置に揃える       |
  | `center`             | クロス軸の中央に揃える           |
  | `stretch`            | クロス軸方向に子ウィジェットを引き伸ばす（最大サイズ） |
  | `baseline`           | 文字のベースラインに揃える（テキストがある場合） |
  
  ### 例
  
  ```dart
  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('左揃えテキスト1'),
      Text('左揃えテキスト2'),
    ],
  )
  ```
  
  ---
  
  ## Row と Column のメイン軸とクロス軸
  
  | ウィジェット | メイン軸           | クロス軸           |
  |--------------|--------------------|--------------------|
  | `Row`        | 水平方向（左右）    | 垂直方向（上下）    |
  | `Column`     | 垂直方向（上下）    | 水平方向（左右）    |
  
  ---
  
  ## まとめ
  
  - `mainAxisAlignment` は子ウィジェットの**主方向**の配置を制御
  - `crossAxisAlignment` は子ウィジェットの**直交方向**の配置を制御
  - どちらも適切に設定することで柔軟なレイアウトが可能になる
  
  ---
  
  ## 参考リンク
  
  - https://api.flutter.dev/flutter/rendering/MainAxisAlignment.html  
  - https://api.flutter.dev/flutter/rendering/CrossAxisAlignment.html  
  - https://docs.flutter.dev/development/ui/layout/tutorial#alignment-and-positioning

</details>

## RawMaterialButtonについて

<details>
  <summary>内容を見る</summary>

  `RawMaterialButton` は Flutter のマテリアルデザインボタンの低レベルな構成ウィジェットです。  
  `ElevatedButton` や `TextButton` のような高レベルのボタンウィジェットのカスタマイズ版として使われ、より自由に見た目や動作を細かく制御できます。
  
  ---
  
  ## 特徴
  
  - ボタンのビルドに必要な最低限の機能を持つ
  - デフォルトのスタイルはなく、見た目を完全に自由にカスタマイズ可能
  - サイズ、形状、色、影、マテリアルの効果を自分で設定する必要がある
  - 高度なカスタムボタンを作りたいときに利用
  
  ---
  
  ## 基本的な使い方
  
  ```dart
  RawMaterialButton(
    onPressed: () {
      print('RawMaterialButton pressed');
    },
    fillColor: Colors.blue,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
    constraints: BoxConstraints(
      minWidth: 100,
      minHeight: 40,
    ),
    child: Text(
      'カスタムボタン',
      style: TextStyle(color: Colors.white),
    ),
  )
  ```
  
  ---
  
  ## 主なプロパティ
  
  | プロパティ名      | 説明                                      |
  |------------------|-------------------------------------------|
  | `onPressed`      | ボタンが押されたときのコールバック       |
  | `onLongPress`    | 長押し時のコールバック                    |
  | `fillColor`      | ボタンの背景色                            |
  | `shape`          | ボタンの形状（角丸や丸形など）            |
  | `elevation`      | ボタンの影の高さ                          |
  | `constraints`    | サイズの制約（最小・最大幅や高さ）        |
  | `padding`        | 内側の余白                                |
  | `child`          | ボタン内に表示するウィジェット            |
  | `focusColor`     | フォーカス時の色                          |
  | `hoverColor`     | ホバー時の色（Webやデスクトップ用）      |
  | `highlightColor` | 押下時のハイライト色                      |
  
  ---
  
  ## 注意点
  
  - スタイルや動作を自分で細かく設定する必要があるため、通常は `ElevatedButton` などの高レベルボタンで十分な場合が多い
  - `RawMaterialButton` はカスタムUIや特殊なアニメーションを実装したい場合に使うことが多い
  
  ---
  
  ## 参考リンク
  
  - https://api.flutter.dev/flutter/material/RawMaterialButton-class.html  
  - https://flutter.dev/docs/development/ui/widgets/material#rawmaterialbutton


</details>

## onPressed と onChanged について

<details>
  <summary>内容を見る</summary>

  Flutter のウィジェットでユーザー操作に応じて処理を行うために使うコールバック関数の代表例が `onPressed` と `onChanged` です。
  
  ---
  
  ## onPressed
  
  - 主に **ボタン系ウィジェット**（`ElevatedButton`、`TextButton`、`IconButton`、`RawMaterialButton` など）で使用される  
  - ボタンが「押されたとき」に呼ばれる関数（コールバック）を設定する  
  - 型は `void Function()?`（戻り値なし、引数なしの関数）  
  - `null` を渡すとボタンが無効化される（押せなくなる）
  
  ### 例
  
  ```dart
  ElevatedButton(
    onPressed: () {
      print('ボタンが押されました');
    },
    child: Text('押してね'),
  )
  ```
  
  ---
  
  ## onChanged
  
  - 主に **入力系ウィジェット**（`TextField`、`Slider`、`Switch`、`DropdownButton` など）で使われる  
  - ユーザーが値を変更したときに呼ばれるコールバック  
  - 型は変更対象に応じて異なるが、一般的には引数に新しい値を受け取り戻り値なしの関数  
  
  ### 例：TextField
  
  ```dart
  TextField(
    onChanged: (String value) {
      print('入力値が変更されました: $value');
    },
  )
  ```
  
  ### 例：Slider
  
  ```dart
  Slider(
    value: _currentValue,
    min: 0,
    max: 100,
    onChanged: (double newValue) {
      setState(() {
        _currentValue = newValue;
      });
    },
  )
  ```
  
  ---
  
  ## 違いのまとめ
  
  | 項目         | onPressed                  | onChanged                          |
  |--------------|----------------------------|----------------------------------|
  | 対象ウィジェット | ボタン系                     | 入力系（TextField、Sliderなど）     |
  | 呼び出しタイミング | ボタンが押された瞬間          | ユーザーが値を変更したとき           |
  | 関数の引数    | なし                       | 新しい値（型はウィジェットによる）  |
  | 役割         | イベントのトリガー           | 値の変更を監視・反映                |
  
  ---
  
  ## 参考リンク
  
  - https://api.flutter.dev/flutter/material/ElevatedButton/onPressed.html  
  - https://api.flutter.dev/flutter/widgets/TextField/onChanged.html  
  - https://docs.flutter.dev/development/ui/interactive  


</details>

## Navigatorクラスについて

<details>
  <summary>内容を見る</summary>

   [Navigatorクラス](https://github.com/9kaede12/MobileAppDev/blob/main/Navigator.dart)
   
  Flutter における画面遷移（ページ移動）には、`Navigator` クラスを使います。  
  スタック構造を用いて、ページ（ウィジェット）を「プッシュ（追加）」や「ポップ（戻る）」などで管理します。
  
  ---
  
  ## 🔹 基本的な使い方
  
  ### 画面を遷移する（push）
  
  ```dart
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => SecondPage()),
  );
  ```
  
  ### 画面を戻る（pop）
  
  ```dart
  Navigator.pop(context);
  ```
  
  ---
  
  ## 🔹 `MaterialPageRoute` とは？
  
  `MaterialPageRoute` は、**画面遷移にマテリアルデザインのアニメーション**を適用するためのルートクラスです。
  
  ### 特徴
  
  - Android の標準的なスライドアニメーションが適用される
  - `builder` で次に表示するウィジェット（ページ）を指定
  
  ### 使用例
  
  ```dart
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => DetailScreen(),
    ),
  );
  ```
  
  > iOS のような遷移アニメーションを使いたい場合は `CupertinoPageRoute` を使用
  
  ---
  
  ## 🔹 `routes` マップによるルーティング定義
  
  `MaterialApp` の `routes` プロパティを使って、**ページ遷移を名前で管理**する方法もあります。
  
  ### 設定例
  
  ```dart
  void main() {
    runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/settings': (context) => SettingsPage(),
      },
    ));
  }
  ```
  
  ### 呼び出し方（名前付きルート）
  
  ```dart
  Navigator.pushNamed(context, '/settings');
  ```
  
  ### 戻る
  
  ```dart
  Navigator.pop(context);
  ```
  
  > 名前付きルートはアプリが大規模化した際に便利です。管理しやすく、テストもしやすくなります。
  
  ---
  
  ## 🔹 `onGenerateRoute` を使った柔軟なルーティング
  
  `MaterialApp` の `onGenerateRoute` を使えば、より動的なルート設定が可能です。
  
  ```dart
  MaterialApp(
    onGenerateRoute: (settings) {
      if (settings.name == '/details') {
        final id = settings.arguments as int;
        return MaterialPageRoute(
          builder: (context) => DetailPage(id: id),
        );
      }
      return null;
    },
  );
  ```
  
  ```dart
  Navigator.pushNamed(
    context,
    '/details',
    arguments: 42,
  );
  ```
  
  ---
  
  ## 🔹 まとめ
  
  | 方法 | 特徴 |
  |------|------|
  | `Navigator.push` + `MaterialPageRoute` | 最も基本的で柔軟な遷移方法。匿名ルート |
  | `Navigator.pushNamed` + `routes` | 名前でルートを管理。シンプルかつ可読性が高い |
  | `onGenerateRoute` | 動的にルートを構築したいときに便利（引数付き遷移など） |
  
  ---
  
  ## 🔹 参考リンク
  
  - [`Navigator` クラス公式ドキュメント](https://api.flutter.dev/flutter/widgets/Navigator-class.html)
  - [`MaterialPageRoute`](https://api.flutter.dev/flutter/material/MaterialPageRoute-class.html)
  - [`MaterialApp` の `routes`](https://api.flutter.dev/flutter/material/MaterialApp/routes.html)

</details>

## Drawerウィジェットについて

<details>
  <summary>内容を見る</summary>

  `Drawer` は画面の左（または右）側からスライドインするナビゲーション用のサイドメニューです。  
  マテリアルデザインで一般的に使われるナビゲーションメニューとして利用されます。
  
  ---
  
  ## 基本的な使い方
  
  `Scaffold` の `drawer` プロパティに `Drawer` ウィジェットを指定します。
  
  ```dart
  Scaffold(
    appBar: AppBar(
      title: Text('Drawer の例'),
    ),
    drawer: Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'メニュー',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('ホーム'),
            onTap: () {
              // 画面遷移や処理をここに記述
              Navigator.pop(context); // Drawerを閉じる
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('設定'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    ),
    body: Center(child: Text('Drawerを使ったレイアウト')),
  );
  ```
  
  ---
  
  ## 主な構成要素
  
  | ウィジェット名   | 説明                                   |
  |------------------|----------------------------------------|
  | `Drawer`         | サイドメニュー全体のコンテナ           |
  | `DrawerHeader`   | Drawerのヘッダー部分（ユーザー情報等） |
  | `ListView`       | メニュー項目をリスト表示                 |
  | `ListTile`       | メニューの各アイテム                     |
  
  ---
  
  ## Drawerの開閉操作
  
  - アプリバーの左上に自動的にハンバーガーメニューアイコンが表示される  
  - アイコンや画面端をスワイプすることで開閉可能  
  - `Navigator.pop(context)` で Drawer を閉じる
  
  ---
  
  ## 右側にDrawerを表示する場合
  
  `Scaffold` の `endDrawer` プロパティに指定します。
  
  ```dart
  Scaffold(
    endDrawer: Drawer(
      // 右側からスライドインするDrawer
    ),
  );
  ```
  
  ---
  
  ## Drawerのカスタマイズ
  
  - 背景色や形状は `Drawer` 内のコンテナや装飾で自由に設定可能  
  - メニューアイテムは `ListTile` を複数使い、アイコンやテキスト、タップ時の処理を指定する
  
  ---
  
  ## 参考リンク
  
  - https://api.flutter.dev/flutter/material/Drawer-class.html  
  - https://docs.flutter.dev/cookbook/design/drawer  
  - https://flutter.dev/docs/cookbook/design/navigation-drawer


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

  `Future` は Dart における非同期処理の結果を表すオブジェクトです。  
  非同期処理の完了（成功または失敗）を待ち、その結果を受け取るために使います。
  
  ---
  
  ## Futureの基本概念
  
  - 非同期処理の完了後に値を返すことを約束するオブジェクト  
  - 処理が成功すれば値を返し、失敗すればエラーを返す  
  - まだ完了していない処理を表すため、すぐに結果は得られない
  
  ---
  
  ## Futureの生成例
  
  ```dart
  Future<String> fetchUserOrder() {
    return Future.delayed(Duration(seconds: 2), () => 'コーヒー');
  }
  ```
  
  上記は、2秒後に文字列 `'コーヒー'` を返す Future を返します。
  
  ---
  
  ## Futureの利用方法
  
  ### 1. `then` と `catchError` を使う
  
  ```dart
  fetchUserOrder().then((order) {
    print('注文: $order');
  }).catchError((error) {
    print('エラー: $error');
  });
  ```
  
  ### 2. `async` / `await` を使う（推奨）
  
  ```dart
  Future<void> example() async {
    try {
      String order = await fetchUserOrder();
      print('注文: $order');
    } catch (error) {
      print('エラー: $error');
    }
  }
  ```
  
  ---
  
  ## Futureの状態
  
  | 状態           | 説明                       |
  |----------------|----------------------------|
  | Uncompleted    | 処理がまだ完了していない状態 |
  | Completed      | 処理が成功し結果が得られた状態 |
  | Completed with Error | 処理が失敗しエラーが発生した状態 |
  
  ---
  
  ## FutureとUIの連携
  
  Flutterでは、`FutureBuilder` ウィジェットを使って非同期処理の結果をUIに反映できます。
  
  ```dart
  FutureBuilder<String>(
    future: fetchUserOrder(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return CircularProgressIndicator();
      } else if (snapshot.hasError) {
        return Text('エラー: ${snapshot.error}');
      } else if (snapshot.hasData) {
        return Text('注文: ${snapshot.data}');
      } else {
        return Text('データなし');
      }
    },
  );
  ```
  
  ---
  
  ## まとめ
  
  - `Future` は非同期処理の結果を表現するオブジェクト  
  - `async` / `await` で直感的に非同期処理を書ける  
  - UIで非同期処理結果を扱う場合は `FutureBuilder` が便利
  
  ---
  
  ## 参考リンク
  
  - https://dart.dev/codelabs/async-await  
  - https://api.flutter.dev/flutter/widgets/FutureBuilder-class.html  
  - https://docs.flutter.dev/cookbook/networking/fetch-data


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

## TextFieldについて
<details>
  <summary>内容を見る</summary>

  `TextField` は Flutter でテキスト入力を行うための基本的なウィジェットです。  
  フォーム、検索バー、チャット欄など、あらゆる入力インターフェースで使用されます。
  
  ---
  
  ## 基本的な使い方
  
  ```dart
  TextField(
    decoration: InputDecoration(
      labelText: 'ユーザー名',
      border: OutlineInputBorder(),
    ),
  )
  ```
  
  ---
  
  ## 主なプロパティ
  
  | プロパティ名         | 説明 |
  |----------------------|------|
  | `controller`         | 入力値を取得・操作するための `TextEditingController` を指定 |
  | `onChanged`          | 入力値が変更されたときに呼ばれるコールバック |
  | `onSubmitted`        | キーボードの「完了」や「Enter」が押されたときに呼ばれる |
  | `decoration`         | プレースホルダやラベル、アイコンなどの装飾を指定 |
  | `keyboardType`       | 入力タイプ（例: `TextInputType.number`）を指定 |
  | `obscureText`        | パスワード入力などで文字を伏せる場合に使用（true にする） |
  | `maxLines`           | 入力可能な行数（デフォルトは1） |
  | `enabled`            | 入力を無効化する（false にすると読み取り専用） |
  
  ---
  
  ## 入力値の取得と制御：TextEditingController の利用
  
  ```dart
  final TextEditingController _controller = TextEditingController();
  
  TextField(
    controller: _controller,
  )
  
  ...
  
  // 入力値を取得
  print(_controller.text);
  
  // 入力値を設定
  _controller.text = '初期値';
  ```
  
  ---
  
  ## onChanged の利用例
  
  ```dart
  TextField(
    onChanged: (text) {
      print('現在の入力: $text');
    },
  )
  ```
  
  ---
  
  ## パスワード入力にする
  
  ```dart
  TextField(
    obscureText: true,
    decoration: InputDecoration(
      labelText: 'パスワード',
    ),
  )
  ```
  
  ---
  
  ## 装飾を追加する（InputDecoration）
  
  ```dart
  TextField(
    decoration: InputDecoration(
      labelText: '検索',
      hintText: 'キーワードを入力',
      prefixIcon: Icon(Icons.search),
      border: OutlineInputBorder(),
    ),
  )
  ```
  
  ---
  
  ## TextFormField との違い
  
  | ウィジェット名     | 用途・特徴 |
  |--------------------|------------|
  | `TextField`        | 軽量な入力欄。単体で使用可能。 |
  | `TextFormField`    | フォーム用。バリデーションや `Form` と連携可能。 |
  
  ---
  
  ## 注意点
  
  - 複雑なバリデーションやフォーム管理を行う場合は `TextFormField` + `Form` を使うのが推奨
  - 必要に応じてフォーカス制御には `FocusNode` を使う
  
  ---
  
  ## 参考リンク
  
  - https://api.flutter.dev/flutter/material/TextField-class.html  
  - https://docs.flutter.dev/cookbook/forms/text-input  
  - https://dart.dev/guides/libraries/library-tour#implementing-advanced-forms

</details>

## Checkboxについて
<details>
  <summary>内容を見る</summary>

  `Checkbox` はオン・オフの状態を切り替えるトグル（チェックボックス）ウィジェットです。  
  ユーザーによる選択・非選択の状態を管理するために使用されます。
  
  ---
  
  ## 基本的な使い方
  
  ```dart
  bool _isChecked = false;
  
  Checkbox(
    value: _isChecked,
    onChanged: (bool? newValue) {
      setState(() {
        _isChecked = newValue!;
      });
    },
  )
  ```
  
  ---
  
  ## 主なプロパティ
  
  | プロパティ名     | 説明 |
  |------------------|------|
  | `value`          | チェック状態（`true` / `false`）を指定 |
  | `onChanged`      | チェック状態が変更されたときに呼ばれる関数 |
  | `activeColor`    | チェック時の色 |
  | `checkColor`     | チェックマーク自体の色 |
  | `tristate`       | `null` を含む三状態 (`true`, `false`, `null`) を許可するかどうか |
  
  ---
  
  ## Checkbox と Text を組み合わせる（Row を使用）
  
  ```dart
  Row(
    children: [
      Checkbox(
        value: _isChecked,
        onChanged: (bool? value) {
          setState(() {
            _isChecked = value!;
          });
        },
      ),
      Text('利用規約に同意する'),
    ],
  )
  ```
  
  ---
  
  ## 三状態チェックボックスの例（`tristate`）
  
  ```dart
  bool? _isChecked = null;
  
  Checkbox(
    value: _isChecked,
    tristate: true,
    onChanged: (bool? value) {
      setState(() {
        _isChecked = value;
      });
    },
  )
  ```
  
  ---
  
  ## チェックボックスの無効化（`onChanged: null`）
  
  ```dart
  Checkbox(
    value: true,
    onChanged: null, // 無効化されてユーザー操作不可
  )
  ```
  
  ---
  
  ## チェックボックスとリスト（ListTile）を組み合わせる
  
  ```dart
  CheckboxListTile(
    title: Text('メール通知を受け取る'),
    value: _isChecked,
    onChanged: (bool? value) {
      setState(() {
        _isChecked = value!;
      });
    },
  )
  ```
  
  ---
  
  ## 注意点
  
  - `Checkbox` はステート（状態）を管理するため、`StatefulWidget` 内で使うのが一般的  
  - 状態の管理には `StatefulWidget` または状態管理パッケージ（Provider, Riverpod など）を利用可能  
  - ユーザーが誤って無効状態と誤解しないよう、無効化する場合は適切に説明をつけると良い
  
  ---
  
  ## 参考リンク
  
  - https://api.flutter.dev/flutter/material/Checkbox-class.html  
  - https://api.flutter.dev/flutter/material/CheckboxListTile-class.html  
  - https://docs.flutter.dev/cookbook/forms/checkbox

</details>

## Switchについて
<details>
  <summary>内容を見る</summary>

  `Switch` は 2 状態（オン/オフ）を切り替えるためのトグルスイッチです。  
  設定画面などでよく使われます。
  
  ---
  
  ## 基本的な使い方
  
  ```dart
  bool _isSwitched = false;
  
  Switch(
    value: _isSwitched,
    onChanged: (bool value) {
      setState(() {
        _isSwitched = value;
      });
    },
  )
  ```
  
  ---
  
  ## 主なプロパティ
  
  | プロパティ名     | 説明 |
  |------------------|------|
  | `value`          | スイッチの現在の状態（`true` / `false`）を指定 |
  | `onChanged`      | 状態が変更されたときに呼ばれる関数 |
  | `activeColor`    | スイッチがオンのときの色 |
  | `activeTrackColor` | トラック部分の色（オン時） |
  | `inactiveThumbColor` | スイッチがオフのときのつまみの色 |
  | `inactiveTrackColor` | オフ時のトラックの色 |
  
  ---
  
  ## Switch とテキストの組み合わせ（Row を使用）
  
  ```dart
  Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text('通知を受け取る'),
      Switch(
        value: _isSwitched,
        onChanged: (bool value) {
          setState(() {
            _isSwitched = value;
          });
        },
      ),
    ],
  )
  ```
  
  ---
  
  ## 無効化されたスイッチ
  
  ```dart
  Switch(
    value: true,
    onChanged: null, // 無効（ユーザー操作不可）
  )
  ```
  
  ---
  
  ## SwitchListTile を使った例
  
  ```dart
  SwitchListTile(
    title: Text('Bluetooth'),
    subtitle: Text('Bluetooth機能を有効にする'),
    value: _isSwitched,
    onChanged: (bool value) {
      setState(() {
        _isSwitched = value;
      });
    },
  )
  ```
  
  ---
  
  ## 注意点
  
  - `Switch` は `StatefulWidget` 内で使用して状態を保持・更新するのが基本です  
  - 単独で使うよりも `SwitchListTile` でラベルや説明と一緒に表示する方が UI 的に親切です  
  - タップ領域はスイッチのみに限定されるため、`ListTile` で領域を広げることができます
  
  ---
  
  ## 参考リンク
  
  - https://api.flutter.dev/flutter/material/Switch-class.html  
  - https://api.flutter.dev/flutter/material/SwitchListTile-class.html  
  - https://docs.flutter.dev/cookbook/forms/switch

</details>

## Radioについて
<details>
  <summary>内容を見る</summary>

  `Radio` は複数の選択肢の中から **1つだけ** を選ぶためのウィジェットです。  
  性別選択や支払い方法など、排他的な選択が必要な場面で使われます。
  
  ---
  
  ## 基本的な使い方
  
  ```dart
  int _selectedValue = 1;
  
  Radio(
    value: 1,
    groupValue: _selectedValue,
    onChanged: (int? value) {
      setState(() {
        _selectedValue = value!;
      });
    },
  )
  ```
  
  - `value`: この Radio ボタンの値
  - `groupValue`: 現在選択されている値
  - `onChanged`: ユーザーが選択を変更したときに呼ばれる
  
  ---
  
  ## 複数の Radio を並べる
  
  ```dart
  Column(
    children: <Widget>[
      Radio(
        value: 1,
        groupValue: _selectedValue,
        onChanged: (int? value) {
          setState(() {
            _selectedValue = value!;
          });
        },
      ),
      Radio(
        value: 2,
        groupValue: _selectedValue,
        onChanged: (int? value) {
          setState(() {
            _selectedValue = value!;
          });
        },
      ),
    ],
  )
  ```
  
  ---
  
  ## ラベル付き：RadioListTile の使用
  
  ```dart
  RadioListTile<int>(
    title: Text('男性'),
    value: 1,
    groupValue: _selectedValue,
    onChanged: (int? value) {
      setState(() {
        _selectedValue = value!;
      });
    },
  )
  ```
  
  - `RadioListTile` を使うことで、ラベルやサブタイトルを含む選択肢が簡単に実装可能
  
  ---
  
  ## 主なプロパティ
  
  | プロパティ名     | 説明 |
  |------------------|------|
  | `value`          | 選択肢ごとの値 |
  | `groupValue`     | 現在選ばれている値 |
  | `onChanged`      | 選択が変わったときに呼ばれるコールバック |
  | `activeColor`    | 選択中のラジオボタンの色 |
  | `toggleable`     | 選択済みの値をタップして選択解除可能にする（デフォルト: false） |
  
  ---
  
  ## 選択肢を列挙型（enum）で扱う例
  
  ```dart
  enum Gender { male, female }
  
  Gender _gender = Gender.male;
  
  Radio<Gender>(
    value: Gender.male,
    groupValue: _gender,
    onChanged: (Gender? value) {
      setState(() {
        _gender = value!;
      });
    },
  )
  ```
  
  ---
  
  ## 無効な状態の Radio（onChanged: null）
  
  ```dart
  Radio(
    value: 1,
    groupValue: _selectedValue,
    onChanged: null, // 無効化
  )
  ```
  
  ---
  
  ## 注意点
  
  - `groupValue` を全ての `Radio` に共通で持たせることで、**どの選択肢が選ばれているか** を管理します  
  - ラジオボタンは「1つだけ選ばせる」用途に限定してください（複数選択には `Checkbox` を使用）  
  - 複数の選択肢には `Column` や `ListView` を使って縦に並べるのが一般的です
  
  ---
  
  ## 参考リンク
  
  - https://api.flutter.dev/flutter/material/Radio-class.html  
  - https://api.flutter.dev/flutter/material/RadioListTile-class.html  
  - https://docs.flutter.dev/cookbook/forms/radio

</details>

## DropDownについて
<details>
  <summary>内容を見る</summary>

  `DropdownButton` は、選択肢のリストから **1つを選択** するためのドロップダウンメニューを提供するウィジェットです。
  
  ---
  
  ## 基本的な使い方
  
  ```dart
  String _selectedValue = 'A';
  
  DropdownButton<String>(
    value: _selectedValue,
    items: <String>['A', 'B', 'C']
        .map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList(),
    onChanged: (String? newValue) {
      setState(() {
        _selectedValue = newValue!;
      });
    },
  )
  ```
  
  ---
  
  ## 主なプロパティ
  
  | プロパティ名         | 説明 |
  |----------------------|------|
  | `value`              | 現在選択されている値 |
  | `items`              | 選択肢のリスト（`DropdownMenuItem` のリスト） |
  | `onChanged`          | 値が変更されたときに呼ばれるコールバック |
  | `hint`               | 値が選択されていない場合に表示するヒントウィジェット |
  | `icon`               | ドロップダウンアイコン（デフォルトは下向き矢印） |
  | `isExpanded`         | true にすると横幅を親に合わせて拡張 |
  | `underline`          | ドロップダウンの下線をカスタマイズ |
  
  ---
  
  ## 値が未選択のときの表示（hint）
  
  ```dart
  String? _selectedValue;
  
  DropdownButton<String>(
    value: _selectedValue,
    hint: Text('選択してください'),
    items: ['赤', '青', '緑'].map((String color) {
      return DropdownMenuItem<String>(
        value: color,
        child: Text(color),
      );
    }).toList(),
    onChanged: (String? newValue) {
      setState(() {
        _selectedValue = newValue;
      });
    },
  )
  ```
  
  ---
  
  ## 無効化されたドロップダウン（onChanged: null）
  
  ```dart
  DropdownButton<String>(
    value: 'A',
    items: ['A', 'B', 'C'].map((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList(),
    onChanged: null, // ユーザー操作を無効化
  )
  ```
  
  ---
  
  ## 複雑な UI 要素の例（リストにアイコンを含める）
  
  ```dart
  DropdownButton<String>(
    value: _selectedValue,
    items: [
      DropdownMenuItem(
        value: 'car',
        child: Row(
          children: [
            Icon(Icons.directions_car),
            SizedBox(width: 8),
            Text('車'),
          ],
        ),
      ),
      DropdownMenuItem(
        value: 'bike',
        child: Row(
          children: [
            Icon(Icons.directions_bike),
            SizedBox(width: 8),
            Text('自転車'),
          ],
        ),
      ),
    ],
    onChanged: (String? value) {
      setState(() {
        _selectedValue = value!;
      });
    },
  )
  ```
  
  ---
  
  ## 注意点
  
  - `DropdownButton` は必ず `StatefulWidget` で使用し、選択状態を保持する必要があります。
  - `items` に指定するリストの `value` は、`value` プロパティと一致する必要があります。
  - メニューが小さい場合でも、`isExpanded: true` を使って UI の幅を整えると見やすくなります。
  - 項目数が多い場合、スクロールできるカスタムドロップダウンの実装が必要になる場合があります。
  
  ---
  
  ## 参考リンク
  
  - https://api.flutter.dev/flutter/material/DropdownButton-class.html  
  - https://docs.flutter.dev/cookbook/forms/dropdown

</details>

## Sliderについて
<details>
  <summary>内容を見る</summary>

  `Slider` は、ユーザーが **連続的または離散的な値** を指定できるスライダー入力です。  
  音量や明るさの調整、数値範囲の選択などに使用されます。
  
  ---
  
  ## 基本的な使い方（連続値）
  
  ```dart
  double _sliderValue = 20;
  
  Slider(
    value: _sliderValue,
    min: 0,
    max: 100,
    onChanged: (double newValue) {
      setState(() {
        _sliderValue = newValue;
      });
    },
  )
  ```
  
  ---
  
  ## 主なプロパティ
  
  | プロパティ名   | 説明 |
  |----------------|------|
  | `value`        | 現在の値 |
  | `min`          | 最小値 |
  | `max`          | 最大値 |
  | `onChanged`    | 値が変更されたときのコールバック |
  | `divisions`    | 分割数（指定すると離散値になる） |
  | `label`        | 値の表示（`divisions` が指定されたときに有効） |
  | `activeColor`  | スライダーの有効部分の色 |
  | `inactiveColor`| スライダーの無効部分の色 |
  
  ---
  
  ## 離散値での使用（ステップ付き）
  
  ```dart
  double _sliderValue = 2;
  
  Slider(
    value: _sliderValue,
    min: 1,
    max: 5,
    divisions: 4, // 1〜5 の 5 段階
    label: _sliderValue.round().toString(),
    onChanged: (double newValue) {
      setState(() {
        _sliderValue = newValue;
      });
    },
  )
  ```
  
  ---
  
  ## 無効状態のスライダー
  
  ```dart
  Slider(
    value: 50,
    min: 0,
    max: 100,
    onChanged: null, // ユーザー操作を無効化
  )
  ```
  
  ---
  
  ## スライダーのカスタマイズ（色）
  
  ```dart
  Slider(
    value: _sliderValue,
    min: 0,
    max: 10,
    activeColor: Colors.green,
    inactiveColor: Colors.grey,
    onChanged: (double value) {
      setState(() {
        _sliderValue = value;
      });
    },
  )
  ```
  
  ---
  
  ## 値の表示を工夫する例
  
  ```dart
  Text('値: ${_sliderValue.toStringAsFixed(1)}')
  ```
  
  スライダーの値をリアルタイムに表示するには、別のウィジェット（`Text` など）で `value` を監視するのが一般的です。
  
  ---
  
  ## 注意点
  
  - `Slider` は `StatefulWidget` として使用し、`value` を状態管理する必要があります。
  - `divisions` を指定しない場合、スライダーは連続値を返します。
  - `label` はツールチップのように値を表示できますが、`divisions` を設定していないと機能しません。
  - 同時に複数の値を選ぶ用途には `RangeSlider` を使うことが推奨されます。
  
  ---
  
  ## 関連ウィジェット
  
  - `RangeSlider`：2点間の範囲を選ぶスライダー  
  - `SliderTheme`：Slider のテーマ・スタイルを詳細にカスタマイズ可能  
  
  ---
  
  ## 参考リンク
  
  - https://api.flutter.dev/flutter/material/Slider-class.html  
  - https://docs.flutter.dev/cookbook/forms/slider  
  - https://api.flutter.dev/flutter/material/RangeSlider-class.html

</details>

## BottomNavigationについて
<details>
  <summary>内容を見る</summary>

  `BottomNavigationBar` は、アプリ下部に配置するナビゲーションバーで、**2～5 個のナビゲーション項目（タブ）を切り替える** UI に用いられます。
  
  ---
  
  ## 基本的な使い方
  
  ```dart
  int _currentIndex = 0;
  
  Scaffold(
    body: _screens[_currentIndex],
    bottomNavigationBar: BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'ホーム',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: '検索',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'マイページ',
        ),
      ],
    ),
  )
  ```
  
  ---
  
  ## 主なプロパティ
  
  | プロパティ名         | 説明 |
  |----------------------|------|
  | `items`              | ナビゲーション項目のリスト（2～5個） |
  | `currentIndex`       | 現在アクティブなタブのインデックス |
  | `onTap`              | タブがタップされたときの処理（インデックスが渡される） |
  | `type`               | バーのタイプ（`fixed` or `shifting`） |
  | `selectedItemColor`  | 選択中アイテムの色 |
  | `unselectedItemColor`| 未選択アイテムの色 |
  | `backgroundColor`    | ナビゲーションバー全体の背景色 |
  | `iconSize`           | アイコンサイズ |
  
  ---
  
  ## `type` の違い
  
  ### `BottomNavigationBarType.fixed`
  
  - アイテム数が **4以下** の場合のデフォルト。
  - 全ての項目が常に表示される。
  - 背景色は共有。
  
  ```dart
  type: BottomNavigationBarType.fixed,
  ```
  
  ### `BottomNavigationBarType.shifting`
  
  - アイテム数が **4以上** の場合に使用。
  - 選択されたアイテムに応じて背景色が変化。
  - アイテムごとに背景色を個別指定可能。
  
  ```dart
  type: BottomNavigationBarType.shifting,
  items: [
    BottomNavigationBarItem(
      icon: Icon(Icons.music_note),
      label: '音楽',
      backgroundColor: Colors.blue,
    ),
    ...
  ],
  ```
  
  ---
  
  ## アイコンなし or ラベル非表示にする
  
  ```dart
  BottomNavigationBar(
    showSelectedLabels: false,
    showUnselectedLabels: false,
    ...
  )
  ```
  
  ---
  
  ## 複数画面との連携（`IndexedStack` 使用例）
  
  ```dart
  IndexedStack(
    index: _currentIndex,
    children: [
      HomeScreen(),
      SearchScreen(),
      ProfileScreen(),
    ],
  )
  ```
  
  ---
  
  ## 注意点
  
  - アイテム数は **2〜5個** に制限されています。それ以上は `NavigationRail` や `Drawer` の利用を検討。
  - バーを動的に変更したい場合、状態管理（`setState`, Provider など）が必要です。
  - アニメーションやカスタムデザインが必要な場合は、`ConvexAppBar`, `BottomAppBar`, `CustomPainter` なども検討できます。
  
  ---
  
  ## 関連ウィジェット
  
  - [`NavigationBar`](https://api.flutter.dev/flutter/material/NavigationBar-class.html): Material 3 向けの新しい下部ナビゲーション
  - [`BottomAppBar`](https://api.flutter.dev/flutter/material/BottomAppBar-class.html): より柔軟なカスタムアクションバー
  - [`TabBar`](https://api.flutter.dev/flutter/material/TabBar-class.html): 上部タブに特化したナビゲーション
  
  ---
  
  ## 公式ドキュメント
  
  - https://api.flutter.dev/flutter/material/BottomNavigationBar-class.html  
  - https://docs.flutter.dev/cookbook/design/bottom-navigation

</details>

## ListViewについて
<details>
  <summary>内容を見る</summary>

  `ListView` は、**スクロール可能なリスト表示を行うためのウィジェット**です。  
  リストアイテムが多くても、必要に応じて動的に生成・表示されるため、効率的です。
  
  ---
  
  ## 主な用途
  
  - 縦方向または横方向のスクロールリスト
  - 長さの決まった／不定なデータの表示
  - アイテムの動的生成 (`builder`)
  - リストの区切り (`separator`) やカスタマイズ表示
  
  ---
  
  ## 基本的な使い方（静的リスト）
  
  ```dart
  ListView(
    children: [
      ListTile(title: Text('項目1')),
      ListTile(title: Text('項目2')),
      ListTile(title: Text('項目3')),
    ],
  )
  ```
  
  ---
  
  ## `ListView.builder`（動的生成）
  
  ```dart
  ListView.builder(
    itemCount: items.length,
    itemBuilder: (context, index) {
      return ListTile(
        title: Text(items[index]),
      );
    },
  )
  ```
  
  - **itemCount**: 表示するアイテムの数
  - **itemBuilder**: 各インデックスに応じてウィジェットを構築
  
  ---
  
  ## `ListView.separated`（区切り線あり）
  
  ```dart
  ListView.separated(
    itemCount: items.length,
    itemBuilder: (context, index) {
      return ListTile(title: Text(items[index]));
    },
    separatorBuilder: (context, index) => Divider(),
  )
  ```
  
  - 各アイテムの間にウィジェット（例：`Divider`）を挿入可能
  
  ---
  
  ## 横スクロールのリスト
  
  ```dart
  ListView(
    scrollDirection: Axis.horizontal,
    children: [
      Container(width: 100, color: Colors.red),
      Container(width: 100, color: Colors.green),
      Container(width: 100, color: Colors.blue),
    ],
  )
  ```
  
  ---
  
  ## スクロールの挙動を制御するプロパティ
  
  | プロパティ             | 説明 |
  |------------------------|------|
  | `scrollDirection`      | スクロールの向き（`Axis.vertical` / `Axis.horizontal`） |
  | `shrinkWrap`           | true にすると内容サイズに応じてリストのサイズを縮小 |
  | `physics`              | スクロールの物理挙動（例：`BouncingScrollPhysics`） |
  | `controller`           | スクロール位置を制御・取得するための ScrollController |
  | `padding`              | 内側の余白 |
  
  ---
  
  ## 高度な使い方：`ListView` + `ScrollController`
  
  ```dart
  ScrollController _scrollController = ScrollController();
  
  ListView.builder(
    controller: _scrollController,
    itemCount: 100,
    itemBuilder: (context, index) => ListTile(title: Text('Item $index')),
  )
  ```
  
  スクロール位置の取得や自動スクロールに使えます。
  
  ---
  
  ## 注意点
  
  - `ListView.builder` を使うことで、**大量のデータでも効率的に表示可能**
  - スクロール可能な親要素（例：`SingleChildScrollView`）の中に `ListView` を入れると **レイアウトが壊れる**ことがある → 対処法として `shrinkWrap: true` や `physics: NeverScrollableScrollPhysics()` を設定
  - ネストされたリストでは高さ指定やラップウィジェットの工夫が必要
  
  ---
  
  ## 関連ウィジェット
  
  - `ListTile`: ListView の1項目を構成する代表的ウィジェット  
  - `CustomScrollView`: 複雑なスクロールビューを構築可能  
  - `GridView`: グリッド表示に特化したリスト  
  - `ReorderableListView`: 項目の並び替えが可能なリスト
  
  ---
  
  ## 参考ドキュメント
  
  - https://api.flutter.dev/flutter/widgets/ListView-class.html  
  - https://docs.flutter.dev/cookbook/lists/basic-list

</details>

## Dataクラスとshuffleについて
<details>
  <summary>内容を見る</summary>

  ---
  
  ## データクラス（Data Class）とは？
  
  Dart では、**特定のデータ構造を表すためのクラス（= データクラス）** を自分で定義します。以下はその典型例です：
  
  ```dart
  class User {
    final String name;
    final int age;
  
    User({required this.name, required this.age});
  
    @override
    String toString() => 'User(name: $name, age: $age)';
  }
  ```
  
  - `final` を使ってイミュータブル（変更不可）なプロパティを定義
  - `toString()` をオーバーライドするとデバッグ出力が見やすくなる
  
  ---
  
  ## `shuffle` メソッドとは？
  
  Dart の `List` クラスには、**要素の順序をランダムに並べ替える `shuffle()` メソッド** が用意されています。
  
  ```dart
  List<int> numbers = [1, 2, 3, 4, 5];
  numbers.shuffle();
  print(numbers); // 例: [3, 5, 1, 4, 2]
  ```
  
  - **インプレース操作**（元のリストを直接変更）
  - デフォルトでは `Random()` によるランダム性が使用される
  
  ---
  
  ## `shuffle` とデータクラスの組み合わせ例
  
  ```dart
  class Item {
    final String title;
    final int value;
  
    Item({required this.title, required this.value});
  
    @override
    String toString() => '$title: $value';
  }
  
  void main() {
    List<Item> items = [
      Item(title: 'A', value: 1),
      Item(title: 'B', value: 2),
      Item(title: 'C', value: 3),
    ];
  
    items.shuffle();
    print(items); // 順序がランダムになる
  }
  ```
  
  ---
  
  ## カスタム乱数シードでの `shuffle`
  
  同じシャッフル結果を再現したい場合は、`Random(seed)` を渡す：
  
  ```dart
  import 'dart:math';
  
  List<String> names = ['Taro', 'Jiro', 'Hanako'];
  names.shuffle(Random(42));
  ```
  
  ---
  
  ## 注意点
  
  - `shuffle()` は元のリストを変更する（元の順序を残したい場合は `List.from()` を使う）
  - データクラスには `==` や `hashCode` のオーバーライドも必要になる場合がある（比較やコレクションでの利用時）
  
  ---
  
  ## 関連知識
  
  - `List.sort()`：昇順や独自ルールで並べ替える
  - `List.reversed`：逆順に取得（非破壊）
  - `collection` パッケージの `shuffle` 関数（より柔軟な操作に対応）
  
  ---
  
  ## 公式リファレンス
  
  - https://api.dart.dev/stable/dart-core/List/shuffle.html
  - https://dart.dev/guides/language/language-tour#using-constructors

</details>

## containerとedgeinsetsとalignmentについて
<details>
  <summary>内容を見る</summary>

  Flutter の UI を構築する上で、`Container` は最も基本的なレイアウトウィジェットの1つです。  
  その中でよく使われるプロパティとして、**`EdgeInsets`（余白）** と **`Alignment`（位置合わせ）** があります。
  
  ---
  
  ## 🔹 `Container` とは？
  
  `Container` は、レイアウト・装飾・配置などをまとめて行える便利なウィジェットです。
  
  ```dart
  Container(
    width: 200,
    height: 100,
    color: Colors.blue,
    child: Text('Hello'),
  )
  ```
  
  - サイズ指定（`width`, `height`）
  - 背景色・装飾（`color`, `decoration`）
  - 子ウィジェットの内側余白（`padding`）
  - 外側余白（`margin`）
  - 子の配置位置（`alignment`）
  
  ---
  
  ## 🔹 `EdgeInsets`（余白の指定）
  
  `EdgeInsets` は、`padding` や `margin` に使用されるクラスで、四方向の余白を定義します。
  
  ```dart
  Container(
    padding: EdgeInsets.all(16), // 全方向に16の余白
    margin: EdgeInsets.symmetric(horizontal: 8), // 左右のみ8の余白
    child: Text('内容'),
  )
  ```
  
  ### 主なコンストラクタ
  
  | 使用方法 | 説明 |
  |----------|------|
  | `EdgeInsets.all(8)` | 四辺すべてに8の余白 |
  | `EdgeInsets.only(top: 10, left: 4)` | 特定の辺のみ指定 |
  | `EdgeInsets.symmetric(horizontal: 12, vertical: 8)` | 左右、上下を一括指定 |
  
  ---
  
  ## 🔹 `Alignment`（子ウィジェットの配置）
  
  `alignment` プロパティを使うと、`Container` 内の子ウィジェットの位置を指定できます。
  
  ```dart
  Container(
    width: 200,
    height: 100,
    color: Colors.grey,
    alignment: Alignment.centerRight,
    child: Text('右寄せ'),
  )
  ```
  
  ### 主な定数
  
  | 定数 | 配置位置 |
  |------|----------|
  | `Alignment.center` | 中央 |
  | `Alignment.topLeft` | 左上 |
  | `Alignment.bottomRight` | 右下 |
  | `Alignment.centerLeft` | 左中央 |
  | `Alignment(0.0, 1.0)` | 中央下（X, Y）で指定も可能（-1〜1の範囲） |
  
  ---
  
  ## 🔹 3つを組み合わせた例
  
  ```dart
  Container(
    width: 300,
    height: 150,
    padding: EdgeInsets.all(20),
    margin: EdgeInsets.only(top: 30),
    alignment: Alignment.bottomCenter,
    color: Colors.amber,
    child: Text('テキストの位置を調整'),
  )
  ```
  
  ---
  
  ## 🔹 注意点
  
  - `padding` は **子ウィジェットと境界の間の余白**
  - `margin` は **Container 自身と周囲との距離**
  - `alignment` は **子ウィジェットの位置指定**（`padding` の内側基準）
  
  ---
  
  ## 🔹 関連ウィジェット・概念
  
  - `SizedBox`: 固定サイズの空間やウィジェットのサイズ調整に便利
  - `Align`: より柔軟に子の位置を調整できる
  - `Padding`: 単に余白だけを指定したいときに便利
  
  ---
  
  ## 🔹 参考リンク
  
  - https://api.flutter.dev/flutter/widgets/Container-class.html
  - https://api.flutter.dev/flutter/painting/EdgeInsets-class.html
  - https://api.flutter.dev/flutter/painting/Alignment-class.html

</details>

## listtileとsinglechilescrollviewについて
<details>
  <summary>内容を見る</summary>

  ---
  
  ## `ListTile` とは？
  
  `ListTile` は、**1行のリスト項目を簡潔に構築できるウィジェット** です。左にアイコン、中央にタイトルとサブタイトル、右にアクションを配置するレイアウトが組み込まれています。
  
  ### 基本構造
  
  ```dart
  ListTile(
    leading: Icon(Icons.person),
    title: Text('ユーザー名'),
    subtitle: Text('詳細情報'),
    trailing: Icon(Icons.arrow_forward),
    onTap: () {
      // タップ時の処理
    },
  )
  ```
  
  ### 主なプロパティ
  
  | プロパティ | 説明 |
  |------------|------|
  | `leading` | 左側のウィジェット（通常はアイコンなど） |
  | `title` | メインのテキスト |
  | `subtitle` | 補助テキスト（オプション） |
  | `trailing` | 右側のウィジェット（例：矢印、スイッチなど） |
  | `onTap` | タップ時の処理 |
  
  ### 応用例：スイッチ付きリスト
  
  ```dart
  ListTile(
    title: Text('通知を有効にする'),
    trailing: Switch(
      value: true,
      onChanged: (bool value) {
        // スイッチの変更処理
      },
    ),
  )
  ```
  
  ---
  
  ## `SingleChildScrollView` とは？
  
  `SingleChildScrollView` は、**1つの子ウィジェットをスクロール可能にするウィジェット** です。通常、縦方向にコンテンツが収まらないときに使われます。
  
  ### 基本構造
  
  ```dart
  SingleChildScrollView(
    child: Column(
      children: [
        Text('長いコンテンツ...'),
        SizedBox(height: 1000),
        Text('最後の項目'),
      ],
    ),
  )
  ```
  
  ### 主な用途と注意点
  
  - スクロール可能な単一列レイアウトを実現したいときに使用
  - **リスト要素が多い場合は `ListView` を使う方が効率的**
  - `SingleChildScrollView` の子は、**無限に広がる可能性があるため、サイズの制約に注意**
  
  ### 応用：フォームやカスタム UI によく使われる
  
  ```dart
  SingleChildScrollView(
    padding: EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('フォーム入力'),
        TextField(),
        SizedBox(height: 20),
        Text('補足説明'),
      ],
    ),
  )
  ```
  
  ---
  
  ## 組み合わせ例：`ListTile` をスクロール可能に表示
  
  ```dart
  SingleChildScrollView(
    child: Column(
      children: List.generate(20, (index) {
        return ListTile(
          leading: Icon(Icons.label),
          title: Text('項目 $index'),
          trailing: Icon(Icons.chevron_right),
        );
      }),
    ),
  )
  ```
  
  > 備考: スクロール可能な多数の `ListTile` を扱う場合は、`ListView.builder` を使用する方がパフォーマンス的に優れます。
  
  ---
  
  ## 参考リンク
  
  - [`ListTile` API](https://api.flutter.dev/flutter/material/ListTile-class.html)
  - [`SingleChildScrollView` API](https://api.flutter.dev/flutter/widgets/SingleChildScrollView-class.html)

</details>

## TabBarとTabBarViewとTabControllerについて
<details>
  <summary>内容を見る</summary>

  Flutter では、`TabBar` と `TabBarView` を組み合わせることで、タブ付き UI を構築できます。  
  タブの動作管理には `TabController` を使用します。
  
  ---
  
  ## 🔹 基本構成と関係
  
  | ウィジェット | 役割 |
  |-------------|------|
  | `TabBar` | タブの見た目（上部のタブバー）を定義 |
  | `TabBarView` | 各タブに対応する画面（中身）を定義 |
  | `TabController` | タブの選択状態や切り替えを制御 |
  
  これらは通常、`StatefulWidget` 内で使用されます。
  
  ---
  
  ## 🔹 実装例（DefaultTabController を使う）
  
  簡易的に `TabController` を省略する場合は、`DefaultTabController` を使用できます。
  
  ```dart
  DefaultTabController(
    length: 3,
    child: Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          tabs: [
            Tab(text: 'ホーム'),
            Tab(icon: Icon(Icons.favorite)),
            Tab(text: '設定'),
          ],
        ),
        title: Text('タブナビゲーション'),
      ),
      body: TabBarView(
        children: [
          Center(child: Text('ホーム画面')),
          Center(child: Text('お気に入り')),
          Center(child: Text('設定画面')),
        ],
      ),
    ),
  )
  ```
  
  - `length`: タブの数を指定
  - `TabBar` と `TabBarView` は、`TabController` を共有している必要がある
  
  ---
  
  ## 🔹 TabController を自分で使う（より柔軟な方法）
  
  より細かく制御したい場合は、`TabController` を自前で管理します。
  
  ```dart
  class MyTabbedPage extends StatefulWidget {
    @override
    _MyTabbedPageState createState() => _MyTabbedPageState();
  }
  
  class _MyTabbedPageState extends State<MyTabbedPage> with SingleTickerProviderStateMixin {
    late TabController _controller;
  
    @override
    void initState() {
      super.initState();
      _controller = TabController(length: 2, vsync: this);
    }
  
    @override
    void dispose() {
      _controller.dispose();
      super.dispose();
    }
  
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            controller: _controller,
            tabs: [
              Tab(text: 'A'),
              Tab(text: 'B'),
            ],
          ),
          title: Text('カスタムタブ'),
        ),
        body: TabBarView(
          controller: _controller,
          children: [
            Center(child: Text('画面 A')),
            Center(child: Text('画面 B')),
          ],
        ),
      );
    }
  }
  ```
  
  ---
  
  ## 🔹 Tab のカスタマイズ
  
  ```dart
  Tab(
    icon: Icon(Icons.home),
    text: 'ホーム',
  )
  ```
  
  ---
  
  ## 🔹 よくある注意点
  
  - `TabBar` と `TabBarView` は同じ `TabController` を使わなければならない
  - タブ数 (`length`) は一致させる必要がある
  - `TabController` を使う場合は、`TickerProviderStateMixin` を `State` クラスに追加する必要がある
  
  ---
  
  ## 🔹 スクロール可能なタブバー
  
  タブが多い場合は、`isScrollable: true` を設定：
  
  ```dart
  TabBar(
    isScrollable: true,
    tabs: [
      Tab(text: 'タブ1'),
      Tab(text: 'タブ2'),
      Tab(text: 'タブ3'),
      Tab(text: 'タブ4'),
      Tab(text: 'タブ5'),
    ],
  )
  ```
  
  ---
  
  ## 🔹 参考リンク
  
  - [`TabBar` API](https://api.flutter.dev/flutter/material/TabBar-class.html)
  - [`TabBarView` API](https://api.flutter.dev/flutter/material/TabBarView-class.html)
  - [`TabController` API](https://api.flutter.dev/flutter/material/TabController-class.html)

</details>
