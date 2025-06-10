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
よくみたことあるやつ。ということは使う頻度が高いってことなので、コードを残しておく。[Navigatorクラス](https://github.com/9kaede12/MobileAppDev/blob/main/Navigator.dart)

## Drawerウィジェットについて
これもGithubやYouTubeなんかでよく見るやつ。  
こちらも、色々なアプリやWebサイトなので見るくらい使う頻度が高いということなので、コードを残しておく。[Drawerウィジェット](https://github.com/9kaede12/MobileAppDev/blob/main/Drawer.dart)

## Todoリストの作成
[flutterstudio](https://flutterstudio.app/)を参考にウィジェットを選びました。ウィジェットを組み合わせていく上で、つまづいたところに関してはchatgptを活用して解決を行なっていきました。  
実際のコードは[こちら](https://github.com/9kaede12/MobileAppDev/blob/main/TodoList.dart)です。
