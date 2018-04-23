# <b>PHP 基礎文法</b>

### <b>INDEX</b>

* Hello,world! （[Linux](https://github.com/vvestvillage/HelloWorld/blob/master/languages/PHP/PHP_linux.md) / [macOS](https://github.com/vvestvillage/HelloWorld/blob/master/languages/PHP/PHP_mac.md) / [Windows](https://github.com/vvestvillage/HelloWorld/blob/master/languages/PHP/PHP_win.md)）
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
* [クラス定数･変数･メソッド](#クラス定数･変数･メソッド)
* [if 文](#if文)
* [三項演算子](#三項演算子)
* [switch 文](#switch文)
* [for 文](#for文)
* [foreach...as 文](#foreach...as文)
* [while 文](#while文)
* [配列（array）](#配列（array）)
* [連想配列（array）](#連想配列（array）)
* [$this](#$this)
* [文字列の操作](#文字列の操作)
* [正規表現](#正規表現)
* [抽象クラス](#抽象クラス)
* [parent キーワード](#parentキーワード) ≒ super
* [オーバーライド](#オーバーライド)
* [カスタムイベント](#カスタムイベント)
* [数学関数](#数学関数)
* [乱数](#乱数)
* [日時情報](#日時情報)
* [タイマー](#タイマー)
* [処理速度計測](#処理速度計測)
* [外部テキストの読み込み](#外部テキストの読み込み)
***


<a name='データ型'></a>
# <b>データ型</b>

### データ型の種類
1. boolean : 論理型
1. integer : 整数
1. double : 浮動小数点数
1. string : 文字列（"xxx"または’xxx’で指定／'xxx'の方が高速に処理）
1. array : 配列
1. object : オブジェクト
1. resource : 外部リソース
1. NULL : 変数に何も値が代入されていない

### 例文
```
<?php
    //index.php
    echo gettype(true).'<br>'; //'boolean'
    echo gettype(100).'<br>'; //'integer'
    echo gettype(100.0).'<br>'; //'double'
    echo gettype('100').'<br>'; //'string'
    echo gettype(array('nishimura',49)).'<br>'; //'array'
    echo gettype(new MyClass()).'<br>'; //'object'
    echo gettype(new PDO('sqlite::memory:', null, null)).'<br>'; //'object'
    echo gettype(NULL); //'NULL'
    class MyClass {};
?>
```

実行環境：PHP 7.0、Ubuntu 16.04 LTS、Chromium 56  
作成者：vvestvillage  
作成日：2017年03月31日


<a name='データ型の操作'></a>
# <b>データ型の操作</b>

### gettype() 関数
* データ型を文字列で返す
    ```
    <?php
        //index.php
        echo gettype(true).'<br>'; //'boolean'
        echo gettype(100).'<br>'; //'integer'
        echo gettype(100.0).'<br>'; //'double'
        echo gettype('100').'<br>'; //'string'
        echo gettype(array('nishimura',49)).'<br>'; //'array'
        echo gettype(new MyClass()).'<br>'; //'object'
        echo gettype(new PDO('sqlite::memory:', null, null)).'<br>'; //'object'
        echo gettype(NULL); //'NULL'
        class MyClass {};
    ?>
    ```

### is_xxx() 関数
* データ型が一致するか boolean 型で返す（「1」または「」で出力される）
    * is_bool() : 論理値
    * is_int() : 整数
    * is_float() : 浮動小数点数
    * is_numeric() : 数値文字列を含む、整数 or 浮動小数点数
    * is_string() : 文字列
    * is_array() : 配列
    * is_object() : オブジェクト
    * is_resource() : 外部リソース
    * is_NULL() : NULL値
    ```
    <?php
        echo is_int(100.0).'<br>'; //「」（FALSE）
        echo is_float(100.0).'<br>'; //「1」（TRUE）
        echo is_numeric(100.0).'<br>'; //「1」（TRUE）
        echo is_numeric('100.0'); //「1」（TRUE）
    ?>
    ```

### var_dump() 関数
* 値の情報を echo を使わずに出力する
    ```
    <?php
        var_dump(true); //bool(true) 
        var_dump(100); //int(100) 
        var_dump(100.0); //float(100) 
        var_dump('100'); //string(3) '100'
        var_dump(array('nishimura',49)); //array(2) { [0]=> string(9) 'nishimura' [1]=> int(49) }
        var_dump(new MyClass()); //object(MyClass)#1 (0) { }
        var_dump(new PDO('sqlite::memory:',null,null)); //object(PDO)#1 (0) { }
        var_dump(NULL); //NULL
        class MyClass {};
    ?>
    ```

### データ型のキャスト（変換）

1. settype() 関数 による変換
    ```
    <?php
        //①数値→boolean型
        $var = 1;
        settype($var, 'boolean');  //'bool'でも可
        echo $var.'<br>'; // 1（TRUE）
        echo gettype($var).'<br>'; //'boolean'

        //①浮動小数点数→integer型（小数点以下を切捨て整数化）
        $var = '3.99';  // 数値の 3.99 でも同じ
        settype($var, 'integer');  //'int'でも可
        echo $var.'<br>'; //3
        echo gettype($var).'<br>'; //'integer'

        //数字以外を含む値をinteger型に変換
        $var = '3.99円です'; 
        settype($var, 'integer');
        echo $var.'<br>'; //3（前方から数値化できる文字列のみ変換）
        echo gettype($var).'<br>'; //'integer'

        //double型へ変換
        $var = '3.99円です'; //数値の 3.99 や文字列の '3.99' でも同じ
        settype($var, 'float');
        echo $var.'<br>'; //3.99（前方から数値化できる文字列のみ変換）
        echo gettype($var).'<br>'; //'double'

        //string型へ変換
        $var = 100;
        settype($var, 'string');
        echo $var.'<br>'; //'100'
        echo gettype($var).'<br>'; //'string'

        //array型へ変換
        $var = 'nishimura';
        settype($var, 'array');
        echo $var[0].'<br>'; //'nishimura'
        echo gettype($var).'<br>'; //'array'
    ?>
    ```

1. 型キャストによる変換
    ```
    <?php
        //boolean型へ変換
        $var = 1;
        $var = (bool)$var;  //(boolean) でも可
        echo $var.'<br>'; //1（TRUE）
        echo gettype($var).'<br>'; //'boolean'

        //integer型へ変換（小数点以下を切り捨てて整数化）
        $var = '3.99円です'; //数値の 3.99 や文字列の '3.99' でも同じ
        $var = (int)$var; //(integer) でも可
        echo $var.'<br>'; //3（前方から数値化できる文字列のみ変換）
        echo gettype($var).'<br>'; //'integer'

        //double型へ変換
        $var = '3.99円です'; //数値の 3.99 や文字列の '3.99' でも同じ
        $var = (float)$var;  //(double) や (real) でも可
        echo $var.'<br>'; //3.99（前方から数値化できる文字列のみ変換）
        echo gettype($var).'<br>'; //'double'

        //string型へ変換
        $var = 100;
        $var = (string)$var;
        echo $var.'<br>'; //'100'
        echo gettype($var).'<br>'; //'string'

        //array型へ変換
        $var = 'nishimura'; 
        $var = (array)$var;
        echo $var[0].'<br>'; //'nishimura'
        echo gettype($var).'<br>'; //'array'
    ?>
    ```

1. intval()、floatval()、strval() 関数による変換
    ```
    <?php
        //integer型へ変換（小数点以下を切り捨てて整数化）
        $var = '3.99円です'; //数値の 3.99 や文字列の '3.99' でも同じ
        $var = intval($var); 
        echo $var.'<br>'; //3（前方から数値化できる文字列のみ変換）
        echo gettype($var).'<br>'; //'integer'

        //double型へ変換
        $var = '3.99円です'; //数値の 3.99 や文字列の '3.99' でも同じ
        $var = floatval($var);  //doubleval() と同じ
        echo $var.'<br>'; //3.99（前方から数値化できる文字列のみ変換）
        echo gettype($var).'<br>'; //'double'

        //string型へ変換
        $var = 100;
        $var = strval($var); 
        echo $var.'<br>'; //'100'
        echo gettype($var).'<br>'; //'string'
    ?>
    ```

実行環境：PHP 7.0、Ubuntu 16.04 LTS、Chromium 56  
作成者：vvestvillage  
作成日：2017年03月31日


<a name='クラス'></a>
# <b>クラス</b>

```
<?php

//長方形クラス（前方宣言である必要はない）
class Rectangle {
    //プロパティの初期値の設定（private、protected、publicのいずれかで宣言）
    private $width = 0;
    private $height = 0;
    
    //コンストラクタ（同名の関数がある場合こちらを優先／省略時はpublic扱い）
    function __construct($width = 640, $height = 480) {
        $this->width = $width;
        $this->height = $height;
    }

    //アクセサ（getter）
    public function __get($name){
        return $this->$name;
    }

    //アクセサ（setter）
    public function __set($name, $value){
        $this->$name = $value;
    }
    
    //面積を計算して値を返す
    public function getArea() {
        return $this->width * $this->height; 
    }
}

//①インスタンスの生成
$rectangle = new Rectangle();

//②プロパティの確認と変更
echo $rectangle->width.'<br>'; //640
echo $rectangle->height.'<br>'; //480
$rectangle->width = 1920;
$rectangle->height = 1080;
echo $rectangle->width.'<br>'; //1920
echo $rectangle->height.'<br>'; //1080

//③メソッドの実行
echo $rectangle->getArea(); //2073600

?>
```

実行環境：PHP 7.0、Ubuntu 16.04 LTS、Chromium 56  
作成者：vvestvillage  
作成日：2017年03月31日  


<a name='スーパークラスとサブクラス'></a>
# <b>スーパークラスとサブクラス</b>
* スーパークラスのプロパティを private にしたい場合は[マジックメソッド](http://php.net/manual/ja/language.oop5.magic.php)の __get() ではなく get_xxx() 等と記述する必要がある。

```
<?php

/****************************************************
スーパークラス
****************************************************/
class SuperClass {
    //①プロパティの定義
    protected $pSuperClass = 'スーパークラスのプロパティ'; //protectedにする

    //コンストラクタ
    function __construct($arg) {}

    //アクセサの定義（今回はサブクラスでオーバーライドされるので不要）
    public function __get($name){
        return $this->$name;
    }

    //③メソッドの定義
    public function mSuperClass() {
        return 'スーパークラスのメソッド';
    }
}

/****************************************************
サブクラスＡ（スーパークラスを継承／多重継承は不可）
****************************************************/
class SubClassA extends SuperClass { //スーパークラスを継承
    //①プロパティの定義
    private $pSubClassA = 'サブクラスＡのプロパティ';

    //コンストラクタ
    function __construct() {}

    //②アクセサの定義（setterは省略）
    public function __get($name){
        return $this->$name;
    }

    //③メソッドの定義
    public function mSubClassA() {
        return 'サブクラスＡのメソッド';
    }
}

/****************************************************
サブクラスＢ（スーパークラスを継承／多重継承は不可）
****************************************************/
class SubClassB extends SuperClass { //スーパークラスを継承
    //①プロパティの定義
    private $pSubClassB = 'サブクラスＢのプロパティ';

    //コンストラクタ
    function __construct() {}

    //②アクセサの定義（setterは省略）
    public function __get($name){
        return $this->$name;
    }

    //③メソッドの定義
    public function mSubClassB() {
        return 'サブクラスＢのメソッド';
    }
}

/****************************************************
実行
****************************************************/
//サブクラスＡのインスタンス
$subClassA =  new SubClassA(); //サブクラスAからインスタンスを生成
echo $subClassA->pSuperClass.'<br>'; // 'スーパークラスのプロパティ'
echo $subClassA->pSubClassA.'<br>'; // 'サブクラスＡのプロパティ'
echo $subClassA->mSuperClass().'<br>'; // 'スーパークラスのメソッド'
echo $subClassA->mSubClassA().'<br>'; // 'サブクラスＡのメソッド'

//サブクラスＢのインスタンス
$subClassB =  new SubClassB(); //サブクラスBからインスタンスを生成
echo $subClassB->pSuperClass.'<br>'; // 'スーパークラスのプロパティ'
echo $subClassB->pSubClassB.'<br>'; // 'サブクラスＢのプロパティ'
echo $subClassB->mSuperClass().'<br>'; // 'スーパークラスのメソッド'
echo $subClassB->mSubClassB(); // 'サブクラスＢのメソッド'

?>
```

実行環境：PHP 7.0、Ubuntu 16.04 LTS、Chromium 56  
作成者：vvestvillage  
作成日：2017年04月01日


<a name='名前空間'></a>
# <b>名前空間</b>

```
<?php
    namespace com\xxx;
    class SomeClass {
        function __construct() {
            echo 'com\xxx\SomeClass'.'<br>';
        }
    }

    namespace net\xxx;
    class SomeClass {
        function __construct() {
            echo 'net\xxx\SomeClass'.'<br>';
        }
    }

    //同じクラス名でもコンフリクト（衝突）を起こさない
    //先頭にバックスラッシュは必須
    $someClass1 = new \com\xxx\SomeClass();
    $someClass2 = new \net\xxx\SomeClass();
?>
```

実行環境：PHP 7.0、Ubuntu 16.04 LTS、Chromium 56  
作成者：vvestvillage  
作成日：2017年04月01日


<a name='継承と委譲'></a>
# <b>継承と委譲</b>

### 概要

* GoF デザインパターンの [Adapter パターン](http://bit.ly/2naab8x)等で利用される
* 継承の場合は <b>extends クラス名</b> を使い、委譲の場合は <b>new クラス名()</b> を使ってオブジェクトを生成し、他のクラスの機能を利用する

### 継承版

```
<?php

class ClassA {
    public function myMethod() {
        return 'ClassA.myMethod';
    }
}

class ClassB extends ClassA { //ClassAを継承
}

$classB = new ClassB();
echo $classB->myMethod(); //'ClassA.myMethod'

?>
```

### 委譲版

```
<?php

class ClassA {
    public function myMethod() {
        echo 'ClassA.myMethod';
    }
}

class ClassB extends ClassA { //ClassAを継承
    private $classA;
    
    //コンストラクタ（同名の関数がある場合こちらを優先／省略時はpublic扱い）
    function __construct() {
        $this->classA = new ClassA(); //コンストラクタ内でオブジェクトを生成（委譲）
    }
    public function myMethod() {
        $this->classA->myMethod(); //ClassAのmyMethod()を実行
    }
}

$classB = new ClassB();
echo $classB->myMethod(); //'ClassA.myMethod'

?>
```

実行環境：PHP 7.0、Ubuntu 16.04 LTS、Chromium 56  
作成者：vvestvillage  
作成日：2017年04月01日


<a name='変数とスコープ'></a>
# <b>変数とスコープ</b>

### 変数の種類

1. グローバル変数 : プログラム全体からアクセス可能
1. private 変数 : クラス内でのみアクセス可能
1. protected 変数 : クラスまたはサブクラス内でみアクセス可能
1. public 変数 : クラス外からもアクセス可能
1. ローカル変数 : 関数またはメソッド内でのみアクセス可能
* 文字列に変数を含む場合、ダブルクォーテーション（""）で囲む必要がある

### グローバル変数
* Windowオブジェクトのプロパティ

```
<?php

/******************
グローバル変数定義
******************/
$global = 'グローバル変数';

/*****************************
関数内でのグローバル変数の扱い
*****************************/
function myFunction() {
    global $global; //カンマ（,）で複数指定可能
    echo $global.'<br>'; //'グローバル変数'
}
myFunction();

/*******************************
クラス内でのグローバル変数の扱い
*******************************/
class MyClass {
    function __construct() {
        global $global; //カンマ（,）で複数指定可能
        echo $global.'<br>'; //'グローバル変数'
    }
}
new MyClass();

?>
```

### プライベート変数
* 変数へのアクセスは __get()、 __set() を利用する
* クラス内とサブクラス内でのみアクセス可能な protected もあり

```
<?php

class MyClass {
    //プライベート変数の宣言
    private $propA;
    
    //コンストラクタ
    function __construct() {
        //プライベート変数の初期化
        $this->propA = 'いろは';
    }

    //アクセサ（getter）
    public function __get($name){
        return $this->$name;
    }

    //アクセサ（setter）
    public function __set($name, $value){
        $this->$name = $value;
    }
}

//①インスタンスの生成
$myClass = new MyClass();

//②プロパティの確認と変更
echo $myClass->propA.'<br>'; //'いろは'
$myClass->propA = 'ABC'; //値の変更
echo $myClass->propA.'<br>'; //'ABC'

?>
```

### ローカル変数
* 関数またはメソッド内でのみアクセス可能

1. 関数内で定義した場合
    ```
    <?php

    $var = 'GLOBAL';  //グローバル変数の定義

    function myFunction1() {
        //ローカル変数定義
        $local = 'ローカル変数';
        echo $local; //'ローカル変数'
    }

    function myFunction2() {
        //echo $local; //アクセス不可
    }

    myFunction1(); //'ローカル変数'
    //myFunction2(); //アクセス不可
    //echo $local; //アクセス不可

    ?>
    ```

1. メソッド内で定義した場合
    ```
    <?php

    class MyClass {
        public function myMethod1() {
            //ローカル変数定義
            $local = 'ローカル変数';
            echo $local; //'ローカル変数'
        }
        public function myMethod2() {
            //echo $local; //アクセス不可
        }
    }

    //①インスタンスの生成
    $myClass = new MyClass();
    $myClass->myMethod1();
    $myClass->myMethod2();

    ?>
    ```

1. for文内で定義した場合
    ```
    <?php
        for ($i = 0; $i < 10; $i++) {
            echo $i.'<br>'; //0,1,2,...,8,9
        }
        echo $i; //10（for文の外でも有効）
    ?>
    ```

実行環境：PHP 7.0、Ubuntu 16.04 LTS、Chromium 56  
作成者：vvestvillage  
作成日：2017年04月01日


<a name='アクセサ'></a>
# <b>アクセサ （getter / setter）</b>

### 読書き可能なプロパティ
```
<?php

class Nishimura {
    //private プロパティの宣言
    private $age;
    
    //コンストラクタ
    function __construct($age) {
        $this->age = $age;
    }

    //アクセサ（getter）
    public function __get($name){
        return $this->$name;
    }

    //アクセサ（setter）
    public function __set($name, $value){
        $this->$name = $value;
    }
}

$nishimura = new Nishimura(49);
echo $nishimura->age.'<br>'; //49
$nishimura->age = 50; //変更が可能
echo $nishimura->age.'<br>'; //50

?>
```

### 読取り専用のプロパティ
```
<?php

class Nishimura {
    //private プロパティの宣言
    private $age;
    
    //コンストラクタ
    function __construct($age) {
        $this->age = $age;
    }

    //アクセサ（getter）
    public function __get($name){
        return $this->$name;
    }

    //アクセサ（setter）
    public function __set($name, $value){
        throw new Exception('値の変更はできません');
    }
}

$nishimura = new Nishimura(49);
echo $nishimura->age.'<br>'; //49
//$nishimura->age = 50; //'Fatal error: Uncaught Exception: 値の変更はできません'

?>
```

実行環境：PHP 7.0、Ubuntu 16.04 LTS、Chromium 56  
作成者：vvestvillage  
作成日：2017年04月02日


<a name='演算子'></a>
# <b>演算子</b>

### 算術演算子
（複合代入演算子 += -= *= /= %= などもあり）
```
<?php
    echo (3 + 2).'<br>'; //5 (可算)
    echo (5 - 8).'<br>'; //-3 (減算)
    echo (3 * 4).'<br>'; //12 (乗算)
    echo (1 + 2 * 3 - 4 / 2).'<br>'; //5 (複雑な計算)
    echo (63 % 60).'<br>'; //3 (余剰)
    echo (8 / 3); //2.6666666666667（除算)
?>
```

### 後ろに付けるインクリメント／デクリメント
```
<?php
    //インクリメント
    $huga = 0;
    $piyo = $huga++; //加算する前の$hugaの値を返す
    echo $huga.'<br>'; //1
    echo $piyo.'<br>'; //0

    //デクリメント
    $huga = 0;
    $piyo = $huga--; //減算する前の$hugaの値を返す
    echo $huga.'<br>'; //-1
    echo $piyo; //0
?>
```

### 前に付けるインクリメント／デクリメント
```
<?php
    //インクリメント
    $huga = 0;
    $piyo = ++$huga; //加算後の$hugaの値を返す
    echo $huga.'<br>'; //1
    echo $piyo.'<br>'; //1

    //デクリメント
    $huga = 0;
    $piyo = --$huga; //減算後の$hugaの値を返す
    echo $huga.'<br>'; //-1
    echo $piyo; //-1
?>
```

### その他の演算子
```
<?php
    echo (true && true).'<br>'; //「1」＝true（論理積）
    echo (true || false).'<br>'; //「1」＝true（論理和）
    echo (! true).'<br>'; //「」＝false（否定）

    echo (2 < 3).'<br>'; //「1」＝true（比較/未満）
    echo (2 <= 2).'<br>'; //「1」＝true（比較/以下）
    echo (1 == 1.0).'<br>'; //「1」＝true（等号）
    echo (1 != 1.0).'<br>'; //「」＝false（不等号）

    echo (3 & 1).'<br>'; //1（ビット積）
    echo (3 | 1).'<br>'; //3（ビット和）
    echo (3 ^ 1).'<br>'; //2（排他的ビット和）
    echo (2 << 7).'<br>'; //256（ビット･シフト）
    echo ~3; //-4（ビット反転）
?>
```

実行環境：PHP 7.0、Ubuntu 16.04 LTS、Chromium 56  
作成者：vvestvillage  
作成日：2017年04月03日


<a name='定数'></a>
# <b>定数</b>

### ルール
* const 定数名 = 値;
* 定数名の頭文字には「$（ドル記号）」は付けない
* 関数内で定義してもローカル変数扱いにはならない
* 定数を変更しようとするとエラーが発生

### 通常の定数
```
<?php
    const MY_NAME = 'vvestvillage';
    echo MY_NAME; //'vvestvillage'
    //MY_NAME = 'ICHIRO YOSHIMURA'; //error（変更不可）
?>
```

### クラス定数（オブジェクト定数）
```
<?php
    class MyMath {
        const PI = 3.141592653589793; //クラス定数（オブジェクト定数）の定義
        
        //コンストラクタ
        function __construct() {
            echo seft::PI; //3.1415926535898（小数点第13位まで）
        }
    }

    echo MyMath::PI; //3.141592653589793
    //MyMath::PI = 3.14; //error（変更不可）
?>
```

実行環境：PHP 7.0、Ubuntu 16.04 LTS、Chromium 56  
作成者：vvestvillage  
作成日：2017年04月03日  


<a name='メソッド'></a>
# <b>メソッド</b>


### パブリックメソッド
```
<?php
    class MyClass {
        public function tashizan($start, $end) {
            $result = 0; //ローカル変数（関数内のみ有効）
            for ($i = $start; $i <= $end; $i++) {
                $result += $i;
            }
            return $result;
        }
    }

    $myClass = new MyClass();
    echo $myClass->tashizan(1, 10).'<br>'; //55
    echo $myClass->tashizan(1, 100); //5050
?>
```

### プライベートメソッド
* 他にも、クラスまたはサブクラス内でのみアクセス可能な protected メソッドもあり
```
<?php
    class MyClass {
        //コンストラクタ
        function __construct() {
            echo $this->tashizan(1, 10).'<br>'; //55
            echo $this->tashizan(1, 100); //5050
        }

        //privateメソッド
        private function tashizan($start, $end) {
            $result = 0; //ローカル変数（関数内のみ有効）
            for ($i = $start; $i <= $end; $i++) {
                $result += $i;
            }
            return $result;
        }
    }

    $myClass = new MyClass();
    //echo $myClass->tashizan(1, 10); //error（アクセス不可）
?>
```

### コンストラクタ
```
<?php
    class Point {
        private $x, $y; //private変数の宣言

        //コンストラクタ
        function __construct($x = 0, $y = 0) {
            //private変数の初期化
            $this->x = $x;
            $this->y = $y;
        }

        //アクセサ（getter）
        public function __get($name){
            return $this->$name;
        }

        //アクセサ（setter）
        public function __set($name, $value){
            $this->$name = $value;
        }
    }

    $point = new Point(100, 150); //ここでコンストラクタを呼び出す
    echo $point->x.'<br>'; //100
    echo $point->y; //150
?>
```

### 静的メソッド（クラスメソッド）
* インスタンス化せずにメソッドを利用することが可能
```
<?php
    class MyMath {
        function __construct() {} //コンストラクタ

        //クラスメソッド（public static functin メソッド名()）
        public static function pow($arg1, $arg2) {
            if ($arg2 == 0) { return 1; } //0乗対策
            $result = $arg1;
            for ($i = 1; $i < $arg2; $i++) {
                $result = $result * $arg1;
            }
            return $result;
        }
    }

    echo MyMath::pow(2, 0).'<br>'; //1（2の0乗）
    echo MyMath::pow(2, 1).'<br>'; //2（2の1乗）
    echo MyMath::pow(2, 8).'<br>'; //256（2の8乗）
?>
```

### デフォルト値付き引数
```
<?php
    class MyClass {
        private $point; //プライベート変数の宣言

        function __construct() { //コンストラクタ
            $this->point = 0; //プライベート変数の初期化
        }

        public function addPoint($arg = 1) { //初期値を1とした場合
            $this->point += $arg;
            return $this->point;
        }
    }

    $myClass = new MyClass();
    echo $myClass->addPoint().'<br>'; //1
    echo $myClass->addPoint(10); //11
?>
```

### 可変長引数
* 引数を固定の数ではなく任意の数にすることが可能
```
<?php
    class MyClass {
        public function sum(...$args) { //...$引数名 で可変長引数
            $result = 0;
            foreach ($args as $data) {
                $result += $data;
            }
            echo $result.'<br>';
        }
    }

    $myClass = new MyClass();
    $myClass->sum(1, 2); //3（1+2）
    $myClass->sum(1, 2, 3, 4, 5); //15（1+2+3+4+5）
?>
```

実行環境：PHP 7.0、Ubuntu 16.04 LTS、Chromium 56  
作成者：vvestvillage  
作成日：2017年04月03日


<a name='匿名関数'></a>
# <b>匿名関数</b>
* PHP では「無名関数」と呼ばれる
* クラス内で匿名関数を扱う場合、実行時に call_user_func() を使う必要がある

### 通常の匿名関数
```
<?php
    $myFunction = function($arg) {
        echo '引数は $arg です';
    };

    $myFunction('hoge'); //'引数は hoge です'
?>
```

### クラス内の匿名関数
```
<?php
    class MyClass {
        public $american, $japanese, $chinese; //プライベート変数宣言
        public $hello; //パブリック変数宣言（通常はプライベート変数＆アクセサを利用する

        function __construct() { //コンストラクタ
            $this->american = function($name) { //匿名関数①
                echo $name.','.'Hello!'.'<br>';
            };

            $this->japanese = function($name) { //匿名関数②
                echo $name.'、'.'こんにちは!'.'<br>';
            };

            $this->chinese = function($name) { //匿名関数③
                echo $name.','.'你好!'.'<br>';
            };

            //パブリック変数に匿名関数を代入
            $this->hello = $this->american;
        }

        //アクセサ（getter）
        public function __get($name){
            return $this->$name;
        }

        //アクセサ（setter）
        public function __set($name, $value){
            $this->$name = $value;
        }

        //匿名関数の入替え
        public function change($language) {
            switch ($language) {
                case 'american': $this->hello = $this->american; break;
                case 'japanese': $this->hello = $this->japanese; break;
                case 'chinese': $this->hello = $this->chinese; break;
            }
        }
    }

    //実行（ $myClass->hello('xxx'); ではエラー）
    $myClass = new MyClass();
    call_user_func($myClass->hello, 'TARO'); //'TARO,Hello!'

    $myClass->change('japanese');
    call_user_func($myClass->hello, 'たかし'); //'たかし、こんにちは!'

    $myClass->change('chinese');
    call_user_func($myClass->hello, 'たかし'); //'たかし,你好!'
?>
```

実行環境：PHP 7.0、Ubuntu 16.04 LTS、Chromium 56  
作成者：vvestvillage  
作成日：2017年04月03日  


<a name='クラス定数･変数･メソッド'></a>
# <b>クラス定数･変数･メソッド</b>
* クラス定数･クラス変数･クラスメソッドは、クラスをインスタンス化せずにアクセスが可能
* self::クラス定数 で同じクラス内からアクセス可能
```
<?php
    class MyMath {
        const PI = 3.141592653589793; //クラス定数（オブジェクト定数）の定義
        public static $lastUpdate = '2017-04-03'; //クラス変数（オブジェクト変数）の定義

        function __construct() { //コンストラクタ
            echo self::PI; //3.1415926535898（同じクラス内からクラス定数にアクセスする方法）
        }

        //静的メソッド（静的メソッド）の定義
        public static function pow($arg1, $arg2) {
            if ($arg2 == 0) { return 1; } //0乗対策
            $result = $arg1;
            for ($i = 1; $i < $arg2; $i++) {
                $result = $result * $arg1;
            }
            return $result;
        }
    }

    new MyMath();

    echo MyMath::PI.'<br>'; //3.141592653589793
    //MyMath::PI = 3.14; //error: 値の変更はできません

    echo MyMath::$lastUpdate.'<br>'; //'2017-04-03'
    MyMath::$lastUpdate = '2017-04-04'; //クラス変数（オブジェクト変数）の変更
    echo MyMath::$lastUpdate.'<br>'; //'2017-04-04'

    //静的メソッドの実行
    echo MyMath::pow(2, 0).'<br>'; //1（2の0乗）
    echo MyMath::pow(2, 1).'<br>'; //2（2の1乗）
    echo MyMath::pow(2, 8).'<br>'; //256（2の8乗）
?>
```

実行環境：PHP 7.0、Ubuntu 16.04 LTS、Chromium 56  
作成者：vvestvillage  
作成日：2017年04月03日  


<a name='if文'></a>
# <b>if 文</b>

### 基本例文
* trueと評価される可能性が高い順に並べるとif文を早く抜け出せる可能性が高い
```
<?php
    $age = 49;
    if ($age <= 20) {
        echo '20歳以下';
    } elseif ($age <= 40) {
        echo '21〜40歳';
    } elseif ($age <= 60) {
        echo '41〜60歳'; //これが出力される
    } else {
        echo '61歳以上';
    }
?>
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
    } elseif (条件②) {
        処理A ←条件式②がtrueの場合に実行
    } else {
        処理B
    }
    ```

### 排他的論理和（XOR）
* 2つの条件のうちどちらか一方だけ true の場合
1. ^ 演算子を使う方法
    ```
    <?php
        $a = true;
        $b = false;
        if ($a ^ $b) {
            echo 'どちらか一方だけ true です';
        } else {
            echo '両方共に true か false です';
        }
    ?>
    ```

2. ^ 演算子を使わない場合
    ```
    <?php
        $a = true;
        $b = false;
        if (($a || $b) && !($a && $b)) {
            echo 'どちらか一方だけ true です';
        } else {
            echo '両方共に true か false です';
        }
    ?>
    ```

実行環境：PHP 7.0、Ubuntu 16.04 LTS、Chromium 56  
作成者：vvestvillage  
作成日：2017年04月03日  


<a name='三項演算子'></a>
# <b>三項演算子</b>

### 比較式が１つの場合
* 構文
```
データ型 変数名 = (比較式) ? (true時の返り値) : (false時の返り値);
```
* 例文
```
<?php
    $age = 49;
    $result = ($age < 60) ? '現役' : '退職';
    echo $result; //'現役'
?>
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
<?php
    $age = 49;
    $result = ($age < 20) ? '未成年' :
    $result = ($age < 60) ? '現役' :
    $result = '退職';
    echo $result; //'現役'
?>
```

実行環境：PHP 7.0、Ubuntu 16.04 LTS、Chromium 56  
作成者：vvestvillage  
作成日：2017年04月03日  


<a name='switch文'></a>
# <b>switch 文</b>

### 判別式が boolean 値ではない場合
```
<?php
    $name = 'TARO';
    switch ($name) {
        case 'TARO':
            echo '父'; //これが出力される
            break;
        case 'HANAKO':
            echo '母';
            break;
        case 'ICHIRO':
            echo '長男';
            break;
        case 'JIRO':
            echo '次男';
            break;
        default:
            echo '家族以外';
            break; //省略可
    }
?>
```

### 判別式が boolean 値の場合
* case 式に比較演算子が使われる
```
<?php
    $age = 49;
    switch (true) {
        case $age <= 20:
            echo '20歳以下';
            break;
        case $age <= 40:
            echo '21〜40歳';
            break;
        case $age <= 60:
            echo '41〜60歳'; //これが出力される
            break;
        default:
            echo '61歳以上';
            break; //省略可
    }
?>
```

### break文が無い使い方
* [C#](https://ja.wikipedia.org/wiki/C_Sharp) のようなフォールスルー禁止規則（何か処理をしておきながら break を書かないとエラー）は無い
```
<?php
    $name = 'JIRO';
    switch ($name) {
        case 'TARO':
        case 'HANAKO':
            echo '親です';
            break;
        case 'ICHIRO':
        case 'JIRO':
            echo '子供です'; //これが出力される
            break;
        default:
            echo '家族ではありません';
            break; //省略可
    }
?>
```

実行環境：PHP 7.0、Ubuntu 16.04 LTS、Chromium 56  
作成者：vvestvillage  
作成日：2017年04月04日


<a name='for文'></a>
# <b>for 文</b>

### ループカウンタの宣言方法
```
<?php
    for ($i = 0; $i < 10; $i++) {
        echo $i.','; //0,1,2,3,4,5,6,7,8,9,
    }
    echo $i; //10（for文の外でも有効）
?>
```

### ループカウンタを○つずつアップする
```
<script>
    for (let i = 0; i < 50; i += 5) { //5つずつアップする場合…
        console.log(i).','; //0,5,10,15,20,25,30,35,40,45
    }
</script>
```

### for 文のネスト
* ループ制御変数には慣例的に $i, $j, $k が使われる
```
<?php
    for ($i = 1; $i <= 5; $i++) {
        for ($j = 1; $j <= 5; $j++) {
            echo 'x'.$i.'y'.$j.'<br>'; //x1y1,x1y2,....,x5y4,x5y5
        }
    }
?>
```

### 無限ループと break 文
```
<?php
    $count = 0;
    for (;;) { //①初期化②ループ判定式③更新処理の全てを省略する
        $count++;
        if ($count > 100) break; //ループを終了
        echo $count.','; //1,2,....,99,100,
    }
    echo 'for文終了';
?>
```

### for 文と continue 文
```
<?php
    for ($i = 1; $i <= 20; $i++) { //iは1,2,...19,20
        if (($i % 3) != 0) { //3で割り余りが0でない（＝3の倍数ではない）場合
            continue; //for文の残処理をスキップしてfor文の次の反復を開始する
        }
        echo $i.','; //3,6,9,12,15,18,（3の倍数）
    }
?>
```

実行環境：PHP 7.0、Ubuntu 16.04 LTS、Chromium 56  
作成者：vvestvillage  
作成日：2017年04月04日


<a name='foreach...as文'></a>
# <b>foreach...as 文</b>

### 配列（1次元）の場合
```
<?php
    $array = array('TARO', 'HANAKO', 'ICHIRO', 'JIRO');
    foreach ($array as $data) {
        echo $data."<br>"; //'CHIKASHI'→'TOMOKO'→'TORU'→'HANAKO'
    }
?>
```

### 配列（2次元）の場合
```
<?php
    $array = array(
        array('x0y0', 'x1y0', 'x2y0'), //0行目
        array('x0y1', 'x1y1', 'x2y1'), //1行目
    );
    foreach ($array as $tmp) {
        foreach($tmp as $data) {
            echo $data."<br>"; //'x0y0'→'x1y0'→'x2y0'→'x0y1'→x1y1'→'x2y1'
        }
    }
?>
```

### 連想配列の場合
```
<?php
    $array = array('name'=>'vvestvillage', 'age'=>49);
    foreach ($array as $data) {
        echo $data.'<br>'; //'vvestvillage'→49
    }
?>
```

実行環境：PHP 7.0、Ubuntu 16.04 LTS、Chromium 56  
作成者：vvestvillage  
作成日：2017年04月04日


<a name='while文'></a>
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
<?php
    $i = 0;
    while ($i < 10) { //ループ判定式にはboolean値しか使えない
        echo $i.","; //0,1,2,3,4,5,6,7,8,9,
        $i++;
    }
?>
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
<?php
    $i = 0;
    do {
        echo $i; //0 ←ループ判定式はfalseだが１回実行される
        $i++;
    } while ($i < 0);
?>
```

### while 文と break 文
* 例文（1〜100までを出力）
```
<?php
    $count = 0;
    while (true) { //ループ判別式をtrueにすると無限ループに
        $count++;
        if ($count > 100) {
            break; //break文を使ってループを終了（while文の次の行へ）
        }
        echo $count.","; //1,2,....,99,100,
    }
?>
```

### while 文と continue 文
* 例文（3の倍数を出力）
```
<?php
    $i = 1;
    while ($i <= 20) {
        if (($i % 3) != 0) { //3で割って余りが0ではない（＝3の倍数ではない）場合
            $i++;
            continue; //while文の残処理をスキップしてwhile文の次の反復を開始する
        }
        echo $i.","; //3,6,9,12,15,18,（3の倍数）
        $i++;
    }
?>
```

実行環境：PHP 7.0、Ubuntu 16.04 LTS、Chromium 56  
作成者：vvestvillage  
作成日：2017年04月04日


<a name='配列（array）'></a>
# <b>配列（array）</b>

### 作成
* array 関数を使う方法
    ```
    $array1 = array(); //空の配列を作成
    $array2 = array('A', 'I');
    $array3 = array(array('A','あ'), array('I','い')); //配列のネスト
    ```

* 角カッコ構文を使う方法
    ```
    $array[0] = 'A';
    $array[1] = 'I';
    //１つの文で複数の要素を作成することはできません。
    ```

### 要素の数
```
<?php
    $array = array('00', '01', '02', '03');
    echo count($array); //4
?>
```

### 追加（最後）
```
<?php
    $array = array('ICHIRO', 'JIRO');
    array_push($array, 'TARO', 'HANAKO'); //カンマ（,）を使って複数同時に追加可能
    foreach ($array as $data) {
        echo $data.'<br>'; //'ICHIRO'→'JIRO'→'TARO'→'HANAKO'
    }
?>
```

### 追加（先頭）
```
<?php
    $array = ['ICHIRO', 'JIRO'];
    array_unshift($array, 'TARO', 'HANAKO'); //カンマ（,）を使って複数同時に追加可能
    foreach ($array as $data) {
        echo $data.'<br>'; //'TARO'→'HANAKO'→'ICHIRO'→'JIRO'
    }
?>
```

### 更新（任意の値）
```
<?php
    $array = array('CHIKASHI', 'ICHIRO', 'JIRO');
    $array[1] = 'TORU';
    foreach ($array as $data) {
        echo $data.'<br>'; //'CHIKASHI'→'TORU'→'JIRO'
    }
?>
```

### 更新（NULL 値）
```
<?php
    $array = array('TARO', 'ICHIRO', 'JIRO');
    $array[0] = NULL;
    foreach ($array as $data) {
        echo $data.'<br>'; //（NULL）→'ICHIRO'→'JIRO'
    }
?>
```

### 削除（最後）
```
<?php
    $array = array('ICHIRO', 'JIRO', 'TARO');
    echo array_pop($array).'<br>'; //'TARO'（削除した要素を返す）
    foreach ($array as $data) {
        echo $data.'<br>'; //'ICHIRO'→'JIRO'
    }
?>
```

### 削除（最初）
```
<?php
    $array = array('ICHIRO', 'JIRO', 'TARO');
    echo array_shift($array).'<br>'; //'ICHIRO'（削除した要素を返す）
    foreach ($array as $data) {
        echo $data.'<br>'; //'JIRO'→'TARO'
    }
?>
```

### 削除（○番目から□個）
```
<?php
    $array = array('00', '01', '02', '03', '04', '05');
    array_splice($array, 3, 2); //3番目〜2個削除（削除した配列が返る）
    foreach ($array as $data) {
        echo $data.'<br>'; //'00'→'01'→'02'→'05'
    }
?>
```

### 削除（○番目から全て）
```
<?php
    $array = array('00', '01', '02', '03', '04', '05');
    array_splice($array, 3); //3番目〜全てを削除（削除した配列を返す）
    foreach ($array as $data) {
        echo $data.'<br>'; //'00'→'01'→'02'
    }
?>
```

### 抽出（○番目から□個）
```
<?php
    $array = array('00', '01', '02', '03', '04', '05');
    $tmp = array_slice($array, 2, 4); //抽出した配列を返す
    foreach ($tmp as $data) {
        echo $data.'<br>'; //'02'→'03'→'04'→'05'
    }
    foreach ($array as $data) {
        echo $data.'<br>'; //'00'→'01'→'02'→'03'→'04'→'05'（元のデータは変化なし）
    }
?>
```

### 抽出（○番目から全て）
```
<?php
    $array = array('00', '01', '02', '03', '04', '05');
    $tmp = array_slice($array, 2); //2番目から全てを抽出した配列を返す
    foreach ($tmp as $data) {
        echo $data.'<br>'; //'02'→'03'→'04'→'05'
    }
    foreach ($array as $data) {
        echo $data.'<br>'; //'00'→'01'→'02'→'03'→'04'→'05'（元のデータは変化なし）
    }
?>
```

### 検索（インデックス番号）
* 第2引数番目から、後ろに向かって検索（最初に見つかったインデックス番号を返す）
```
<?php
    $array = array('A', 'B', 'C', 'D', 'E', 'F', 'D');
    echo array_search('D', $array, 0); //3
?>
```

### 検索（ブール値）
* 第2引数番目から、前に向かって検索（見つかると 1（true）が返る）
```
<?php
    $array = array('A', 'B', 'C', 'D', 'E', 'F', 'D');
    echo in_array('D', $array, TRUE); //1
    //↑見つからない場合は「」（FALSE）が返る
    //第3引数（省略可）をTRUEにするとデータ型もチェック（"2"と2など）
?>
```

### 並べ替え（反転）
```
<?php
    $array = array('00', '01', '02', '03', '04', '05');
    $newArray = array_reverse($array);
    foreach ($newArray as $data) {
        echo $data.'<br>'; //'05'→'04'→'03'→'02'→'01'→'00'
    }
    foreach ($array as $data) {
        echo $data.'<br>'; //'00'→'01'→'02'→'03'→'04'→'05'（元のデータは変化なし）
    }
?>
```

### 並べ替え（ソート）
```
<?php
    $array = array("Z","A","あ","ん", "ン","ア ", "0", "a","z","漢 ", "9");
    sort($array);
    foreach ($array as $data) {
        echo $data.'<br>'; //'0'→'9'→'A'→'Z'→'a'→'z'→'あ'→'ん'→'ア'→'ン'→'漢' 
    }
    //正順（（'0'...'9'）>（A...Z）>（a...z）>（あ...ん）>（ア...ン）>漢字）
?>
```

### 結合
```
<?php
    $array1 = array('A', 'B', 'C');
    $array2 = array('D', 'E', 'F');
    $array3 = array_merge($array1, $array2);
    foreach ($array3 as $data) {
        echo $data.'<br>'; //'A'→'B'→'C'→'D'→'E'→'F'
    }
?>
```

### 複製
```
<?php
    $original = array('A', 'B', 'C');
    $copy = $original; //PHPの場合、代入するだけで複製される

    //実験（参照コピーではなく複製されているか否か）
    $original[0] = 'あ';
    foreach ($original as $data) {
        echo $data.'<br>'; //'あ'→'B'→'C'
    }
    foreach ($copy as $data) {
        echo $data.'<br>'; //'A'→'B'→'C'（元のデータは変化なし）
    }
?>
```

### 文字列→配列
```
<?php
    $string = 'A,B,C,D,E,F';
    $array = explode(",", $string); //カンマ区切りで配列化
    echo is_array($array).'<br>'; //1（true）←配列
    foreach ($array as $data) {
        echo $data.'<br>'; //'A'→'B'→'C'→'D'→'E'→'F'
    }
?>
```

### 全要素を取り出す
```
<?php
    $array = array('A', 'B', 'C', 'D', 'E', 'F');
    foreach ($array as $data) {
        echo $data."<br>"; //'A'→'B'→'C'→'D'→'E'→'F'
    }
?>
```

実行環境：PHP 7.0、Ubuntu 16.04 LTS、Chromium 56  
作成者：vvestvillage  
作成日：2017年04月04日


<a name='連想配列（array）'></a>
# <b>連想配列（array）</b>

```
<?php
    //①作成
    $array = array(); //配列（array）と同じ方法（省略可能）

    //②プロパティの追加（更新も同じ方法）
    $array['name'] = 'vvestvillage';
    $array['age'] = 49;

    //③関数の追加
    $array['hello'] = function() {
        echo 'Hello! How are you?';
    };

    //④プロパティの参照
    echo $array['name'].'<br>'; //'vvestvillage'

    //⑤関数の実行
    $array['hello'](); //'Hello! How are you?'
?>
```

実行環境：PHP 7.0、Ubuntu 16.04 LTS、Chromium 56  
作成者：vvestvillage  
作成日：2017年04月04日


<a name='$this'></a>
# <b>$this</b>

### トップレベルの $this
* JavaScript の window オブジェクトと異なり、トップレベルの $this は何かをオブジェクトを指すものではない（単なる変数扱い）
```
<?php
    echo gettype($this); //エラー（NULL＝変数の未定義）
?>
```

### クラス内の $this
```
<?php
    class MyClass {
        //プライベート変数の宣言
        private $hoge;

        //コンストラクタ
        function __construct() {
            echo gettype($this).'<br>'; //object
            echo var_dump($this).'<br>'; //object(MyClass)...（MyClassのインスタンス）
            $this->hoge = 'プライベート変数'; //$thisは省略不可
        }

        //アクセサ（getter）
        public function __get($name){
            return $this->$name;
        }
    }

    //①インスタンスの生成
    $myClass = new MyClass();

    //②プロパティの確認と変更
    echo $myClass->hoge; //'プライベート変数'
?>
```

実行環境：PHP 7.0、Ubuntu 16.04 LTS、Chromium 56  
作成者：vvestvillage  
作成日：2017年04月04日


<a name='文字列の操作'></a>
# <b>文字列の操作</b>

### 文字列の長さを調べる
```
<?php
    $string = 'ABCDE';
    echo strlen($string); //5
?>
```

### 一部分を取得
```
<?php
    $string = '0123456789';
    echo substr($string, 0, 1).'<br>'; //'0' ←0文字目（先頭）〜1文字取得
    echo substr($string, -1, 1).'<br>'; //'9' ←後ろから1文字目〜1文字取得
    echo substr($string, 4).'<br>'; //'456789' ←4文字目（0から開始）〜全て取得
    echo substr($string, 4, 3).'<br>'; //'456' ←4文字目（0から開始）〜3文字取得
?>
```

### 置換
```
<?php
    $string = '2017年4月4日';
    echo str_replace('2017', '平成29', $string); //平成29年4月4日
?>
```

### 検索
```
<?php
    $string = 'ABCDEFG-ABCDEFG';
    echo strpos($string, 'CD'); //2 ←見つかった最初の場所（0から開始）
?>
```

### 文字列→配列
```
<?php
    $string = 'A,B,C,D,E,F';
    $array = explode(",", $string); //カンマ区切りで配列化
    echo is_array($array).'<br>'; //1（true）←配列
    foreach ($array as $data) {
        echo $data.'<br>'; //'A'→'B'→'C'→'D'→'E'→'F'
    }
?>
```

実行環境：PHP 7.0、Ubuntu 16.04 LTS、Chromium 56  
作成者：vvestvillage  
作成日：2017年04月04日


<a name='正規表現'></a>
# <b>正規表現</b>

* PHP には以下のサンプル以外にも多くの正規表現の機能が用意されています

### 検索＆置換
* ^○○$' のように「^（行頭マッチ）」「$（行末マッチ）」といったメタ文字の他、様々なパターン、例えば '[A-D]\d+' などを使うことでより細かな制御が可能
```
<?php
    $string = '吉田松蔭,高杉晋作,久坂玄瑞,吉田稔麿,伊藤博文';
    if (preg_match('/吉田/', $string)) { //検索
        echo '"吉田"は含まれています<br>';
        //置換
        $string = preg_replace('/吉田/', 'よしだ', $string);
        echo $string; //'よしだ松蔭,高杉晋作,久坂玄瑞,よしだ稔麿,伊藤博文'
    } else {
        echo '"吉田"は含まれています<br>';
    }
?>
```

### マッチした数
```
<?php
    $string = '059371820400381295700347891205178900517093823';
    echo mb_substr_count($string, '00'); //3（マッチした数）
?>
```

実行環境：PHP 7.0、Ubuntu 16.04 LTS、Chromium 56  
作成者：vvestvillage  
作成日：2017年04月04日


<a name='抽象クラス'></a>
# <b>抽象クラス</b>

### 概要
* abstract クラス、abstract メソッドをサポート ＝ Java と同様
* final キーワードをサポート ＝ Java、ActionScript 3.0 と同様
* override キーワードはない（通常の関数定義で上書き）＝ Java と同様
* abstract class xxx とするとインスタンスの生成が不可になる

### 構文
```
//抽象クラスの定義
abstract class Abstract○○ {
    //共通のメソッド（オーバーライドを禁止）
    final public function 抽象メソッド名($引数①, $引数②, ...);
}

//抽象クラスの継承
class 派生クラス名 extends Abstract○○ {
    public function 抽象メソッド名($引数①, $引数②, ...) {
        //実際の処理はここに記述
    }
}
```

### 例文
```
<?php
    /**********
    抽象クラス
    **********/
    abstract class AbstractClass {
        //コンストラクタ
        public function __construct() {}

        //共通のメソッド（オーバーライドを禁止）
        final public function commonMethod() {
            echo 'AbstractClass->commonMethod()'.'<br>'; //共通の処理をここに記述。
        }

        //抽象メソッド（実際の処理は記述しない）
        public abstract function eachMethod(); //サブクラスでの定義が必須
    }

    /**********
    サブクラス
    **********/
    class SubClass extends AbstractClass { //（擬似）抽象クラスの継承
        //コンストラクタ
        public function __construct() {}

        //オーバーライドして具体的処理を記述
        public function eachMethod() {
            echo 'SubClass->eachMethod()'; //実際の処理
        }
    }

    $subClass = new SubClass();
    $subClass->commonMethod(); //'AbstractClass->commonMethod()'
    $subClass->eachMethod(); //'SubClass->eachMethod()'
?>
```

実行環境：PHP 7.0、Ubuntu 16.04 LTS、Chromium 56  
作成者：vvestvillage  
作成日：2017年04月04日


<a name='parentキーワード'></a>
# <b>parent キーワード</b> ≒ super

* parent::__construct() でスーパークラスのコンストラクタの呼出し可能
* parent::メソッド名() でスーパークラスのメソッドの呼出し可能

```
<?php
    //スーパークラス
    class SuperClass {
        //コンストラクタ
        function __construct($arg) {
            echo 'CCC '.$arg.'<br>';
        }
        public function methodSuper($arg) {
            echo 'MMM '.$arg;
        }
    }

    //サブクラス
    class SubClass extends SuperClass { //スーパークラスを継承
        //コンストラクタ
        function __construct() {
            //スーパークラスのコンストラクタの呼び出し（冒頭である必要はない）
            parent::__construct('from SubClass');
        }
        //メソッドの定義
        public function methodSub() {
            //スーパークラスのメソッドの呼び出し
            parent::methodSuper('from SubClass');
        }
    }

    //実行
    $subClass =  new SubClass(); //'CCC from SubClass'
    $subClass->methodSub(); //'MMM from SubClass'
?>
```

実行環境：PHP 7.0、Ubuntu 16.04 LTS、Chromium 56  
作成者：vvestvillage  
作成日：2017年04月04日


<a name='オーバーライド'></a>
# <b>オーバーライド</b>

### 概要
* スーパークラスで定義したメソッドをサブクラスで再定義することをオーバーライドと呼ぶ
* スーパークラスのメソッドを呼び出したい場合は、parent::メソッド名() とする
* （擬似）[抽象クラス](#抽象クラス)でもこの方法を活用
* [final キーワード](http://php.net/manual/ja/language.oop5.final.php)を使い final public function メソッド名() と記述することでオーバーライド禁止  
（参照 : [抽象クラス](#抽象クラス)）

### 例文
```
<?php
    //スーパークラス
    class SuperClass {
        //サブクラスでオーバライドするメソッド
        public function myMethod() {
            echo 'SuperClass->myMethod()'.'<br>';
        }
    }

    //サブクラス
    class SubClass extends SuperClass { //スーパークラスを継承
        //スーパークラスにある同名のメソッドを再定義＝オーバーライド
        public function myMethod() {
            //parent::myMethod(); //スーパークラス内の同名のメソッドを呼び出す場合
            echo 'SubClass->myMethod()';
        }
    }

    //実行
    $subClass = new SubClass();
    $subClass->myMethod(); //SubClass->myMethod()
?>
```

実行環境：PHP 7.0、Ubuntu 16.04 LTS、Chromium 56  
作成者：vvestvillage  
作成日：2017年04月04日


<a name='カスタムイベント'></a>
# <b>カスタムイベント</b>

### 概要
* PHP には declare() と register_tick_function() を使った方法がありますが、ここでは汎用的な方法を紹介
* リスナー関数（[匿名関数](#匿名関数)）の呼出しには、call_user_func() を使う

### 例文
```
<?php
    //イベントを設定するクラス
    class Robot {
        //プライベート変数宣言
        private $energy;
        private $dieHandler; //匿名関数を格納する変数

        function __construct() { //コンストラクタ
            $this->energy = 80;
        }

        public function addEventListener($event, $function) {
            if ($event == 'die') {
                $this->dieHandler = $function; //匿名関数を変数に格納
            } else {
                //該当のイベントが無い場合、実行時にエラーを発生（オプション）
                throw new Exception($event.'はサポートされていません');
            }
        }

        public function fight() {
            $this->energy -= 20;
            if ($this->energy <= 0) {
                //'die'イベントの発生（リスナー関数の呼出し）
                call_user_func($this->dieHandler, $this);
            }
        }
    }

    //リスナー関数＝匿名関数（前方宣言が必要）
    $die_robot = function($arg) {
        echo var_dump($arg).'<br>'; //object(Robot)#2...（Robotクラスのインスタンス）
        echo 'GAME OVER';
    };

    //実行
    $robot = new Robot();
    $robot->addEventListener('die', $die_robot); //イベントリスナーの設定
    $robot->fight();
    $robot->fight();
    $robot->fight();
    $robot->fight(); //'GAME OVER'
?>
```

実行環境：PHP 7.0、Ubuntu 16.04 LTS、Chromium 56  
作成者：vvestvillage  
作成日：2017年04月05日


<a name='数学関数'></a>
# <b>数学関数</b>

### sin() : サイン（正弦）
```
<?php
   echo sin(0).'<br>'; //0（0°）
   echo sin(pi() / 2).'<br>'; //1（90°）
   echo sin(pi()).'<br>'; //1.2246467991474E-16（≒0）（180°）
   echo sin(pi() * 3 / 2).'<br>'; //-1（270°）
   echo sin(pi() * 2); //-2.4492935982947E-16（≒0）（360°）
?>
```

### cos() : コサイン（余弦）
```
<?php
   echo cos(0).'<br>'; //1（0°）
   echo cos(pi() / 2).'<br>'; //6.1232339957368E-17（≒0）（90°）
   echo cos(pi()).'<br>'; //-1（180°）
   echo cos(pi() * 3 / 2).'<br>'; //-1.836970198721E-16（≒0）（270°）
   echo cos(pi() * 2); //1（360°）
?>
```

### atan2() : アークタンジェント2
```
<?php
    //三角形の各辺が1:2:√3の場合に2:√3の間の角度は30°であることの検証
    $disX = sqrt(3); //√3のこと
    $disY = 1;
    echo atan2($disY, $disX).'<br>'; //0.5235987755983（ラジアン）
    echo 180 * atan2($disY, $disX) / pi(); //30（度）
?>
```

### pi() : 円周率
```
<?php
    echo pi(); //3.1415926535898
?>
```

### floor() : 切り捨て
```
<?php
    echo floor(1.001).'<br>'; //1
    echo floor(1.999); //1
?>
```

### ceil() : 切り上げ
```
<?php
    echo ceil(1.001).'<br>'; //2
    echo ceil(1.999); //2
?>
```

### round() : 四捨五入
```
<?php
    echo round(1.499).'<br>'; //1
    echo round(1.500); //2
?>
```

### abs() : 絶対値
```
<?php
    echo abs(100).'<br>'; //100
    echo abs(-100); //100
?>
```

### pow() : 累乗（○の□乗）
```
<?php
    echo pow(2, 0).'<br>'; //1（2の0乗）
    echo pow(2, 8); //256（2の8乗）
?>
```

### sqrt() : 平方根（√○）
```
<?php
    echo sqrt(2).'<br>'; //1.4142135623731（一夜一夜にひとみごろ）
    echo sqrt(3).'<br>'; //1.7320508075689（人並みに奢れや）
    echo sqrt(4).'<br>'; //2
    echo sqrt(5); //2.2360679774998（富士山麓オウム鳴く）
?>
```

### max() : 比較（最大値）
```
<?php
    echo max(5.01, -10); //5.01（2つの数値の比較）
?>
```

### Math.min() : 比較（最小値）
```
<?php
    echo min(5.01, -10); //-10（2つの数値の比較）
?>
```

実行環境：PHP 7.0、Ubuntu 16.04 LTS、Chromium 56  
作成者：vvestvillage  
作成日：2017年04月05日  


<a name='乱数'></a>
# <b>乱数</b>
* rando() 関数という libc（リブシー／Linux C Library）を利用する方法と、mt_rand() 関数という [Mersenne Twister](http://bit.ly/2oAEqX5)（メルセンヌ･ツイスタ）を使用する方法がある

### ランダムな整数（8〜10桁）
```
<?php
    //どちらの方法も8〜10桁のランダムな整数が返る
    echo rand().'<br>';
    echo mt_rand(); 
?>
```

### 指定範囲のランダムな整数
```
<?php
    //どちらの方法も-100〜100までのランダムな整数が返る
    echo rand(-100, 100).'<br>';
    echo mt_rand(-100, 100); 
?>
```

実行環境：PHP 7.0、Ubuntu 16.04 LTS、Chromium 56  
作成者：vvestvillage  
作成日：2017年04月05日  


<a name='日時情報'></a>
# <b>日時情報</b>

```
<?php
    $date = getdate();
    echo $date['year'].'<br>'; //2017
    echo $date['month'].'<br>'; //April
    echo $date['mon'].'<br>'; //4（4月）
    echo $date['yday'].'<br>'; //94（元日から何日）
    echo $date['mday'].'<br>'; //5
    echo $date['wday'].'<br>'; //3（水曜日）
    echo $date['hours'].'<br>'; //10
    echo $date['minutes'].'<br>'; //16
    echo $date['seconds'].'<br>'; //2

    //'hh:mm:ss'で現在の時間を表示する方法
    $h = ($date['hours'] < 10) ? '0'.$date['hours'] : $date['hours'];
    $m = ($date['minutes'] < 10) ? '0'.$date['minutes'] : $date['minutes'];
    $s = ($date['seconds'] < 10) ? '0'.$date['seconds'] : $date['seconds'];
    echo $h.':'.$m.':'.$s; //'10:16:02'
?>
```

実行環境：PHP 7.0、Ubuntu 16.04 LTS、Chromium 56  
作成者：vvestvillage  
作成日：2017年04月05日  


<a name='タイマー'></a>
# <b>タイマー</b>
* バックエンドで動作する PHP の場合、サーバ負荷がかかるタイマー処理は多用すべきではない

### 繰返し実行する（参考）
* while 文が全て完了してから出力されるため実用的ではない
```
<?php
    $count = 0;
    while($count < 10){
        echo '繰り返し実行したい処理'.'<br>';
        sleep(1); //1秒間隔で繰返す場合
        $count++;
    }
    echo "end";
?>
```

### 一度だけ実行する
```
<?php
    sleep(1); //1秒後に…
    echo '1度だけ実行したい処理';
?>
```

実行環境：PHP 7.0、Ubuntu 16.04 LTS、Chromium 56  
作成者：vvestvillage  
作成日：2017年04月05日  


<a name='処理速度計測'></a>
# <b>処理速度計測</b>

```
<?php
    $start = microtime(TRUE); //1970年1月1日0:00:00 GMTからの経過時間（秒）
    for ($i=0; $i<500000000; $i++) { //5億回繰り返し
        //速度測定したい処理。
    }
    echo microtime(TRUE) - $start; // 3.6270740032196（秒）
?>
```

実行環境：PHP 7.0、Ubuntu 16.04 LTS、Chromium 57  
作成者：vvestvillage  
作成日：2017年04月06日



<a name='外部テキストの読み込み'></a>
# <b>外部テキストの読み込み</b>

### テキストファイルの用意（準備）
* [Web サーバ](http://bit.ly/2mbzR4D)を稼働し、ルートディレクトリ等に sample.txt （UTF-8）として保存
```
あいうえお
かきくけこ
さしすせそ
```

### テキストの読み込み（文字列化）
```
<?php
    $text = file_get_contents('sample.txt');
    echo var_dump($text); //string(47) ←文字列化されている
    echo $text; //'あいうえお かきくけこ さしすせそ'
?>
```

### テキストの読み込み（配列化）
```
<?php
    $array = file('sample.txt');
    echo var_dump($array); //array(3)... ←配列化されている
    foreach ($array as $data) {
        echo $data."<br>"; //'あいうえお'→'かきくけこ'→'さしすせそ'
    }
?>
```

実行環境：PHP 7.0、Ubuntu 16.04 LTS、Chromium 57  
作成者：vvestvillage  
作成日：2017年04月06日