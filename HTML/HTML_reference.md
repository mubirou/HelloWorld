### この項目は書きかけです。

# <b>HTML+CSS 基礎文法</b>

### <b>INDEX</b>

* Hello,world! （[Linux](https://github.com/TakashiNishimura/HelloWorld/blob/master/HTML/HTML_linux.md) / [macOS](https://github.com/TakashiNishimura/HelloWorld/blob/master/HTML/HTML_mac.md) / [Windows](https://github.com/TakashiNishimura/HelloWorld/blob/master/HTML/HTML_win.md)）
* [HTML の基礎](#HTMLの基礎)
* [CSS の基礎](#CSSの基礎)
* [XXX](#XXX)
***

<a name="HTMLの基礎"></a>
# <b>HTML の基礎</b>

### HTML5 の最小構成
```
<!DOCTYPE html>
<html lang="ja">
  <head>
    <meta charset="UTF-8">
    <title>xxx</title>
  </head>
  <body>
    Hello,world!
  </body>
</html>
```
拡張子は .html とします。

### タグの解説
```
<!DOCTYPE html>
```
HTML5 文書に必須の文書型宣言。必ず HTML5 文書の先頭行に記述する。

```
<html lang="ja">
```
HTML 文書であることを宣言するタグ（言語指定付き）。各言語の指定は "ja"（日本）、"en"（英語）、"fr"（フランス）、"de"（ドイツ）、"zh"（中国）、"ko"（韓国）など。

```
<meta charset="UTF-8">
```
「文字エンコーディング」を指定するためのもので、ヘッダ情報である \<head> タグの最初に指定する。Shift-JIS や EUC-JP などもあるが、HTML5 では UTF-8 を推奨。

```
<title>...</title>
```
Web ブラウザに表示されるタイトル。検索エンジンが HTML ページの内容を認識する上で重要となる。

```
<body>...</body>
```
実際に Web ブラウザに表示される文書の本体。

実行環境：Ubuntu 16.04 LTS、Chromium 59  
作成者：Takashi Nishimura  
作成日：2017年08月08日


<a name="CSSの基礎"></a>
# <b>CSS の基礎</b>

### 3種類のセレクタ

1. タグ名
```
<!DOCTYPE html>
<html lang="ja">
  <head>
    <meta charset="UTF-8">
    <title>xxx</title>
    <style>
      a {
        color: #800000;
        text-decoration: none;
      }
    </style>
  </head>
  <body>
    <a href="https://www.instagram.com/takashinishimura_books/">Takashi Nishimura Books</a><br>
    <a href="https://www.instagram.com/takashinishimura_touring/">Takashi Nishimura Touring</a>
  </body>
</html>
```

2. id 名
```
<!DOCTYPE html>
<html lang="ja">
  <head>
    <meta charset="UTF-8">
    <title>xxx</title>
    <style>
      #id001 {
        color: #800000;
        text-decoration: none;
      }
    </style>
  </head>
  <body>
    <a href="https://www.instagram.com/takashinishimura_books/" id="id001">Takashi Nishimura</a>
  </body>
</html>
```
  * id 名に使用可能な文字は、半角アルファベット・半角数字・ハイフン・アンダースコア・コロン・ピリオドのみです。
  * 1つの .html ファイル内で複数回使う場合は「class」を使います。

3. class 名
```
<!DOCTYPE html>
<html lang="ja">
  <head>
    <meta charset="UTF-8">
    <title>xxx</title>
    <style>
      .class001 {
        color: #800000;
        text-decoration: none;
      }
    </style>
  </head>
  <body>
    <a href="https://www.instagram.com/takashinishimura_books/" class="class001">Takashi Nishimura Books</a><br>
    <a href="https://www.instagram.com/takashinishimura_touring/" class="class001">Takashi Nishimura Touring</a>
  </body>
</html>
```
* class 名には日本語を含め自由に使えますが、通常は「id」の場合と同等の命名をします。
* 1つの .html ファイル内で1回しか使わない場合は「id」を使います。

### XXXX
```
XXX
```

実行環境：Windows 7、Google Chrome 60  
作成者：Takashi Nishimura  
作成日：2017年08月0X日


<a name="XXX"></a>
# <b>XXX</b>

### XXX
```
XXXx
```

実行環境：Windows 7、Google Chrome 60  
作成者：Takashi Nishimura  
作成日：2017年08月XX日