### この項目は書きかけです。

# <b>HTML+CSS 基礎文法</b>

### <b>INDEX</b>

* Hello,world! （[Linux](https://github.com/mubirou/HelloWorld/blob/master/languages/HTML/HTML_linux.md) / [macOS](https://github.com/mubirou/HelloWorld/blob/master/languages/HTML/HTML_mac.md) / [Windows](https://github.com/mubirou/HelloWorld/blob/master/languages/HTML/HTML_win.md)）
* [HTML の基礎](#HTMLの基礎)
* [CSS の基礎](#CSSの基礎)
* [XXX](#XXX)
***

<a name="HTMLの基礎"></a>
# <b>HTML の基礎</b>

### [HTML Living Standard](https://bit.ly/3RXG68w) の最小構成
```
<!DOCTYPE html>
<html lang="ja">
  <head>
    <title>xxx</title>
    <meta charset="utf-8">
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
HTML Living Standard 文書に必須の文書型宣言。必ず HTML Living Standard 文書の先頭行に記述する。

```
<html lang="ja">
```
HTML 文書であることを宣言するタグ（言語指定付き）。各言語の指定は "ja"（日本）、"en"（英語）、"fr"（フランス）、"de"（ドイツ）、"zh"（中国）、"ko"（韓国）など。

```
<title>...</title>
```
Web ブラウザのタブやウインドウのタイトル。検索エンジンの結果ページ、ブックマークやお気に入りの名前や履歴に表示される。

```
<meta charset="utf-8">
```
「文字エンコーディング」を指定するためのもので、ヘッダ情報である \<head> タグの最初に指定する。Shift-JIS や EUC-JP などもあるが、HTML Living Standard 仕様に準拠する場合は、UTF-8 でHTML文書を作成する必要がある（大文字でも可）。

```
<body>...</body>
```
実際に Web ブラウザに表示される文書の本体。

実行環境：Windows 11、Chrome 110  
作成者：夢寐郎  
作成日：2017年08月08日  
更新日：2024年04月08日 <title>タグ関連を微修正  

<a name="CSSの基礎"></a>
# <b>CSS の基礎</b>

### 主なセレクター
他にも<a href="https://developer.mozilla.org/ja/docs/Learn/CSS/Building_blocks/Selectors">さまざまなセレクター</a>があります。

1. 「要素」名
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
    <a href="https://www.instagram.com/mubirou.book/">MUBIROU BOOK</a><br>
    <a href="https://www.instagram.com/mubirou.studio/">MUBIROU STUDIO</a>
  </body>
</html>
```

2. 「ID」名（1回しか使わない場合に使用）
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
    <a href="https://www.instagram.com/mubirou.book/" id="id001">MUBIROU</a>
  </body>
</html>
```

3. 「クラス」名（複数回使う場合に使用）
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
    <a href="https://www.instagram.com/mubirou.book/" class="class001">MUBIROU BOOK</a><br>
    <a href="https://www.instagram.com/mubirou.studio/" class="class001">MUBIROU STUDIO</a>
  </body>
</html>
```

### セレクターの組合せ

1. （応用1）まとめて設定
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
    <a href="https://www.instagram.com/mubirou.book/">MUBIROU BOOK</a>
    <p class="class001">MUBIROU STUDIO</a>
  </body>
</html>
```

2. （応用2）絞込み設定
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
      <span class="class001">MUBIROU BOOK</span><br>
      <span class="class002">MUBIROU STUDIO</span>
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
      a {
        color: #800000;
        text-decoration: none;
      }
    </style>
  </head>
  <body>
    <a href="https://github.com/mubirou">MUBIROU</a>
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
    <a href="https://github.com/mubirou">MUBIROU</a>
  </body>
</html>
```

実行環境：Windows 10、Google Chrome 90  
作成者：夢寐郎  
作成日：2017年08月10日  
更新日：2021年05月24日


<a name="XXX"></a>
# <b>XXX</b>

### XXX
```
XXXx
```

実行環境：Windows 7、Google Chrome 60  
作成者：夢寐郎  
作成日：2017年08月XX日
