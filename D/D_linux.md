# D言語（ Linux ）

## D言語について

* C言語をベースにしたオブジェクト指向および[関数型](http://bit.ly/1KTmmNW)のプログラミング言語
* C言語の後継を目指して開発（C言語との互換性はない）
* 2001年に Ver.0.001 が、2006年に Ver.1.0 のコンパイラが登場
* 2013年、Facebook の社内ツール開発に採用

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|Ubuntu 16.04.2 LTS|2017年02月|
|コンパイラ|[GDC](https://github.com/D-Programming-GDC) 5.4.0|2016年07月|
|エディタ|Visual Studio Code 1.9.1|2017年01月|
|拡張機能|[Code-D](https://github.com/Pure-D/code-d)|ー|

1. D言語コンパイラのインストール  
    $ sudo apt-get update  
    $ sudo apt-get install gdc ←D言語コンパイラのインストール  
    $ gdc --version ←バージョン確認  
    gdc (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609  

1. Visual Studio Codeに拡張機能の追加  
    [表示] → [拡張機能] から Code-D を検索＆インストール

## コードの記述

1. Visual Studio Code を起動
    1. [ファイル] → [新規ファイル] を選択
    1. [ファイル] → [保存] を選択
    1. 任意の場所（今回はデスクトップ上に D フォルダを作成）に test<b>.d</b> という名で保存

1. コードの記述
```
//test.d
import std.stdio; //writeln()に必要

//クラス定義
class MyClass {
    //コンストラクタ
    this() {
        writeln("Hello,world!");
    }
}

//メイン関数
void main() {
    MyClass _myClass = new MyClass();
}
```

## コンパイル〜実行

1. Visual Studio Code で [表示] → [総合ターミナル] を選択（端末でも可）

1. test.d ファイルのあるディレクトリに移動  
$ cd /home/（ユーザー名）/デスクトップ/D

1. コンパイル（.d → a.out）  
$ gdc test.d

1. test.d ファイルと同階層に a.out ファイルが生成されたのを確認

1. 実行  
$ ./a.out  
Hello,world! ←と表示されたら成功！

***
作成者: Takashi Nishimura  
作成日: 2017年02月27日
