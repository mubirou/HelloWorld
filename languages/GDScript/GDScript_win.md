# GDScript（ Windows ）

この項目は、書きかけの項目です。

## GDScript について

* XXXXXXX

## 開発環境の構築

1. https://godotengine.org/download/windows から [Standard version]-[64-bit(x86_64)] をダウンロードして解凍

1. Visual Studio Codeに拡張機能の追加  
    [表示] → [拡張機能] から C#（Microsoft） を検索＆インストール

1. Godot_v3.4.2-stable_win64.exe を起動

1. [新規プロジェクト] を選択し以下を設定し[作成して編集]
    * プロジェクト名：任意
    * プロジェクトパス：任意
    * レンダラー：OpenGL ES 3.0

1. [シーン]タブ（ルートノードを生成）から[3D シーン]を選択. 名前を[Spatial]→[Main]に変更

1. [シーン]-[シーンを保存]で"Main.tscn"を[保存]  
（[ファイルシステム]タブ内に"Main.tscn"が生成されます）

1. 再生ボタン[▶]を押すと「メインシーンが定義されていません。選択しますか？」というダイアログが表示されるので[現在のものを選択]を選択

## コードの記述

1. Visual Studio Code を起動
    1. [ファイル] → [新規ファイル] を選択
    1. [ファイル] → [保存] を選択
    1. 任意の場所（今回はデスクトップ上に C# フォルダを作成）に test<b>.cs</b> という名で保存

1. コードの記述
```
//test.cs
using System; //Console.WriteLine() に必要

class HelloWorld { //Mainは不可
    static void Main() { //自動的に最初に実行される
        Console.WriteLine("Hello,world!");
    }
}
```

## コンパイル〜実行

1. コマンドプロンプトを起動

1. test.cs ファイルのあるディレクトリに移動  
\>cd \Users\（ユーザー名）\Desktop\C#

1. コンパイル（.cs → .exe）  
\>csc test.cs

1. test.cs ファイルと同階層に test.exe ファイルが生成されたのを確認

1. 実行  
\>test.exe  
Hello,world! ←と表示されたら成功！

***
参考：[Qiita](https://qiita.com/2dgames_jp/items/2f8e3690260af7946aed)
作成者: 夢寐郎  
作成日: 20XX年0X月XX日
