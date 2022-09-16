# C# with Godot（ Windows ）

## C# with Godot について

* [Godot Engine](https://godotengine.org/) 3.0（2018年リリース）から[Mono](https://ja.wikipedia.org/wiki/Mono_(%E3%82%BD%E3%83%95%E3%83%88%E3%82%A6%E3%82%A7%E3%82%A2))を利用して使えるようになったスクリプト言語
* C#のほかに[Python](https://github.com/mubirou/HelloWorld/blob/master/languages/Python/Python_reference.md#python-%E5%9F%BA%E7%A4%8E%E6%96%87%E6%B3%95)に似た構文を採用している[GDScript](https://github.com/mubirou/HelloWorld/blob/master/languages/GDScript/GDScript_win.md#gdscript-windows-)も利用可能
* [C# with Godot 基本文法](https://github.com/mubirou/HelloWorld/blob/master/languages/C%23Godot/C%23Godot_reference.md#c-with-godot-%E5%9F%BA%E7%A4%8E%E6%96%87%E6%B3%95)

## Hello,world!

1. https://godotengine.org/download/windows から [Mono version (C# support)]-[64-bit(x86_64)] をダウンロードして解凍

1. Godot_v3.4.2-stable_mono_win64.exe を起動（インストール作業は不要）

1. [新規プロジェクト] を選択. 以下を設定し[作成して編集]
    * プロジェクト名：任意
    * プロジェクトパス：任意
    * レンダラー：OpenGL ES 3.0

1. [シーン]タブ（ルートノードを生成）から[3D シーン]を選択. 名前を[Spatial]→[Main]に変更

1. [シーン]-[シーンを保存]で"Main.tscn"を[保存]  
（[ファイルシステム]タブ内に"Main.tscn"が生成されます）

1. 再生ボタン[▶]を押すと「メインシーンが定義されていません。選択しますか？」というダイアログが表示されるので[現在のものを選択]を選択

1. [Main]タブ（または[ファイルシステム]-[Main.tscn]）を選択し、[シーン]タブ-[Main]→[右クリック]-[スクリプトをアタッチ]を選択し[言語]を"GDScript"を"**C#**"に変更（重要）してから[作成]すると"Main.cs"が生成される

1. コードの変更（[外部エディタ](https://github.com/mubirou/Godot#%E5%A4%96%E9%83%A8%E3%82%B9%E3%82%AF%E3%83%AA%E3%83%97%E3%83%88%E3%82%A8%E3%83%87%E3%82%A3%E3%82%BF)を使用することも可能）

```CSharp
using Godot;

public class Main : Spatial { // 2Dの場合はGodot.Node2Dを継承
    public override void _Ready() {
        GD.Print("Hello,world!");
    }
}
```

1. 再生ボタン[▶]を押すと…  

```CSharp
Hello,world!
```

と表示されたら成功！

***
[[GDScript 版](https://github.com/mubirou/HelloWorld/blob/master/languages/GDScript/GDScript_win.md#gdscript-windows-)]  
実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年02月12日

### この項目は書きかけです

### 👉 .NET 6.0 SDK のインストール

1. [.NET 6.0 のダウンロード](https://dotnet.microsoft.com/ja-jp/download/dotnet/6.0) を開く

1. 最新の SDK 6.0.XXX の次のものをダウンロード＆インストール後に再起動
    * OS：Windows
    * インストーラー：x64

### 👉 Godot Engine（.NET 6 対応版）のインストール

1. [ここ](https://godotengine.org/article/dev-snapshot-godot-4-0-beta-1#downloads) から **.NET 6 build**（C#, GDScript, GDExtension）を選択

1. **Godot_v4.0-beta1_mono_win64.zip** をダウンロード＆解凍

実行環境：Windows 10、Godot Engine 4.0 Beta 1、.NET SDK 6.0.401  
作成者：夢寐郎  
作成日：2022年09月XX日  
