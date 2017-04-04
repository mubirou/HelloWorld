# <b>ECMAScript 6 基礎文法</b>

### <b>INDEX</b>

* Hello,world! （[Linux](https://github.com/TakashiNishimura/HelloWorld/blob/master/ECMAScript6/ECMAScript6_linux.md) / [macOS](https://github.com/TakashiNishimura/HelloWorld/blob/master/ECMAScript6/ECMAScript6_mac.md) / [Windows](https://github.com/TakashiNishimura/HelloWorld/blob/master/ECMAScript6/ECMAScript6_win.md)）
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
* [アロー関数](#アロー関数)
* [クラス定数･変数･メソッド](#クラス定数･変数･メソッド)
* [if 文](#if文)
* [三項演算子](#三項演算子)
* [switch 文](#switch文)
* [for 文](#for文)
* [for...in 文](#for...in文)
* [for...of 文](#for...of文)
* [while文](#while文)
* [配列（Array）](#配列（Array）)
* [配列（Set）](#配列（Set）)
* [連想配列（Object）](#連想配列（Object）)
* [連想配列（Map）](#連想配列（Map）)
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


<a name="データ型"></a>
# <b>データ型</b>

### データ型の種類
1. boolean（論理型）
1. number（整数･浮動小数点数）
1. string（文字列）
1. object（全てのオブジェクトのベース）
1. undefined（未初期化変数）
1. symbol（シンボル）

### 例文
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

var _object = {name:"TARO", age:49}; //連想配列
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
# <b>データ型の操作</b>

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
console.log(typeof {name:"TARO", age:49}); //"object"

//⑤undefined（未初期化変数）
console.log(typeof _hoge); //"undefined"

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
console.log({name:"TARO"} instanceof Object); //true
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
var _string2 = String(["TARO", 49]);
console.log(_string2, typeof _string2); //"TARO,49", "string"

</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2017年03月17日  


<a name="クラス"></a>
# <b>クラス</b>

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
# <b>スーパークラスとサブクラス</b>

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
# <b>名前空間</b>

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

//MyClassクラス（名前空間を省略するとコンフリクトを起こす）
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
# <b>継承と委譲</b>

### 概要

* GoF デザインパターンの [Adapter パターン](http://bit.ly/2naab8x)等で利用される
* 継承の場合は <b>extends クラス名</b> を使い、委譲の場合は <b>new クラス名()</b> を使ってオブジェクトを生成し、他のクラスの機能を利用する

### 継承版

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

### 委譲版

```
<script>
    class ClassA {
    myMethod() {
        console.log("ClassA.myMethod");
    }
    }

    class ClassB {
    constructor() { //コンストラクタ
        this.__classA = new ClassA(); //コンストラクタ内でオブジェクトを生成（委譲）
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


<a name="変数とスコープ"></a>
# <b>変数とスコープ</b>

### 変数の種類

1. グローバル変数…プログラム全体からアクセス可能
1. 擬似プライベート変数…単なるパブリック変数（アクセサを利用すべき）
1. ローカル変数…関数またはメソッド内でのみアクセス可能
1. ブロック変数…ブロック{}内でのみアクセス可能

### グローバル変数
* Windowオブジェクトのプロパティ

```
<script>
    /*******************************************
    グローバル変数定義
    （関数の外部で定義するとグローバル変数扱い）
    *******************************************/
    var _global = "グローバル変数"; //varは省略可
    //this._global = "グローバル変数"; //上記と同じ意味
    //window._global = "グローバル変数"; //上記と同じ意味

    /*****************************
    関数内でのグローバル変数の扱い
    *****************************/
    function myFunction() {
        console.log(_global); //"グローバル変数"
        console.log(this._global); //"グローバル変数"
        console.log(window._global); //"グローバル変数"
    }
    myFunction();

    /********************************
    クラス内でのグローバル変数の扱い
    ********************************/
    class MyClass {
        constructor() { //コンストラクタ
            console.log(_global); //"グローバル変数"
            console.log(this._global); //undefined（thisはMyClassのインスタンスの為）
            console.log(window._global); //"グローバル変数"
        }
    }
    new MyClass();
</script>
```

### 擬似プライベート変数
* 実際は単なるパブリック変数
* 変数へのアクセスはアクセサ（getter/setter）を利用する（推奨）

```
<script>
    class MyClass {
        //コンストラクタ
        constructor() {
            //擬似プライベート変数の定義
            this.__propA = "いろは"; //変数名は__xxxにする（任意）
        }

        get propA() { //アクセサ（getter）
            return this.__propA;
        }

        set propA(_newValue) { //アクセサ（setter）
            this.__propA = _newValue;
        }
    }

    var _myClass = new MyClass();

    //良い例（アクセサを使ってアクセスする）
    console.log(_myClass.propA); //"いろは"（getterによる値の取得）
    _myClass.propA = "ABC"; //setアクセサによる値の変更
    console.log(_myClass.propA); //"ABC"

    //悪い例（外部から直接アクセスしてはいけない）
    _myClass.__propA = "あいう"; //外部から直接変更できてしまう
    console.log(_myClass.__propA); //"あいう"
</script>
```

### ローカル変数
* 関数またはメソッド内でのみアクセス可能

1. 関数内で定義した場合
	```
	<script>
		function myFunction1() {
			//ローカル変数定義
			var _local = "ローカル変数"; //varは省略不可
			console.log(_local); //"ローカル変数"
		}

		function myFunction2() {
			//console.log(_local); //Error
		}

		myFunction1();
		myFunction2();
		//console.log(_local); //Error
	</script>
	```

1. メソッド内で定義した場合
	```
	<script>
		class MyClass {
			myMethod1() {
				var _local = "ローカル変数"; //varは省略不可
				console.log(_local); //"ローカル変数"
			}
			myMethod2() {
				//console.log(_local); //Error
			}
		}
		var myClass_ = new MyClass();
		myClass_.myMethod1();
		myClass_.myMethod2();
	</script>
	```

1. for文内で定義した場合
	```
	<script>
		for (var i = 0; i < 10; i++) {
			console.log(i); //0,1,2,...,8,9
		}
		console.log(i); //10（for文の外でも有効）
	</script>
	```

### ブロック変数
* ブロック {} 内でのみ有効

1. for 文内で定義した場合
	```
	<script>
		for (let i = 0; i < 10; i++) {
			console.log(i); //0,1,2,...,8,9
		}
		console.log(i); //Error（アクセス不可）
	</script>
	```

1. if 文内で定義した場合
	```
	<script>
		if (true) {
			let _block = "ブロック変数";
			console.log(_block); //"ブロック変数"
		}
		console.log(block_); //Error（アクセス不可）
	</script>
	```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2017年03月21日


<a name="アクセサ"></a>
# <b>アクセサ （getter / setter）</b>

### 概要
ECMAScript 6 は、TypeScript と違い private 変数を定義することができません。そこでパブリック変数を、[Python](https://ja.wikipedia.org/wiki/Python) 風に __xxx と命名してプライベート変数扱いにします。実際は単なるパブリック変数ですので外部からアクセスできてしまいますが、必ずアクセサを使ってアクセスするようにします。

### 読書き可能なプロパティ
```
<script>
    class Nishimura {
        //コンストラクタ
        constructor(_age) {
            this.__age = _age;
        }
        //アクセサ（getter/setter）
        get age() {
            return this.__age;
        }
        set age(newValue) {
            this.__age = newValue;
        }
    }

    var _nishimura = new Nishimura(49);
    console.log(_nishimura.age); //49
    _nishimura.age = 50; //変更が可能
    console.log(_nishimura.age); //50
</script>
```

### 読取り専用のプロパティ
```
<script>
    class Nishimura {
        //コンストラクタ
        constructor(_age) {
            this.__age = _age;
        }
        //アクセサ（getter/setter）
        get age() {
            return this.__age;
        }
        set age(_newValue) {
            throw new Error("値の変更はできません");
        }
    }

    var _nishimura = new Nishimura(49);
    console.log(_nishimura.age); //49
    _nishimura.age = 50; //Error: 値の変更はできません
</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2017年03月21日


<a name="演算子"></a>
# <b>演算子</b>

### 算術演算子
（複合代入演算子 += -= *= /= %= などもあり）
```
<script>
    console.log(3 + 2); //5 (可算)
    console.log(5 - 8); //-3 (減算)
    console.log(3 * 4); //12 (乗算)
    console.log(1 + 2 * 3 - 4 / 2); //5 (複雑な計算)
    console.log(63 % 60); //3 (余剰)
    console.log(8 / 3); //2.6666666666666665（除算)
</script>
```

### 後ろに付けるインクリメント／デクリメント
```
<script>
    //インクリメント
    var _huga = 0;
    var _piyo = _huga++; //加算する前の_hugaの値を返す
    console.log(_huga); //1
    console.log(_piyo); //0

    //デクリメント
    _huga = 0;
    _piyo = _huga--; //減算する前の_hugaの値を返す
    console.log(_huga); //-1
    console.log(_piyo); //0
</script>
```

### 前に付けるインクリメント／デクリメント
```
<script>
    //インクリメント
    var _huga = 0;
    var _piyo = ++_huga; //加算後の_hugaの値を返す
    console.log(_huga); //1
    console.log(_piyo); //1

    //デクリメント
    _huga = 0;
    var _piyo = --_huga; //減算後の_hugaの値を返す
    console.log(_huga); //-1
    console.log(_piyo); //-1
</script>
```

### その他の演算子
```
<script>
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
</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2017年03月21日


<a name="定数"></a>
# <b>定数</b>

### 概要
* const はクラス外で定数を扱う場合に利用できます。
* const をクラス内で利用した場合、単なる「変更不可のローカル変数」扱いとなり、用途は非常に限られます（ const this.定数名 という記述は不可）。
* クラス定数を実現するためには、static（メソッドに対してのみ有効）と getter を利用します。setter には、値を変更しようとした際にエラーが発生するように記述します。

### 通常の定数
```
<script>
    const MY_NAME = "Takashi Nishimura";
    console.log(MY_NAME); //"Takashi Nishimura"
    MY_NAME = "ICHIRO NISHIMURa"; //Error（変更不可）
</script>
```

### クラス定数（静的定数）
```
<script>
    class MyMath {
        constructor() {
            /*
            ↓「変更不可のローカル変数」となりクラス定数として利用できない
            ↓「const this.定数名」という記述は不可
            */
            //const PI = 3.141592653589793;
        }
        static get PI() {
            return 3.141592653589793;
        }
        static set PI(newValue) {
            throw new Error("値の変更はできません");
        }
    }

    console.log(MyMath.PI); //3.141592653589793
    //MyMath.PI = 3.14; //Error: 値の変更はできません
</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2017年03月21日  


<a name="メソッド"></a>
# <b>メソッド</b>


### パブリックメソッド
* アクセス修飾子が存在しないため、メソッドは全てパブリックメソッド扱いになる
```
<script>
    //○○.js
    class MyClass {
        tashizan(_start, _end) {
            var _result = 0; //ローカル変数（関数内のみ有効）
            for (let _i = _start; _i <= _end; _i++) {
                //_i はブロック変数（ブロック {} 内のみ有効）
                _result += _i;
            }
            return _result;
        }
    }

    var _myClass = new MyClass();
    console.log(_myClass.tashizan(1, 10)); //55
    console.log(_myClass.tashizan(1, 100)); //5050
</script>
```

### 擬似プライベートメソッド
* 実際は単なるパブリックメソッド
* アクセス修飾子が存在しないため、Python 風 に __メソッド名() と命名して外からアクセスしないようにする
```
<script>
    class Omikuji {
        //コンストラクタ
        constructor() {
            var _resultList = ["大吉", "吉", "中吉", "小吉", "凶"];
            console.log(_resultList[this.__randomInt(0, 4)]);
        }

        __randomInt(_min, _max) { //（擬似）プライベートメソッド
            var _tmp = _max - _min + 1;
            return Math.floor(Math.random() * _tmp) + _min;
        }
    }

    new Omikuji(); //大吉、吉、中吉、小吉、凶のいずれか
</script>
```

### コンストラクタ
```
<script>
    class Point {
        //コンストラクタ
        constructor(_x = 0, _y = 0) {
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

    var _point = new Point(100, 150); //ここでコンストラクタを呼び出す
    console.log(_point.x); //100
    console.log(_point.y); //150
</script>
```

### 静的メソッド（クラスメソッド）
* インスタンス化せずにメソッドを利用することが可能
```
<script>
    class MyMath {
        //静的メソッド（static メソッド名()）
        static pow(arg1, arg2) {
            if (arg2 == 0) { return 1; } //0乗対策
            var _result = arg1;
            for (let _i = 1; _i < arg2; _i++) {
                _result = _result * arg1;
            }
            return _result;
        }
    }

    console.log(MyMath.pow(2, 0)); //1（2の0乗）
    console.log(MyMath.pow(2, 1)); //2（2の1乗）
    console.log(MyMath.pow(2, 8)); //256（2の8乗）
</script>
```

### デフォルト値付き引数
* 省略可能な引数
* 「オプション引数」とも呼ばれる
```
<script>
    class MyClass {
        constructor() {
            this.__point = 0; //擬似プライベート変数の定義（初期化）
        }
        addPoint(arg = 1) { //初期値を1とした場合
            this.__point += arg;
            console.log(this.__point);
        }
    }

    var _myClass = new MyClass();
    _myClass.addPoint(); //1
    _myClass.addPoint(10); //11
</script>
```

### 可変長引数
* 引数を固定の数ではなく任意の数にすることが可能
* メソッド名(引数, ...可変長引数) のように併用も可能
```
<script>
    class MyClass {
        sum(...args) { //...引数名 で可変長引数
            for (let tmp in args) {
                console.log(args[tmp]);
            }
        }
    }

    var _myClass = new MyClass();
    _myClass.sum(1, 2); //1→2
    _myClass.sum(1, 2, 3, 4, 5); //1→2→3→4→5
</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2017年03月21日  


<a name="匿名関数"></a>
# <b>匿名関数</b>
* [アロー関数](#アロー関数)を従来の匿名式に置き換えたもの
```
<script>
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

            //パブリック変数に匿名関数を代入（前方宣言が必要）
            this.hello = this.__american;
        }

        //匿名関数の入替え
        change(_language) {
            switch (_language) {
                case "american": this.hello = this.__american; break;
                case "japanese": this.hello = this.__japanese; break;
                case "chinese": this.hello = this.__chinese; break;
            }
        }
    }

    var _hello = new Hello();
    _hello.hello("TARO"); //"TARO,Hello!"
    _hello.change("japanese");
    _hello.hello("たかし"); //"たかし、こんにちは!"
    _hello.change("chinese");
    _hello.hello("たかし"); //"たかし, 你好!"
</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2017年03月21日  


<a name="アロー関数"></a>
# <b>アロー関数</b>
* [匿名関数](#匿名関数)をラムダ式に置き換えたバージョン
```
<script>
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

            //パブリック変数に匿名関数を代入（前方宣言が必要）
            this.hello = this.__american;
        }
        //匿名関数の入替え
        change(_language) {
            switch (_language) {
                case "american": this.hello = this.__american; break; 
                case "japanese": this.hello = this.__japanese; break;
                case "chinese": this.hello = this.__chinese; break;
            }
        }
    }

    var _hello = new Hello();
    _hello.hello("TARO"); //"TARO,Hello!"
    _hello.change("japanese");
    _hello.hello("たかし"); //"たかし、こんにちは!"
    _hello.change("chinese");
    _hello.hello("たかし"); //"たかし, 你好!"
</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2017年03月21日  


<a name="クラス定数･変数･メソッド"></a>
# <b>クラス定数･変数･メソッド</b>
* クラス定数･クラス変数･クラスメソッドは、クラスをインスタンス化せずにアクセスが可能
```
<script>
    class MyMath {
        //①クラス定数（静的定数）の定義（静的定数）
        static get PI() {
            return 3.141592653589793;
        }
        static set PI(newValue) {
            throw new Error("値の変更はできません");
        }

        //③静的メソッド（静的メソッド）の定義
        static pow(arg1, arg2) {
            if (arg2 == 0) { return 1; } //0乗対策
            var _result = arg1;
            for (let _i = 1; _i < arg2; _i++) {
                _result = _result * arg1;
            }
            return _result;
        }
    }

    //①クラス定数の参照
    console.log(MyMath.PI); //3.141592653589793
    //MyMath.PI = 3.14; //Error: 値の変更はできません

    //②クラス変数の参照および変更
    console.log(MyMath.lastUpdate); //undefined
    MyMath.lastUpdate = "2017-03-21"; //②クラス変数（静的変数）の定義
    console.log(MyMath.lastUpdate); //"2017-03-21"
    MyMath.lastUpdate = "2017-03-22"; //変更可能
    console.log(MyMath.lastUpdate); //"2017-03-22"

    //③静的メソッドの実行
    console.log(MyMath.pow(2, 0)); //1
    console.log(MyMath.pow(2, 8)); //256
</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2017年03月21日  


<a name="if文"></a>
# <b>if 文</b>

### 基本例文
* trueと評価される可能性が高い順に並べるとif文を早く抜け出せる可能性が高い
```
<script>
    var _age = 49;
    if (_age <= 20) {
        console.log("20歳以下");
    } else if (_age <= 40) {
        console.log("21〜40歳");
    } else if (_age <= 60) {
        console.log("41〜60歳"); //これが出力される
    } else {
        console.log("61歳以上");
    }
</script>
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
1. ^ 演算子を使う方法
    ```
    <script>
        var _a = true;
        var _b = false;
        if (_a ^ _b) {
            console.log("どちらか一方だけtrueです");
        } else {
            console.log("両方共にtrueかfalseです");
        }
    </script>
    ```

2. ^ 演算子を使わない場合
    ```
    <script>
        var _a = true;
        var _b = false;
        if ((_a || _b) && !(_a && _b)) {
            console.log("どちらか一方だけtrueです");
        } else {
            console.log("両方共にtrueかfalseです");
        }
    </script>
    ```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2017年03月21日  


<a name="三項演算子"></a>
# <b>三項演算子</b>

### 比較式が１つの場合
* 構文
```
データ型 変数名 = (比較式) ? (true時の返り値) : (false時の返り値);
```
* 例文
```
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script>
        var _age = 49;
        var _result = (_age < 60) ? "現役" : "退職";
        console.log(_result); //"現役"
    </script>
</head>
</html>
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
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script>
        var _age = 49;
        var _result = (_age < 20) ? "未成年" :
        _result = (_age < 60) ? "現役" :
        _result = "退職";
        console.log(_result); //"現役"
    </script>
</head>
</html>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2017年03月21日  


<a name="switch文"></a>
# <b>switch 文</b>

### 判別式が boolean 値ではない場合
```
<script>
    var _name = "TARO";
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
</script>
```

### 判別式が boolean 値の場合
* case 式に比較演算子が使われる
```
<script>
    var _age = 49;
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
</script>
```

### break文が無い使い方
* [C#](https://ja.wikipedia.org/wiki/C_Sharp) のようなフォールスルー禁止規則（何か処理をしておきながら break を書かないとエラー）は無い
```
<script>
    var _name = "JIRO";
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
</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2017年03月21日  


<a name="for文"></a>
# <b>for 文</b>

### ループカウンタの宣言方法
* 参考「[変数とスコープ](#変数とスコープ)」
1. let でループ制御変数を宣言する
    ```
    <script>
        for (let i = 0; i < 10; i++) {
            console.log(i); //0,1,2,3,4,5,6,7,8,9
        }
        console.log(i); //Error（for文の外では使えない）
    </script>
    ```

1. var でループ制御変数を宣言する
    ```
    <script>
        for (var i = 0; i < 10; i++) {
            console.log(i); //0,1,2,3,4,5,6,7,8,9
        }
        console.log(i); //10（for文の外でも有効）
    </script>
    ```

### ループカウンタを○つずつアップする
```
<script>
    for (let i = 0; i < 50; i += 5) { //5つずつアップする場合…
        console.log(i); //0,5,10,15,20,25,30,35,40,45
    }
</script>
```

### for 文のネスト
* ループ制御変数には慣例的に i, j, k が使われる
```
<script>
    for (let i = 1; i <= 5; i++) {
        for (let j = 1; j <= 5; j++) {
            console.log("x" + i + "y" + j); //x1y1,x1y2,....,x5y4,x5y5
        }
    }
</script>
```

### 無限ループと break 文
```
<script>
    var _count = 0;
    for (;;) { //①初期化②ループ判定式③更新処理の全てを省略する
        _count++;
        if (_count > 100) break; //ループを終了
        console.log(_count); //1,2,....,99,100
    }
    console.log("for文終了");
</script>
```

### for 文と continue 文
```
<script>
    for (let i = 1; i <= 20; i++) { //iは1,2,...19,20
        if ((i % 3) != 0) { //3で割り余りが0でない（＝3の倍数ではない）場合
            continue; //for文の残処理をスキップしてfor文の次の反復を開始する
        }
        console.log(i); //3,6,9,12,15,18 ←3の倍数
    }
</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2017年03月21日  


<a name="for...in文"></a>
# <b>for...in 文</b>

### 基本構文
```
for (変数名 in 配列等) {
    //配列の場合はインデックス番号、連想配列の場合はプロパティ名
    console.log(変数名);

    //配列の場合は要素の値、連想配列の場合はプロパティ値
    console.log(配列等[変数名]);
}
```

### 配列（1次元）の場合
```
<script>
    var _array = ["TARO", "HANAKO", "ICHIRO", "JIRO"];
    for (let _indexNum in _array) {
        console.log(_indexNum); //0→1→2→3
        console.log(_array[_indexNum]); //"TARO"→"HANAKO"→"ICHIRO"→"JIRO"
    }
</script>
```

### 配列（2次元）の場合
```
<script>
    var _array = [
        ["x0y0", "x1y0", "x2y0"], //0行目
        ["x0y1", "x1y1", "x2y1"]  //1行目
    ];
    for (let _indexNum in _array) {
        console.log(_indexNum); //0→1
        console.log(_array[_indexNum]); //["x0y0","x1y0","x2y0"]→["x0y1","x1y1","x2y1"]
    }
</script>
```

### 連想配列（Object＝オブジェクトリテラル）の場合
```
<script>
    var _object = { name: "Takashi Nishimura", age: 49 };
    for (let _propName in _object) {
        console.log(_propName); //name→age
        console.log(_object[_propName]); //"Takashi Nishimura" → 49
    }
</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2017年03月21日  


<a name="for...of文"></a>
# <b>for...of 文</b>

### 一次元配列（Array）の場合
```
<script>
    var _array = ["TARO", "HANAKO", "ICHIRO", "JIRO"];
    for (let _data of _array) {
        console.log(_data); //"TARO"→"HANAKO"→"ICHIRO"→"JIRO"
    }
</script>
```

### 二次元配列（Array）の場合
```
<script>
    var _array = [
        ["x0y0", "x1y0", "x2y0"], //0行目
        ["x0y1", "x1y1", "x2y1"]  //1行目
    ];
    for (let _theArray of _array) {
        console.log(_theArray); //["x0y0","x1y0","x2y0"]→["x0y1","x1y1","x2y1"]
    }
</script>
```

### 配列（Set）の場合
```
<script>
    var _set = new Set();
    _set.add("TARO");
    _set.add("HANAKO");
    for (let _data of _set) {
        console.log(_data); //"TARO"→"HANAKO"
    }
</script>
```

### 連想配列（Map）の場合
```
<script>
    var _map = new Map();
    _map.set("RYOMA", "1836-01-03");
    _map.set("YUKICHI", "1835-01-10");
    for (let [_key, _value] of _map) {
        console.log(_key, _value);
        //"RYOMA" "1836-01-03
        //"YUKICHI" "1835-01-10"
    }
</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2017年03月21日  


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
<script>
    var _i = 0;
    while (_i < 10) { //ループ判定式にはboolean値しか使えない
        console.log(_i); //0,1,2,3,4,5,6,7,8,9
        _i++;
    }
</script>
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
<script>
    var _i = 0;
    do {
        console.log(_i); //0 ←ループ判定式はfalseだが１回実行される
        _i++;
    } while (_i < 0);
</script>
```

### while文とbreak文
* 例文（1〜100までを出力）
```
<script>
    var _count = 0;
    while (true) { //ループ判別式をtrueにすると無限ループに
        _count++;
        if (_count > 100) {
            break; //break文を使ってループを終了（while文の次の行へ）
        }
        console.log(_count); //1,2,....,99,100
    }
</script>
```

### while 文と continue 文
* 例文（3の倍数を出力）
```
<script>
    var _i = 1;
    while (_i <= 20) {
        if ((_i % 3) != 0) { //3で割って余りが0ではない（＝3の倍数ではない）場合
            _i++;
            continue; //while文の残処理をスキップしてwhile文の次の反復を開始する
        }
        console.log(_i); //3,6,9,12,15,18 ←3の倍数
        _i++;
    }
</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2017年03月21日  


<a name="配列（Array）"></a>
# <b>配列（Array）</b>

### 作成
* new演算子を使う方法
    ```
    var _array = new Array(); //空の配列を作成
    var _array = new Array(4); //4つの空の要素（undefined）を持つ配列を作成
    var _array = new Array("A", "I");
    var _array = new Array(["A","あ"], ["I","い"]); //配列のネスト
    ```

* 配列リテラルを使う方法
    ```
    var _array = []; //空の配列を作成
    var _array = ["A", "I"];
    var _array = [["A","あ"], ["I","い"]]; //配列のネスト
    ```

### 要素の数
```
<script>
    var _array = ["00", "01", "02", "03"];
    console.log(_array.length); //4
</script>
```

### 追加（最後）
```
<script>
    var _array = ["ICHIRO", "JIRO"];
    _array.push("TARO"); //カンマ（,）を使って複数同時に追加可能
    console.log(_array); //["ICHIRO", "JIRO", "TARO"]
</script>
```

### 追加（先頭）
```
<script>
    var _array = ["ICHIRO", "JIRO"];
    _array.unshift("TARO"); //カンマ（,）を使って複数同時に追加可能
    console.log(_array); //["TARO", "ICHIRO", "JIRO"]
</script>
```

### 更新（任意の値）
```
<script>
    var _array = ["TAKASHI", "ICHIRO", "JIRO"];
    _array[0] = "TARO"; //0番目を変更する場合
    console.log(_array); //["TARO", "ICHIRO", "JIRO"]
</script>
```

### 更新（null 値）
```
<script>
    var _array = ["TARO", "ICHIRO", "JIRO"];
    _array[0] = null;
    console.log(_array); //[null, "ICHIRO", "JIRO"]
</script>
```

### 削除（最後）
```
<script>
    var _array = ["ICHIRO", "JIRO", "TARO"];
    console.log(_array.pop()); //"TARO"（削除した要素を返す）
    console.log(_array); //["ICHIRO", "JIRO"]
</script>
```

### 削除（最初）
```
<script>
    var _array = ["TARO", "ICHIRO", "JIRO"];
    console.log(_array.shift()); //"TARO"（削除した要素を返す）
    console.log(_array); //["ICHIRO", "JIRO"]
</script>
```

### 削除（○番目から□個）
```
<script>
    var _array = ["00", "01", "02", "03", "04", "05"];
    console.log(_array.splice(3, 2)); //["03", "04"]
    console.log(_array) //["00", "01", "02", "05"]
</script>
```

### 削除（○番目から全て）
```
<script>
    var _array = ["00", "01", "02", "03", "04", "05"];
    console.log(_array.splice(3)); //["03", "04", "05"]
    console.log(_array) //["00", "01", "02"]
</script>
```

### 抽出（○番目から□番目）
```
<script>
    var _array = ["00", "01", "02", "03", "04", "05"];
    console.log(_array.slice(2, 4)); //["02", "03"]（4番目は含まず）
    console.log(_array) //["00", "01", "02", "03", "04", "05"]（元配列に変化なし）
</script>
```

### 抽出（○番目から全て）
```
<script>
    var _array = ["00", "01", "02", "03", "04", "05"];
    console.log(_array.slice(2)); //["02", "03", "04", "05"]
    console.log(_array) //["00", "01", "02", "03", "04", "05"]（元配列に変化なし）
</script>
```

### 検索(前から）
* 第2引数番目から、後ろに向かって検索（最初に見つかったインデックス番号を返す）
```
<script>
    var _array = ["A", "B", "C", "D", "E", "F", "D"];
    console.log(_array.indexOf("D", 0)); //3（見つからない場合「-1」を返す）
</script>
```

### 検索（後ろから）
* 第2引数番目から、前に向かって検索（最初に見つかったインデックス番号を返す）
```
<script>
    var _array = ["A", "B", "C", "D", "E", "F", "D"];
    console.log(_array.lastIndexOf("D")); 
    //6（第2引数を省略すると _array.length と同じ）
</script>
```

### 並べ替え（反転）
```
<script>
    var _array = ["00", "01", "02", "03", "04", "05"];
    console.log(_array.reverse()); //["05", "04", "03", "02", "01", "00"]
    console.log(_array) //["05", "04", "03", "02", "01", "00"]（元配列も変更）
</script>
```

### 並べ替え（ソート）
```
<script>
    var _array = ["C", "02", "A", "01", "03", "B"];
    console.log(_array.sort()); //["01", "02", "03", "A", "B", "C"]
    console.log(_array) //["01", "02", "03", "A", "B", "C"]（元配列も変更）
</script>
```

### 結合
```
<script>
    var _array1 = ["A", "B", "C"];
    var _array2 = ["D", "E", "F"];
    var _array3 = _array1.concat(_array2);
    console.log(_array3) //["A", "B", "C", "D", "E", "F"]
</script>
```

### 複製
```
<script>
    var _original = ["A", "B", "C"];
    var _copy = _original.concat(); //複製

    //実験（参照コピーではなく複製されているか否か）
    _original[0] = "あ";
    console.log(_original[0], _copy[0]); //"あ" "A"（参照コピーではない）
</script>
```

### 文字列→配列
```
<script>
    var _string = "A,B,C,D,E,F";
    var _array = _string.split(","); //カンマ区切りで配列化
    console.log(_array); //["A", "B", "C", "D", "E", "F"]
</script>
```

### 全要素を取り出す
```
<script>
    var _array = ["A", "B", "C", "D", "E", "F"];
    _array.forEach(function(arg) {
        console.log(arg); //"A"→"B"→"C"→"D"→"E"→"F"
    });
</script>
```
* for文、for...in文を使う方法もあり（参照「[for...in 文](#for...in文)」）

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2017年03月21日  


<a name="配列（Set）"></a>
# <b>配列（Set）</b>

* 配列（Array）と異なりデータの重複ができない
```
<script>
    //①作成
    var _set = new Set();

    //②データの追加
    _set.add("ICHIRO");
    _set.add("JIRO");

    //参考：既存データの追加
    _set.add("ICHIRO"); //無視される

    //③データの数
    console.log(_set.size); //2

    //④全てのデータの取得
    for (let _data of _set) {
        console.log(_data);
        //"ICHIRO"
        //"JIRO"
    }

    //⑤データがあるか否か
    console.log(_set.has("TARO")); //false
    console.log(_set.has("ICHIRO")); //true

    //⑥データの削除
    _set.delete("ICHIRO");
</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2017年03月22日  


<a name="連想配列（Object）"></a>
# <b>連想配列（Object）</b>

```
<script>
    //①作成
    var _object = new Object();
    //他にも {プロパティ名①:値, プロパティ名②:値} という方法もある

    //②プロパティの追加（更新も同じ方法）
    _object.name = "Takashi Nishimura";
    _object.age = 49;

    //③関数の追加
    _object.hello = function() {
        return "Hello! How are you?";
    }

    //④プロパティの参照
    console.log(_object.name); //"Takashi Nishimura"
    console.log(_object["name"]); //配列演算子[]を使うことも可能
    console.log(_object.age); //49

    //⑤関数の実行
    console.log(_object.hello()); //"Hello! How are you?"

    //⑥全ての要素の取得
    for (let _propName in _object) {
        console.log(_propName + " : " + _object[_propName]);
    }
    //name : Takashi Nishimura
    //age : 49
    //hello : function() {...
</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2017年03月22日  


<a name="連想配列（Map）"></a>
# <b>連想配列（Map）</b>

### [Object](http://bit.ly/2nkyLU0) との違い
1. キーに文字列以外でも使える
1. データの個数を調べるプロパティが用意されている
1. Object オブジェクトを継承していない（クリーンな連想配列の生成が可能）

### 例文
```
<script>
    //①作成
    var _map = new Map();

    //②データの追加
    _map.set("RYOMA", "1836-01-03");
    _map.set("YUKICHI", "1835-01-10");

    //③データの数
    console.log(_map.size); //2

    //④データの取得
    console.log(_map.get("RYOMA")); //"1836-01-03"
    console.log(_map.get("YUKICHI")); //"1835-01-10"

    //⑤全てのデータの取得
    for (let [_key, _value] of _map) {
        console.log(_key, _value);
        //"RYOMA" "1836-01-03"
        //"YUKICHI" "1835-01-10"
    }

    //⑥データがあるか否か
    console.log(_map.has("SHINSAKU")); //false
    console.log(_map.has("RYOMA")); //true

    //⑦データの削除
    _map.delete("RYOMA");
</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2017年03月22日  


<a name="this"></a>
# <b>this</b>

### トップレベルの this
```
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script>
        document.write(this); //[object Window]（＝window／省略可能）
    </script>
</head>
</html>
```
* \<script src="xxx.js">\</script> として外部の xxx.js を読み込んだ場合も同様

### クラス内の this
```
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script>
        class MyClass {
            constructor() {
                document.write(this); //[object Object]（MyClassのインスタンス）
                this.__hoge = "擬似プライベート変数"; //thisは省略不可
            }
            get hoge() { //アクセサ（getter）
                return this.__hoge; //thisは省略不可
            }
        }
        var _myClass = new MyClass();
        console.log(_myClass.hoge); //"擬似プライベート変数"
    </script>
</head>
</html>
```

* クラス内では this / var / let / const の何れかを指定する必要があり省略は不可

### イベントハンドラメソッド内の this
* 概要  
独自クラスを作成し、JavaScript 標準のイベント（mousedown 等）のイベントリスナーを記述した場合、リスナー関数内で自分自身（＝クラス）を参照したい場合がよくあります。しかし、this はイベントリスナーの対象となるオブジェクトを参照します。そこでワンクション置くことでクラスを参照できるようにしたのが以下のサンプルです。

* 例文
```
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script>
        class MyClass {
            constructor() {
                this.__image = document.getElementById("image");

                //イベントハンドラメソッド内でthis==Canvasオブジェクトとする為
                this.__mousedown_image = (_e) => { 
                    this.__mousedown_image_method(_e);
                }

                //Image用イベントハンドラの定義
                this.__image.addEventListener("mousedown", this.__mousedown_image, false);
            }

            //MyClass.__mousedown_image（アロー関数）からの呼出し
            __mousedown_image_method(_mouseEvent) {
                console.log(this); //MyClass
            }
        }
        addEventListener("load", load_window, false);
        function load_window() {
            new MyClass();
        }
    </script>
</head>

<body>
    <img id="image" src="sample.png">
</body>
</html>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2017年03月22日  


<a name="文字列の操作"></a>
# <b>文字列の操作</b>

### 文字列の生成
```
var 変数 = new String("xxx"); //object型
var 変数 = "xxx"; //string型
```
* 上記2つは厳密には異なるが通常は意識する必要はない

### 文字列の長さを調べる
```
<script>
    var _string = "ABCDE";
    console.log(_string.length); //5
</script>
```

### 一部分を取得
```
<script>
    var _string = "0123456789";
    console.log(_string.substr(0, 1)); //"0" ←0文字目（先頭）〜1文字取得
    console.log(_string.substr(-1, 1)); //"9" ←後ろから1文字目〜1文字取得
    console.log(_string.substr(4)); //"456789" ←4文字目（0から開始）〜全て取得
    console.log(_string.substr(4, 3)); //"456" ←4文字目（0から開始）〜3文字取得
</script>
```

### 置換
```
<script>
    var _string = "2017年3月22日";
    var _regExp = new RegExp("2017", "g"); //第2引数を省略すると全てを置換（"g"と同等）
    console.log(_string.replace(_regExp, "平成29")); //平成29年3月22日
</script>
```

### 検索
```
<script>
    var _string = "ABCDEFG-ABCDEFG";
    var _count = 0;
    while (_string.indexOf("CD", _count) != -1) { //見つからないと-1を返す
        var _num = _string.indexOf("CD", _count);
        console.log(_num); //2,10 ←…"CD"が見つかった場所（0から開始）を返す
        _count = _num + 1;
    }
</script>
```
* 最後から検索する String.lastIndexOf() もあり

### 文字列→配列
```
<script>
    var _string = "A,B,C,D,E,F";
    var _array = _string.split(","); //カンマ区切りで配列化
    console.log(_array); //["A", "B", "C", "D", "E", "F"]
</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2017年03月22日  


<a name="正規表現"></a>
# <b>正規表現</b>

* ECMAScript 6 には以下のサンプル以外にも多くの正規表現の機能が用意されています

### 検索＆置換
```
<script>
    var _string = "吉田松蔭,高杉晋作,久坂玄瑞,吉田稔麿,伊藤博文";
    var _regExp = new RegExp("吉田", "g"); //第2引数を省略すると全てを置換（"g"と同等）
    /*
    "^○○$"のように「^（行頭マッチ）」「$（行末マッチ）」といったメタ文字の他、様々なパターン、例えば "[A-D]\d+" など…を使うことでより細かな制御が可能
    */
    if (_regExp.test(_string)) { //検索
        console.log('"吉田"は含まれています');
        let _result = _string.replace(_regExp, "よしだ"); //置換
        //よしだ松蔭,高杉晋作,久坂玄瑞,よしだ稔麿,伊藤博文"
        console.log(_result);
    } else {
        console.log('"吉田"は含まれていません');
    }
</script>
```

### マッチした数
```
<script>
    var _string = "059371820400381295700347891205178900517093823";
    var _regExp = new RegExp("00", "g"); //第2引数を省略すると全てを置換（"g"と同等）
    var _matchList = _string.match(_regExp);
    console.log(_matchList); //["00", "00", "00"]
    console.log(_matchList.length); //3（マッチした数）
</script>
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

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2017年03月22日  


<a name="抽象クラス"></a>
# <b>抽象クラス</b>

### 概要
* ECMAScript 6 には、TypeScript（1.6〜）にある abstract や interface キーワードはない
* ECMAScript 6 では、継承と例外処理によって擬似的な抽象クラスを実現

### 構文
```
//（擬似）抽象クラスの定義
class Abstract○○ {
    抽象メソッド名(引数①,引数②,...) {
        throw new Error("派生クラスで実装して下さい"); //例外処理
    }
}

//（擬似）抽象クラスの継承
class 派生クラス名 extends Abstract○○ {
    抽象メソッド名(引数①,引数②,...) {
        //実際の処理はここに記述
    }
}
```

### 例文
```
<script>
    class AbstractClass { //（擬似）抽象クラスの定義
        commonMethod() { //共通のメソッド
            console.log("AbstractClass.commonMethod()");
        }
        eachMethod() { //抽象メソッド（実際の処理は記述しない）
            throw new Error("サブクラスで実装して下さい"); //例外処理
        }
    }
    class SubClass extends AbstractClass { //（擬似）抽象クラスの継承
        eachMethod() { //オーバーライドして実際の処理を記述
            console.log("SubClass.eachMethod()"); //実際の処理
        }
    }

    var _subClass = new SubClass();
    _subClass.commonMethod(); //"AbstractClass.commonMethod()"
    _subClass.eachMethod(); //"SubClass.eachMethod()"
</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2017年03月22日  


<a name="superキーワード"></a>
# <b>super キーワード</b>

```
<script>
    //スーパークラス
    class SuperClass {
        constructor(arg) { //コンストラクタ
            console.log("SuperClass.constructor : " + arg);
        }
        methodSuper(arg) {
            console.log("SuperClass.methodSuper : " + arg);
        }
    }

    //サブクラス
    class SubClass extends SuperClass { //スーパークラスを継承
        constructor() { //コンストラクタ
            //↓スーパークラスのコンストラクタの呼び出し（必須）
            super("from SubClass");
            //↑サブクラスのコンストラクタ内であれば冒頭でなくても可能
        }
        methodSub() {
            //↓スーパークラスのメソッドを呼び出すことが可能
            super.methodSuper("from SubClass");
        }
    }

    //実行
    var _subClass = new SubClass(); 
    //=> "SuperClass.constructor : from SubClass"

    _subClass.methodSub(); 
    //=>"SuperClass.methodSuper : from SubClass"
</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2017年03月22日  


<a name="オーバーライド"></a>
# <b>オーバーライド</b>

### 概要
* スーパークラスで定義したメソッドをサブクラスで再定義することをオーバーライドと呼ぶ
* スーパークラスのメソッドを呼び出したい場合は、super.メソッド名() とする
* （擬似）[抽象クラス](http://bit.ly/2nkzAwa)でもこの方法を活用

### 例文
```
<script>
    //スーパークラス
    class SuperClass {
        //↓サブクラスでオーバライドするメソッド
        myMethod() {
            console.log("SuperClass.myMethod()");
        }
    }

    //サブクラス
    class SubClass extends SuperClass { //スーパークラスを継承
        //↓スーパークラスにある同名のメソッドを再定義＝オーバーライド
        myMethod() {
            //super.myMethod(); //スーパークラス内の同名のメソッドを呼び出す場合
            console.log("SubClass.myMethod()");
        }
    }

    //実行
    var _subClass = new SubClass();
    _subClass.myMethod();
</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2017年03月22日  


<a name="カスタムイベント"></a>
# <b>カスタムイベント</b>

### 概要
JavaScript に実装されている ○.dispatchEvent() や ○.addEventListener() のターゲットに指定できるオブジェクトは Window、XMLHttpRequest、HTMLCanvasElement、ドキュメント上の単一のノード、ドキュメント自身などに限られるため、用途が限定されます。それとは異なりここで紹介する方法は、他の言語でも利用可能な汎用的な方法です。

### 例文
```
<script>
    class Robot { //イベントを設定するクラス
        constructor() { 
            this.__energy = 80;
        }

        addEventListener(_event, _function) {
            if (_event == "die") {
                this.__dieHandler = _function; //匿名関数を変数に格納
            } else {
                //該当のイベントが無い場合、実行時にErrorを発生（オプション）
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

    var die_robot = (arg) => { //リスナー関数（前方宣言が必要）
        console.log(arg); //Robotクラスのインスタンス
        alert("GAME OVER");
    }

    var _robot = new Robot();
    _robot.addEventListener("die", die_robot); //イベントリスナーの設定
    _robot.fight();
    _robot.fight();
    _robot.fight();
    _robot.fight(); //"GAME OVER"
</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2017年03月22日  


<a name="数学関数（Math）"></a>
# <b>数学関数（Math）</b>

### Math.sin() : サイン（正弦）
```
<script>
    console.log(Math.sin(0)); //0（0°）
    console.log(Math.sin(Math.PI / 2)); //1（90°）
    console.log(Math.sin(Math.PI)); //1.2246467991473532e-16（≒0）（180°）
    console.log(Math.sin(Math.PI * 3 / 2)); //-1（270°）
    console.log(Math.sin(Math.PI * 2)); //-2.4492935982947064e-16（≒0）（360°）
</script>
```

### Math.cos() : コサイン（余弦）
```
<script>
    console.log(Math.cos(0)); //1（0°）
    console.log(Math.cos(Math.PI / 2)); //6.123233995736766e-17（≒0）（90°）
    console.log(Math.cos(Math.PI)); //-1（180°）
    console.log(Math.cos(Math.PI * 3 / 2)); //-1.8369701987210297e-16（≒0）（270°）
    console.log(Math.cos(Math.PI * 2)); //1 ←…360°
</script>
```

### Math.atan2() : アークタンジェント2
```
<script>
    //三角形の各辺が1:2:√3の場合に2:√3の間の角度は30°であることの検証
    var _disX = Math.sqrt(3); //√3のこと
    var _disY = 1;
    console.log(Math.atan2(_disY, _disX)); //0.5235987755982989（ラジアン）
    console.log(180 * Math.atan2(_disY, _disX) / Math.PI); //30.000000000000004（度）
</script>
```

### Math.PI : 円周率
```
<script>
    console.log(Math.PI); //3.141592653589793
</script>
```

### Math.floor() : 切り捨て
```
<script>
    console.log(Math.floor(1.001)); //1
    console.log(Math.floor(1.999)); //1
</script>
```

### Math.ceil() : 切り上げ
```
<script>
    console.log(Math.ceil(1.001)); //2
    console.log(Math.ceil(1.999)); //2
</script>
```

### Math.round() : 四捨五入
```
<script>
    console.log(Math.round(1.499)); //1
    console.log(Math.round(1.500)); //2
</script>
```

### Math.abs() : 絶対値
```
<script>
    console.log(Math.abs(100)); //100
    console.log(Math.abs(-100)); //100
</script>
```

### Math.pow() : 累乗（○の□乗）
```
<script>
    console.log(Math.pow(2, 0)); //1（2の0乗）
    console.log(Math.pow(2, 8)); //256（2の8乗）
</script>
```

### Math.sqrt() : 平方根（√○）
```
<script>
    console.log(Math.sqrt(2)); //1.4142135623730951（一夜一夜にひとみごろ）
    console.log(Math.sqrt(3)); //1.7320508075688772（人並みに奢れや）
    console.log(Math.sqrt(4)); //2
    console.log(Math.sqrt(5)); //2.23606797749979（富士山麓オウム鳴く）
</script>
```

### Math.max() : 比較（最大値）
```
<script>
    console.log(Math.max(5.01, -10)); //5.01（2つの数値の比較）
</script>
```

### Math.min() : 比較（最小値）
```
<script>
    console.log(Math.min(5.01, -10)); //-10（2つの数値の比較）
</script>
```

### Math.sign() : 符号（正か負の値か）
```
<script>
    console.log(Math.sign(-0.1)); //-1（負の値）
    console.log(Math.sign(0)); //0（0）
    console.log(Math.sign(0.1)); //1（正の値）
</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2017年03月22日  

<a name="乱数"></a>
# <b>乱数</b>

### Math.random()
* 0以上、1未満（0.9999…）の値を返す
* 現在時刻を元に random seed （乱数種）を生成
```
<script>
    console.log(Math.random()); //0.13397585139675616
    console.log(Math.random()); //0.9903535518676447
    console.log(Math.random()); //0.006009885271453852
</script>
```

### 整数の乱数
```
<script>
    //整数の乱数を返すカスタム関数
    randomInt = (_min, _max) => {
        return Math.floor(Math.random() * (_max - _min + 1)) + _min;
    }

    //実験（1000万回繰返して精度を調べる）
    var _u5 = 0, _u4 = 0, _u3 = 0, _u2 = 0, _u1 = 0;
    var _o0 = 0, _o1 = 0, _o2 = 0, _o3 = 0, _o4 = 0, _o5 = 0;

    for (let i = 0; i < 10000000; i++) {
        switch (this.randomInt(-5, 5)) {
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

    console.log(_u5, _u4, _u3, _u2, _u1, _o0, _o1, _o2, _o3, _o4, _o5);
    //909595 908581 908332 909483 907921 908880 909161 909607 909295 910453 908692
</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2017年03月22日  


<a name="日時情報"></a>
# <b>日時情報</b>

### 書式
```
var xxx = new Date();
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
<script>
    var _date = new Date();
    console.log(_date); //Wed Mar 22 2017 09:33:39 GMT+0900 (JST)
    console.log(_date.getFullYear()); //2017
    console.log(_date.getMonth()); //2（3月）
    console.log(_date.getDate()); //22
    console.log(_date.getDay()); //3（水曜日）
    console.log(_date.getHours()); //09
    console.log(_date.getMinutes()); //33
    console.log(_date.getSeconds()); //39
    console.log(_date.getMilliseconds()); //559
    //"hh:mm:ss"で現在の時間を表示する方法
    var _h = (_date.getHours() < 10) ? "0" + _date.getHours() : _date.getHours();
    var _m = (_date.getMinutes() < 10) ? "0" + _date.getMinutes() : _date.getMinutes();
    var _s = (_date.getSeconds() < 10) ? "0" + _date.getSeconds() : _date.getSeconds();
    console.log(_h + ":" + _m + ":" + _s); //"09:33:39"
</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2017年03月22日  


<a name="タイマー"></a>
# <b>タイマー</b>

### 繰返し実行する
```
<script>
    _count = 0;
    callbackFunction = () => {
        if (++_count <= 10) { //10回繰返す場合…
            console.log(_count, "繰返し実行したい処理");
        } else {
            clearInterval(_timerID); //繰返しを止める
        }
    }
    //↓第3引数を使ってデータをcallbackFunctionの引数として送信することも可能
    _timerID = setInterval(callbackFunction, 1000); //1秒間隔で繰返す場合
</script>
```

### 一度だけ実行する
```
<script>
    callbackFunction = () => {
        console.log("一度だけ実行したい処理");
        clearTimeout(_timerID);
    }
    _timerID = setTimeout(callbackFunction, 1000); //1秒後に1回実行する場合
</script>
```

### XX 秒後にA、そのXXX 秒後にB...を実行
* [Promise](https://mzl.la/2nHNs4B) でも同様のことが可能と思われる
```
<script>
    //Task○のスーパークラス
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

    //TaskAクラス
    class TaskA extends SuperTask {
        static __callBack() {
            var _this = TaskA;
            //TaskAで実行したいことをここに記述
            console.log(_this.delay + "ミリ秒後にTaskAで実行すること");
            if (_this.nextTask != undefined) { _this.nextTask.exec(); }
        }
    }

    //TaskBクラス
    class TaskB extends SuperTask {
        static __callBack() {
            var _this = TaskB;
            //TaskBで実行したいことをここに記述
            console.log(_this.delay + "ミリ秒後にTaskBで実行すること");
            if (_this.nextTask != undefined) { _this.nextTask.exec(); }
        }
    }

    //TaskCクラス
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
    TaskB.delay = 3000;
    TaskC.delay = 10000;

    //次のタスクの設定（初期値は未設定）
    TaskA.nextTask = TaskB;
    TaskB.nextTask = TaskC;

    TaskA.exec(); //実行開始

</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2017年03月22日  


<a name="処理速度計測"></a>
# <b>処理速度計測</b>

### Dateオブジェクトを使う方法
```
<script>
    var _start = new Date().getTime(); //1970年からの経過時間（ミリ秒）
    for (let i = 0; i < 1000000000; i++) { //10億回繰返す
        //速度計測したい処理
    }
    var _end = new Date().getTime();
    console.log(_end - _start); //3643（ミリ秒）
</script>
```

### console.time() を使う方法
* 処理時間の計測に利用可能（推奨）
* ページ毎に10000個のタイマーが使用可能
* 各タイマーにはユニーク（唯一）な識別子を付けて使用。使用後は同じ識別子を引数として console.timeEnd() を実行することで経過時間が出力
    ```
    <script>
        console.time("timerA");
        for (let i = 0; i < 1000000000; i++) { //10億回繰返す
            //速度計測したい処理
        }
        console.timeEnd("timerA"); //"timerA: 3628.869ms"
    </script>
    ```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2017年03月22日  



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
<script>
    //①XMLHttpRequestオブジェクトの生成
    var _request = new XMLHttpRequest(); //Webサーバ上で動作

    //②イベントハンドラの定義
    _request.onload = function() {
        console.log(this.responseText); //⑤読み込んだテキストの表示
    }

    //③ヘッダの設定
    _request.open("GET", "sample.txt");

    //④リクエストの送信
    _request.send(null);
</script>
```

### テキストファイルの解析
* 読み込んだ XMLHttpRequest.responseText の解析は次の関数/メソッドを利用する
    * CSV形式の場合 : convertCSVtoArray(XMLHttpRequest.responseText)
    * JSON形式の場合 : JSON.parse(XMLHttpRequest.responseText)

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2017年03月22日  
