# Perl 6

## Perl 6 について

* 開発期間15年（2000年スタート）を経て、2015年12月に公式安定版リリース
* [Perl 5](https://github.com/TakashiNishimura/HelloWorld/blob/master/Perl/README.md) とは互換性は無く、別言語として扱われている
* 拡張子は従来通り .pl （モジュールは .pm ）も利用可能だが、 [Perl 6](https://ja.wikipedia.org/wiki/Perl_6) であることを明示するために .pl6 （モジュールは .pm6 ）の利用が推奨されている 
)

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|Ubuntu 16.04.2 LTS|2017年02月|
|実行エンジン|Perl6 2015.11|2015年11月|
|エディタ|Visual Studio Code 1.9.1|2017年01月|
|拡張機能|Perl 6 code snippets 0.0.5|ー|

1. 端末で Perl 6 コンパイラのインストール  
    $ sudo apt-get update ←インストール済みパッケージのアップデート  
    $ sudo apt-get install rakudo  
    $ perl6 -v ←バージョン確認  
    This is perl6 version 2015.11 built on MoarVM version 2015.11

1. Visual Studio Codeに拡張機能の追加  
    [表示] → [機能拡張] から Perl 6 code snippets を検索＆インストール

## コードの記述

1. Visual Studio Code を起動
    1. [ファイル] → [新規ファイル] を選択
    1. [ファイル] → [保存] を選択
    1. 任意の場所（今回はデスクトップ上に Perl6 フォルダを作成）に test<b>.pl6</b> という名で保存  

1. コードの記述
```
#test.pl6
class MyClass {
    method new() {
        say "Hello,world!";
    }
}
MyClass.new();
```

## 実行

1. Visual Studio Code で [表示] → [総合ターミナル] を選択（端末でも可）

1. test.pl6 ファイルのあるディレクトリに移動  
$ cd /home/（ユーザー名）/デスクトップ/Perl6

1. 実行  
$ perl6 test.pl6  
Hello,world! ←…と表示されたら成功！

***
作成者: Takashi Nishimura  
作成日: 2017年03月01日
