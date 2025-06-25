# 学んだことについて記述していく

## StatelessWidgetクラスについて
StatelessWidgetクラスとは、その名の通り状態を持たないウィジェットのことです。状態を保持しないため、アプリなどを使用するユーザーからは変更できないウィジェットが表示されます。  
また一度描画されると、変更が加わらない限り再描画されても同じウィジェットが表示されます。

## MaterialAppクラスについて
MaterialAppクラスとは、マテリアルデザインによるウィジェットの作成を行います。  
マテリアルデザインとは異なるデバイス・プラットフォームによりユーザーが感じる見た目や感じ方などを同じものとする目的のもと、作られた視覚的デザイン言語と呼ばれています。

## MainAxisAlignmentとCrossAxisAlignmentについて
MainAxisAlignmentは、Columnなら縦方向の配置の操作で、Rowなら横方向の配置の操作を行い、  
CrossAxisAligmentは、Columnなら横方向の配置の操作で、Rowなら縦方向の配置の操作を行うものだとわかりました。

## RawMaterialButtonについて
これは設定が他の要因で影響を受けないボタンで、独立して自由に背景色などを好きなように設定することができます。

## onPressedとonChangedについて
onPressedはクリックされたときに処理が実行されるのに対して、onChangedは何かが変化すると処理が実行されます。  
例えばテキストが変更したりなどリアルタイムに処理を実行することができます。

## Navigatorクラスについて
よくみたことあるやつ。ということは使う頻度がそれだけ高いってことなので、コードを残しておく。[Navigatorクラス](https://github.com/9kaede12/MobileAppDev/blob/main/Navigator.dart)

## Drawerウィジェットについて
これもGithubやYouTubeなんかでよく見るやつ。  
こちらも、色々なアプリやWebサイトなので見るくらい使う頻度が高いということなので、コードを残しておく。[Drawerウィジェット](https://github.com/9kaede12/MobileAppDev/blob/main/Drawer.dart)

## Todoリストの作成
[flutterstudio](https://flutterstudio.app/)を参考にウィジェットを選びました。  
ウィジェットを組み合わせていく上で、つまづいたところに関してはchatgptを活用して解決を行なっていきました。  
実際のコードは[こちら](https://github.com/9kaede12/MobileAppDev/blob/main/TodoList.dart)です。

## Futureについて
FutureとはFuture<File>やFuture<Directory>などで使われるもので、非同期メソッドの戻り値として返される特殊なオブジェクトです。

## 保存先ディレクトリの取得
<pre>final dir = await getApplicationDocumentsDirectory();</pre>
`getApplicationDocumentsDirectory()` を使って、アプリ専用の「書き込み可能ディレクトリ」のパスを非同期で取得します。

## 保存処理について
<pre>
final jsonStr = jsonEncode(_tasks.map((t) => t.toJson()).toList());
await file.writeAsString(jsonStr);
</pre>
タスクリスト `_tasks` を `toJson()` で Map のリストに変換し、`jsonEncode()` でJSON文字列に変換した後、ファイルに書き込んで保存します。保存完了後は `_showDialog()` によってユーザーに通知されます。

## 読み込み処理について
<pre>
final contents = await file.readAsString();
final jsonData = jsonDecode(contents);
_tasks.clear();
_tasks.addAll((jsonData as List).map((e) => Task.fromJson(e)));
</pre>
`tasks.json` を読み込んでJSON文字列を `List<Map>` にデコードし、各要素を `Task.fromJson()` で Task インスタンスに復元します。  
その後 `_tasks` を更新し、`setState()` によってUIに反映されます。
