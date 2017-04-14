### <b>この項目は書きかけの項目です</b>

# <b>Swift 基礎文法</b>

### <b>INDEX</b>

* Hello,world! （[Linux](https://github.com/TakashiNishimura/HelloWorld/blob/master/Swift/Swift_linux.md) / [macOS](https://github.com/TakashiNishimura/HelloWorld/blob/master/Swift/Swift_mac.md) / [Windows](https://github.com/TakashiNishimura/HelloWorld/blob/master/Swift/Swift_win.md)）
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
* [匿名関数（クロージャ）](#匿名関数（クロージャ）)
* [クラス定数･変数･メソッド](#クラス定数･変数･メソッド)
* [if 文](#if文)
* [三項演算子](#三項演算子)
* [switch 文](#switch文)
* [for 文](#for文)
* [for...in 文](#for...in文)
* [while 文](#while文)
***
* [配列](#配列)
* [リスト（LinkedList）](#リスト（LinkedList）)
* [セット（TreeSet）](#セット（TreeSet）)
* [マップ（HashMap）](#マップ（HashMap）)
* [this](#this)
* [文字列の操作](#文字列の操作)
* [正規表現](#正規表現)
* [インターフェース](#インターフェース)
* [抽象クラス（abstract）](#抽象クラス（abstract）)
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
1. 論理型 : Bool型（他にBoolean型あり）
1. 整数型 : Int型（-9223372036854775808〜9223372036854775807）
1. 浮動小数点数型 : Float型（小数点第5位までの値）
1. 浮動小数点数型 : Double型（小数点第14位までの値）←デフォルト
1. 文字型 : Character型
1. 文字型 : String型 ←デフォルト
1. 列挙型
1. クラス
1. 配列 : Array型
1. 辞書 : Dictionary型
* 型指定に「?」（「!」と併用も）を付けることで「nil」の代入を許可する Optional 型に
* Any 型もあり

### 例文
```
//test.swift

//①論理型 : Bool型（他にBoolean型あり）
var _bool: Bool = true
print(_bool, type(of: _bool)) //=> true Bool

//②整数型 : Int型（-9223372036854775808〜9223372036854775807）
var _int: Int = 9223372036854775807 //約900京
print(type(of: _int)) //=> Int

//②浮動小数点数型 : Float型（小数点第5位までの値）
var _float: Float = 3.1415926535897932384626433832795
print(_float, type(of: _float)) //=> 3.14159  Float

//④浮動小数点数型 : Double型（小数点第14位までの値）←デフォルト
var _double: Double = 3.1415926535897932384626433832795
print(_double, type(of: _double)) //=> 3.14159265358979  Double

//⑤文字型 : Character型
var _char: Character = "a" //シングルクォーテーションは不可
print(_char, type(of: _char)) //=> "a"  Character

//⑥文字型 : String型 ←デフォルト
var _string: String = "007"
print(_string, type(of: _string)) //=> "007"  String

//⑦列挙型
enum Signal { case BLUE,YELLOW,Red }
print(Signal.BLUE) //=> BLUE

//⑧クラス
class MyClass {}
var _myClass: MyClass = MyClass()
print(_myClass, type(of: _myClass)) //=> test.MyClass MyClass

//⑪配列 : Array型
var _array: Array<String> = ["A","B","C"] //<Any>、<AnyObject>等も可
print(_array, type(of: _array)) //=> ["A","B","C"]  Array<String>

//⑫辞書 : Dictionary型
var _dic: Dictionary<String, String> = ["a":"あ", "i":"い", "u":"う"]
print(_dic, type(of: _dic)) //=> ["u": "う", "a": "あ", "i": "い"]  Dictionary<String, String>
```

実行環境：macOS 10.12.4、Swift 3.1  
作成者：Takashi Nishimura  
作成日：2016年07月13日  
更新日：2017年04月13日


<a name="データ型の操作"></a>
# <b>データ型の操作</b>

### データ型の調べ方
1. type(of:)
    ```
    //test.swift
    class MyClass {}
    var _myClass: MyClass = MyClass()
    print(type(of: _myClass)) //=> MyClass
    print(type(of: 99)) //=> Int
    ```

1.  is演算子
    * 他にも as 演算子（型キャスト）や as? 演算子（不可の場合 nil が返る）あり
    ```
    //test.swift
    class SuperClass {}
    class SubClass: SuperClass {}
    var _subClass: Any = SubClass() //「: SubClass」とすると以下でwarning
    print(_subClass is SubClass) //=> true
    print(_subClass is SuperClass) //=> true
    ```

1. キャスト（Int 型→ Bool 型）
    ```
    //test.swift
    var int_: Int = 1
    var _bool: Bool = (int_ != 0) //0をfalseに変換（0以外はtrueに変換）
    print(_bool) //=> true
    ```

1. キャスト（Bool 型→ Int 型）
    ```
    //test.swift
    var _bool: Bool = true
    var _int: Int = _bool ? 1 : 0 //三項演算子を活用
    print(_int) //=> 1
    ```

1. キャスト（String 型→ Int 型）
    ```
    //test.swift
    var _string: String = "007"
    var int_: Int = Int(_string)! //「!」を付けないとOptional型になってしまう
    print(int_ + 3) //=> 10
    ```

1. キャスト（Int 型→ String 型）
    ```
    //test.swift
    var _int: Int = 100;
    var _string: String = String(_int); //100（Int型）→"100"（String）に変換
    print(_string); //=> "100"
    print(type(of: _string)); //=> String
    ```

実行環境：macOS 10.12.4、Swift 3.1  
作成者：Takashi Nishimura  
作成日：2016年07月26日  
更新日：2017年04月13日


<a name="クラス"></a>
# <b>クラス</b>

```
//test.swift
public class Rectangle { //長方形クラス ←アクセス修飾子を省略でinternal扱い
    private var _width: Int = 0 //インスタンス変数（プロパティ）
    private var _height: Int = 0 //インスタンス変数（プロパティ）

    init() { } //コンストラクタ
    
    //アクセサ
    public var width: Int {
        get { return _width }
        set { _width = newValue } //newValueは決め打ち
    }
    public var height: Int {
        get { return _height }
        set { _height = newValue } //newValueは決め打ち
    }

    //メソッド
    public func getArea() -> Int { //面積を計算して値を返す（返り値が無い場合->は不要）
        return _width * _height
    }
}

//①インタンスの生成
var _rectangle: Rectangle = Rectangle()

//②フィールドの更新
_rectangle.width = 1920
_rectangle.height = 1080

//③フィールドの取得
print(_rectangle.width) //=> 1920
print(_rectangle.height) //=> 1080

//④メソッドの実行
print(_rectangle.getArea()) //=> 2073600
```

実行環境：macOS 10.12.4、Swift 3.1  
作成者：Takashi Nishimura  
作成日：2016年07月26日  
更新日：2017年04月13日


<a name="スーパークラスとサブクラス"></a>
# <b>スーパークラスとサブクラス</b>
* 多重継承は不可
* デフォルトのアクセス修飾子は internal（同一プロジェクト内でアクセス可）

### 例文
```
//test.swift
//スーパークラス（internalは省略可能）
internal class SuperClass { 
    private var _fieldS: String  = "スーパークラスのプロパティ" //①インスタンス変数
    internal var fieldS: String  { get { return _fieldS }} //②アクセサ（getter）
    internal func methodS() -> String { return "スーパークラスのメソッド" } //③メソッド        
}

//サブクラスＡ（internalは省略可能／多重継承不可）
internal class SubClassA : SuperClass {
    private var _fieldA: String  = "サブクラスＡのプロパティ" //①インスタンス変数
    internal var fieldA: String  { get { return _fieldA }} //②アクセサ（getter）
    internal func methodA() -> String { return "サブクラスＡのメソッド" } //③メソッド
}

//サブクラスＢ（internalは省略可能／多重継承不可）
internal class SubClassB : SuperClass { 
    private var _fieldB: String  = "サブクラスＢのプロパティ" //①インスタンス変数
    internal var fieldB: String  { get { return _fieldB }} //②アクセサ（getter）
    internal func methodB() -> String { return "サブクラスＢのメソッド" } //③メソッド
}

// 実行
var _subclassA:SubClassA = SubClassA();
print(_subclassA.fieldS); //=> "スーパークラスのプロパティ"
print(_subclassA.fieldA); //=> "サブクラスＡのプロパティ"
print(_subclassA.methodS()); //=> "スーパークラスのメソッド"
print(_subclassA.methodA()); //=> "サブクラスＡのメソッド"

var _subclassB:SubClassB = SubClassB();
print(_subclassB.fieldS); //=> "スーパークラスのプロパティ"
print(_subclassB.fieldB); //=> "サブクラスＢのプロパティ"
print(_subclassB.methodS()); //=> "スーパークラスのメソッド"
print(_subclassB.methodB()); //=> "サブクラスＢのメソッド"
```

実行環境：macOS 10.12.4、Swift 3.1  
作成者：Takashi Nishimura  
作成日：2016年07月26日  
更新日：2017年04月13日


<a name="名前空間"></a>
# <b>名前空間</b>

### 概要
* Swift の名前空間には次の２種類ある
    1. Nested Types : クラスのネストによる方法
    1. module : UIKit や Foundation といったフレームワークの利用

### 例文（Nested Typesによる名前空間）
```
//test.swift
class MyLibrary {
    class MyClass {
        private var _w: Int
        private var _h: Int
        init(width _w: Int=640, height _h: Int=480) {
            self._w = _w
            self._h = _h
        }
        var width: Int {
            get { return _w }
            set { _w = newValue }
        }
        var height: Int {
            get { return _h }
            set { _h = newValue }
        }
    }
    class MyClass2 {
        //いろいろな機能
    }
}

var _myClass: MyLibrary.MyClass = MyLibrary.MyClass()
print(_myClass.width, _myClass.height) //=> 640 480

var _myClass2: MyLibrary.MyClass2 = MyLibrary.MyClass2()
print(_myClass2) //=> test.MyLibrary.MyClass2
```

実行環境：macOS 10.12.4、Swift 3.1  
作成者：Takashi Nishimura  
作成日：2016年07月29日  
更新日：2017年04月13日


<a name="継承と委譲"></a>
# <b>継承と委譲</b>

### 概要
* GoF デザインパターンの [Adapter パターン](http://bit.ly/2naab8x)等で利用される
* 継承の場合は「: クラス名」を使い、委譲の場合は「クラス名()」を使ってオブジェクトを生成し、他のクラスの機能を利用する

### 継承版
```
//test.swift
internal class ClassA { //internalは省略可
    internal func myMethod() { //internalは省略可
        print("ClassA.myMethod()")
    }
}

internal class ClassB : ClassA {} //ClassAを継承

var _classB: ClassB = ClassB();
_classB.myMethod(); //=> "ClassA.myMethod()"
```

### 委譲版
```
//test.swift
internal class ClassA { //internalは省略可
    internal func myMethod() { //internalは省略可
        print("ClassA.myMethod()")
    }
}

internal class ClassB { //この内容だけが継承版と異なる
    private var _classA:ClassA; //プロパティにインスタンスを格納（委譲）
    init() { //コンストラクタ
        _classA = ClassA(); //プロパティにインスタンスを格納
    }
    internal func myMethod() { //internalは省略可
        _classA.myMethod();
    }
}

var _classB:ClassB = ClassB();
_classB.myMethod(); //=> "ClassA.myMethod()"
```

実行環境：macOS 10.12.4、Swift 3.1  
作成者：Takashi Nishimura  
作成日：2016年07月26日  
更新日：2017年04月13日


<a name="変数とスコープ"></a>
# <b>変数とスコープ</b>

### 変数の種類
1. インスタンス変数
    * open : 別のモジュールからもアクセス可（旧 public と同等）
    * public : 別のモジュールからもアクセス可（但し継承・オーバーライドは不可）
    * internal : 同じモジュール内からのみアクセスできる ←デフォルト
    * fileprivate : 同じソースファイル内からのみアクセスできる（旧 private と同等）
    * private : 定義されたスコープ内でのみアクセスできる

1. ローカル変数
    * メソッド内 : メソッド内でのみアクセス可
    * 引数 : メソッド内でのみアクセス可
    * for 文 : for 文内でのみアクセス可

1. グローバル変数 : ソースファイル内のどこからでもアクセス可

1. クラス変数（静的変数）

### public（インスタンス変数）: 非推奨
```
//test.swift
public class MyClass { //internal（省略可）は不可
    public var _p: String = "ほげ" //public宣言
}
var _myClass: MyClass = MyClass()
print(_myClass._p) //=> "ほげ" //参照可（他人の変数を勝手にいじる行為）
_myClass._p = "ほげほげ" //変更可（他人の変数を勝手にいじる行為）
print(_myClass._p) //=> "ほげほげ"
```

### internal（インスタンス変数）: 非推奨（デフォルト）
```
//test.swift
internal class MyClass { //internalは省略可
    internal var _p: String = "ほげ" //internalは省略可
}
var _myClass: MyClass = MyClass()
print(_myClass._p) //=> "ほげ" //参照可（他人の変数を勝手にいじる行為）
_myClass._p = "ほげほげ" //変更可（他人の変数を勝手にいじる行為）
print(_myClass._p) //=> "ほげほげ"
```

### private（インスタンス変数）: 推奨
```
//test.swift
internal class MyClass { //internalは省略可
    private var _p: String = "ほげ" //private宣言
    internal var p: String { //_pのアクセサ ←internalは省略可
        get { return _p }
        set { _p = newValue }
    }
}
var _myClass: MyClass = MyClass()
print(_myClass.p) //=> "ほげ" ←getterで参照
_myClass.p = "ほげほげ" //setterで変更
print(_myClass.p) //=> "ほげほげ"
```

### ローカ変数
1. メソッド内で宣言する場合
    ```
    //test.swift
    class MyClass { //internal扱い
        private var _v: String = "PRIVATE"; //private宣言
        init() {
            print(_v) //=> "PRIVATE"
        }
        func myMethod() -> Void { // -> Void は省略可
            var _v: String //内部変数（≒ローカル変数）宣言のみ ←設定は不可
            _v = "LOCAL" //ローカル変数への値の設定
            print(_v) //=> "LOCAL"
            print(self._v) //=> "PRIVATE"
        }
    }
    var _myClass: MyClass = MyClass()
    _myClass.myMethod()
    ```

1. 引数として利用する場合
    ```
    //test.swift
    class MyClass { //internal扱い
        private var _name: String = "TARO"; //private宣言
        init() {
            print(_name) //=> "TARO"
        }
        func myMethod(_name: String) -> Void { // -> Void は省略可
            print(_name) //=> "HANAKO"
            print(self._name) //=> "TARO" ←インスタンス変数の参照はselfが必要
        }
    }
    var _myClass: MyClass = MyClass()
    _myClass.myMethod(_name:"HANAKO") //引数の渡し方が独特
    ```

1. for 文内で宣言する場合
    ```
    //test.swift
    class MyClass { //internal扱い
        private var _i:Int = 999; //private宣言
        init() {
            print(_i) //=> 999
        }
        func myMethod() -> Void { // -> Void は省略可
            for _i in 0..<10 {
                print(_i); //=> 0、1、2、…、9
                print(self._i); //=> 999
            }
            print(_i); //=> 999
        }
    }
    var _myClass: MyClass = MyClass()
    _myClass.myMethod()
    ```

### グローバル変数
```
//test.swift
var _global: String = "GLOBAL"

//==================================
// メソッド内のグローバル変数の扱い
//==================================
func myMethod() -> Void { // -> Void は省略可
    print(_global) //=> "GLOBAL" ←何も宣言することなく利用可能
}
myMethod()

//================================
// クラス内のグローバル変数の扱い
//================================
class MyClass { //internal扱い
    init() {
        print(_global) //=> "GLOBAL" ←何も宣言することなく利用可能
    }
}
var _myClass: MyClass = MyClass()
```

### クラス変数（静的変数）
```
//test.swift
class MyMath { //internal扱い
    internal static var PI: Double = 3.14159265358979 //internalは省略可
}
print(MyMath.PI) //=> 3.14159265358979
MyMath.PI = 3.14 //変更可能
print(MyMath.PI) //=> 3.14
```

実行環境：macOS 10.12.4、Swift 3.1  
作成者：Takashi Nishimura  
作成日：2016年07月27日  
更新日：2017年04月13日


<a name="アクセサ"></a>
# <b>アクセサ （getter / setter）</b>

### 読み書き可能なプロパティ
```
//test.swift
internal class Nishimura { //internalは省略可
    private var _age: Int = 49 //private宣言
    //アクセサ
    internal var age: Int {
        get {
            return _age
        }
        set {
            _age = newValue
        }
    }
}

var _nishimura: Nishimura = Nishimura()
print(_nishimura.age) //=> 49 ←getter
//print(_nishimura._age) //error（直接のアクセス不可）
_nishimura.age = 50 //変更可能 ←setter
print(_nishimura.age) //=> 50 ←getter
```

#### 読み取り専用のメンバ変数
```
//test.swift
internal class Nishimura { //internalは省略可
    private var _age: Int = 49 //private宣言
    //アクセサ
    internal var age: Int {
        get {
            return _age
        }
    }
}

var _nishimura: Nishimura = Nishimura()
print(_nishimura.age) //=> 49 ←getter
//print(_nishimura._age) //error（直接のアクセス不可）
//_nishimura.age = 50 //=> error ←変更できません
```

実行環境：macOS 10.12.4、Swift 3.1  
作成者：Takashi Nishimura  
作成日：2016年07月27日  
更新日：2017年04月14日


<a name="演算子"></a>
# <b>演算子</b>

### 算術演算子
* 複合代入演算子 +=, -=, *=, /=, %= などあり
```
//test.swift
print(3 + 2); //=> 5 (可算)
print(5 - 8); //=> -3 (減算)
print(3 * 4); //=> 12 (乗算)
print(1 + 2 * 3 - 4 / 2); //=> 5 (複雑な計算)
print(63 % 60); //=> 3 (余剰)
print(8 / 3); //=> 2(除算) ←整数の場合、余りは切り捨てられる
print(8.0 / 3); //=> 2.66666666666667（小数点第14位まで）
```

### インクリメント、デクリメントの廃止
* バージョン3.0からインクリメントおよびデクリメントは廃止
```
//test.swift
var hoge_: Int = 0
hoge_ += 1 //複合代入演算子（+=、-=）で代用
print(hoge_) //=> 1
```

### その他の演算子
```
//test.swift
print(true && true); //=> true（論理積）
print(true || false); //=> true（論理和）
print(!true); //=> false（否定）←スペースを空けるとerror（要注意）

print(2 < 3); //=> true（比較/未満）
print(2 <= 2); //=> true（比較/以下）
print(1 == 1.0); //=> true（等号）
print(1 != 1.0); //=> false（不等号）
//同じインスタンスか否かを調べる場合「===」「!==」を使用します。

print(3 & 1); //=> 1（ビット積）
print(3 | 1); //=> 3（ビット和）
print(3 ^ 1); //=> 2（排他的ビット和）
print(2 << 7); //=> 256（ビット･シフト）
print(~3); //=> -4（ビット反転）
```

実行環境：macOS 10.12.4、Swift 3.1  
作成者：Takashi Nishimura  
作成日：2016年07月27日  
更新日：2017年04月14日


<a name="定数"></a>
# <b>定数</b>

### 概要
* 値の「変更がある」変数は「var」を付けて宣言
* 値の「変更がない」変数は「let」を付けて宣言

### 通常の定数
* 構文
```
let 定数名: 型 = 値
```

* 例文
```
//test.swift
let PI:Double = 3.1415926535897932384626433832795
print(PI); //=> 3.14159265358979
//PI = 3.14 //=> error ←変更は不可
```

### クラス定数（静的定数）
* 構文
```
//test.swift
internal class クラス名 { //internalは省略可
    internal static let 定数名: データ型 = 値 //「internal」「public」にする
        ………
}

//アクセス方法
クラス名.定数名
```

* 例文
```
//test.swift
internal class MyMath { //internalは省略可
    internal static let PI:Double = 3.14159265358979 //internalは省略可
}

print(MyMath.PI) //=> 3.14159265358979 ←インスタンスの生成が不要
//MyMath.PI = 3.14 //変更不可
```

実行環境：macOS 10.12.4、Swift 3.1  
作成者：Takashi Nishimura  
作成日：2016年07月27日  
更新日：2017年04月14日


<a name="メソッド"></a>
# <b>メソッド</b>

### 基本構文
```
[アクセス修飾子] [static] func メソッド名([引数:型, …]) -> 戻り値の型 {
    [return 戻り値]
}
//static はクラスメソッド（静的メソッド）
```

* アクセス修飾子
    * open : 別のモジュールからもアクセス可（旧 public と同等）
    * public : 別のモジュールからもアクセス可（但し継承・オーバーライドは不可）
    * internal : 同じモジュール内からのみアクセスできる ←デフォルト
    * fileprivate : 同じソースファイル内からのみアクセスできる（旧 private と同等）
    * private : 定義されたスコープ内でのみアクセスできる

### 基本例文
```
//test.swift
internal class MyClass { //internalは省略可
    //○〜○までの値を足した合計を返す
    internal func tashizan(_start:Int, end_:Int) -> Int { //internalは省略可
        var _result:Int //ローカル変数（内部変数）の宣言
        _result = 0; //ローカル変数の初期化
        for i in _start..<end_+1 { //..<の間をあけるとerror
            _result += i;
        }
        return _result;
    }
}

var _myClass: MyClass = MyClass();
print(_myClass.tashizan(_start:1, end_:10)); //=> 55
print(_myClass.tashizan(_start:1, end_:100)); //=> 5050
```

### コンストラクタ＝イニシャライザ
* 引数ありと引数なしを同時に定義するとが可能）
```
//test.swift
internal class MyClass { //internalは省略可
    //引数なしのコンストラクタの宣言
    init() { 
        print("インスタンスが生成")
    }
    //引数ありのコンストラクタの宣言
    init(arg1: String) {
        print("インスタンスが生成:" + arg1)
    }
}

var _myClass1: MyClass = MyClass() //=> "インスタンスが生成"
var _myClass2: MyClass = MyClass(arg1:"引数あり") //=> "インスタンスが生成:引数あり"
```

### クラスメソッド＝静的メソッド
```
//test.swift
internal class MyMath { //internalは省略可
    internal static func pow(arg1:Int, arg2:Int) -> Int { //internalは省略可
        if (arg2 == 0) { return 1 } //0乗対策
        var _result:Int //ローカル変数宣言
        _result = arg1 //ローカル変数の初期化
        for i in 1..<arg2 {
            if i == 0 { return 0 } //iを使わないとerrorになるので…
            _result = _result * arg1
        }
        return _result;
    }
}

print(MyMath.pow(arg1:2, arg2:0)); //=> 1（2の0乗）
print(MyMath.pow(arg1:2, arg2:1)); //=> 2（2の1乗）
print(MyMath.pow(arg1:2, arg2:8)); //=> 256（2の8乗）
```

### デフォルト値付き引数
```
//test.swift
internal class MyClass { //internalは省略可
    private var _point: Int = 0
    internal func addPoint(_point:Int=1) -> Void { // -> Void は省略可
        self._point += _point
        print(self._point)
    }
}

var _myClass:MyClass = MyClass()
_myClass.addPoint() //=> 1
_myClass.addPoint(_point:10) //=> 11
```

### 可変長引数
```
//test.swift
internal class MyClass { //internalは省略可
    internal func sum(_points:Int...) -> Void { // -> Void は省略可
        var _result:Int //ローカル変数宣言
        _result = 0
        for tmp in _points { //引数は配列（Array）
            _result += tmp
        }
        print(_result)
    }
}

var _myClass:MyClass = MyClass()
_myClass.sum(_points:1,1) //=> 2（1+1）
_myClass.sum(_points:1,2,3,4,5); //=> 15（1+2+3+4+5）←引数の数はいくつでも可
```

### 名前付き引数（引数名の指定の簡略化が可能）
```
//test.swift
internal class MyClass { //internalは省略可
    internal func myMethod(name _newUserName: String) -> Void { // -> Void は省略可
        print(_newUserName)
    }
}

var _myClass:MyClass = MyClass()
_myClass.myMethod(name:"TAKASHI") //=> "TAKASHI"
```

実行環境：macOS 10.12.4、Swift 3.1  
作成者：Takashi Nishimura  
作成日：2016年07月27日  
更新日：2017年04月14日


<a name="匿名関数（クロージャ）"></a>
# <b>匿名関数（クロージャ）</b>

### 構文
```
[アクセス修飾子] var 変数名 = { ([引数:型, …]) -> 戻り値の型 in
    ………
}
```
* 内容を変更させたくない場合は var ではなく let にする
* デフォルト値付き引数は利用不可
* インスタンス変数としても利用可能

### 例文
```
//test.swift
//無名関数①（オリジナル）
var _hello = { (_name: String) -> String in
    return _name + "," + "Hello"
}

//無名関数②（入替用）
var _japaneseHello = { (_name: String) -> String in
    return _name + "、" + "こんにちは"
}

//無名関数③（入替用）
var _chineseHello = { (_name: String) -> String in
    return _name + "," + "你好"
}

//無名関数①の実行
print(_hello("TAKASHI")) //=> "TAKASHI,Hello" ←_hello(_name:"TAKASHI")ではない

//無名関数②に入替えて実行
_hello = _japaneseHello
print(_hello("TAKASHI")) //=> "TAKASHI、こんにちは" ←_hello(_name:"TAKASHI")ではない

//無名関数③に入替えて実行
_hello = _chineseHello
print(_hello("TAKASHI")) //=> "TAKASHI,你好" ←_hello(_name:"TAKASHI")ではない
```

実行環境：macOS 10.12.4、Swift 3.1  
作成者：Takashi Nishimura  
作成日：2016年07月27日  
更新日：2017年04月14日


<a name="クラス定数･変数･メソッド"></a>
# <b>クラス定数･変数･メソッド</b>
* 静的メンバはクラスをインスタンス化せずにアクセスが可能

```
//test.swift
internal class MyMath { //internalは省略可
    //クラス定数（静的定数）
    internal static let PI: Double = 3.14159265358979 //internalは省略可
    
    //クラス変数（静的変数）
    internal static var lastUpdate: String = "2016-07-27" //internalは省略可
    
    //クラスメソッド（静的メソッド）
    internal static func pow(arg1:Int, arg2:Int) -> Int { //internalは省略可
        if (arg2 == 0) { return 1 } //0乗対策
        var result_: Int //ローカル変数宣言
        result_ = arg1 //ローカル変数の初期化
        for i in 1..<arg2 {
            if i == 0 { return 0 } //iを使わないとerrorになるので…
            result_ = result_ * arg1
        }
        return result_
    }
}

//クラス定数（静的定数）
print(MyMath.PI) //=> 3.14159265358979
//MyMath.PI = 3.14 //error ←変更不可

//クラス変数（静的変数）
print(MyMath.lastUpdate) //=> "2016-07-27"
MyMath.lastUpdate = "2017-04-14" //変更可能
print(MyMath.lastUpdate) //=> "2017-04-14"

//静的メソッドの実行
print(MyMath.pow(arg1:2, arg2:0)) //=> 1（2の0乗）
print(MyMath.pow(arg1:2, arg2:1)) //=> 2（2の1乗）
print(MyMath.pow(arg1:2, arg2:8)) //=> 256（2の8乗）
```

実行環境：macOS 10.12.4、Swift 3.1  
作成者：Takashi Nishimura  
作成日：2016年07月27日  
更新日：2017年04月14日


<a name="if文"></a>
# <b>if 文</b>

### 基本例文
* true と評価される可能性が高い順に並べると if 文を早く抜け出せる可能性が高い
```
//test.swift
var age_:Int = 49
if (age_ <= 20) { // () は省略可
    print("20歳以下")
} else if (age_ <= 40) {
    print("21〜40歳")
} else if (age_ <= 60) {
    print("41〜60歳") //これが出力される
} else {
    print("61歳以上")
}
```

### 論理積（AND）
1. 論理演算子（&&）を使う方法
    ```
    if (条件式① && 条件②) {
        処理A ←…条件式① かつ 条件式② の両方がtrueの場合に実行
    } else {
        処理B
    }
    ```
1. if のネストを使う方法
    ```
    if (条件式①) {
        if (条件②) {
            処理A ←…条件式① かつ 条件式② の両方がtrueの場合に実行
        } else {
            処理B
        }
    } else {
        処理B
    }
    ```

### 論理和（OR）
1. 論理演算子（||）を使う方法
    ```
    if (条件式① || 条件②) {
        処理A ←条件式①または条件式②の両方がtrueの場合に実行
    } else {
        処理B
    }
    ```

1. ifのネストを使う方法
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
```
//test.swift
var _a: Bool = true
var _b: Bool = false
if ((_a || _b) && !(_a && _b)) {
    print("どちらか一方だけtrueです");
} else {
    print("両方共にtrueかfalseです");
}
```

実行環境：macOS 10.12.4、Swift 3.1  
作成者：Takashi Nishimura  
作成日：2016年07月28日  
更新日：2017年04月14日


<a name="三項演算子"></a>
# <b>三項演算子</b>

### 比較式が１つの場合
```
//test.swift
var age_:Int = 49
var result_:String = (age_ < 60) ? "現役" : "退職"
print(result_); //=> "現役"
```

### 三項演算子（比較式が複数の場合）
```
//test.swift
var age_:Int = 49
var result_:String = 
(age_ < 20) ? "未成年":
(age_ < 60) ? "現役":
"退職"
print(result_) //=> "現役"
```

実行環境：macOS 10.12.4、Swift 3.1  
作成者：Takashi Nishimura  
作成日：2016年07月28日  
更新日：2017年04月14日


<a name="switch文"></a>
# <b>switch 文</b>
* 他の多くの言語とは異なり各処理の後の break 文は不要

### 基本構文
```
switch 式 {
    case 式① : 式と式①が等しいときの処理
    case 式② : 式と式②が等しいときの処理
    default : それ以外のときの処理
}
```

### 判別式が Bool 型の場合
```
//test.swift
var age_: Int = 49
switch (true) {
    case age_ <= 20: print("20歳以下")
    case age_ <= 60: print("21〜60歳") //これが出力される
    default: print("61歳以上")
}
```

### 判別式が Bool 型ではない場合
```
//test.swift
var _name:String = "TAKASHI"
switch (_name) {
    case "TAKASHI": print("父") //これが出力
    case "HANAKO": print("母")
    case "TARO": print("長男")
    case "JIRO": print("次男")
    default: print("家族以外")
}
```

### fallthrouh（フォールスルー）
```
var _name:String = "TARO"
switch (_name) {
    case "TAKASHI": fallthrough //ここで終了せず次のcaseの処理へ
    case "HANAKO": print("親")
    case "TARO": fallthrough //ここで終了せず次のcaseの処理へ
    case "JIRO": print("子") //これが出力
    default: print("家族以外")
}
```

実行環境：macOS 10.12.4、Swift 3.1  
作成者：Takashi Nishimura  
作成日：2016年07月28日  
更新日：2017年04月14日


<a name="for文"></a>
# <b>for 文</b>

### 基本構文
```
for ループ制御変数 in 開始 ..< 終了 { //終了は含みません
    繰り返す処理
}
```

### 基本例文
```
//test.swift
for i in 0 ..< 10 { // ..< は空白を入れてはいけない
    print(i); //=> 0,1,2,3,4,5,6,7,8,9
}
//print(i); //error（for文の外では使えない）
```

### break 文
```
//test.swift
var _count: Int = 0
for i in 0 ..< 100000 { // ..< は空白を入れてはいけない
    _count += 1
    if (_count > 100) {
        break //ループを終了
    }
    print(_count) //=> 1,2,...,99,100
}
print("for文終了")
```

### continue 文
```
//test.swift
    for i in 0 ..< 20 { //iは1,2,...,18,19
        if ((i % 3) != 0) { //3で割って余りが0ではない（＝3の倍数ではない）場合
            continue; //for文の残処理をスキップしてfor文の次の反復を開始する
        }
        print(i) //=> 3,6,9,12,15,18 ←3の倍数
    }
print("for文終了")
```

実行環境：macOS 10.12.4、Swift 3.1  
作成者：Takashi Nishimura  
作成日：2016年07月28日  
更新日：2017年04月14日


<a name="for...in文"></a>
# <b>for...in 文</b>

### 基本構文
```
for 変数 in 配列等 {
    print(変数名)
}
```

### 配列（1次元）の場合
```
//test.swift
var _array:[String] = ["A","B","C"]
for value in _array {
    print(value) //=> "A"→"B"→"C"
}
```

### 配列（2次元）の場合
```
//test.swift
var _array:[[String]] = [
    ["x0y0","x1y0","x2y0"], //0行目
    ["x0y1","x1y1","x2y1"]  //1行目
]
for theArray in _array {
    for value in theArray {
        print(value)
        //=> "x0y0"→"x1y0"→"x2y0"→"x0y1"→"x1y1"→"x2y1"    
    }
}
```

### 辞書（Dictionary 型）の場合
```
//test.swift
var dic_:Dictionary<String,String> = ["A":"あ", "I":"い"]
for value in dic_ {
    print(value.key + " : " + value.value)
    //=> "A : あ"
    //=> "I : い"
}
```

実行環境：macOS 10.12.4、Swift 3.1  
作成者：Takashi Nishimura  
作成日：2016年07月28日  
更新日：2017年04月14日


<a name="while文"></a>
# <b>while 文</b>

### while 文
```
//test.swift
var _i: Int = 0
while _i < 10 { //ループ判定式には条件式しか指定できません
    print(_i) //=> 0,1,2,3,4,5,6,7,8,9
    _i += 1
}
print(_i) //=> 10（変数はまだ有効）
```

### repeat...while 文 ≒ do...while 文
```
//test.swift
var _i: Int = 0
repeat {
    print(_i) //=> 0 ←ループ判定式はfalseだが１回実行される
    _i += 1
} while _i < 0
```

### break 文
```
//test.swift
var _count: Int = 0
while true { //ループ判別式をtrueにすると無限ループに!
    _count += 1
    if (_count > 100) {
        break //break文を使ってwhileループから抜け出て処理を終了
    }
    print(_count) //=> 1,2,....,99,100
}
print("while文終了")
```

### continue文
```
//test.swift
var _i: Int = 1;
while _i <= 20 {
    if ((_i % 3) != 0) { //3で割って余りが0ではない（＝3の倍数ではない）場合
        _i += 1
        continue //while文の残処理をスキップしてwhile文の次の反復を開始する
    }
    print(_i) //=> 3,6,9,12,15,18（3の倍数を出力）
    _i += 1
}
```

実行環境：macOS 10.12.4、Swift 3.1  
作成者：Takashi Nishimura  
作成日：2016年07月28日  
更新日：2017年04月14日


<a name="配列"></a>
# <b>配列</b>



実行環境：macOS 10.12.4、Swift 3.1  
作成者：Takashi Nishimura  
作成日：2016年07月16日  
更新日：2017年04月12日


<a name="リスト（LinkedList）"></a>
# <b>リスト（LinkedList）</b>
リストには LinkedList のほかに ArrayList もあり（後者の方が低速）

### 作成
* 構文
```
LinkedList<データ型> 変数名 = new LinkedList<>();
```
* 例文
```
//Main.java
import java.util.*; //LinkedList に必要
public class Main { //public は省略可
    public static void main(String[] args) { //決め打ち(自動的に実行)
        LinkedList<String> _list = new LinkedList<>();
        System.out.println(_list); //=> []
        System.out.println(_list.getClass()); //=> class java.util.LinkedList
        System.out.println(_list.getClass().getName()); //=> java.util.LinkedList
    }
}
```

### 抽出（指定位置）
```
LinkedList.get(値);
```

### 要素の数
```
LinkedList.size();
```

### 抽出（○番目から○番目）
* 構文
```
List<データ型> 変数 = LinkedList.subList(開始位置,終了位置); //終了位置は含めない
```

* 例文
```
//"A","B","C","D" → "C","D"を返す
List<String> _result = _list.subList(2,4); //2番目から3番目まで抽出
List<String> _result = _list.subList(1,_list.size()); //1番目〜最後を抽出
```

### 追加（最後）
```
LinkedList.add(値);
```

### 追加（指定位置）
* 構文
```
LinkedList.add(インデックス番号,値); //先頭（0）〜最後（LinkedList.size()）まで指定可
```

* 例文
```
//"A","B" → "C","A","B"
_list.add(0,"C"); //先頭に追加する場合は0
```

### 更新（任意の値）
* 構文
```
LinkedList.set(インデックス番号,値);
```

* 例文
```
//"A","B","C" → "D","B","C"
_list.set(0,"D"); //0番目を変更する場合
```

### 更新（null型）
* 構文
```
LinkedList.set(インデックス番号,null);
```

* 例文
```
//"A","B","C","D" → "A","B",null,"D"
_list.set(2,null);
```

### 削除（指定のオブジェクト）
* 構文
```
LinkedList.remove(指定したい要素); //指定のインデックス番号の要素を削除
```

* 例文
```
//"A","B","C","D" → "B","C","D"
_array.remove("A");
```

## 削除（指定のインデックス）
* 構文
```
LinkedList.remove(インデックス番号); //指定のインデックス番号の要素を削除
//先頭（0）〜最後（LinkedList.size()-1）まで指定可能
```
* 例文
```
//"A","B","C","D" → "B","C","D"
_array.remove(0); //先頭を削除する場合
_list.remove(_list.size()-1); //最後を削除する場合
```

### 検索(前から）
* 構文
```
LinkedList.indexOf(検索する要素); //最初に見つかったインデックス番号を返す（無い場合-1）
```

* 例文
```
//"A","B","C","D"
System.out.println(_list.indexOf("C")); //=> 2
```

### 検索（後ろから）
* 構文
```
LinkedList.lastIndexOf(検索する要素); //最初に見つかったインデックス番号を返す（無い場合-1）
```

* 例文
```
//"A","B","C","D"
System.out.println(_list.lastIndexOf("C")); //=> 2
```

### 複製（LinkedList →配列）
* 構文
```
Object[] 変数 = LinkedList.toArray();
```

* 例文
```
Object[] listCopy_ = _list.toArray();
```

### 文字列→ LinkedList
```
//Main.java
import java.util.*; //LinkedList に必要
public class Main { //public は省略可
    public static void main(String[] args) { //決め打ち(自動的に実行)
        String _string = "A,B,C,D"; //①元となる文字列
        String[] _array = _string.split(","); //②文字列→配列に変換（「配列」参照）
        LinkedList<String> _list = new LinkedList<>(); //③空のLinkedListを作成
        for (String _value : _array) {
            _list.add(_value); //④配列の要素を1つずつArrayListに追加
        }
    }
}
```

### 全要素を取り出す
1. foreach 文を使う場合
    ```
    for (String _value : _list) {
        System.out.println(_value); //=> 0番目から1つずつ出力されます
    }
    ```

1. for文を使う場合
    ```
    for (int i=0; i < _list.size(); i++) {
        System.out.println(_list.get(i));
    }
    ```

実行環境：macOS 10.12.4、Swift 3.1  
作成者：Takashi Nishimura  
作成日：2016年07月16日  
更新日：2017年04月12日


<a name="セット（TreeSet）"></a>
# <b>セット（TreeSet）</b>

### 概要
* Set には TreeSet のほか HashSet、LinkedHashSet の３種類あり
* リストと異なり重複が不可
* TreeSet は自動的にソートされ、インデックスが無い

### 作成
```
//Main.java
import java.util.*; //TreeSet に必要
public class Main { //public は省略可
    public static void main(String[] args) { //決め打ち(自動的に実行)
        SortedSet<String> _set = new TreeSet<>();
        System.out.println(_set); //=> []
        System.out.println(_set.getClass()); //=> class java.util.TreeSet
        System.out.println(_set.getClass().getName()); //=> java.util.TreeSet
    }
}
```

### 要素の数
```
TreeSet.size();
```

### 追加（最後）
```
TreeSet.add("○○")
```

### 削除（指定のオブジェクト）
```
TreeSet.remove("○○")
```

### 複製（TreeSet→配列）
```
Object[] 変数 = TreeSet.toArray()
```

### 文字列→ TreeSet
```
//Main.java
import java.util.*; //TreeSet に必要
public class Main { //public は省略可
    public static void main(String[] args) { //決め打ち(自動的に実行)
        String _string = "A,B,C,D"; //①元となる文字列
        String[] _array = _string.split(","); //②文字列→配列に変換
        TreeSet<String> _set = new TreeSet<>(); //③空のTreeSetを作成
        for (String _value : _array) {
            _set.add(_value); //④配列の要素を1つずつArrayListに追加
        }
    }
}
```

### 全要素を取り出す
```
for (String _value : _set) {
    System.out.println(_value); //=> 0番目から1つずつ出力されます
}
```

実行環境：macOS 10.12.4、Swift 3.1  
作成者：Takashi Nishimura  
作成日：2016年07月16日  
更新日：2017年04月12日


<a name="マップ（HashMap）"></a>
# <b>マップ（HashMap）</b>

### 概要
* 基本的な Map である HashMap のほか LinkedHashMap、TreeMap、Hashtable の4種類あり
* マップは「キー」と「値」の組み合わせを格納するデータ構造

### 作成方法
```
Map<キーの型, 値の型> 変数名 = new HashMap<>();
```

### 例文
```
//Main.java
import java.util.*; //HashMap に必要
public class Main { //public は省略可
    public static void main(String[] args) { //決め打ち(自動的に実行)
        //①作成（空のHashMapを作成）
        Map<String,String> _map = new HashMap<>();

        //②追加
        _map.put("TARO", "たろう");
        _map.put("HANAKO", "はなこ");

        //③取得
        System.out.println(_map.get("TARO")); //=> "たろう"

        //④更新
        _map.replace("TARO", "太郎");

        //⑤全ての要素を取得する
        for (Map.Entry<String, String> _tmp : _map.entrySet()) {
            System.out.println(_tmp.getKey() + " : " + _tmp.getValue());
            //=> "HANAKO : はなこ"
            //=> "TARO : 太郎"
        }
    }
}
```

### キー／値の検索
```
//("A","あ")、("I","い")、("U","う")、("E","え")
System.out.println(_map.containsKey("A")); //true（任意のキーがあるか否か）
System.out.println(_map.containsValue(い")); //true（ 任意の値があるか否か）
```

実行環境：macOS 10.12.4、Swift 3.1  
作成者：Takashi Nishimura  
作成日：2016年07月17日  
更新日：2017年04月12日


<a name="this"></a>
# <b>this</b>

### thisが必要な場合
1. 「引数」と「インスタンス変数」が同じ場合
1. 「ローカル変数」と「メンバ変数」が同じ場合
* thisは、thisを記述したメソッドを所有するクラス（オブジェクト）を参照する

### 例文
```
//Main.java
public class Main { //public は省略可
    public static void main(String[] args) { //決め打ち(自動的に実行)
        Robot _robot = new Robot(500);
        _robot.move();
        System.out.println(_robot.getX()); //510
        //System.out.println(this); //エラー（staticメソッド内では参照できず）
    }
}

//カスタムクラス
class Robot {
    private int _x; //インスタンス変数（thisは不要）
    
    public Robot(int _x) { //引数
        this._x = _x; //①thisが無いと意味合いがことなる
        System.out.println(this); //Robot@6bc7c054（このメソッドが実行されたオブジェクト）
    }
    public void move() {
        int _x; //ローカル変数
        _x = this._x + 10; //②thisが無いとエラー
        if (_x >= 1920) _x = 0;
        this._x = _x; //②thisが無いと意味合いがことなる
        System.out.println(this); //Robot@6bc7c054（このメソッドが実行されたオブジェクト）
    }
    public int getX() {
        return _x; //thisを付けてもよい（通常は省略）
    }
}
```

実行環境：macOS 10.12.4、Swift 3.1  
作成者：Takashi Nishimura  
作成日：2016年07月17日  
更新日：2017年04月12日


<a name="文字列の操作"></a>
# <b>文字列の操作</b>

### String オブジェクトの作成
1. リテラル文字列による作成（一般的な方法）
    ```
    //Main.java
    public class Main { //public は省略可
        public static void main(String[] args) { //決め打ち(自動的に実行)
            String _string = "ABCDE";
            System.out.println(_string); //=> "ABCDE"
        }
    }
    ```

1. new 演算子と char 型配列による作成
    ```
    //Main.java
    public class Main { //public は省略可
        public static void main(String[] args) { //決め打ち(自動的に実行)
            char tmp[] = {'A','B','C','D','E'};
            String _string = new String(tmp);
            System.out.println(_string); //=> "ABCDE"
        }
    }
    ```

### 長さを調べる
```
//Main.java
public class Main { //public は省略可
    public static void main(String[] args) { //決め打ち(自動的に実行)
        String _string = "ABCDE";
        System.out.println(_string.length()); //5
    }
}
```

### 一部分を取得
* 構文
```
String.substring(開始位置 [,終了位置])
```
* 例文
```
//Main.java
public class Main { //public は省略可
    public static void main(String[] args) { //決め打ち(自動的に実行)
        String _string = "0123456789";
        System.out.println(_string.substring(4)); //=> "456789"
        System.out.println(_string.substring(4,5)); //"4"
        System.out.println(_string.substring(4,_string.length())); //=> "456789"
    }
}
```

### 一部分を削除
* 構文
```
StringBuilder 変数 = new StringBuilder("○");
StringBuilder.delete(開始位置, 終了位置); //1文字前まで削除
```
* 例文
```
//Main.java
public class Main { //public は省略可
    public static void main(String[] args) { //決め打ち(自動的に実行)
        String _string = "にしむらたかし";
        StringBuilder _string2 = new StringBuilder(_string);
        System.out.println(_string2.delete(0, 4)); //=> たかし
    }
}
```

### 置換
* 構文
```
String.replaceAll("置換前の文字列", "置換後の文字列");
```
* 例文
```
//Main.java
public class Main { //public は省略可
    public static void main(String[] args) { //決め打ち(自動的に実行)
        String _string = "2017年4月12日";
        System.out.println(_string.replaceAll("2017年", "平成29年")); 
        //"平成29年4月12日"
    }
}
```

### 検索
* 構文
```
String.indexOf("検索したい文字列", 開始位置);
```
* 例文
```
//Main.java
public class Main { //public は省略可
    public static void main(String[] args) { //決め打ち(自動的に実行)
        String _string = "ABCDEFG-ABCDEFG";
        String _word = "CD";
        int _i = 0;
        while (_string.indexOf(_word, _i) != -1) { //見つからない場合「-1」
            int _num = _string.indexOf(_word, _i);
            System.out.println(_num); //2、10 ←"CD"が見つかった位置を出力
            System.out.println(_string.substring(_num, _num + _word.length())); 
            //"CD"、"CD"
            _i = _num + 1;
        }
    }
}
```

### 文字列→配列
* 構文
```
String.split("区切り文字");
```
* 例文
```
//Main.java
public class Main { //public は省略可
    public static void main(String[] args) { //決め打ち(自動的に実行)
        String _string = "A,B,C,D"; //「,」区切りの文字列
        String[] _array = _string.split(","); //「,」区切りで分割して配列化
        //→{"A","B","C","D"}
    }
}
```

実行環境：macOS 10.12.4、Swift 3.1  
作成者：Takashi Nishimura  
作成日：2016年07月19日  
更新日：2017年04月12日


<a name="正規表現"></a>
# <b>正規表現</b>

* Java には以下のサンプル以外にも多くの正規表現の機能が用意されています

### 検索＆置換
```
//Main.java
import java.util.regex.*; //Pattern、Matcherに必要
public class Main { //public は省略可
    public static void main(String[] args) { //決め打ち(自動的に実行)
        String _string = "吉田松蔭,高杉晋作,久坂玄瑞,吉田稔麿,伊藤博文";
        String _result = "";
        String _regex = "吉田";

        Pattern _pattern = Pattern.compile(_regex);
        Matcher _matcher = _pattern.matcher(_string);

        if (_matcher.find()) { //ここで「検索」
            //マッチした場合（"吉田"が含まれている）の処理
            _result = _string.replaceAll("吉田", "よしだ"); 
        } else {
            System.out.println("吉田は含まれていません");
        }
        System.out.println(_string); //=> "吉田松蔭,高杉晋作,久坂玄瑞,吉田稔麿,伊藤博文";
        System.out.println(_result); //=> "よしだ松蔭,高杉晋作,久坂玄瑞,よしだ稔麿,伊藤博文";
    }
}
```

### マッチした数
```
//Main.java
import java.util.regex.*; //Pattern に必要
public class Main { //public は省略可
    public static void main(String[] args) { //決め打ち(自動的に実行)
        String _string = "cabacbbacbcba";
        Pattern _pattern = Pattern.compile("a",Pattern.CASE_INSENSITIVE);
        Matcher _matcher = _pattern.matcher(_string);
        int _count = 0;
        while(_matcher.find()){
            _count++;
        }
        System.out.println(_count); //=> 4
    }
}
```

実行環境：macOS 10.12.4、Swift 3.1  
作成者：Takashi Nishimura  
作成日：2016年07月19日  
更新日：2017年04月12日


<a name="インターフェース"></a>
# <b>インターフェース</b>

### 概要
* クラスにどのような機能（メソッド）を持たせるか、ということだけを定める
* 抽象クラスと似ているが、抽象クラスとは異なり、実際の処理は一切記述できない
* 実際の処理はインターフェースを継承したクラスで定義（実装しないとエラー）
* 多重実装（複数のインターフェースを同時に指定）が可能

### 例文
```
//Main.java
public class Main { //public は省略可
    public static void main(String[] args) { //決め打ち(自動的に実行)
        Moneybox _moneybox = new Moneybox();
        _moneybox.add(5000);
        System.out.println(_moneybox.getTotal()); //5000
     }
}

interface IMoneybox { //インターフェースの宣言（,で複数実装可能）
    //暗黙的に全てのメソッドが「public」になる
    void add(int _money);
    int getTotal(); //getter
    void setTotal(int _value); //setter
}

class Moneybox implements IMoneybox { //インターフェースの実装
    private int _total = 0;
    public void add(int _money) {
        _total += _money;
    } 
    public int getTotal() { //getterの実装
        return _total;
    }
    public void setTotal(int _value) { //setterの実装
        _total = _value;
    }
}
```

実行環境：macOS 10.12.4、Swift 3.1  
作成者：Takashi Nishimura  
作成日：2016年07月19日  
更新日：2017年04月12日


<a name="抽象クラス（abstract）"></a>
# <b>抽象クラス（abstract）</b>

### 概要
* 派生クラスに実装しなければならないメソッドを、抽象クラスで定義
* 実際の処理は、抽象クラスを継承した派生クラスで抽象メソッドをオーバーライドして記述

### 構文
```
abstract class Abstract○○ { //抽象クラスの定義
    abstract public 戻り値の型 メソッド名Ａ([型① 引数①, 型② 引数②,...]);
}
class SubClass : Abstract○○ { //抽象クラスの継承
    public 戻り値の型 メソッド名Ａ([型① 引数①, 型② 引数②,...]) {
        //実際の処理
    }
    ……
```

### 例文
```
//Main.java
public class Main { //public は省略可
    public static void main(String[] args) { //決め打ち(自動的に実行)
        SubClass _subClass = new SubClass();
        _subClass.common(); //=> "AbstractClass.common()"
        _subClass.method(); //=> "SubClass.method()"
    }
}

abstract class AbstractClass { //「抽象クラス」の定義
    public void common() { //共通のメソッド
        System.out.println("AbstractClass.common()");
    }
    abstract public void method(); //抽象メソッドの宣言（実際の処理は書かない）
}

class SubClass extends AbstractClass { //抽象クラスを継承
    public void method() { //オーバーライドして実際の処理を記述
        System.out.println("SubClass.method()"); //実際の処理
    }
}
```

実行環境：macOS 10.12.4、Swift 3.1  
作成者：Takashi Nishimura  
作成日：2016年07月19日  
更新日：2017年04月12日


<a name="superキーワード"></a>
# <b>super キーワード</b>

```
//Main.java
//メインクラス（publicは省略可）
public class Main {
    public static void main(String[] args) { //決め打ち ←最初に自動的に実行される
        SubClass _SubClass = new SubClass(); //サブクラスのインスタンスの生成
        //=> "スーパークラスのコンストラクタ：サブクラスからの呼び出し"
        _SubClass.methodSub("サブクラスからの呼び出し");
        //=> "スーパークラスのメソッド：サブクラスからの呼び出し"
    }
}

//スーパークラス
class SuperClass {
    //コンストラクタ
    public SuperClass(String arg) {
        System.out.println("スーパークラスのコンストラクタ：" + arg);
    }
    //メソッド
    public void methodSuper(String arg) {
        System.out.println("スーパークラスのメソッド：" + arg);
    }
}

//サブクラス
class SubClass extends SuperClass {
    //コンストラクタ
    public SubClass() {
        //System.out.println("ここはエラー"); //コンストラクタのsuper()は冒頭に!
        super("サブクラスからの呼び出し"); //スーパークラスのコンストラクタを呼出す
    }
    //メソッド
    public void methodSub(String arg) {
        System.out.println("ここはエラーなし"); //メソッド内のsuper()はどこでもOK!
        super.methodSuper(arg); //スーパークラスのメソッドを呼出す
    }
}
```

実行環境：macOS 10.12.4、Swift 3.1  
作成者：Takashi Nishimura  
作成日：2016年07月19日  
更新日：2017年04月12日


<a name="オーバーライド"></a>
# <b>オーバーライド</b>

### 抽象メソッドのオーバーライドの書式
```
abstract class 抽象クラス名 { //抽象クラスの定義
    //抽象メソッド宣言 ※{}は記述しない
    abstract [アクセス修飾子] 戻り値の型 抽象メソッド名([型 引数]);
    ……
}
class 派生クラス extends 抽象クラス名 { //抽象クラスを継承
    [アクセス修飾子] 戻り値の型 抽象メソッド名([型 引数]) { //オーバーライド
        //実際の処理
    }
    ……
```

### 通常のメソッドのオーバーライド
```
//Main.java
public class Main { //public は省略可
    public static void main(String[] args) { //決め打ち(自動的に実行)
        SubClass _subClass = new SubClass();
        _subClass.method(); //=> "SubClass.method"←サブクラスのメソッドが実行される
    }
}

class SuperClass {
    //final public void method() { …とするとオーバーライドを禁止にできます
    public void method() {
        System.out.println("SuperClass.method");
    }
}

class SubClass extends SuperClass {
    public void method() { //スーパークラスのメソッドと同名（同じ引数）
        System.out.println("SubClass.method"); //これにオーバーライドされる
        //super.method(); //上書きしたスーパークラスのメソッドを実行する場合
    }
}
```

実行環境：macOS 10.12.4、Swift 3.1  
作成者：Takashi Nishimura  
作成日：2016年07月19日  
更新日：2017年04月12日


<a name="カスタムイベント"></a>
# <b>カスタムイベント</b>

```
//Main.java
public class Main { //publicは省略可
    public static void main(String[] args) { //決め打ち（自動的に実行）
        Ixxx_robot die_robot = (Robot arg) -> { //無名関数（リスナー関数）の定義
            System.out.println(arg.getClass()); //=> class Robot
            System.out.println("GAME OVER");
        }; //「;」が必須
        Robot _robot = new Robot();
        _robot.addEventListener("die", die_robot); //イベントリスナーの定義
        _robot.fight();
        _robot.fight();
        _robot.fight();
        _robot.fight(); //=> "GAME OVER"
    }
}

class Robot {
    private int _energy = 80;
    private Ixxx_robot _dieHandler; //無名関数を格納する変数の宣言
    public void addEventListener(String _event, Ixxx_robot function_) {
        if (_event == "die") {
            _dieHandler = function_; //無名関数を格納する
        } else { //該当のイベントが無い場合、実行時にErrorを出す（オプション）
            System.out.println("Error: Robot.addEventListener()");
        }
    }
    public void fight() {
        _energy -= 20;
        if (_energy <= 0) {
            _dieHandler.exec(this); //無名関数の呼び出し
        }
    }
}

interface Ixxx_robot { //無名関数用インターフェース（Java独特）
    public void exec(Robot arg);
}
```

実行環境：macOS 10.12.4、Swift 3.1  
作成者：Takashi Nishimura  
作成日：2016年07月19日  
更新日：2017年04月12日


<a name="数学関数（Math）"></a>
# <b>数学関数（Math）</b>

### 概要
* Math クラスは java.lang パッケージに含まれているため importする必要はない
* Math クラスは全てクラス定数･変数･メソッドである
* Math クラスのクラス定義は public final class Math extends Object である

### Math.sin() : サイン（正弦）
```
//Main.java
public class Main { //publicは省略可
    public static void main(String[] args) { //決め打ち（自動的に実行）
        System.out.println(Math.sin(0)); //=> 0.0 ←0°
        System.out.println(Math.sin(Math.PI/2)); //=> 1.0 ←90°
        System.out.println(Math.sin(Math.PI)); //=> 1.2246467991473532E-16（≒0）←180°
        System.out.println(Math.sin(Math.PI*3/2)); //=> -1.0 ←270°
        System.out.println(Math.sin(Math.PI*2)); //=> -2.4492935982947064E-16（≒0）
    }
}
```

### Math.cos() : コサイン（余弦）
```
//Main.java
public class Main { //publicは省略可
    public static void main(String[] args) { //決め打ち（自動的に実行）
        System.out.println(Math.cos(0)); //=> 1.0 ←0°
        System.out.println(Math.cos(Math.PI/2)); //=> 6.123233995736766E-17（≒0）←90°
        System.out.println(Math.cos(Math.PI)); //=> -1.0 ←180°
        System.out.println(Math.cos(Math.PI*3/2)); //=> -1.8369701987210297E-16（≒0）←270°
        System.out.println(Math.cos(Math.PI*2)); //=> 1.0 ←360°
    }
}
```

### Math.atan2() : アークタンジェント2
* 2つの値のアークタンジェント（逆タンジェント）
* X、Y座標の角度をラジアン単位で返す
* Πラジアン（3.141592…）は180°
```
//Main.java
public class Main { //publicは省略可
    public static void main(String[] args) { //決め打ち（自動的に実行）
        //三角形の各辺が1:2:√3の場合、2:√3の間の角度は30°であることを検証
        double disX_ = Math.sqrt(3); //√3のこと
        int disY_ = 1;
        System.out.println(Math.atan2(disY_, disX_)); //0.5235987755982989（ラジアン）
        System.out.println(180*Math.atan2(disY_, disX_)/Math.PI); //30.000000000000004（度）
    }
}
```

### Math.PI : 円周率
```
System.out.println(Math.PI); //=> 3.141592653589793 ※Math.PIラジアン=180°
```

### Math.floor() : 切り捨て
```
System.out.println(Math.floor(1.001)); //=> 1.0
System.out.println(Math.floor(1.999)); //=> 1.0
```

### Math.ceil() : 切り上げ
```
System.out.println(Math.ceil(1.001)); //=> 2.0
System.out.println(Math.ceil(1.999)); //=> 2.0
```

### Math.round() : 四捨五入
```
System.out.println(Math.round(1.499)); //=> 1
System.out.println(Math.round(1.500)); //=> 2
```

### Math.abs() : 絶対値
```
System.out.println(Math.abs(100)); //=> 100
System.out.println(Math.abs(-100)); //=> 100
```

### Math.pow() : 累乗（○の□乗）
```
System.out.println(Math.pow(2, 0)); //=> 1.0（2の0乗）
System.out.println(Math.pow(2, 8)); //=> 256.0（2の8乗）
```

### Math.sqrt() : 平方根（√○）
```
System.out.println(Math.sqrt(2)); //=> 1.4142135623730951（一夜一夜にひとみごろ）
System.out.println(Math.sqrt(3)); //=> 1.7320508075688772（人並みに奢れや）
System.out.println(Math.sqrt(4)); //=> 2.0
System.out.println(Math.sqrt(5)); //=> 2.23606797749979（富士山麓オウム鳴く）
```

### Math.max() : 比較（最大値）
```
System.out.println(Math.max(5.01, -10)); //=> 5.01 ←「2つ」の数値の比較
```

### Math.min() : 比較（最小値）
```
System.out.println(Math.min(5.01, -10)); //=> -10.0 ←「2つ」の数値の比較
```

実行環境：macOS 10.12.4、Swift 3.1  
作成者：Takashi Nishimura  
作成日：2016年07月19日  
更新日：2017年04月12日


<a name="乱数"></a>
# <b>乱数</b>

### Randomクラスを使う方法
```
//Main.java
import java.util.Random; //Randomクラスに必要

public class Main { //publicは省略可
    public static void main(String[] args) { //決め打ち（自動的に実行）
        int _0=0, _1=0, _2=0, _3=0, _4=0, _5=0, _6=0, _7=0, _8=0, _9=0;
        Random rando_m = new Random(); //Randomクラスのインスタンス化
        for (int i=0; i<100000000; i++) { //1億回繰り返します
            switch (rando_m.nextInt(10)) {
                case 0: _0++; break;
                case 1: _1++; break;
                case 2: _2++; break;
                case 3: _3++; break;
                case 4: _4++; break;
                case 5: _5++; break;
                case 6: _6++; break;
                case 7: _7++; break;
                case 8: _8++; break;
                case 9: _9++; break;
                default: System.out.println("Error"); break;
            }
        }
        System.out.println(_0+","+_1+","+_2+","+_3+","+_4);
        //=> "9998750,9995016,10002279,10005150,10002463"
        System.out.println(_5+","+_6+","+_7+","+_8+","+_9);
        //=> "9997912,9998089,9999414,9998470,10002457"
    }
}
```

### Mathクラスを使う方法
```
//Main.java
//インポートは不要
public class Main { //publicは省略可
    public static void main(String[] args) { //決め打ち（自動的に実行）
        int _0=0, _1=0, _2=0, _3=0, _4=0, _5=0, _6=0, _7=0, _8=0, _9=0;
        for (int i=0; i<100000000; i++) { //1億回繰り返します
            switch ((int)(Math.random()*10)) {
                case 0: _0++; break;
                case 1: _1++; break;
                case 2: _2++; break;
                case 3: _3++; break;
                case 4: _4++; break;
                case 5: _5++; break;
                case 6: _6++; break;
                case 7: _7++; break;
                case 8: _8++; break;
                case 9: _9++; break;
                default: System.out.println("Error"); break;
            }
        }
        System.out.println(_0+","+_1+","+_2+","+_3+","+_4);
        //=> "10000717,10000466,10000525,9993501,9999160"
        System.out.println(_5+","+_6+","+_7+","+_8+","+_9);
        //=> "10001492,10000658,9997803,10000333,10005345"
    }
}
```

実行環境：macOS 10.12.4、Swift 3.1  
作成者：Takashi Nishimura  
作成日：2016年07月19日  
更新日：2017年04月12日


<a name="日時情報"></a>
# <b>日時情報</b>

### 概要
* Javaでは日時情報を扱うものに java.util.Date と java.util.Calendar クラスがある
* 以下のサンプルはJava SE 8（1.8）から導入された java.time.LocalDateTime クラスを使ったもの
* この新しいAPIには、デフォルトの <b>LocalDateTime</b> のほかに、UTC（グリニッジ）から時差付きの <b>OffsetDateTime</b>、タイムゾーンを持つ <b>ZonedDateTime</b> の３つのクラスがある

### 例文
```
//Main.java
import java.time.*; //LocalDateTimeに必要

public class Main { //publicは省略可
    public static void main(String[] args) { //決め打ち（自動的に実行）
        //デフォルトの日時情報
        LocalDateTime _now = LocalDateTime.now();
        System.out.println(_now); //=> 2017-04-12T16:32:02.988
        System.out.println(_now.getYear()); //=> 2017
        System.out.println(_now.getMonth()); //=> APRIL
        System.out.println(_now.getMonthValue()); //=> 4（1〜12月）
        System.out.println(_now.getDayOfMonth()); //=> 12（1〜31日）
        System.out.println(_now.getDayOfYear()); //=> 102（元日からの日数1〜366）
        System.out.println(_now.getDayOfWeek()); //=> WEDNESDAY
        System.out.println(_now.getHour()); //=> 16（0〜23時）
        System.out.println(_now.getMinute()); //=> 32（0〜59分）
        System.out.println(_now.getSecond()); //=> 2（0〜59秒）
        System.out.println(_now.getNano()); //=> 988000000
        
        //"hh:mm:ss"で現在の時間を表示する方法
        String _h 
        =(_now.getHour()<10) ? "0"+_now.getHour() : String.valueOf(_now.getHour());
        String _m 
        =(_now.getMinute()<10) ? "0"+_now.getMinute() : String.valueOf(_now.getMinute());
        String _s 
        =(_now.getSecond()<10) ? "0"+_now.getSecond() : String.valueOf(_now.getSecond());
        System.out.println(_h + ":" + _m + ":" + _s); //=> "16:32:02"
    }
}
```

実行環境：macOS 10.12.4、Swift 3.1  
作成者：Takashi Nishimura  
作成日：2016年07月20日  
更新日：2017年04月12日


<a name="タイマー"></a>
# <b>タイマー</b>

### java.util.Timer を使う方法
* 他にも javax.swing.Timer もあり
```
//Main.java
import java.util.Timer; //Timerに必要
import java.util.TimerTask; //TimerTaskに必要
public class Main { //publicは省略可
    public static void main(String[] args) { //決め打ち（自動的に実行）
        Timer _timer = new Timer();
        //↓2000ミリ秒（2秒）後に1回だけ実行する場合…
        //_timer.schedule(new OnceExecute(), 2000);
        //0秒後から10fps（100ミリ秒毎）の間隔で繰返し実行する場合…
        _timer.schedule(new LoopExec(), 0, 100); 
    }
}
class LoopExec extends TimerTask {
    public void run() { //決め打ち
        System.out.println("繰り返しまたは、指定秒後に１度だけ実行したい処理");
    }
}
```

実行環境：macOS 10.12.4、Swift 3.1  
作成者：Takashi Nishimura  
作成日：2016年07月20日  
更新日：2017年04月12日


<a name="処理速度計測"></a>
# <b>処理速度計測</b>

### currentTimeMillisメソッドを使う方法
* ミリ秒で表される現在の時間を返す
* 戻り値の時間単位はミリ秒だが、値の粒度（りゅうど）は基本となるＯＳによって異なり、単位がより大きくなる場合がある（多くのＯＳでは、時間を10ミリ秒の単位で計測する）

* 例文
```
//Main.java
public class Main { //publicは省略可
    public static void main(String[] args) { //決め打ち（自動的に実行）
        long _start = System.currentTimeMillis(); //1970年1月1日からのミリ秒
        for (long i=0; i<10000000000L; i++) { //100億回繰り返す場合…
            //速度計測したい処理
        }
        long _end = System.currentTimeMillis();
        System.out.println((_end - _start)  + "ミリ秒"); //=> 3252ミリ秒
    }
}
```

### nanoTimeメソッドを使う方法（推奨）
* 利用可能でもっとも正確なシステムタイマーの現在の値をナノ秒単位で返す
* 返される値は、固定された任意の時間からの経過時間 (ナノ秒) 

* 例文
```
//Main.java
public class Main { //publicは省略可
    public static void main(String[] args) { //決め打ち（自動的に実行）
        long _start = System.nanoTime();
        for (long i=0; i<10000000000L; i++) { //100億回繰り返す場合…
            //速度計測したい処理
        }
        long _end = System.nanoTime();
        System.out.println((_end - _start) / 1000000f + "ミリ秒"); //=> 3253.8875ミリ秒
    }
}
```

実行環境：macOS 10.12.4、Swift 3.1  
作成日：2016年07月20日  
更新日：2017年04月12日


<a name="外部テキストの読み込み"></a>
# <b>外部テキストの読み込み</b>
* [Web サーバ](http://bit.ly/2mbzR4D)を稼働する必要はない

### テキストファイルの用意（sample.txt/UTF-8として保存）
```
あいうえお
かきくけこ
さしすせそ
```

### 例文
```
//Main.java
import java.io.File;
import java.io.FileReader;
import java.io.FileNotFoundException;
import java.io.IOException;

public class Main { //publicは省略可
    public static void main(String[] args) { //決め打ち（自動的に実行）
        //FileReaderクラスを扱う場合、例外処理が必要
        try {
            //①Fileクラスのオブジェクトの生成
            File file_ = new File("sample.txt"); #同じ階層に○.txtがある場合…

            //②FileReaderクラスのオブジェクトの生成
            FileReader filereader_ = new FileReader(file_);
            
            //③１文字ずつ読み込んでいきます
            int _int;
            while((_int = filereader_.read()) != -1){
                //④文字コードを文字に変換
                System.out.print((char)_int); //=>"あ"=>"い"=>"う"=>…
            }

            //⑤ファイルを閉じる
            filereader_.close();

        } catch(FileNotFoundException e) {
            System.out.println(e);
        } catch(IOException e) {
            System.out.println(e);
        }
    }
}
```

実行環境：macOS 10.12.4、Swift 3.1  
作成者：Takashi Nishimura  
作成日：2016年07月20日  
更新日：2017年04月12日