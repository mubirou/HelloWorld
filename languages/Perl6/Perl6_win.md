# Perl 6（ Windows ）

## Perl 6 について

* 開発期間15年（2000年スタート）を経て、2015年12月に公式安定版リリース
* [Perl 5](https://github.com/mubirou/HelloWorld/blob/master/languages/Perl/README.md) とは互換性は無く、別言語として扱われている
* 拡張子は従来通り .pl （モジュールは .pm ）も利用可能だが、 [Perl 6](https://ja.wikipedia.org/wiki/Perl_6) であることを明示するために .pl6 （モジュールは .pm6 ）の利用が推奨されている 
)

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|[Windows](https://ja.wikipedia.org/wiki/Microsoft_Windows) 10（64bit）|ー|
|実行エンジン|[Rakudo Perl 6](https://en.wikipedia.org/wiki/Rakudo_Perl_6) 2017.01|2017年01月|
|エディタ|Visual Studio Code 1.10.2|2017年03月|
|拡張機能|Perl 6 code snippets 0.0.5|ー|

1. [Perl 6](https://ja.wikipedia.org/wiki/Perl_6) のインストール
    1. http://rakudo.org/ にアクセス
    1. [Downloads] → [Rakudo Star 2017.01 Windows 64-bit] をクリック、ダウンロード
    1. ダウンロードした rakudo-star-2017.01-x86_64 (JIT).msi をダブルクリック、インストール
    1. コマンドプロンプトでバージョン確認  
        \>perl6 -v  
        This is Rakudo version 2017.01 built on MoarVM version 2017.01  
        implementing Perl 6.c.

1. Visual Studio Codeに拡張機能の追加  
    [表示] → [拡張機能] から Perl 6 code snippets を検索＆インストール

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

1. コマンドプロンプトを起動

1. test.pl6 ファイルのあるディレクトリに移動  
\>cd \Users\（ユーザー名）\Desktop\Perl6

1. 実行  
\>perl6 test.pl6  
Hello,world! ←と表示されたら成功！（ファイルは生成されない）

***
作成者: 夢寐郎  
作成日: 2017年03月16日