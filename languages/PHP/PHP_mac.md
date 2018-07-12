# PHP（ macOS ）

## PHPについて

* [PHP:Hypertext Preprocessor](https://ja.wikipedia.org/wiki/PHP:_Hypertext_Preprocessor)
* 1995年に登場、2015年には PHP 5.X → 7.0 に約10年ぶりのメジャーバージョンアップ（互換性は維持）
* [サーバーサイド・スクリプト](http://bit.ly/2lajhCj)言語として [Webサーバ](http://bit.ly/2mbzR4D)上で動作するプログラミング言語

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|[macOS Sierra](https://ja.wikipedia.org/wiki/MacOS_Sierra) 10.12.3|2017年01月|
|ソフトウェア|[MAMP](https://www.mamp.info/en/) 4.1.1|ー|
|Web サーバ|Apache 2.2.31|2015年07月|
|実行エンジン|PHP 7.1.1|2017年01月|
|エディタ|Visual Studio Code 1.10.1|2017年03月|
|拡張機能|PHP Debug 1.10.0|ー|
|ブラウザ|Safari 10.0.3|2017年01月|

1. [MAMP](https://www.mamp.info/en/) のインストール
    1. https://www.mamp.info/en/ にアクセス
    1. [DOWNLOAD] → [Download] を選び、ダウンロード
    1. ダウンロードした MAMP_MAMP_PRO_4.1.1.pkg ファイルをダブルクリック
    1. 指示に従ってインストール
    1. [移動] → [アプリケーション] → [MAMP] → MAMP をダブルクリックして起動
    1. [Open WebStart page] を選択（Webページが開く）
    1. [phpinfo] を選択してバージョンを確認
        * Apache 2.2.31
        * PHP 7.1.1

1. ポートの変更
    1. MAMP を起動
    1. [Preferences...] → [Ports] を選択
    1. ポート番号を次の通りに変更  
    * Apache ポート: 8888 → <b>80</b>
    * MySQL ポート: 8889 → 3306

1. Web サーバのルートディレクトリの確認  
    1. MAMP を起動
    1. [Preferences...] → [Web Server] を選択  
    初期値は Document Root: MacintoshHD > アプリケーション > MAMP > htdocs  
    （ /Applications/MAMP/htdocs/ と同意）

1. Visual Studio Codeに拡張機能の追加  
    [表示] → [拡張機能] から PHP Debug を検索＆インストール

## コードの記述

1. Visual Studio Code を起動
    1. [ファイル] → [新規ファイル] を選択
    1. [ファイル] → [保存] を選択
    1. Web サーバのルートディレクトリ（ アプリケーション > MAMP > htdocs ）に index<b>.php</b> という名で保存  

1. コードの記述
```
<?php
class MyClass {
    //コンストラクタ
    function __construct() {
        echo "Hello,world!";
    }
}
$myClass = new MyClass();
?>
```

* [phpinfo()](http://php.net/manual/ja/function.phpinfo.php) の表示（参考）  
    PHP に関する各種設定情報を確認したい場合、以下のコードを記述して下記と同様の方法で実行する  
    ※<b>本番環境ではセキュリティ上削除しておく</b>

```
<?php
phpinfo();
?>
```

## 実行

1. Web ブラウザ（Firefox）を起動

1. [localhost](https://ja.wikipedia.org/wiki/Localhost)/index.php を開く

1. Hello,world! と表示されたら成功！

* エラー表示について  
/Applications/MAMP/logs/php_error.log に逐次記録される  

***
作成者: mubirou  
作成日: 2017年03月07日