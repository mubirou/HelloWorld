### <b>この項目は書きかけの項目です</b>

# <b>C# 基礎文法</b>

### <b>INDEX</b>

* Hello,world! （[Linux](https://github.com/TakashiNishimura/HelloWorld/blob/master/C%23/C%23_linux.md) / [macOS](https://github.com/TakashiNishimura/HelloWorld/blob/master/C%23/C%23_mac.md) / [Windows](https://github.com/TakashiNishimura/HelloWorld/blob/master/C%23/C%23_win.md)）
* [データ型](#データ型)
* [データ型の操作](#データ型の操作)
* [クラス](#クラス)
* [基本クラスと派生クラス](#基本クラスと派生クラス)
* [名前空間](#名前空間)
* [継承と委譲](#継承と委譲)
* [変数とスコープ](#変数とスコープ)
* [アクセサ （getter / setter）](#アクセサ)
* [演算子](#演算子)
* [定数](#定数)
* [メソッド](#メソッド)
* [匿名メソッド](#匿名メソッド)
* [ラムダ式](#ラムダ式)
* [静的メンバ（static）](#静的メンバ（static）)
* [if 文](#if文)
* [三項演算子](#三項演算子)
* [switch 文](#switch文)
* [for 文](#for文)
* [foreach 文](#foreach文)
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
* 論理型
    * bool型 : true または false

* 整数型
    * byte 型 : 0〜255（8 bit）
    * sbyte 型 : -128〜127（8 bit）
    * short 型 : -32768〜32767（16 bit）←約±3万
    * ushort 型 :  0〜65535（16 bit）←約6万
    * int 型 : -2147483648〜2147483647（32 bit）←約±20億／16進数（0xFFCC00等）も可
    * uint 型 :  0〜4294967295（32 bit）←約40億（初期値）
    * long 型 : -9223372036854775808〜9223372036854775807（64 bit）←約±900京
    * ulong 型 : 0〜18446744073709551615（64 bit）←約1800京

* 浮動小数点数型
    * float 型 : 小数点第6位までの値（第7位を四捨五入）←最後にfを付ける
    * double 型 : 小数点第14位までの値（第15位を四捨五入）←デフォルト
    * decimal 型 : 小数点第28位までの値（第29位を四捨五入）←最後に m を付ける

* 文字型
    * char 型 : 1文字（シングルクォーテーションで囲む）
    * string 型 : 2文字以上（ダブルクォーテーションで囲む）

* その他のデータ型
    * null 許容型 : 変数の値が未定義（宣言には ? を追記）
    * 列挙型（enum） : 内部的には0、1、2...（int 型）で処理
    * 構造体（struct）: 継承が出来ないクラスに似たもの
    * 匿名型クラス（new {}）: class を使わないクラス（プロパティは読取専用）
    * クラス（class）: class を使った参照型（データそのものではなくアドレスを保持）
    * dynamic 型 : 動的型（型が未確定）←TypeScript の any 相当
    * Object[] 型 : 配列の場合

### 検証
```
//test.cs
using System; //Console.WriteLine()に必要

class Test {
    static void Main() {
        //bool型
        bool _bool = true;
        Console.WriteLine(_bool); //True
        Console.WriteLine(_bool.GetType()); //System.Boolean
        
        //整数型①（0〜255）
        byte _byte = 255;
        Console.WriteLine(_byte); //255
        Console.WriteLine(_byte.GetType()); //System.Byte
        
        //整数型②（-128〜127）
        sbyte _sbyte = -128;
        Console.WriteLine(_sbyte); //-128
        Console.WriteLine(_sbyte.GetType()); //System.SByte
        
        //整数型③（-32768〜32767）
        short _short = -32768;
        Console.WriteLine(_short); //-32768
        Console.WriteLine(_short.GetType()); //System.Int16
        
        //整数型④（0〜65535）
        ushort _ushort = 65535;
        Console.WriteLine(_ushort); //65535
        Console.WriteLine(_ushort.GetType()); //System.UInt16
        
        //整数型⑤（-2147483648〜2147483647）
        int _int = -2147483648;
        Console.WriteLine(_int); //-2147483648
        Console.WriteLine(_int.GetType()); //System.Int32

        int _int16 = 0xFFCC00; //16進数の場合
        Console.WriteLine(_int16); //16763904
        Console.WriteLine(_int16.GetType()); //System.Int32
        
        //整数型⑥（0〜4294967295）
        uint _uint = 4294967295;
        Console.WriteLine(_uint); //4294967295
        Console.WriteLine(_uint.GetType()); //System.UInt32
        
        //整数型⑦（-9223372036854775808〜9223372036854775807）
        long _long = -9223372036854775808;
        Console.WriteLine(_long); //-9223372036854775808
        Console.WriteLine(_long.GetType()); //System.Int64
        
        //整数型⑧（0〜18446744073709551615）
        ulong _ulong = 18446744073709551615;
        Console.WriteLine(_ulong); //18446744073709551615
        Console.WriteLine(_ulong.GetType()); //System.UInt64
        
        //浮動小数点数型①
        float _float = 3.1415926f; //最期に「f」
        Console.WriteLine(_float); //3.141593
        Console.WriteLine(_float.GetType()); //System.Single
        
        //浮動小数点数型②
        double _double = 3.141592653589793d; //「d」をつけなくても同じ
        Console.WriteLine(_double); //3.14159265358979
        Console.WriteLine(_double.GetType()); //System.Double
        
        //浮動小数点数型③
        decimal _decimal = 3.14159265358979323846264338327m; //最期に「m」
        Console.WriteLine(_decimal); //3.1415926535897932384626433833
        Console.WriteLine(_decimal.GetType()); //System.Decimal
        
        //文字型①（char型＝1文字）
        char _char = 'a'; //シングルクォーテーション
        Console.WriteLine(_char); //a
        Console.WriteLine(_char.GetType()); //System.Char
        
        //文字型②（string型）
        string _string = "999"; //ダブルクォーテーション
        Console.WriteLine(_string); //999
        Console.WriteLine(_string.GetType()); //System.string

        //null許容型
        int? _null = null; //string型は不可
        Console.WriteLine(_null); //（null）
        Console.WriteLine(_null == null); //True

        //列挙型（enum）
        Console.WriteLine(Signal.BLUE); //BLUE
        Console.WriteLine(Signal.BLUE.GetType()); //Signal
        Console.WriteLine((int)Signal.BLUE); //0 ←キャストによる型変換が必要

        //構造体（クラスに似ているが継承は不可）
        MyStruct _struct = new MyStruct("Takashi Nishimura", 49);
        Console.WriteLine(_struct); //MyStruct
        Console.WriteLine(_struct.GetType()); //MyStruct
        
        //匿名型クラス（宣言には、必ずvarキーワードを使います）
        var _anon = new { Name="Takashi Nishimrua", Age=49 }; //読み取り専用（注意）
        Console.WriteLine(_anon); //{ Name = Takashi Nishimrua, Age = 49 }
        Console.WriteLine(_anon.Name); //"Takashi Nishimura ←取得方法
        Console.WriteLine(_anon.GetType());//<>__AnonType0`2[...

        //クラス
        MyClass _myClass = new MyClass("Takashi Nishimura", 48);
        Console.WriteLine(_myClass); //MyClass
        Console.WriteLine(_myClass.GetType()); //MyClass

        //配列
        int[] _array = new int[4]; //4個の空の要素を持つ配列の場合
        Console.WriteLine(_array); //System.Object[]
    }
}

enum Signal { BLUE,YELLOW,RED }; //列挙（enum）の定義

struct MyStruct { //構造体の定義
    public string name;
    public byte age;
    public MyStruct(string p1, byte p2) {
        name = p1;
        age = p2;
    }
}

class MyClass { //クラスの定義
    public string name;
    public byte age;
    public MyClass(string p1, byte p2) {
        name = p1;
        age = p2;
    }
}
```

実行環境：Ubuntu 16.04.2 LTS、C# 4.2.1  
作成者：Takashi Nishimura  
作成日：2015年11月14日  
更新日：2017年04月16日


<a name="データ型の操作"></a>
# <b>データ型の操作</b>

### データ型の調べ方
1. is 演算子
    * クラスか否かを調べる（○ is int といった使い方も可能）
    ```
    //test.cs
    using System;
    class Test {
        static void Main() {
            //クラスの場合
            var _tmp = new SubClass();
            Console.WriteLine(_tmp is SubClass); //True
            Console.WriteLine(_tmp is SuperClass); //True

            //匿名型クラスの場合
            var _tmp2 = new {};
            Console.WriteLine(_tmp2 is object); //True;
        }
    }

    class SuperClass {} //基本クラスの定義
    class SubClass : SuperClass {} //派生クラスの定義
    ```

1. as 演算子
    * キャスト成功時に変換後の値が返され、失敗するとエラー
    ```
    //test.cs
    using System;
    class Test {
        static void Main() {
            var _myClass = new MyClass();
            Console.WriteLine(_myClass as MyClass); //=> MyClass
            //Console.WriteLine(_myClass as HogeClass); //=> エラー
        }
    }

    class MyClass {}
    class HogeClass {};
    ```

1. GetType() メソッド
    * Object.GetType() メソッド（オブジェクトの型を返す）
    ```
    //test.cs
    using System;
    class Test {
        static void Main() {
            Console.WriteLine(true.GetType()); //=> System.Boolean
            Console.WriteLine(100.GetType()); //=> System.Int32
            Console.WriteLine(10000000000.GetType()); //=> System.UInt64
            Console.WriteLine(0.1.GetType()); //=> System.Double
            Console.WriteLine('1'.GetType()); //=> System.Char
            Console.WriteLine("1".GetType()); //=> System.String
            Console.WriteLine(new {}.GetType()); //=> <>__AnonType0
            Console.WriteLine(new MyClass().GetType()); //=> MyClass
        }
    }

    class MyClass {}
    ```

### データ型のキャスト
1. 数値↔ bool 型（不可）
    ```
    //test.cs
    using System;
    class Test {
        static void Main() {
            //bool _tmp = (bool)1; //error（数値→bool型への変換は不可）
            //int _tmp = (int)true; //error（bool型→数値への変換は不可）
        }
    }
    ```

1. 数値→ bool 型へ変換（力技）
    ```
    //test.cs
    using System;
    class Test {
        static void Main() {
            int _tmp = 0;
            bool _tmp2 = _tmp != 0; //0→Falseに変換（0以外はTrueに変換）
            Console.WriteLine(_tmp2); //False
        }
    }
    ```

1. bool型→数値へ変換
    ```
    //test.cs
    using System;
    class Test {
        static void Main() {
            bool _tmp = true;
            int _tmp2 = Convert.ToInt32(_tmp); //true→1に変換（falseは0に変換）
            Console.WriteLine(_tmp2); //1
        }
    }
    ```

1. 数値↔数値（縮小変換）
    ```
    //test.cs
    using System;
    class Test {
        static void Main() {
            //整数の場合
            long _tmp1 = 2147483648; //intは-2147483648〜2147483647
            int _tmp2 = (int)_tmp1; //long型→int型へ変換
            Console.WriteLine(_tmp2); //-2147483648 ←元のデータが失われる

            //浮動小数点数の場合
            decimal _decimal = 3.14159265358979323846264338327m;
            double _tmp3 = (double)_decimal;
            Console.WriteLine(_tmp3); //3.14159265358979 ←データの一部が失われる
        }
    }
    ```

1. 数値↔数値（拡張変換）
    ```
    //test.cs
    using System;
    class Test {
        static void Main() {
            int _tmp = 2147483647; //intは-2147483648〜2147483647
            long _tmp2 = (long)_tmp + 1; //int型→long型へ変換
            Console.WriteLine(_tmp2); //2147483648
        }
    }
    ```

1. 数値↔ string 型
    ```
    //test.cs
    using System;
    class Test {
        static void Main() {
            string _tmp = "001";
            int _tmp2 = Int32.Parse(_tmp); //"001"（string型）→1（int型）に変換
            Console.WriteLine(_tmp2); //1
            Console.WriteLine(_tmp2.GetType()); //System.Int32
        }
    }
    ```

1. 数値→ string 型
```
//test.cs
using System;
class Test {
    static void Main() {
        int _tmp = 100;
        string _tmp2 = _tmp.ToString(); //100（int型）→"100"（string）に変換
        Console.WriteLine(_tmp2); //"100"
        Console.WriteLine(_tmp2.GetType()); //System.String
    }
}
```

実行環境：Ubuntu 16.04.2 LTS、C# 4.2.1  
作成者：Takashi Nishimura  
作成日：2015年11月07日  
更新日：2017年04月17日


<a name="クラス"></a>
# <b>クラス</b>

```
//test.cs
using System; //Console.WriteLine()に必要
class Test { //Mainは不可
    static void Main() { //自動的に最初に実行される
        //①インタンスの生成
        Rectangle _rectangle = new Rectangle();
        
        //②プロパティの更新
        _rectangle.width = 1920;
        _rectangle.height = 1080;
        //③プロパティの取得
        Console.WriteLine(_rectangle.width); //1920
        Console.WriteLine(_rectangle.height); //1080
        
        //④メソッドの実行
        Console.WriteLine(_rectangle.getArea()); //2073600
    }
}

class Rectangle { //長方形クラス
    //プロパティの定義･初期値の設定
    private int _width = 0; //privateは省略可
    private int _height = 0; //privateは省略可

    //コンストラクタは省略可（初期値はここで設定してもよい）
    public Rectangle() {}
    
    //メソッド群の定義
    public int width {
        get { return this._width; } //thisは省略可
        set { this._width = value; } //valueは決め打ち
    }
    public int height {
        get { return this._height; } //thisは省略可
        set { this._height = value; } //valueは決め打ち
    }
    public int getArea() { //面積を計算して値を返す
        return this._width * this._height; //thisは省略可
    }
}
```

実行環境：Ubuntu 16.04.2 LTS、C# 4.2.1  
作成者：Takashi Nishimura  
作成日：2015年11月02日  
更新日：2017年04月17日


<a name="基本クラスと派生クラス"></a>
# <b>基本クラスと派生クラス</b>

```
//test.cs
using System; //Console.WriteLine()に必要

class Test { //メインクラス（Main()メソッドを含む）←Mainは不可
    static void Main() { //自動的に最初に実行される
        //派生クラスＡのインスタンス
        SubClassA _subclassA = new SubClassA();
        Console.WriteLine(_subclassA.pSuperClass); //"基本クラスのプロパティ"
        Console.WriteLine(_subclassA.pSubClassA); //"派生クラスＡのプロパティ"
        Console.WriteLine(_subclassA.mSuperClass()); //"基本クラスのメソッド"
        Console.WriteLine(_subclassA.mSubClassA()); //"派生クラスＡのメソッド"
        
        //派生クラスＢのインスタンス
        SubClassB _subclassB = new SubClassB();
        Console.WriteLine(_subclassB.pSuperClass); //"基本クラスのプロパティ"
        Console.WriteLine(_subclassB.pSubClassB); //"派生クラスＢのプロパティ"
        Console.WriteLine(_subclassB.mSuperClass()); //"基本クラスのメソッド"
        Console.WriteLine(_subclassB.mSubClassB()); //"派生クラスＢのメソッド"
    }
}

//基本クラス（スーパークラス）
class SuperClass {
    //①プロパティの定義
    string _pSuperClass = "基本クラスのプロパティ"; //privateは省略
    //②メソッド群の定義
    public string pSuperClass {
        get { return _pSuperClass; } //thisは省略
    }
    public string mSuperClass() {
        return "基本クラスのメソッド";
    }
}

//派生クラスＡ
class SubClassA : SuperClass { //基本クラスを継承（多重継承は不可）
    //①プロパティの定義
    string _pSubClassA = "派生クラスＡのプロパティ"; //privateは省略
    //②メソッド群の定義
    public string pSubClassA {
        get { return _pSubClassA; } //thisは省略
    }
    public string mSubClassA() {
        return "派生クラスＡのメソッド";
    }
}

//派生クラスＡ
class SubClassB : SuperClass { //基本クラスを継承（多重継承は不可）
    //①プロパティの定義
    string _pSubClassB = "派生クラスＢのプロパティ"; //privateは省略
    //②メソッド群の定義
    public string pSubClassB {
        get { return _pSubClassB; } //thisは省略
    }
    public string mSubClassB() {
        return "派生クラスＢのメソッド";
    }
}
```

実行環境：Ubuntu 16.04.2 LTS、C# 4.2.1  
作成者：Takashi Nishimura  
作成日：2015年11月05日  
更新日：2017年04月17日


<a name="名前空間"></a>
# <b>名前空間</b>

### 概要
* フォルダによる階層構造でファイルを管理するかのようにクラスを管理（但し論理的）
* .NET Framework にある System 名前空間はその下に Text、IO、Drawing などあり
* デフォルトでは無名の名前空間（global名前空間）が使用される
* 1つの名前空間の中に、クラス/構造体/デリゲート/列挙/インターフェース等を宣言できる他、別の名前空間を宣言することも可能

### 書式
```
namespace 名前空間名 {
    class ○○ {
    }
    ......
}
```

### 例文
```
//test.cs
using System; //Console.WriteLine()に必要

class Test { //メインクラス（Main()メソッドを含む）←Mainは不可
    static void Main() { //自動的に最初に実行される
        MyLibrary.MyClass _myClass = new MyLibrary.MyClass();
        Console.WriteLine(_myClass); //MyLibrary.MyClass
    }
}

namespace MyLibrary {
    //インターフェース等
    class MyClass {
        public MyClass() { //コンストラクタ
            //いろいろな処理
        }
        //いろいろなメソッド
    }
    //いろいろなクラス
}
```

実行環境：Ubuntu 16.04.2 LTS、C# 4.2.1  
作成者：Takashi Nishimura  
作成日：2015年11月23日  
更新日：2017年04月17日


<a name="継承と委譲"></a>
# <b>継承と委譲</b>

### 概要
* GoF デザインパターンの [Adapter パターン](http://bit.ly/2naab8x)等で利用される
* 継承の場合は <b>:クラス名</b> を使い、委譲の場合は <b>new クラス名()</b> を使ってオブジェクトを生成し、他のクラスの機能を利用する

### 継承版
```
//test.cs
using System;

class Test {
    static void Main() {
        ClassB _classB = new ClassB();
        _classB.MyMethod();
    }
}

class ClassA {
    public void MyMethod() { Console.WriteLine("ClassA.MyMethod()"); }
}
class ClassB : ClassA {} //ClassAを継承
```

### 委譲版
```
//test.cs
using System;

class Test {
    static void Main() {
        ClassB _classB = new ClassB();
        _classB.MyMethod();
    }
}

class ClassA {
    public void MyMethod() { Console.WriteLine("ClassA.MyMethod()"); }
}
class ClassB { //この内容だけが継承と異なる
    private ClassA _classA;
    public ClassB() { _classA = new ClassA(); } //コンストラクタでオブジェクト生成
    public void MyMethod() { _classA.MyMethod(); }
}
```

実行環境：Ubuntu 16.04.2 LTS、C# 4.2.1  
作成者：Takashi Nishimura  
作成日：2015年11月26日  
更新日：2017年04月17日


<a name="変数とスコープ"></a>
# <b>変数とスコープ</b>

### 変数の種類
1. public 変数 : 全クラスからアクセス可能
1. protected 変数 : 同じクラスおよび派生クラス内でのみアクセス可能
1. private 変数 : 同じクラス内のみアクセス可能（省略すると private 扱い）
1. ローカル変数 : メソッド内でのみアクセス可能（メソッド内で宣言したもの）
* その他「ブロックスコープ」等あり

###  public 変数
* 特徴
    * 全クラスからアクセスが可能
    * クラス定義の直後、コンストラクタの直前に定義
    * 通常は private 変数を利用し、アクセスには「get / set アクセサ」を使用する

* 書式
```
class クラス名 { //クラス定義
public データ型 変数名; //public変数宣言（初期化も可）
    public クラス名() {} //コンストラクタ（省略可）
    ......
```

* 悪い例
```
//test.cs
using System;
class Test {
    static void Main() {
        MyClass _myClass = new MyClass();
        Console.WriteLine(_myClass._p); //アクセス可（他人の変数を勝手にいじる行為）
     }
}
class MyClass {
    public string _p = "public変数"; //public宣言は冒頭でおこなう
}
```

### protected 変数
* 特徴
    * 同じクラスおよび派生クラス内でのみアクセス可能
    * 基本クラス（スーパークラス）の定義の直後、コンストラクタの直前に定義

* 書式
```
class 基本クラス { //スーパークラス定義
    protected データ型 変数名; //protected変数宣言（初期化も可）
    public クラス名() {} //コンストラクタ（省略可）
    ......
```

* 例文
```
//test.cs
using System;
class Test {
    static void Main() {
        SubClass _subClass = new SubClass();
        Console.WriteLine(_subClass); //SubClass
        //Console.WriteLine(_subClass._pSuperClass); //error（アクセス不可）
     }
}

class SuperClass { //基本クラス
    protected string _pSuperClass = "SuperClass変数"; //protected変数宣言
}

class SubClass : SuperClass { //派生クラス
    public SubClass() {
        Console.WriteLine(_pSuperClass); //アクセス可能
    }
}
```

### private 変数
* 特徴
    * 同じクラス内のみアクセス可能（省略すると private 扱い）
    * クラス定義の直後、コンストラクタの直前に定義
    * 「他人の変数を勝手にいじってはいけない」というルールに則り、インスタンス変数は通常、private 変数とし、外部からは「get / set アクセサ」を使ってアクセスする

* 書式
```
class クラス名 { //クラス定義
private データ型 変数名; //private変数宣言（初期化も可）←privateは省略可
    public クラス名() {} //コンストラクタ（省略可）
    ......
```

* 例文
```
//test.cs
using System;
class Test {
    static void Main() {
        MyClass _myClass = new MyClass();
        Console.WriteLine(_myClass.P); //アクセス可（≠他人の変数を勝手にいじる行為）
     }
}

class MyClass {
    private string _p = "private変数"; //private宣言は冒頭でおこなう
    public string P {
        get { return _p; }
        set { _p = value; }
    }
}
```

### ローカル変数
* 特徴
    * ①メソッド ② for ③ foreach 文内で宣言
    * 宣言した ①メソッド ② for ③ foreach 文内でのみアクセス可能

1. メソッド内で宣言する場合
    ```
    //test.cs
    using System;
    class Test {
        static void Main() {
            MyClass _myClass = new MyClass();
            _myClass.MyMethod();
        }
    }

    class MyClass {
        private string _string = "private変数";
        public MyClass() { //コンストラクタ
            Console.WriteLine(_string); //private変数（ここはthisは無くても良い）
        }
        public void MyMethod() {
            string _string = "ローカル変数"; //ローカル変数宣言
            Console.WriteLine(_string); //ローカル変数
            Console.WriteLine(this._string); //private変数（ここではthisが必須）
        }
    }
    ```

1. for 文内で宣言する場合（foreach 文も同様）
```
//test.cs
using System;
class Test {
    static void Main() {
        new MyClass();
     }
}
class MyClass {
    private int _i = 999; //private変数
    public MyClass() { //コンストラクタ
        for (int _i=0; _i<=5; _i++) { //ローカル変数宣言
            Console.WriteLine("A: " + _i); //0、1、2、...、5
            Console.WriteLine("B: " + this._i); //999（private変数）
        }
        //Console.WriteLine("C: " + _i); //error（ロカール変数はアクセス不可）
        Console.WriteLine("C: " + this._i); //999（private変数はthisが必須）
    }
}
```

実行環境：Ubuntu 16.04.2 LTS、C# 4.2.1  
作成者：Takashi Nishimura  
作成日：2015年11月20日  
更新日：2017年04月17日


<a name="アクセサ"></a>
# <b>アクセサ （getter / setter）</b>

### 読み書き可能なプロパティ
```
//test.cs
using System;
class Test {
    static void Main() {
        Nishimura _nishimura = new Nishimura();
        Console.WriteLine(_nishimura.Age); //49
        _nishimura.Age = 50; //値を変更可能
        Console.WriteLine(_nishimura.Age); //50
    }
}

class Nishimura {
    int _age = 49; //privateは省略
    public int Age {
        get { return _age; } //thisは省略
        set { _age = value; } //thisは省略 ←valueは予め定義された変数（決め打ち）
    }
}
```

### 読み取り専用のプロパティ
```
//test.cs
using System;
class Test {
    static void Main() {
        Nishimura _nishimura = new Nishimura();
        Console.WriteLine(_nishimura.Age); //49
        //_nishimura.Age = 50; //error（値の変更は不可）
        _nishimura.NextYear();
        Console.WriteLine(_nishimura.Age); //50
    }
}

class Nishimura {
    int _age = 49; //privateは省略
    public int Age {
        get { return _age; } //thisは省略
        private set {} //外部からアクセス不可（読み取り専用にする）
    }
    public void NextYear() { _age += 1; } //クラスの内部からに限り変更可能
}
```

実行環境：Ubuntu 16.04.2 LTS、C# 4.2.1  
作成者：Takashi Nishimura  
作成日：2015年11月09日  
更新日：2017年04月17日


<a name="演算子"></a>
# <b>演算子</b>

```
//test.cs
using System;

class Test {
    static void Main() {
        Console.WriteLine(3 + 2); //5 (可算) 
        Console.WriteLine(5 - 8); //-3 (減算)
        Console.WriteLine(3 * 4); //12 (乗算)
        Console.WriteLine(1 + 2 * 3 - 4 / 2); //5 (複雑な計算)
        Console.WriteLine(63 % 60); //3 (余剰)
        
        // 除算（注意が必要です）
        Console.WriteLine(8 / 3); //2(除算) ←整数同士の場合、余りは切り捨てられる
        Console.WriteLine(8 / 3.0); //2.66666666666667（小数点第14位までの値＝double型）

        float _float = (float)8.0 / 3;
        Console.WriteLine(_float); //2.666667（小数点第6位までの値）

        decimal _decimal = (decimal)8.0 / 3;
        Console.WriteLine(_decimal); //2.6666666666666666666666666667（第28位まで）

        // 後ろに付けるインクリメント（デクリメント）
        // _hoge++（_hoge--）が返す値は、加算（減算）する前の_hogeの値です
        int _hoge = 0;
        int _piyo = _hoge++; //デクリメントの場合_hoge--
        Console.WriteLine(_hoge); //1（デクリメントの場合-1）
        Console.WriteLine(_piyo); //0（デクリメントの場合0）

        // 前に付けるインクリメント（デクリメント）
        // ++_hoge（--_hoge）が返す値は、加算（減算）後の_hogeの値です
        _hoge = _piyo = 0;
        _piyo = ++_hoge; //デクリメントの場合--_hoge
        Console.WriteLine(_hoge); //1（デクリメントの場合-1）
        Console.WriteLine(_piyo); //1（デクリメントの場合-1） ←注目
    }
}
```

実行環境：Ubuntu 16.04.2 LTS、C# 4.2.1  
作成者：Takashi Nishimura  
作成日：2015年11月06日  
更新日：2017年04月17日


<a name="定数"></a>
# <b>定数</b>

### 通常の定数
```
//test.cs
using System;
class Test {
    static void Main() { //自動的に最初に実行される
        const float PI = 3.14159f; //staticは記述しない（注意）
        Console.WriteLine(PI); //=> 3.14159
        //PI = 3.14; //error（変更不可）
    }
}
```

### 静的定数（メンバ定数）
* 構文
```
class クラス名 {
    public const float 定数名 = 値; //staticは記述しない
    ...
}

#アクセス方法
クラス名.定数名
```

* 例文
```
//test.cs
using System;

//メインクラス
class Test {
    static void Main() { //自動的に最初に実行される
        Console.WriteLine(MyMath.PI); //=> 3.14159
        //MyMath.PI = 3.14; //error（変更不可）
    }
}

//カスタムクラス（MyMath）
class MyMath {
    public const float PI = 3.14159f; //staticは記述しない（注意）
    public MyMath() {} //コンストラクタ
}
```

実行環境：Ubuntu 16.04.2 LTS、C# 4.2.1  
作成者：Takashi Nishimura  
作成日：2015年11月06日  
更新日：2017年04月17日


<a name="メソッド"></a>
# <b>メソッド</b>

### 基本構文
```
アクセス修飾子 [static] 戻り値のデータ型 メソッド名([データ型 引数, ...]) {
    [return 戻り値;]
}
```

### アクセス修飾子
1. public : 全クラスからアクセス可能
1. protected : 同じクラスおよび派生クラス内でのみアクセス可能
1. private : 同じクラス内のみアクセス可能（省略すると private 扱い）
1. internal : アセンブリ内でのみアクセス可能
* static : 静的メソッド＝クラスメソッド

### 基本例文
```
//test.cs
using System;
class Test {
    static void Main() { //自動的に最初に実行される
        MyClass _myClass = new MyClass();
        Console.WriteLine(_myClass.Tashizan(1,10)); //55
        Console.WriteLine(_myClass.Tashizan(1,100)); //5050
    }
}

class MyClass {
    //○〜○までの値を足した合計を返す
    public int Tashizan(int _start, int _end) {
        int _result = 0; //ローカル変数
        for (int _i = _start; _i <= _end; _i++) {
            _result += _i;
        }
        return _result;
    }
}
```

### Main()メソッド
* 特徴
    * 記述できるクラスは１つだけ（複数存在するとエラー）
    * 自動的に最初に実行
    * static キーワードが必須（オブジェクトの生成をしなくても Main() を呼び出す必要がある為）
    * 値を返したり、引数を渡すことも可能

* 例文
```
//test.cs
using System;
class Test { //メインクラス（Mainは不可）
    static void Main() { //自動的に最初に実行される
        Method(); //"Test.Method()"
    }
    static void Method() { //staticなメソッドならMain()から呼び出せる
        Console.WriteLine("Test.Method()");
    }
}
```

### コンストラクタ
* 書式】
```
class クラス名 {
    public クラス名([型① 引数①, 型② 引数②, ...]) { //コンストラクタは省略可
        ......
    }
    ......
```

* 例文
```
//test.cs
using System;
class Test {
    static void Main() {
        Point _point = new Point(100,150); //ここでコンストラクタを呼び出す
        Console.WriteLine(_point.X); //100
        Console.WriteLine(_point.Y); //150
     }
}

class Point {
    private int _x, _y;
    public Point(int _x=0, int _y=0) { //コンストラクタ
        this._x = _x;
        this._y = _y;
    }
    public int X {
        get { return _x; }
        set { _x = value; }
    }
    public int Y {
        get { return _y; }
        set { _y = value; }
    }
}
```

### 静的メソッド（クラスメソッド）
```
//test.cs
using System;
class Test {
    static void Main() { //自動的に最初に実行される
        Console.WriteLine(Math.Pow(2,0)); //1（2の0乗）
        Console.WriteLine(Math.Pow(2,1)); //2（2の1乗）
        Console.WriteLine(Math.Pow(2,8)); //256（2の8乗）
    }
}

class Math {
    public static long Pow(int arg1, int arg2) {
        if (arg2 == 0) { return 1; } //0乗対策
        long _result = arg1;
        for (int i=1; i<arg2; i++) {
            _result = _result * arg1;
        }
        return _result;
    }
}
```

### デフォルト値付き引数
* オプション引数（引数は省略可）
```
//test.cs
using System;
class Test {
    static void Main() { //自動的に最初に実行される
        MyClass _myClass = new MyClass();
        _myClass.AddPoint(); //→1
        _myClass.AddPoint(10); //→11
    }
}

class MyClass {
    private int _point = 0;
    public void AddPoint(int arg = 1) { //初期値を1とした場合
        _point += arg;
        Console.WriteLine(_point);
    }
}
```

### 可変長引数
* 引数を固定の数ではなく任意の数にすることが可能
```
//test.cs
using System;
class Test {
    static void Main() { //自動的に最初に実行される
        MyClass _myClass = new MyClass();
        _myClass.Sum(1,1); //2（1+1）
        _myClass.Sum(1,2,3,4,5); //15（1+2+3+4+5）
    }
}

class MyClass {
    public void Sum(params int[] args) {
        int _result = 0; //ローカル変数
        foreach (int tmp in args) {
            _result += tmp;
        }
        Console.WriteLine(_result);
    }
}
```

### 名前付き引数
* 引数名を指定してメソッドを呼び出す（任意の順序で引数を渡すことが可能）
```
//test.cs
using System;
class Test {
    static void Main() { //自動的に最初に実行される
        MyClass _myClass = new MyClass();
        _myClass.Rect(endX:100, endY:100); //面積:10000m2
        _myClass.Rect(10,10,100,100); //面積:8100m2
    }
}

class MyClass {
    public void Rect(int startX=0, int startY=0, int endX=0, int endY=0) {
        int _result = (endX - startX) * (endY - startY);
        Console.WriteLine("面積:" + _result + "m2");
    }
}
```

実行環境：Ubuntu 16.04.2 LTS、C# 4.2.1  
作成者：Takashi Nishimura  
作成日：2016年11月25日  
更新日：2017年04月18日


<a name="匿名メソッド"></a>
# <b>匿名メソッド</b>

```
//test.cs
using System;
class Test { //メインクラス
    static void Main() { //自動的最初に実行される
        MyClass _myClass = new MyClass();
        _myClass.Move(1); //→
        _myClass.change();
        _myClass.Move(3); //←←←
    }
}
class MyClass {
    public delegate void Method(int arg); //デリゲートの宣言（名前＝Methodは任意）
    public Method Move; //匿名メソッドを格納する変数Move（＝メソッド名）
    private bool _right = true;
    public MyClass() { //コンストラクタ
        //匿名メソッドの定義
        Move = delegate(int arg) {
            string _tmp = "";
            for (int i=0; i<arg; i++) _tmp += "→";
            Console.WriteLine(_tmp);
        };
    }
    public void change() {
        _right = ! _right;
        if (_right) {
            Move = delegate(int arg) {
                string _tmp = "";
                for (int i=0; i<arg; i++) _tmp += "→";
                Console.WriteLine(_tmp);
            }; //...匿名メソッドの再定義（メソッドの内容を変更）
        } else {
            Move = delegate(int arg) { //匿名メソッドの再定義（メソッドの内容を変更）
                string _tmp = "";
                for (int i=0; i<arg; i++) _tmp += "←";
                Console.WriteLine(_tmp);
            };
        }
    }
}
```

実行環境：Ubuntu 16.04.2 LTS、C# 4.2.1  
作成者：Takashi Nishimura  
作成日：2015年11月09日  
更新日：2017年04月18日


<a name="ラムダ式"></a>
# <b>ラムダ式</b>
* [匿名メソッド](#匿名メソッド)を「ラムダ式」に置き換えたバージョン

```
//test.cs
using System;
class Test { //メインクラス
    static void Main() { //自動的最初に実行される
        MyClass _myClass = new MyClass();
        _myClass.Move(1); //→
        _myClass.change();
        _myClass.Move(3); //←←←
    }
}
class MyClass {
    public delegate void Method(int arg); //デリゲートの宣言（名前＝Methodは任意）
    public Method Move; //匿名メソッドを格納する変数Move（＝メソッド名）
    private bool _right = true;
    public MyClass() { //コンストラクタ
        Move = (int arg) => { //匿名メソッドの代りにラムダ式を利用
            string _tmp = "";
            for (int i=0; i<arg; i++) _tmp += "→";
            Console.WriteLine(_tmp);
        }; //メソッドの内容を変更
    }
    public void change() {
        _right = ! _right;
        if (_right) {
            Move = (int arg) => { //匿名メソッドの代りにラムダ式を利用
                string _tmp = "";
                for (int i=0; i<arg; i++) _tmp += "→";
                Console.WriteLine(_tmp);
            }; //メソッドの内容を変更
        } else {
            Move = (int arg) => { //匿名メソッドの代りにラムダ式を利用
                string _tmp = "";
                for (int i=0; i<arg; i++) _tmp += "←";
                Console.WriteLine(_tmp);
            }; //メソッドの内容を変更
        }
    }
}
```

実行環境：Ubuntu 16.04.2 LTS、C# 4.2.1  
作成者：Takashi Nishimura  
作成日：2015年11月09日  
更新日：2017年04月18日


<a name="静的メンバ（static）"></a>
# <b>静的メンバ（static）</b>
* 静的メンバはクラスをインスタンス化せずにアクセスが可能

```
//test.cs
using System;

class Test {
    static void Main() { //インスタンス化せずにOSから自動的に呼ぶ出すため
        Console.WriteLine(Math.PI); //3.14159265358979 ←静的変数の呼び出し
        Console.WriteLine(Math.Pow(2,8)); //256（2の8乗） ←静的メソッドの実行
    }
}

class Math { //独自クラス
    //静的変数
    public static double PI = 3.14159265358979;

    //静的メソッド
    public static long Pow(int arg1, int arg2) {
        if (arg2 == 0) { return 1; } //0乗対策
        long _result = arg1;
        for (int i=1; i<arg2; i++) {
            _result = _result * arg1;
        }
        return _result;
    }
}
```

実行環境：Ubuntu 16.04.2 LTS、C# 4.2.1  
作成者：Takashi Nishimura  
作成日：2015年11月21日  
更新日：2017年04月18日


<a name="if文"></a>
# <b>if 文</b>

### 基本例文
```
//test.cs
using System;
class Test { //メインクラス
    static void Main() { //自動的最初に実行される
        int _age = 49;
        if (_age <= 20) {
            Console.WriteLine("20歳以下");
        } else if (_age <= 40) {
            Console.WriteLine("21〜40歳");
        } else if (_age <= 60) {
            Console.WriteLine("41〜60歳"); //これが出力される
        } else {
            Console.WriteLine("61歳以上");
        }
    }
}
```

### 論理積（AND）
1. 論理演算子（&&）を使う方法
    ```
    if (条件式① && 条件②) {
        処理A ←条件式① かつ 条件式② の両方がtrueの場合に実行
    } else {
        処理B
    }
    ```

1. ifのネストを使う方法
    ```
    if (条件式①) {
        if (条件②) {
            処理A ←条件式① かつ 条件式② の両方がtrueの場合に実行
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

2. ifのネストを使う方法
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
1. ^ 演算子を使う方法
    ```
    //test.cs
    using System;
    class Test { //メインクラス
        static void Main() { //自動的最初に実行され
            bool _a = true, _b = false;
            if (_a ^ _b) {
                Console.WriteLine("どちらか一方だけtrueです");
            } else {
                Console.WriteLine("両方共にtrueかfalseです");
            }
        }
    }
    ```

1. ^ 演算子を使わない方法
    ```
    //test.cs
    using System;
    class Test {
        static void Main() {
            bool _a = true, _b = false;
            if ((_a || _b) && !(_a && _b)) {
                Console.WriteLine("どちらか一方だけtrueです");
            } else {
                Console.WriteLine("両方共にtrueかfalseです");
            }
        }
    }
    ```

実行環境：Ubuntu 16.04.2 LTS、C# 4.2.1  
作成者：Takashi Nishimura  
作成日：2015年11月09日  
更新日：2017年04月18日


<a name="三項演算子"></a>
# <b>三項演算子</b>

### 比較式が１つの場合
* 構文
```
データ型 変数名 = (比較式) ? (true時の返り値) : (false時の返り値);
```

* 例文
```
//test.cs
using System;
class Test {
    static void Main() {
        int _age = 49;
        string _result = (_age < 60) ? "現役" : "退職";
        Console.WriteLine(_result); //"現役"
    }
}
```

### 比較式が複数の場合
* 構文
```
データ型 変数名 = (比較式①) ? (①がtrueの場合の返り値) : //①がfalseの場合↓
変数名 = (比較式②) ? (②がtrueの場合の返り値) : //②がfalseの場合↓
変数名 = (①②の全てがfalseの場合の返り値);
```

* 例文
```
//test.cs
using System;
class Test {
    static void Main() {
        int _age = 49;
        string _result = (_age < 20) ? "未成年" :
        _result = (_age < 60) ? "現役" :
        _result = "退職";
        Console.WriteLine(_result); //"現役"
    }
}
```

実行環境：Ubuntu 16.04.2 LTS、C# 4.2.1  
作成者：Takashi Nishimura  
作成日：2015年11月09日  
更新日：2017年04月18日


<a name="switch文"></a>
# <b>switch 文</b>

### 基本サンプル
```
//test.cs
using System;
class Test {
    static void Main() {
        string _name = "TAKASHI";
        switch (_name) { //判別式には「整数型」「文字型」しか使えない!
            case "TAKASHI" :
                Console.WriteLine("父");
                break;
            case "HANAKO" : 
                Console.WriteLine("母");
                break;
            case "TARO" :
                Console.WriteLine("長男");
                break;
            case "JISO" :
                Console.WriteLine("次男");
                break;
            default:
                Console.WriteLine("家族以外");
                break; //defaultのbreakは省略不可（注意）
        }
    }
}
```

### 注意その１ : 判別式にbool型が使えない
* 判別式に指定可能なもの
    * byte 型、short 型、int 型 などの整数型（浮動小数点型は指定不可）
    * char 型、string 型といった文字型

* 悪い例（エラー発生）
    ```
    //test.cs
    using System;
    class Test {
        static void Main() {
            int _age = 49;
            switch (true) { //bool型はエラー（注意）
                case _age < 20 :
                    Console.WriteLine("未成年");
                    break;
                default:
                    Console.WriteLine("成人");
                    break;
            }
        }
    }
    ```

### 注意その２ : フォールスルーの禁止規則
* C#では、下記のように case で何か処理をしておきながら break 文を書かないで次の case の処理に入っていくことは不可（フォールスルーの禁止規則）
```
case "○○" : 何か処理; //何か処理をしておきながらbreakを書かないとエラー
case "□□" : 何か処理; break;
```

* 良い例
```
//test.cs
using System;
class Test {
    static void Main() {
        string _name = "JIRO";
        switch (_name) {
            case "TAKASHI" : //breakが無いと次のcaseも処理
            case "HANAKO" : 
                Console.WriteLine("親");
                break;
            case "TARO" : //breakが無いと次のcaseも処理
            case "JIRO" :
                Console.WriteLine("子");
                break;
            default:
                Console.WriteLine("家族以外");
                break; //defaultのbreakは省略不可
        }
    }
}
```

実行環境：Ubuntu 16.04.2 LTS、C# 4.2.1  
作成者：Takashi Nishimura  
作成日：2015年11月10日  
更新日：2017年04月18日


<a name="for文"></a>
# <b>for 文</b>

### 基本構文
```
for (①初期化; ②ループ判定式; ③更新処理) {
    繰り返す処理
}
```

### ループカウンタ（ループ制御変数）の宣言位置
1. for 文の中で宣言
    ```
    //test.cs
    using System;
    class Test {
        static void Main() {
            for (int i=0; i<10; i++) { //ここでint型を宣言すると...
                Console.WriteLine(i); //0,1,2,3,4,5,6,7,8,9
            }
            //Console.WriteLine(i); //error（for文の外では使用不可）
        }
    }
    ```

1. for 文の外でループ制御変数を宣言する
    ```
    //test.cs
    using System;
    class Test {
        static void Main() {
            int _i; //ここでint型を宣言すると...
            for (_i=0; _i<10; _i++) {
                Console.WriteLine(_i); //0,1,2,3,4,5,6,7,8,9
            }
            Console.WriteLine(_i); //10（for文の外でも有効）
        }
    }
    ```

### ループカウンタを○つずつアップする
```
//test.cs
using System;
class Test {
    static void Main() {
        for (int i=0; i<50; i+=5) { //5つずつアップする場合...
            Console.WriteLine(i); //0,5,10,15,20,25,30,35,40,45
        }
    }
}
```

### for 文のネスト
```
//test.cs
using System;
class Test {
    static void Main() {
        for (int i=1; i<=5; i++) {
            for (int j=1; j<=5; j++) {
                Console.WriteLine("x" + i + "y" + j); //x1y1,x1y2,....,x5y4,x5y5
            }
        }
    }
}
```

### 無限ループと break 文
```
//test.cs
using System;
class Test {
    static void Main() {
        int _count = 0;
        for (;;) { //①初期化 ②ループ判定式 ③更新処理...の全てを省略すると無限ループ
            _count++;
            if (_count > 100) break; //ループを終了
            Console.WriteLine(_count); //1,2,....,99,100
        }
        Console.WriteLine("for文終了"); //★
    }
}
```

### for 文と continue 文
```
//test.cs
using System;
class Test {
    static void Main() {
        for (int i=1; i<=20; i++) { //iは1,2,...19,20
            if ((i % 3) != 0) { //3で割って余りが0ではない（＝3の倍数ではない）場合
                continue; //for文の残処理をスキップしてfor文の次の反復を開始する
            }
            Console.WriteLine(i); //3,6,9,12,15,18（3の倍数）
        }
    }
}
```

実行環境：Ubuntu 16.04.2 LTS、C# 4.2.1  
作成者：Takashi Nishimura  
作成日：2015年11月10日  
更新日：2017年04月19日


<a name="foreach文"></a>
# <b>foreach 文</b>

### 基本構文
```
foreach (データ型 変数名 in 配列等) {
    Console.WriteLine(変数名);
}
```

### 配列（1次元）の場合
```
//test.cs
using System;
class Test {
    static void Main() {
        string[] _array = {"A","B","C","D"}; 
        foreach (string value in _array) {
            Console.WriteLine(value); //"A"→"B"→"C"→"D"
        }
    }
}
```

### 配列（2次元）の場合
```
//test.cs
using System;
class Test {
    static void Main() {
        string[,] _array = {
            {"x0y0","x1y0","x2y0"}, //0行目
            {"x0y1","x1y1","x2y1"}  //1行目
        }; 
        foreach (string value in _array) {
            Console.WriteLine(value); //"x0y0"→"x1y0"→"x2y0"→"x0y1"→"x1y1"→"x2y1"
        }
    }
}
```

### 配列（ジャグ配列）の場合
```
//test.cs
using System;
class Test {
    static void Main() {
        dynamic[][] _array = new dynamic[2][];
            _array[0] = new dynamic[]{"A","あ"};
            _array[1] = new dynamic[]{"I","い"};
        foreach (object[] theArray in _array) {
            foreach (object value in theArray) {
                Console.WriteLine(value); //"A"→"あ"、"I"→"い"
            }
            Console.WriteLine(); //オプション（改行）
        }
    }
}
```

### 動的配列（ArrayList）の場合
```
//test.cs
using System;
using System.Collections; //ArrayListに必要
class Test {
    static void Main() {
        ArrayList _array = new ArrayList();
        _array.Add("TAKASHI");
        _array.Add(49);
        foreach (object value in _array) {
            Console.WriteLine(value); //"TAKASHI"→49
        }
    }
}
```

### 動的配列（List）の場合
```
//test.cs
using System;
using System.Collections.Generic; //Listに必要
class Test {
    static void Main() {
        List<string> _list = new List<string>() { "A", "B" };
        foreach (string value in _list) {
            Console.WriteLine(value); //"A"→"B"
        }
    }
}
```

### 連想配列の場合
```
//test.cs
using System;
using System.Collections.Generic; //Dictionaryに必要
class Test {
    static void Main() {
        Dictionary<string, string> _dic = new Dictionary<string, string>() {
            {"A", "あ"},    {"I", "い"}
        };
        foreach (KeyValuePair<string, string> tmp in _dic) {
            Console.WriteLine(tmp.Key + ":" + tmp.Value); //A:あ → I:い
        }
    }
}
```

実行環境：Ubuntu 16.04.2 LTS、C# 4.2.1  
作成者：Takashi Nishimura  
作成日：2016年01月21日  
更新日：2017年04月19日


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
//test.cs
using System;

class Test {
    static void Main() {
        int _i = 0;
        while (_i < 10) { //ループ判定式にはbool型しか使えない
            Console.WriteLine(_i); //0,1,2,3,4,5,6,7,8,9
            _i++;
        }
        Console.WriteLine(_i); //10（変数はまだ有効）
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
//test.cs
using System;
class Test {
    static void Main() {
        int _i = 0;
        do {
            Debug.Log(_i); //0 ←ループ判定式はfalseだが１回実行される
            _i++;
        } while(_i < 0);
    }
}
```

### while 文と break 文
```
//test.cs
using System;
class Test {
    static void Main() {
        int _count = 0;
        while (true) { //ループ判別式をtrueにすると無限ループに
            _count++;
            if (_count > 100) {
                break; //break文を使ってループを終了→★
            }
            Console.WriteLine(_count); //1,2,....,99,100（1〜100までを出力）
        }
        Console.WriteLine("while文終了"); //★
    }
}
```

### while 文と continue 文
```
//test.cs
using System;
class Test {
    static void Main() {
        int _i = 1;
        while (_i <= 20) {
            if ((_i % 3) != 0) { //3で割って余りが0ではない（＝3の倍数ではない）場合
                _i++;
                continue; //while文の残処理をスキップしてwhile文の次の反復を開始する
            }
            Debug.Log(_i); //3,6,9,12,15,18（3の倍数を出力）
            _i++;
        }
    }
}
```

実行環境：Ubuntu 16.04.2 LTS、C# 4.2.1  
作成者：Takashi Nishimura  
作成日：2015年11月10日  
更新日：2017年04月19日


<a name="配列"></a>
# <b>配列</b>
* Java では配列の宣言後に要素の数を変更することは不可

### １次元配列の作成方法
1. int[] _array = new int[4]; //4つの空の要素（動的型）を持つ配列を作成
1. String[] _array = new String[]{"A","B","C","D"};
1. String[] _array = {"A","B","C","D"}; //簡単

### 配列の配列(≒2次元配列、ジャグ配列)の場合
* Java/C++にはC#のような多次元配列がないため「配列の配列」で代用
* 以下の例文では５行x４列のコインロッカーのような配列を作成

1. new 演算子を使う方法
    ```
    //Main.java
    public class Main { //publicは省略可
        public static void main(String[] args) { //決め打ち（自動的に実行）
            String[][] _coinlocker = new String[5][4]; //new データ型[行数][列数]
            _coinlocker[0][0] = "1083";
            _coinlocker[0][1] = "7777";
            _coinlocker[2][1] = "0135";
            _coinlocker[4][3] = "1234";
        }
    }
    ```

1. 配列リテラルを使う方法
    ```
    //Main.java
    public class Main { //publicは省略可
        public static void main(String[] args) { //決め打ち（自動的に実行）
            String[][] _coinlocker = 
            {{"1083","7777","",""}, //0行目
            {"","","",""},         //1行目
            {"","0135","",""},     //2行目
            {"","","",""},         //3行目
            {"","","","1234"}};    //4行目
            System.out.println(_coinlocker[0][0]); //=> "1083"
            System.out.println(_coinlocker[0][1]); //=> "7777"
            System.out.println(_coinlocker[2][1]); //=> "0135"
            System.out.println(_coinlocker[4][3]); //=> "1234"
        }
    }
    ```

### 配列の要素の数
```
//Main.java
public class Main { //publicは省略可
    public static void main(String[] args) { //決め打ち（自動的に実行）
        String[] _array = {"A","B","C","D"};
        for (int i=0; i<_array.length; i++) { 
            System.out.println(_array[i]);
        }
    }
}
```

### 文字列→配列
```
//Main.java
public class Main { //publicは省略可
    public static void main(String[] args) { //決め打ち（自動的に実行）
        String _string = "A,B,C,D"; //「,」区切りの文字列
        String[] _array = _string.split(","); //「,」区切りで分割して配列化
    }
}
```

実行環境：Ubuntu 16.04.2 LTS、C# 4.2.1  
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

実行環境：Ubuntu 16.04.2 LTS、C# 4.2.1  
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

実行環境：Ubuntu 16.04.2 LTS、C# 4.2.1  
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

実行環境：Ubuntu 16.04.2 LTS、C# 4.2.1  
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

実行環境：Ubuntu 16.04.2 LTS、C# 4.2.1  
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

実行環境：Ubuntu 16.04.2 LTS、C# 4.2.1  
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

実行環境：Ubuntu 16.04.2 LTS、C# 4.2.1  
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

実行環境：Ubuntu 16.04.2 LTS、C# 4.2.1  
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
    :
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

実行環境：Ubuntu 16.04.2 LTS、C# 4.2.1  
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

実行環境：Ubuntu 16.04.2 LTS、C# 4.2.1  
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
    :
}
class 派生クラス extends 抽象クラス名 { //抽象クラスを継承
    [アクセス修飾子] 戻り値の型 抽象メソッド名([型 引数]) { //オーバーライド
        //実際の処理
    }
    :
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
    //final public void method() { ...とするとオーバーライドを禁止にできます
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

実行環境：Ubuntu 16.04.2 LTS、C# 4.2.1  
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

実行環境：Ubuntu 16.04.2 LTS、C# 4.2.1  
作成者：Takashi Nishimura  
作成日：2016年07月19日  
更新日：2017年04月12日


<a name="数学関数（Math）"></a>
# <b>数学関数（Math）</b>

### 概要
* Math クラスは java.lang パッケージに含まれているため importする必要はない
* Math クラスは全て静的メンバ（static）である
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
* Πラジアン（3.141592...）は180°
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

実行環境：Ubuntu 16.04.2 LTS、C# 4.2.1  
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

実行環境：Ubuntu 16.04.2 LTS、C# 4.2.1  
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

実行環境：Ubuntu 16.04.2 LTS、C# 4.2.1  
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
        //↓2000ミリ秒（2秒）後に1回だけ実行する場合...
        //_timer.schedule(new OnceExecute(), 2000);
        //0秒後から10fps（100ミリ秒毎）の間隔で繰返し実行する場合...
        _timer.schedule(new LoopExec(), 0, 100); 
    }
}
class LoopExec extends TimerTask {
    public void run() { //決め打ち
        System.out.println("繰り返しまたは、指定秒後に１度だけ実行したい処理");
    }
}
```

実行環境：Ubuntu 16.04.2 LTS、C# 4.2.1  
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
        for (long i=0; i<10000000000L; i++) { //100億回繰り返す場合...
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
        for (long i=0; i<10000000000L; i++) { //100億回繰り返す場合...
            //速度計測したい処理
        }
        long _end = System.nanoTime();
        System.out.println((_end - _start) / 1000000f + "ミリ秒"); //=> 3253.8875ミリ秒
    }
}
```

実行環境：Ubuntu 16.04.2 LTS、C# 4.2.1  
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
            File file_ = new File("sample.txt"); #同じ階層に○.txtがある場合...

            //②FileReaderクラスのオブジェクトの生成
            FileReader filereader_ = new FileReader(file_);
            
            //③１文字ずつ読み込んでいきます
            int _int;
            while((_int = filereader_.read()) != -1){
                //④文字コードを文字に変換
                System.out.print((char)_int); //=>"あ"=>"い"=>"う"=>...
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

実行環境：Ubuntu 16.04.2 LTS、C# 4.2.1  
作成者：Takashi Nishimura  
作成日：2016年07月20日  
更新日：2017年04月12日