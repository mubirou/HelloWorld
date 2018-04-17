# R言語（ Windows ）

## R言語について

* 1996年に登場した統計解析専用のプログラミング言語（ ≠ 汎用プログラミング言語）
* クラスの作成法に ① S3 ② S4 ③ R5 ④ R6（追加パッケージが必要） がある
* 変数の定義は「変数<-値」とする
* 「.」に特別な意味はなく変数の命名にも利用可能

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|[Windows](https://ja.wikipedia.org/wiki/Microsoft_Windows) 10（64bit）|ー|
|実行エンジン|[R](http://bit.ly/2mJj45s) 3.3.3|2017年03月|
|エディタ|Visual Studio Code 1.10.2|2017年03月|

1. [R](http://bit.ly/2mJj45s) のインストール
    1. https://www.r-project.org/ にアクセス
    1. [Download] → [CRAN] をクリックし、任意の Mirror サイトを選択
    1. [Download R for Windows] をクリック
    1. [install R for the first time] → [Download R 3.3.3 for Windows] を選択
    1. ダウンロードした R-3.3.3-win.exe をダブルクリックし、指示に従いインストール

1. [環境変数](http://bit.ly/2lCIAgK)の設定  
    1. タスクバーのスタートボタンを右クリック → [コントロールパネル] → [システムとセキュリティ] → [システム] → [システムの詳細設定] → [環境変数] を開く
    1. [システム環境変数] で変数 "Path" を探して選択 → [編集] ボタンをクリック
    1. 変数値の最後に ;C:\Program Files\R\R-3.3.3\bin を追加（R.exeが存在）
    1. Windows を再起動
    1. コマンドプロンプトでバージョン確認  
        \>R --version  
        R version 3.3.3 (2017-03-06) -- "Another Canoe"

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

1. コマンドプロンプトを起動

1. test.R ファイルのあるディレクトリに移動  
\>cd \Users\（ユーザー名）\Desktop\R

1. 実行  
\>R --vanilla  --slave < test.R  
Hello,world! ←と表示されたら成功！（ファイルは生成されない）  
Reference class object of class "MyClass"

***
作成者: Takashi Nishimura  
作成日: 2017年03月16日