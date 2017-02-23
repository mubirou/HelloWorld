# ActionScript 3.0

## Flex SDK / ActionScript 3.0 について

* Ver.4.6 までは Adobe Flex SDK、Ver.4.8 からは [Apache Flex](https://ja.wikipedia.org/wiki/Apache_Flex) SDK となる
* ActionScript 3.0（AS3）は ECMAScript 4 草案（[ECMA-262 4th 草案](https://ja.wikipedia.org/wiki/ECMAScript)）がベース
* 2010年4月に iPhone SDK の規約変更後 [Adobe Flash](https://ja.wikipedia.org/wiki/Adobe_Flash) の重要度が低下、AS3 が利用される場面も減少した
* [ActionScript 4 のホワイトペーパー](https://github.com/adobe-research/ActionScript4)が公開されたが開発予定はない

## 開発環境の構築

||ソフト名|リリース日|
|:--:|:--:|:--:|
|OS|Ubuntu 16.04.02 LTS（Linux）|2016年04月|
|コンパイラ|[Apache Flex](https://ja.wikipedia.org/wiki/Apache_Flex) SDK 4.15.0|2016年01月|
|Flash Player|[PlayerGlobal](http://www.adobe.com/jp/support/flashplayer/debug_downloads.html) 24.0.0.221|2017年02月|
|エディタ|Visual Stduio Code 1.9.1|2017年01月|
|拡張機能|NextGen ActionScript 0.3.1|不明|
|ブラウザ|Mozilla Firefox 51.0.1|2017年01月|
|その他|Java 1.8.0_121（Java SE 8）|2017年01月|

1. Apache Flex SDK のインストール  
    1. https://flex.apache.org/ にアクセス
    1. [DOWNLOAD FLEX]→[SDK BINARIES] を選択
    1. apache-flex-sdk-4.15.0-bin.tar.gz をダウンロード
    1. ダウンロードした .tar.gz ファイルをデスクトップ上に「展開」
    1. フォルダ名を apache-flex-sdk-4.15.0-bin → flex_sdk に変更
    1. 端末でフォルダの移動  
    $ sudo mv /home/（ユーザー名）/デスクトップ/flex_sdk /opt/
    1. 端末でバージョン確認  
    $ /opt/flex_sdk/bin/mxmlc -version  
    Version 4.15.0 build 20160104

1. Java（Flex SDKに必要）のインストール
    1. 端末でバージョン確認  
    $ java -version  
    openjdk version "1.8.0_121"
    1. 最新版のインストール（オプション）  
    $ sudo apt-get install openjdk-8-jdk

1. Visual Studio Codeに拡張機能の追加
    1. [表示]→[機能拡張] を選択
    1. NextGen ActionScript を検索しインストール

1. Adobe PlayerGlobal のダウンロード
    1. Adobe Flash Player サポートセンターにアクセス  
    http://www.adobe.com/jp/support/flashplayer/debug_downloads.html
    1. [最新版のplayerglobal.swcをダウンロード] を選択しダウンロード
    1. /opt/flex_sdk/frameworks/libs/ に /player/11.1/ フォルダを作成
    1. ダウンロードした playerglobal24_0.swc を /opt/flex_sdk/frameworks/libs/player/11.1/ にそのまま複製（展開しない）
    1. ファイル名を playerglobal24_0.swc → playerglobal.swc に変更

1. 設定ファイルの変更
    1. コードエディタで /opt/flex_sdk/frameworks/flex-config.xml を開く
    1. {playerglobalHome} → libs/player に変更  
    64行目 <path-element>libs/player/{targetPlayerMajorVersion}...  
    84行目 <path-element>libs/player/{targetPlayerMajorVersion}...  



## コードの記述

1. Visual Studio Code を起動
    1. [ファイル]→[新規ファイル] を選択
    1. [ファイル]→[保存] を選択
    1. 任意の場所（今回はデスクトップ上に actionscript フォルダを作成）に Main.as という名で保存

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

1. Visual Studio Code で [表示]→[総合ターミナル] を選択（端末でも可）

1. Main.as ファイルのあるディレクトリに移動  
$ cd /home/（ユーザー名）/デスクトップ/actionscript

1. コンパイラ（mxmlc）でコンパイル（.as → .swf） 
$ /opt/flex_sdk/bin/mxmlc Main.as  
設定ファイル "/opt/flex_sdk/frameworks/flex-config.xml" をロードしています  
/home/（ユーザー名）/デスクトップ/actionscript/Main.swf (640 バイト)

1. Main.as ファイルと同階層に Main.swf ファイルが生成されたのを確認

## HTMLファイルの記述

1. Visual Studio Code を起動

1. Main.as ファイルと同階層に index.html ファイルを作成

```
<!DOCTYPE html>
<html>
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

## 動作確認

1. Flash Player 対応の Web ブラウザ（Firefox）を起動

1. [ファイル]→[ファイルを開く] で上記の index.html を開く  
550 x 400 の矩形のステージ上の左上に Hello, world! と表示されたら成功！

***
作成日: 2017年02月22日
