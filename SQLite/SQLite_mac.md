### この項目は編集中です

# SQLite（ macOS ）

## <ruby>SQLite<rt>エスキューライト</rt></ruby> について

* 2000年に登場したオープンソースの軽量コンパクトな [RDBMS](http://bit.ly/2lunAUm)。
* 大規模なシステムには不向きだが、中小規模のデータを扱う限りでは高速に処理（同時書き込みが不可）。
* ファイル単位で処理されるためバックアップが容易。
* データベースユーザーの概念が無いため、パスワードの設定は不可。
* [.htacess](http://www.weblio.jp/content/Htaccess) を使い .sqlite3 ファイルに対してアクセス制限を設定しないとファイル（xxx.sqlite3）を直接ダウンロード出来てしまう。
* データの操作を行う[問い合わせ言語](http://bit.ly/2mvUUPR)として [SQL](https://ja.wikipedia.org/wiki/SQL) を利用。

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|[macOS Sierra](https://ja.wikipedia.org/wiki/MacOS_Sierra) 10.12.6|2017年07月|
|ソフトウェア|[MAMP](https://www.mamp.info/en/) 4.1.1|2017年02月|
|Web サーバ|Apache 2.2.31|2015年07月|
|データベース|[SQLite](https://ja.wikipedia.org/wiki/SQLite) 3.15.1|2016年11月|
|実行エンジン|PHP 7.1.1|2017年01月|
|エディタ|Visual Studio Code 1.14.2|2017年06月|
|拡張機能|PHP Debug 1.11.1|2017年07月|
|拡張機能|[vscode-database](http://bit.ly/2mh8nYF) 1.2.0|ー|
|ブラウザ|Safari 10.1.2|2017年07月|

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
        * SQLite 3.15.1
    1. バージョン確認（以下の xxx.php を Web サーバ上で実行）  
    ※ドキュメントルートは MacintoshHD > アプリケーション > MAMP > htdocs  
    ```
    <?php
        $con = new PDO('sqlite::memory:', null, null);
        $statement = $con->prepare('SELECT sqlite_version()');
        $statement->execute();
        echo $statement->fetchColumn(); //=> 3.15.1
    ?>
    ```

1. ポートの変更
    1. MAMP を起動
    1. [Preferences...] → [Ports] を選択
    1. ポート番号を次の通りに変更  
        * Apache ポート: 8888 → 80

1. Web サーバのルートディレクトリの確認  
    1. MAMP を起動
    1. [Preferences...] → [Web Server] を選択  
    ※ドキュメントルートは MacintoshHD > アプリケーション > MAMP > htdocs

1. Visual Studio Codeに拡張機能の追加  
    [表示] → [拡張機能] から PHP Debug と [vscode-database](http://bit.ly/2mh8nYF) を検索＆インストール

## コードの記述

1. Visual Studio Code を起動
    1. [ファイル] → [新規ファイル] を選択
    1. [ファイル] → [保存] を選択
    1. Web サーバのルートディレクトリ（ アプリケーション > MAMP > htdocs ）に test<b>.php</b> という名で保存  

1. コードの記述（test.php）
```
<?php
    // データベースの作成（既存の場合はファイルを開く）
    $con = new PDO("sqlite:test.sqlite3"); //慣例的に xxx.sqlite3 とする

    // テーブルの作成（xxx_tb が無い場合のみ作成）
    $sql = "CREATE TABLE IF NOT EXISTS hello_tb(country TEXT, words TEXT)";
    $statement = $con->prepare($sql); //prepare() メソッド
    $statement->execute();

    //データの挿入（今回のサンプルでは実行する度に追加される）
    $sql = "INSERT INTO hello_tb VALUES('english', 'Hello,world!')";
    $statement = $con->prepare($sql);
    $statement->execute();

    //データの抽出
    $sql = "SELECT * FROM hello_tb WHERE country='english'";
    $statement = $con->prepare($sql);
    $statement->execute();
    foreach ($statement as $theRecord) {
        echo $theRecord["words"]."<br>";
    }
?>
```

## 実行

1. Web ブラウザ（Safari）を起動

1. [localhost](https://ja.wikipedia.org/wiki/Localhost)/test.php を開く

1. Hello,world! と表示されたら成功！

***
作成者: Takashi Nishimura  
作成日: 2017年03月25日
