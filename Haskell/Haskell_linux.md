# Haskell（ Linux ）

## <ruby>Haskell<rt>ハスケル</rt></ruby> について

* 1985年に登場した純粋[関数型言語](http://bit.ly/1KTmmNW)
* 数学プログラムを記述するのに適すると言われる

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|Ubuntu 16.04.2 LTS|2017年02月|
|コンパイラ| [GHC](https://www.haskell.org/ghc/) 7.10.3|2015年12月|
|エディタ|Visual Studio Code 1.9.1|2017年01月|
|拡張機能|[Haskell Syntax Highlighting](http://bit.ly/2l6sqMc) 2.0.0|2017年02月|

1. 端末でコンパイラのインストール  
    $ sudo apt-get update  
    $ sudo apt-get install ghc ←Haskellコンパイラのインストール  
    $ ghc --version ←Haskellコンパイラのバージョン確認  
    The Glorious Glasgow Haskell Compilation System, version 7.10.3

1. Visual Studio Codeに拡張機能の追加  
    [表示] → [拡張機能] から [Haskell Syntax Highlighting](http://bit.ly/2l6sqMc) を検索＆インストール

## コードの記述

1. Visual Studio Code を起動
    1. [ファイル] → [新規ファイル] を選択
    1. [ファイル] → [保存] を選択
    1. 任意の場所（今回はデスクトップ上に Haskell フォルダを作成）に test<b>.hs</b> という名で保存

1. コードの記述
```
--test.hs
--main関数
main = do --最初に実行される（doは省略可能）
    putStrLn "Hello,world!"
```

## コンパイル〜実行

1. Visual Studio Code で [表示] → [総合ターミナル] を選択（端末でも可）

1. test.hs ファイルのあるディレクトリに移動  
$ cd /home/（ユーザー名）/デスクトップ/Haskell

1. コンパイル  
$ ghc test.hs

1. test.hs ファイルと同階層に ① test ② test.o ③ test.hi の3つが生成されたのを確認

1. 実行  
$ ./test  
Hello,world! ←と表示されたら成功！

***
作成者: Takashi Nishimura  
作成日: 2017年02月28日
