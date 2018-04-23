# <b>ActionScript 3.0 基礎文法</b>

### <b>INDEX</b>

* Hello,world! （[Linux](https://github.com/mubirou/HelloWorld/blob/master/languages/ActionScript/ActionScript_linux.md) / [macOS](https://github.com/mubirou/HelloWorld/blob/master/languages/ActionScript/ActionScript_mac.md) / [Windows](https://github.com/mubirou/HelloWorld/blob/master/languages/ActionScript/ActionScript_win.md)）
* [データ型](#データ型)
* [データ型の操作](#データ型の操作)
* [クラス](#クラス)
* [スーパークラスとサブクラス](#スーパークラスとサブクラス)
* [名前空間](#名前空間)
* [継承と委譲](#継承と委譲)
* [変数とスコープ](#変数とスコープ)
* [アクセサ （getter / setter）](#アクセサ)
* [演算子](#演算子)
* [定数](#定数)
* [メソッド](#メソッド)
* [匿名関数](#匿名関数)
* [クラス定数･クラスメソッド](#クラス定数･クラスメソッド)
* [if 文](#if文)
* [三項演算子](#三項演算子)
* [switch 文](#switch文)
* [for 文](#for文)
* [for...in 文](#for...in文)
* [for each...in 文](#foreach...in文)
* [while 文](#while文)
* [配列（Array）](#配列（Array）)
* [連想配列（Object）](#連想配列（Object）)
* [this](#this)
* [文字列の操作](#文字列の操作)
* [正規表現](#正規表現)
* [抽象クラス](#抽象クラス)
* [super キーワード](#superキーワード)
* [オーバーライド](#オーバーライド)
* [カスタムイベント](#カスタムイベント)
* [数学関数（Math）](#数学関数（Math）)
* [乱数](#乱数)
* [日時情報](#日時情報)
* [タイマー](#タイマー)
* [処理速度計測](#処理速度計測)
* [外部テキストの読み込み](#外部テキストの読み込み)
***

<a name="データ型"></a>
# <b>データ型</b>

### データ型の種類
1. boolean（論理型）
1. number（整数･浮動小数点数）
    * int 型（±21億余の整数）、uint 型（0〜4,294,967,295の整数）もあり
1. string（文字列）
1. object（全てのオブジェクトのベース）
1. undefined（未初期化変数）
1. function/Function（関数）  
* Object、Button、TextField、MovieClip、null などは object 型

### 例文
```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ

            //①boolean（論理型）
            var _boolean: Boolean = true;
            console.log(_boolean, typeof _boolean); //[true, "boolean"]

            var _boolean2: Boolean = new Boolean(true);
            console.log(typeof _boolean2); //["boolean"]（"object"ではない）

            //②number（整数･浮動小数点数） ※NaNも number 型
            var _number: Number = 9007199254740998;
            //-9007199254740998〜9007199254740998（約±9000兆）まで扱える
            console.log(_number, typeof _number); //[9007199254740998, "number"]

            var _number2: Number = 3.14159265358979323846264338327;
            console.log(_number2, typeof _number2); //[3.141592653589793, "number"]

            var _number3: Number = new Number(1);
            console.log(typeof _number3); //["number"]（"object"ではない）

            //③string（文字列）
            var _string: String = "いろは"; //シングルまたはダブルクォーテーションで囲む
            console.log(_string, typeof _string); //["いろは", "string"]

            var _string2: Object = new String("1");
            console.log(typeof _string2); //["string"]（"object"ではない）

            //④object（全てのオブジェクトのベース）
            var _object: Object = { name: "TARO", age: 49 }; //連想配列
            console.log(typeof _object); //["object"]

            var _array: Object = ["A", "B", "C"]; //配列（Array）
            console.log(typeof _array); //["object"]

            var _hoge2: Object = null; //null（データ不在）
            console.log(_hoge2, typeof _hoge2); //[null, "object"]

            var _myClass: MyClass = new MyClass();
            console.log(typeof _myClass); //["object"]

            //⑤undefined（未初期化変数）
            var _hoge: *; //変数宣言したのみで値が設定されていない場合
            console.log(_hoge, typeof _hoge); //[undefined, "undefined"]

            //⑥function（関数）
            var _function: Function = function():void {}; //匿名関数
            console.log(_function); //[function] ←typeof は不可

        }
    }
}

class MyClass {} //クラス

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface; //JavaScriptの実行用
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args); //JavaScriptを実行
    }
}
```

実行環境：Flex SDK 4.16、Flash Player 25、Ubuntu 16.04 LTS、Chromium 56  
作成者：MUBIROU  
作成日：2017年03月29日  


<a name="データ型の操作"></a>
# <b>データ型の操作</b>

### データ型を調べる①
（ typeof 演算子 ＝ データ型を文字列で返す）

```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ
 
            //①boolean（論理型）
            console.log(typeof true); //["boolean"]

            //②number（整数･浮動小数点数）
            console.log(typeof 1); //["number"]
            console.log(typeof 1.0); //["number"]

            //③string（文字列）
            console.log(typeof "1"); //["string"]

            //④object（全てのオブジェクトのベース）
            console.log(typeof {name:"TARO", age:49}); //["object"]

            //⑤undefined（未初期化変数）
            var _hoge: *;
            console.log(typeof _hoge); //["undefined"]
        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface; //JavaScriptの実行用
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args); //JavaScriptを実行
    }
}
```

### データ型を調べる②
（ is 演算子 ＝ データ型が一致するか true / false で返す）

```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ

            console.log(true is Boolean); //[true]
            console.log(1 is Number); //[true]
            console.log("1" is String); //[true]
            console.log(new Object() is Object); //[true]
            function hoge():void {};
            console.log(hoge is Function); //[true]

        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface; //JavaScriptの実行用
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args); //JavaScriptを実行
    }
}
```
*  指定のデータ型に変更できる場合は変更し、できない場合は null を返す「as 演算子」もある

### データ型のキャスト（変換）
```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ

            //①数値→boolean型
            var _boolean: Boolean = new Boolean(1);
            console.log(_boolean, typeof _boolean); //[true, "boolean"]

            //②boolean型→number型
            var _number1: Number = Number(true);
            console.log(_number1, typeof _number1); //[1（falseの場合は0）, "number"]

            //③文字列→number型
            var _number2: Number = Number("3.14");
            console.log(_number2, typeof _number2); //[3.14, "number"]

            var _number3: Number = parseInt("3.14"); //小数点以下を切り捨てて整数化
            console.log(_number3, typeof _number3); //[3, "number"]

            var _number4: Number = parseFloat("3.14です。"); //数字以外を含む値
            console.log(_number4, typeof _number4); //[3.14, "number"]

            //④数値→string型
            var _string1: String = String(100); //(100).toString() でも同じ
            console.log(_string1, typeof _string1); //["100", "string"]

            var _string2: String = (100).toString();
            console.log(_string2, typeof _string2); //["100", "string"]

            //⑤配列→string型
            var _string3: String = String(["Yoshimura", 49]);
            console.log(_string3, typeof _string3); //["Yoshimura,49", "string"]

        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface; //JavaScriptの実行用
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args); //JavaScriptを実行
    }
}
```

実行環境：Flex SDK 4.16、Flash Player 25、Ubuntu 16.04 LTS、Chromium 56  
作成者：MUBIROU  
作成日：2017年03月29日  


<a name="クラス"></a>
# <b>クラス</b>

```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ

            //①インスタンスの作成
            var _rectangle: Rectangle = new Rectangle();

            //②プロパティの確認と変更
            console.log(_rectangle.width, _rectangle.height); //[640, 480]
            _rectangle.width = 1920;
            _rectangle.height = 1080;
            console.log(_rectangle.width, _rectangle.height); //[1920, 1080]

            //③メソッドの実行
            console.log(_rectangle.getArea()); //[2073600]

        }
    }
}

//長方形クラス（通常は package 化して Rectangle
class Rectangle {
    //プロパティ群の初期値の設定
    private var _width: uint = 0;
    private var _height: uint = 0;

    //コンストラクタ
    public function Rectangle(_w: uint = 640, _h: uint = 480) { 
        _width = _w;
        _height = _h;
    }

    //アクセサ（getter/setter）
    public function get width(): uint {
        return _width;
    }
    public function set width(_newValue: uint): void {
        _width = _newValue;
    }

    public function get height(): uint {
        return _height;
    }
    public function set height(_newValue: uint): void {
        _height = _newValue;
    }

    //面積を計算して値を返す
    public function getArea(): uint {
        return _width * _height;
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface; //JavaScriptの実行用
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args); //JavaScriptを実行
    }
}
```

実行環境：Flex SDK 4.16、Flash Player 25、Ubuntu 16.04 LTS、Chromium 56  
作成者：MUBIROU  
作成日：2017年03月29日  


<a name="スーパークラスとサブクラス"></a>
# <b>スーパークラスとサブクラス</b>

```
//Main.as
package  {
    import flash.display.Sprite ;
    public class Main extends Sprite {
        public function Main() {

            //サブクラスＡからインスタンスを生成
            var _subClassA:SubClassA = new SubClassA();
            console.log(_subClassA.prop_Super); //["スーパークラスのプロパティ"]
            console.log(_subClassA.prop_SubA); //["サブクラスＡのプロパティ"]
            console.log(_subClassA.mSuperClass()); //["スーパークラスのメソッド"]
            console.log(_subClassA.pSubClassA()); //["サブクラスＡのメソッド"]
            
             //サブクラスＢからインスタンスを生成
            var _subClassB:SubClassB = new SubClassB();
            console.log(_subClassB.prop_Super); //["スーパークラスのプロパティ"]
            console.log(_subClassB.prop_SubB); //["サブクラスＢのプロパティ"]
            console.log(_subClassB.mSuperClass()); //["スーパークラスのメソッド"]
            console.log(_subClassB.pSubClassB()); //["サブクラスＢのメソッド"]
            
        }
    }
}


/***********************************
スーパークラス
***********************************/
class SuperClass {
    //プロパティの定義
    private var _pSuperClass:String = "スーパークラスのプロパティ";

    //コンストラクタ
    public function SuperClass() {}

    //アクセサの定義（setterは省略）
    public function get prop_Super(): String {
        return _pSuperClass;
    }

    //メソッドの定義
    public function mSuperClass(): String { 
        return "スーパークラスのメソッド";
    }
}


/***********************************
サブクラスＡ（スーパークラスを継承）
***********************************/
class SubClassA extends SuperClass { //スーパークラスを継承
    //プロパティの定義
    private var _pSubClassA:String = "サブクラスＡのプロパティ";

    //コンストラクタ
    public function SubClassA() {}

    //アクセサの定義（setterは省略）
    public function get prop_SubA(): String {
        return _pSubClassA;
    }

    //メソッドの定義
    public function pSubClassA(): String {
        return "サブクラスＡのメソッド";
    }
}

/***********************************
サブクラスＢ（スーパークラスを継承）
***********************************/
class SubClassB extends SuperClass { //スーパークラスを継承
    //プロパティの定義
    private var _pSubClassB:String = "サブクラスＢのプロパティ";

    //コンストラクタ
    public function SubClassB() {}

    //アクセサの定義（setterは省略）
    public function get prop_SubB(): String {
        return _pSubClassB;
    }

    //メソッドの定義
    public function pSubClassB(): String {
        return "サブクラスＢのメソッド";
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface; //JavaScriptの実行用
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args); //JavaScriptを実行
    }
}
```

実行環境：Flex SDK 4.16、Flash Player 25、Ubuntu 16.04 LTS、Chromium 56  
作成者：MUBIROU  
作成日：2017年03月29日  


<a name="名前空間"></a>
# <b>名前空間</b>

### 概要
* パッケージ宣言をすることでコンパイル時に名前空間が暗黙的に作成される
* ドメインが xxx.com の場合は com フォルダの中に xxx フォルダを作成し、そこにクラスファイル（.as）を置き、「jp.xxx.クラス名」でアクセスするなどして、名前空間がぶつからないようにする

### 例文

* ドキュメントクラス（Main.as）
```
//Main.as
package  {
    import flash.display.Sprite;
    import jp.xxx.SomeClass; //外部クラス（SomeClass.as）をインポートする

    public class Main extends Sprite {
        public function Main() {
            var _someClass: SomeClass = new SomeClass();
        }
    }
}
```

* 外部クラス（Main.as から見て ../com/xxx/SomeClass.as ファイル）
```
package jp.xxx {
    public class SomeClass {
        public function SomeClass(): void {
            console.log("SomeClass");
        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface; //JavaScriptの実行用
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args); //JavaScriptを実行
    }
}
```

実行環境：Flex SDK 4.16、Flash Player 25、Ubuntu 16.04 LTS、Chromium 56  
作成者：MUBIROU  
作成日：2017年03月29日  


<a name="継承と委譲"></a>
# <b>継承と委譲</b>

### 概要

* GoF デザインパターンの [Adapter パターン](http://bit.ly/2naab8x)等で利用される
* 継承の場合は <b>extends クラス名</b> を使い、委譲の場合は <b>new クラス名()</b> を使ってオブジェクトを生成し、他のクラスの機能を利用する

### 継承版

```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ
            //実行
            var _classB: ClassB = new ClassB();
            _classB.myMethod(); //["ClassA.myMethod"]
        }
    }
}

//ClassAクラス
class ClassA { //委譲と同じ
    public function ClassA() {} //コンストラクタ

    public function myMethod(): void {
        console.log("ClassA.myMethod");
    }
}

//ClassBクラス
class ClassB extends ClassA { //ClassAを継承（ここだけ委譲版と異なる）
    public function ClassB() { //コンストラクタ
        //super(); //AS3の場合無くても良い
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface; //JavaScriptの実行用
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args); //JavaScriptを実行
    }
}
```

### 委譲版

```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ
            //実行
            var _classB: ClassB = new ClassB();
            _classB.myMethod(); //["ClassA.myMethod"]
        }
    }
}

//ClassAクラス
class ClassA { //委譲と同じ
    public function ClassA() {} //コンストラクタ

    public function myMethod(): void {
        console.log("ClassA.myMethod");
    }
}

//ClassBクラス
class ClassB { //ここだけ継承版と異なる
    private var _classA: ClassA; //private変数宣言

    //コンストラクタ
    public function ClassB() {
        _classA = new ClassA(); //オブジェクトを生成（委譲）
    }

    public function myMethod(): void {
        _classA.myMethod(); //ClassAのmyMethod()を実行
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface; //JavaScriptの実行用
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args); //JavaScriptを実行
    }
}
```

実行環境：Flex SDK 4.16、Flash Player 25、Ubuntu 16.04 LTS、Chromium 56  
作成者：MUBIROU  
作成日：2017年03月29日


<a name="変数とスコープ"></a>
# <b>変数とスコープ</b>

### ルール
* 半角英数字、_（アンダースコア）、$（ドル記号）のみ使用可能
* 小文字大文字は区別
* 頭文字は「数字」は不可
* ActionScript 3.0 の「予約語」は使えない
* 全角、日本語でも動作可能だが避けるべき
* 1行で複数定義する場合、「var 変数名: データ型 = 値, 変数名: データ型 = 値」のように記述する

### アクセス修飾子
1. public （あらゆるパッケージの全クラスからアクセス可）
1. internal （同じパッケージ内の全クラスからアクセス可／省略すると internal 扱い）
1. protected （同じクラス or サブクラスからのみアクセス可）
1. private (同じクラスからのみアクセス可)

### 例文

```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ
            new MyClass(); //実行
        }
    }
}

class MyClass {
    private var _hoge: String = "PRIVATE"; //privateを省略するとinternal扱い

    //コンストラクタ
    public function MyClass() {
        foo();
        console.log(_hoge); //["PRIVATE"]
    }

    private function foo(): void {
        var _hoge: String = "LOCAL"; //ローカル変数の定義
        console.log(_hoge); //["LOCAL"]
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface; //JavaScriptの実行用
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args); //JavaScriptを実行
    }
}
```

実行環境：Flex SDK 4.16、Flash Player 25、Ubuntu 16.04 LTS、Chromium 56  
作成者：MUBIROU  
作成日：2017年03月29日


<a name="アクセサ"></a>
# <b>アクセサ （getter / setter）</b>

### 読書き可能なプロパティ
```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ
            //実行
            var _yoshimura: Yoshimura = new Yoshimura(49);
            console.log(_yoshimura.age); //[49]
            _yoshimura.age = 50; //変更が可能
            console.log(_yoshimura.age); //[50]
        }
    }
}


class Yoshimura {
    private var _age: int = 0;

    public function Yoshimura(_age: int) {
        this._age = _age; //この場合thisは必須
    }

    public function get age(): int {
        return _age;
    }

    public function set age(_newValue: int): void { //返値の型指定は必須
        _age = _newValue;
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

### 読取り専用のプロパティ
```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ
            //実行
            var _yoshimura: Yoshimura = new Yoshimura(49);
            console.log(_yoshimura.age); //[49]
            _yoshimura.age = 50; //["Error: 値の変更はできません"]
        }
    }
}


class Yoshimura {
    private var _age: int = 0;

    public function Yoshimura(_age: int) {
        this._age = _age; //この場合thisは必須
    }

    public function get age(): int {
        return _age;
    }

    public function set age(_newValue: int): void { //返値の型指定は必須
        console.log(new Error("値の変更はできません").toString());
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

実行環境：Flex SDK 4.16、Flash Player 25、Ubuntu 16.04 LTS、Chromium 56  
作成者：MUBIROU  
作成日：2017年03月29日


<a name="演算子"></a>
# <b>演算子</b>

### 算術演算子
（複合代入演算子 += -= *= /= %= などもあり）
```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ

            console.log(3 + 2); //[5]（可算）
            console.log(5 - 8); //[-3]（減算）
            console.log(3 * 4); //[12]（乗算）
            console.log(1 + 2 * 3 - 4 / 2); //[5]（複雑な計算）
            console.log(63 % 60); //[3]（余剰)
            console.log(8 / 3); //[2.6666666666666665]（除算）

        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

### 後ろに付けるインクリメント／デクリメント
```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ

            //インクリメント
            var _huga: Number = 0;
            var _piyo: Number = _huga++; //加算する前の_hugaの値を返す
            console.log(_huga); //[1]
            console.log(_piyo); //[0]

            //デクリメント
            _huga = 0;
            _piyo = _huga--; //減算する前の_hugaの値を返す
            console.log(_huga); //[-1]
            console.log(_piyo); //[0]

        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

### 前に付けるインクリメント／デクリメント
```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ

            //インクリメント
            var _huga: Number = 0;
            var _piyo: Number = ++_huga; //加算後の_hugaの値を返す
            console.log(_huga); //[1]
            console.log(_piyo); //[1]

            //デクリメント
            _huga = 0;
            _piyo = --_huga; //減算後の_hugaの値を返す
            console.log(_huga); //[-1]
            console.log(_piyo); //[-1]

        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

### その他の演算子
```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ

            console.log(true && true); //[true]（論理積）
            console.log(true || false); //[true]（論理和）
            console.log(! true); //[false]（否定）

            console.log(2 < 3); //[true]（比較/未満）
            console.log(2 <= 2); //[true]（比較/以下）
            console.log(1 == 1.0); //[true]（等号）
            console.log(1 != 1.0); //[false]（不等号）

            console.log(3 & 1); //[1]（ビット積）
            console.log(3 | 1); //[3]（ビット和）
            console.log(3 ^ 1); //[2]（排他的ビット和）
            console.log(2 << 7); //[256]（ビット･シフト）
            console.log(~3); //[-4]（ビット反転）

        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

実行環境：Flex SDK 4.16、Flash Player 25、Ubuntu 16.04 LTS、Chromium 56  
作成者：MUBIROU  
作成日：2017年03月29日

<a name="定数"></a>
# <b>定数</b>

### 通常の定数
```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ
            //実行
            const MY_NAME: String = "MUBIROU"; //定数の定義
            console.log(MY_NAME); //["MUBIROU"]
            //MY_NAME = "Ichiro Yoshimura"; //Error（変更不可）
        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

### クラス定数（静的定数）
```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ
            //実行
            console.log(MyMath.PI); //[3.141592653589793]
            //MyMath.PI = 3.14; //Error（変更不可）
        }
    }
}

class MyMath {
    //定数名は慣例的に大文字英字（ENTER_FRAMEなど）
    public static const PI: Number = 3.141592653589793; //クラス定数の定義
    public function MyMath() {} //コンストラクタ
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

実行環境：Flex SDK 4.16、Flash Player 25、Ubuntu 16.04 LTS、Chromium 56  
作成者：MUBIROU  
作成日：2017年03月29日  


<a name="メソッド"></a>
# <b>メソッド</b>

### アクセス修飾子
1. private （同じクラスからのみアクセス可）
1. protected （同じクラスorサブクラスからのみアクセス可）
1. internal （同じパッケージ内の全クラスからアクセス可＝初期設定）
1. public （あらゆるパッケージの全クラスからアクセス可）
* static （クラスメソッド＝静的メソッド）

### パブリックメソッド
```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ
            //実行
            var _myClass: MyClass = new MyClass();
            console.log(_myClass.tashizan(1, 10)); //[55]
            console.log(_myClass.tashizan(1, 100)); //[5050]
        }
    }
}

class MyClass {
    public function tashizan(_start: int, _end: int): int {
        var _result: int = 0; //ローカル変数（メソッド内のみ有効）
        for (var i:int = _start; i <= _end; i++) {
            //i は {} 内のみ有効
            _result += i;
        }
        return _result;
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

### プライベートメソッド
```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ
            //実行
            new Omikuji(); //["大吉"]、["吉"]、["中吉"]、["小吉"]、["凶"] のいずれか
        }
    }
}

class Omikuji {
    //コンストラクタ
    public function Omikuji() {
        var _resultList: Array = ["大吉", "吉", "中吉", "小吉", "凶"];
        console.log(_resultList[this.randomInt(0, 4)]);
    }

    private function randomInt(_min: uint, _max: uint): uint {
        var _tmp: uint = _max - _min + 1;
        return Math.floor(Math.random() * _tmp) + _min;
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

### コンストラクタ
```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ
            //実行
            var _point: Point = new Point(100, 150); //ここでコンストラクタを呼び出す
            console.log(_point.x); //[100]
            console.log(_point.y); //[150]
        }
    }
}

class Point {
    //プライベート変数宣言
    private var _x: Number;
    private var _y: Number;
    
    //コンストラクタ
    public function Point(_x: Number = 0, _y: Number = 0) {
        this._x = _x; //この場合 this は必須
        this._y = _y; //この場合 this は必須
    }

    //アクセサ（getter）
    public function get x(): Number { return _x; }
    public function get y(): Number { return _y; }

    //アクセサ（setter）
    public function set x(_newValue: Number): void { _x = _newValue; }
    public function set y(_newValue: Number): void { _y = _newValue; }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

### 静的メソッド（クラスメソッド）
* インスタンス化せずにメソッドを利用することが可能
```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ
            //実行
            console.log(MyMath.pow(2, 0)); //[1]（2の0乗）
            console.log(MyMath.pow(2, 1)); //[2]（2の1乗）
            console.log(MyMath.pow(2, 8)); //[256]（2の8乗）
        }
    }
}

class MyMath {
    //静的メソッド（public static function メソッド名()）
    public static function pow(_arg1: Number, _arg2: Number): Number {
        if (_arg2 == 0) { return 1; } //0乗対策
        var _result: Number = _arg1;
        for (var i: Number = 1; i < _arg2; i++) {
            _result = _result * _arg1;
        }
        return _result;
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

### デフォルト値付き引数
* 省略可能な引数
* 「オプション引数」とも呼ばれる
```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ
            //実行
            var _myClass: MyClass = new MyClass();
            _myClass.addPoint(); //[1]
            _myClass.addPoint(10); //[11]
        }
    }
}

class MyClass {
    private var _point: Number = 0;
    public function MyClass() {}
    public function addPoint(_arg: Number = 1): void { //初期値を1とした場合
        _point += _arg;
        console.log(_point);
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

### 可変長引数
* 引数を固定の数ではなく任意の数にすることが可能
* 引数の前に「...」（ピリオド3つ）を記述（引数の値は配列になる）
```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ
            //実行
            var _myClass: MyClass = new MyClass();
            console.log(_myClass.sum(1, 2)); //[3]（1+2）
            console.log(_myClass.sum(1, 2, 3, 4, 5)); //[15]（1+2+3+4+5）
        }
    }
}

class MyClass {
    public function sum(...args: Array): Number { 
        var _result: Number = 0;
        for (var _index: String in args) {
            _result += args[_index];
        }
        return _result;
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

実行環境：Flex SDK 4.16、Flash Player 25、Ubuntu 16.04 LTS、Chromium 56  
作成者：MUBIROU  
作成日：2017年03月30日  


<a name="匿名関数"></a>
# <b>匿名関数</b>
```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ
            //実行
            var _hello: Hello = new Hello();
            _hello.hello("TARO"); //["TARO,Hello!"]
            _hello.change("japanese");
            _hello.hello("ちかし"); //["ちかし、こんにちは!"]
            _hello.change("chinese");
            _hello.hello("ちかし"); //["ちかし,你好!"]
        }
    }
}

class Hello {
    //プライベート変数宣言
    private var _american: Function;
    private var _japanese: Function;
    private var _chinese: Function;

    public var hello: Function; //本来はプライベート変数にしてセッターを利用すべき

    //コンストラクタ
    public function Hello() {
        _american = function(_name: String): void { //匿名関数①
            console.log(_name + "," + "Hello!");
        }

        _japanese = function(_name: String): void { //匿名関数②
            console.log(_name + "、" + "こんにちは!");
        }

        _chinese = function(_name: String): void { //匿名関数③
            console.log(_name + "," + "你好!");
        }

        //パブリック変数に匿名関数を代入（前方宣言が必要）
        hello = _american;
    }

    //匿名関数の入替え
    public function change(_language: String): void {
        switch (_language) {
            case "american": hello = _american; break;
            case "japanese": hello = _japanese; break;
            case "chinese": hello = _chinese; break;
        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: *): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

実行環境：Flex SDK 4.16、Flash Player 25、Ubuntu 16.04 LTS、Chromium 56  
作成者：MUBIROU  
作成日：2017年03月30日  


<a name="クラス定数･クラスメソッド"></a>
# <b>クラス定数･クラスメソッド</b>
* クラス定数･クラスメソッドは、クラスをインスタンス化せずにアクセスが可能
```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ
            //①クラス定数の参照
            console.log(MyMath.PI); //[3.141592653589793]
            //MyMath.PI = 3.14; //Error: 値の変更はできません

            //②静的メソッドの実行
            console.log(MyMath.pow(2, 0)); //[1]
            console.log(MyMath.pow(2, 8)); //[256]
        }
    }
}

class MyMath {
    //定数名は慣例的に大文字英字（ENTER_FRAMEなど）
    public static const PI: Number = 3.141592653589793; //クラス定数の定義
    
    public function MyMath() {} //コンストラクタ

    //②静的メソッド（静的メソッド）の定義
    public static function pow(_arg1: uint, _arg2: uint): uint {
        if (_arg2 == 0) { return 1; } //0乗対策
        var _result: uint = _arg1;
        for (var _i: uint = 1; _i < _arg2; _i++) {
            _result = _result * _arg1;
        }
        return _result;
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

実行環境：Flex SDK 4.16、Flash Player 25、Ubuntu 16.04 LTS、Chromium 56  
作成者：MUBIROU  
作成日：2017年03月30日  


<a name="if文"></a>
# <b>if 文</b>

### 基本例文
* trueと評価される可能性が高い順に並べるとif文を早く抜け出せる可能性が高い
```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ

            var _age: Number = 49;
            if (_age <= 20) {
                console.log("20歳以下");
            } else if (_age <= 40) {
                console.log("21〜40歳");
            } else if (_age <= 60) {
                console.log("41〜60歳"); //これが出力される
            } else {
                console.log("61歳以上");
            }

        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

### 論理積（AND）
* 2つの条件が true の場合

1. 論理演算子（&&）を使う方法
    ```
    if (条件式① && 条件②) {
        処理A ←条件式①かつ条件式②の両方がtrueの場合に実行
    } else {
        処理B
    }
    ```

1. if 文のネストを使う方法
    ```
    if (条件式①) {
        if (条件②) {
            処理A ←条件式①かつ条件式②の両方がtrueの場合に実行
        } else {
            処理B
        }
    } else {
        処理B
    }
    ```

### 論理和（OR）
* 2つの条件のどちらか一方でも true の場合
1. 論理演算子（||）を使う方法
    ```
    if (条件式① || 条件②) {
        処理A ←条件式①または条件式②の両方がtrueの場合に実行
    } else {
        処理B
    }
    ```

1. 論理演算子（||）を使わない方法
    ```
    if (条件式①) {
        処理A ←条件式①がtrueの場合に実行
    } else if (条件②) {
        処理A ←条件式②がtrueの場合に実行
    } else {
        処理B
    }
    ```

### 排他的論理和（XOR）
* 2つの条件のうちどちらか一方だけ true の場合
* ActionScript 3.0 には XOR 演算子はない
```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ

            var _a: Boolean = true;
            var _b: Boolean = false;
            if ((_a || _b) && !(_a && _b)) {
                console.log("どちらか一方だけtrueです"); //これが出力される
            } else {
                console.log("両方共にtrueかfalseです");
            }

        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

実行環境：Flex SDK 4.16、Flash Player 25、Ubuntu 16.04 LTS、Chromium 56  
作成者：MUBIROU  
作成日：2017年03月30日  


<a name="三項演算子"></a>
# <b>三項演算子</b>

### 比較式が１つの場合
* 構文
```
データ型 変数名 = (比較式) ? (true時の返り値) : (false時の返り値);
```
* 例文
```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ

            var _age: uint = 49;
            var _result: String = (_age < 60) ? "現役" : "退職";
            console.log(_result); //["現役"]

        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

### 比較式が複数の場合
* 構文
```
変数名 = (比較式①) ? (①がtrueの場合の返り値) : //①がfalseの場合↓
変数名 = (比較式②) ? (②がtrueの場合の返り値) : //②がfalseの場合↓
変数名 = (①②の全てがfalseの場合の返り値);
```
* 例文
```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ

            var _age: Number = 49;
            var _result: String = (_age < 20) ? "未成年" :
            _result = (_age < 60) ? "現役" :
            _result = "退職";
            console.log(_result); //"現役"]

        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

実行環境：Flex SDK 4.16、Flash Player 25、Ubuntu 16.04 LTS、Chromium 56  
作成者：MUBIROU  
作成日：2017年03月30日  


<a name="switch文"></a>
# <b>switch 文</b>

### 判別式が boolean 値ではない場合
```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ

            var _name: String = "TARO";
            switch (_name) {
                case "TARO":
                    console.log("父"); //これが出力される
                    break;
                case "HANAKO":
                    console.log("母");
                    break;
                case "ICHIRO":
                    console.log("長男");
                    break;
                case "JIRO":
                    console.log("次男");
                    break;
                default:
                    console.log("家族以外");
                    break; //省略可
            }

        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

### 判別式が boolean 値の場合
* case 式に比較演算子が使われる
```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ

            var _age: Number = 49;
            switch (true) {
                case _age <= 20:
                    console.log("20歳以下");
                    break;
                case _age <= 40:
                    console.log("21〜40歳");
                    break;
                case _age <= 60:
                    console.log("41〜60歳"); //これが出力される
                    break;
                default:
                    console.log("61歳以上");
                    break; //省略可
            }

        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

### break文が無い使い方
* [C#](https://ja.wikipedia.org/wiki/C_Sharp) のようなフォールスルー禁止規則（何か処理をしておきながら break を書かないとエラー）は無い
```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ

            var _name: String = "JIRO";
            switch (_name) {
                case "TARO":
                case "HANAKO":
                    console.log("親です");
                    break;
                case "ICHIRO":
                case "JIRO":
                    console.log("子供です"); //これが出力される
                    break;
                default:
                    console.log("家族ではありません");
                    break; //省略可
            }

        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

実行環境：Flex SDK 4.16、Flash Player 25、Ubuntu 16.04 LTS、Chromium 56  
作成者：MUBIROU  
作成日：2017年03月30日  


<a name="for文"></a>
# <b>for 文</b>

### ループカウンタの宣言方法
```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ

            for (var i: Number = 0; i < 10; i++) {
                console.log(i); //[0]→[1]→[2]→[3]→[4]→[5]→[6]→[7]→[8]→[9]
            }
            console.log(i); //[10]（for文の外でも有効）

        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

### ループカウンタを○つずつアップする
```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ

            for (var i: uint = 0; i < 50; i += 5) { //5つずつアップする場合…
                console.log(i); //[0]→[5]→[10]→[15]→[20]→[25]→[30]→[35]→[40]→[45]
            }

        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

### for 文のネスト
* ループ制御変数には慣例的に i, j, k が使われる
```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ

            for (var i: Number = 1; i <= 5; i++) {
                for (var j: Number = 1; j <= 5; j++) {
                    console.log("x" + i + "y" + j); //["x1y1"]→["x1y2"]→....["x5y4"]→["x5y5"]
                }
            }

        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

### 無限ループと break 文
```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ

            var _count: Number = 0;
            for (;;) { //①初期化②ループ判定式③更新処理の全てを省略する
                _count++;
                if (_count > 100) break; //ループを終了
                console.log(_count); //[1]→[2]→....[99]→[100]
            }
            console.log("for文終了");

        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

### for 文と continue 文
```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ

            for (var i: Number = 1; i <= 20; i++) { //iは1,2,...19,20
                if ((i % 3) != 0) { //3で割り余りが0でない（＝3の倍数ではない）場合
                    continue; //for文の残処理をスキップしてfor文の次の反復を開始する
                }
                console.log(i); //[3]→[6]→[9]→[12]→[15]→[18]（3の倍数）
            }

        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

実行環境：Flex SDK 4.16、Flash Player 25、Ubuntu 16.04 LTS、Chromium 56  
作成者：MUBIROU  
作成日：2017年03月30日  


<a name="for...in文"></a>
# <b>for...in 文</b>

### 基本構文
```
for (var 変数名: String in 配列等) {
    //配列の場合はインデックス番号、連想配列の場合はプロパティ名
    console.log(変数名);

    //配列の場合は要素の値、連想配列の場合はプロパティ値
    console.log(配列等[変数名]);
}
```

### 配列（1次元）の場合
```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ

            var _array: Array = ["TARO", "HANAKO", "ICHIRO", "JIRO"];
            for (var _index: String in _array) {
                console.log(_index); //["0"]→["1"]→["2"]→["3"]
                console.log(_array[_index]); //["TARO"]→["HANAKO"]→["ICHIRO"]→["JIRO"]
            }

        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}

```

### 配列（2次元）の場合
```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ

            var _array: Array = [
                ["x0y0", "x1y0", "x2y0"], //0行目
                ["x0y1", "x1y1", "x2y1"]  //1行目
            ];
            for (var _index: String in _array) {
                console.log(_index); //["0"]→["1"]
                console.log(_array[_index]); //[Array[3]]（0行目）→[Array[3]]（1行目）
            }

        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

### 連想配列（Object＝オブジェクトリテラル）の場合
```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ

            var _object: Object = { name: "MUBIROU", age: 49 };
            for (var _propName: String in _object) {
                console.log(_propName); //["age"]→["name"]
                console.log(_object[_propName]); //[49]→["MUBIROU"]
            }

        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

実行環境：Flex SDK 4.16、Flash Player 25、Ubuntu 16.04 LTS、Chromium 56  
作成者：MUBIROU  
作成日：2017年03月30日  


<a name="foreach...in文"></a>
# <b>for each...in 文</b>

### 一次元配列（Array）の場合
```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ

            var _array: Array = ["TARO", "HANAKO", "ICHIRO", "JIRO"];
            for each (var _data: String in _array) {
                console.log(_data); //["TARO"]→["HANAKO"]→["ICHIRO"]→["JIRO"]
            }

        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

### 二次元配列（Array）の場合
```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ

            var _array: Array = [
                ["x0y0", "x1y0", "x2y0"], //0行目
                ["x0y1", "x1y1", "x2y1"]  //1行目
            ];
            for each (var _theArray: Array in _array) {
                console.log(_theArray); //[Array[3]]（0行目）→[Array[3]]（1行目）
            }

        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

### 連想配列（Object＝オブジェクトリテラル）の場合
```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ

            var _object: Object = { name: "MUBIROU", age: 49 };
            for each (var _data: * in _object) {
                console.log(_data); //[49]→["MUBIROU"]
            }

        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

実行環境：Flex SDK 4.16、Flash Player 25、Ubuntu 16.04 LTS、Chromium 56  
作成者：MUBIROU  
作成日：2017年03月30日  


<a name="while文"></a>
# <b>while 文</b>

### while 文
* 構文
```
while (ループ判定式) {
    繰り返す処理
}
```

* 例文
```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ

            var _i: Number = 0;
            while (_i < 10) { //ループ判定式にはboolean値しか使えない
                console.log(_i); //[0]→[1]→[2]→[3]→[4]→[5]→[6]→[7]→[8]→[9]
                _i++;
            }

        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

### do...while 文
* 構文
```
do {
    繰り返す処理 ←ループ判定式がfalseの場合でも最低１回は実行される
} while(ループ判定式);
```

* 例文
```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ

            var _i: Number = 0;
            do {
                console.log(_i); //[0] ←ループ判定式はfalseだが１回実行される
                _i++;
            } while (_i < 0);

        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

### while文とbreak文
* 例文（1〜100までを出力）
```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ

            var _count: Number = 0;
            while (true) { //ループ判別式をtrueにすると無限ループに
                _count++;
                if (_count > 100) {
                    break; //break文を使ってループを終了（while文の次の行へ）
                }
                console.log(_count); //[0]→[1]→...[99]→[100]
            }

        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

### while 文と continue 文
* 例文（3の倍数を出力）
```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ

            var _i: Number = 1;
            while (_i <= 20) {
                if ((_i % 3) != 0) { //3で割って余りが0ではない（＝3の倍数ではない）場合
                    _i++;
                    continue; //while文の残処理をスキップしてwhile文の次の反復を開始する
                }
                console.log(_i); //[3]→[6]→[9]→[12]→[15]→[18]（3の倍数）
                _i++;
            }

        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

実行環境：Flex SDK 4.16、Flash Player 25、Ubuntu 16.04 LTS、Chromium 56  
作成者：MUBIROU  
作成日：2017年03月30日  


<a name="配列（Array）"></a>
# <b>配列（Array）</b>

### 作成
* new 演算子を使う方法
    ```
    var _array1: Array = new Array(); //空の配列を作成
    var _array2: Array = new Array(4); //4つの空の要素（undefined）を持つ配列を作成
    var _array3: Array = new Array("A", "I");
    var _array4: Array = new Array(["A","あ"], ["I","い"]); //配列のネスト
    ```

* 配列リテラルを使う方法
    ```
    var _array1: Array = []; //空の配列を作成
    var _array2: Array = ["A", "I"];
    var _array3: Array = [["A","あ"], ["I","い"]]; //配列のネスト
    ```

### 要素の数
```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ

            var _array: Array = ["00", "01", "02", "03"];
            console.log(_array.length); //[4]

        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

### 追加（最後）
```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ

            var _array: Array = ["ICHIRO", "JIRO"];
            _array.push("TARO"); //カンマ（,）を使って複数同時に追加可能
            for each (var _data: String in _array) {
                console.log(_data); //["ICHIRO"]→["JIRO"]→["TARO"]
            }
            
        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

### 追加（先頭）
```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ

            var _array: Array = ["ICHIRO", "JIRO"];
            _array.unshift("TARO"); //カンマ（,）を使って複数同時に追加可能
            for each (var _data: String in _array) {
                console.log(_data); //["TARO"]→["ICHIRO"]→["JIRO"]
            }

        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

### 更新（任意の値）
```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ

            var _array: Array = ["CHIKASHI", "ICHIRO", "JIRO"];
            _array[0] = "TARO"; //0番目を変更する場合
            for each (var _data: String in _array) {
                console.log(_data); //["TARO"]→["ICHIRO"]→["JIRO"]
            }

        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

### 更新（null 値）
```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ

            var _array: Array = ["TARO", "ICHIRO", "JIRO"];
            _array[0] = null;
            for each (var _data: String in _array) {
                console.log(_data); //[null]→["ICHIRO"]→["JIRO"]
            }

        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

### 削除（最後）
```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ

            var _array: Array = ["ICHIRO", "JIRO", "TARO"];
            console.log(_array.pop()); //["TARO"]（削除した要素を返す）
            for each (var _data: String in _array) {
                console.log(_data); //["ICHIRO"]→["JIRO"]
            }

        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

### 削除（最初）
```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ

            var _array: Array = ["TARO", "ICHIRO", "JIRO"];
            console.log(_array.shift()); //"TARO"（削除した要素を返す）
            for each (var _data: String in _array) {
                console.log(_data); //["ICHIRO"]→["JIRO"]
            }

        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

### 削除（○番目から□個）
```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ

            var _array: Array = ["00", "01", "02", "03", "04", "05"];
            var _result: Array = _array.splice(3, 2);
            for each (var _data: String in _result) {
                console.log(_data); //["03"]→["04"]
            }
            for each (var _data2: String in _array) {
                console.log(_data2); //["00"]→["01"]→["02"]→["05"]
            }

        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

### 削除（○番目から全て）
```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ

            var _array: Array = ["00", "01", "02", "03", "04", "05"];
            var _result: Array = _array.splice(3);
            for each (var _data: String in _result) {
                console.log(_data); //["03"]→["04"]→["05"]
            }
            for each (var _data2: String in _array) {
                console.log(_data2); //["00"]→["01"]→["02"]
            }

        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

### 抽出（○番目から□番目）
```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ

            var _array: Array = ["00", "01", "02", "03", "04", "05"];
            var _result: Array = _array.slice(2, 4);
            for each (var _data: String in _result) {
                console.log(_data); //["02"]→["03"]（4番目は含まず）
            }
            for each (var _data2: String in _array) {
                console.log(_data2); //["00"]→["01"]→["02"]→["03"]→["04"]→["05"]（元配列に変化なし）
            }

        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

### 抽出（○番目から全て）
```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ
        
            var _array: Array = ["00", "01", "02", "03", "04", "05"];
            var _result: Array = _array.slice(2);
            for each (var _data: String in _result) {
                console.log(_data); //["02"]→["03"]→["04"]→["05"]
            }
            for each (var _data2: String in _array) {
                console.log(_data2); //["00"]→["01"]→["02"]→["03"]→["04"]→["05"]（元配列に変化なし）
            }

        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

### 検索(前から）
* 第2引数番目から、後ろに向かって検索（最初に見つかったインデックス番号を返す）
```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ

            var _array: Array = ["A", "B", "C", "D", "E", "F", "D"];
            console.log(_array.indexOf("D", 0)); //[3]（見つからない場合「-1」を返す）

        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

### 検索（後ろから）
* 第2引数番目から、前に向かって検索（最初に見つかったインデックス番号を返す）
```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ

            var _array: Array = ["A", "B", "C", "D", "E", "F", "D"];
            console.log(_array.lastIndexOf("D")); //[6]（第2引数を省略すると _array.length と同じ）

        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

### 並べ替え（反転）
```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ

            var _array: Array = ["00", "01", "02", "03", "04", "05"];
            var _result: Array = _array.reverse();
            for each (var _data: String in _result) {
                console.log(_data); //["05"]→["04"]→["03"]→["02"]→["01"]→["00"]
            }
            for each (var _data2: String in _array) {
                console.log(_data2); //["05"]→["04"]→["03"]→["02"]→["01"]→["00"]（元配列も変更）
            }

        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

### 並べ替え（ソート）
* Array.sort() ←引数なしの場合
    * 正順（（0... 9）>（A ... Z）>（a...z）>（あ...ん）>（ア...ン）>漢字）
    * 全てを文字列に変換して比較（ "10" が   "3"より優先）

* Array.sort(Array.DESCENDING)
    * 逆順になる（漢字>（ン...ア）>（ん...あ）>（z...a）>（Z ... A）>（9...0））

* Array.sort(Array.NUMERIC)
    * 数値順でソート（３が10より優先）

* Array.sort(Array.CASEINSENSITIVE)
    * 大文字と小文字を区別しない

* Array.sort(Array.UNIQUESORT)
    * 同じ値を持つ複数の要素が見つかった場合ソートを中止

* Array.sort(Array.UNIQUESORT)
    * 同じ値を持つ複数の要素が見つかった場合ソートを中止

```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ

            var _array: Array = ["C", "02", "A", "01", "03", "B"];
            var _result: Array = _array.sort();
            for each (var _data: String in _result) {
                console.log(_data); //["01"]→["02"]→["03"]→["A"]→["B"]→["C"]
            }
            for each (var _data2: String in _array) {
                console.log(_data2); //["01"]→["02"]→["03"]→["A"]→["B"]→["C"]（元配列も変更）
            }

        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

### 結合
```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ

            var _array1: Array = ["A", "B", "C"];
            var _array2: Array = ["D", "E", "F"];
            var _array3: Array = _array1.concat(_array2);
            for each (var _data: String in _array3) {
                console.log(_data); //["A"]→["B"]→["C"]→["D"]→["E"]→["F"]
            }

        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

### 複製
```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ

            var _original: Array = ["A", "B", "C"];
            var _copy: Array = _original.concat(); //複製

            //実験（参照コピーではなく複製されているか否か）
            _original[0] = "あ";
            console.log(_original[0], _copy[0]); //["あ", "A"]（参照コピーではない）

        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

### 文字列→配列
```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ

            var _string: String = "A,B,C,D,E,F";
            var _array: Array = _string.split(","); //カンマ区切りで配列化
            console.log(_array); //[Array[6]]
            for each (var _data: String in _array) {
                console.log(_data); //["A"]→["B"]→["C"]→["D"]→["E"]→["F"]
            }

        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

### 全要素を取り出す
```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ

            var _array: Array = ["A", "B", "C", "D", "E", "F"];
            for each (var _data: String in _array) {
                console.log(_data); //["A"]→["B"]→["C"]→["D"]→["E"]→["F"]
            }

        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```
* for文、for...in文を使う方法もあり（参照「[for...in 文](#for...in文)」）

実行環境：Flex SDK 4.16、Flash Player 25、Ubuntu 16.04 LTS、Chromium 56  
作成者：MUBIROU  
作成日：2017年03月30日  


<a name="連想配列（Object）"></a>
# <b>連想配列（Object）</b>
* new Object() で生成後、プロパティを追加する方法もあり
```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ

            var _obj: Object = {
                name: "MUBIROU",
                age: 49,
                helloFunction: function(): String {
                    return "Hello! How are you?";
                }
            }

            console.log(_obj.name); //["MUBIROU"]
            console.log(_obj["name"]); //["MUBIROU"]（配列アクセスも可能）
            console.log(_obj.age); //[49]
            console.log(_obj.helloFunction()); //["Hello! How are you?"]

        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

実行環境：Flex SDK 4.16、Flash Player 25、Ubuntu 16.04 LTS、Chromium 56  
作成者：MUBIROU  
作成日：2017年03月30日  


<a name="this"></a>
# <b>this</b>

```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ

            //ドキュメントクラス（Main.as）のthis
            console.log(this.toString()); //["[object Main]"]

            var _myClass: MyClass = new MyClass();
            console.log(_myClass.hoge); //["プライベート変数"]

        }
    }
}

class MyClass {
    private var _hoge: String;

    public function MyClass() {
        console.log(this); //[Object]（MyClassクラスのインスタンス）
        this._hoge = "プライベート変数"; //thisは省略可能
    }

    public function get hoge(): String { //アクセサ（getter）
        return this._hoge; //thisは省略可能
    }
}


class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

実行環境：Flex SDK 4.16、Flash Player 25、Ubuntu 16.04 LTS、Chromium 56  
作成者：MUBIROU  
作成日：2017年03月30日  


<a name="文字列の操作"></a>
# <b>文字列の操作</b>

### 文字列の生成
```
var 変数1: String = new String("xxx"); //object型
var 変数2: String = "xxx"; //string型
```

### 文字列の長さを調べる
```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ

            var _string1: String = "ABCDE";
            var _string2: String = "あいうえお";
            console.log(_string1.length, _string2.length); //[5, 5]

        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

### 一部分を取得
```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ

            var _string: String = "0123456789";
            console.log(_string.substr(0, 1)); //["0"] ←0文字目（先頭）〜1文字取得
            console.log(_string.substr(-1, 1)); //["9"] ←後ろから1文字目〜1文字取得
            console.log(_string.substr(4)); //["456789"] ←4文字目（0から開始）〜全て取得
            console.log(_string.substr(4, 3)); //["456"] ←4文字目（0から開始）〜3文字取得

        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

### 置換
```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ

            var _string: String = "2017年3月30日";
            var _regExp: RegExp = new RegExp("2017", "g"); //第2引数を省略すると全てを置換（"g"と同等）
            console.log(_string.replace(_regExp, "平成29")); //["平成29年3月30日"]

        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

### 検索
```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ

            var _string: String = "ABCDEFG-ABCDEFG";
            var _count: Number = 0;
            while (_string.indexOf("CD", _count) != -1) { //見つからないと-1を返す
                var _num: Number = _string.indexOf("CD", _count);
                console.log(_num); //[2]→[10] ←"CD"が見つかった場所（0から開始）を返す
                _count = _num + 1;
            }

        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```
* 最後から検索する String.lastIndexOf() もあり

### 文字列→配列
```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ

            var _string: String = "A,B,C,D,E,F";
            var _array: Array = _string.split(","); //カンマ区切りで配列化
            console.log(_array); //[Array[6]]
            for each (var _data: String in _array) {
                console.log(_data); //["A"]→["B"]→["C"]→["D"]→["E"]→["F"]
            }

        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

実行環境：Flex SDK 4.16、Flash Player 25、Ubuntu 16.04 LTS、Chromium 56  
作成者：MUBIROU  
作成日：2017年03月30日  


<a name="正規表現"></a>
# <b>正規表現</b>

* ActionScript 3.0 には以下のサンプル以外にも多くの正規表現の機能が用意されています

### 検索＆置換
```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ

            var _string: String = "吉田松蔭,高杉晋作,久坂玄瑞,吉田稔麿,伊藤博文";
            var _regExp: RegExp = new RegExp("吉田", "g"); //第2引数を省略すると全てを置換（"g"と同等）
            /*
            "^○○$"のように「^（行頭マッチ）」「$（行末マッチ）」といったメタ文字の他、様々なパターン、例えば "[A-D]\d+" など…を使うことでより細かな制御が可能
            */
            if (_regExp.test(_string)) { //検索
                console.log('"吉田"は含まれています');
                var _result: String = _string.replace(_regExp, "よしだ"); //置換
                console.log(_result); //["よしだ松蔭,高杉晋作,久坂玄瑞,よしだ稔麿,伊藤博文"]
            } else {
                console.log('"吉田"は含まれていません');
            }

        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

### マッチした数
```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ

            var _string: String = "059371820400381295700347891205178900517093823";
            var _regExp: RegExp = new RegExp("00", "g"); //第2引数を省略すると全てを置換（"g"と同等）
            var _matchList: Array = _string.match(_regExp);
            console.log(_matchList); //[Array[3]]
            for each (var _data: String in _matchList) {
                console.log(_data); //["0"]→["0"]→["0"]
            }
            console.log(_matchList.length); //[3]（マッチした数）

        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

### 正規表現について…
* 文字パータンを表現するオブジェクト（RegExp クラス）のこと
* JavaScriptの正規表現は、ECMAScript 3 で標準化された
* String と RegExp クラスには、次のような正規表現用のメソッドが用意されている
    1. RegExp.exec()
    1. RegExp.test()
    1. String.search()
    1. String.match()
    1. String.replace()
    1. String.split()

実行環境：Flex SDK 4.16、Flash Player 25、Ubuntu 16.04 LTS、Chromium 56  
作成者：MUBIROU  
作成日：2017年03月30日  


<a name="抽象クラス"></a>
# <b>抽象クラス</b>

### 概要
* ActionScript には、abstract キーワードはない
* ActionScript では、継承と例外処理によって擬似的な抽象クラスを実現

### 構文
```
//（擬似）抽象クラスの定義
class Abstract○○ {
    public function 抽象メソッド名(引数①,引数②,...): 返り値の型 {
        console.log(new Error("サブクラスで実装して下さい").toString()); //例外処理
    }
}

//（擬似）抽象クラスの継承
class 派生クラス名 extends Abstract○○ {
    override public function 抽象メソッド名(引数①,引数②,...): 返り値の型 {
        //実際の処理はここに記述
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

### 例文
```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ
            //実行
            var _subClass: SubClass = new SubClass();
            _subClass.commonMethod(); //["AbstractClass.commonMethod()"]
            _subClass.eachMethod(); //["SubClass.eachMethod()"]
        }
    }
}

class AbstractClass { //（擬似）抽象クラスの定義
    public function commonMethod(): void { //共通のメソッド
        console.log("AbstractClass.commonMethod()");
    }
    public function eachMethod(): void { //抽象メソッド（実際の処理は記述しない）
        console.log(new Error("サブクラスで実装して下さい").toString()); //例外処理
    }
}

class SubClass extends AbstractClass { //（擬似）抽象クラスの継承
    override public function eachMethod(): void { //オーバーライドして実際の処理を記述
        console.log("SubClass.eachMethod()"); //実際の処理
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

実行環境：Flex SDK 4.16、Flash Player 25、Ubuntu 16.04 LTS、Chromium 56  
作成者：MUBIROU  
作成日：2017年03月30日  


<a name="superキーワード"></a>
# <b>super キーワード</b>

```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ
            //実行
            var _subClass: SubClass = new SubClass();
            //["SuperClass.constructor : from SubClass"]
            _subClass.methodSub();
            //["SuperClass.methodSuper : from SubClass"]
        }
    }
}

//スーパークラス
class SuperClass {
    public function SuperClass(_arg: String) { //コンストラクタ
        console.log("SuperClass.constructor : " + _arg);
    }
    public function methodSuper(_arg: String): void {
        console.log("SuperClass.methodSuper : " + _arg);
    }
}

//サブクラス
class SubClass extends SuperClass { //スーパークラスを継承
    public function SubClass() { //コンストラクタ
        //↓スーパークラスのコンストラクタの呼び出し（必須）
        super("from SubClass");
        //↑サブクラスのコンストラクタ内であれば冒頭でなくても可能
    }
    public function methodSub(): void {
        //↓スーパークラスのメソッドを呼び出すことが可能
        super.methodSuper("from SubClass");
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

実行環境：Flex SDK 4.16、Flash Player 25、Ubuntu 16.04 LTS、Chromium 56  
作成者：MUBIROU  
作成日：2017年03月30日  


<a name="オーバーライド"></a>
# <b>オーバーライド</b>

### 概要
* スーパークラスで定義したメソッドをサブクラスで再定義することをオーバーライドと呼ぶ
* スーパークラスのメソッドを呼び出したい場合は、super.メソッド名() とする
* （擬似）[抽象クラス](#抽象クラス)でもこの方法を活用

### 例文
```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ
            //実行
            var _subClass: SubClass = new SubClass();
            _subClass.myMethod(); //["SubClass.myMethod()"]
        }
    }
}

//スーパークラス
class SuperClass {
    //↓サブクラスでオーバライドするメソッド
    public function myMethod(): void {
        console.log("SuperClass.myMethod()");
    }
}

//サブクラス
class SubClass extends SuperClass { //スーパークラスを継承
    //↓スーパークラスにある同名のメソッドを再定義＝オーバーライド
    override public function myMethod(): void { //overrideが必須
        //super.myMethod(); //スーパークラス内の同名のメソッドを呼び出す場合
        console.log("SubClass.myMethod()");
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

実行環境：Flex SDK 4.16、Flash Player 25、Ubuntu 16.04 LTS、Chromium 56  
作成者：MUBIROU  
作成日：2017年03月30日  


<a name="カスタムイベント"></a>
# <b>カスタムイベント</b>

### 概要
ActionScript 3.0 に実装されている flash.events.dispatchEvent() や flash.events.Event は用途が限定されるため、ここでは汎用的な方法を紹介します

```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ
            //実行
            var _robot: Robot = new Robot();
            _robot.addEventListener("die", this.die_robot); //イベントリスナーの設定
            _robot.fight();
            _robot.fight();
            _robot.fight();
            _robot.fight(); //["GAME OVER"]
        }

        //リスナー関数
        private function die_robot(_arg: Robot): void {
            console.log(_arg); //[Object]（Robotクラスのインスタンス）
            console.log("GAME OVER");
        }
    }
}

class Robot { //イベントを設定するクラス
    private var _energy: Number;
    private var _dieHandler: Function;

    public function Robot() {
        _energy = 80;
    }

    public function addEventListener(_event: String, _function: Function): void {
        if (_event == "die") {
            _dieHandler = _function; //匿名関数を変数に格納
        } else {
            //該当のイベントが無い場合、実行時にErrorを発生（オプション）
            console.log(new Error(_event + "はサポートされていません").toString());
        }
    }

    public function fight(): void {
        _energy -= 20;
        if (_energy <= 0) {
            _dieHandler(this); //←"die"イベントの発生（リスナー関数の呼出し）
        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

実行環境：Flex SDK 4.16、Flash Player 25、Ubuntu 16.04 LTS、Chromium 56  
作成者：MUBIROU  
作成日：2017年03月30日  


<a name="数学関数（Math）"></a>
# <b>数学関数（Math）</b>

### Math.sin() : サイン（正弦）
```
//Main.as
package {
    import flash.display.*;
    import flash.events.Event; //必須

    public class Main extends Sprite {
        public function Main() { //コンストラクタ
            //実行
            console.log(Math.sin(0)); //[0]（0°）
            console.log(Math.sin(Math.PI / 2)); //[1]（90°）
            console.log(Math.sin(Math.PI)); //[1.2246467991473532e-16]（≒0）（180°）
            console.log(Math.sin(Math.PI * 3 / 2)); //[-1]（270°）
            console.log(Math.sin(Math.PI * 2)); //[-2.4492935982947064e-16]（≒0）（360°）
        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```
* 以下も同様の処理

### Math.cos() : コサイン（余弦）
```
console.log(Math.cos(0)); //[1]（0°）
console.log(Math.cos(Math.PI / 2)); //[6.123233995736766e-17]（≒0）（90°）
console.log(Math.cos(Math.PI)); //[-1]（180°）
console.log(Math.cos(Math.PI * 3 / 2)); //[-1.8369701987210297e-16]（≒0）（270°）
console.log(Math.cos(Math.PI * 2)); //[1] ←360°
```

### Math.atan2() : アークタンジェント2
```
//三角形の各辺が1:2:√3の場合に2:√3の間の角度は30°であることの検証
var _disX: Number = Math.sqrt(3); //√3のこと
var _disY: Number = 1;
console.log(Math.atan2(_disY, _disX)); //[0.5235987755982989]（ラジアン）
console.log(180 * Math.atan2(_disY, _disX) / Math.PI); //[30.000000000000004]（度）
```

### Math.PI : 円周率
```
console.log(Math.PI); //[3.141592653589793]
```

### Math.floor() : 切り捨て
```
console.log(Math.floor(1.001)); //[1]
console.log(Math.floor(1.999)); //[1]
```

### Math.ceil() : 切り上げ
```
console.log(Math.ceil(1.001)); //[2]
console.log(Math.ceil(1.999)); //[2]
```

### Math.round() : 四捨五入
```
console.log(Math.round(1.499)); //[1]
console.log(Math.round(1.500)); //[2]
```

### Math.abs() : 絶対値
```
console.log(Math.abs(100)); //[100]
console.log(Math.abs(-100)); //[100]
```

### Math.pow() : 累乗（○の□乗）
```
console.log(Math.pow(2, 0)); //[1]（2の0乗）
console.log(Math.pow(2, 8)); //[256]（2の8乗）
```

### Math.sqrt() : 平方根（√○）
```
console.log(Math.sqrt(2)); //[1.4142135623730951]（一夜一夜にひとみごろ）
console.log(Math.sqrt(3)); //[1.7320508075688772]（人並みに奢れや）
console.log(Math.sqrt(4)); //[2]
console.log(Math.sqrt(5)); //[2.23606797749979]（富士山麓オウム鳴く）
```

### Math.max() : 比較（最大値）
```
console.log(Math.max(5.01, -10)); //[5.01]（2つの数値の比較）
```

### Math.min() : 比較（最小値）
```
console.log(Math.min(5.01, -10)); //[-10]（2つの数値の比較）
```

実行環境：Flex SDK 4.16、Flash Player 25、Ubuntu 16.04 LTS、Chromium 56  
作成者：MUBIROU  
作成日：2017年03月30日  

<a name="乱数"></a>
# <b>乱数</b>

### Math.random()
* 0以上、1未満（0.9999…）の値を返す
* 現在時刻を元に random seed （乱数種）を生成
```
//Main.as
package {
    import flash.display.*;
    import flash.events.Event; //必須

    public class Main extends Sprite {
        public function Main() { //コンストラクタ
            //実行
            console.log(Math.random()); //0.13397585139675616
            console.log(Math.random()); //0.9903535518676447
            console.log(Math.random()); //0.006009885271453852
        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

### 整数の乱数
```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ
            //実験（1000万回繰返して精度を調べる）
            var _u5: int = 0, _u4: int = 0, _u3: int = 0;
            var _u2: int = 0, _u1: int = 0, _o0: int = 0;
            var _o1: int = 0, _o2: int = 0, _o3: int = 0;
            var _o4: int = 0, _o5: int = 0;

            for (var i: int = 0; i < 10000000; i++) {
                switch (this.randomInt(-5, 5)) {
                    case -5: _u5++; break;
                    case -4: _u4++; break;
                    case -3: _u3++; break;
                    case -2: _u2++; break;
                    case -1: _u1++; break;
                    case 0: _o0++; break;
                    case 1: _o1++; break;
                    case 2: _o2++; break;
                    case 3: _o3++; break;
                    case 4: _o4++; break;
                    case 5: _o5++; break;
                }
            }

            console.log(_u5, _u4, _u3, _u2, _u1, _o0, _o1, _o2, _o3, _o4, _o5);
            //[910200, 910019, 907640, 908999, 908764, 909585, 908325, 909711, 909847, 908968, 907942]
        }

        //整数の乱数を返すカスタム関数
        private function randomInt (_min: int, _max: int): int {
            return Math.floor(Math.random() * (_max - _min + 1)) + _min;
        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

実行環境：Flex SDK 4.16、Flash Player 25、Ubuntu 16.04 LTS、Chromium 56  
作成者：MUBIROU  
作成日：2017年03月30日  


<a name="日時情報"></a>
# <b>日時情報</b>

### 書式
```
var xxx: Date = new Date();
xxx.getFullYear(); //年（2015等）
xxx.getMonth(); //月（0〜11）
xxx.getDate(); //日（1〜31）
xxx.getDay(); //曜日（0=日曜〜5=金曜）
xxx.getHours(); //時（0〜23）
xxx.getMinutes(); //分（0〜59）
xxx.getSeconds(); //秒（0〜59）
xxx.getMilliseconds(); //ミリ秒（0〜999）
```

### 例文
```
//Main.as
package {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ
            //実行
            var _date: Date = new Date();
            console.log(_date); //[Thu Mar 30 2017 15:19:01 GMT+0900 (JST)]
            console.log(_date.getFullYear()); //[2017]
            console.log(_date.getMonth()); //[2]（3月）
            console.log(_date.getDate()); //[30]
            console.log(_date.getDay()); //[4]（木曜日）
            console.log(_date.getHours()); //[15]
            console.log(_date.getMinutes()); //[19]
            console.log(_date.getSeconds()); //[1]
            console.log(_date.getMilliseconds()); //[627]
            //"hh:mm:ss"で現在の時間を表示する方法
            var _h: * = (_date.getHours() < 10) ? "0" + _date.getHours() : _date.getHours();
            var _m: * = (_date.getMinutes() < 10) ? "0" + _date.getMinutes() : _date.getMinutes();
            var _s: * = (_date.getSeconds() < 10) ? "0" + _date.getSeconds() : _date.getSeconds();
            console.log(_h + ":" + _m + ":" + _s); //["15:19:01"]
        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

実行環境：Flex SDK 4.16、Flash Player 25、Ubuntu 16.04 LTS、Chromium 56  
作成者：MUBIROU  
作成日：2017年03月30日  


<a name="タイマー"></a>
# <b>タイマー</b>

```
//Main.as
package  {
    import flash.display.*;
    import flash.utils.Timer; //必須
    import flash.events.TimerEvent; //必須

    public class Main extends Sprite {
        public function Main() { //コンストラクタ
            //1秒間隔で繰返す場合
            var _timer: Timer = new Timer(1000, 5); //第2引数が0の場合は無限
            _timer.addEventListener(TimerEvent.TIMER, timer_timer);
            _timer.start();
        }
        private function timer_timer(evt: TimerEvent): void {
            console.log("繰返したい処理");
            console.log(evt.target.currentCount); //繰返した回数
            //evt.target.stop(); //1回で停止したい場合
        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

実行環境：Flex SDK 4.16、Flash Player 25、Ubuntu 16.04 LTS、Chromium 56  
作成者：MUBIROU  
作成日：2017年03月30日  


<a name="処理速度計測"></a>
# <b>処理速度計測</b>

### Date クラスを使う方法
```
//Main.as
package  {
    import flash.display.*;
    public class Main extends Sprite {
        public function Main() { //コンストラクタ
            //実行
            var _start: uint = new Date().getTime(); //1970年1月1日0:00:00からの経過時間（ミリ秒）
            for (var _i: uint = 0; _i < 1000000000; _i++) { //10億回繰り返し
                //速度測定したい処理
            }
            var _end:uint = new Date().getTime();
            console.log(_end - _start); //[2240]ミリ秒
        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

### getTimer() を使う方法
```
//Main.as
package  {
    import flash.display.*;
    import flash.utils.getTimer; //必須

    public class Main extends Sprite {
        public function Main() { //コンストラクタ
            //実行
            var _start: uint = getTimer();
            for (var i: uint = 0; i < 1000000000; i++) { //10億回繰り返し
                //速度測定したい処理
            }
            console.log(getTimer() - _start); //[2099]ミリ秒
        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

実行環境：Flex SDK 4.16、Flash Player 25、Ubuntu 16.04 LTS、Chromium 56  
作成者：MUBIROU  
作成日：2017年03月30日  


<a name="外部テキストの読み込み"></a>
# <b>外部テキストの読み込み</b>

### テキストファイルの用意（準備）
* [Web サーバ](http://bit.ly/2mbzR4D)を稼働し、ルートディレクトリ等に sample.txt （UTF-8）として保存
```
あいうえお
かきくけこ
さしすせそ
```

### テキストの読み込み
```
//Main.as
package  {
    import flash.display.*;
    import flash.net.*; //必須
    import flash.events.Event; //必須

    public class Main extends Sprite {
        public function Main() { //コンストラクタ
            //実行
            var _urlLoader: URLLoader =  new URLLoader();
            _urlLoader.addEventListener(Event.COMPLETE, complete_urlLoader);
            _urlLoader.load(new URLRequest("sample.txt"));
        }
        //リスナー関数
        private function complete_urlLoader(e: Event): void {
            console.log(e.target.data); //["あいうえお↵かきくけこ↵さしすせそ"]
        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

実行環境：Flex SDK 4.16、Flash Player 25、Ubuntu 16.04 LTS、Chromium 56  
作成者：MUBIROU  
作成日：2017年03月30日  