# Python（ Windows ）

## Pythonについて

* 1991年に登場した汎用プログラミング言語（コンパイル不要）
* [Python](https://ja.wikipedia.org/wiki/Python) 3 系（3.6.0）と 2 系（2.7.13）、同時に開発中
* 標準を含めライブラリが充実
* 記述には {} や ; が不要
* [Blender](https://ja.wikipedia.org/wiki/Blender) で採用（Blender 2.5 以降は Python 3系）

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|[Windows](https://ja.wikipedia.org/wiki/Microsoft_Windows) 10（64bit）|ー|
|実行エンジン|[Python](https://ja.wikipedia.org/wiki/Python) 3.6.0|2016年12月|
|エディタ|Visual Studio Code 1.10.2|2017年03月|
|拡張機能|[Python（Don Jayamanne）](https://github.com/DonJayamanne/pythonVSCode) 0.6.0|2017年03月|

1. Python 3 のインストール
    1. https://www.python.org/ にアクセス
    1. [Download] の [Python 3.6.0] をクリック
    1. [Files] の [Windows x86-64 executable installer] を選択、ダウンロード
    1. ダウンロードした python-3.6.0-amd64.exe をダブルクリック、インストール開始  
        （冒頭で [Add Python 3.6 to PATH] にチェック）
    1. コマンドプロンプトでバージョン確認  
        \>python --version  
        Python 3.6.0

1. Visual Studio Codeに拡張機能の追加  
    [表示] → [拡張機能] から [Python（Don Jayamanne）](https://github.com/DonJayamanne/pythonVSCode)を検索＆インストール

## コードの記述

1. Visual Studio Code を起動
    1. [ファイル] → [新規ファイル] を選択
    1. [ファイル] → [保存] を選択
    1. 任意の場所（今回はデスクトップ上に Python フォルダを作成）に test<b>.py</b> という名で保存  

1. コードの記述
    ```
    #test.py
    class MyClass(object): #(object)は省略可能
        print("Hello,world!")

    _myClass = MyClass() #インスタンスの生成
    ```

## 実行

1. コマンドプロンプトを起動

1. test.py ファイルのあるディレクトリに移動  
\>cd \Users\（ユーザー名）\Desktop\Python

1. 実行  
\>python test.py  
Hello,world! ←…と表示されたら成功！（ファイルは生成されない）

***
作成者: Takashi Nishimura  
作成日: 2017年03月16日