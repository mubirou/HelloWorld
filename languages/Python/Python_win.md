# Python（ Windows ）

## Pythonについて

* 1991年に登場した汎用プログラミング言語（コンパイル不要）
* 標準を含めライブラリが充実
* 記述には {} や ; が不要
* インデントが重要な意味を持ち、同じ数の空白でインデントされた文がブロックとみなされる
* [Blender](https://ja.wikipedia.org/wiki/Blender) で採用（Blender 2.5 以降は Python 3系）

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|[Windows](https://ja.wikipedia.org/wiki/Microsoft_Windows) 10（64bit）|ー|
|実行エンジン|[Python](https://www.python.org/) 3.9.5|2021年05月|
|エディタ|Visual Studio Code 1.56.2|2021年05月|
|拡張機能|Python（Microsoft）|2021年05月|

1. Python 3 のインストール
    1. https://www.python.org/ にアクセス
    1. [Downloads]-[Windows] の [Download Windows installer (64-bit)] をクリック
    1. ダウンロードした python-3.9.5-amd64.exe をダブルクリック
    1. [Install Now] を選択、インストール開始  
    1. コマンドプロンプトを起動してバージョン確認  
        \>py --version  
        Python 3.9.5

1. Visual Studio Codeに拡張機能の追加  
    [表示] → [拡張機能] から Python（Microsoft）を検索＆インストール

## コードの記述

1. Visual Studio Code を起動
    1. [ファイル] → [新規ファイル] を選択
    1. [ファイル] → [保存] を選択
    1. 任意の場所（今回はデスクトップ上に作成）に test<b>.py</b> という名で保存  

1. コードの記述
    ```py
    #test.py
    class MyClass(object): #(object)は省略可能
        print("Hello,world!")

    _myClass = MyClass() #インスタンスの生成
    ```

## 実行

1. コマンドプロンプトを起動

1. test.py ファイルのあるディレクトリに移動  
\>cd \Users\（ユーザー名）\Desktop

1. 実行  
\>py test.py  
Hello,world! ←と表示されたら成功！（ファイルは生成されない）

***
作成者: 夢寐郎  
作成日: 2017年03月16日  
更新日: 2021年05月29日