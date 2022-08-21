# GDScript（ Windows ）

## GDScript について

* [Godot Engine](https://godotengine.org/) で使われるスクリプト言語
* [Python](https://github.com/mubirou/HelloWorld/blob/master/languages/Python/Python_reference.md#python-%E5%9F%BA%E7%A4%8E%E6%96%87%E6%B3%95) に似た構文を採用してはいるが全く別物のプログラミング言語
* [GDScript（for Godot 4.0）基本文法](https://github.com/mubirou/HelloWorld/blob/master/languages/GDScript/GDScript_reference.md#gdscript-%E5%9F%BA%E7%A4%8E%E6%96%87%E6%B3%95)
* Godot 3.0（2018年リリース）から [C#](https://github.com/mubirou/HelloWorld/blob/master/languages/C%23Godot/C%23Godot_win.md#c-with-godot-windows-) も利用可能だったが 4.0 で使用不可に。但し 4.1 からは [.NET 6](https://docs.microsoft.com/ja-jp/dotnet/core/whats-new/dotnet-6) 対応の C# が利用可能になる予定

## Hello,world!

1. https://godotengine.org/download/windows から [Standard version]-[64-bit(x86_64)] をダウンロードして解凍

1. Godot_v3.5-stable_win64.exe を起動（インストール作業は不要）

1. [新規プロジェクト] を選択. 以下を設定し[作成して編集]
    * プロジェクト名：任意
    * プロジェクトパス：任意
    * レンダラー：OpenGL ES 3.0

1. [シーン]タブ（ルートノードを生成）から[3D シーン]を選択. 名前を[Spatial]→[Main]に変更

1. [シーン]-[シーンを保存]で"Main.tscn"を[保存]  
（[ファイルシステム]タブ内に"Main.tscn"が生成されます）

1. 再生ボタン[▶]を押すと「メインシーンが定義されていません。選択しますか？」というダイアログが表示されるので[現在のものを選択]を選択

1. [Main]タブ（または[ファイルシステム]-[Main.tscn]）を選択し、[シーン]タブ-[Main]→[右クリック]-[スクリプトをアタッチ]-[作成]すると"Main.gd"が生成される

1. コードの変更（[外部エディタ](https://bit.ly/3Ac3vdR)を使用することも可能）

```gdscript
# res://Main.gd
extends Spatial

func _ready():
	print("Hello,world!")
```

1. 再生ボタン[▶]を押すと…  
```
Hello,world!
```
と表示されたら成功！

[[C# 版](https://github.com/mubirou/HelloWorld/blob/master/languages/C%23Godot/C%23Godot_win.md#c-with-godot-windows-)]  
参考：[Qiita](https://qiita.com/2dgames_jp/items/2f8e3690260af7946aed)  
実行環境：Windows 10、Godot Engine 3.5  
作成者：夢寐郎  
作成日：2022年02月11日  
更新日：2022年08月21日  