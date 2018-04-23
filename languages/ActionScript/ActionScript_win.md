# ActionScript 3.0（ Windows ）

## Flex SDK / ActionScript 3.0 について

* Ver.4.6 までは Adobe Flex SDK、Ver.4.8 からは [Apache Flex](https://ja.wikipedia.org/wiki/Apache_Flex) SDK としてリリース
* ActionScript 3.0（AS3）は ECMAScript 4 草案（[ECMA-262 4th 草案](https://ja.wikipedia.org/wiki/ECMAScript)）がベース
* 2010年4月に iPhone SDK の規約変更後 [Adobe Flash](https://ja.wikipedia.org/wiki/Adobe_Flash) の重要度が低下、AS3 が利用される場面も減少した
* [ActionScript 4 のホワイトペーパー](https://github.com/adobe-research/ActionScript4)が公開されたが開発予定はない

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|[Windows](https://ja.wikipedia.org/wiki/Microsoft_Windows) 10（64bit）|ー|
|コンパイラ|[Apache Flex](https://ja.wikipedia.org/wiki/Apache_Flex) SDK 4.15.0|2016年01月|
|Flash Player|[PlayerGlobal](http://www.adobe.com/jp/support/flashplayer/debug_downloads.html) 24.0.0.221|2017年02月|
|エディタ|Visual Studio Code 1.10.2|2017年03月|
|拡張機能|NextGen ActionScript 0.3.1|ー|
|ブラウザ|Google Chrome 57.0.2987.98|2017年03月|
|プラグイン|[Adobe Flash Player 24.0.0.221](https://www.adobe.com/jp/software/flash/about/)|2017年02月|
|その他|[Java SE](https://ja.wikipedia.org/wiki/Java) 1.8.0_121|2017年01月|

1. コマンドプロンプトで [Java](https://ja.wikipedia.org/wiki/Java) のバージョン確認  
    \>java -version  
    java version "1.8.0_121"  
    Java(TM) SE Runtime Environment (build 1.8.0_121-b13)

1. Apache Flex SDK のインストール  
    1. https://flex.apache.org/ にアクセス
    1. [DOWNLOAD FLEX] → [SDK BINARIES] を選択
    1. Windows Binaries : apache-flex-sdk-4.15.0-bin.zip をダウンロード
    1. ダウンロードした .zip ファイルをダブルクリックして [展開] → [すべて展開]
    1. フォルダ名を apache-flex-sdk-4.15.0-bin → flex_sdk に変更
    1. フォルダを C:\Program Files (x86) に移動する
    1. コマンドプロンプトでバージョン確認  
    >cd \Program Files (x86)\flex_sdk\bin  
    >mxmlc -version  
    Version 4.15.0 build 20160104

1. Visual Studio Codeに拡張機能の追加
    1. [表示] → [機能拡張] を選択
    1. NextGen ActionScript を検索＆インストール

1. Adobe PlayerGlobal のダウンロード
    1. Adobe Flash Player サポートセンターにアクセス  
    http://www.adobe.com/jp/support/flashplayer/debug_downloads.html
    1. [最新版のplayerglobal.swcをダウンロード] を選択しダウンロード  
    1. C:\Program Files (x86)/flex_sdk/frameworks/libs/ に /player/11.1/ フォルダを作成  
    1. 作成したフォルダ内に、ダウンロードした playerglobal24_0.swc を複製（展開しない）  
    1. ファイル名を playerglobal24_0.swc → playerglobal.swc に変更

1. 設定ファイルの変更
    1. コードエディタで /Applications/flex_sdk/frameworks/flex-config.xml を開く
    1. {playerglobalHome} → libs/player に変更  
    64行目 \<path-element>libs/player/{targetPlayerMajorVersion}...  
    84行目 \<path-element>libs/player/{targetPlayerMajorVersion}...  

## コードの記述

1. Visual Studio Code を起動
    1. [ファイル] → [新規ファイル] を選択
    1. [ファイル] → [保存] を選択
    1. 任意の場所（今回はデスクトップ上に ActionScript フォルダを作成）に Main<b>.as</b> という名で保存
    * 通常は Web サーバ上で動作させます

1. コードの記述
```
//Main.as
package {
    //利用するパッケージの読込み
    import flash.display.*;
    import flash.text.*;

    //描画画面サイズ＆背景色の指定
    [SWF(width=550, height=400, backgroundColor="0xFFCC00")]

    //Mainクラス
    public class Main extends Sprite {

        //コンストラクタ
        public function Main() {

            //TextFieldオブジェクトの生成
            var _textField:TextField = new TextField();
            _textField.text = "Hello,world!";
            _textField.x = _textField.y = 0;

            //Stageに表示オブジェクト（TextField）を追加
            addChild(_textField);
        }
    }
}
```

## コンパイル

1. コマンドプロンプトを起動

1. コンパイラ（mxmlc）でコンパイル（.as → .swf）  
C:\Program Files (x86)\flex_sdk\bin><b>mxmlc</b> \Users\none\Desktop\ActionScript\\<b>Main.as</b>

1. Main.as ファイルと同階層に Main.swf ファイルが生成されたのを確認

## HTMLファイルの記述

1. Visual Studio Code を起動

1. Main.as ファイルと同階層に index.html ファイルを作成

```
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
</head>
<body>
    <object width="550" height="400">
        <param name="movie" value="Main.swf">
        <paarm name="quality" value="high">
        <param name="bgcolor" value="#ffcc00">
        <embed src="Main.swf" 
               quality="high"
               bgcolor="#ffcc00"
               width="550" height="400"
               type="application/x=shockwave-flash">
        </embed>
    </object>
</body>
</html>
```

## 実行

1. Web ブラウザ（Google Chrome）を起動

1. [設定] → [詳細設定を表示…] → [プライバシー] → [コンテンツを設定…] → [サイトで Flash の実行を許可する] を選択

1. [Ctrl] + [o] で上記の index.html を開く  
550 x 400 の矩形のステージ上の左上に Hello, world! と表示されたら成功！

***
作成者: MUBIROU  
作成日: 2017年03月10日
