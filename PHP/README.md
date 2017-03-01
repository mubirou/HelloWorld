# PHP

## PHPについて

* [PHP:Hypertext Preprocessor](https://ja.wikipedia.org/wiki/PHP:_Hypertext_Preprocessor)
* 1995年に登場、2015年には PHP 5.X → 7.0 に約10年ぶりのメジャーバージョンアップ（互換性は維持）
* [サーバーサイド・スクリプト](http://bit.ly/2lajhCj)言語として [Webサーバ](http://bit.ly/2mbzR4D)上で動作するプログラミング言語

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|Ubuntu 16.04.2 LTS|2017年02月|
|Web サーバ|Apache 2.4.18|2016年07月|
|実行エンジン|PHP 7.0.15|2017年01月|
|エディタ|Visual Studio Code 1.9.1|2017年01月|
|拡張機能|PHP Debug 1.10.0|不明|
|ブラウザ|Mozilla Firefox 51.0.1|2017年01月|

1. 端末で Web サーバのインストール＆起動  
    $ sudo apt-get update  
    $ sudo apt-get install apache2  
    $ apache2 -v ←バージョン確認  
    Server version: Apache/2.4.18 (Ubuntu)  
    Server built:   2016-07-14T12:32:26  

    * Web サーバの操作（参考）  
        $ service apache2 start ←起動（上記の作業で起動済）  
        $ service apache2 stop ←終了  
        $ service apache2 restart ←再起動

1. PHP のインストール  
    $ sudo apt-get update  
    $ sudo apt-get install php php-mysql php-sqlite3 libapache2-mod-php php-cgi php-common php-pear php-mbs
tring  
    $ service apache2 restart  
    $ php -v ←バージョン確認  
    PHP 7.0.15-0ubuntu0.16.04.2 (cli) ( NTS )  
    Copyright (c) 1997-2017 The PHP Group  
    Zend Engine v3.0.0, Copyright (c) 1998-2017 Zend Technologies  
    with Zend OPcache v7.0.15-0ubuntu0.16.04.2, Copyright (c) 1999-2017, by Zend Technologies

1. エラー表示を有効にする（<b>本番環境では Off に戻す</b>）  
    $ vi /etc/php/7.0/apache2/php.ini ←PHP設定ファイルを開く  
    ```
    462行目 display_errors = On  
    ```
    * Vi エディタの使い方（参考）
        * 入力モード: [i]
        * 編集モード: [Esc]
        * 行番号表示: [Esc] → 「:set number」
        * 指定行へジャンプ: [Esc] → 「:行番号」
        * 保存せず終了: [Esc] → 「:q!」
        * 保存して終了: [Esc] → 「ZZ」

1. Visual Studio Codeに拡張機能の追加  
    [表示]→[機能拡張] から PHP Debug を検索＆インストール

## コードの記述

1. Visual Studio Code を起動
    1. [ファイル]→[新規ファイル] を選択
    1. [ファイル]→[保存] を選択
    1. Web サーバのルートディレクトリ（ /ver/www/html/ ）に index<b>.php</b> という名で保存  

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
    PHP に関する各種設定情報を確認したい場合、以下のコードを記述して Web サーバのルートディレクトリ（ /ver/www/html/ ）に test.php という名で保存し、下記と同様の方法で実行する  
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

***
作成者: Takashi Nishimura  
作成日: 2017年03月01日
