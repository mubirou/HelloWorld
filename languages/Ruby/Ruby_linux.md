# Ruby（ Linux ）

## Rubyについて

* 1995年に登場した[まつもとゆきひろ](http://bit.ly/2a8pfxb)氏により開発されたオブジェクト指向プログラミング言語

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|Ubuntu 16.04.2 LTS|2017年02月|
|実行エンジン|[Ruby](https://www.ruby-lang.org/ja/) 2.3.1|2016年04月|
|エディタ|Visual Studio Code 1.10.0|2017年03月|
|拡張機能|[Ruby](https://marketplace.visualstudio.com/items?itemName=rebornix.Ruby) 0.10.4|2016年12月|

1. 端末で Ruby のインストール  
    $ sudo apt-get update  
    $ sudo apt-get install ruby  
    $ sudo ruby -v  
    ruby 2.3.1p112 (2016-04-26) [x86_64-linux-gnu]

1. Visual Studio Codeに拡張機能の追加  
    [表示] → [拡張機能] から [Ruby](https://marketplace.visualstudio.com/items?itemName=rebornix.Ruby) を検索＆インストール

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

1. Visual Studio Code で [表示] → [総合ターミナル] を選択（端末でも可）

1. test.rb ファイルのあるディレクトリに移動  
$ cd /home/（ユーザー名）/デスクトップ/Ruby

1. 実行  
$ ruby test.rb  
Hello,world! ←と表示されたら成功！  

***
作成者: mubirou  
作成日: 2017年03月02日