# Go（ Windows ）

## Goについて

* 2009年に登場した Google が開発したプログラミング言語
* 当初は Linux 、Mac OS X のみに対応、Ver.1.0（2012年リリース）からは Windows もサポート
* クラスや継承は非サポート、構造体（structure）・メソッド（method）、インターフェース（interface）はサポート

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|[Windows](https://ja.wikipedia.org/wiki/Microsoft_Windows) 10（64bit）|ー|
|コンパイラ|[Go](http://bit.ly/2lPWKrt) 1.8|2017年02月|
|エディタ|Visual Studio Code 1.10.2|2017年03月|
|拡張機能|go（lukehoban） 0.6.55|ー|

1. [Go](http://bit.ly/2lPWKrt) のインストール  
    1. https://golang.org/dl/ にアクセス
    1. Featured downloads（お勧め）の中から Microsoft Windows の go1.8.windows-amd64.msi を選択、ダウンロード
    1. ダウンロードした go1.8.windows-amd64.msi をダブルクリックしインストール
    1. Windows を再起動後、コマンドプロンプトでバージョン確認  
        \>go version  
        go version go1.8 windows/amd64

1. Visual Studio Codeに拡張機能の追加  
    [表示] → [拡張機能] から go（lukehoban） を検索＆インストール

## コードの記述

1. Visual Studio Code を起動
    1. [ファイル] → [新規ファイル] を選択
    1. [ファイル] → [保存] を選択
    1. 任意の場所（今回はデスクトップ上に Go フォルダを作成）に test<b>.go</b> という名で保存

1. コードの記述
```
//test.go
package main //mainパッケージ
import "fmt" //Printf()に必要

func main() { //main関数（最初に実行される）
    fmt.Printf("Hello,world!\n")
}
```

## 実行

1. コマンドプロンプトを起動

1. test.go ファイルのあるディレクトリに移動  
\>cd \Users\（ユーザー名）\Desktop\Go

1. 実行  
\>go run test.go  
Hello,world! ←と表示されたら成功！（ファイルは生成されない）

***
作成者: vvestvillage  
作成日: 2017年03月16日