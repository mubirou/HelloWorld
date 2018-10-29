# C# with Unity（ Linux ）

## C# with Unityについて

* ゲームの統合開発環境 [Unity](https://unity3d.com/jp/)（2005年登場）で利用可能なプログラミング言語
* Unity Editorのバージョンは、5.6（2017年3月リリース）以降、「2017.x」等となっている
* Unity Editorの最新バージョンは「2017.3.1f1」（2018年2月リリース）


## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|Ubuntu 16.04.4 LTS|2018年03月|
|Unity Editor| [2017.2.1f1](https://forum.unity.com/threads/unity-on-linux-release-notes-and-known-issues.350256/page-2) Personal|2018年02月|
|エディタ|Visual Studio Code 1.21.0|2018年03月|
|拡張機能|C#（Microsoft） 1.14.0|ー|
|拡張機能|Debugger for Unity 1.3.0|2018年02月|

1. Unityアカウントの作成
    1. [unity3d.com](https://unity3d.com/jp)にアクセス
    1. 右上のアイコンをクリック → [Unity IDを作成する] をクリック
    1. Email、Password、Username、Full Nameを入力、指示に従います

1. Unity Editor for Linuxのインストール
    1. [Unity Forums](https://forum.unity.com/threads/unity-on-linux-release-notes-and-known-issues.350256/page-2)にアクセス
    1. 「Build #20180911」の「Official Installer:2018.2.7f1:」のリンクをクリック
    1. 「Linux Download Assistant」をクリック → ダウンロード開始
    1. 端末を起動し次の通り処理
    ```
    $ cd /home/（ユーザー名）/デスクトップ ← 上記のダウンロード先にアクセス
    $ ls -l UnitySetup-2018.2.7f1 ← 権限を調べる（任意）
    -rw-rw-r-- 1 none none 274056 10月 29 14:11 UnitySetup-2018.2.7f1
    $ sudo chmod -R 777 UnitySetup-2018.2.7f1 ← 実行権限を与える
    $ ./UnitySetup-2018.2.7f1 ← Installer起動
    ```
    1. インストールの途中「Choose Components」で次の項目にチェック  
        ✔ Unity 2018.2.7f1  
        ✔ Documentation  
        ✔ Android Build Support  
        ✔ WebGL Build Support  
    1. ホーム/Unity-2018.2.7f1/Editor/Unityをクリックして起動

1. Visual Studio Codeに拡張機能の追加
    [表示] → [拡張機能] から「C#（Microsoft）」と「Debugger for Unity」を検索＆インストール


## プロジェクトとC#ファイルの作成

1. プロジェクトの作成
    1. Unityを起動
    1. [New]をクリック
    1. 以下の通り設定（任意）して [Create project] をクリック
        * Project name: Project001 →フォルダが生成される
        * Location: /home/nishimura/デスクトップ

1. Scene（世界）の保存  
    1. [File]-[Save Scene] を選択し、名前を "Scene001"（任意）とする
    1. (Location)/(Project name)/Assets/ 内に「Scene001.unity」と「Scene001.unity.meta」が生成されたのを確認
    1. [Window]-[Project]（≒楽屋裏）の [Assets] に「Scene001」が追加された事を確認

1. GameObject（空）の作成  
    1. [GameObject]-[Create Empty] を選択
    1. [Window]-[Hierarchy]（階層）の「Scene001」内に「GameObject」が追加された事を確認

1. C#ファイルの生成
    1. [Assets]-[Create]-[C# Script] を選択
    1. ファイル名を"NewBehaviourScript"から"Main"に変更（任意）
    1. (Location)/(Project name)/Assets/ 内に「Main.cs」が生成された事を確認

1. C#ファイルの修正
    1. Visual Studio Codeで「Main.cs」を開く
    1. クラス名を「NewBehaviourScript」から「Main」に変更されているか確認  
    （変更されていなければ修正）
    ```
    5行目 public class Main : MonoBehaviour {
    ```

1. オブジェクトとC#ファイルの紐付け
    1. 上記で作成した [Window]-[Hierarchy] の「GameObject」を選択
    1. [Window]-[Inspector] の [Add Component] エリアに、上記で作成した [Window]-[Project]-[Assets] 内の「C#（Main）」をドラッグ＆ドロップ
    1. 「GameObject」の [Inspector] に「Main（Script）」が追加された事を確認


## コードの記述

1. Visual Studio Codeを起動し、上記の「Main.cs」を開く
1. 次のように書き換えて保存
```
//using System.Collections; //今回は不要
//using System.Collections.Generic; //今回は不要
using UnityEngine;

public class Main : MonoBehaviour {

	// Use this for initialization
	void Start () {
		Debug.Log("Hello,world!"); //追加
	}
	
	// Update is called once per frame（今回は不要）
	// void Update () {
		
	// }
}
```
1. Unityに戻ります
1. [Window]-[Project]-[Assets] 内の「C#（Main）」を選択
1. 「C#（Main）」の [Inspector] でもコードが書き換えられている事を確認


## 実行

1. Unityの [Edit]-[Play] を選択（三角の再生ボタンでも可能）
1. [Window]-[Copnsole] 上に"Hello,world!"と表示されたら成功！  
「!」マークをクリックすると、より詳細な情報が表示される

***
作成者: 夢寐郎  
作成日: 2018年03月07日  
更新日：2018年10月29日 Unity 2018.2に対応