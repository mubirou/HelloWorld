# Ruby（ macOS ）

## Rubyについて

* 1995年に登場した[まつもとゆきひろ](http://bit.ly/2a8pfxb)氏により開発されたオブジェクト指向プログラミング言語

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|[macOS Sierra](https://ja.wikipedia.org/wiki/MacOS_Sierra) 10.12.3|2017年01月|
|パッケージ管理システム|[Homebrew](http://bit.ly/2mr4lzk) 1.1.11|2017年03月|
|実行エンジン|[Ruby](https://www.ruby-lang.org/ja/) 2.4.0|2016年12月|
|エディタ|Visual Studio Code 1.10.1|2017年03月|
|拡張機能|[Ruby（Peng Lv）](https://marketplace.visualstudio.com/items?itemName=rebornix.Ruby) 0.10.4|2016年12月|

1. [Homebrew](https://brew.sh/index_ja.html) にアクセス

1. 指示に従ってターミナルでインストール  
    $ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"  
    $ brew --version ←バージョン確認  
    Homebrew 1.1.11

1. ターミナルで新しい [Ruby](http://www.ruby-lang.org/ja/documentation/installation/) をインストール  
    $ brew install ruby  
    ……  
    🍺  /usr/local/Cellar/ruby/2.4.0: 1,191 files, 15.2MB

    $ /usr/local/Cellar/ruby/2.4.0/bin/ruby -v ←バージョン確認①  
    ruby 2.4.0p0 (2016-12-24 revision 57164) [x86_64-darwin16]  

    $ /usr/local/bin/ruby -v ←バージョン確認②  
    ruby 2.4.0p0 (2016-12-24 revision 57164) [x86_64-darwin16]

1. Visual Studio Codeに拡張機能の追加  
    [表示] → [拡張機能] から [Ruby（Peng Lv）](https://marketplace.visualstudio.com/items?itemName=rebornix.Ruby)を検索＆インストール

## コードの記述

1. Visual Studio Code を起動
    1. [ファイル] → [新規ファイル] を選択
    1. [ファイル] → [保存] を選択
    1. 任意の場所（今回はデスクトップ上に Ruby フォルダを作成）に test<b>.rb</b> という名で保存  

1. コードの記述
```
#test.rb
class MyClass #前方宣言（大文字で開始）
    #コンストラクタ（省略可能）
    def initialize()
        print("Hello,world!\n")
    end
end
_myClass = MyClass.new() #()は省略可能
```

## 実行

1. Visual Studio Code で [表示] → [総合ターミナル] → [端末] を選択（ターミナルでも可）

1. test.rb ファイルのあるディレクトリに移動  
$ cd /Users/（ユーザー名）/Desktop/Ruby

1. 実行  
$ /usr/local/bin/ruby test.rb  
Hello,world! ←と表示されたら成功！  

***
作成者: MUBIROU  
作成日: 2017年03月08日