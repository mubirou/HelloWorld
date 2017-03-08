# Python（ Linux ）

## Pythonについて

* 1991年に登場した汎用プログラミング言語（コンパイル不要）
* [Python](https://ja.wikipedia.org/wiki/Python) 3 系（3.6.0）と 2 系（2.7.13）、同時に開発中
* 標準を含めライブラリが充実
* 記述には {} や ; が不要
* [Blender](https://ja.wikipedia.org/wiki/Blender) で採用（Blender 2.5 以降は Python 3系）

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|Ubuntu 16.04.2 LTS|2017年02月|
|実行エンジン|Python 3.5.2|2016年06月|
|エディタ|Visual Studio Code 1.9.1|2017年01月|
|拡張機能|[Python](https://github.com/DonJayamanne/pythonVSCode) 0.5.8|2017年02月|

1. 端末でバージョン確認  
    $ python --version  
    Python 2.7.12

    $ python3 --version  
    Python 3.5.2

    $ ls -l \`which python\` ←デフォルトの Python を調べる  
    lrwxrwxrwx 1 root root 9  9月 16 09:40 /usr/bin/python -> python2.7

1. PyLing（コードの質のチェック用）のインストール  
    $ sudo apt-get update  
    $ sudo apt-get install pylint  

1. Visual Studio Codeに拡張機能の追加  
    [表示] → [拡張機能] から [Python（Don Jayamanne）](https://github.com/DonJayamanne/pythonVSCode) を検索＆インストール

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

1. Visual Studio Code で [表示] → [総合ターミナル] を選択（端末でも可）

1. test.py ファイルのあるディレクトリに移動  
$ cd /home/（ユーザー名）/デスクトップ/Python

1. 実行  
$ python3 test.py  
Hello,world! ←…と表示されたら成功！

***
作成者: Takashi Nishimura  
作成日: 2017年03月01日
