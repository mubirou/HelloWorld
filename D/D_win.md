# D言語（ Windows ）

## D言語について

* C言語をベースにしたオブジェクト指向および[関数型](http://bit.ly/1KTmmNW)のプログラミング言語
* C言語の後継を目指して開発（C言語との互換性はない）
* 2001年に Ver.0.001 が、2006年に Ver.1.0 のコンパイラが登場
* 2013年、Facebook の社内ツール開発に採用

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|[Windows](https://ja.wikipedia.org/wiki/Microsoft_Windows) 10（64bit）|ー|
|コンパイラ|[DMD Compiler](https://dlang.org/dmd-windows.html) 2.073.2|2017年03月|
|エディタ|Visual Studio Code 1.10.2|2017年03月|
|拡張機能|D Programming Language（webfreak）0.16.1|2017年03月|

1. [D言語](http://bit.ly/2nqHu4F)コンパイラのインストール  
    1. [Install.exe] ボタンを選択、ダウンロード
    1. ダウンロードした dmd-2.073.2.exe をダブルクリック、指示に従いインストール（設定はデフォルト） 
    1. Visual Studio に続き D Programming Language Setup が起動したら Select Components to install で D2 に加え、<b>Extras</b> もチェック（以下の3つもチェックされる）
        * Download Visual D
        * Download DMC
        * Download D1
    1. インストール途中、D1 Programming Language Setup 画面で Add to PATH をチェック
    1. コマンドプロンプトでバージョン確認  
        \>dmd --version  
        DMD32 D Compiler v2.073.2

1. Visual Studio Codeに拡張機能の追加  
    [表示] → [拡張機能] から D Programming Language（webfreak）を検索＆インストール

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

1. コマンドプロンプトを起動

1. test.d ファイルのあるディレクトリに移動  
\>cd \Users\（ユーザー名）\Desktop\D

1. コンパイル（.d → .exe、.obj）  
\>dmd test.d

1. test.d ファイルと同階層に test.exe ファイル（実行ファイル）と test.obj ファイルが生成されたのを確認

1. 実行  
\>test.exe  
Hello,world! ←と表示されたら成功！

***
作成者: Takashi Nishimura  
作成日: 2017年03月15日