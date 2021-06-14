# Ruby（ Windows ）

## Rubyについて

* 1995年に登場した[まつもとゆきひろ](http://bit.ly/2a8pfxb)氏により開発されたオブジェクト指向プログラミング言語

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|[Windows](https://ja.wikipedia.org/wiki/Microsoft_Windows) 10（64bit）|ー|
|実行エンジン|[Ruby](https://www.ruby-lang.org/ja/) 3.0.1|2021年04月|
|エディタ|[Visual Studio Code](https://azure.microsoft.com/ja-jp/products/visual-studio-code/) 1.56.2|2021年04月|
|拡張機能|[Ruby（Peng Lv）](https://marketplace.visualstudio.com/items?itemName=rebornix.Ruby) 0.28.1|2021年01月|

1. [Ruby](http://www.ruby-lang.org/ja/) をインストール
    1. http://www.ruby-lang.org/ja/ にアクセス
    1. [ダウンロード] を選び、[Windows版Rubyバイナリ] の [RubyInstaller] を選択
    1. [Download] ボタンをクリック
    1. [RubyInstallers]-[WITHOUT DEVKIT] の [Ruby 3.0.1-1（x64）] をクリック
    1. ダウンロードした rubyinstaller-3.0.1-1-x64.exe をダブルクリックしインストール開始
    1. 途中、[インストール先とオプションの指定] 画面で次の2つをチェック
        * ✓ Add Ruby executables to your PATH
        * ✓ Associate .rb and .rbw files with this Ruby installation
    1. 途中で[RubyInstaller2 for Windows]（Rubyのライブラリのひとつ）が表示されるがここでは不要
    1. Windowsを再起動
    1. コマンドプロンプトでバージョン確認  
        \>ruby -v  
        ruby 3.0.1p64 (2021-04-05 revision 0fb782ee38) [x64-mingw32]

1. Visual Studio Codeに拡張機能の追加  
    [表示] → [拡張機能] から [Ruby（Peng Lv）](https://marketplace.visualstudio.com/items?itemName=rebornix.Ruby)を検索＆インストール

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

1. コマンドプロンプトを起動

1. test.rb ファイルのあるディレクトリに移動  
\>cd \Users\（ユーザー名）\Desktop\

1. 実行  
\>ruby test.rb  
Hello,world! ←と表示されたら成功！（ファイルは生成されない）

***
作成者: 夢寐郎  
作成日: 2017年03月16日  
更新日: 2021年06月14日