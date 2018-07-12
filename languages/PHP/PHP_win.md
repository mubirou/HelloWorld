# PHP（ Windows ）

## PHPについて

* [PHP:Hypertext Preprocessor](https://ja.wikipedia.org/wiki/PHP:_Hypertext_Preprocessor)
* 1995年に登場、2015年には PHP 5.X → 7.0 に約10年ぶりのメジャーバージョンアップ（互換性は維持）
* [サーバーサイド・スクリプト](http://bit.ly/2lajhCj)言語として [Webサーバ](http://bit.ly/2mbzR4D)上で動作するプログラミング言語

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|[Windows](https://ja.wikipedia.org/wiki/Microsoft_Windows) 10（64bit）|ー|
|ソフトウェア|[XAMPP](https://ja.wikipedia.org/wiki/XAMPP) 7.1.1|2017年2月|
|Web サーバ|Apache 2.4.25|2016年12月|
|実行エンジン|PHP 7.1.1|2017年01月|
|エディタ|Visual Studio Code 1.10.2|2017年03月|
|拡張機能|PHP Debug 1.10.0|ー|
|ブラウザ|Google Chrome 57.0.2987.98|2017年03月|

1. [XAMPP](https://ja.wikipedia.org/wiki/XAMPP) のインストール
    1. https://www.apachefriends.org/download.html にアクセス
    1. [XAMPP for Windows 5.6.30, 7.0.15 & 7.1.1] の [7.1.1 / PHP 7.1.1] の [Download（32bit）] をクリック、ダウンロード
    1. ダウンロードした .exe ファイルをダブルクリック、インストール
    1. XAMPP Control Panel が起動したら以下の Service の [Start] ボタンをクリック
        * Apache
        * MySQL

1. C:\xampp\htdocs に以下の内容の test.php ファイルを置き、Webブラウザで localhost/test.php を開いて各種情報を確認（<b>本番環境ではセキュリティ上削除しておく</b>）
    ```
    <?php phpinfo(); ?>
    ```

1. エディタで C:\xampp\php\php.ini を開いて、エラー表示が有効か確認する（<b>本番環境では Off にする</b>）
    ```
    477行目 display_errors=On  
    ```

1. Visual Studio Codeに拡張機能の追加  
    [表示] → [拡張機能] から PHP Debug を検索＆インストール

## コードの記述

1. Visual Studio Code を起動
    1. [ファイル] → [新規ファイル] を選択
    1. [ファイル] → [保存] を選択
    1. Web サーバのルートディレクトリ（ C:\xampp\htdocs ）に index<b>.php</b> という名で保存  

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

## 実行

1. Web ブラウザ（Google Chrome）を起動

1. [localhost](https://ja.wikipedia.org/wiki/Localhost)/index.php を開く

1. Hello,world! と表示されたら成功！

***
作成者: mubirou  
作成日: 2017年03月16日