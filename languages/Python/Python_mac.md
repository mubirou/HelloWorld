# Python（ macOS ）

## Pythonについて

* 1991年に登場した汎用プログラミング言語（コンパイル不要）
* [Python](https://ja.wikipedia.org/wiki/Python) 3 系（最新版 3.8.5）と 2 系（最終版 2.7.18）がある
* 標準を含めライブラリが充実
* 記述には {} や ; が不要
* [Blender](https://ja.wikipedia.org/wiki/Blender) で採用（Blender 2.5 以降は Python 3系）

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|[macOS](https://ja.wikipedia.org/wiki/MacOS) 10.15.6|2020年07月|
|実行エンジン|[Python](https://ja.wikipedia.org/wiki/Python) 3.7.3|2019年03月|
|エディタ|Visual Studio Code 1.47.2|2020年07月|
|拡張機能|Python（Microsoft） 2020.7.96456|ー|

1. [Homebrew](https://brew.sh/index_ja.html) にアクセス

1. 指示に従ってターミナルでインストール  
    $ <b>/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"</b>  
    $ brew --version ←バージョン確認  
    Homebrew 2.4.8

1. Python 3 のインストール  
    $ <b>brew install python3</b>  
    $ python3 --version  
    Python 3.7.3

1. Visual Studio Codeに拡張機能の追加  
    [表示] → [拡張機能] から [Python（Microsoft）] を検索＆インストール

## コードの記述

1. Visual Studio Code を起動
    1. [ファイル] → [新規ファイル] → [テキスト エディター] を選択
    1. [ファイル] → [保存] を選択
    1. 任意の場所に test<b>.py</b> という名で保存（今回はデスクトップ上に保存） 

1. コードの記述
```
#test.py
class MyClass(object): #(object)は省略可能
    print("Hello,world!")

_myClass = MyClass() #インスタンスの生成
```

## 実行

1. Visual Studio Code で [表示] → [ターミナル] を選択

1. test.py ファイルのあるディレクトリに移動  
$ cd /Users/（ユーザー名）/Desktop

1. 実行  
$ <b>python3</b> test<b>.py</b>  
Hello,world! ←と表示されたら成功！

***
作成者: 夢寐郎  
作成日: 2017年03月07日  
更新日: 2020年07月26日
