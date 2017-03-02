# Swift

## Swiftについて

* 2014年に登場した [iOS](http://bit.ly/2lw7f2p) 、 [macOS](https://ja.wikipedia.org/wiki/MacOS) 用のオブジェクト指向プログラミング言語
* [Apple](http://bit.ly/2lW4Bpm) としては [Objective-C](https://github.com/TakashiNishimura/HelloWorld/blob/master/ObjectiveC/README.md) の後継との位置付けだが併用も可能
* 2015年12月に[オープンソース](http://bit.ly/1Md3omK)化され Linux でも動作可能になった

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|Ubuntu 16.04.2 LTS|2017年02月|
|コンパイラ|[Swift](http://bit.ly/2lYITz8) 3.0.2|2016年12月|
|エディタ|Visual Studio Code 1.10.1|2017年03月|
|拡張機能|Swift Language 0.0.2|不明|
|その他|[Clang](https://ja.wikipedia.org/wiki/Clang) 3.8.0|不明|

1. Web ブラウザで http://swift.org を開く
1. [DOWNLOAD] → [Releases] → [Ubuntu 16.04] を選択
1. 端末でインストール作業  
    $ cd /home/（ユーザー名）/デスクトップ/ ←デスクトップにダウンロードした場合  
    $ tar -xf swift-3.0.2-RELEASE-ubuntu16.04.tar.gz  
    $ sudo mv swift-3.0.2-RELEASE-ubuntu16.04 swift ←フォルダー名の簡略化  
    $ sudo mv swift /opt/  
    $ /opt/swift/usr/bin/swift --version ←バージョン確認  
    Swift version 3.0.2 (swift-3.0.2-RELEASE)  
    $ sudo apt-get update  
    $ sudo apt-get install clang ←Clangコンパイラのインストール  
    $ clang -v  
    clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)

1. Visual Studio Codeに拡張機能の追加  
    [表示]→[機能拡張] から Swift Language （Martin Kase） を検索＆インストール

## コードの記述

1. Visual Studio Code を起動
    1. [ファイル]→[新規ファイル] を選択
    1. [ファイル]→[保存] を選択
    1. 任意の場所（今回はデスクトップ上に Swift フォルダを作成）に test<b>.swift</b> という名で保存  

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

1. Visual Studio Code で [表示]→[総合ターミナル] を選択（端末でも可）

1. test.swift ファイルのあるディレクトリに移動  
$ cd /home/（ユーザー名）/デスクトップ/Swift

1. コンパイル 
$ /opt/swift/usr/bin/swiftc test.swift

1. test.swift ファイルと同階層に test ファイルが生成されたのを確認

1. 実行  
$ ./test  
Hello,world! ←…と表示されたら成功！

***
作成者: Takashi Nishimura  
作成日: 2017年03月02日
