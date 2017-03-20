<b>この項目は書きかけの項目です。</b>

# ECMAScript 6 基礎文法

* Hello,world! （[Linux](https://github.com/TakashiNishimura/HelloWorld/blob/master/ECMAScript6/ECMAScript6_linux.md) / [macOS](https://github.com/TakashiNishimura/HelloWorld/blob/master/ECMAScript6/ECMAScript6_mac.md) / [Windows](https://github.com/TakashiNishimura/HelloWorld/blob/master/ECMAScript6/ECMAScript6_win.md)）
* [データ型](#データ型)
* [データ型の操作](#データ型の操作)
* [クラス](#クラス)
* [スーパークラスとサブクラス](#スーパークラスとサブクラス)
* [名前空間](#名前空間)
* [継承と委譲](#継承と委譲)
* 変数とスコープ
* アクセサ （getter / setter）
* 演算子
* 定数
* メソッド
* 匿名関数
* アロー関数
* クラス定数･変数･メソッド
* if文
* 三項演算子
* switch文
* for文
* for...in文
* for...of文
* while文
* 配列（Array）
* 配列（Set）
* 連想配列（Object）
* 連想配列（Map）
* this
* 文字列の操作
* 正規表現
* 抽象クラス
* superキーワード
* オーバーライド
* カスタムイベント
* 数学関数（Math）
* 乱数
* 日時情報
* タイマー
* 処理速度計測
* 外部テキストの読み込み


<a name="データ型"></a>
# データ型

```
<script>

//①boolean（論理型）
var _boolean = true;
console.log(_boolean, typeof _boolean); //true, "boolean"


//②number（整数･浮動小数点数） ※NaNも"number"型
var _number = 9007199254740998;
//-9007199254740998〜9007199254740998（約±9000兆）まで扱える
console.log(_number, typeof _number); //9007199254740998, "number"

var _number2 = 3.14159265358979323846264338327;
console.log(_number2, typeof _number2); //3.141592653589793, "number"


//③string（文字列）
var _string = "いろは"; //シングルまたはダブルクォーテーションで囲む
console.log(_string, typeof _string); //"いろは", "string"


//④object（全てのオブジェクトのベース）
var _boolean2 = new Boolean(true);
console.log(typeof _boolean2); //"object"（"boolean"ではない）

var _number3 = new Number(1);
console.log(typeof _number3); //"object"（"number"ではない）

var _string2 = new String("1");
console.log(typeof _string2); //"object"（"string"ではない）

var _array = ["A","B","C"]; //配列（Array）
console.log(typeof _array); //"object"

var _object = {name:"takashi", age:49}; //連想配列
console.log(typeof _object); //"object"

var _hoge2 = null; //null（データ不在）
console.log(_hoge2, typeof _hoge2); //null, "object"

class MyClass {} //クラス（前方宣言が必要）
var _myClass = new MyClass();
console.log(typeof _myClass); //"object"


//⑤undefined（未初期化変数）
var _hoge; //変数宣言したのみで値が設定されていない場合
console.log(_hoge, typeof _hoge); //undefined, "undefined"


//⑥function（関数）
var _function = function() {}; //匿名関数
console.log(typeof _function); //"function"

var _function2 = () => {}; //アロー関数
console.log(typeof _function2); //"function"


//⑦symbol（シンボル）
var _symbol = Symbol();
console.log(typeof _symbol); //"symbol"

</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2017年03月17日  


<a name="データ型の操作"></a>
# データ型の操作

### データ型を調べる①
（ typeof 演算子 ＝ データ型を文字列で返す）

```
<script>

//①boolean（論理型）
console.log(typeof true); //"boolean"

//②number（整数･浮動小数点数）
console.log(typeof 1); //"number"
console.log(typeof 1.0); //"number"

//③string（文字列）
console.log(typeof "1"); //"string"

//④object（全てのオブジェクトのベース）
console.log(typeof {name:"takashi", age:49}); //"object"

//⑤undefined（未初期化変数）
console.log(typeof hoge_); //"undefined"

//⑥function（関数）
console.log(typeof function() {}); //"function"

//⑦symbol
console.log(typeof Symbol()); //"symbol"

</script>
```

### データ型を調べる②
（ instanceof 演算子 ＝ データ型が一致するか boolean 型で返す）

```
<script>

//①boolean（論理型）
console.log(true instanceof Boolean); //false（要注意）
console.log(new Boolean(true) instanceof Boolean); //true

//②number（整数･浮動小数点数）
console.log(1 instanceof Number); //false（要注意）
console.log(new Number(1) instanceof Number); //true

//③string（文字列）
console.log("あ" instanceof String); //false（要注意）
console.log(new String("あ") instanceof String); //true

//④object（全てのオブジェクトのベース）
console.log({name:"takashi"} instanceof Object); //true
console.log(new Object() instanceof Object); //true

//⑤function（関数）
console.log(function() {} instanceof Function); //true

</script>
```

### データ型のキャスト（変換）
```
<script>

//①数値→boolean型
var _boolean = Boolean(1);
console.log(_boolean, typeof _boolean); //true, "boolean"

//②boolean型→number型
var _number1 = Number(true);
console.log(_number1, typeof _number1); //1（falseの場合は0）, "number"

//③文字列→number型
var _number2 = Number("3.14");
console.log(_number2, typeof _number2); //3.14, "number"

var _number3 = parseInt("3.14"); //小数点以下を切り捨てて整数化
console.log(_number3, typeof _number3); //3, "number"

var _number4 = parseFloat("3.14です。"); //数字以外を含む値
console.log(_number4, typeof _number4); //3.14, "number"

//④数値→string型
var _string1 = String(100); //(100).toString() でも同じ
console.log(_string1, typeof _string1); //"100", "string"

//⑤配列→string型
var _string2 = String(["takashi", 49]);
console.log(_string2, typeof _string2); //"takashi,49", "string"

</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2017年03月17日  

<a name="クラス"></a>
# クラス

```
<script>

//長方形クラス（前方宣言が必要）
class Rectangle {
    //コンストラクタ
    constructor(_width=640, _height=480) {
        //外からもアクセス可能だがアクセスしないようにする
        this.__width = _width;
        this.__height = _height;
    }

    //アクセサ（getter/setter）
    get width() {
        return this.__width;
    }
    set width(_newValue) {
        this.__width = _newValue;
    }

    get height() {
        return this.__height;
    }
    set height(_newValue) {
        this.__height = _newValue;
    }

    //面積を計算して値を返す
    getArea() {
        return this.__width * this.__height;
    }
}

//①インスタンスの生成
var _rectangle = new Rectangle();

//②プロパティの確認と変更
console.log(_rectangle.width, _rectangle.height); //640, 480
_rectangle.width = 1920;
_rectangle.height = 1080;
console.log(_rectangle.width, _rectangle.height); //1920, 1080

//③メソッドの実行
console.log(_rectangle.getArea()); //2073600

</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2017年03月17日  


<a name="スーパークラスとサブクラス"></a>
# スーパークラスとサブクラス

```
<script>

/****************************************************
スーパークラス
****************************************************/
class SuperClass {
    //コンストラクタ
    constructor() {
        //①プロパティの定義
        this.__pSuperClass = "スーパークラスのプロパティ";
    }

    //②アクセサの定義（setterは省略）
    get pSuperClass() {
        return this.__pSuperClass;
    }

    //③メソッドの定義
    mSuperClass() {
        return "スーパークラスのメソッド";
    }
}

/****************************************************
サブクラスＡ（スーパークラスを継承／多重継承は不可）
****************************************************/
class SubClassA extends SuperClass {
    //コンストラクタ
    constructor() {
        super(); //コンストラクタの冒頭でスーパークラスのコンストラクタを呼出す（必須）
        //①プロパティの定義
        this.__pSubClassA = "サブクラスＡのプロパティ";
    }

    //②アクセサの定義（setterは省略）
    get pSubClassA() {
        return this.__pSubClassA;
    }

    //③メソッドの定義
    mSubClassA() {
        return "サブクラスＡのメソッド";
    }
}

/****************************************************
サブクラスＢ（スーパークラスを継承／多重継承は不可）
****************************************************/
class SubClassB extends SuperClass {
    //コンストラクタ
    constructor() {
        super(); //コンストラクタの冒頭でスーパークラスのコンストラクタを呼出す（必須）
        //①プロパティの定義
        this.__pSubClassB = "サブクラスＢのプロパティ";
    }

    //②アクセサの定義（setterは省略）
    get pSubClassB() {
        return this.__pSubClassB;
    }

    //③メソッドの定義
    mSubClassB() {
        return "サブクラスＢのメソッド";
    }
}

/****************************************************
実行
****************************************************/
//サブクラスＡのインスタンス
var _subclassA = new SubClassA();
console.log(_subclassA.pSuperClass); //"スーパークラスのプロパティ"
console.log(_subclassA.pSubClassA); //"サブクラスＡのプロパティ"
console.log(_subclassA.mSuperClass()); //"スーパークラスのメソッド"
console.log(_subclassA.mSubClassA()); //"サブクラスＡのメソッド"

//サブクラスＢのインスタンス
var _subclassB = new SubClassB();
console.log(_subclassB.pSuperClass); //"スーパークラスのプロパティ"
console.log(_subclassB.pSubClassB); //"サブクラスＢのプロパティ"
console.log(_subclassB.mSuperClass()); //"スーパークラスのメソッド"
console.log(_subclassB.mSubClassB()); //"サブクラスＢのメソッド"

</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2017年03月17日  


<a name="名前空間"></a>
# 名前空間

* ES2015+からサポートされた import と export はまだブラウザで利用できません
* サンプルの方法は力技的ですが機能としては充分です

#### 外部ファイル（ myLibrary.js ）
```
//名前空間を省略可能にするために（オプション）
if (myLibrary != window) {
    var myLibrary = {}; //namescape（省略をしない前提であればconstにします）
}

/**************************
myLibrary.SuperClassクラス
**************************/
myLibrary.SuperClass =
class SuperClass {
    constructor() {
        this.__myProperty = undefined;
    }
    get myProperty() {
        return this.__myProperty;
    }
    set myProperty(_newValue) {
        this.__myProperty = _newValue;
    }
};

/**************************
myLibrary.MyClassクラス
**************************/
myLibrary.MyClass =
class MyClass extends myLibrary.SuperClass { //継承も可能
    constructor() {
        super();
        console.log("new myLibrary.MyClass");
    }
    MyClassMethod() {
        console.log("MyClass.MyClassMethod()");
    }
};
```

#### xxx.html
```
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--script>var myLibrary = window;</script-->
<script src="myLibrary.js"></script>
<script>

var _myClass = new myLibrary.MyClass(); //"new myLibrary.MyClass"
_myClass.MyClassMethod(); //"MyClass.MyClassMethod()"
_myClass.myProperty = "hoge";
console.log(_myClass.myProperty); //"hoge"

//Bitmapクラス（名前空間を省略するとコンフリクトを起こす）
class MyClass {
    constructor() {
        console.log("コンフリクトを起こさない!");
    }
}
new MyClass(); //"コンフリクトを起こさない!"

</script>
</head>
</html>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2017年03月17日  


<a name="継承と委譲"></a>
# 継承と委譲

### 概要

* GoF デザインパターンの [Adapter パターン](http://bit.ly/2naab8x)で利用される。
* 継承の場合は <b>extends クラス名</b> を使い、委譲の場合は <b>new クラス名()</b> を使ってオブジェクトを生成し、他のクラスの機能を利用する。

### 継承

```
<script>
class ClassA {
  myMethod() {
    console.log("ClassA.myMethod");
  }
}

class ClassB extends ClassA { //ClassAを継承
}

var _classB = new ClassB();
_classB.myMethod();

</script>
```

### 委譲

```
<script>

class ClassA {
  myMethod() {
    console.log("ClassA.myMethod");
  }
}

class ClassB {
  constructor() { //コンストラクタ
    this.__classA = new ClassA(); //コンストラクタ内でオブジェクトを生成
  }
  myMethod() {
    this.__classA.myMethod(); //ClassAのmyMethod()を実行
  }
}

var _classB = new ClassB();
_classB.myMethod();

</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2017年03月19日


# 変数とスコープ

#### 変数の種類

1. グローバル変数…プログラム全体からアクセス可能
1. 擬似プライベート変数…単なるパブリック変数（アクセサを利用すべき）
1. ローカル変数…関数またはメソッド内でのみアクセス可能
1. ブロック変数…ブロック{}内でのみアクセス可能

#### グローバル変数（＝Windowオブジェクトのプロパティ）

```
//xxx.js
//================================================================
//グローバル変数定義（関数の外部で定義するとグローバル変数扱い）
//================================================================
var _global = "グローバル変数"; //varは省略可
//this._global = "グローバル変数"; //上記と同じ意味
//window._global = "グローバル変数"; //上記と同じ意味

//==================================
//関数内でのグローバル変数の扱い
//==================================
function myFunction() {
  console.log(_global); //"グローバル変数"
  console.log(this._global); //"グローバル変数"
  console.log(window._global); //"グローバル変数"
}
myFunction();

//====================================
//クラス内でのグローバル変数の扱い
//====================================
class MyClass {
  constructor() { //コンストラクタ
    console.log(_global); //"グローバル変数"
    console.log(this._global); //undefined（thisはMyClassのインスタンスの為）
    console.log(window._global); //"グローバル変数"
  }
}
new MyClass();
```

#### 擬似プライベート変数（＝実は単なるパブリック変数ですが、アクセサを利用しましょう!!）

```
//○○.js
class MyClass {
constructor() { //コンストラクタ
//擬似プライベート変数の定義
this.__propA = "いろは"; //←…変数名は__○○等にするなど工夫する
 	}

get propA() { //アクセサ（getter）
	return this.__propA;
}

set propA(newValue) { //アクセサ（setter）
	this.__propA = newValue;
}
}

var myClass_ = new MyClass();

//良い例（アクセサを使ってプロパティにアクセスする）
console.log(myClass_.propA); //"いろは" ←…getアクセサによる値の取得
myClass_.propA = "ABC"; //←…setアクセサによる値の変更
console.log(myClass_.propA); //"ABC"

//悪い例（インスタンスのプロパティに外部から直接アクセスしてはいけない）
myClass_.__propA = "あいう"; //←…外部から直接変更できてしまう
console.log(myClass_.__propA); //"あいう"
```

◆ローカル変数（関数またはメソッド内でのみアクセス可能）
【関数内で定義した場合】
//○○.js
function myFunction1() {
//ローカル変数定義
var _local = "ローカル変数"; //←…関数内でのみ利用可能（varは省略不可）
console.log(_local); //"ローカル変数"
}

function myFunction2() {
//console.log(_local); //Error（ほかの関数からはアクセス不可）
}

myFunction1();
myFunction2();
//console.log(_local); //Error（関数外からはアクセス不可）

【メソッド内で定義した場合】
//○○.js
class MyClass {
myMethod1() {
var _local = "ローカル変数"; //←メソッド内でのみ利用可能（varは省略不可）
console.log(_local); //"ローカル変数"
}
myMethod2() {
//console.log(_local); //Error（他のメソッドからはアクセス不可）
}
}
var myClass_ = new MyClass();
myClass_.myMethod1();
myClass_.myMethod2();

【for文内で定義した場合】
//○○.js
for (var i=0; i<10; i++) {
  console.log(i); //0,1,2,...,8,9
}
console.log(i); //10 ←…for文の外でもまだ有効

◆ブロック変数（ブロック{}内でのみ有効）
【for文内で定義した場合】
//○○.js
for (let i=0; i<10; i++) {
  console.log(i); //0,1,2,...,8,9
}
console.log(i); //Error（ブロック外からはアクセス不可）

【if文内で定義した場合】
//○○.js
if (true) {
let _block = "ブロック変数";
console.log(_block); //"ブロック変数"
}
console.log(block_); //Error（ブロック外からはアクセス不可）

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2017年03月20日



#1-9 アクセサ（getter/setter）
Ubuntu 16.04.1 LTS、Chromium 52.0.XX（ECMAScript 2015に97％対応）、VSCode 1.5.2対応

◆概要
ES6は、TypeScriptと違いprivate変数を定義することができません。そこでパブリック変数を、Python風に__○○と命名してプライベート変数扱いにします。実際は単なるパブリック変数ですので外部からアクセスできてしまいますが、必ずアクセサを使ってアクセスするようにします。

◆読書き可能なプロパティ
//○○.js
class Nishimura {
  constructor(age) { //コンストラクタ
    this.__age = age;
  }
  //アクセサ（getter/setter）
  get age() { return this.__age; }
  set age(newValue) { this.__age = newValue; }
}

var nishimura_ = new Nishimura(49);
console.log(nishimura_.age); //49
nishimura_.age = 50; //←…変更が可能
console.log(nishimura_.age); //50

◆読取り専用のプロパティ
//○○.js
class Nishimura {
  constructor(age) { //コンストラクタ
    this.__age = age;
  }
  //アクセサ（getter/setter）
  get age() { return this.__age; }
  set age(newValue) { throw new Error("値の変更はできません"); }
}

var nishimura_ = new Nishimura(49);
console.log(nishimura_.age); //49
nishimura_.age = 50; //Error:値の変更はできません

作成日：2016年9月16日（金）
#1-10 演算子
Ubuntu 16.04.1 LTS、Chromium 52.0.XX（ECMAScript 2015に97％対応）、VSCode 1.5.2対応

//算術演算子（複合代入演算子+=,-=,*=,/=,%=などあり）
console.log(3 + 2); //5 (可算)
console.log(5 - 8); //-3 (減算)
console.log(3 * 4); //12 (乗算)
console.log(1 + 2 * 3 - 4 / 2); //5 (複雑な計算)
console.log(63 % 60); //3 (余剰)
console.log(8 / 3); //2.6666666666666665（小数点第16位まで）（除算)

//後ろに付けるインクリメント（デクリメント）
var huga_ = 0;
var piyo_ = huga_++; //加算する前のhuga_の値を返す （デクリメントの場合 huga_--）
console.log(huga_); //1（デクリメントの場合-1）
console.log(piyo_); //0（デクリメントの場合0）

//前に付けるインクリメント（デクリメント）
var huga_ = piyo_ = 0;
var piyo_ = ++huga_; //加算後のhuga_の値を返す（デクリメントの場合 --huga_）
console.log(huga_); //1（デクリメントの場合-1）
console.log(piyo_); //1（デクリメントの場合-1）

//その他の演算子
console.log(true && true); //true（論理積）
console.log(true || false); //true（論理和）
console.log(! true); //false（否定）

console.log(2 < 3); //true（比較/未満）
console.log(2 <= 2); //true（比較/以下）
console.log(1 == 1.0); //true（等号）
console.log(1 != 1.0); //false（不等号）

console.log(3 & 1); //1（ビット積）
console.log(3 | 1); //3（ビット和）
console.log(3 ^ 1); //2（排他的ビット和）
console.log(2 << 7); //256（ビット･シフト）
console.log(~3); //-4（ビット反転）

作成日：2016年9月16日（金）
#1-11 定数
Ubuntu 16.04.1 LTS、Chromium 52.0.XX（ECMAScript 2015に97％対応）、VSCode 1.5.2対応

◆概要
const（ES6の新機能）は「クラス外」で定数を扱う場合に利用できます。
constを「クラス内」で利用した場合、単なる「変更不可のローカル変数」扱いとなり、用途は非常に限られます（「const this.定数名」という記述は不可）。
クラス定数を実現するためには、static（ES6ではメソッドに対してのみ有効）とgetアクセサを利用します。setアクセサには、値を変更しようとした際にエラーが発生するように記述します。

◆通常の定数
【構文】
const 定数名 = 値; //定数名は慣例的に大文字英字（必要に応じて_で繋げる）

【例文】
//○○.js
const MY_NAME = "TAKASHI NISHIMURA";
console.log(MY_NAME); //"TAKASHI NISHIMURA"
MY_NAME = "TOHRU NISHIMURa"; //Error（変更不可!!）
※クラス内でconstを利用すると「変更不可のローカル変数」になるようです…（要調査）。

◆クラス定数（静的定数）←…力技デス
//○○.js
class MyMath {
    constructor() {
        //↓「変更不可のローカル変数」となりクラス定数として利用できない…
        //const PI = 3.141592653589793; //←…「const this.定数名」という記述は不可
    }
    static get PI() {
        return 3.141592653589793;
    }
    static set PI(newValue) {
        throw new Error("値の変更はできません");
    }
}

console.log(MyMath.PI); //3.141592653589793
//MyMath.PI = 3.14; //Error:値の変更はできません

作成日：2016年9月16日（金）
#1-12 メソッド
Ubuntu 16.04.1 LTS、Chromium 52.0.XX（ECMAScript 2015に97％対応）、VSCode 1.5.2対応

//========================================================================================
//パブリックメソッド（例：○〜○までの値を足した合計を調べます）
//アクセス修飾子が存在しないため、メソッドは全てパブリックメソッド扱いになります。
//========================================================================================
//○○.js
class MyClass {
tashizan(_start, _end) {
	var _result = 0; //ローカル変数（関数内のみ有効）
	for (let _i=_start; _i<=_end; _i++) { //ブロック変数（ブロック{}内のみ有効）
		_result += _i;
	}
	return _result;
}
}

var myClass_ = new MyClass();
console.log(myClass_.tashizan(1,10)); //55
console.log(myClass_.tashizan(1,100)); //5050

//========================================================================================
//擬似プライベートメソッド ←…実際は単なるパブリックメソッド
//アクセス修飾子が存在しないため、__メソッド名() と命名（Python風）してf外からアクセスしないようにします。
//========================================================================================
//○○.js
class Omikuji {
constructor() { //コンストラクタ
var _resultList = ["大吉","吉","中吉","小吉","凶"];
console.log(_resultList[this.__randomInt(0,4)]);
}

__randomInt(_min, _max) { //（擬似）プライベートメソッド
	var _tmp = _max - _min + 1;
	return Math.floor(Math.random() * _tmp) + _min;
}
}

new Omikuji(); //大吉、吉、中吉、小吉、凶のいずれか

//========================================================================================
//コンストラクタ
//========================================================================================
//○○.js
class Point {
//コンストラクタ
constructor(_x=0, _y=0) {
	//（擬似）プライベート変数の定義（初期化）
	this.__x = _x;
	this.__y = _y;
}

//アクセサ（getter）
get x() { return this.__x; }
get y() { return this.__y; }

//アクセサ（setter）
set x(newValue) { this.__x = newValue; }
set y(newValue) { this.__y = newValue; }
}

var point_ = new Point(100,150); //ここでコンストラクタを呼び出す
console.log(point_.x); //100
console.log(point_.y); //150

//========================================================================================
//静的メソッド（クラスメソッド）
//インスタンス化せずにメソッドを利用することが可能です。
//========================================================================================
//○○.js
class MyMath {
//静的メソッド（static メソッド名()）
static pow(arg1, arg2) {
	if (arg2 == 0) { return 1; } //0乗対策
	var _result = arg1;
	for (let _i=1; _i<arg2; _i++) {
		_result = _result * arg1;
	}
	return _result;
}
}

console.log(MyMath.pow(2,0)); //1（2の0乗）
console.log(MyMath.pow(2,1)); //2（2の1乗）
console.log(MyMath.pow(2,8)); //256（2の8乗）

//========================================================================================
//デフォルト値付き引数（引数は省略可能。オプション引数）
//========================================================================================
//○○.js
class MyClass {
    constructor() {
        this.__point = 0; //擬似プライベート変数の定義（初期化）
    }

addPoint(arg=1) { //初期値を1とした場合
	this.__point += arg;
	console.log(this.__point);
}
}

var myClass_ = new MyClass();
myClass_.addPoint(); //1
myClass_.addPoint(10); //11

//========================================================================================
//可変長引数（引数を固定の数ではなく任意の数にすることが可能）
//メソッド名(引数, ...可変長引数) のように併用も可能。
//========================================================================================
//○○.js
class MyClass {
sum(...args) { //...引数名 で可変長引数
	for (let tmp in args) {
		console.log(args[tmp]);
	}
}
}

var myClass_ = new MyClass();
myClass_.sum(1,2); //1→2
myClass_.sum(1,2,3,4,5); //1→2→3→4→5

作成日：2016年9月20日（火）
#1-13 匿名関数
Ubuntu 16.04.1 LTS、Chromium 52.0.XX（ECMAScript 2015に97％対応）、VSCode 1.5.2対応
※アロー関数（新機能）を従来の匿名式に置き換えたバージョンです（波線の部分だけ変更）

//○○.js
class Hello {
	//コンストラクタ
	constructor() {
this.__american = function(_name) { //匿名関数①
	console.log(_name + "," + "Hello!");
}

this.__japanese = function(_name) { //匿名関数②
	console.log(_name + "、" + "こんにちは!");
}

this.__chinese = function(_name) { //匿名関数③
	console.log(_name + "," + "你好!");
}

		//パブリック変数に匿名関数を代入（匿名関数は前方宣言が必要）
		this.hello = this.__american;
	}

	change(_language) {
		switch(_language) {
			case "american": this.hello = this.__american; break; //匿名関数の入替え
			case "japanese": this.hello = this.__japanese; break; //匿名関数の入替え
			case "chinese": this.hello = this.__chinese; break; //匿名関数の入替え
		}
	}
}

var hello_ = new Hello();
hello_.hello("Takashi"); //"Takashi,Hello!"
hello_.change("japanese");
hello_.hello("隆"); //"隆、こんにちは!"
hello_.change("chinese");
hello_.hello("隆"); //"隆, 你好!"

作成日：2016年9月21日（水）
#1-14 アロー関数
Ubuntu 16.04.1 LTS、Chromium 52.0.XX（ECMAScript 2015に97％対応）、VSCode 1.5.2対応
※匿名関数をラムダ式（新機能）に置き換えたバージョンです（波線の部分だけ変更）

//○○.js
class Hello {
	//コンストラクタ
	constructor() {
this.__american = (_name) => { //匿名関数①
	console.log(_name + "," + "Hello!");
}

this.__japanese = (_name) => { //匿名関数②
	console.log(_name + "、" + "こんにちは!");
}

this.__chinese = (_name) => { //匿名関数③
	console.log(_name + "," + "你好!");
}

		//パブリック変数に匿名関数を代入（匿名関数は前方宣言が必要）
		this.hello = this.__american;
	}

	change(_language) {
		switch(_language) {
			case "american": this.hello = this.__american; break; //匿名関数の入替え
			case "japanese": this.hello = this.__japanese; break; //匿名関数の入替え
			case "chinese": this.hello = this.__chinese; break; //匿名関数の入替え
		}
	}
}

var hello_ = new Hello();
hello_.hello("Takashi"); //"Takashi,Hello!"
hello_.change("japanese");
hello_.hello("隆"); //"隆、こんにちは!"
hello_.change("chinese");
hello_.hello("隆"); //"隆, 你好!"

作成日：2016年9月21日（水）
#1-15 クラス定数･変数･メソッド
Ubuntu 16.04.1 LTS、Chromium 52.0.XX（ECMAScript 2015に97％対応）、VSCode 1.5.2対応
※クラス定数･クラス変数･クラスメソッドは、クラスをインスタンス化せずにアクセス可能です。

//○○.js
class MyMath {
	//①クラス定数（静的定数）の定義（静的定数）←…力技
static get PI() {
	return 3.141592653589793;
}
static set PI(newValue) {
	throw new Error("値の変更はできません");
}

	//③静的メソッド（静的メソッド）の定義（static メソッド名()）
static pow(arg1, arg2) {
	if (arg2 == 0) { return 1; } //0乗対策
	var _result = arg1;
	for (let _i=1; _i<arg2; _i++) {
		_result = _result * arg1;
	}
	return _result;
}
}

//①クラス定数の参照
console.log(MyMath.PI); //3.141592653589793
//MyMath.PI = 3.14; //Error:値の変更はできません

//②クラス変数の参照および変更
console.log(MyMath.lastUpdate); //undefined
MyMath.lastUpdate = "2016-09-21"; //←…②クラス変数（静的変数）の定義
console.log(MyMath.lastUpdate); //"2016-09-21"
MyMath.lastUpdate = "2016-09-22"; //←…変更可能
console.log(MyMath.lastUpdate); //"2016-09-22"

//③静的メソッドの実行
console.log(MyMath.pow(2, 0)); //1
console.log(MyMath.pow(2, 8)); //256

作成日：2016年9月21日（水）
#1-16 if文
Ubuntu 16.04.1 LTS、Chromium 52.0.XX（ECMAScript 2015に97％対応）、VSCode 1.5.2対応

◆基本例文（trueと評価される可能性が高い順に並べるとif文を早く抜け出せる可能性が高い）
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <script>
            var age_ = 48;
            if (age_ <= 20) {
                console.log("20歳以下");
            } else if (age_ <= 40) {
                console.log("21〜40歳");
            } else if (age_ <= 60) {
                console.log("41〜60歳"); //これが出力される
            } else {
                console.log("61歳以上");
            }
        </script>
    </head>
</html>

◆論理積（AND）（2つの条件がtrueの場合）
1. 論理演算子（&&）を使う方法
if (条件式① && 条件②) {
	処理A ←……条件式① かつ 条件式② の両方がtrueの場合に実行
} else {
	処理B
}

2. ifのネストを使う方法
if (条件式①) {
	if (条件②) {
		処理A ←……条件式① かつ 条件式② の両方がtrueの場合に実行
	} else {
		処理B
	}
} else {
	処理B
}
◆論理和（OR）（2つの条件のどちらか一方でもtrueの場合）
1. 論理演算子（||）を使う方法
if (条件式① || 条件②) {
	処理A ←……条件式①または条件式②の両方がtrueの場合に実行
} else {
	処理B
}

2. 論理演算子（||）を使わない方法
if (条件式①) {
	処理A ←……条件式①がtrueの場合に実行
} else if (条件②) {
	処理A ←……条件式②がtrueの場合に実行
} else {
	処理B
}

◆排他的論理和（XOR）（2つの条件のうちどちらか一方だけtrueの場合）
1. ^演算子を使う方法
//○○.js
var a_ = true;
var b_ = false;

if (a_ ^ b_) {
	console.log("どちらか一方だけtrueです");
} else {
	console.log("両方共にtrueかfalseです");
}

2. ^演算子を使わない場合…
//○○.js
var a_ = true;
var b_ = false;

if ((a_ || b_) && !(a_ && b_)) {
console.log("どちらか一方だけtrueです");
} else {
console.log("両方共にtrueかfalseです");
}

作成日：2016年9月21日（水）
#1-17 三項演算子
Ubuntu 16.04.1 LTS、Chromium 52.0.XX（ECMAScript 2015に97％対応）、VSCode 1.5.2対応

◆比較式が１つの場合
【構文】
データ型 変数名 = (比較式) ? (true時の返り値) : (false時の返り値);
【例文】
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
var age_ = 49;
var result_ = (age_ < 60) ? "現役" : "退職";
console.log(result_); //"現役"
</script>
</head>
</html>

◆比較式が複数の場合
【構文】
データ型 変数名 = (比較式①) ? (①がtrueの場合の返り値) : //①がfalseの場合↓
変数名 = (比較式②) ? (②がtrueの場合の返り値) : //②がfalseの場合↓
変数名 = (①②の全てがfalseの場合の返り値);
【例文】
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
var age_ = 49;
var result_ = (age_ < 20) ? "未成年" :
result_ = (age_ < 60) ? "現役" :
result_ = "退職";
		console.log(result_); //"現役"
</script>
</head>
</html>

作成日：2016年9月21日（水）
#1-18 switch文
Ubuntu 16.04.1 LTS、Chromium 52.0.XX（ECMAScript 2015に97％対応）、VSCode 1.5.2対応

◆判別式がboolean値ではない場合…
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
var _name = "TAKASHI";
switch (_name) {
	case "TAKASHI" :
		console.log("父"); //←…これが出力される
		break;
	case "TOMOKO" :
		console.log("母");
		break;
	case "TOHRU" :
		console.log("長男");
		break;
	case "SACHIKO" :
		console.log("長女");
		break;
	default:
		console.log("家族以外");
		break; //←…省略可
}
</script>
</head>
</html>

◆判別式がboolean値の場合…
※case式に比較演算子が使われます。
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
var _age = 49;
switch (true) {
	case _age <= 20 :
		console.log("20歳以下");
		break;
	case _age <= 40 :
		console.log("21〜40歳");
		break;
	case _age <= 60 :
		console.log("41〜60歳"); //←…これが出力される
		break;
	default:
		console.log("61歳以上");
		break; //←…省略可
}
</script>
</head>
</html>

◆break文が無い使い方
※C#のようなフォールスルー禁止規則（何か処理をしておきながらbreakを書かないとエラー）はありません。
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
var _name = "TOHRU";
switch (_name) {
	case "TAKASHI" :
	case "TOMOKO" :
		console.log("親です");
		break;
	case "TOHRU" :
	case "SACHIKO" :
		console.log("子供です"); //←…これが出力される
		break;
	default:
		console.log("家族ではありません");
		break; //←…省略可
}
</script>
</head>
</html>

作成日：2016年9月26日（月）
#1-19 for文
Ubuntu 16.04.1 LTS、Chromium 52.0.XX（ECMAScript 2015に97％対応）、VSCode 1.5.3対応

◆ループカウンタの宣言方法
①letでループ制御変数を宣言する（参考「変数とスコープ」）
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
for (let i=0; i<10; i++) {
	console.log(i); //0,1,2,3,4,5,6,7,8,9
}
//console.log(i); //Error …for文の外では使えない
</script>
</head>
</html>

②varでループ制御変数を宣言する（参考「変数とスコープ」）
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
for (var i=0; i<10; i++) {
	console.log(i); //0,1,2,3,4,5,6,7,8,9
}
console.log(i); //10 …for文の外でも有効
</script>
</head>
</html>

◆ループカウンタを○つずつアップする
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
for (let i=0; i<50; i+=5) { //5つずつアップする場合…
	console.log(i); //0,5,10,15,20,25,30,35,40,45
}
</script>
</head>
</html>

◆for文のネスト(ループ制御変数にはi,j,kが使われます)
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
for (let i=1; i<=5; i++) {
	for (let j=1; j<=5; j++) {
		console.log("x" + i + "y" + j); //x1y1,x1y2,....,x5y4,x5y5
	}
}
</script>
</head>
</html>

◆無限ループとbreak文
………
var _count = 0;
for (;;) { //①初期化②ループ判定式③更新処理…の全てを省略すると無限ループに!
	_count++;
	if (_count > 100) break; //←…ループを終了
	console.log(_count); //1,2,....,99,100
}
console.log("for文終了");
………

◆for文とcontinue文
………
for (let i=1; i<=20; i++) { //←…iは1,2,...19,20
	if ((i % 3) != 0) { //←…3で割り余りが0でない（＝3の倍数ではない）場合
		continue; //←…for文の残処理をスキップしてfor文の次の反復を開始する
	}
	console.log(i); //3,6,9,12,15,18 ←…3の倍数
}
………

作成日：2016年9月26日（月）
#1-20 for...in文
Ubuntu 16.04.1 LTS、Chromium 52.0.XX（ECMAScript 2015に97％対応）、VSCode 1.5.3対応

◆基本構文
for (変数名 in 配列等) {
	console.log(変数名); //配列の場合はインデックス番号、連想配列の場合はプロパティ名
	console.log(配列等[変数名]); //配列の場合は要素の値、連想配列の場合はプロパティ値
}

◆配列（1次元）の場合
………
var _array = ["TAKASHI","TOMOKO","TOHRU","SACHIKO"];
for (let _indexNum in _array) {
	console.log(_indexNum); //0→1→2→3
	console.log(_array[_indexNum]); //"TAKASHI"→"TOMOKO"→"TOHRU"→"SACHIKO"
}
………

◆配列（2次元）の場合
………
var _array = [
		["x0y0","x1y0","x2y0"], //←…0行目
 		["x0y1","x1y1","x2y1"]  //←…1行目
	];
for (let _indexNum in _array) {
	console.log(_indexNum); //0→1
	console.log(_array[_indexNum]); //["x0y0","x1y0","x2y0"]→["x0y1","x1y1","x2y1"]
}
………

◆連想配列（Object＝オブジェクトリテラル）の場合
………
var _object = {name:"Takashi Nishimura", age:49};
for (let _propName in _object) {
	console.log(_propName); //name→age
	console.log(_object[_propName]); //"Takashi Nishimura" → 49
}
………

作成日：2016年9月26日（月）
#1-21 for...of文
Ubuntu 16.04.1 LTS、Chromium 53.0.XX（ES6に97％対応）、Visual Studio Code 1.8.0対応

◆一次元配列（Array）の場合
var _array = ["TAKASHI","TOMOKO","TOHRU","SACHIKO"];
for (let _data of _array) {
	console.log(_data); //"TAKASHI"→"TOMOKO"→"TOHRU"→"SACHIKO"
}

◆二次元配列（Array）の場合
var _array = [
		["x0y0","x1y0","x2y0"], //←…0行目
 		["x0y1","x1y1","x2y1"]  //←…1行目
	];
for (let _theArray of _array) {
	console.log(_theArray); //["x0y0","x1y0","x2y0"]→["x0y1","x1y1","x2y1"]
}

◆配列（Set）の場合
var _set = new Set();
_set.add("TOHRU");
_set.add("SACHIKO");
for (let _data of _set) {
	console.log(_data); //"TOHRU"→"SACHIKO"
}

◆連想配列（Map）の場合
var _map = new Map(
	["TOHRU", "2002-XX-XX"],
	["SACHIKO", "2006-XX-XX"]
);
for (let [_key, _value] of _map) {
	console.log(_key, _value);
	//"TOHRU" "2002-XX-XX
	//"SACHIKO" "2006-XX-XX"
}
	※配列（Object）では利用できないようです…（要調査）。

作成日：2016年12月16日（金）
#1-22 while文
Ubuntu 16.04.1 LTS、Chromium 52.0.XX（ECMAScript 2015に97％対応）、VSCode 1.5.3対応

◆while文
【構文】
while (ループ判定式) {
	繰り返す処理
}

【例文】
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
var _i = 0;
while (_i < 10) { //ループ判定式にはboolean値しか使えません
	console.log(_i); //0,1,2,3,4,5,6,7,8,9
	_i++;
}
</script>
</head>
</html>

◆do...while文
【構文】
do {
	繰り返す処理 ←…ループ判定式がfalseの場合でも最低１回は実行される
} while(ループ判定式);

【例文】
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
var _i = 0;
do {
	console.log(_i); //0 ←…ループ判定式はfalseだが１回実行される
	_i++;
} while(_i < 0);
</script>
</head>
</html>

◆while文とbreak文（例：1〜100までを出力）
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
var _count = 0;
while (true) { //ループ判別式をtrueにすると無限ループに!
	_count++;
	if (_count > 100) {
		break; //←…break文を使ってループを終了（while文の次の行へ）
	}
	console.log(_count); //1,2,....,99,100
}
</script>
</head>
</html>

◆while文とcontinue文（例：3の倍数を出力）
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
var _i = 1;
while (_i <= 20) {
	if ((_i % 3) != 0) { //3で割って余りが0ではない（＝3の倍数ではない）場合
		_i++;
		continue; //while文の残処理をスキップしてwhile文の次の反復を開始する
	}
	console.log(_i); //3,6,9,12,15,18 ←…3の倍数
	_i++;
}
</script>
</head>
</html>

作成日：2016年9月26日（月）
#1-23 配列（Array）
Ubuntu 16.04.1 LTS、Chromium 52.0.XX（ECMAScript 2015に97％対応）、VSCode 1.5.3対応

◆作成
【new演算子を使う方法】
var _array = new Array(); //←…空の配列を作成
var _array = new Array(4); //←…4つの空の要素（undefined）を持つ配列を作成
var _array = new Array("TOHRU", "SACHIKO");
var _array = new Array(["TOHRU",14], ["SACHIKO",10]); //←…配列のネスト

【配列リテラルを使う方法】
var _array = []; //←…空の配列を作成
var _array = ["TOHRU", "SACHIKO"];
var _array = [["TOHRU",14], ["SACHIKO",10]]; //←…配列のネスト

◆要素の数
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
var _array = ["00", "01", "02", "03"];
console.log(_array.length); //4
</script>
</head>
</html>

◆追加（最後）
var _array = ["TOHRU", "SACHIKO"];
_array.push("TARO"); //←…カンマ（,）を使って複数同時に追加可能
console.log(_array); //["TOHRU", "SACHIKO", "TARO"]

◆追加（先頭）
var _array = ["TOHRU", "SACHIKO"];
_array.unshift("TARO"); //←…カンマ（,）を使って複数同時に追加可能
console.log(_array); //["TARO", "TOHRU", "SACHIKO"]

◆更新（任意の値）
var _array = ["TAKASHI", "TOHRU", "SACHIKO"];
_array[0] = "TARO"; //←…0番目を変更する場合
console.log(_array); //["TARO", "TOHRU", "SACHIKO"]

◆更新（null値）
var _array = ["TAKASHI", "TOHRU", "SACHIKO"];
_array[0] = null;
console.log(_array); //[null, "TOHRU", "SACHIKO"]

◆削除（最後）
var _array = ["TOHRU", "SACHIKO", "TAKASHI"];
console.log(_array.pop()); //"TAKASHI" ←…削除した要素を返す
console.log(_array); //["TOHRU", "SACHIKO"]

◆削除（最初）
var _array = ["TAKASHI", "TOHRU", "SACHIKO"];
console.log(_array.shift()); //"TAKASHI" ←…削除した要素を返す
console.log(_array); //["TOHRU", "SACHIKO"]

◆削除（○番目から□個）
var _array = ["00", "01", "02", "03", "04", "05"];
console.log(_array.splice(3,2)); //["03", "04"]
console.log(_array) //["00", "01", "02", "05"]

◆削除（○番目から全て）
var _array = ["00", "01", "02", "03", "04", "05"];
console.log(_array.splice(3)); //["03", "04", "05"]
console.log(_array) //["00", "01", "02"]

◆抽出（○番目から□番目）
var _array = ["00", "01", "02", "03", "04", "05"];
console.log(_array.slice(2,4)); //["02", "03"] ←…4番目は含まず
console.log(_array) //["00", "01", "02", "03", "04", "05"] ←…元配列に変化なし

◆抽出（○番目から全て）
var _array = ["00", "01", "02", "03", "04", "05"];
console.log(_array.slice(2)); //["02", "03", "04", "05"]
console.log(_array) //["00", "01", "02", "03", "04", "05"] ←…元配列に変化なし

◆検索(前から）※第2引数番目から、後ろに向かって検索（最初に見つかったインデックス番号を返す）
var _array = ["A", "B", "C", "D", "E", "F", "D"];
console.log(_array.indexOf("D", 0)); //3 ←…見つからない場合「-1」を返す

◆検索（後ろから）※第2引数番目から、前に向かって検索（最初に見つかったインデックス番号を返す）
var _array = ["A", "B", "C", "D", "E", "F", "D"];
console.log(_array.lastIndexOf("D")); //6 ←…第2引数を省略すると_array.lengthと同じ

◆並べ替え（反転）
var _array = ["00", "01", "02", "03", "04", "05"];
console.log(_array.reverse()); //["05", "04", "03", "02", "01", "00"]
console.log(_array) //["05", "04", "03", "02", "01", "00"] ←…元配列も変更

◆並べ替え（ソート）
var _array = ["C", "02", "A", "01", "03", "B"];
console.log(_array.sort()); //["01", "02", "03", "A", "B", "C"]
console.log(_array) //["01", "02", "03", "A", "B", "C"] ←…元配列も変更

◆結合
var _array1 = ["A", "B", "C"];
var _array2 = ["D", "E", "F"];
var _array3 = _array1.concat(_array2);
console.log(_array3) //["A", "B", "C", "D", "E", "F"]

◆複製
var _original = ["A", "B", "C"];
var _copy = _original.concat(); //←…複製

//実験（参照コピーではなく複製されているか否か）
_original[0] = "あ";
console.log(_original[0], _copy[0]); //"あ" "A" ←…参照コピーではない

◆文字列→配列
var _string = "A,B,C,D,E,F";
var _array = _string.split(","); //←…カンマ区切りで配列化
console.log(_array); //["A", "B", "C", "D", "E", "F"]

◆全要素を取り出す
var _array = ["A", "B", "C", "D", "E", "F"];
_array.forEach(function(arg) {
	console.log(arg); //"A"→"B"→"C"→"D"→"E"→"F"
});
※for文、for...in文を使う方法もあります（参照「for...in文」）。

作成日：2016年9月27日（火）
更新日：2016年9月28日（水） forEach()に変更
#1-24 配列（Set）
Ubuntu 16.04.1 LTS、Chromium 53.0.XX（ES6に97％対応）、Visual Studio Code 1.8.0対応
※配列（Array）と異なり、データの重複ができません。

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <script>
//①作成
             var _set = new Set();

//②データの追加
             _set.add("TOHRU");
             _set.add("SACHIKO");

//参考：既存データの追加
             _set.add("TOHRU"); //←…無視される

//③データの数
             console.log(_set.size); //2

//④全てのデータの取得
             for (let _data of _set) {
                console.log(_data);
                //"TOHRU"
                //"SACHIKO"
             }

//⑤データがあるか否か
             console.log(_set.has("TAKASHI")); //false
             console.log(_set.has("TOHRU")); //true

//⑥データの削除
             _set.delete("TOHRU");
        </script>
    </head>
</html>

作成日：2016年12月16日（金）
#1-25 連想配列（Object）
Ubuntu 16.04.1 LTS、Chromium 52.0.XX（ECMAScript 2015に97％対応）、VSCode 1.5.3対応

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
//①作成
var _object = new Object();
//他にも {プロパティ名①:値, プロパティ名②:値} というオブジェクトリテラルを使う方法もあります。

//②プロパティの追加（更新も同じ方法です）
_object.name = "Takashi Nishimura";
_object.age = 49;

//③関数の追加
_object.hello = function() {
	return "Hello! How are you?";
}

//④プロパティの参照
console.log(_object.name); //"Takashi Nishimura"
	console.log(_object["name"]); //←…配列演算子[]を使うことも可能
console.log(_object.age); //4

//⑤関数の実行
console.log(_object.hello()); //"Hello! How are you?"

//⑥全ての要素の取得
for (let _propName in _object) {
	console.log(_propName + " : " + _object[_propName]);
}
//name : Takashi Nishimura
//age : 50
//hello : function () {...
</script>
</head>
</html>

作成日：2016年9月28日（水）
#1-26 連想配列（Map）
Ubuntu 16.04.1 LTS、Chromium 53.0.XX（ES6に97％対応）、Visual Studio Code 1.8.0対応

◆Objectとの違い
① キーに文字列以外でも使える。
② データの個数を調べるプロパティが用意されている。
③ Objectオブジェクトを継承していない（クリーンな連想配列の生成が可能）。

◆サンプル
	<!DOCTYPE html><html><head><meta charset="UTF-8"><script>
//①作成
		var _map = new Map();

//②データの追加
		_map.set("TOHRU", "2002-XX-XX");
		_map.set("SACHIKO", "2006-XX-XX");

//③データの数
		console.log(_map.size); //2

//④データの取得
		console.log(_map.get("TOHRU")); //"2002-XX-XX"
		console.log(_map.get("SACHIKO")); //"2006-XX-XX"

//⑤全てのデータの取得
		for (let [_key, _value] of _map) {
			console.log(_key, _value);
			//"TOHRU" "2002-XX-XX"
			//"SACHIKO" "2006-XX-XX"
		}

//⑥データがあるか否か
		console.log(_map.has("TAKASHI")); //false
		console.log(_map.has("TOHRU")); //true

//⑦データの削除
		_map.delete("TOHRU");
	</script></head></html>

作成日：2016年12月16日（金）
#1-27 this
Ubuntu 16.04.1 LTS、Chromium 52.0.XX（ECMAScript 2015に97％対応）、VSCode 1.5.3対応

◆トップレベルのthis
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
document.write(this); //[object Window] ←…windowと同じ（省略可能）
</script>
</head>
</html>
※<script src="main.js"></script>として外部のmain.jsを読み込んだ場合も同様です。

◆クラス内のthis
【○○.html】
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <script src="main.js"></script>
    </head>
</html>

【main.js】
class MyClass {
    constructor() {
        document.write(this); //[object Object] ←…MyClassのインスタンス
        this.__hoge = "擬似プライベート変数"; //←…thisは省略不可
    }
    get hoge() { //アクセサ（getter）
        return this.__hoge; //←…thisは省略不可
    }
}
var _myClass = new MyClass();
console.log(_myClass.hoge); //"擬似プライベート変数"

※クラス内ではthis/var/let/constの何れかを指定する必要があり省略はできません。

◆イベントハンドラメソッド内のthis
＜概要＞
独自クラスを作成し、JavaScript標準のイベント（mousedown等）のイベントリスナーを記述した場合、リスナー関数内で自分自身（＝クラス）を参照したい場合がよくあります。しかし、残念ながらthisはイベントリスナーの対象となるオブジェクトを参照します。そこでワンクション置くことでクラスを参照できるようにしたのが以下のサンプルです。

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
    class MyClass {
constructor() {
	this.__img01 = document.getElementById("img01");

	//イベントハンドラメソッド内でthis＝Canvasオブジェクトとする為
this.__mousedown_img01 =(_e)=> { this.__mousedown_img01_method(_e); }

	//Image用イベントハンドラの定義
this.__img01.addEventListener("mousedown",this.__mousedown_img01,false);
}

//MyClass.__mousedown_img01（アロー関数）からの呼出し
__mousedown_img01_method(_e) { //引数は「JavaScript.MouseEvent」
	console.log(this); //MyClass
}
    }

    window.addEventListener("load", load_window, false);
    function load_window() {
        new MyClass();
    }
</script>
</head>
<body>
    <img id="img01" src="sample.png">
</body>
</html>

作成日：2016年9月28日（水）
更新日：2016年12月16日（金） イベントハンドラメソッド内のthisを追加
#1-28 文字列の操作
Ubuntu 16.04.1 LTS、Chromium 52.0.XX（ECMAScript 2015に97％対応）、VSCode 1.5.3対応

◆文字列の生成
var 変数 = new String("○○"); //←…object型
var 変数 = "○○"; //←…string型
※上記2つは厳密には異なりますが、通常は意識する必要はないと思います。

◆文字列の長さを調べる
var _string = "ABCDE";
console.log(_string.length); //5

◆一部分を取得
var _string = "0123456789";
console.log(_string.substr(0,1)); //"4" ←…0文字目（先頭）〜1文字取得
console.log(_string.substr(-1,1)); //"9" ←…後ろから1文字目〜1文字取得
console.log(_string.substr(4)); //"456789" ←…4文字目（0から開始）〜全て取得
console.log(_string.substr(4,3)); //"456" ←…4文字目（0から開始）〜3文字取得

◆置換
var _string = "2016年9月28日";
	var _regExp = new RegExp("2016", "g"); //←…第2引数を省略すると全てを置換（"g"と同等）
console.log(_string.replace(_regExp, "平成27")); //平成27年9月28日

◆検索（最後から検索する○.lastIndexOf()もあります）
var _string = "ABCDEFG-ABCDEFG";
var _count = 0;
while (_string.indexOf("CD", _count) != -1) { //←…見つからないと-1を返す
	var _num = _string.indexOf("CD", _count);
	console.log(_num); //2,10 ←…"CD"が見つかった場所（0から開始）を返す
	_count = _num + 1;
}

◆文字列→配列
var _string = "A,B,C,D,E,F";
var _array = _string.split(","); //←…カンマ区切りで配列化
console.log(_array); //["A", "B", "C", "D", "E", "F"]

作成日：2016年9月28日（水）
#1-29 正規表現
Ubuntu 16.04.1 LTS、Chromium 52.0.XX（ECMAScript 2015に97％対応）、VSCode 1.5.3対応
※ES6には多くの正規表現の機能が用意されています。ここではいくつかのサンプルを紹介します。

◆検索＆置換
var _string = "熊谷,遠藤,西村,藤牧,日茂,井戸,伊藤,渡邊";
var _regExp = new RegExp("西村", "g"); //←…第2引数を省略すると全てを置換（"g"と同等）
/*
"^○○$"のように「^（行頭マッチ）」「$（行末マッチ）」といったメタ文字の他、様々なパターン、例えば "[A-D]\d+" など…を使うことでより細かな制御が可能なはずです（要調査）。
*/
if (_regExp.test(_string)) { //←…検索
	console.log('"西村"は含まれています');
		let _result = _string.replace(_regExp, "にしむら"); //←…置換
		//熊谷,遠藤,にしむら,藤牧,日茂,井戸,伊藤,渡邊
		console.log(_result);
} else {
	console.log('"西村"は含まれていません');
}

◆マッチした数
var _string = "059371820400381295700347891205178900517093823";
var _regExp = new RegExp("00", "g"); //←…第2引数を省略すると全てを置換（"g"と同等）
var _matchList = _string.match(_regExp);
console.log(_matchList); //["00", "00", "00"]
console.log(_matchList.length); //3  ←…マッチした数

◆正規表現について…
文字パータンを表現するオブジェクト（ES6ではRegExpクラス）のこと。
JavaScriptの正規表現は、「ECMAScript 3」で標準化されました。
StringとRegExpクラスには、次のような正規表現用のメソッドが用意されています。
① RegExp.exec()
② RegExp.test()
③ String.search()
④ String.match()
⑤ String.replace()
⑥ String.split()

作成日：2016年9月28日（水）
#1-30 抽象クラス
Ubuntu 16.04.1 LTS、Chromium 52.0.XX（ECMAScript 2015に97％対応）、VSCode 1.5.3対応

◆概要
ECMAScript 6には、TypeScript（1.6〜）にあるabstractやinterfaceキーワードはありません。ECMAScript 6では、継承と例外処理によって擬似的な抽象クラスを実現します。

◆構文
class Abstract○○ { //←…（擬似）抽象クラスの定義
	抽象メソッド名(引数①,引数②,...) {
		throw new Error("派生クラスで実装して下さい"); //←…例外処理
	}
}
class 派生クラス名 extends Abstract○○ { //←…（擬似）抽象クラスの継承
	抽象メソッド名(引数①,引数②,...) {
		//実際の処理はここに記述
	}
}

◆例文
//main.js
class AbstractClass { //←…（擬似）抽象クラスの定義
commonMethod() { //←…共通のメソッド
	console.log("AbstractClass.commonMethod()");
}
eachMethod() { //←…抽象メソッド（実際の処理は記述しない）
	throw new Error("派生クラスで実装して下さい"); //←…例外処理
}
}
class SubClass extends AbstractClass { //←…（擬似）抽象クラスの継承
eachMethod() { //←…オーバーライドして実際の処理を記述
	console.log("SubClass.eachMethod()"); //←…実際の処理
}
}

var _subClass = new SubClass();
_subClass.commonMethod(); //"AbstractClass.commonMethod()"
_subClass.eachMethod(); //"SubClass.eachMethod()"

作成日：2016年9月29日（木）
#1-31 superキーワード
Ubuntu 16.04.1 LTS、Chromium 52.0.XX（ECMAScript 2015に97％対応）、VSCode 1.5.3対応

【○○.html】
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <script src="main.js"></script>
    </head>
</html>

【main.js】
//スーパークラス
class SuperClass {
    constructor(arg) { //←…コンストラクタ
        console.log("SuperClass.constructor : " + arg);
    }
    methodSuper(arg) {
        console.log("SuperClass.methodSuper : " + arg);
    }
}

//サブクラス
class SubClass extends SuperClass { //←…スーパークラスを継承
constructor() { //←…コンストラクタ
//↓サブクラスのコンストラクタ内であれば冒頭でなくても可能
super("from SubClass"); //←…スーパークラスのコンストラクタの呼び出し（必須）
}
methodSub() {
		//↓スーパークラスのメソッドを呼び出すことが可能
super.methodSuper("from SubClass");
	}
}

//実行
var _subClass = new SubClass(); //"SuperClass.constructor : from SubClass"
_subClass.methodSub(); //"SuperClass.methodSuper : from SubClass"

作成日：2016年9月29日（木）
#1-32 オーバーライド
Ubuntu 16.04.1 LTS、Chromium 52.0.XX（ECMAScript 2015に97％対応）、VSCode 1.5.3対応

◆概要
スーパークラスで定義したメソッドをサブクラスで再定義することをオーバーライドと呼ぶ。
スーパークラスのメソッドを呼び出したい場合は、super.メソッド名()とする。
（擬似）抽象クラスもこの方法を使います。

【○○.html】
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <script src="main.js"></script>
    </head>
</html>

【main.js】
//スーパークラス
class SuperClass {
//↓サブクラスでオーバライドするメソッド
myMethod() {
	console.log("SuperClass.myMethod()");
}
}

//サブクラス
class SubClass extends SuperClass { //←…スーパークラスを継承
//↓スーパークラスにある同名のメソッドを再定義＝オーバーライド
myMethod() {
	super.myMethod(); //←…スーパークラス内の同名のメソッドを呼び出す場合…
	console.log("SubClass.myMethod()");
}
}

//実行
var _subClass = new SubClass();
_subClass.myMethod();

作成日：2016年9月29日（木）
#1-33 カスタムイベント
Ubuntu 16.04.1 LTS、Chromium 52.0.XX（ECMAScript 2015に97％対応）、VSCode 1.5.3対応

◆概要
ECMAScript 2015に実装されている○.dispatchEvent()や○.addEventListener()のターゲットに指定できるオブジェクトは…Window、XMLHttpRequest、HTMLCanvasElement、ドキュメント上の単一のノード、ドキュメント自身などに限られるため、用途が限定されます。それとは異なり、ここで紹介する方法は、他の言語でも利用可能な考え方の汎用的な方法です。

◆例文（○○.js）
class Robot { //←…イベントを設定するクラス
	constructor() { this.__energy = 80; }
addEventListener(_event, _function) {
	if (_event == "die") {
		this.__dieHandler = _function; //←…匿名関数を変数に格納
	} else { //該当のイベントが無い場合、実行時にErrorを発生させる（オプション）
		throw new Error('Error:"' + _event + '"はサポートされていません');
	}
}
	fight() {
		this.__energy -= 20;
		if (this.__energy <= 0) {
this.__dieHandler(this); //←"die"イベントの発生（リスナー関数の呼出し）
		}
	}
}

var die_robot = (arg) => { //←…リスナー関数（前方宣言が必要）
    console.log(arg); //Robotクラスのインスタンス
    alert("GAME OVER");
}

var _robot = new Robot();
_robot.addEventListener("die", die_robot); //←…イベントリスナーの設定
_robot.fight();
_robot.fight();
_robot.fight();
_robot.fight(); //"GAME OVER"

作成日：2016年9月29日（木）
#1-34 数学関数（Math）
Ubuntu 16.04.1 LTS、Chromium 52.0.XX（ECMAScript 2015に97％対応）、VSCode 1.5.3対応

◆Math.sin() ←…サイン（正弦）

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
console.log(Math.sin(0)); //0 ←…0°
console.log(Math.sin(Math.PI/2)); //1 ←…90°
console.log(Math.sin(Math.PI)); //1.2246467991473532e-16（≒0） ←180°
console.log(Math.sin(Math.PI*3/2)); //-1 ←…270°
console.log(Math.sin(Math.PI*2)); //-2.4492935982947064e-16（≒0）←360°
</script>
</head>
</html>

◆Math.cos() ←…コサイン（余弦）
console.log(Math.cos(0)); //1 ←…0°
console.log(Math.cos(Math.PI/2)); //6.123233995736766e-17（≒0） ←…90°
console.log(Math.cos(Math.PI)); //-1 ←…180°
console.log(Math.cos(Math.PI*3/2)); //-1.8369701987210297e-16（≒0） ←…270°
console.log(Math.cos(Math.PI*2)); //1 ←…360°

◆Math.atan2() ←…アークタンジェント2
//三角形の各辺が1:2:√3の場合に2:√3の間の角度は30°であることの検証
var _disX = Math.sqrt(3); //←…√3のこと
var _disY = 1;
console.log(Math.atan2(_disY, _disX)); //0.5235987755982989（ラジアン）
console.log(180*Math.atan2(_disY, _disX)/Math.PI); //30.000000000000004（度）

◆Math.PI ←…円周率
console.log(Math.PI); //3.141592653589793

◆Math.floor() ←…切り捨て
console.log(Math.floor(1.001)); //1
console.log(Math.floor(1.999)); //1

◆Math.ceil() ←…切り上げ
console.log(Math.ceil(1.001)); //2
console.log(Math.ceil(1.999)); //2

◆Math.round() ←…四捨五入
console.log(Math.round(1.499)); //1
console.log(Math.round(1.500)); //2

◆Math.abs() ←…絶対値
console.log(Math.abs(100)); //100
console.log(Math.abs(-100)); //100

◆Math.pow() ←…累乗（○の□乗）
console.log(Math.pow(2, 0)); //1（2の0乗）
console.log(Math.pow(2, 8)); //256（2の8乗）

◆Math.sqrt() ←…平方根（√○）
console.log(Math.sqrt(2)); //1.4142135623730951（一夜一夜にひとみごろ）
console.log(Math.sqrt(3)); //1.7320508075688772（人並みに奢れや）
console.log(Math.sqrt(4)); //2
console.log(Math.sqrt(5)); //2.23606797749979（富士山麓オウム鳴く）

◆Math.max() ←…比較（最大値）
console.log(Math.max(5.01, -10)); //5.01 ←…「2つ」の数値の比較

◆Math.min() ←…比較（最小値）
console.log(Math.min(5.01, -10)); //-10 ←…「2つ」の数値の比較

◆Math.sign() ←…符号（正か負の値か）
console.log(Math.sign(-0.1)); //-1（負の値）
console.log(Math.sign(0)); //0（0）
console.log(Math.sign(0.1)); //1（正の値）

作成日：2016年9月29日（木）
#1-35 乱数
Ubuntu 16.04.1 LTS、Chromium 52.0.XX（ECMAScript 2015に97％対応）、VSCode 1.5.3対応

◆Math.random()
0以上、1未満（0.9999…）の値を返します。
現在時刻を元にrandom seed（乱数種）を生成する…らしい。
console.log(Math.random()); //0.13397585139675616
console.log(Math.random()); //0.9903535518676447
console.log(Math.random()); //0.006009885271453852

◆整数の乱数
//整数の乱数を返すカスタム関数
this.randomInt = (_min, _max) => {
    return Math.floor(Math.random() * (_max - _min + 1)) + _min;
}

//実験（1000万回繰返して精度を調べます）
var _u5=0, _u4=0, _u3=0, _u2=0, _u1=0;
var _o0=0, _o1=0, _o2=0, _o3=0, _o4=0, _o5=0;

for (let i=0; i<10000000; i++) {
    switch(this.randomInt(-5, 5)) {
        case -5: _u5++; break;
        case -4: _u4++; break;
        case -3: _u3++; break;
        case -2: _u2++; break;
        case -1: _u1++; break;
        case  0: _o0++; break;
        case  1: _o1++; break;
        case  2: _o2++; break;
        case  3: _o3++; break;
        case  4: _o4++; break;
        case  5: _o5++; break;
    }
}

console.log(_u5,_u4,_u3,_u2,_u1,_o0,_o1,_o2,_o3,_o4,_o5);
//909461 910465 907165 908025 910926 907237 910557 908476 909376 908795 909517

作成日：2016年9月30日（金）
#1-36 日時情報
Ubuntu 16.04.1 LTS、Chromium 52.0.XX（ECMAScript 2015に97％対応）、VSCode 1.5.3対応

◆書式
var ○ = new Date();
	○.getFullYear(); //年（2015等）
	○.getMonth(); //月（0〜11）
	○.getDate(); //日（1〜31）
	○.getDay(); //曜日（0=日曜〜5=金曜）
	○.getHours(); //時（0〜23）
	○.getMinutes(); //分（0〜59）
	○.getSeconds(); //秒（0〜59）
	○.getMilliseconds(); //ミリ秒（0〜999）

◆例文
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
var _date = new Date();
console.log(_date); //"Fri Sep 30 2016 09:36:50 GMT+0900" (JST)
console.log(_date.getFullYear()); //2016
console.log(_date.getMonth()); //8 ←…9月
console.log(_date.getDate()); //30
console.log(_date.getDay()); //5 ←…金曜日
console.log(_date.getHours()); //9
console.log(_date.getMinutes()); //36
console.log(_date.getSeconds()); //50
console.log(_date.getMilliseconds()); //668
//"hh:mm:ss"で現在の時間を表示する方法
			var _h = (_date.getHours()<10) ? "0"+_date.getHours() : _date.getHours();
			var _m = (_date.getMinutes()<10) ? "0"+_date.getMinutes() : _date.getMinutes();
			var _s = (_date.getSeconds()< 10) ? "0"+_date.getSeconds() : _date.getSeconds();
			console.log(_h + ":" + _m + ":" + _s); //"09:36:50"
</script>
</head>
</html>		

作成日：2016年9月30日（金）
#1-37 タイマー
Ubuntu 16.04.1 LTS、Chromium 52.0.XX（ECMAScript 2015に97％対応）、VSCode 1.5.3対応

◆繰返し実行する
this._count = 0; //←…var _count = 0;でも同じ
this.callbackFunction = () => { //←…var loopFunction ...でも同じ
	if (++ _count <= 10) { //←…10回繰返す場合…
		console.log("繰返し実行したい処理");
	} else {
clearInterval(this._timerID); //←…繰返しを止める
	}
}
//↓第3引数を使ってデータをcallbackFunctionの引数として送信することも可能
this._timerID = setInterval(this.callbackFunction, 1000); //←…1秒間隔で繰返す場合

◆一度だけ実行する
this.callbackFunction = () => { //←…var timeoutFunction ...でも同じ
console.log("一度だけ実行したい処理");
clearTimeout(this._timerID);
}
this._timerID = setTimeout(this.callbackFunction, 1000); //←…1秒後に1回実行する場合

◆○秒後にA、その○秒後にB...を実行 ←…Promise（新機能）でも同様のことが出来そうですが…
//Task○のスーパークラス ////////////////////////////////////////////////////////////
class SuperTask {
    //静的変数（delay）
    static set delay(_newValue) { this.__delay = _newValue; }
    static get delay() {
        if (this.__delay == undefined) { this.__delay = 0; }
        return this.__delay;
    }

    //静的変数（nextTask）
    static get nextTask() { return this.__nextTask; }
    static set nextTask(_newValue) { this.__nextTask = _newValue; }

    static exec() { //静的メソッド
        if (this.__delay == undefined) { this.__delay = 0; }
        setTimeout(this.__callBack, this.__delay);
    }
}
//TaskAクラス////////////////////////////////////////////////////////////////////////
class TaskA extends SuperTask {
static __callBack() {
var _this = TaskA;
//TaskAで実行したいことをここに記述
console.log(_this.delay + "ミリ秒後にTaskAで実行すること");
if (_this.nextTask != undefined) { _this.nextTask.exec(); }
	}
}

//TaskBクラス////////////////////////////////////////////////////////////////////////
class TaskB extends SuperTask {
    static __callBack() {
var _this = TaskB;
//TaskBで実行したいことをここに記述
console.log(_this.delay + "ミリ秒後にTaskBで実行すること");
if (_this.nextTask != undefined) { _this.nextTask.exec(); }
	}
}

//TaskCクラス////////////////////////////////////////////////////////////////////////
class TaskC extends SuperTask {
    static __callBack() {
var _this = TaskC;
//TaskCで実行したいことをここに記述
console.log(_this.delay + "ミリ秒後にTaskCで実行すること");
if (_this.nextTask != undefined) { _this.nextTask.exec(); }
	}
}

//タイマーの設定（初期値は0ミリ秒）
TaskA.delay = 1000;
TaskB.delay = 2000;
TaskC.delay = 3000;

//次のタスクの設定（初期値は未設定）
TaskA.nextTask = TaskB;
TaskB.nextTask = TaskC;

TaskA.exec(); //実行開始

作成日：2016年9月30日（金）
更新日：2016年10月20日（火） setInterval()の第3引数について追加
#1-38 処理速度計測
Ubuntu 16.04.1 LTS、Chromium 52.0.XX（ECMAScript 2015に97％対応）、VSCode 1.5.3対応

◆Dateオブジェクトを使う方法…
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
var _start = new Date().getTime(); //←…1970年からの経過時間（ミリ秒）
for (let i=0; i<1000000000; i++) { //←…10億回繰返す
    //速度計測したい処理
}
var _end = new Date().getTime();
console.log(_end - _start); //3643（ミリ秒）
</script>
</head>
</html>		

◆console.time()を使う方法… ←…これからはこちらを使いましょう
処理時間の計測に役立ちます。ページ毎に10000個（!）のタイマーが使用可能です。
各タイマーには、ユニーク（唯一）な識別子を付けて使用します。使用後は、同じ識別子を引数としてconsole.timeEnd() を実行することで経過時間が出力されます。

【例文】
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
console.time("timerA");
for (let i=0; i<1000000000; i++) { //←…10億回繰返す
    //速度計測したい処理
}
console.timeEnd("timerA"); //"timerA: 3628.869ms"
</script>
</head>
</html>		

作成日：2016年9月30日（金）
#1-39 外部テキストの読み込み
Ubuntu 16.04.1 LTS、Chromium 52.0.XX（ECMAScript 2015に97％対応）、VSCode 1.5.3対応

◆テキストファイルの用意
※sample.txt（UTF-8）としてHTMLファイルと同階層に保存します。

あいうえお
かきくけこ
さしすせそ

◆HTMLファイル
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
//①XMLHttpRequestオブジェクトの生成
var _request = new XMLHttpRequest();

//②イベントハンドラの定義
_request.onload = function() {
	console.log(this.responseText); //⑤読み込んだテキストの表示
}

//③ヘッダの設定
_request.open("GET", "sample.txt");

//④リクエストの送信
_request.send(null);
</script>
</head>
</html>		

◆テキストファイルの解析
読み込んだXMLHttpRequest.responseTextは…
	CSV形式の場合は…convertCSVtoArray(XMLHttpRequest.responseText)
	JSON形式の場合は…JSON.parse(XMLHttpRequest.responseText)
…を使うことで解析が可能になります。

作成日：2016年9月30日（金）
