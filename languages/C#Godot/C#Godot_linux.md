# C# with Godot（ Linux ）

## GDScript について

* [Godot Engine](https://godotengine.org/)で使われるスクリプト言語
* [Python](https://github.com/mubirou/HelloWorld/blob/master/languages/Python/Python_reference.md#python-%E5%9F%BA%E7%A4%8E%E6%96%87%E6%B3%95)に似た構文を採用してはいるが全く別物のプログラミング言語
* [GDScript 基本文法](https://github.com/mubirou/HelloWorld/blob/master/languages/GDScript/GDScript_reference.md#gdscript-%E5%9F%BA%E7%A4%8E%E6%96%87%E6%B3%95)
* Godot 3.0（2018年リリース）から[C#](https://github.com/mubirou/HelloWorld/blob/master/languages/C%23Godot/C%23Godot_win.md#c-with-godot-windows-)も利用可能

## Hello,world!

1. https://godotengine.org/download/linux 
から [Mono version (C# support)]-[64-bit(x86_64)] をダウンロードして解凍

1. Godot_v3.4.3-stable_mono_x11.64 を起動（インストール作業は不要）

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
```
Hello,world!
```
と表示されたら成功！

***
https://github.com/mubirou/HelloWorld/blob/master/languages/GDScript/GDScript_linux.md



[[GDScript 版](https://github.com/mubirou/HelloWorld/blob/master/languages/GDScript/GDScript_linux.md#gdscript-linux-)]  
参考：[Qiita](https://qiita.com/2dgames_jp/items/2f8e3690260af7946aed)  
実行環境：Ubuntu 20.04.4 LTS、Godot Engine 3.4.3  
作成者：夢寐郎  
作成日：2022年03月12日
