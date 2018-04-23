# Haskell（ Windows ）

## <ruby>Haskell<rt>ハスケル</rt></ruby> について

* 1985年に登場した純粋[関数型言語](http://bit.ly/1KTmmNW)
* 数学プログラムを記述するのに適すると言われる

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|[Windows](https://ja.wikipedia.org/wiki/Microsoft_Windows) 10（64bit）|ー|
|開発環境|[Haskell Platform](https://www.haskell.org/platform/) 8.0.2|2017年01月|
|エディタ|Visual Studio Code 1.10.2|2017年03月|
|拡張機能|[Haskell Syntax Highlighting](http://bit.ly/2l6sqMc) 2.1.0|2017年03月|

1. [Haskell Platform](https://www.haskell.org/platform/) のインストール
    1. https://www.haskell.org/platform/ にアクセス
    1. [Windows] の [Download Full（64bit）] を選択、ダウンロード
    1. ダウンロードした HaskellPlatform-8.0.2-full-x86_64-setup.exe をダブルクリック、インストール
    1. コマンドプロンプトでバージョン確認  
        \>ghc --version  
        The Glorious Glasgow Haskell Compilation System, version 8.0.2

1. Visual Studio Codeに拡張機能の追加  
    [表示] → [拡張機能] から [Haskell Syntax Highlighting](http://bit.ly/2l6sqMc) を検索＆インストール

## コードの記述

1. Visual Studio Code を起動
    1. [ファイル] → [新規ファイル] を選択
    1. [ファイル] → [保存] を選択
    1. 任意の場所（今回はデスクトップ上に Haskell フォルダを作成）に test<b>.hs</b> という名で保存

1. コードの記述
```
--test.hs
--main関数
main = do --最初に実行される（doは省略可能）
    putStrLn "Hello,world!"
```

## コンパイル〜実行

1. コマンドプロンプトを起動

1. test.hs ファイルのあるディレクトリに移動  
\>cd \Users\（ユーザー名）\Desktop\Haskell

1. コンパイル  
\>ghc test.hs

1. test.hs ファイルと同階層に ① test.exe ② test.hi ③ test.o の3つが生成されたのを確認

1. 実行  
\>test.exe  
Hello,world! ←と表示されたら成功！

***
作成者: MUBIROU  
作成日: 2017年03月16日