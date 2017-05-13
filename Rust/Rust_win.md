# Rust（ Windows ）

## <ruby>Rust<rt>ラスト</rt></ruby>について

* 2010年に登場した [Mozilla](https://ja.wikipedia.org/wiki/Mozilla_Foundation) が開発する、大規模なサーバ等のシステム構築を得意とする言語
* class ではなく [trait](http://rustbyexample.com/trait.html) を使ってオブジェクト指向プログラミングを実現

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|[Windows](https://ja.wikipedia.org/wiki/Microsoft_Windows) 10（64bit）|ー|
|コンパイラ|rustc 1.15.1|2017年02月|
|エディタ|Visual Studio Code 1.10.2|2017年03月|
|拡張機能|[Rust](https://marketplace.visualstudio.com/items?itemName=kalitaalexey.vscode-rust) 0.3.10|2017年02月|

1. [Rust](http://bit.ly/2lYggCc) のインストール
    1. https://www.rust-lang.org/en-US/install.html にアクセス
    1. [rustup-init.exe] をクリック、ダウンロード
    1. ダウンロードした rustup-init.exe をダブルクリック、インストール  
        （冒頭で「 1) Proceed with installation（default）」を選択）

1. [環境変数](http://bit.ly/2lCIAgK)の設定  
    1. タスクバーのスタートボタンを右クリック → [コントロールパネル] → [システムとセキュリティ] → [システム] → [システムの詳細設定] → [環境変数] を開く
    1. [システム環境変数] で変数 "Path" を探して選択 → [編集] ボタンをクリック
    1. 変数値の最後に ;C:\Users\（ユーザー名）\\.cargo\bin を追加（rustc.exeが存在）
    1. Windows を再起動
    1. コマンドプロンプトでバージョン確認  
        \>rustc --version  
        rustc 1.15.1 (021bd294c 2017-02-08)

1. Visual Studio Codeに拡張機能の追加  
    [表示] → [拡張機能] から [Rust](https://marketplace.visualstudio.com/items?itemName=kalitaalexey.vscode-rust) を検索＆インストール

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

1. コマンドプロンプトを起動

1. test.rs ファイルのあるディレクトリに移動  
\>cd \Users\（ユーザー名）\Desktop\Rust

1. コンパイル  
\>rustc test.rs

1. test.rs ファイルと同階層に test.exe、test.pdb ファイルが生成されたのを確認

1. 実行  
\>test.exe  
Hello,world! ←と表示されたら成功！  

***
作成者: Takashi Nishimura  
作成日: 2017年03月16日