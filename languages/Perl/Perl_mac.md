# Perl（ macOS ）

## Perlについて

* 1987年に登場した [CGI](https://ja.wikipedia.org/wiki/Common_Gateway_Interface) を実現するためのプログラミング言語
* [PHP](https://ja.wikipedia.org/wiki/PHP:_Hypertext_Preprocessor) が台頭する以前に主流だったサーバサイドスクリプト言語
* Ver.5.0 からオブジェクト指向プログラミングに対応
* 現在 [Perl](https://ja.wikipedia.org/wiki/Perl) と言えば Ver.5.X を指し、2015年12月にリリースした [Perl 6](https://ja.wikipedia.org/wiki/Perl_6) とは互換性がない


## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|[macOS Sierra](https://ja.wikipedia.org/wiki/MacOS_Sierra) 10.12.3|2017年01月|
|実行エンジン|[Perl](https://ja.wikipedia.org/wiki/Perl) 5.18.2|2014年01月|
|エディタ|Visual Studio Code 1.10.1|2017年03月|
|拡張機能|[Perl HTML Template](https://github.com/textmate/perl-html-template.tmbundle) 1.1.1|ー|

1. ターミナルでバージョン確認  
    $ perl -v  
    This is perl 5, version 18, subversion 2 (v5.18.2) built for darwin-thread-multi-2level  
    (with 2 registered patches, see perl -V for more detail)

1. Visual Studio Codeに拡張機能の追加  
    [表示] → [拡張機能] から [Perl HTML Template](https://github.com/textmate/perl-html-template.tmbundle) を検索＆インストール

## Perl モジュールの記述

1. Visual Studio Code を起動
    1. [ファイル] → [新規ファイル] を選択
    1. [ファイル] → [保存] を選択
    1. 任意の場所（今回はデスクトップ上に Perl フォルダを作成）に myClass<b>.pm</b> という名で保存（ファイル名は任意）  

1. Perl モジュール（.pm）の記述
```
#myClass.pm
package MyClass;

sub new { #コンストラクタ
    print "Hello,world!\n";
}
1; #必須
```

## Perl コードの記述

1. Visual Stuido Code を起動し、myClass.pm と同階層に test<b>.pl</b> という名で保存

1. Perl コード（.pl）の記述

```
#! /usr/bin/perl
require "myClass.pm"; #モジュールのロード
my $_myclass = MyClass -> new #インスタンスの生成
```

## 実行

1. Visual Studio Code で [表示] → [総合ターミナル] → [端末] を選択（ターミナルでも可）

1. test.pl ファイルのあるディレクトリに移動  
$ cd /Users/（ユーザー名）/Desktop/Perl

1. 実行許可を与える（[パーミッション](http://bit.ly/2lR40F3)の変更）  
$ chmod 755 test.pl

1. 実行  
$ ./test.pl  
Hello,world! ←と表示されたら成功！

***
作成者: MUBIROU  
作成日: 2017年03月07日
