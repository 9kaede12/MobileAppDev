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
   
  `Navigator` は Flutter の画面遷移（ルーティング）を管理するクラスです。  
  スタック構造を使い、画面（ページ）を積み重ねたり戻ったりする操作を扱います。
  
  ---
  
  ## 基本的な役割
  
  - 新しい画面を「プッシュ（積む）」して遷移する  
  - 現在の画面を「ポップ（取り除く）」して戻る  
  - 画面遷移の履歴（スタック）を管理
  
  ---
  
  ## 画面遷移の基本例
  
  ```dart
  // 画面Aから画面Bへ遷移する
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ScreenB()),
  );
  
  // 画面Bから前の画面に戻る
  Navigator.pop(context);
  ```
  
  ---
  
  ## push と pop の説明
  
  | メソッド       | 説明                        |
  |----------------|-----------------------------|
  | `push`         | 新しい画面をスタックに積む  |
  | `pop`          | 現在の画面をスタックから外す（前の画面に戻る） |
  | `pushReplacement` | 現在の画面を新しい画面で置き換える（戻れなくなる） |
  | `pushNamed`    | 名前付きルートで遷移する    |
  | `popUntil`     | 指定した条件の画面まで戻る  |
  
  ---
  
  ## 名前付きルートの使用例
  
  `MaterialApp` の `routes` にルート名とウィジェットを登録しておく
  
  ```dart
  MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => HomePage(),
      '/settings': (context) => SettingsPage(),
    },
  );
  ```
  
  画面遷移は
  
  ```dart
  Navigator.pushNamed(context, '/settings');
  ```
  
  ---
  
  ## 戻り値を受け取る遷移
  
  画面Bから戻る際に結果を返し、画面Aで受け取る例
  
  ```dart
  // 画面A
  final result = await Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ScreenB()),
  );
  print('画面Bからの結果: $result');
  ```
  
  ```dart
  // 画面B
  Navigator.pop(context, 'データを返す');
  ```
  
  ---
  
  ## Navigatorのグローバルキー
  
  複雑なアプリで Navigator にアクセスしたい場合に使う
  
  ```dart
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  
  MaterialApp(
    navigatorKey: navigatorKey,
    home: HomePage(),
  );
  
  // キーからNavigatorを使う
  navigatorKey.currentState?.pushNamed('/settings');
  ```
  
  ---
  
  ## 参考リンク
  
  - https://api.flutter.dev/flutter/widgets/Navigator-class.html  
  - https://docs.flutter.dev/cookbook/navigation/navigation-basics  
  - https://flutter.dev/docs/development/ui/navigation

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
