# Python（ Linux ）

## Pythonについて

* 1991年に登場した汎用プログラミング言語（コンパイル不要）
* [Python](https://ja.wikipedia.org/wiki/Python) 3 系（最新版 3.9.5）の他に 2 系（最終版 2.7.18）があったが、2020年に 2 系は正式に廃止された
* 標準を含めライブラリが充実
* 記述には {} や ; が不要
* インデントが重要な意味を持ち、同じ数の空白でインデントされた文がブロックとみなされる
* [Blender](https://ja.wikipedia.org/wiki/Blender) で採用（Blender 2.5 以降は Python 3系）

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|Ubuntu 20.04.2 LTS|2021年02月|
|実行エンジン|Python 3.8.5|2020年07月|
|エディタ|Visual Studio Code 1.56.2|2021年05月|
|拡張機能|Python 2021.5.842923320|ー|

1. 端末でバージョン確認  
    $ <b>python3 --version</b>  
    Python 3.8.5  
    （which python3 でパスを調べることも可能）

1. Pylint（コードの質のチェック用）のインストール  
    $ sudo apt-get update  
    $ <b>sudo apt-get install pylint</b>  

1. Visual Studio Codeに拡張機能の追加  
    [表示] → [拡張機能]（Ctrl+Shift+X）から Python（Microsoft）を検索＆インストール

## コードの記述

1. Visual Studio Code を起動
    1. [ファイル] → [新規ファイル] を選択
    1. [ファイル] → [保存] を選択
    1. 任意の場所（今回はデスクトップ上に作成）に test<b>.py</b> という名で保存  

1. コードの記述
```
#test.py
class MyClass(object): #(Object)は省略可能
    print("Hello,world!")

_myClass = MyClass() #インスタンスの生成
```

## 実行

1. Visual Studio Code で [表示] → [ターミナル] を選択（端末でも可）

1. test.py ファイルのあるディレクトリに移動  
$ cd /home/（ユーザー名）/デスクトップ

1. 実行  
$ <b>python3</b> test<b>.py</b>  
Hello,world! ←と表示されたら成功！

***
作成者: 夢寐郎  
作成日: 2017年03月01日    
更新日: 2021年05月27日
