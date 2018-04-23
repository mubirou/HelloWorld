# HTML+CSS（ macOS ）

## HTMLについて

* [HyperText Markup Language](https://ja.wikipedia.org/wiki/HyperText_Markup_Language)
* Web 上の文書を記述するための[マークアップ言語](http://bit.ly/1FmOJMp)
* HTML1.0（1993年）→ HTML5（2014年）→ HTML5.1（2016年）が [W3C](https://www.w3.org/) により勧告

## CSSについて

* [Cascading Style Sheets](https://ja.wikipedia.org/wiki/Cascading_Style_Sheets)
* HTML の要素をどのように表示（装飾）させるかを指示する仕様
* CSS1（1996年）→ CSS3（2011年）が [W3C](https://www.w3.org/) により勧告


## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|[macOS Sierra](https://ja.wikipedia.org/wiki/MacOS_Sierra) 10.12.3|2017年01月|
|エディタ|Visual Studio Code 1.10.1|2017年03月|
|フォント|[Google Fonts](https://fonts.google.com/?selection.family=Righteous)|―|
|ブラウザ|Safari 10.0.3|2017年01月|

※今回は [Webフォント](http://bit.ly/2liCm0j) として [Google Fonts](https://fonts.google.com/?selection.family=Righteous) を利用

## HTMLの記述

1. Visual Studio Code を起動
    1. [ファイル] → [新規ファイル] を選択
    1. [ファイル] → [保存] を選択
    1. 任意の場所に index<b>.html</b> という名で保存

1. コードの記述
```
<!DOCTYPE html>
<html lang="ja">
    <head>
        <meta charset="UTF-8">
        <title>TEST</title>
        <link href="https://fonts.googleapis.com/css?family=Righteous" rel="stylesheet">
        <link href="common.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <p class="type01">Hello,world!</p>
    </body>
</html>
```

## CSSファイルの記述

1. Visual Studio Code を起動

1. index.html ファイルと同階層に common<b>.css</b> ファイルを作成

1. コードの記述

```
.type01 {
    font-family: 'Righteous', cursive; /* Google Fonts */
    color: #ff0000;
    font-size: 64px;
    font-weight: bold;
    letter-spacing: 5px; /* 文字間の幅 */
    text-shadow: 2px 2px 2px #333333; /* CSS3新機能 */
}
```

## 実行

1. Web ブラウザ（Safari）を起動

1. [ファイル] → [ファイルを開く] で上記の index.html を開く

1. Hello,world! と表示されたら成功！

***
作成者: vvestvillage  
作成日: 2017年03月07日
