# Go（ macOS ）

## Goについて

* 2009年に登場した Google が開発したプログラミング言語
* 当初は Linux 、Mac OS X のみに対応、Ver.1.0（2012年リリース）からは Windows もサポート
* クラスや継承は非サポート、構造体（structure）・メソッド（method）、インターフェース（interface）はサポート

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|[macOS Sierra](https://ja.wikipedia.org/wiki/MacOS_Sierra) 10.12.3|2017年01月|
|パッケージ管理システム|[Homebrew](http://bit.ly/2mr4lzk) 1.1.10|2016年11月|
|コンパイラ|[Go](http://bit.ly/2lPWKrt) 1.8|2017年02月|
|エディタ|Visual Studio Code 1.10.1|2017年03月|
|拡張機能|go（lukehoban） 0.6.55|ー|

1. [Homebrew](https://brew.sh/index_ja.html) にアクセス
1. 指示に従ってターミナルでインストール  
    $ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"  
    $ brew --version ←バージョン確認  
    Homebrew 1.1.10

1. Go のインストール  
    $ brew install go  
    $ go version  
    go version go1.8 darwin/amd64

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

1. Visual Studio Code で [表示] → [総合ターミナル] → [端末] を選択（ターミナルでも可）

1. test.go ファイルのあるディレクトリに移動  
$ cd /Users/（ユーザー名）/Desktop/Go

1. 実行  
$ go run test.go  
Hello,world! ←と表示されたら成功！（ファイルは生成されない）

***
作成者: Takashi Nishimura  
作成日: 2017年03月07日
