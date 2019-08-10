# C# with Unity（ Linux ）

## C# with Unityについて

* ゲームの統合開発環境 [Unity](https://unity3d.com/jp/)（2005年登場）で利用可能なプログラミング言語
* Unity Editorのバージョンは、5.6（2017年3月リリース）以降、「2018.x」等となっている
* Unity Editorの最新バージョン（Beta版）は「2019.1Beta」（2019年3月現在）


## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|Ubuntu 18.04.2 LTS|2019年02月|
|Unity Editor| Unity 2019.3.0a11|2019年08月|
|Unity Hub|Unity Hub 2.0.4|2019年07月|
|エディタ|Visual Studio Code 1.36.1|2019年07月|
|拡張機能|C#（Microsoft） 1.17.1|―|
|拡張機能|Debugger for Unity 2.7.2|―|

1. Unityアカウントの作成
    1. [unity3d.com](https://unity3d.com/jp)にアクセス
    1. 右上のアイコンをクリック → [Unity IDを作成する] をクリック
    1. Email、Password、Username、Full Nameを入力、指示に従います

1. インストール方法（新）
    1. [Unity Forums](https://forum.unity.com/threads/unity-hub-v2-0-0-release.677485/) から [Hub 2.0.0 for Linux] を選択し「UnityHubSetup.AppImage」ファイルをダウンロード
    1. Linux の端末で次の通りに処理  
        ```
        $ cd デスクトップ ←ダウンロードした場所を指定
        $ chmod 755 UnityHubSetup.AppImage ←権限の変更
        $ ./UnityHubSetup.AppImage ←デスクトップ上のアイコンをWクリックでもよい
        ```
    1. 途中「Agree」「Yes」を選択後、インストール画面で「**Unity バージョンがありません**」と表示されたら、[リストに追加] を選び、使用している Unity Editor の実行ファイルを選び（ユーザ名/Unity-2019.1.0f2/Editor/Unity など）[Select Editor] をクリック→[インストール]
    1. 「Unity バージョンを加える」画面で最新正式リリースを選択し [次へ]
    1. 「Unity 2019.2.0f1 にモジュールを追加」と表示されたら、次の項目を✔して [実行]  
        * Android Build Support
        * WebGL Build Support
        * Documentation
        * 日本語
    1. /home/Unity/Hub/Editor/2019.2.0f1/ がインストールされる  
    1. Unity を起動する場合…
        ```
        $ ./UnityHubSetup.AppImage
        ```
    …だが既存のプロジェクタを開けないため（現バージョン）次の処理を行う  
    1. UnityHubSetup.AppImage をゴミ箱に入れる
    1. OS を再起動
    1. 端末で次の通り実行  
        ```
        $ Unity/Hub/Editor/2019.3.0a11/Editor/Unity
        ```

1. インストール方法（旧）
    1. [Unity Forums](https://forum.unity.com/threads/unity-on-linux-release-notes-and-known-issues.350256/page-2)にアクセス
    1. 最新である「Unity 2019.1 is now available!」の「Standalone Linux Installer:2019.1.0f2:」のリンク（https://beta.unity3d.com/...）をクリック→ ダウンロード開始
    1. Linux「端末」を起動し次の通り処理  
    ```
    $ cd /home/（ユーザー名）/デスクトップ ← 上記のダウンロード先にアクセス
    $ ls -l UnitySetup-2019.1.0f2 ← 権限を調べる（任意）
    -rw-rw-r-- 1 none none 274535  6月 17 13:31 UnitySetup-2019.1.0f2
    $ sudo chmod -R 777 UnitySetup-2019.1.0f2 ← 実行権限を与える
    $ ./UnitySetup-2019.1.0f2 ← Installer起動
    ```
    1. インストールの途中「I accept the therms of the License Agreement」に✔
    1. インストールの途中「Choose Components」で次の項目等にチェック  
        ✔ Unity 2019.1.0f2  
        ✔ Android Build Support  
        ✔ WebGL Build Support  
    1. Linux「端末」上で次のコマンドを実行して起動  
    ```
    $ /home/none/Unity-2019.1.0f2/Editor/Unity
    ```

1. Visual Studio Codeに拡張機能の追加
    [表示] → [拡張機能] から「C#（Microsoft）」と「Debugger for Unity」を検索＆インストール


## プロジェクトとC#ファイルの作成

1. プロジェクトの作成
    1. Unityを起動
    1. [New]をクリック
    1. 以下の通り設定（任意）して [Create project] をクリック
        * Project name: Project001 →フォルダが生成される
        * Location: /home/（ユーザ名）/デスクトップ

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
更新日: 2019年08月02日 Unity 2019.2.0f1 に対応