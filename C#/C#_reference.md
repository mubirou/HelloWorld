### <b>この項目は書きかけの項目です</b>

# <b>C# 基礎文法</b>

### <b>INDEX</b>

* Hello,world! （[Linux](https://github.com/TakashiNishimura/HelloWorld/blob/master/C%23/C%23_linux.md) / [macOS](https://github.com/TakashiNishimura/HelloWorld/blob/master/C%23/C%23_mac.md) / [Windows](https://github.com/TakashiNishimura/HelloWorld/blob/master/C%23/C%23_win.md)）
* [データ型](#データ型)
* [データ型の操作](#データ型の操作)
* [クラス](#クラス)
* [基本クラスと派生クラス](#基本クラスと派生クラス)
* [名前空間](#名前空間)
***
* [継承と委譲](#継承と委譲)
* [変数とスコープ](#変数とスコープ)
* [アクセサ （getter / setter）](#アクセサ)
* [演算子](#演算子)
* [定数](#定数)
* [メソッド](#メソッド)
* [匿名関数（ラムダ式）](#匿名関数（ラムダ式）)
* [静的メンバ（static）](#静的メンバ（static）)
* [if 文](#if文)
* [三項演算子](#三項演算子)
* [switch 文](#switch文)
* [for 文](#for文)
* [for-each 文](#for-each文)
* [while 文](#while文)
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

class Test { //メインクラス（Main()メソッドを含む）←…Mainは不可
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
        get { return _pSubClassA; } //thisは省略。
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
    ……
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
    //インターフェース等…
    class MyClass {
        public MyClass() { //コンストラクタ
            //いろいろな処理…
        }
        //いろいろなメソッド…
    }
    //いろいろなクラス…
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
* 継承の場合は <b>extends クラス名</b> を使い、委譲の場合は <b>new クラス名()</b> を使ってオブジェクトを生成し、他のクラスの機能を利用する

### 継承版
```
//Main.java
public class Main { //メインクラス（publicは省略可）
    public static void main(String[] args) { //決め打ち（自動的に最初に実行）
        ClassB _classB = new ClassB();
        _classB.myMethod();
    }
}

class ClassA {
    public void myMethod() { System.out.println("ClassA.myMethod()"); }
}

class ClassB extends ClassA {} //ClassAを継承
```

### 委譲版
```
//Main.java
public class Main { //メインクラス（publicは省略可）
    public static void main(String[] args) { //決め打ち（自動的に最初に実行）
        ClassB _classB = new ClassB();
        _classB.myMethod();
    }
}

class ClassA {
    public void myMethod() { System.out.println("ClassA.myMethod()"); }
}

class ClassB { //この内容だけが継承と異なる
    private ClassA _classA; //フィールドにインスタンスを格納（委譲）
    public ClassB() { //コンストラクタ
        _classA = new ClassA(); //フィールドにインスタンスを格納（thisは省略）
    }
    public void myMethod() { 
        _classA.myMethod(); //thisは省略
    }
}
```

実行環境：Ubuntu 16.04.2 LTS、C# 4.2.1  
作成者：Takashi Nishimura  
作成日：2016年07月14日  
更新日：2017年04月12日


<a name="変数とスコープ"></a>
# <b>変数とスコープ</b>

### 変数の種類
1. メンバ変数（＝フィールド）
    * アクセス修飾子指定しないと同じパッケージからのみ可能
    1. public : どのクラスからも可能
    2. protected : （サブクラスか同パッケージからのみ可能）
    3. private : 同じクラスからのみ可能
1. ローカル変数
1. クラス変数（＝ static 変数、静的変数）

### public（メンバ変数）: 非推奨
```
//Main.java
public class Main { //publicは省略可
    public static void main(String[] args) { //決め打ち（自動的に実行）
        MyClass _myClass = new MyClass();
        System.out.println(_myClass._p); //アクセス可（他人の変数を勝手にいじる行為）
    }
}

class MyClass {
    public String _p = "メンバ変数（public）"; //冒頭でpublic宣言
}
```

### private（メンバ変数）: 推奨
```
//Main.java
public class Main { //publicは省略可
    public static void main(String[] args) { //決め打ち（自動的に実行）
        MyClass _myClass = new MyClass();
        System.out.println(_myClass.getP()); //getterで参照可
        _myClass.setP("フィールド（private）"); //setterで変更可
    }
}
class MyClass {
    private String _p = "メンバ変数（private）"; //private宣言
    public String getP() { return _p; } //_pのgetter（thisは省略）
    public void setP(String _value) { _p = _value; } //_pのsetter（thisは省略）
}
```

### ローカ変数
1. メソッド内で宣言する場合
    ```
    //Main.java
    public class Main { //publicは省略可
        public static void main(String[] args) { //決め打ち（自動的に実行）
            MyClass _myClass = new MyClass();
            _myClass.myMethod();
        }
    }

    class MyClass {
        private String _p = "メンバ変数（private）";

        public MyClass() { //コンストラクタ
            System.out.println(_p); //=> "メンバ変数（private）"（ここはthis省略可）
        }

        public void myMethod() {
            String _p = "ローカル変数"; //ローカル変数宣言
            System.out.println(_p); //=> "ローカル変数"
            System.out.println(this._p); //=> "メンバ変数（private）"（ここはthis必須）
        }
    }
    ```

1. for文内で宣言する場合
    ```
    //Main.java
    public class Main { //publicは省略可
        public static void main(String[] args) { //決め打ち（自動的に実行）
            new MyClass();
        }
    }

    class MyClass {
        private int _i = 999; //private宣言
        public MyClass() { //コンストラクタ
            for (int _i=0; _i<=5; _i++) { //ローカル変数宣言
                System.out.println("A: " + _i); //0、1、2、...、5
                System.out.println("B: " + this._i); //999 ←メンバ変数（private）
            }
            System.out.println("C: " + _i); //999（thisは省略可）
        }
    }
    ```

実行環境：Ubuntu 16.04.2 LTS、C# 4.2.1  
作成者：Takashi Nishimura  
作成日：2016年07月14日  
更新日：2017年04月12日


<a name="アクセサ"></a>
# <b>アクセサ （getter / setter）</b>

### 概要
オブジェクト指向プログラミングの「他人の変数を勝手にいじってはいけない」というルールに則り、メンバ変数は private 変数とし、外部からはメソッドを使ってアクセスしますJava には他の多くの言語にある専用のアクセサが用意されていませんそこで、get○○()、set○○(型,引数) といった記述をして同じ機能を実現します

### 読書き可能なメンバ変数
```
//Main.java
public class Main { //publicは省略可
    public static void main(String[] args) { //決め打ち（自動的に実行）
        Nishimura _nishimura = new Nishimura();
        System.out.println(_nishimura.getAge()); //=> 49
        _nishimura.setAge(50); //値が変更できる
        System.out.println(_nishimura.getAge()); //=> 50
    }
}

class Nishimura {
    private int _age = 49; //private宣言
    public int getAge() { return _age; } //_ageのgetter（thisは省略）
    public void setAge(int _age) { this._age = _age; } //_ageのsetter
}
```

### 読取り専用のメンバ変数
```
//Main.java
public class Main { //publicは省略可
    public static void main(String[] args) { //決め打ち（自動的に実行）
        Nishimura _nishimura = new Nishimura();
        System.out.println(_nishimura.getAge()); //49
        //_nishimura._age = 50; //エラー（値が変更できない）
    }
}

class Nishimura {
    private int _age = 49; //private宣言
    public int getAge() { return _age; } //getterのみ用意（thisは省略）
}
```

実行環境：Ubuntu 16.04.2 LTS、C# 4.2.1  
作成者：Takashi Nishimura  
作成日：2016年07月14日  
更新日：2017年04月12日


<a name="演算子"></a>
# <b>演算子</b>

```
//Main.java
public class Main { //publicは省略可
    public static void main(String[] args) { //決め打ち（自動的に実行）

        //算術演算子（複合代入演算子+=,-=,*=,/=,%=などあり）
        System.out.println(3 + 2); //5 (可算)
        System.out.println(5 - 8); //-3 (減算)
        System.out.println(3 * 4); //12 (乗算)
        System.out.println(1 + 2 * 3 - 4 / 2); //5 (複雑な計算)
        System.out.println(63 % 60); //3 (余剰)
        System.out.println(8 / 3); //2(除算) ←整数の場合、余りは切り捨てられる
        System.out.println(8.0 / 3); //2.6666666666666665（小数点第16位まで）

        //後ろに付けるインクリメント（デクリメント）
        int _huga = 0;
        int _piyo = _huga++; //デクリメントの場合_huga--
        System.out.println(_huga); //1（デクリメントの場合 -1）
        System.out.println(_piyo); //0（デクリメントの場合 0）

        //前に付けるインクリメント（デクリメント）
        _huga = _piyo = 0;
        _piyo = ++_huga; //デクリメントの場合 --_huga
        System.out.println(_huga); //1（デクリメントの場合-1）
        System.out.println(_piyo); //1（デクリメントの場合-1）

        //その他の演算子
        System.out.println(true && true); //true（論理積）
        System.out.println(true || false); //true（論理和）
        System.out.println(! true); //false（否定）

        System.out.println(2 < 3); //true（比較/未満）
        System.out.println(2 <= 2); //true（比較/以下）
        System.out.println(1 == 1.0); //true（等号）
        System.out.println(1 != 1.0); //false（不等号）

        System.out.println(3 & 1); //1（ビット積）
        System.out.println(3 | 1); //3（ビット和）
        System.out.println(3 ^ 1); //2（排他的ビット和）
        System.out.println(2 << 7); //256（ビット･シフト）
        System.out.println(~3); //-4（ビット反転）

    }
}
```

実行環境：Ubuntu 16.04.2 LTS、C# 4.2.1  
作成者：Takashi Nishimura  
作成日：2016年07月15日  
更新日：2017年04月12日


<a name="定数"></a>
# <b>定数</b>

### 通常の定数
```
//Main.java
//メインクラス
public class Main { //publicは省略可
    public static void main(String[] args) { //決め打ち（自動的に実行）
        final float PI = 3.14159F;
        System.out.println(PI); //=> 3.14159
        //PI = 3.14; //エラー: final変数PIに値を代入することはできません
    }
}
```

### 静的定数（メンバ定数）
* 構文
```
class クラス名 {
    public static final データ型 定数名 = 値;
    :…
}

#アクセス方法
クラス名.定数名
```

* 例文
```
//Main.java
//メインクラス
public class Main { //publicは省略可
    public static void main(String[] args) { //決め打ち（自動的に実行）
        System.out.println(MyMath.PI); //=> 3.14159
        //MyMath.PI = 3.14; //エラー: final変数PIに値を代入することはできません
    }
}

//カスタムクラス（MyMath）
class MyMath { 
    public static final float PI = 3.14159F;
}
```

実行環境：Ubuntu 16.04.2 LTS、C# 4.2.1  
作成者：Takashi Nishimura  
作成日：2016年07月15日  
更新日：2017年04月12日


<a name="メソッド"></a>
# <b>メソッド</b>

### 基本構文
* 「デフォルト値付き引数」「名前付き引数」には非対応
```
[アクセス修飾子] [static] 戻り値のデータ型 メソッド名([データ型 引数, …]) {
    [return 戻り値;]
}
```

### アクセス修飾子】※省略すると同じパッケージ内からのみアクセス可能…とのこと
1. public : 全クラスからアクセス可能
1. protected : 同じクラスおよびサブクラス内（同じパッケージ）からアクセス可能
1. private : 同じクラス内からアクセス可能
* static : 静的メンバ＝クラスメソッド（インスタンスを作成せずにメソッドが利用可能）

### 基本例文
```
//Main.java
public class Main { //publicは省略可
    public static void main(String[] args) { //決め打ち（自動的に実行）
        MyClass _myClass = new MyClass();
        System.out.println(_myClass.tashizan(1,10)); //55
        System.out.println(_myClass.tashizan(1,100)); //5050
    }
}
class MyClass {
    //○〜○までの値を足した合計を返す
    public int tashizan(int _start, int _end) {
        int _result = 0; //ローカル変数
        for (int i = _start; i <= _end; i++) {
            _result += i;
        }
        return _result;
    }
}
```

### main() メソッド 
* 特徴
    * main() メソッドを記述できるクラスはファイル名と同じクラスに１つのみ
    * main() が自動的に最初に実行される
    * public static void main(String[] args) と決め打ちする

* 例文
    ```
    //Main.java
    public class Main { //publicは省略可
        public static void main(String[] args) { //決め打ち（自動的に実行）
            myMethod(); //=> "Main.myMethod()"
        }
        static void myMethod() { //staticなメソッドならmain()から呼び出せる
            System.out.println("Main.myMethod()");
        }
    }
    ```

###  コンストラクタ
* 書式
    ```
    class クラス名 {
        [public] クラス名([型① 引数①, 型② 引数②, ...]) { //コンストラクタは省略可
            :
        }
        :
    ```
    * アクセス修飾子を省略した場合、同じパッケージ内でのみアクセス可能

* 例文
    ```
    //Main.java
    public class Main { //publicは省略可
        public static void main(String[] args) { //決め打ち（自動的に実行）
            Point _point = new Point(100,150); //ここでコンストラクタを呼び出す
            System.out.println(_point.getX()); //100
            System.out.println(_point.getY()); //150
        }
    }
    class Point {
        private int _x, _y; //メンバ変数の「宣言」
        public Point(int _x, int _y) { //コンストラクタ
            //メンバ変数の「初期化」など…
            this._x = _x;
            this._y = _y;
        }
        public int getX() { return _x; } //今回はgetterのみ
        public int getY() { return _y; } //今回はgetterのみ
    }
    ```

### 静的メソッド（＝クラスメソッド、static メソッド）
```
//Main.java
public class Main { //publicは省略可
    public static void main(String[] args) { //決め打ち（自動的に実行）
        System.out.println(MyMath.pow(2,0)); //1（2の0乗）
        System.out.println(MyMath.pow(2,1)); //2（2の1乗）
        System.out.println(MyMath.pow(2,8)); //256（2の8乗）
    }
}
class MyMath { //カスタムクラス
    public static long pow(int arg1, int arg2) {
        if (arg2 == 0) { return 1; } //0乗対策
        long _result = arg1;
        for (int i=1; i<arg2; i++) { _result = _result * arg1; }
        return _result;
    }
}
```

### 可変長引数
```
//Main.java
public class Main { //publicは省略可
    public static void main(String[] args) { //決め打ち（自動的に実行）
        MyClass _myClass = new MyClass();
        _myClass.sum(1,1); //=>2（1+1）
        _myClass.sum(1,2,3,4,5); //=>15（1+2+3+4+5）
    }
}
class MyClass {
    public void sum(int... args) { //最後の引数にのみ有効、引数は「配列」扱い
        int _result = 0; //ローカル変数
        for (int tmp : args) { //拡張for文（for-each文）
            _result += tmp;
        }
        System.out.println(_result);
    }
}
```

実行環境：Ubuntu 16.04.2 LTS、C# 4.2.1  
作成者：Takashi Nishimura  
作成日：2016年07月15日  
更新日：2017年04月12日


<a name="匿名関数（ラムダ式）"></a>
# <b>匿名関数（ラムダ式）</b>
* ラムダ式は Java SE 8（1.8.0）から導入

```
//Main.java
public class Main { //publicは省略可
    public static void main(String[] args) { //決め打ち（自動的に実行）

        //無名関数①（オリジナル）
        IHello hello_ = (String _name) -> { //データ型は省略可能
            return _name + "," + "Hello";
        }; //「;」が必須

        //無名関数②（入替用）
        IHello japaneseHello_ = (String _name) -> { //データ型は省略可能
            return _name + "," + "こんにちは";
        }; //「;」が必須

        //無名関数③（入替用）
        IHello chineseHello_ = (String _name) -> { //データ型は省略可能
            return _name + "," + "你好";
        }; //「;」が必須

        //無名関数①の実行
        System.out.println(hello_.exec("TAKASHI")); //=> "TAKASHI,Hello"

        //無名関数②に入替えてから実行
        hello_ = japaneseHello_;
        System.out.println(hello_.exec("隆")); //=> "隆,こんにちは"

        //無名関数③に入替えてから実行
        hello_ = chineseHello_;
        System.out.println(hello_.exec("隆")); //=> "隆,你好"
        
    }
}

//無名関数用インターフェース
interface IHello {
    public String exec(String _name); //抽象メソッド（１つだけ）
}
```

実行環境：Ubuntu 16.04.2 LTS、C# 4.2.1  
作成者：Takashi Nishimura  
作成日：2016年07月15日  
更新日：2017年04月12日


<a name="静的メンバ（static）"></a>
# <b>静的メンバ（static）</b>
* 静的メンバはクラスをインスタンス化せずにアクセスが可能

### 基本構文
```
class MyMath {
    public static final データ型 変数名 = 値; //静的定数（＝クラス定数）

    public static データ型 変数名 = 値; //静的変数（＝クラス変数、static変数）

    //静的メソッド（＝クラスメソッド、staticメソッド）
    public static 戻り値の型 メソッド名([データ型① 引数①, ...]) {
            処理 [return 戻り値;]
    }
    :
```

### 例文
```
//Main.java
public class Main { //publicは省略可
    public static void main(String[] args) { //決め打ち（自動的に実行）

        //静的定数（＝クラス定数）
        System.out.println(MyMath.PI); //=> 3.14159

        //静的変数（＝クラス変数、static変数）
        System.out.println(MyMath.lastUpdate); //=> "2016-07-15"
        MyMath.lastUpdate = "2017-04-12"; //変更可能
        System.out.println(MyMath.lastUpdate); //=> "2017-04-12"

        //静的メソッドの実行
        System.out.println(MyMath.pow(2,0)); //1（2の0乗）
        System.out.println(MyMath.pow(2,1)); //2（2の1乗）
        System.out.println(MyMath.pow(2,8)); //256（2の8乗）

    }
}

class MyMath {
    //静的定数（＝クラス定数）
    public static final float PI = 3.14159F;

    //静的変数（＝クラス変数、static変数）
    public static String lastUpdate = "2016-07-15";

    //静的メソッド（＝クラスメソッド、staticメソッド）
    public static long pow(int arg1, int arg2) {
        if (arg2 == 0) { return 1; } //0乗対策
        long _result = arg1;
        for (int i=1; i<arg2; i++) { _result = _result * arg1; }
        return _result;
    }
}
```

実行環境：Ubuntu 16.04.2 LTS、C# 4.2.1  
作成者：Takashi Nishimura  
作成日：2016年07月15日  
更新日：2017年04月12日


<a name="if文"></a>
# <b>if 文</b>

### 基本例文
* true と評価される可能性が高い順に並べると if 文を早く抜け出せる可能性が高い
```
//Main.java
public class Main { //publicは省略可
    public static void main(String[] args) { //決め打ち（自動的に実行）
        int _age = 49;
        if (_age <= 20) { // () は省略不可
            System.out.println("20歳以下");
        } else if (_age <= 40) {
            System.out.println("21〜40歳");
        } else if (_age <= 60) {
            System.out.println("41〜60歳"); //これが出力される
        } else {
            System.out.println("61歳以上");
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

1. if のネストを使う方法
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

1. if のネストを使う方法
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
    //Main.java
    public class Main { //publicは省略可
        public static void main(String[] args) { //決め打ち（自動的に実行）
            boolean _a = true, _b = false;
            if (_a ^ _b) {
                System.out.println("どちらか一方だけtrueです");
            } else {
                System.out.println("両方共にtrueかfalseです");
            }
        }
    }
    ```

1. ^ 演算子を使わない場合
    ```
    //Main.java
    public class Main { //publicは省略可
        public static void main(String[] args) { //決め打ち（自動的に実行）
            boolean _a = true, _b = false;
            if ((_a || _b) && !(_a && _b)) {
                System.out.println("どちらか一方だけtrueです");
            } else {
                System.out.println("両方共にtrueかfalseです");
            }
        }
    }
    ```

実行環境：Ubuntu 16.04.2 LTS、C# 4.2.1  
作成者：Takashi Nishimura  
作成日：2016年07月15日  
更新日：2017年04月12日


<a name="三項演算子"></a>
# <b>三項演算子</b>

### 比較式が１つの場合
* 構文
```
データ型 変数名 = (比較式) ? (true時の返り値) : (false時の返り値);
```

* 例文
```
//Main.java
public class Main { //publicは省略可
    public static void main(String[] args) { //決め打ち（自動的に実行）
        int _age = 48;
        String _result = (_age < 60) ? "現役" : "退職";
        System.out.println(_result); //"現役"
    }
}
```

### 比較式が複数の場合
* 構文
```
データ型 変数名 = 
(比較式①) ? (①がtrueの場合の返り値) : //①がfalseの場合↓
(比較式②) ? (②がtrueの場合の返り値) : //②がfalseの場合↓
(①②の全てがfalseの場合の返り値);
```

* 例文
```
//Main.java
public class Main { //publicは省略可
    public static void main(String[] args) { //決め打ち（自動的に実行）
        int _age = 49;
        String _result = 
        (_age < 20) ? "未成年":
        (_age < 60) ? "現役":
        "退職";
        System.out.println(_result); //"現役"
    }
}
```

実行環境：Ubuntu 16.04.2 LTS、C# 4.2.1  
作成者：Takashi Nishimura  
作成日：2016年07月15日  
更新日：2017年04月12日


<a name="switch文"></a>
# <b>switch 文</b>

### 例文（全てに break 文あり）
```
//Main.java
public class Main { //publicは省略可
    public static void main(String[] args) { //決め打ち（自動的に実行）
        String _name = "TARO";
        switch (_name) { //判別式には整数,列挙、文字,文字列型のみ可、booleanは不可!
            case "TARO" :
                System.out.println("父"); //=> "父" ←これが出力される
                break;
            case "HANAKO" : 
                System.out.println("母");
                break;
            case "ICHIRO" :
                System.out.println("長男");
                break;
            case "JIRO" :
                System.out.println("次男");
                break;
            default:
                System.out.println("家族以外");
                break; //省略可
        }
    }
}
```

### 例文（一部に break 文なし）
```
//Main.java
public class Main { //publicは省略可
    public static void main(String[] args) { //決め打ち（自動的に実行）
        String _name = "ICHIRO";
        switch (_name) { //↓C#のようなフォールスルーの禁止規則はない
            case "TARO" : //breakが無いと次のcaseも処理
            case "HANAKO" : 
                System.out.println("親");
                break;
            case "ICHIRO" : //breakが無いと次のcaseも処理
            case "JIRO" :
                System.out.println("子"); //これが出力される
                break;
            default:
                System.out.println("家族以外");
                break; //省略可
        }
    }
}
```

実行環境：Ubuntu 16.04.2 LTS、C# 4.2.1  
作成者：Takashi Nishimura  
作成日：2016年07月15日  
更新日：2017年04月12日


<a name="for文"></a>
# <b>for 文</b>

### 基本構文
```
for (①初期化; ②ループ判定式; ③更新処理) {
    繰り返す処理
}
```

### ループカウンタ（ループ制御変数）の宣言位置
1. for 文の中でループ制御変数を宣言
    ```
    //Main.java
    public class Main { //publicは省略可
        public static void main(String[] args) { //決め打ち（自動的に実行）
            for (int i=0; i<10; i++) { //ここでループ制御変数を宣言すると…
                System.out.println(i); //0,1,2,3,4,5,6,7,8,9
            }
            //System.out.println(i); //エラー（for文の外では利用不可）
        }
    }
    ```

1. for 文の外でループ制御変数を宣言
    ```
    //Main.java
    public class Main { //publicは省略可
        public static void main(String[] args) { //決め打ち（自動的に実行）
            int _i; //ここでint型を宣言すると…
            for (_i=0; _i<10; _i++) {
                System.out.println(_i); //0,1,2,3,4,5,6,7,8,9
            }
            System.out.println(_i); //10（for文の外でも有効）
        }
    }
    ```

### ループカウンタを○つずつアップする
```
//Main.java
public class Main { //publicは省略可
    public static void main(String[] args) { //決め打ち（自動的に実行）
        for (int i=0; i<50; i+=5) { //5つずつアップする場合
            System.out.println(i); //0,5,10,15,20,25,30,35,40,45
        }
    }
}
```

### for文のネスト
```
//Main.java
public class Main { //publicは省略可
    public static void main(String[] args) { //決め打ち（自動的に実行）
        for (int i=1; i<=5; i++) {
            for (int j=1; j<=5; j++) {
                System.out.println("x" + i + "y" + j); //x1y1,x1y2,....,x5y4,x5y5
            }
        }
    }
}
```

### 無限ループと break 文
```
//Main.java
public class Main { //publicは省略可
    public static void main(String[] args) { //決め打ち（自動的に実行）
        int _count = 0;
        for (;;) { //①初期化②ループ判定式③更新処理...の全てを省略すると無限ループ
            _count++;
            if (_count > 100) break; //ループを終了
            System.out.println(_count); //1,2,...,99,100
        }
        System.out.println("for文終了");
    }
}
```

### for 文と continue 文
```
//Main.java
public class Main { //publicは省略可
    public static void main(String[] args) { //決め打ち（自動的に実行）
        for (int i=1; i<=20; i++) { //iは1,2,...19,20
            if ((i % 3) != 0) { //3で割って余りが0ではない（＝3の倍数ではない）場合
                continue; //for文の残処理をスキップしてfor文の次の反復を開始する
            }
            System.out.println(i); //3,6,9,12,15,18 ←3の倍数
        }
    }
}
```

実行環境：Ubuntu 16.04.2 LTS、C# 4.2.1  
作成者：Takashi Nishimura  
作成日：2016年07月15日  
更新日：2017年04月12日


<a name="for-each文"></a>
# <b>for-each 文</b>

### 基本構文
```
for (データ型 変数名 : 配列等) {
    System.out.println(変数名);
}
```

### 配列（1次元）の場合
```
//Main.java
public class Main { //publicは省略可
    public static void main(String[] args) { //決め打ち（自動的に実行）
        String[] _array = {"A","B","C","D"}; 
        for (String value : _array) {
            System.out.println(value); //"A"→"B"→"C"→"D"
        }
    }
}
```

### 配列の配列（≒2次元配列、ジャグ配列）の場合
```
//Main.java
public class Main { //publicは省略可
    public static void main(String[] args) { //決め打ち（自動的に実行）
        String[][] _array = {
            {"x0y0","x1y0","x2y0"}, //0行目
            {"x0y1","x1y1","x2y1"}  //1行目
        };
        for (String[] the_array : _array) {
            for (String value : the_array) {
                System.out.println(value); 
                //=> "x0y0"→"x1y0"→"x2y0"→"x0y1"→"x1y1"→"x2y1"
            }
        }
    }
}
```

### リスト（LinkedList）の場合
```
//Main.java
import java.util.*; //LinkedListに必要
public class Main { //publicは省略可
    public static void main(String[] args) { //決め打ち（自動的に実行）
        LinkedList<String> _list = new LinkedList<String>();
        _list.add("TOHRU");
        _list.add("SACHIKO");
        for (String _value : _list) {
            System.out.println(_value); //=> "TOHRU" => "SACHIKO"
        }
    }
}
```

### セット（TreeSet）の場合
```
//Main.java
import java.util.*; //TreeSetに必要
public class Main { //publicは省略可
    public static void main(String[] args) { //決め打ち（自動的に実行）
        SortedSet<String> _set = new TreeSet<String>();
        _set.add("TARO");
        _set.add("HANAKO");
        for (String _value : _set) {
            System.out.println(_value); //"HANAKO"→"TARO"
        }
    }
}
```

### マップ（HashMap）の場合
```
//Main.java
import java.util.*; //HashMapに必要
public class Main { //publicは省略可
    public static void main(String[] args) { //決め打ち（自動的に実行）
        Map<String,String> _map = new HashMap<String,String>();
        _map.put("A","あ");
        _map.put("I", "い");
        for (Map.Entry<String, String> _tmp : _map.entrySet()) {
            System.out.println(_tmp.getKey() + " : " + _tmp.getValue()); 
            //=> I : い
            //=> A : あ
        }
    }
}
```

実行環境：Ubuntu 16.04.2 LTS、C# 4.2.1  
作成者：Takashi Nishimura  
作成日：2016年07月15日  
更新日：2017年04月12日


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
//Main.java
public class Main { //publicは省略可
    public static void main(String[] args) { //決め打ち（自動的に実行）
        int _i = 0;
        while (_i < 10) { //ループ判定式にはboolean型しか使えません
            System.out.println(_i); //0,1,2,3,4,5,6,7,8,9
            _i++;
        }
        System.out.println(_i); //10（変数はまだ有効）
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
//Main.java
public class Main { //publicは省略可
    public static void main(String[] args) { //決め打ち（自動的に実行）
        int _i = 0;
        do {
            System.out.println(_i); //=> 0 ←ループ判定式はfalseだが１回実行される
            _i++;
        } while(_i < 0);
    }
}
```

### while 文と break 文
```
//Main.java
public class Main { //publicは省略可
    public static void main(String[] args) { //決め打ち（自動的に実行）
        int _count = 0;
        while (true) { //ループ判別式をtrueにすると無限ループ
            _count++;
            if (_count > 100) {
                break; //break文を使ってループを終了
            }
             System.out.println(_count); //=> 1,2,....,99,100（1〜100までを出力）
        }
        System.out.println("while文終了");
    }
}
```
* break 文は for 文や while ループから抜け出て処理を中断するための制御文

### while 文と continue 文
```
//Main.java
public class Main { //publicは省略可
    public static void main(String[] args) { //決め打ち（自動的に実行）
        int _i = 1;
        while (_i <= 20) {
            if ((_i % 3) != 0) { //3で割って余りが0ではない（＝3の倍数ではない）場合
                _i++;
                continue; //while文の残処理をスキップしてwhile文の次の反復を開始する
            }
            System.out.println(_i); //=> 3,6,9,12,15,18（3の倍数）
            _i++;
        }
    }
}
```
* continue 文はその時点のループ内の処理のみ中断し、ループから脱出せずにループを継続する

実行環境：Ubuntu 16.04.2 LTS、C# 4.2.1  
作成者：Takashi Nishimura  
作成日：2016年07月15日  
更新日：2017年04月12日


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

実行環境：Ubuntu 16.04.2 LTS、C# 4.2.1  
作成者：Takashi Nishimura  
作成日：2016年07月20日  
更新日：2017年04月12日