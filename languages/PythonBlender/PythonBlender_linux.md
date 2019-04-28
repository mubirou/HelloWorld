# Python with Blender（ Linux ）

## Python with Blenderについて

* Python を使って Blender のあらゆる（100%?）制御が行えます

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|Ubuntu 18.04.2 LTS|2019年02月|
|ソフトウェア|Blender 2.80 Beta|2018年11月|
* Blender のインストール方法は[こちら](https://github.com/mubirou/Blender/tree/master/introduction#%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB)

## "Pythonコンソール"を使う方法

1. Blender を起動
1. 何れかのウィンドウを [Pythonコンソール] に変更
1. コードの記述と実行
    ```
    >>> print("Hello,world!")
    Hello,world!
    ```

## "テキストエディター"を使う方法

1. [端末] から Blender を起動
    ```
    $ /home/(ユーザ名)/blender-2.80○○/blender
    ```

1. Blender 画面の [Scripting] タブを選択
1. 左上の [テキストエディター] 下部の [+ 新規] を選択
1. [テキストエディター] 下部の [テキスト]-[名前をつけて保存...] から .blend ファイルと同じ階層に test.py として保存
1. コードの記述
    ```
    #test.py
    class MyClass(object): #(object)は省略可能
        print("Hello,world!")

    _myClass = MyClass() #インスタンスの生成
    ```
1. コードの実行（何れかの方法を行う）
    * [テキストエディター] 右下の [スクリプト実行]
    * [テキストエディター] 下部の [テキスト]-[スクリプト実行]
1. [端末] 上に "Hello,world!" と表示されたら成功！

***
作成者: 夢寐郎  
作成日: 2019年04月28日