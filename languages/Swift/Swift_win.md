# Swift（ Windows ）

## Swiftについて

* 2014年に登場した [iOS](http://bit.ly/2lw7f2p) 、 [macOS](https://ja.wikipedia.org/wiki/MacOS) 用のオブジェクト指向プログラミング言語
* [Apple](http://bit.ly/2lW4Bpm) としては [Objective-C](https://github.com/mubirou/HelloWorld/blob/master/languages/ObjectiveC/README.md) の後継との位置付けだが併用も可能
* 2015年12月に[オープンソース](http://bit.ly/1Md3omK)化され Linux（[Ubuntu](https://www.ubuntulinux.jp/home)） でも動作可能になった
* 2016年2月にクラウドでテストが可能な [IBM Swift Sandbox](https://swift.sandbox.bluemix.net) を発表（Windowsでも利用可能）


## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|[Windows](https://ja.wikipedia.org/wiki/Microsoft_Windows) 10（64bit）|ー|
|Webコンパイラ|[IBM Swift Sandbox](https://swift.sandbox.bluemix.net)|ー|
|ブラウザ|Google Chrome 57.0.2987.98|2017年03月|

1. Web ブラウザ（Google Chrome）で [IBM Swift Sandbox](https://swift.sandbox.bluemix.net) にアクセス
1. [Settings] をクリック、次の通りに設定
    * SELECT ARCHITECTURE : Linux（x86_64）
    * SELECT VERSION : Ver.3.0.2（Release）


## コードの記述～実行

1. [IBM Swift Sandbox](https://swift.sandbox.bluemix.net) でコードを記述
    ```
    public class MyClass {
        //コンストラクタ
        init() {
            print("Hello,world!")
        }
    }
    var _myClass:MyClass = MyClass()
    ```

1. 画面中央下の [Execute] ボタンをクリック（Ctrl + s）  
Hello,world! ←と表示されたら成功！

***
作成者: 夢寐郎  
作成日: 2017年03月17日