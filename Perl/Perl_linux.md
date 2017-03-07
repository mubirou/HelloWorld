# Perl（ Linux ）

## Perlについて

* 1987年に登場した [CGI](https://ja.wikipedia.org/wiki/Common_Gateway_Interface) を実現するためのプログラミング言語
* [PHP](https://ja.wikipedia.org/wiki/PHP:_Hypertext_Preprocessor) が台頭する以前に主流だったサーバサイドスクリプト言語
* Ver.5.0 からオブジェクト指向プログラミングに対応
* 現在 [Perl](https://ja.wikipedia.org/wiki/Perl) と言えば Ver.5.X を指し、2015年12月にリリースした [Perl 6](https://ja.wikipedia.org/wiki/Perl_6) とは互換性がない


## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|Ubuntu 16.04.2 LTS|2017年02月|
|実行エンジン|[Perl](https://ja.wikipedia.org/wiki/Perl) 5.22.1|2015年12月|
|エディタ|Visual Studio Code 1.9.1|2017年01月|
|拡張機能|[Perl HTML Template](https://github.com/textmate/perl-html-template.tmbundle) 1.1.1|ー|

1. 端末での設定  
    $ perl -v ←バージョン確認  
    This is perl 5, version 22, subversion 1 (v5.22.1) built for x86_64-linux-gnu-thread-multi  
    $ sudo a2enmod cgid ←CGIプログラムの有効化（今回は不要）  
    $ service apache2 restart ←Webサーバの再起動（今回は不要）  

1. Visual Studio Codeに拡張機能の追加  
    [表示] → [機能拡張] から [Perl HTML Template](https://github.com/textmate/perl-html-template.tmbundle) を検索＆インストール

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

1. Visual Studio Code で [表示] → [総合ターミナル] を選択（端末でも可）

1. test.pl ファイルのあるディレクトリに移動  
$ cd /home/（ユーザー名）/デスクトップ/Perl

1. 実行許可を与える（[パーミッション](http://bit.ly/2lR40F3)の変更）  
$ chmod 755 test.pl

1. 実行  
$ ./test.pl  
Hello,world! ←…と表示されたら成功！

***
作成者: Takashi Nishimura  
作成日: 2017年03月01日
