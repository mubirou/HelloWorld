# Ruby（ Linux ）

## Rubyについて

* 1995年に登場した[まつもとゆきひろ](http://bit.ly/2a8pfxb)氏により開発されたオブジェクト指向プログラミング言語

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|Ubuntu 20.04.2 LTS|2021年02月|
|実行エンジン|[Ruby](https://www.ruby-lang.org/ja/) 2.7.0|2019年12月|
|エディタ|Visual Studio Code 1.57.0|2021年05月|
|拡張機能|[Ruby（Peng Lv）](https://marketplace.visualstudio.com/items?itemName=rebornix.Ruby) 0.28.1|2021年01月|

1. 端末で Ruby のインストール  
    $ sudo apt-get update  
    $ sudo apt-get install ruby  
    $ sudo ruby -v  
    ruby 2.7.0p0 (2019-12-25 revision 647ee6f091) [x86_64-linux-gnu]

1. Visual Studio Codeに拡張機能の追加  
    [表示] → [拡張機能] から [Ruby（Peng Lv）](https://marketplace.visualstudio.com/items?itemName=rebornix.Ruby) を検索＆インストール

## コードの記述

1. Visual Studio Code を起動
    1. [ファイル] → [新規ファイル] を選択
    1. [ファイル] → [保存] を選択
    1. 任意の場所（今回はデスクトップ上）に test<b>.rb</b> という名で保存  

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

1. Visual Studio Code で [表示] → [ターミナル] を選択（端末でも可）

1. test.rb ファイルのあるディレクトリに移動  
$ cd /home/（ユーザー名）/デスクトップ

1. 実行  
$ ruby test.rb  
Hello,world! ←と表示されたら成功！  

***
作成者: 夢寐郎  
作成日: 2017年03月02日  
更新日: 2021年06月14日