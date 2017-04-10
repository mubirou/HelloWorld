# FORTRAN（ Windows ）

## FORTRANについて

* 1957年に登場した世界初の[高水準言語](http://bit.ly/2muGA71)
* 科学技術計算向きの[手続き型プログラミング言語](http://bit.ly/1Kf0zk6)
* Fortran 2003 からオブジェクト指向プログラミングもサポート
* 非常に多くの数学関数が用意され[スーパーコンピュータ](http://bit.ly/2lWpgK7)でも活用されている
* 長い歴史を持つ言語でありながら現在も進化を続けている（最新は Fortran 2008 ）

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|[Windows](https://ja.wikipedia.org/wiki/Microsoft_Windows) 10（64bit）|ー|
|開発環境|[MinGW](https://ja.wikipedia.org/wiki/MinGW) |ー|
|コンパイラ|[GFortran](https://ja.wikipedia.org/wiki/GFortran) 5.3.0|2016年12月|
|エディタ|Visual Studio Code 1.10.2|2017年03月|
|拡張機能|fortran（Xavier Hahn）0.1.0|ー|

1. [MinGW](https://ja.wikipedia.org/wiki/MinGW) のインストール  
    1. http://www.mingw.org/ にアクセス
    1. [Download Installer] ボタンを選択、ダウンロード
    1. ダウンロードした mingw-get-setup.exe をダブルクリック、インストール
    1. [MinGW Installation Manager] が起動したら次の2つを選択  
        * mingw-developer-toolkit
        * mingw32-base
        * <b>mingw32-gcc-fortran</b>
        * mingw32-gcc-g++
        * msys-base
    1. メニューの [Installation] → [Apply Changes] → [Apply] を選びインストール

1. [環境変数](http://bit.ly/2lCIAgK)の設定  
    1. タスクバーのスタートボタンを右クリック → [コントロールパネル] → [システムとセキュリティ] → [システム] → [システムの詳細設定] → [環境変数] を開く
    1. [システム環境変数] で変数 "Path" を探して選択 → [編集] ボタンをクリック
    1. 変数値の最後に ;C:\MinGW\bin を追加
    1. Windows を再起動
    1. コマンドプロンプトでバージョン確認  
        \>gfortran --version  
        GNU Fortran (GCC) 5.3.0

1. Visual Studio Codeに拡張機能の追加  
    [表示] → [拡張機能] から fortran（Xavier Hahn）を検索＆インストール

## コードの記述

1. Visual Studio Code を起動
    1. [ファイル] → [新規ファイル] を選択
    1. [ファイル] → [保存] を選択
    1. 任意の場所（今回はデスクトップ上に FORTRAN フォルダを作成）に test<b>.f</b> という名で保存

1. コードの記述（<b>7文字目から書き始めます＝6文字空白</b>）
```
      !test.f
      program hello
        print *, "Hello,world!"
      end program hello
```

## コンパイル〜実行

1. コマンドプロンプトを起動

1. test.f ファイルのあるディレクトリに移動  
\>cd \Users\（ユーザー名）\Desktop\FORTRAN

1. コンパイル（test.f → test）  
\>gfortran -o test test.f

1. test.f ファイルと同階層に test.exe ファイル（実行ファイル）が生成されたのを確認

1. 実行  
\>test.exe  
 Hello,world! ←と表示されたら成功！

***
作成者: Takashi Nishimura  
作成日: 2017年03月16日