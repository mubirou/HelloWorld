# Perl（ Windows ）

## Perlについて

* 1987年に登場した [CGI](https://ja.wikipedia.org/wiki/Common_Gateway_Interface) を実現するためのプログラミング言語
* [PHP](https://ja.wikipedia.org/wiki/PHP:_Hypertext_Preprocessor) が台頭する以前に主流だったサーバサイドスクリプト言語
* Ver.5.0 からオブジェクト指向プログラミングに対応
* 現在 [Perl](https://ja.wikipedia.org/wiki/Perl) と言えば Ver.5.X を指し、2015年12月にリリースした [Perl 6](https://ja.wikipedia.org/wiki/Perl_6) とは互換性がない


## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|[Windows](https://ja.wikipedia.org/wiki/Microsoft_Windows) 10（64bit）|ー|
|ソフトウェア|[XAMPP](https://ja.wikipedia.org/wiki/XAMPP) 7.1.1|2017年2月|
|実行エンジン|[Perl](https://ja.wikipedia.org/wiki/Perl) 5.16.3|2013年03月|
|エディタ|Visual Studio Code 1.10.2|2017年03月|
|拡張機能|[Perl HTML Template](https://github.com/textmate/perl-html-template.tmbundle) 1.1.1|ー|

1. [XAMPP](https://ja.wikipedia.org/wiki/XAMPP) のインストール
    1. https://www.apachefriends.org/download.html にアクセス
    1. [XAMPP for Windows 5.6.30, 7.0.15 & 7.1.1] の [7.1.1 / PHP 7.1.1] の [Download（32bit）] をクリック、ダウンロード
    1. ダウンロードした .exe ファイルをダブルクリック、インストール
    1. コマンドプロンプトでバージョン確認  
        \>\xampp\perl\bin\perl -v  
        This is perl 5, version 16, subversion 3 (v5.16.3) built for MSWin32-x86-multi-thread

1. [環境変数](http://bit.ly/2lCIAgK)の設定  
    1. タスクバーのスタートボタンを右クリック → [コントロールパネル] → [システムとセキュリティ] → [システム] → [システムの詳細設定] → [環境変数] を開く
    1. [システム環境変数] で変数 "Path" を探して選択 → [編集] ボタンをクリック
    1. 変数値の最後に ;C:\xampp\perl\bin を追加（perl.exeが存在）
    1. Windows を再起動
    1. コマンドプロンプトでバージョン確認  
        \>perl -v  
        This is perl 5, version 16, subversion 3 (v5.16.3) built for MSWin32-x86-multi-thread

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

1. コマンドプロンプトを起動

1. test.pl ファイルのあるディレクトリに移動  
\>cd \Users\（ユーザー名）\Desktop\Perl

1. 実行  
\>perl test.pl  
Hello,world! ←…と表示されたら成功！（ファイルは生成されない）

***
作成者: Takashi Nishimura  
作成日: 2017年03月16日
