# Swift（ macOS ）

## Swiftについて

* 2014年に登場した [iOS](http://bit.ly/2lw7f2p) 、 [macOS](https://ja.wikipedia.org/wiki/MacOS) 用のオブジェクト指向プログラミング言語
* [Apple](http://bit.ly/2lW4Bpm) としては [Objective-C](https://github.com/mubirou/HelloWorld/blob/master/languages/ObjectiveC/README.md) の後継との位置付けだが併用も可能
* 2015年12月に[オープンソース](http://bit.ly/1Md3omK)化され Linux（[Ubuntu](https://www.ubuntulinux.jp/home)） でも動作可能になった
* 2016年2月にクラウドでテストが可能な [IBM Swift Sandbox](https://swift.sandbox.bluemix.net) を発表（Windowsでも利用可能）


## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|[macOS Sierra](https://ja.wikipedia.org/wiki/MacOS_Sierra) 10.12.4|2017年04月|
|統合開発環境|[Xcode](https://developer.apple.com/download/) 8.3.1|2017年04月|
|コンパイラ|[Swift](http://bit.ly/2lYITz8) 3.1|2017年03月|
|エディタ|Visual Studio Code 1.11.1|2017年03月|
|拡張機能|Swift Language 0.0.2|ー|

1. [Xcode](https://ja.wikipedia.org/wiki/Xcode) のインストール  
    1. [Apple ID](https://appleid.apple.com/#!&page=signin) を用意し [Xcode](https://developer.apple.com/download/) にアクセス
    1. Xcode 8.3.1 を [Download] を選択、指示に従ってダウンロード
    1. Xcode を開き、指示に従いインストール  
    1. ターミナルでバージョン確認  
    $ swift -version  
    Apple Swift version 3.1 (swiftlang-802.0.51 clang-802.0.41)  

1. Visual Studio Codeに拡張機能の追加  
    [表示] → [拡張機能] から Swift Language （Martin Kase） を検索＆インストール

## コードの記述

1. Visual Studio Code を起動
    1. [ファイル] → [新規ファイル] を選択
    1. [ファイル] → [保存] を選択
    1. 任意の場所（今回はデスクトップ上）に test<b>.swift</b> という名で保存  

1. コードの記述
```
//test.swift
public class MyClass {
    //コンストラクタ
    init() {
        print("Hello,world!")
    }
}
var _myClass:MyClass = MyClass()
```

## コンパイル〜実行

1. Visual Studio Code で [表示] → [総合ターミナル] → [端末] を選択（ターミナルでも可）

1. test.swift ファイルのあるディレクトリに移動  
$ cd /Users/（ユーザー名）/Desktop

1. コンパイル  
$ swiftc test.swift

1. test.swift ファイルと同階層に test （実行ファイル）が生成されたのを確認

1. 実行  
$ ./test  
Hello,world! ←と表示されたら成功！

***
作成者: MUBIROU  
作成日: 2017年03月08日  
更新日: 2017年04月13日
