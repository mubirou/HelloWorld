# C# with Godot（ Windows ）

## C# with Godot について

* [Godot Engine](https://godotengine.org/) 3.0（2018年リリース）から[Mono](https://ja.wikipedia.org/wiki/Mono_(%E3%82%BD%E3%83%95%E3%83%88%E3%82%A6%E3%82%A7%E3%82%A2))を利用して使えるようになったスクリプト言語
* C#のほかに[Python](https://github.com/mubirou/HelloWorld/blob/master/languages/Python/Python_reference.md#python-%E5%9F%BA%E7%A4%8E%E6%96%87%E6%B3%95)に似た構文を採用している[GDScript](https://github.com/mubirou/HelloWorld/blob/master/languages/GDScript/GDScript_win.md#gdscript-windows-)も利用可能
* [C# with Godot 基本文法](https://github.com/mubirou/HelloWorld/blob/master/languages/C%23Godot/C%23Godot_reference.md#c-with-godot-%E5%9F%BA%E7%A4%8E%E6%96%87%E6%B3%95)

## Hello,world

### 👉 .NET 6.0 SDK のインストール（必須）

1. [.NET 6.0 のダウンロード](https://dotnet.microsoft.com/ja-jp/download/dotnet/6.0) を開く

1. 最新の SDK（**SDK 6.0**.401）の Windows / **x64**（64ビット版）をダウンロード＆インストール後に Windows を再起動

### 👉 Godot Engine（.NET 6 対応版）のインストール

1. [**ここ**](https://godotengine.org/article/dev-snapshot-godot-4-0-beta-1#downloads)から **.NET 6 build**（C#, GDScript, GDExtension）を選択

1. **Godot_v4.0-beta1_mono_win64.zip** をダウンロード＆解凍

### 👉 プロジェクトの作成

1. **Godot_v4.0-beta1_mono_win64.exe** を起動
1. [新規プロジェクト] を選び以下を設定し[作成して編集]
    * プロジェクト名：任意
    * プロジェクトパス：任意
    * レンダラー：[Vulkan](https://ja.wikipedia.org/wiki/Vulkan_(API)) Clustered
1. [シーン]-[3D シーン] を選択
1. "Node3d" → "Main" に変更
1. [シーン]-[シーンを保存] で "Main.tscn" を [保存]  
1. [ファイルシステム] に "Main.tscn" が生成される
1. 再生ボタン ▶ を押すと「メインシーンが定義されていません。選択しますか？」というダイアログが表示されるので [現在のものを選択] を選ぶ

### 👉 コードの記述

1. [シーン]-[Main]→[右クリック]-[スクリプトをアタッチ]-[言語: **C#**] で "Main.cs" を [作成]  
1. [ファイルシステム] に "Main.cs" が生成される
1. コードの変更

    ```CSharp
    using Godot;
    using System;

    public partial class Main:Node3D {
        public override void _Ready() {
            GD.Print("Hello,world!");
        }
    }
    ```

1. 再生ボタン ▶ を押すと…  

```CSharp
Hello,world!
```

と表示されたら成功！

実行環境：Windows 10、Godot Engine 4.0 beta 1（.NET 6 対応版）、.NET SDK 6.0.401  
作成者：夢寐郎  
作成日：2022年02月12日  
更新日：2022年09月XX日 Godot 4.0 対応  
