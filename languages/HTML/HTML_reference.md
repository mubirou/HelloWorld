### この項目は書きかけです。

# <b>HTML+CSS 基礎文法</b>

### <b>INDEX</b>

* Hello,world! （[Linux](https://github.com/TakashiNishimura/HelloWorld/blob/master/languages/HTML/HTML_linux.md) / [macOS](https://github.com/TakashiNishimura/HelloWorld/blob/master/languages/HTML/HTML_mac.md) / [Windows](https://github.com/TakashiNishimura/HelloWorld/blob/master/languages/HTML/HTML_win.md)）
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
作成者：MUBIROU  
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
    <a href="https://www.instagram.com/takashinishimura_books/">MUBIROU Books</a><br>
    <a href="https://www.instagram.com/takashinishimura_touring/">MUBIROU Touring</a>
  </body>
</html>
```

2. id 名（1回しか使わない場合に使用）
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
    <a href="https://www.instagram.com/takashinishimura_books/" id="id001">MUBIROU</a>
  </body>
</html>
```

3. class 名（複数回使う場合に使用）
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
    <a href="https://www.instagram.com/takashinishimura_books/" class="class001">MUBIROU Books</a><br>
    <a href="https://www.instagram.com/takashinishimura_touring/" class="class001">MUBIROU Touring</a>
  </body>
</html>
```

（応用1）まとめて設定
```
<!DOCTYPE html>
<html lang="ja">
  <head>
    <meta charset="UTF-8">
    <title>xxx</title>
    <style>
      a, .class001 { color: #800000; }
    </style>
  </head>
  <body>
    <a href="https://www.instagram.com/takashinishimura_books/">MUBIROU Books</a>
    <p class="class001">MUBIROU Touring</a>
  </body>
</html>
```

（応用2）絞込み設定
```
<!DOCTYPE html>
<html lang="ja">
  <head>
    <meta charset="UTF-8">
    <title>xxx</title>
    <style>
      p .class001 {
        color: #800000;
        text-decoration: none;
      }
    </style>
  </head>
  <body>
    <p>
      <span class="class001">MUBIROU Books</span><br>
      <span class="class002">MUBIROU Touring</span>
    </p>
  </body>
</html>
```

### 3つの記述場所

1. インライン
```
<!DOCTYPE html>
<html lang="ja">
  <head>
    <meta charset="UTF-8">
    <title>xxx</title>
  </head>
  <body>
    <span style="color:#800000;">Hello,world!</span>
  </body>
</html>
```

2. \<head> タグ内
```
<!DOCTYPE html>
<html lang="ja">
  <head>
    <meta charset="UTF-8">
    <title>xxx</title>
    <style>
      a { color: #800000; }
    </style>
  </head>
  <body>
    <a href="https://github.com/takashinishimura">MUBIROU</a>
  </body>
</html>
```

3. 外部 CSS ファイル
```
/* sample.css */
a {
    color: #800000;
    text-decoration: none;
}
```
```
<!DOCTYPE html>
<html lang="ja">
  <head>
    <meta charset="UTF-8">
    <title>xxx</title>
    <link rel="stylesheet" href="sample.css" type="text/css">
  </head>
  <body>
    <a href="https://github.com/takashinishimura">MUBIROU</a>
  </body>
</html>
```

実行環境：Windows 7、Google Chrome 60  
作成者：MUBIROU  
作成日：2017年08月10日


<a name="XXX"></a>
# <b>XXX</b>

### XXX
```
XXXx
```

実行環境：Windows 7、Google Chrome 60  
作成者：MUBIROU  
作成日：2017年08月XX日