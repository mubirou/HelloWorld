# R言語（ Linux ）

## R言語について

* 1996年に登場した統計解析専用のプログラミング言語（ ≠ 汎用プログラミング言語）
* クラスの作成法に ① S3 ② S4 ③ R5 ④ R6（追加パッケージが必要） がある
* 変数の定義は「変数<-値」とする
* 「.」に特別な意味はなく変数の命名にも利用可能

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|Ubuntu 16.04.2 LTS|2017年02月|
|実行エンジン|[R](http://bit.ly/2mJj45s) 3.2.3|2015年12月|
|エディタ|Visual Studio Code 1.9.1|2017年01月|

1. 端末で R のインストール  
    $ sudo apt-get update  
    $ sudo apt-get install r-base-core  
    $ R ←Rの起動  
    ……  
    \> sessionInfo() ←バージョン確認  
    R version 3.2.3 (2015-12-10)  
    ……  
    \> q() ←終了

## コードの記述

1. Visual Studio Code を起動
    1. [ファイル] → [新規ファイル] を選択
    1. [ファイル] → [保存] を選択
    1. 任意の場所（今回はデスクトップ上に R フォルダを作成）に test<b>.R</b> という名で保存  

1. コードの記述（ R5 クラスの場合）
```
#test.R
setRefClass("MyClass", #クラス名
    #フィールドの定義
    fields = list(),

    #メソッドの定義
    methods = list(
        #コンストラクタ
        initialize = function() {
            cat("Hello,world!\n")
        }
    )
)
new("MyClass")
```

## 実行

1. Visual Studio Code で [表示] → [総合ターミナル] を選択（端末でも可）

1. test.R ファイルのあるディレクトリに移動  
$ cd /home/（ユーザー名）/デスクトップ/R

1. 実行  
$ R  
……  
\> source("test.R")  
Hello,world! ←と表示されたら成功！  
\> q() ←終了

***
作成者: vvestvillage  
作成日: 2017年03月01日