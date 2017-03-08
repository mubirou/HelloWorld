# Rust

## <ruby>Rust<rt>ラスト</rt></ruby>について

* 2010年に登場した [Mozilla](https://ja.wikipedia.org/wiki/Mozilla_Foundation) が開発する、大規模なサーバ等のシステム構築を得意とする言語
* class ではなく [trait](http://rustbyexample.com/trait.html) を使ってオブジェクト指向プログラミングを実現

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|[macOS Sierra](https://ja.wikipedia.org/wiki/MacOS_Sierra) 10.12.3|2017年01月|
|パッケージ管理システム|[Homebrew](http://bit.ly/2mr4lzk) 1.1.11|2017年03月|
|コンパイラ|rustc 1.15.1|2017年02月|
|エディタ|Visual Studio Code 1.10.1|2017年03月|
|拡張機能|[Rust](https://marketplace.visualstudio.com/items?itemName=kalitaalexey.vscode-rust) 0.3.10|2017年02月|

1. [Homebrew](https://brew.sh/index_ja.html) にアクセス

1. 指示に従ってターミナルでインストール  
    $ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"  
    $ brew --version ←バージョン確認  
    Homebrew 1.1.11

1. 端末で Rust のインストール  
    $ brew install rust  
    $ rustc --version  
    rustc 1.15.1

1. Visual Studio Codeに拡張機能の追加  
    [表示] → [機能拡張] から [Rust](https://marketplace.visualstudio.com/items?itemName=kalitaalexey.vscode-rust) を検索＆インストール

## コードの記述

1. Visual Studio Code を起動
    1. [ファイル] → [新規ファイル] を選択
    1. [ファイル] → [保存] を選択
    1. 任意の場所（今回はデスクトップ上に Rust フォルダを作成）に test<b>.rs</b> という名で保存  

1. コードの記述
```
//test.rs
fn main() {
    println!("Hello,world!");
}
```

## コンパイル〜実行

1. Visual Studio Code で [表示] → [総合ターミナル] → [端末] を選択（ターミナルでも可）

1. test.rs ファイルのあるディレクトリに移動  
$ cd /Users/（ユーザー名）/Desktop/Rust

1. コンパイル  
$ rustc test.rs

1. test.rs ファイルと同階層に test ファイルが生成されたのを確認

1. 実行  
$ ./test  
Hello,world! ←…と表示されたら成功！  

***
作成者: Takashi Nishimura  
作成日: 2017年03月08日