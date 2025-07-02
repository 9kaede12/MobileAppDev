# 学んだことについて記述していく

## StatelessWidgetクラスについて
<details>
   <summary>内容</summary>
   
   StatelessWidgetクラスとは、その名の通り状態を持たないウィジェットのことです。  
   状態を保持しないため、アプリなどを使用するユーザーからは変更できないウィジェットが表示されます。   
   また一度描画されると、変更が加わらない限り再描画されても同じウィジェットが表示されます。  
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

