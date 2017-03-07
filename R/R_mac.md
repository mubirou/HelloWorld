# R言語（ macOS ）

## R言語について

* 1996年に登場した統計解析専用のプログラミング言語（ ≠ 汎用プログラミング言語）
* クラスの作成法に ① S3 ② S4 ③ R5 ④ R6（追加パッケージが必要） がある
* 変数の定義は「変数<-値」とする
* 「.」に特別な意味はなく変数の命名にも利用可能

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|[macOS Sierra](https://ja.wikipedia.org/wiki/MacOS_Sierra) 10.12.3|2017年01月|
|実行エンジン|[R](http://bit.ly/2mJj45s) 3.3.2|2016年10月|
|エディタ|Visual Studio Code 1.10.1|2017年03月|

1. [Homebrew](https://brew.sh/index_ja.html) にアクセス

1. 指示に従ってターミナルでインストール  
    $ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"  
    $ brew --version ←バージョン確認  
    Homebrew 1.1.10

1. ターミナルでインストール  
    $ brew tap homebrew/science ←エラー回避の為  
    $ brew install R  
    $ R --version  
    R version 3.3.2 (2016-10-31) -- "Sincere Pumpkin Patch"

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

1. Visual Studio Code で [表示] → [総合ターミナル] → [端末] を選択（ターミナルでも可）

1. test.R ファイルのあるディレクトリに移動  
$ cd /Users/（ユーザー名）/Desktop/R

1. 実行  
$ R  
……  
\> source("test.R")  
Hello,world! ←…と表示されたら成功！（ファイルは生成されない）  
\> q() ←終了

***
作成者: Takashi Nishimura  
作成日: 2017年03月07日