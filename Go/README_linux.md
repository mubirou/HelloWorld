# Go（ Linux ）

## Goについて

* 2009年に登場した Google が開発したプログラミング言語
* 当初は Linux 、Mac OS X のみに対応、Ver.1.0（2012年リリース）からは Windows もサポート
* クラスや継承は非サポート、構造体（structure）・メソッド（method）、インターフェース（interface）はサポート

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|Ubuntu 16.04.2 LTS|2017年02月|
|コンパイラ|[Go](http://bit.ly/2lPWKrt) 1.6.2|2016年02月|
|エディタ|Visual Studio Code 1.9.1|2017年01月|
|拡張機能|go 0.0.1|ー|

1. Go のインストール  
  $ sudo apt-get update ←インストール済みパッケージのアップデート  
  $ sudo apt-get install golang-go ←Goのインストール  
  $ go version ←Goのバージョン確認  
  go version go1.6.2 linux/amd64

1. Visual Studio Codeに拡張機能の追加  
    [表示] → [機能拡張] から go （TwentyChung） を検索＆インストール

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

1. Visual Studio Code で [表示] → [総合ターミナル] を選択（端末でも可）

1. test.go ファイルのあるディレクトリに移動  
$ cd /home/（ユーザー名）/デスクトップ/Go

1. 実行  
$ go run test.go  
Hello,world! ←…と表示されたら成功！

***
作成者: Takashi Nishimura  
作成日: 2017年02月28日
