# <b>TypeScript 基礎文法</b>

### <b>INDEX</b>

* Hello,world! （[Linux](https://github.com/mubirou/HelloWorld/blob/master/languages/TypeScript/TypeScript_linux.md) / [macOS](https://github.com/mubirou/HelloWorld/blob/master/languages/TypeScript/TypeScript_mac.md) / [Windows](https://github.com/mubirou/HelloWorld/blob/master/languages/TypeScript/TypeScript_win.md)）
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
* [クラス定数･クラスメソッド](#クラス定数･クラスメソッド)
* [if 文](#if文)
* [三項演算子](#三項演算子)
* [switch 文](#switch文)
* [for 文](#for文)
* [for...in 文](#for...in文)
* [for...of 文](#for...of文)
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
1. string（文字列）
1. object（全てのオブジェクトのベース）
1. undefined（未初期化変数）
1. function/Function（関数）  
* 他にも null、any が利用可能

### 例文
```
//xxx.ts
//①boolean（論理型）
var _boolean: boolean = true;
console.log(_boolean, typeof _boolean); //true, "boolean"


//②number（整数･浮動小数点数） ※NaNも"number"型
var _number: number = 9007199254740998;
//-9007199254740998〜9007199254740998（約±9000兆）まで扱える
console.log(_number, typeof _number); //9007199254740998, "number"

var _number2: number = 3.14159265358979323846264338327;
console.log(_number2, typeof _number2); //3.141592653589793, "number"


//③string（文字列）
var _string: string = "いろは"; //シングルまたはダブルクォーテーションで囲む
console.log(_string, typeof _string); //"いろは", "string"


//④object（全てのオブジェクトのベース）
var _boolean2: object = new Boolean(true);
console.log(typeof _boolean2); //"object"（"boolean"ではない）

var _number3: object = new Number(1);
console.log(typeof _number3); //"object"（"number"ではない）

var _string2: object = new String("1");
console.log(typeof _string2); //"object"（"string"ではない）

var _array: object = ["A", "B", "C"]; //配列（Array）
console.log(typeof _array); //"object"

var _object: object = { name: "TARO", age: 49 }; //連想配列
console.log(typeof _object); //"object"

var _hoge2: null = null; //null（データ不在）
console.log(_hoge2, typeof _hoge2); //null, "object"

class MyClass { } //クラス（前方宣言が必要）
var _myClass: MyClass = new MyClass();
console.log(typeof _myClass); //"object"


//⑤undefined（未初期化変数）
var _hoge: any; //変数宣言したのみで値が設定されていない場合
console.log(_hoge, typeof _hoge); //undefined, "undefined"


//⑥function（関数）
var _function: Function = function () {}; //匿名関数
console.log(typeof _function); //"function"

var _function2: Function = () => {}; //アロー関数
console.log(typeof _function2); //"function"
```

実行環境：Ubuntu 16.04 LTS、Chromium 56、TypeScript 2.2.1  
作成者：MUBIROU  
作成日：2017年03月25日  


<a name="データ型の操作"></a>
# <b>データ型の操作</b>

### データ型を調べる①
（ typeof 演算子 ＝ データ型を文字列で返す）

```
//xxx.ts
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
var _hoge: any;
console.log(typeof _hoge); //"undefined"

//⑥function（関数）
console.log(typeof function() {}); //"function"
```

### データ型を調べる②
（ instanceof 演算子 ＝ データ型が一致するか boolean 型で返す）

```
//xxx.ts
//①boolean（論理型）
//console.log(true instanceof Boolean); //error（false）
console.log(new Boolean(true) instanceof Boolean); //true

//②number（整数･浮動小数点数）
//console.log(1 instanceof Number); //error（false）
console.log(new Number(1) instanceof Number); //true

//③string（文字列）
//console.log("あ" instanceof String); //error（false）
console.log(new String("あ") instanceof String); //true

//④object（全てのオブジェクトのベース）
console.log({name:"TARO"} instanceof Object); //true
console.log(new Object() instanceof Object); //true

//⑤function（関数）
console.log(function() {} instanceof Function); //true
```

### データ型のキャスト（変換）
```
//xxx.ts
//①数値→boolean型
var _boolean: boolean = Boolean(1);
console.log(_boolean, typeof _boolean); //true, "boolean"

//②boolean型→number型
var _number1: number = Number(true);
console.log(_number1, typeof _number1); //1（falseの場合は0）, "number"

//③文字列→number型
var _number2: number = Number("3.14");
console.log(_number2, typeof _number2); //3.14, "number"

var _number3: number = parseInt("3.14"); //小数点以下を切り捨てて整数化
console.log(_number3, typeof _number3); //3, "number"

var _number4: number = parseFloat("3.14です。"); //数字以外を含む値
console.log(_number4, typeof _number4); //3.14, "number"

//④数値→string型
var _string1: string = String(100); //(100).toString() でも同じ
console.log(_string1, typeof _string1); //"100", "string"

//⑤配列→string型
var _string2: string = String(["TARO", 49]);
console.log(_string2, typeof _string2); //"TARO,49", "string"
```

実行環境：Ubuntu 16.04 LTS、Chromium 56、TypeScript 2.2.1  
作成者：MUBIROU  
作成日：2017年03月25日  


<a name="クラス"></a>
# <b>クラス</b>

```
//xxx.ts
//長方形クラス
class Rectangle { //前方宣言が必要
    //プロパティ群の初期値の設定
    private _width: number = 0;
    private _height: number = 0;

    //コンストラクタ
    constructor(_width: number = 640, _height: number = 480) { 
        this._width = _width;
        this._height = _height;
    }

    //アクセサ（getter/setter）
    public get width(): number {
        return this._width;
    }
    public set width(_newValue: number) {
        this._width = _newValue;
    }

    public get height(): number {
        return this._height;
    }
    public set height(_newValue: number) {
        this._height = _newValue;
    }

    //面積を計算して値を返す
    public getArea(): number {
        return this._width * this._height;
    }
}

//①インスタンスの作成
var _rectangle: Rectangle = new Rectangle();

//②プロパティの確認と変更
console.log(_rectangle.width, _rectangle.height); //640, 480
_rectangle.width = 1920;
_rectangle.height = 1080;
console.log(_rectangle.width, _rectangle.height); //1920, 1080

//③メソッドの実行
console.log(_rectangle.getArea()); //2073600
```

実行環境：Ubuntu 16.04 LTS、Chromium 56、TypeScript 2.2.1  
作成者：MUBIROU  
作成日：2017年03月26日  


<a name="スーパークラスとサブクラス"></a>
# <b>スーパークラスとサブクラス</b>

```
//xxx.ts
/****************************************************
スーパークラス
****************************************************/
class SuperClass {
    //プロパティの設定
    private _pSuperClass: string = "スーパークラスのプロパティ";

    //コンストラクタ
    constructor() {}

    //アクセサの定義（setterは省略）
    public get pSuperClass(): string { //publicは省略可能
        return this._pSuperClass;
    }

    //メソッドの定義
    public mSuperClass(): string { //publicは省略可能
        return "スーパークラスのメソッド";
    }
}

/****************************************************
サブクラスＡ（スーパークラスを継承／多重継承は不可）
****************************************************/
class SubClassA extends SuperClass { //スーパークラスを継承
    //プロパティの定義
    private _pSubClassA = "サブクラスＡのプロパティ";

    //コンストラクタ
    constructor() {
        super(); //必須
    }

    //アクセサの定義（setterは省略）
    public get pSubClassA(): string { //publicは省略可能
        return this._pSubClassA;
    }

    //メソッドの定義
    public mSubClassA(): string { //publicは省略可能
        return "サブクラスＡのメソッド";
    }
}

/****************************************************
サブクラスＢ（スーパークラスを継承／多重継承は不可）
****************************************************/
class SubClassB extends SuperClass { //スーパークラスを継承
    //プロパティの定義
    private _pSubClassB = "サブクラスＢのプロパティ";

    //コンストラクタ
    constructor() {
        super(); //必須
    }

    //アクセサの定義（setterは省略）
    public get pSubClassB(): string { //publicは省略可能
        return this._pSubClassB;
    }

    //メソッドの定義
    public mSubClassB(): string { //publicは省略可能
        return "サブクラスＢのメソッド";
    }
}

/****************************************************
実行
****************************************************/
var _subclassA: SubClassA = new SubClassA();
console.log(_subclassA.pSuperClass); //"スーパークラスのプロパティ"
console.log(_subclassA.pSubClassA); //"サブクラスＡのプロパティ"
console.log(_subclassA.mSuperClass()); //"スーパークラスのメソッド"
console.log(_subclassA.mSubClassA()); //"サブクラスＡのメソッド"

var _subclassB: SubClassB = new SubClassB();
console.log(_subclassB.pSuperClass); //"スーパークラスのプロパティ"
console.log(_subclassB.pSubClassB); //"サブクラスＢのプロパティ"
console.log(_subclassB.mSuperClass()); //"スーパークラスのメソッド"
console.log(_subclassB.mSubClassB()); //"サブクラスＢのメソッド"
```

実行環境：Ubuntu 16.04 LTS、Chromium 56、TypeScript 2.2.1  
作成者：MUBIROU  
作成日：2017年03月26日  


<a name="名前空間"></a>
# <b>名前空間</b>

* 内部モジュールを利用して名前の衝突を抑止します

```
//xxx.ts
module myLibrary {
    /**************************
    myLibrary.SuperClassクラス
    **************************/
    export class SuperClass {
        private _pSuperClass: string = "スーパークラスのプロパティ";

        //コンストラクタ
        constructor() {}

        //アクセサ（publicは省略可能）
        public get myProperty(): string {
            return this._pSuperClass;
        }
        public set myProperty(_newValue) {
            this._pSuperClass = _newValue
        }
    }

    /**************************
    myLibrary.MyClassクラス
    **************************/
    export class MyClass extends SuperClass { //継承も可能
        constructor() {
            super();
            console.log("new myLibrary.MyClass");
        }
        public MyClassMethod(): void { //publicは省略可能
            console.log("myLibrary.MyClass.MyClassMethod()");
        }
    }
}

//実行
var _myClass = new myLibrary.MyClass(); //"new myLibrary.MyClass"
_myClass.MyClassMethod(); //"myLibrary.MyClass.MyClassMethod()"
_myClass.myProperty = "hoge";
console.log(_myClass.myProperty); //"hoge"
```

実行環境：Ubuntu 16.04 LTS、Chromium 56、TypeScript 2.2.1  
作成者：MUBIROU  
作成日：2017年03月26日  


<a name="継承と委譲"></a>
# <b>継承と委譲</b>

### 概要

* GoF デザインパターンの [Adapter パターン](http://bit.ly/2naab8x)等で利用される
* 継承の場合は <b>extends クラス名</b> を使い、委譲の場合は <b>new クラス名()</b> を使ってオブジェクトを生成し、他のクラスの機能を利用する

### 継承版

```
//xxx.ts
//ClassAクラス
class ClassA { //委譲と同じ
    //コンストラクタ
    constructor() {}

    public myMethod(): void {
        console.log("ClassA.myMethod♥");
    }
}

//ClassBクラス
class ClassB extends ClassA { //ClassAを継承（ここだけ委譲版と異なる）
    constructor() {
        super();
    }
}

//実行
var _classB: ClassB = new ClassB();
_classB.myMethod();
```

### 委譲版

```
//xxx.ts
//ClassAクラス
class ClassA { //継承と同じ
    //コンストラクタ
    constructor() {}

    public myMethod(): void {
        console.log("ClassA.myMethod");
    }
}

//ClassBクラス
class ClassB { //ここだけ継承版と異なる
    private _classA: ClassA; //private変数宣言

    //コンストラクタ
    constructor() {
        this._classA = new ClassA(); //オブジェクトを生成（委譲）
    }

    public myMethod(): void {
        this._classA.myMethod(); //ClassAのmyMethod()を実行
    }
}

//実行
var _classB = new ClassB();
_classB.myMethod();
```

実行環境：Ubuntu 16.04 LTS、Chromium 56、TypeScript 2.2.1  
作成者：MUBIROU  
作成日：2017年03月26日


<a name="変数とスコープ"></a>
# <b>変数とスコープ</b>

### ルール
* 半角英数字、_（アンダースコア）、$（ドル記号）のみ使用可能
* 小文字大文字は区別
* 頭文字は「数字」は不可
* TypeScript の「予約語」は使えない
* 全角、日本語でも動作可能だが避けるべき
* 1行で複数定義する場合、「var _var1: number=0, _var2: number=0」のように記述する

### アクセス修飾子
1. private (同じクラスからのみアクセス可)
1. public (全クラスからアクセス可/省略するとpublic扱い)

### 例文

```
//xxx.ts
class MyClass {
    //privateメンバ変数(省略でpublic扱い／var不要／型指定は省略可)
    private _hoge: string = "PRIVATE";

    //コンストラクタ
    constructor() {
        this.foo();
        console.log(this._hoge); //"PRIVATE"(thisは省略不可)
    }

    private foo(): void { //voidは省略可
        var _hoge: string = "LOCAL";//ローカル変数の定義(varは省略不可)
        console.log(_hoge); //"LOCAL"(thisは省略不可)
    }
}

new MyClass();
```

実行環境：Ubuntu 16.04 LTS、Chromium 56、TypeScript 2.2.1  
作成者：MUBIROU  
作成日：2017年03月26日


<a name="アクセサ"></a>
# <b>アクセサ （getter / setter）</b>

### 読書き可能なプロパティ
```
//xxx.ts
class Yoshimura {
    private _age: number = 0;

    constructor(_age: number) {
        this._age = _age;
    }

    get age(): number {
        return this._age;
    }

    set age(_newValue: number) { //返値の型指定は不要
        this._age = _newValue;
    }
}

var _nishimura: Yoshimura = new Yoshimura(49);
console.log(_nishimura.age); //49
_nishimura.age = 50; //変更が可能
console.log(_nishimura.age); //50
```

### 読取り専用のプロパティ
```
//xxx.ts
class Yoshimura {
    private _age: number = 0;

    constructor(_age: number) {
        this._age = _age;
    }

    get age(): number {
        return this._age;
    }

    set age(_newValue) {
        throw new Error("値の変更はできません");
    }
}

var _nishimura: Yoshimura = new Yoshimura(49);
console.log(_nishimura.age); //49
_nishimura.age = 50; //Error: 値の変更はできません
```

実行環境：Ubuntu 16.04 LTS、Chromium 56、TypeScript 2.2.1  
作成者：MUBIROU  
作成日：2017年03月26日


<a name="演算子"></a>
# <b>演算子</b>

### 算術演算子
（複合代入演算子 += -= *= /= %= などもあり）
```
//xxx.ts
console.log(3 + 2); //5 (可算)
console.log(5 - 8); //-3 (減算)
console.log(3 * 4); //12 (乗算)
console.log(1 + 2 * 3 - 4 / 2); //5 (複雑な計算)
console.log(63 % 60); //3 (余剰)
console.log(8 / 3); //2.6666666666666665（除算)
```

### 後ろに付けるインクリメント／デクリメント
```
//xxx.ts
//インクリメント
var _huga: number = 0;
var _piyo: number = _huga++; //加算する前の_hugaの値を返す
console.log(_huga); //1
console.log(_piyo); //0

//デクリメント
_huga = 0;
_piyo = _huga--; //減算する前の_hugaの値を返す
console.log(_huga); //-1
console.log(_piyo); //0
```

### 前に付けるインクリメント／デクリメント
```
//xxx.ts
//インクリメント
var _huga: number = 0;
var _piyo: number = ++_huga; //加算後の_hugaの値を返す
console.log(_huga); //1
console.log(_piyo); //1

//デクリメント
_huga = 0;
_piyo = --_huga; //減算後の_hugaの値を返す
console.log(_huga); //-1
console.log(_piyo); //-1
```

### その他の演算子
```
//xxx.ts
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
```

実行環境：Ubuntu 16.04 LTS、Chromium 56、TypeScript 2.2.1  
作成者：MUBIROU  
作成日：2017年03月26日

<a name="定数"></a>
# <b>定数</b>

### 通常の定数

```
//xxx.ts
//定数名は慣例的に大文字英字（ENTER_FRAMEなど）
const MY_NAME: string = "MUBIROU";
console.log(MY_NAME); //"MUBIROU"
//MY_NAME = "ICHIRO NISHIMURa"; //Error（変更不可）
```

### クラス定数（静的定数）
```
//xxx.ts
class MyMath {
    constructor() {
        //↓このような記述はできない
        //public static const PI = 3.141592653589793;
    }

    public static get PI(): number {
        return 3.141592653589793;
    }

    public static set PI(_newValue) {
        throw new Error("値の変更はできません");
    }
}

console.log(MyMath.PI); //3.141592653589793
//MyMath.PI = 3.14; //Error: 値の変更はできません
```

実行環境：Ubuntu 16.04 LTS、Chromium 56、TypeScript 2.2.1  
作成者：MUBIROU  
作成日：2017年03月26日  


<a name="メソッド"></a>
# <b>メソッド</b>


### パブリックメソッド
```
//xxx.ts
class MyClass {
    public tashizan(_start: number, _end: number): number {
        var _result: number = 0; //ローカル変数（関数内のみ有効）
        for (var _i = _start; _i <= _end; _i++) {
            //_i はブロック変数（ブロック {} 内のみ有効）
            _result += _i;
        }
        return _result;
    }
}

var _myClass: MyClass = new MyClass();
console.log(_myClass.tashizan(1, 10)); //55
console.log(_myClass.tashizan(1, 100)); //5050
```

### プライベートメソッド
```
//xxx.ts
class Omikuji {
    //コンストラクタ
    constructor() {
        var _resultList: string[] = ["大吉", "吉", "中吉", "小吉", "凶"];
        console.log(_resultList[this.randomInt(0, 4)]);
    }

    private randomInt(_min: number, _max: number): number {
        var _tmp: number = _max - _min + 1;
        return Math.floor(Math.random() * _tmp) + _min;
    }
}

new Omikuji(); //大吉、吉、中吉、小吉、凶のいずれか
```

### コンストラクタ
```
//xxx.ts
class Point {
    //プライベート変数宣言
    private _x: number;
    private _y: number;
    
    //コンストラクタ
    constructor(_x: number = 0, _y: number = 0) {
        this._x = _x;
        this._y = _y;
    }

    //アクセサ（getter）
    public get x(): number { return this._x; }
    public get y(): number { return this._y; }

    //アクセサ（setter）
    public set x(_newValue) { this._x = _newValue; }
    public set y(_newValue) { this._y = _newValue; }
}

var _point: Point = new Point(100, 150); //ここでコンストラクタを呼び出す
console.log(_point.x); //100
console.log(_point.y); //150
```

### 静的メソッド（クラスメソッド）
* インスタンス化せずにメソッドを利用することが可能
```
//xxx.ts
class MyMath {
    //静的メソッド（static メソッド名()）
    public static pow(_arg1: number, _arg2: number): number {
        if (_arg2 == 0) { return 1; } //0乗対策
        var _result: number = _arg1;
        for (var i: number = 1; i < _arg2; i++) {
            _result = _result * _arg1;
        }
        return _result;
    }
}

console.log(MyMath.pow(2, 0)); //1（2の0乗）
console.log(MyMath.pow(2, 1)); //2（2の1乗）
console.log(MyMath.pow(2, 8)); //256（2の8乗）
```

### デフォルト値付き引数
* 省略可能な引数
* 「オプション引数」とも呼ばれる
```
//xxx.ts
class MyClass {
    private _point: number = 0;
    constructor() {}
    public addPoint(_arg: number = 1) { //初期値を1とした場合
        this._point += _arg;
        console.log(this._point);
    }
}

var _myClass: MyClass = new MyClass();
_myClass.addPoint(); //1
_myClass.addPoint(10); //11
```

### 可変長引数
* 引数を固定の数ではなく任意の数にすることが可能
* 引数の前に「...」（ピリオド3つ）を記述（引数の値は配列になる）
```
//xxx.ts
class MyClass {
    sum(...args: number[]): number {
        var _result: number = 0;
        for (var _index in args) {
            _result += args[_index];
        }
        return _result;
    }
}

var _myClass = new MyClass();
console.log(_myClass.sum(1, 2)); //3（1+2）
console.log(_myClass.sum(1, 2, 3, 4, 5)); //15（1+2+3+4+5）
```

### 省略可能な引数
* 引数名の直後に「?」(クエスチョンマーク)を追加することでその引数が省略可能になる
```
//xxx.ts
function myCanvas(_id_or_width: any, _height?: number): string {
    if (typeof _id_or_width == "string") {
        return "canvasのIDは" + _id_or_width;
    } else if (typeof _id_or_width == "number") {
        return "canvasのサイズは" + _id_or_width + " x " + _height;
    }
}

console.log(myCanvas("myCanvas")); //引数が1つでもエラーが出ない
console.log(myCanvas(1280, 720));
```

実行環境：Ubuntu 16.04 LTS、Chromium 56、TypeScript 2.2.1  
作成者：MUBIROU  
作成日：2017年03月27日  


<a name="匿名関数"></a>
# <b>匿名関数</b>
* [アロー関数](#アロー関数)を従来の匿名式に置き換えたもの
```
//xxx.ts
class Hello {
    //プライベート変数宣言
    private _american: Function;
    private _japanese: Function;
    private _chinese: Function;

    public hello: Function; //本来はプライベート変数にしてセッターを利用すべき

    //コンストラクタ
    constructor() {
        this._american = function (_name) { //匿名関数①
            console.log(_name + "," + "Hello!");
        }

        this._japanese = function (_name) { //匿名関数②
            console.log(_name + "、" + "こんにちは!");
        }

        this._chinese = function (_name) { //匿名関数③
            console.log(_name + "," + "你好!");
        }

        //パブリック変数に匿名関数を代入（前方宣言が必要）
        this.hello = this._american;
    }

    //匿名関数の入替え
    change(_language: string) {
        switch (_language) {
            case "american": this.hello = this._american; break;
            case "japanese": this.hello = this._japanese; break;
            case "chinese": this.hello = this._chinese; break;
        }
    }
}

var _hello: Hello = new Hello();
_hello.hello("TARO"); //"TARO,Hello!"
_hello.change("japanese");
_hello.hello("ちかし"); //"ちかし、こんにちは!"
_hello.change("chinese");
_hello.hello("ちかし"); //"ちかし, 你好!"
```

実行環境：Ubuntu 16.04 LTS、Chromium 56、TypeScript 2.2.1  
作成者：MUBIROU  
作成日：2017年03月27日  


<a name="アロー関数"></a>
# <b>アロー関数</b>
* [匿名関数](#匿名関数)をラムダ式に置き換えたバージョン
```
//xxx.ts
class Hello {
    //プライベート変数宣言
    private _american: Function;
    private _japanese: Function;
    private _chinese: Function;

    public hello: Function; //本来はプライベート変数にしてセッターを利用すべき

    //コンストラクタ
    constructor() {
        this._american = (_name: string) => { //匿名関数①
            console.log(_name + "," + "Hello!");
        }

        this._japanese = (_name: string) => { //匿名関数②
            console.log(_name + "、" + "こんにちは!");
        }

        this._chinese = (_name: string) => { //匿名関数③
            console.log(_name + "," + "你好!");
        }

        this.hello = this._american;
    }
    
    //匿名関数の入替え
    change(_language: string) {
        switch (_language) {
            case "american": this.hello = this._american; break;
            case "japanese": this.hello = this._japanese; break;
            case "chinese": this.hello = this._chinese; break;
        }
    }
}

var _hello: Hello = new Hello();
_hello.hello("TARO"); //"TARO,Hello!"
_hello.change("japanese");
_hello.hello("ちかし"); //"ちかし、こんにちは!"
_hello.change("chinese");
_hello.hello("ちかし"); //"ちかし, 你好!"
```

実行環境：Ubuntu 16.04 LTS、Chromium 56、TypeScript 2.2.1  
作成者：MUBIROU  
作成日：2017年03月27日  


<a name="クラス定数･クラスメソッド"></a>
# <b>クラス定数･クラスメソッド</b>
* クラス定数･クラスメソッドは、クラスをインスタンス化せずにアクセスが可能
```
//xxx.ts
class MyMath {
    //①クラス定数（静的定数）の定義（静的定数）
    public static get PI(): number {
        return 3.141592653589793;
    }
    public static set PI(_newValue) {
        throw new Error("値の変更はできません");
    }

    //②静的メソッド（静的メソッド）の定義
    public static pow(arg1: number, arg2: number): number {
        if (arg2 == 0) { return 1; } //0乗対策
        var _result = arg1;
        for (var _i:number = 1; _i < arg2; _i++) {
            _result = _result * arg1;
        }
        return _result;
    }
}

//①クラス定数の参照
console.log(MyMath.PI); //3.141592653589793
//MyMath.PI = 3.14; //Error: 値の変更はできません

//②静的メソッドの実行
console.log(MyMath.pow(2, 0)); //1
console.log(MyMath.pow(2, 8)); //256
```

実行環境：Ubuntu 16.04 LTS、Chromium 56、TypeScript 2.2.1  
作成者：MUBIROU  
作成日：2017年03月27日  


<a name="if文"></a>
# <b>if 文</b>

### 基本例文
* trueと評価される可能性が高い順に並べるとif文を早く抜け出せる可能性が高い
```
//xxx.ts
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
    //xxx.ts
    var _a = true;
    var _b = false;
    if (_a ^ _b) {
        console.log("どちらか一方だけtrueです");
    } else {
        console.log("両方共にtrueかfalseです");
    }
    ```

2. ^ 演算子を使わない場合
    ```
    //xxx.ts
    var _a = true;
    var _b = false;
    if ((_a || _b) && !(_a && _b)) {
        console.log("どちらか一方だけtrueです");
    } else {
        console.log("両方共にtrueかfalseです");
    }
    ```

実行環境：Ubuntu 16.04 LTS、Chromium 56、TypeScript 2.2.1  
作成者：MUBIROU  
作成日：2017年03月27日  


<a name="三項演算子"></a>
# <b>三項演算子</b>

### 比較式が１つの場合
* 構文
```
データ型 変数名 = (比較式) ? (true時の返り値) : (false時の返り値);
```
* 例文
```
//xxx.ts
var _age: number = 49;
var _result = (_age < 60) ? "現役" : "退職";
console.log(_result); //"現役"
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
//xxx.ts
var _age: number = 49;
var _result: string = (_age < 20) ? "未成年" :
_result = (_age < 60) ? "現役" :
_result = "退職";
console.log(_result); //"現役"
```

実行環境：Ubuntu 16.04 LTS、Chromium 56、TypeScript 2.2.1  
作成者：MUBIROU  
作成日：2017年03月27日  


<a name="switch文"></a>
# <b>switch 文</b>

### 判別式が boolean 値ではない場合
```
//xxx.ts
var _name: string = "TARO";
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
```

### 判別式が boolean 値の場合
* case 式に比較演算子が使われる
```
//xxx.ts
var _age: number = 49;
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
```

### break文が無い使い方
* [C#](https://ja.wikipedia.org/wiki/C_Sharp) のようなフォールスルー禁止規則（何か処理をしておきながら break を書かないとエラー）は無い
```
//xxx.ts
var _name: string = "JIRO";
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
```

実行環境：Ubuntu 16.04 LTS、Chromium 56、TypeScript 2.2.1  
作成者：MUBIROU  
作成日：2017年03月27日  


<a name="for文"></a>
# <b>for 文</b>

### ループカウンタの宣言方法
* 参考「[変数とスコープ](#変数とスコープ)」
1. let でループ制御変数を宣言する
    ```
    //xxx.ts
    for (let i:number = 0; i < 10; i++) {
        console.log(i); //0,1,2,3,4,5,6,7,8,9
    }
    //console.log(i); //error（for文の外では使えない）
    ```

1. var でループ制御変数を宣言する
    ```
    //xxx.ts
    for (var i: number = 0; i < 10; i++) {
        console.log(i); //0,1,2,3,4,5,6,7,8,9
    }
    console.log(i); //10（for文の外でも有効）
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
//xxx.ts
for (let i: number = 1; i <= 5; i++) {
    for (let j: number = 1; j <= 5; j++) {
        console.log("x" + i + "y" + j); //x1y1,x1y2,....,x5y4,x5y5
    }
}
```

### 無限ループと break 文
```
//xxx.ts
var _count: number = 0;
for (;;) { //①初期化②ループ判定式③更新処理の全てを省略する
    _count++;
    if (_count > 100) break; //ループを終了
    console.log(_count); //1,2,....,99,100
}
console.log("for文終了");
```

### for 文と continue 文
```
//xxx.ts
for (let i: number = 1; i <= 20; i++) { //iは1,2,...19,20
    if ((i % 3) != 0) { //3で割り余りが0でない（＝3の倍数ではない）場合
        continue; //for文の残処理をスキップしてfor文の次の反復を開始する
    }
    console.log(i); //3,6,9,12,15,18 ←3の倍数
}
```

実行環境：Ubuntu 16.04 LTS、Chromium 56、TypeScript 2.2.1  
作成者：MUBIROU  
作成日：2017年03月27日  


<a name="for...in文"></a>
# <b>for...in 文</b>

### 基本構文
```
for (var 変数名 in 配列等) {
    //配列の場合はインデックス番号、連想配列の場合はプロパティ名
    console.log(変数名);

    //配列の場合は要素の値、連想配列の場合はプロパティ値
    console.log(配列等[変数名]);
}
```

### 配列（1次元）の場合
```
//xxx.ts
var _array: string[] = ["TARO", "HANAKO", "ICHIRO", "JIRO"];
for (let _index in _array) {
    console.log(_index); //"0"→"1"→"2"→"3""
    console.log(_array[_index]); //"TARO"→"HANAKO"→"ICHIRO"→"JIRO"
}
```

### 配列（2次元）の場合
```
//xxx.ts
var _array: string[][] = [
    ["x0y0", "x1y0", "x2y0"], //0行目
    ["x0y1", "x1y1", "x2y1"]  //1行目
];
for (let _index in _array) {
    console.log(_index); //0→1
    console.log(_array[_index]); //["x0y0","x1y0","x2y0"]→["x0y1","x1y1","x2y1"]
}
```

### 連想配列（Object＝オブジェクトリテラル）の場合
```
//xxx.ts
var _object: Object = { name: "MUBIROU", age: 49 };
for (let _propName in _object) {
    console.log(_propName); //"name"→"age"
    console.log(_object[_propName]); //"MUBIROU" → 49
}
```

実行環境：Ubuntu 16.04 LTS、Chromium 56、TypeScript 2.2.1  
作成者：MUBIROU  
作成日：2017年03月27日  


<a name="for...of文"></a>
# <b>for...of 文</b>

### 一次元配列（Array）の場合
```
//xxx.ts
var _array: string[] = ["TARO", "HANAKO", "ICHIRO", "JIRO"];
for (let _data of _array) {
    console.log(_data); //"TARO"→"HANAKO"→"ICHIRO"→"JIRO"
}
```

### 二次元配列（Array）の場合
```
//xxx.ts
var _array: string[][] = [
    ["x0y0", "x1y0", "x2y0"], //0行目
    ["x0y1", "x1y1", "x2y1"]  //1行目
];
for (let _theArray of _array) {
    console.log(_theArray); //["x0y0","x1y0","x2y0"]→["x0y1","x1y1","x2y1"]
}
```

実行環境：Ubuntu 16.04 LTS、Chromium 56、TypeScript 2.2.1  
作成者：MUBIROU  
作成日：2017年03月27日  


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
//xxx.ts
var _i: number = 0;
while (_i < 10) { //ループ判定式にはboolean値しか使えない
    console.log(_i); //0,1,2,3,4,5,6,7,8,9
    _i++;
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
//xxx.ts
var _i: number = 0;
do {
    console.log(_i); //0 ←ループ判定式はfalseだが１回実行される
    _i++;
} while (_i < 0);
```

### while文とbreak文
* 例文（1〜100までを出力）
```
//xxx.ts
var _count: number = 0;
while (true) { //ループ判別式をtrueにすると無限ループに
    _count++;
    if (_count > 100) {
        break; //break文を使ってループを終了（while文の次の行へ）
    }
    console.log(_count); //1,2,....,99,100
}
```

### while 文と continue 文
* 例文（3の倍数を出力）
```
//xxx.ts
var _i: number = 1;
while (_i <= 20) {
    if ((_i % 3) != 0) { //3で割って余りが0ではない（＝3の倍数ではない）場合
        _i++;
        continue; //while文の残処理をスキップしてwhile文の次の反復を開始する
    }
    console.log(_i); //3,6,9,12,15,18 ←3の倍数
    _i++;
}
```

実行環境：Ubuntu 16.04 LTS、Chromium 56、TypeScript 2.2.1  
作成者：MUBIROU  
作成日：2017年03月27日  


<a name="配列（Array）"></a>
# <b>配列（Array）</b>

### 作成
* new 演算子を使う方法
    ```
    var _array1: any[] = new Array(); //空の配列を作成
    var _array2: any[] = new Array(4); //4つの空の要素（undefined）を持つ配列を作成
    var _array3: string[] = new Array("A", "I");
    var _array4: string[][] = new Array(["A","あ"], ["I","い"]); //配列のネスト
    ```

* 配列リテラルを使う方法
    ```
    var _array1: any[] = []; //空の配列を作成
    var _array2: string[] = ["A", "I"];
    var _array3: string[][] = [["A","あ"], ["I","い"]]; //配列のネスト
    ```

### 要素の数
```
//xxx.ts
var _array: string[] = ["00", "01", "02", "03"];
console.log(_array.length); //4
```

### 追加（最後）
```
//xxx.ts
var _array: string[] = ["ICHIRO", "JIRO"];
_array.push("TARO"); //カンマ（,）を使って複数同時に追加可能
console.log(_array); //["ICHIRO", "JIRO", "TARO"]
```

### 追加（先頭）
```
//xxx.ts
var _array: string[] = ["ICHIRO", "JIRO"];
_array.unshift("TARO"); //カンマ（,）を使って複数同時に追加可能
console.log(_array); //["TARO", "ICHIRO", "JIRO"]
```

### 更新（任意の値）
```
//xxx.ts
var _array: string[] = ["TAKASHI", "ICHIRO", "JIRO"];
_array[0] = "TARO"; //0番目を変更する場合
console.log(_array); //["TARO", "ICHIRO", "JIRO"]
```

### 更新（null 値）
```
//xxx.ts
var _array: string[] = ["TARO", "ICHIRO", "JIRO"];
_array[0] = null;
console.log(_array); //[null, "ICHIRO", "JIRO"]
```

### 削除（最後）
```
//xxx.ts
var _array: string[] = ["ICHIRO", "JIRO", "TARO"];
console.log(_array.pop()); //"TARO"（削除した要素を返す）
console.log(_array); //["ICHIRO", "JIRO"]
```

### 削除（最初）
```
//xxx.ts
var _array: string[] = ["TARO", "ICHIRO", "JIRO"];
console.log(_array.shift()); //"TARO"（削除した要素を返す）
console.log(_array); //["ICHIRO", "JIRO"]
```

### 削除（○番目から□個）
```
//xxx.ts
var _array: string[] = ["00", "01", "02", "03", "04", "05"];
console.log(_array.splice(3, 2)); //["03", "04"]
console.log(_array) //["00", "01", "02", "05"]
```

### 削除（○番目から全て）
```
//xxx.ts
var _array: string[] = ["00", "01", "02", "03", "04", "05"];
console.log(_array.splice(3)); //["03", "04", "05"]
console.log(_array) //["00", "01", "02"]
```

### 抽出（○番目から□番目）
```
//xxx.ts
var _array: string[] = ["00", "01", "02", "03", "04", "05"];
console.log(_array.slice(2, 4)); //["02", "03"]（4番目は含まず）
console.log(_array) //["00", "01", "02", "03", "04", "05"]（元配列に変化なし）
```

### 抽出（○番目から全て）
```
//xxx.ts
var _array: string[] = ["00", "01", "02", "03", "04", "05"];
console.log(_array.slice(2)); //["02", "03", "04", "05"]
console.log(_array) //["00", "01", "02", "03", "04", "05"]（元配列に変化なし）
```

### 検索(前から）
* 第2引数番目から、後ろに向かって検索（最初に見つかったインデックス番号を返す）
```
//xxx.ts
var _array: string[] = ["A", "B", "C", "D", "E", "F", "D"];
console.log(_array.indexOf("D", 0)); //3（見つからない場合「-1」を返す）
```

### 検索（後ろから）
* 第2引数番目から、前に向かって検索（最初に見つかったインデックス番号を返す）
```
//xxx.ts
var _array: string[] = ["A", "B", "C", "D", "E", "F", "D"];
console.log(_array.lastIndexOf("D"));
//6（第2引数を省略すると _array.length と同じ）
```

### 並べ替え（反転）
```
//xxx.ts
var _array: string[] = ["00", "01", "02", "03", "04", "05"];
console.log(_array.reverse()); //["05", "04", "03", "02", "01", "00"]
console.log(_array) //["05", "04", "03", "02", "01", "00"]（元配列も変更）
```

### 並べ替え（ソート）
```
//xxx.ts
var _array: string[] = ["C", "02", "A", "01", "03", "B"];
console.log(_array.sort()); //["01", "02", "03", "A", "B", "C"]
console.log(_array) //["01", "02", "03", "A", "B", "C"]（元配列も変更）
```

### 結合
```
//xxx.ts
var _array1: string[] = ["A", "B", "C"];
var _array2: string[] = ["D", "E", "F"];
var _array3: string[] = _array1.concat(_array2);
console.log(_array3) //["A", "B", "C", "D", "E", "F"]
```

### 複製
```
//xxx.ts
var _original: string[] = ["A", "B", "C"];
var _copy: string[] = _original.concat(); //複製

//実験（参照コピーではなく複製されているか否か）
_original[0] = "あ";
console.log(_original[0], _copy[0]); //"あ" "A"（参照コピーではない）
```

### 文字列→配列
```
//xxx.ts
var _string: string = "A,B,C,D,E,F";
var _array: string[] = _string.split(","); //カンマ区切りで配列化
console.log(_array); //["A", "B", "C", "D", "E", "F"]
```

### 全要素を取り出す
```
//xxx.ts
var _array: string[] = ["A", "B", "C", "D", "E", "F"];
_array.forEach(function (arg) {
    console.log(arg); //"A"→"B"→"C"→"D"→"E"→"F"
});
```
* for文、for...in文を使う方法もあり（参照「[for...in 文](#for...in文)」）

実行環境：Ubuntu 16.04 LTS、Chromium 56、TypeScript 2.2.1  
作成者：MUBIROU  
作成日：2017年03月27日  


<a name="連想配列（Object）"></a>
# <b>連想配列（Object）</b>

```
//xxx.ts
var _obj: { name: string; age: number; helloFunction: Function } = {
    name: "MUBIROU",
    age: 49,
    helloFunction: () => { //アロー関数
        return "Hello! How are you?";
    }
}

console.log(_obj.name); //"MUBIROU"
console.log(_obj["name"]); //"MUBIROU"（配列アクセスも可能）
console.log(_obj.age); //47
console.log(_obj.helloFunction()); //"Hello! How are you?"
```

実行環境：Ubuntu 16.04 LTS、Chromium 56、TypeScript 2.2.1  
作成者：MUBIROU  
作成日：2017年03月27日  


<a name="this"></a>
# <b>this</b>

### トップレベルの this
```
//xxx.ts
document.write(this); //[object Window]（＝window／省略可能）
```

### クラス内の this
```
//xxx.ts
class MyClass {
    private _hoge: string;

    constructor() {
        console.log(this); //MyClass {}（MyClassクラスのインスタンス）
        this._hoge = "プライベート変数"; //thisは省略不可
    }

    public get hoge(): string { //アクセサ（getter）
        return this._hoge; //thisは省略不可
    }
}

var _myClass: MyClass = new MyClass();
console.log(_myClass.hoge); //"プライベート変数"
```

実行環境：Ubuntu 16.04 LTS、Chromium 56、TypeScript 2.2.1  
作成者：MUBIROU  
作成日：2017年03月27日  


<a name="文字列の操作"></a>
# <b>文字列の操作</b>

### 文字列の生成
```
var 変数1: Object = new String("xxx"); //object型
var 変数2: string = "xxx"; //string型
```
* 上記2つは厳密には異なるが通常は意識する必要はない

### 文字列の長さを調べる
```
//xxx.ts
var _string: string = "ABCDE";
console.log(_string.length); //5
```

### 一部分を取得
```
//xxx.ts
var _string: string = "0123456789";
console.log(_string.substr(0, 1)); //"0" ←0文字目（先頭）〜1文字取得
console.log(_string.substr(-1, 1)); //"9" ←後ろから1文字目〜1文字取得
console.log(_string.substr(4)); //"456789" ←4文字目（0から開始）〜全て取得
console.log(_string.substr(4, 3)); //"456" ←4文字目（0から開始）〜3文字取得
```

### 置換
```
//xxx.ts
var _string: string = "2017年3月27日";
var _regExp: RegExp = new RegExp("2017", "g"); //第2引数を省略すると全てを置換（"g"と同等）
console.log(_string.replace(_regExp, "平成29")); //"平成29年3月27日"
```

### 検索
```
//xxx.ts
var _string: string = "ABCDEFG-ABCDEFG";
var _count: number = 0;
while (_string.indexOf("CD", _count) != -1) { //見つからないと-1を返す
    var _num: number = _string.indexOf("CD", _count);
    console.log(_num); //2,10 ←"CD"が見つかった場所（0から開始）を返す
    _count = _num + 1;
}
```
* 最後から検索する String.lastIndexOf() もあり

### 文字列→配列
```
//xxx.ts
var _string: string = "A,B,C,D,E,F";
var _array: string[] = _string.split(","); //カンマ区切りで配列化
console.log(_array); //["A", "B", "C", "D", "E", "F"]
```

実行環境：Ubuntu 16.04 LTS、Chromium 56、TypeScript 2.2.1  
作成者：MUBIROU  
作成日：2017年03月27日  


<a name="正規表現"></a>
# <b>正規表現</b>

* TypeScript には以下のサンプル以外にも多くの正規表現の機能が用意されています

### 検索＆置換
```
//xxx.ts
var _string: string = "吉田松蔭,高杉晋作,久坂玄瑞,吉田稔麿,伊藤博文";
var _regExp: RegExp = new RegExp("吉田", "g"); //第2引数を省略すると全てを置換（"g"と同等）
/*
"^○○$"のように「^（行頭マッチ）」「$（行末マッチ）」といったメタ文字の他、
さまざまなパターン、例えば "[A-D]\d+" などを使うことでより細かな制御が可能
*/
if (_regExp.test(_string)) { //検索
    console.log('"吉田"は含まれています');
    let _result: string = _string.replace(_regExp, "よしだ"); //置換
    //よしだ松蔭,高杉晋作,久坂玄瑞,よしだ稔麿,伊藤博文"
    console.log(_result);
} else {
    console.log('"吉田"は含まれていません');
}
```

### マッチした数
```
//xxx.ts
var _string: string = "059371820400381295700347891205178900517093823";
var _regExp: RegExp = new RegExp("00", "g"); //第2引数を省略すると全てを置換（"g"と同等）
var _matchList: string[] = _string.match(_regExp);
console.log(_matchList); //["00", "00", "00"]
console.log(_matchList.length); //3（マッチした数）
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

実行環境：Ubuntu 16.04 LTS、Chromium 56、TypeScript 2.2.1  
作成者：MUBIROU  
作成日：2017年03月27日  


<a name="抽象クラス"></a>
# <b>抽象クラス</b>

### 構文
```
abstract class Abstract○○ { //抽象クラスの定義
    abstract 抽象メソッド名(引数①,引数②,...): 返り値の型;
}

class 派生クラス名 extends Abstract○○ { //抽象クラスの継承
    抽象メソッド名(引数①,引数②,...): 返り値の型 {
        //実際の処理はここに記述
    }
}
```

### 例文
```
//xxx.ts
abstract class AbstractClass { //抽象クラスの定義
    commonMethod(): void { //共通のメソッド
        console.log("AbstractClass.commonMethod()");
    }
    abstract eachMethod(): void; //抽象メソッド（実際の処理は記述しない）
}

class SubClass extends AbstractClass { //抽象クラスの継承
    eachMethod(): void { //オーバーライドして実際の処理を記述
        console.log("SubClass.eachMethod()"); //実際の処理
    }
}

var _subClass: SubClass = new SubClass();
_subClass.commonMethod(); //"AbstractClass.commonMethod()"
_subClass.eachMethod(); //"SubClass.eachMethod()"
```

実行環境：Ubuntu 16.04 LTS、Chromium 56、TypeScript 2.2.1  
作成者：MUBIROU  
作成日：2017年03月27日  


<a name="superキーワード"></a>
# <b>super キーワード</b>

```
//xxx.ts
//スーパークラス
class SuperClass {
    constructor(_arg: string) { //コンストラクタ
        console.log("SuperClass.constructor : " + _arg);
    }
    public methodSuper(_arg: string): void {
        console.log("SuperClass.methodSuper : " + _arg);
    }
}

//サブクラス
class SubClass extends SuperClass { //スーパークラスを継承
    constructor() { //コンストラクタ
        //↓スーパークラスのコンストラクタの呼び出し（必須）
        super("from SubClass");
        //↑サブクラスのコンストラクタ内であれば冒頭でなくても可能
    }
    public methodSub(): void {
        //↓スーパークラスのメソッドを呼び出すことが可能
        super.methodSuper("from SubClass");
    }
}

//実行
var _subClass: SubClass = new SubClass();
//"SuperClass.constructor : from SubClass"
_subClass.methodSub();
//"SuperClass.methodSuper : from SubClass"
```

実行環境：Ubuntu 16.04 LTS、Chromium 56、TypeScript 2.2.1  
作成者：MUBIROU  
作成日：2017年03月27日  


<a name="オーバーライド"></a>
# <b>オーバーライド</b>

### 概要
* スーパークラスで定義したメソッドをサブクラスで再定義することをオーバーライドと呼ぶ
* スーパークラスのメソッドを呼び出したい場合は、super.メソッド名() とする
* （擬似）[抽象クラス](#抽象クラス)でもこの方法を活用

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

実行環境：Ubuntu 16.04 LTS、Chromium 56、TypeScript 2.2.1  
作成者：MUBIROU  
作成日：2017年03月27日  


<a name="カスタムイベント"></a>
# <b>カスタムイベント</b>

### 概要
JavaScript に実装されている ○.dispatchEvent() や ○.addEventListener() のターゲットに指定できるオブジェクトは Window、XMLHttpRequest、HTMLCanvasElement、ドキュメント上の単一のノード、ドキュメント自身などに限られるため、用途が限定されます。それとは異なりここで紹介する方法は、他の言語でも利用可能な汎用的な方法です。

### 例文
```
//xxx.ts
class Robot { //イベントを設定するクラス
    private _energy: number;
    private _dieHandler: Function;

    constructor() {
        this._energy = 80;
    }

    public addEventListener(_event, _function): void {
        if (_event == "die") {
            this._dieHandler = _function; //匿名関数を変数に格納
        } else {
            //該当のイベントが無い場合、実行時にErrorを発生（オプション）
            throw new Error('Error:"' + _event + '"はサポートされていません');
        }
    }

    public fight(): void {
        this._energy -= 20;
        if (this._energy <= 0) {
            this._dieHandler(this); //←"die"イベントの発生（リスナー関数の呼出し）
        }
    }
}

var die_robot = (arg: Robot): void => { //リスナー関数（前方宣言が必要）
    console.log(arg); //Robotクラスのインスタンス
    alert("GAME OVER");
}

var _robot: Robot = new Robot();
_robot.addEventListener("die", die_robot); //イベントリスナーの設定
_robot.fight();
_robot.fight();
_robot.fight();
_robot.fight(); //"GAME OVER"
```

実行環境：Ubuntu 16.04 LTS、Chromium 56、TypeScript 2.2.1  
作成者：MUBIROU  
作成日：2017年03月27日  


<a name="数学関数（Math）"></a>
# <b>数学関数（Math）</b>

### Math.sin() : サイン（正弦）
```
//xxx.ts
console.log(Math.sin(0)); //0（0°）
console.log(Math.sin(Math.PI / 2)); //1（90°）
console.log(Math.sin(Math.PI)); //1.2246467991473532e-16（≒0）（180°）
console.log(Math.sin(Math.PI * 3 / 2)); //-1（270°）
console.log(Math.sin(Math.PI * 2)); //-2.4492935982947064e-16（≒0）（360°）
```

### Math.cos() : コサイン（余弦）
```
//xxx.ts
console.log(Math.cos(0)); //1（0°）
console.log(Math.cos(Math.PI / 2)); //6.123233995736766e-17（≒0）（90°）
console.log(Math.cos(Math.PI)); //-1（180°）
console.log(Math.cos(Math.PI * 3 / 2)); //-1.8369701987210297e-16（≒0）（270°）
console.log(Math.cos(Math.PI * 2)); //1 ←360°
```

### Math.atan2() : アークタンジェント2
```
//xxx.ts
//三角形の各辺が1:2:√3の場合に2:√3の間の角度は30°であることの検証
var _disX: number = Math.sqrt(3); //√3のこと
var _disY: number = 1;
console.log(Math.atan2(_disY, _disX)); //0.5235987755982989（ラジアン）
console.log(180 * Math.atan2(_disY, _disX) / Math.PI); //30.000000000000004（度）
```

### Math.PI : 円周率
```
//xxx.ts
console.log(Math.PI); //3.141592653589793
```

### Math.floor() : 切り捨て
```
//xxx.ts
console.log(Math.floor(1.001)); //1
console.log(Math.floor(1.999)); //1
```

### Math.ceil() : 切り上げ
```
//xxx.ts
console.log(Math.ceil(1.001)); //2
console.log(Math.ceil(1.999)); //2
```

### Math.round() : 四捨五入
```
//xxx.ts
console.log(Math.round(1.499)); //1
console.log(Math.round(1.500)); //2
```

### Math.abs() : 絶対値
```
//xxx.ts
console.log(Math.abs(100)); //100
console.log(Math.abs(-100)); //100
```

### Math.pow() : 累乗（○の□乗）
```
//xxx.ts
console.log(Math.pow(2, 0)); //1（2の0乗）
console.log(Math.pow(2, 8)); //256（2の8乗）
```

### Math.sqrt() : 平方根（√○）
```
//xxx.ts
console.log(Math.sqrt(2)); //1.4142135623730951（一夜一夜にひとみごろ）
console.log(Math.sqrt(3)); //1.7320508075688772（人並みに奢れや）
console.log(Math.sqrt(4)); //2
console.log(Math.sqrt(5)); //2.23606797749979（富士山麓オウム鳴く）
```

### Math.max() : 比較（最大値）
```
//xxx.ts
console.log(Math.max(5.01, -10)); //5.01（2つの数値の比較）
```

### Math.min() : 比較（最小値）
```
//xxx.ts
console.log(Math.min(5.01, -10)); //-10（2つの数値の比較）
```

実行環境：Ubuntu 16.04 LTS、Chromium 56、TypeScript 2.2.1  
作成者：MUBIROU  
作成日：2017年03月27日  

<a name="乱数"></a>
# <b>乱数</b>

### Math.random()
* 0以上、1未満（0.9999…）の値を返す
* 現在時刻を元に random seed （乱数種）を生成
```
//xxx.ts
console.log(Math.random()); //0.13397585139675616
console.log(Math.random()); //0.9903535518676447
console.log(Math.random()); //0.006009885271453852
```

### 整数の乱数
```
//xxx.ts
//整数の乱数を返すカスタム関数
var randomInt: Function = (_min: number, _max: number): number => {
    return Math.floor(Math.random() * (_max - _min + 1)) + _min;
}

//実験（1000万回繰返して精度を調べる）
var _u5: number = 0, _u4: number = 0, _u3: number = 0;
var _u2: number = 0, _u1: number = 0, _o0: number = 0;
var _o1: number = 0, _o2: number = 0, _o3: number = 0;
var _o4: number = 0, _o5: number = 0;

for (let i: number = 0; i < 10000000; i++) {
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
//909620 908053 909554 909910 907996 910693 908960 909539 909366 908502 907807
```

実行環境：Ubuntu 16.04 LTS、Chromium 56、TypeScript 2.2.1  
作成者：MUBIROU  
作成日：2017年03月27日  


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
//xxx.ts
var _date: Date = new Date();
console.log(_date); //Mon Mar 27 2017 16:14:44 GMT+0900 (JST)
console.log(_date.getFullYear()); //2017
console.log(_date.getMonth()); //2（3月）
console.log(_date.getDate()); //27
console.log(_date.getDay()); //1（月曜日）
console.log(_date.getHours()); //16
console.log(_date.getMinutes()); //14
console.log(_date.getSeconds()); //44
console.log(_date.getMilliseconds()); //873
//"hh:mm:ss"で現在の時間を表示する方法
var _h: any = (_date.getHours() < 10) ? "0" + _date.getHours() : _date.getHours();
var _m: any = (_date.getMinutes() < 10) ? "0" + _date.getMinutes() : _date.getMinutes();
var _s: any = (_date.getSeconds() < 10) ? "0" + _date.getSeconds() : _date.getSeconds();
console.log(_h + ":" + _m + ":" + _s); //"16:14:44"
```

実行環境：Ubuntu 16.04 LTS、Chromium 56、TypeScript 2.2.1  
作成者：MUBIROU  
作成日：2017年03月27日  


<a name="タイマー"></a>
# <b>タイマー</b>

### 繰返し実行する
```
//xxx.ts
var _count: number = 0;
var callbackFunction: Function = (): void => {
    if (++_count <= 10) { //10回繰返す場合…
        console.log(_count, "繰返し実行したい処理");
    } else {
        clearInterval(_timerID); //繰返しを止める
    }
}
//↓第3引数を使ってデータをcallbackFunctionの引数として送信することも可能
var _timerID: number = setInterval(callbackFunction, 1000); //1秒間隔で繰返す場合
```

### 一度だけ実行する
```
//xxx.ts
var callbackFunction: Function = () => {
    console.log("一度だけ実行したい処理");
    clearTimeout(_timerID);
}
var _timerID: number = setTimeout(callbackFunction, 1000); //1秒後に1回実行する場合
```

実行環境：Ubuntu 16.04 LTS、Chromium 56、TypeScript 2.2.1  
作成者：MUBIROU  
作成日：2017年03月27日  


<a name="処理速度計測"></a>
# <b>処理速度計測</b>

### Dateオブジェクトを使う方法
```
//xxx.ts
var _start: number = new Date().getTime(); //1970年からの経過時間（ミリ秒）
for (let i: number = 0; i < 1000000000; i++) { //10億回繰返す
    //速度計測したい処理
}
var _end: number = new Date().getTime();
console.log(_end - _start); //2778（ミリ秒）
```

### console.time() を使う方法
* 処理時間の計測に利用可能（推奨）
* ページ毎に10000個のタイマーが使用可能
* 各タイマーにはユニーク（唯一）な識別子を付けて使用。使用後は同じ識別子を引数として console.timeEnd() を実行することで経過時間が出力
    ```
    //xxx.ts
    console.time("timerA");
    for (let i:number = 0; i < 1000000000; i++) { //10億回繰返す
        //速度計測したい処理
    }
    console.timeEnd("timerA"); //"timerA: 2776.515ms"
    ```

実行環境：Ubuntu 16.04 LTS、Chromium 56、TypeScript 2.2.1  
作成者：MUBIROU  
作成日：2017年03月27日  


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
//xxx.ts
//①XMLHttpRequestオブジェクトの生成
var _request: XMLHttpRequest = new XMLHttpRequest();

//②イベントハンドラの定義
_request.onreadystatechange = ():void => { //イベントハンドラ
    if (_request.readyState == 4) { //リクエストが完了した場合
        if (_request.status == 200) { //成功した場合(Webサーバ上で動作）
            console.log(_request.responseText); //⑤読み込んだテキストの表示
        }
    }
}

//③ヘッダの設定
_request.open("GET","sample.txt");

//④リクエストの送信
_request.send(null);
```

実行環境：Ubuntu 16.04 LTS、Chromium 56、TypeScript 2.2.1  
作成者：MUBIROU  
作成日：2017年03月27日  