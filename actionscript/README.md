# ActionScript

## 開発環境の構築

|カテゴリ|ソフト名|リリース日|
|:--:|:--:|:--:|
|OS|Ubuntu 16.04 LTS（Linux）|2016年4月|
|コンパイラ|Apache Flex SDK 4.15|2016年1月|
|エディタ|Visual Stduio Code 1.9.1|2017年1月|
|拡張機能|NextGen ActionScript 0.3.1||
|その他|Java 1.8.0_121（Java SE 8）|2017年1月|

1. Apache Flex SDK のインストール  
    1. https://flex.apache.org/ にアクセス
    1. DOWNLOAD FLEX → SDK BINARIES を選択
    1. apache-flex-sdk-4.15.0-bin.tar.gz をダウンロード
    1. ダウンロードした .tar.gz ファイルをデスクトップ上に「展開」
    1. フォルダ名を apache-flex-sdk-4.15.0-bin → flex_sdk に変更
    1. フォルダの移動  
    $ sudo mv /home/xxx/デスクトップ/flex_sdk /opt/
    1. バージョン確認  
    $ /opt/flex_sdk/bin/mxmlc -version  
    Version 4.15.0 build 20160104

1. Java のインストール
    1. バージョン確認  
    $ java -version  
    openjdk version "1.8.0_121"
    1. 最新版のインストール（オプション）  
    $ sudo apt-get install openjdk-8-jdk

1. Visual Studio Codeに拡張機能の追加
    * NextGen ActionScript をインストール

1. 設定ファイルの変更
    1. コードエディタで /opt/flex_sdk/frameworks/flex-config.xml を開く
    1. XXX 

## コードの記述〜実行

1. Visual Studio Code を起動
    1. ファイル → 新規ファイル を選択
    1. ファイル → 保存 を選択
    1. 任意の場所（ここではデスクトップ上に actionscript フォルダを作成）に Main.as という名で保存

1. 

***
作成日: 2017年2月22日（執筆途中です）