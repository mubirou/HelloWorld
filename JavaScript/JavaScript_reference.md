# <b>JavaScript 基礎文法</b>

### <b>INDEX</b>

* Hello,world! （[Linux](https://github.com/TakashiNishimura/HelloWorld/blob/master/JavaScript/JavaScript_linux.md) / [macOS](https://github.com/TakashiNishimura/HelloWorld/blob/master/JavaScript/JavaScript_mac.md) / [Windows](https://github.com/TakashiNishimura/HelloWorld/blob/master/JavaScript/JavaScript_win.md)）
* [データ型](#データ型)
* [データ型の操作](#データ型の操作)
* [クラス](#クラス)（プロトタイプ）
* [スーパークラスとサブクラス](#スーパークラスとサブクラス)（プロトタイプベース）
* [名前空間](#名前空間)
* [継承と委譲](#継承と委譲)
* [変数とスコープ](#変数とスコープ)
* [アクセサ （getter / setter）](#アクセサ)
* [演算子](#演算子)
* [定数](#定数)
* [メソッド](#メソッド)
* [匿名関数](#匿名関数)
* [if 文](#if文)
* [三項演算子](#三項演算子)
* [switch 文](#switch文)
* [for 文](#for文)
* [for...in 文](#for...in文)
* [while 文](#while文)
* [配列（Array）](#配列（Array）)
* [連想配列（Object）](#連想配列（Object）)
* [this](#this)
* [文字列の操作](#文字列の操作)
* [正規表現](#正規表現)
* [抽象クラス](#抽象クラス)
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
1. function（関数）

### 例文
```
<script>
    console.log(typeof true); //"boolean"
    console.log(typeof 1); //"number"
    console.log(typeof "1"); //"string"
    console.log(typeof new Object()); //"object"
    console.log(typeof []); //"object"

    var _hoge; //変数宣言したのみで値が設定されていない場合
    console.log(typeof _hoge); //"undefined"

    function hoge() {};
    console.log(typeof hoge); //"function"
</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2017年03月22日  


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
    console.log(typeof { name: "TARO", age: 49 }); //"object"

    //⑤undefined（未初期化変数）
    console.log(typeof _hoge); //"undefined"

    //⑥function（関数）
    console.log(typeof function() {}); //"function"
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
    console.log({ name: "TARO" } instanceof Object); //true
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

    var _number4 = parseFloat("3.14です。"); //前方から数値化できる文字列のみ変換
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
作成日：2017年03月22日  


<a name="クラス"></a>
# <b>クラス</b>（プロトタイプ）

### Function.prototype プロパティ
* JavaScript はクラスベースではなく、[プロトタイプベース](http://bit.ly/2l76Rew)の[オブジェクト指向プログラミング](http://bit.ly/1YfUaXy)言語である（"class" キーワードが実装されていない）
* クラス定義には Function.prototype プロパティを利用
* コンストラクタ関数が呼び出されるとプロトタイプオブジェクト（メソッドとプロパティの格納庫）が自動的に作成され、この格納庫にプロパティとメソッドを定義する

```
<script>
    //長方形クラス（前方宣言が必要）
    function Rectangle() {} //コンストラクタ関数

    //プロパティ群の初期値の設定
    Rectangle.prototype.__width = 640;
    Rectangle.prototype.__height = 480;

    //アクセサ（getter/setter）
    Rectangle.prototype.getWidth = function() {
        return this.__width;
    }
    Rectangle.prototype.setWidth = function(_newValue) {
        this.__width = _newValue;
    }

    Rectangle.prototype.getHeight = function() {
        return this.__height;
    }
    Rectangle.prototype.setHeight = function(_newValue) {
        this.__height = _newValue;
    }

    //面積を計算して値を返す
    Rectangle.prototype.getArea = function() {
        return this.__width * this.__height;
    }

    //①インスタンスの生成
    var _rectangle = new Rectangle();

    //②プロパティの確認と変更
    console.log(_rectangle.getWidth(), _rectangle.getHeight()); //640, 480
    _rectangle.setWidth(1920);
    _rectangle.setHeight(1080);
    console.log(_rectangle.getWidth(), _rectangle.getHeight()); //1920, 1080

    //③メソッドの実行
    console.log(_rectangle.getArea()); //→ 2073600
</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2017年03月22日  


<a name="スーパークラスとサブクラス"></a>
# <b>スーパークラスとサブクラス</b>（プロトタイプベース）

* JavaScript はクラスベースの[オブジェクト指向](http://bit.ly/1YfUaXy)ではないため[プロトタイプベース](http://bit.ly/2l76Rew)の継承を利用する
```
<script>
    /****************************************************
    スーパークラス
    ****************************************************/
    //コンストラクタ関数
    function SuperClass() {}

    //①プロパティの定義
    SuperClass.prototype.__pSuperClass = "スーパークラスのプロパティ";

    //②アクセサの定義（setterは省略）
    SuperClass.prototype.get_pSuperClass = function() {
        return this.__pSuperClass;
    }

    //③メソッドの定義
    SuperClass.prototype.mSuperClass = function() {
        return "スーパークラスのメソッド";
    }

    /****************************************************
    サブクラスＡ（スーパークラスを継承／多重継承は不可）
    ****************************************************/
    //コンストラクタ関数
    function SubClassA() {}
    //スーパークラスを継承
    SubClassA.prototype = new SuperClass();
    //①プロパティの定義
    SubClassA.prototype.__pSubClassA = "サブクラスAのプロパティ";
    //②アクセサの定義（setterは省略）
    SubClassA.prototype.get_pSubClassA = function() {
        return this.__pSubClassA;
    }
    //③メソッドの定義
    SubClassA.prototype.mSubClassA = function() {
        return "サブクラスAのメソッド";
    }

    /****************************************************
    サブクラスＢ（スーパークラスを継承／多重継承は不可）
    ****************************************************/
    //コンストラクタ関数
    function SubClassB() {}
    //スーパークラスを継承
    SubClassB.prototype = new SuperClass();
    //①プロパティの定義
    SubClassB.prototype.__pSubClassB = "サブクラスBのプロパティ";
    //②アクセサの定義（setterは省略）
    SubClassB.prototype.get_pSubClassB = function() {
        return this.__pSubClassB;
    }
    //③メソッドの定義
    SubClassB.prototype.mSubClassB = function() {
        return "サブクラスBのメソッド";
    }

    /****************************************************
    実行
    ****************************************************/
    var _subClassA = new SubClassA(); //サブクラスAからインスタンスを生成
    console.log(_subClassA.get_pSuperClass()); //"スーパークラスのプロパティ"
    console.log(_subClassA.get_pSubClassA()); //"サブクラスAのプロパティ"
    console.log(_subClassA.mSuperClass()); //"スーパークラスのメソッド"
    console.log(_subClassA.mSubClassA()); //"サブクラスAのメソッド"

    var _subClassB = new SubClassB(); //サブクラスBからインスタンスを生成
    console.log(_subClassB.get_pSuperClass()); //"スーパークラスのプロパティ"
    console.log(_subClassB.get_pSubClassB()); //"サブクラスBのプロパティ"
    console.log(_subClassB.mSuperClass()); //"スーパークラスのメソッド"
    console.log(_subClassB.mSubClassB()); //"サブクラスBのメソッド"
</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2017年03月22日  


<a name="名前空間"></a>
# <b>名前空間</b>

#### 外部ファイル（ myLibrary.js ）
```
//名前空間を省略可能にするために（オプション）
if (myLibrary != window) {
    var myLibrary = {}; //namescape（省略をしない前提であればconstにします）
}

/****************************
myLibrary.SuperClassクラス
****************************/
myLibrary.SuperClass = function() {}; //コンストラクタ
myLibrary.SuperClass.prototype.__myProperty = undefined; //プロパティ
myLibrary.SuperClass.prototype.getMyProperty = function() { //getter
    return this.__myProperty;
}
myLibrary.SuperClass.prototype.setMyProperty = function(_newValue) { //setter
    this.__myProperty = _newValue;
}

/****************************
myLibrary.MyClassクラス
****************************/
myLibrary.MyClass = function() { //コンストラクタ
    console.log("new myLibrary.MyClass!");
};
myLibrary.MyClass.prototype = new myLibrary.SuperClass(); //継承も可能
myLibrary.MyClass.prototype.MyClassMethod = function() { //メソッド
    console.log("MyClass.MyClassMethod()");
}
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
        _myClass.setMyProperty("hoge");
        console.log(_myClass.getMyProperty()); //"hoge"

        //MyClassクラス（名前空間を省略するとコンフリクトを起こす）
        function MyClass() { //コンストラクタ
            console.log("コンフリクトを起こさない!");
        };
        new MyClass(); //"コンフリクトを起こさない!"
    </script>
</head>
</html>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2017年03月23日  


<a name="継承と委譲"></a>
# <b>継承と委譲</b>

* GoF デザインパターンの [Adapter パターン](http://bit.ly/2naab8x)等で利用される

### 継承版

```
<script>
    //ClassAクラス
    function ClassA() {}; //コンストラクタ
    ClassA.prototype.myMethod = function() {
        console.log("ClassA.myMethod");
    }

    //ClassBクラス
    function ClassB() {}; //コンストラクタ
    ClassB.prototype = new ClassA(); //ClassAを継承

    //実行
    var _classB = new ClassB();
    _classB.myMethod(); //"ClassA.myMethod"
</script>
```

### 委譲版

```
<script>
    //ClassAクラス
    function ClassA() {}; //コンストラクタ
    ClassA.prototype.myMethod = function() {
        console.log("ClassA.myMethod");
    }

    //ClassBクラス
    function ClassB() { //コンストラクタ
        this.__classA = new ClassA(); //コンストラクタ内でオブジェクトを生成（委譲）
    }
    ClassB.prototype.myMethod = function() {
        this.__classA.myMethod(); //ClassAのmyMethod()を実行
    }

    //実行
    var _classB = new ClassB();
    _classB.myMethod(); //"ClassA.myMethod"
</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2017年03月23日


<a name="変数とスコープ"></a>
# <b>変数とスコープ</b>

### ルール
* 半角英数字、_（アンダースコア）、$（ドル記号）のみ使用可能
* 小文字大文字は区別
* 頭文字は「数字」は不可
* JavaScript の「予約語」は使えない
* 全角、日本語でも動作可能だが避けるべき
* 1行で複数を定義する場合、「var _var1 = ○○, _var2 = ○○」のように記述

### 例文
```
<script>
    var _var = "GLOBAL"; //グローバル変数（varは省略可能）
    function hoge() {
        var _var = "LOCAL"; //ローカル変数（var文は必須）
        console.log(_var); //"LOCAL"
    }
    hoge();
    console.log(_var); //"GLOBAL"
</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2017年03月23日


<a name="アクセサ"></a>
# <b>アクセサ （getter / setter）</b>

### 概要
JavaScript は private 変数を定義することができません。そこでパブリック変数を、[Python](https://ja.wikipedia.org/wiki/Python) 風に __xxx と命名してプライベート変数扱いにします。実際は単なるパブリック変数ですので外部からアクセスできてしまいますが、必ずアクセサを使ってアクセスするようにします。

### 読書き可能なプロパティ
```
<script>
    //Nishimuraクラス
    function Nishimura(_age) { //コンストラクタ
        this.__age = _age;
    }
    Nishimura.prototype.getAge = function() { //アクセサ（getter）
        return this.__age;
    };
    Nishimura.prototype.setAge = function(_newValue) { //アクセサ（setter）
        this.__age = _newValue;
    };

    //実行
    var _nishimura = new Nishimura(49);
    console.log(_nishimura.getAge()); //49
    _nishimura.setAge(50); //変更が可能
    console.log(_nishimura.getAge()); //50
</script>
```

### 読取り専用のプロパティ
```
<script>
    //Nishimuraクラス
    function Nishimura(_age) { //コンストラクタ
        this.__age = _age;
    }
    Nishimura.prototype.getAge = function() { //アクセサ（getter）
        return this.__age;
    };
    Nishimura.prototype.setAge = function(_newValue) { //アクセサ（setter）
        throw new Error("値の変更はできません");
    };

    //実行
    var _nishimura = new Nishimura(49);
    console.log(_nishimura.getAge()); //49
    _nishimura.setAge(50); //Error: 値の変更はできません
</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2017年03月23日


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
    var _piyo = _huga--; //減算する前の_hugaの値を返す
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
作成日：2017年03月23日


<a name="定数"></a>
# <b>定数</b>

```
<script>
    //定数名は慣例的に大文字英字（ENTER_FRAMEなど）
    const MY_NAME = "Takashi Nishimura";
    console.log(MY_NAME); //"Takashi Nishimura"
    MY_NAME = "ICHIRO NISHIMURa"; //Error（変更不可）
</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2017年03月23日  


<a name="メソッド"></a>
# <b>メソッド</b>

```
<script>
    console.log(tashizan(1, 10)); //55
    console.log(tashizan(1, 100)); //5050

    //第1引数〜第2引数までの値を足した合計を返す関数
    function tashizan(_start, _end) {
        var _result = 0;
        for (var _i = _start; _i <= _end; _i++) {
            _result += _i;
        }
        return _result;
    }
</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2017年03月23日  


<a name="匿名関数"></a>
# <b>匿名関数</b>
```
<script>
    //前方宣言が必要
    var _kakezan = function(arg1, arg2) {
        return arg1 * arg2;
    }
    console.log(_kakezan(9, 9)); //81
</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2017年03月23日  


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
作成日：2017年03月23日  


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
        var age_ = 49;
        var result_ = (age_ < 60) ? "現役" : "退職";
        console.log(result_); //"現役"
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
        var age_ = 49;
        var result_ = (age_ < 20) ? "未成年" :
        result_ = (age_ < 60) ? "現役" :
        result_ = "退職";
        console.log(result_); //"現役"
    </script>
</head>
</html>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2017年03月23日  


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
作成日：2017年03月23日  


<a name="for文"></a>
# <b>for 文</b>

### ループカウンタを1つずつアップする
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
    for (var i = 0; i < 50; i += 5) { //5つずつアップする場合…
        console.log(i); //0,5,10,15,20,25,30,35,40,45
    }
</script>
```

### for 文のネスト
* ループ制御変数には慣例的に i, j, k が使われる
```
<script>
    for (var i = 1; i <= 5; i++) {
        for (var j = 1; j <= 5; j++) {
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
    for (var i = 1; i <= 20; i++) { //iは1,2,...19,20
        if ((i % 3) != 0) { //3で割り余りが0でない（＝3の倍数ではない）場合
            continue; //for文の残処理をスキップしてfor文の次の反復を開始する
        }
        console.log(i); //3,6,9,12,15,18 ←3の倍数
    }
</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2017年03月23日  


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
    for (var _indexNum in _array) {
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
    for (var _indexNum in _array) {
        console.log(_indexNum); //0→1
        console.log(_array[_indexNum]); //["x0y0","x1y0","x2y0"]→["x0y1","x1y1","x2y1"]
    }
</script>
```

### 連想配列（Object＝オブジェクトリテラル）の場合
```
<script>
    var _object = { name: "Takashi Nishimura", age: 49 };
    for (var _propName in _object) {
        console.log(_propName); //name→age
        console.log(_object[_propName]); //"Takashi Nishimura" → 49
    }
</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2017年03月23日  


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

### while 文と break 文
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
作成日：2017年03月23日  


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
* 例文
    ```
    <script>
        //正順（ 0...9 > A...Z  > a...z  > あ...ん  > ア...ン > 漢字 ）となる
        //全てを文字列に変換して比較（ "10" が "3"より優先）される

        var _array = ["C", "02", "A", "01", "03", "B"];
        console.log(_array.sort()); //["01", "02", "03", "A", "B", "C"]
        console.log(_array) //["01", "02", "03", "A", "B", "C"]（元配列も変更）
    </script>
    ```

* 逆順にする場合
    ```
    <script>
        //一度 Array.sort() で処理してから Array.reverse() で逆順にする

        var _array = ["05", "02", "04", "01", "03", "06"];
        console.log(_array.sort()); //["01", "02", "03", "04", "05", "06"]
        console.log(_array.reverse()) //["06", "05", "04", "03", "02", "01"]
    </script>
    ```

* 数値順にする場合  
    ```
    <script>
        //sort() は文字列に変換してから比較されるため [130, 15, 30] となる
        //数値順にソートする場合は以下のように記述する必要がある

        var _array = [15, 30, 130];
        _array.sort(
            function(a, b) {
                if (a < b) return -1;
                if (b > 1) return 1;
                return 0;
            }
        );
        console.log(String(_array)); //→[15,30,130]
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

1. for 文を使う方法
    ```
    <script>
        var _array = ["TARO", "HANAKO", "ICHIRO", "JIRO"];
        for (var _i = 0; _i < _array.length; _i++) {
            console.log(_array[_i]); //"TARO"→"HANAKO"→"ICHIRO"→"JIRO"
        }
    </script>
    ```

1. for...in 文を使う方法
    ```
    <script>
        var _array = ["TARO", "HANAKO", "ICHIRO", "JIRO"];
        for (var _index in _array) {
            console.log(_array[_index]); //"TARO"→"HANAKO"→"ICHIRO"→"JIRO"
        }
    </script>
    ```
* for each...in 文による記述方法もあるがブラウザによって動作せず

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2017年03月23日  


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
    for (var _propName in _object) {
        console.log(_propName + " : " + _object[_propName]);
    }
    //name : Takashi Nishimura
    //age : 49
    //hello : function() {...
</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2017年03月23日  


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

### クラス（プロトタイプ）内の this
```
<script>
    //MyClassクラス
    function MyClass() { //コンストラクタ
        document.write(this); //[object Object]（MyClassのインスタンス）
        this.__hoge = "擬似プライベート変数"; //thisは省略不可
    }
    MyClass.prototype.getHoge = function() { //アクセサ（getter）
        return this.__hoge; //thisは省略不可
    }

    //実行
    var _myClass = new MyClass();
    console.log(_myClass.getHoge()); //"擬似プライベート変数"
</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2017年03月23日  


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
作成日：2017年03月23日  


<a name="正規表現"></a>
# <b>正規表現</b>

* JavaScript には以下のサンプル以外にも多くの正規表現の機能が用意されています

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
* 文字パータンを表現するオブジェクト（ECMAScript 6 では RegExp クラス）のこと
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
作成日：2017年03月23日  


<a name="抽象クラス"></a>
# <b>抽象クラス</b>

### 概要
* JavaScript には、TypeScript（1.6〜）にある abstract や interface キーワードはない
* JavaScript では、継承と例外処理によって擬似的な抽象クラスを実現

### 例文
```
<script>
    //（擬似）抽象クラスの定義
    function AbstractClass() {}; //コンストラクタ
    AbstractClass.prototype.commonMethod = function() { //共通のメソッド
        console.log("AbstractClass.commonMethod()");
    }
    AbstractClass.prototype.eachMethod = function() { //抽象メソッド（実際の処理は記述しない）
        throw new Error("サブクラスで実装して下さい"); //例外処理
    }

    //サブクラス
    function SubClass() {}; //コンストラクタ
    SubClass.prototype = new AbstractClass(); //（擬似）抽象クラスの継承
    SubClass.prototype.eachMethod = function() { //オーバーライドして実際の処理を記述
        console.log("SubClass.eachMethod()"); //実際の処理
    }

    //実行
    var _subClass = new SubClass();
    _subClass.commonMethod(); //"AbstractClass.commonMethod()"
    _subClass.eachMethod(); //"SubClass.eachMethod()"
</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2017年03月23日  


<a name="オーバーライド"></a>
# <b>オーバーライド</b>

### 概要
* スーパークラスで定義したメソッドをサブクラスで再定義することをオーバーライドと呼ぶ
* （擬似）[抽象クラス](http://bit.ly/2mXbch6)でもこの方法を活用

### 例文
```
<script>
    //スーパークラス
    function SuperClass() {}; //コンストラクタ
    //↓サブクラスでオーバライドするメソッド
    SuperClass.prototype.myMethod = function() {
        console.log("SuperClass.myMethod()");
    }

    //サブクラス
    function SubClass() {}; //コンストラクタ
    SubClass.prototype = new SuperClass(); //（擬似）抽象クラスの継承
    //↓スーパークラスにある同名のメソッドを再定義＝オーバーライド
    SubClass.prototype.myMethod = function() {
        console.log("SubClass.myMethod()");
    }

    //実行
    var _subClass = new SubClass();
    _subClass.myMethod(); //"SubClass.myMethod()"
</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2017年03月23日  


<a name="カスタムイベント"></a>
# <b>カスタムイベント</b>

### 概要
JavaScript に実装されている ○.dispatchEvent() や ○.addEventListener() のターゲットに指定できるオブジェクトは Window、XMLHttpRequest、HTMLCanvasElement、ドキュメント上の単一のノード、ドキュメント自身などに限られるため、用途が限定されます。それとは異なりここで紹介する方法は、他の言語でも利用可能な汎用的な方法です。

### 例文
```
<script>
    //Robotクラス
    function Robot() { //コンストラクタ
        this.__energy = 80;
    }
    Robot.prototype.addEventListener = function(_event, _function) {
        if (_event == "die") {
            this.__dieHandler = _function; //匿名関数を変数に格納
        } else {
            //該当のイベントが無い場合、実行時にErrorを発生（オプション）
            throw new Error('Error:"' + _event + '"はサポートされていません');
        }
    }
    Robot.prototype.fight = function() {
        this.__energy -= 20;
        if (this.__energy <= 0) {
            this.__dieHandler(this); //←"die"イベントの発生（リスナー関数の呼出し）
        }
    }

    //実行
    var _robot = new Robot();
    _robot.addEventListener("die", die_robot); //イベントリスナーの設定
    _robot.fight();
    _robot.fight();
    _robot.fight();
    _robot.fight(); //"GAME OVER"

    //リスナー関数
    function die_robot(_robot) {
        console.log(_robot); //Robotクラスのインスタンス
        alert("GAME OVER");
    }
</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2017年03月23日  


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
作成日：2017年03月23日  

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
    function randomInt(_min, _max) {
        return Math.floor(Math.random() * (_max - _min + 1)) + _min;
    }

    //実験（1000万回繰返して精度を調べる）
    var _u5 = 0, _u4 = 0, _u3 = 0, _u2 = 0, _u1 = 0;
    var _o0 = 0, _o1 = 0, _o2 = 0, _o3 = 0, _o4 = 0, _o5 = 0;

    for (var i = 0; i < 10000000; i++) {
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
    //909416 909433 909328 909238 909005 907994 909124 909461 909113 908397 909491
</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2017年03月23日  


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
    console.log(_date); //Thu Mar 23 2017 16:04:08 GMT+0900 (JST)
    console.log(_date.getFullYear()); //2017
    console.log(_date.getMonth()); //2（3月）
    console.log(_date.getDate()); //23
    console.log(_date.getDay()); //4（木曜日）
    console.log(_date.getHours()); //16
    console.log(_date.getMinutes()); //4
    console.log(_date.getSeconds()); //8
    console.log(_date.getMilliseconds()); //612
    //"hh:mm:ss"で現在の時間を表示する方法
    var _h = (_date.getHours() < 10) ? "0" + _date.getHours() : _date.getHours();
    var _m = (_date.getMinutes() < 10) ? "0" + _date.getMinutes() : _date.getMinutes();
    var _s = (_date.getSeconds() < 10) ? "0" + _date.getSeconds() : _date.getSeconds();
    console.log(_h + ":" + _m + ":" + _s); //"16:04:08"
</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2017年03月23日  


<a name="タイマー"></a>
# <b>タイマー</b>

### 繰返し実行する
```
<script>
    _count = 0;
    //↓第3引数を使ってデータをcallbackFunctionの引数として送信することも可能
    _timerID = setInterval(callbackFunction, 1000); //1秒間隔で繰返す場合

    function callbackFunction() {
        if (++_count <= 10) { //10回繰返す場合…
            console.log(_count, "繰返し実行したい処理");
        } else {
            clearInterval(_timerID); //繰返しを止める
        }
    }
</script>
```

### 一度だけ実行する
```
<script>
    _timerID = setTimeout(callbackFunction, 1000); //1秒後に1回実行する場合
    function callbackFunction() {
        console.log("一度だけ実行したい処理");
        clearTimeout(_timerID);
    }
</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2017年03月23日  


<a name="処理速度計測"></a>
# <b>処理速度計測</b>

```
<script>
    var _start = new Date().getTime(); //1970年からの経過時間（ミリ秒）
    for (var i = 0; i < 1000000000; i++) { //10億回繰返す
        //速度計測したい処理
    }
    var _end = new Date().getTime();
    console.log(_end - _start); //2666（ミリ秒）
</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2017年03月23日  



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
* 上記の sample.txt と同階層に xxx.html として保存
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
作成日：2017年03月23日  