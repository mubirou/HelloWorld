<a name="TOP"></a>

# <b>C# with Godot 基礎文法</b>

# この項目は書きかけです

[[Godot Study Notes](https://github.com/mubirou/Godot#godot-study-notes)]

### <b>INDEX</b>

* Hello,world! （[Windows](https://github.com/mubirou/HelloWorld/blob/master/languages/C%23Godot/C%23Godot_win.md#c-with-godot-windows-)）
* [コメントアウト](#コメントアウト)
* [データ型](#データ型)
* [データ型の操作](#データ型の操作)
* [クラス](#クラス)
* [基本クラスと派生クラス](#基本クラスと派生クラス)
* [名前空間](#名前空間)
* [継承と委譲](#継承と委譲)
* [変数とスコープ](#変数とスコープ)（この項目は書きかけです）
* <!--[アクセサ（getter / setter）](#アクセサ)-->
* <!--[演算子](#演算子)-->
* <!--[定数](#定数)-->
* <!--[関数](#関数)-->
* <!--[静的変数・静的関数](#静的変数・静的関数)-->
* <!--[if 文](#if文)-->
* <!--[三項演算子](#三項演算子)-->
* <!--[match 文](#match文) ≒ switch 文-->
* <!--[for 文](#for文)-->
* <!--[while 文](#while文)-->
* <!--[配列](#配列)-->
* <!--[連想配列（辞書）](#連想配列（辞書）)-->
* <!--[self](#self) ≒ this-->
* <!--[文字列の操作](#文字列の操作)-->
* <!--[正規表現](#正規表現)-->
* <!--[抽象クラス](#抽象クラス)-->
* <!--[.](#.) ≒ super-->
* <!--[オーバーライド](#オーバーライド)-->
* <!--[カスタムイベント](#カスタムイベント)-->
* <!--[数学関数](#数学関数)-->
* <!--[乱数](#乱数)-->
* <!--[日時情報](#日時情報)-->
* <!--[タイマー](#タイマー)-->
* <!--[処理速度計測](#処理速度計測)-->
* <!--[外部テキストの読み込み](#外部テキストの読み込み)-->
***

<a name="コメントアウト"></a>
# <b>コメントアウト</b>

### 1行コメントアウト

```CSharp
// 〇〇〇〇〇
```

```CSharp
/* 〇〇〇〇〇 */
```

### 複数行コメントアウト

```CSharp
/*
〇〇〇〇〇
〇〇〇〇〇
*/
```

```CSharp
/* コメントアウト開始
〇〇〇〇〇
〇〇〇〇〇
コメントアウト終了 */
```

参考：[GODOT DOCS](https://docs.godotengine.org/ja/stable/tutorials/shaders/shaders_style_guide.html?highlight=%E3%82%B3%E3%83%A1%E3%83%B3%E3%83%88%E3%82%A2%E3%82%A6%E3%83%88%20C%23#comment-spacing)  
実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年02月12日  
[[TOP](#TOP)]


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
    * float 型 : 小数点第6位までの値（第7位を四捨五入）←最後に f を付ける
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
    * dynamic 型 : 動的型（型が未確定）←TypeScript の any 相当（要調査）
    * データ型[] : 任意のデータ型の配列

### 検証
予め Main.tscn と以下の Main.cs ファイルを紐付けしておきます（[参考](https://github.com/mubirou/HelloWorld/blob/master/languages/C%23Godot/C%23Godot_win.md#helloworld)）
```CSharp
// Main.cs
using Godot;

public class Main : Spatial { // 2Dの場合はGodot.Node2Dを継承
    public override void _Ready() {
        // bool型
        bool _bool = true;
        GD.Print(_bool); //-> True
        GD.Print(_bool.GetType()); //-> System.Boolean
        
        // 整数型➀（0〜255）
        byte _byte = 255;
        GD.Print(_byte); //-> 255
        GD.Print(_byte.GetType()); //-> System.Byte
        
        // 整数型➁（-128〜127）
        sbyte _sbyte = -128;
        GD.Print(_sbyte); // -128
        GD.Print(_sbyte.GetType()); //-> System.SByte
        
        // 整数型➂（-32768〜32767）
        short _short = -32768;
        GD.Print(_short); //-> -32768
        GD.Print(_short.GetType()); //-> System.Int16
        
        // 整数型➃（0〜65535）
        ushort _ushort = 65535;
        GD.Print(_ushort); //-> 65535
        GD.Print(_ushort.GetType()); //-> System.UInt16
        
        // 整数型➄（-2147483648〜2147483647）
        int _int = -2147483648;
        GD.Print(_int); //-> -2147483648
        GD.Print(_int.GetType()); //-> System.Int32

        int _int16 = 0xFFCC00; // 16進数の場合
        GD.Print(_int16); //-> 16763904
        GD.Print(_int16.GetType()); //-> System.Int32
        
        // 整数型➅（0〜4294967295）
        uint _uint = 4294967295;
        GD.Print(_uint); //-> 4294967295
        GD.Print(_uint.GetType()); //-> System.UInt32
        
        // 整数型➆（-9223372036854775808〜9223372036854775807）
        long _long = -9223372036854775808;
        GD.Print(_long); //-> -9223372036854775808
        GD.Print(_long.GetType()); //-> System.Int64
        
        // 整数型➇（0〜18446744073709551615）
        ulong _ulong = 18446744073709551615;
        GD.Print(_ulong); //-> 18446744073709551615
        GD.Print(_ulong.GetType()); //-> System.UInt64
        
        // 浮動小数点数型➀
        float _float = 3.1415926f; // 最後に「f」
        GD.Print(_float); //-> 3.141593
        GD.Print(_float.GetType()); //-> System.Single
        
        // 浮動小数点数型➁
        double _double = 3.141592653589793d; // 「d」をつけなくても同じ
        GD.Print(_double); //-> 3.14159265358979
        GD.Print(_double.GetType()); //-> System.Double
        
        // 浮動小数点数型➂
        decimal _decimal = 3.14159265358979323846264338327m; // 最後に「m」
        GD.Print(_decimal); //-> 3.1415926535897932384626433833
        GD.Print(_decimal.GetType()); //-> System.Decimal
        
        // 文字型➀（char型＝1文字）
        char _char = 'a'; // シングルクォーテーション
        GD.Print(_char); //-> a
        GD.Print(_char.GetType()); //-> System.Char
        
        // 文字型➁（string型）
        string _string = "999"; // ダブルクォーテーション
        GD.Print(_string); //-> 999
        GD.Print(_string.GetType()); //-> System.string

        // null許容型
        int? _null = null; // string型は不可
        GD.Print(_null); //-> null
        GD.Print(_null == null); //-> True

        // 列挙型（enum）
        GD.Print(Signal.BLUE); //-> BLUE
        GD.Print(Signal.BLUE.GetType()); //-> Signal
        GD.Print((int)Signal.BLUE); //-> 0（キャストによる型変換が必要）

        // 構造体（クラスに似ているが継承は不可）
        MyStruct _struct = new MyStruct("mubirou", 54);
        GD.Print(_struct); //-> MyStruct
        GD.Print(_struct.GetType()); //-> MyStruct
        
        // 匿名型クラス（宣言には、必ずvarキーワードを使います）
        var _anon = new { Name = "mubirou", Age = 54 }; // 読み取り専用（注意）
        GD.Print(_anon); //-> { Name = mubirou, Age = 49 }
        GD.Print(_anon.Name); //-> mubirou（取得方法）
        GD.Print(_anon.GetType());//-> <>f__AnonymousType0`2[...

        // クラス
        MyClass _myClass = new MyClass("mubirou", 54);
        GD.Print(_myClass); //-> MyClass
        GD.Print(_myClass.GetType()); //-> MyClass

        // 配列
        int[] _array = new int[4]; // 4個の空の要素を持つ配列の場合
        GD.Print(_array); //-> System.Int32[]
    }
}

enum Signal { BLUE,YELLOW,RED }; // 列挙（enum）の定義

struct MyStruct { // 構造体の定義
    public string name;
    public byte age;
    public MyStruct(string p1, byte p2) {
        name = p1;
        age = p2;
    }
}

class MyClass { // クラスの定義
    public string name;
    public byte age;
    public MyClass(string p1, byte p2) {
        name = p1;
        age = p2;
    }
}
```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年02月12日  
[[TOP](#TOP)]


<a name="データ型の操作"></a>
# <b>データ型の操作</b>

### データ型の調べ方
1. is 演算子
    * クラスか否かを調べる（○ is int といった使い方も可能）
    ```CSharp
    // Main.cs
    using Godot;

    public class Main : Spatial {
        public override void _Ready() {
            //クラスの場合
            var _tmp = new SubClass();
            GD.Print(_tmp is SubClass); //-> True
            GD.Print(_tmp is SuperClass); //-> True

            //匿名型クラスの場合
            var _tmp2 = new {};
            GD.Print(_tmp2 is object); //-> True
        }
    }

    class SuperClass {} // 基本クラスの定義
    class SubClass : SuperClass {} // 派生クラスの定義
    ```

1. as 演算子
    * キャスト成功時に変換後の値が返され、失敗するとエラー
    ```CSharp
    // Main.cs
    using Godot;

    public class Main : Spatial {
        public override void _Ready() {
            var _myClass = new MyClass();
            GD.Print(_myClass as MyClass); //=> MyClass
            //GD.Print(_myClass as HogeClass); //=> CS0039 error
        }
    }

    class MyClass {}
    class HogeClass {}
    ```

1. GetType() メソッド
    * Object.GetType() メソッド（オブジェクトの型を返す）
    ```CSharp
    // Main.cs
    using Godot;

    public class Main : Spatial {
        public override void _Ready() {
            GD.Print(true.GetType()); //-> System.Boolean
            GD.Print((100).GetType()); //-> System.Int32
            GD.Print((10000000000).GetType()); //-> System.UInt64
            GD.Print((0.1).GetType()); //-> System.Double
            GD.Print('1'.GetType()); //-> System.Char
            GD.Print("1".GetType()); //-> System.String
            GD.Print(new {}.GetType()); //-> <>f__AnonymousType0
            GD.Print(new MyClass().GetType()); //-> MyClass
        }
    }

    class MyClass {}
    ```

### データ型のキャスト
1. 数値⇔bool 型（不可）
    ```CSharp
    // Main.cs
    using Godot;

    public class Main : Spatial {
        public override void _Ready() {
            //bool _tmp = (bool)1; // CS0030 error（数値→bool型への変換は不可）
            //int _tmp = (int)true; // CS0030 error（bool型→数値への変換は不可）
        }
    }
    ```

1. 数値→bool 型へ変換（力技）
    ```CSharp
    // Main.cs
    using Godot;

    public class Main : Spatial {
        public override void _Ready() {
            int _tmp = 0;
            bool _tmp2 = _tmp != 0; //0→Falseに変換（0以外はTrueに変換）
            GD.Print(_tmp2); //-> False
        }
    }
    ```

1. bool型→数値へ変換
    ```CSharp
    // Main.cs
    using Godot;
    using System; // Convertに必要

    public class Main : Spatial {
        public override void _Ready() {
            bool _tmp = true;
            int _tmp2 = Convert.ToInt32(_tmp); //true→1に変換（falseは0に変換）
            GD.Print(_tmp2); //-> 1
        }
    }
    ```

1. 数値⇔数値（縮小変換）
    ```CSharp
    // Main.cs
    using Godot;

    public class Main : Spatial {
        public override void _Ready() {
            //整数の場合
            long _tmp1 = 2147483648; //intは-2147483648〜2147483647
            int _tmp2 = (int)_tmp1; //long型→int型へ変換
            GD.Print(_tmp2); //-> -2147483648（元のデータが失われる）

            //浮動小数点数の場合
            decimal _decimal = 3.14159265358979323846264338327m;
            double _tmp3 = (double)_decimal;
            GD.Print(_tmp3); //-> 3.14159265358979（データの一部が失われる）
        }
    }
    ```

1. 数値⇔数値（拡張変換）
    ```CSharp
    // Main.cs
    using Godot;

    public class Main : Spatial {
        public override void _Ready() {
            int _tmp = 2147483647; //intは-2147483648〜2147483647
            long _tmp2 = (long)_tmp + 1; //int型→long型へ変換
            GD.Print(_tmp2); //=> 2147483648
        }
    }
    ```

1. 数値⇔ string 型
    ```CSharp
    // Main.cs
    using Godot;
    using System; //Int32.Parse()に必要

    public class Main : Spatial {
        public override void _Ready() {
            string _tmp = "001";
            int _tmp2 = Int32.Parse(_tmp); // 001（string型）→1（int型）に変換
            GD.Print(_tmp2); //-> 1
            GD.Print(_tmp2.GetType()); //-> System.Int32
        }
    }
    ```

1. 数値→ string 型
    ```CSharp
    // Main.cs
    using Godot;

    public class Main : Spatial {
        public override void _Ready() {
            int _tmp = 100;
            string _tmp2 = _tmp.ToString(); // 100（int型）→"100"（string）に変換
            GD.Print(_tmp2); //-> 100
            GD.Print(_tmp2.GetType()); //-> System.String
        }
    }
    ```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年02月13日  
[[TOP](#TOP)]


<a name="クラス"></a>
# <b>クラス</b>

```CSharp
// Main.cs
using Godot;

public class Main : Spatial { // 2Dの場合はGodot.Node2Dを継承
    public override void _Ready() {
        // ➀インタンスの生成
        Rectangle _rectangle = new Rectangle();
        
        // ➁プロパティの更新
        _rectangle.width = 1920;
        _rectangle.height = 1080;
        // ➂プロパティの取得
        GD.Print(_rectangle.width); //-> 1920
        GD.Print(_rectangle.height); //-> 1080
        
        // ➃メソッドの実行
        GD.Print(_rectangle.getArea()); //-> 2073600
    }
}

class Rectangle { // 長方形クラス
    // プロパティの定義･初期値の設定
    private int _width = 0; // privateは省略可
    private int _height = 0; // privateは省略可

    // コンストラクタは省略可（初期値はここで設定してもよい）
    public Rectangle() {}
    
    // メソッド群の定義
    public int width {
        get { return this._width; } // thisは省略可
        set { this._width = value; } // valueは決め打ち
    }
    public int height {
        get { return this._height; } // thisは省略可
        set { this._height = value; } // valueは決め打ち
    }
    public int getArea() { // 面積を計算して値を返す
        return this._width * this._height; // thisは省略可
    }
}
```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年02月13日  
[[TOP](#TOP)]


<a name="基本クラスと派生クラス"></a>
# <b>基本クラスと派生クラス</b>

```CSharp
// Main.cs
using Godot;

public class Main : Spatial { // 2Dの場合はGodot.Node2Dを継承
    public override void _Ready() {
        //派生クラスＡのインスタンス
        SubClassA _subclassA = new SubClassA();
        GD.Print(_subclassA.pSuperClass); //-> 基本クラスのプロパティ
        GD.Print(_subclassA.pSubClassA); //-> 派生クラスＡのプロパティ
        GD.Print(_subclassA.mSuperClass()); //-> 基本クラスのメソッド
        GD.Print(_subclassA.mSubClassA()); //-> 派生クラスＡのメソッド
        
        //派生クラスＢのインスタンス
        SubClassB _subclassB = new SubClassB();
        GD.Print(_subclassB.pSuperClass); //-> 基本クラスのプロパティ
        GD.Print(_subclassB.pSubClassB); //-> 派生クラスＢのプロパティ
        GD.Print(_subclassB.mSuperClass()); //-> 基本クラスのメソッド
        GD.Print(_subclassB.mSubClassB()); //-> 派生クラスＢのメソッド
    }
}

// 基本クラス（スーパークラス）
class SuperClass {
    // ➀プロパティの定義
    string _pSuperClass = "基本クラスのプロパティ"; // privateは省略
    // ➁メソッド群の定義
    public string pSuperClass {
        get { return _pSuperClass; } // thisは省略
    }
    public string mSuperClass() {
        return "基本クラスのメソッド";
    }
}

// 派生クラスＡ
class SubClassA : SuperClass { // 基本クラスを継承（多重継承は不可）
    // ➀プロパティの定義
    string _pSubClassA = "派生クラスＡのプロパティ"; // privateは省略
    // ➁メソッド群の定義
    public string pSubClassA {
        get { return _pSubClassA; } // thisは省略
    }
    public string mSubClassA() {
        return "派生クラスＡのメソッド";
    }
}

// 派生クラスＢ
class SubClassB : SuperClass { // 基本クラスを継承（多重継承は不可）
    // ➀プロパティの定義
    string _pSubClassB = "派生クラスＢのプロパティ"; // privateは省略
    // ➁メソッド群の定義
    public string pSubClassB {
        get { return _pSubClassB; } // thisは省略
    }
    public string mSubClassB() {
        return "派生クラスＢのメソッド";
    }
}
```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年02月13日  
[[TOP](#TOP)]


<a name="名前空間"></a>
# <b>名前空間</b>

### 概要
* フォルダによる階層構造でファイルを管理するかのようにクラスを管理（但し論理的）
* デフォルトでは無名の名前空間（global名前空間）が使用される
* 1つの名前空間の中に、クラス/構造体/デリゲート/列挙/インターフェース等を宣言できる他、別の名前空間を宣言することも可能

### 書式
```CSharp
namespace 名前空間名 {
    class XXX {
    }
    ......
}
```

### 例文
```CSharp
// Main.cs
using Godot;

public class Main : Spatial { // 2Dの場合はGodot.Node2Dを継承
    public override void _Ready() {
        MyLibrary.MyClass _myClass = new MyLibrary.MyClass();
        GD.Print(_myClass); //-> MyLibrary.MyClass
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

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年02月13日  
[[TOP](#TOP)]


<a name="継承と委譲"></a>
# <b>継承と委譲</b>

### 概要
* GoF デザインパターンの [Adapter パターン](http://bit.ly/2naab8x)等で利用される
* 継承の場合は <b>:クラス名</b> を使い、委譲の場合は <b>new クラス名()</b> を使ってオブジェクトを生成し、他のクラスの機能を利用する

### 継承版
```CSharp
// Main.cs
using Godot;

public class Main : Spatial { // 2Dの場合はGodot.Node2Dを継承
    public override void _Ready() {
        ClassB _classB = new ClassB();
        _classB.MyMethod(); //-> ClassA.MyMethod()
    }
}

class ClassA {
    public void MyMethod() {
        GD.Print("ClassA.MyMethod()");
    }
}

class ClassB : ClassA {} // ClassAを継承
```

### 委譲版
```CSharp
// Main.cs
using Godot;

public class Main : Spatial { // 2Dの場合はGodot.Node2Dを継承
    public override void _Ready() {
        ClassB _classB = new ClassB();
        _classB.MyMethod(); //-> ClassA.MyMethod()
    }
}

class ClassA {
    public void MyMethod() {
        GD.Print("ClassA.MyMethod()");
    }
}

class ClassB { // この内容だけが継承と異なる
    private ClassA _classA;
    public ClassB() {
        _classA = new ClassA(); // コンストラクタでオブジェクト生成
    }
    public void MyMethod() {
        _classA.MyMethod();
    }
}
```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年02月13日  
[[TOP](#TOP)]


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
```CSharp
class クラス名 { //クラス定義
public データ型 変数名; //public変数宣言（初期化も可）
    public クラス名() {} //コンストラクタ（省略可）
    ......
```

* 悪い例
```CSharp
// Main.cs
using UnityEngine;

public class Main : MonoBehaviour {
    void Start() {
        MyClass _myClass = new MyClass();
        Debug.Log(_myClass._p); //アクセス可（他人の変数を勝手にいじる行為）
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
```CSharp
class 基本クラス { //スーパークラス定義
    protected データ型 変数名; //protected変数宣言（初期化も可）
    public クラス名() {} //コンストラクタ（省略可）
    ......
```

* 例文
```CSharp
// Main.cs
using UnityEngine;

public class Main : MonoBehaviour {
    void Start() {
        SubClass _subClass = new SubClass();
        Debug.Log(_subClass); //SubClass
        //Debug.Log(_subClass._pSuperClass); //error CS0122（アクセス不可）
     }
}

class SuperClass { //基本クラス
    protected string _pSuperClass = "SuperClass変数"; //protected変数宣言
}

class SubClass : SuperClass { //派生クラス
    public SubClass() {
        Debug.Log(_pSuperClass); //"SuperClass変数"（アクセス可能）
    }
}
```

### private 変数
* 特徴
    * 同じクラス内のみアクセス可能（省略すると private 扱い）
    * クラス定義の直後、コンストラクタの直前に定義
    * 「他人の変数を勝手にいじってはいけない」というルールに則り、インスタンス変数は通常、private 変数とし、外部からは「get / set アクセサ」を使ってアクセスする

* 書式
```CSharp
class クラス名 { //クラス定義
private データ型 変数名; //private変数宣言（初期化も可）←privateは省略可
    public クラス名() {} //コンストラクタ（省略可）
    ......
```

* 例文
```CSharp
// Main.cs
using UnityEngine;

public class Main : MonoBehaviour {
    void Start() {
        MyClass _myClass = new MyClass();
        Debug.Log(_myClass.P); //アクセス可（≠他人の変数を勝手にいじる行為）
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
    ```CSharp
    // Main.cs
    using UnityEngine;

    public class Main : MonoBehaviour {
        void Start() {
            MyClass _myClass = new MyClass();
            _myClass.MyMethod();
        }
    }

    class MyClass {
        private string _string = "private変数";
        public MyClass() { //コンストラクタ
            Debug.Log(_string); //private変数（ここはthisは無くても良い）
        }
        public void MyMethod() {
            string _string = "ローカル変数"; //ローカル変数宣言
            Debug.Log(_string); //"ローカル変数"
            Debug.Log(this._string); //"private変数"（ここではthisが必須）
        }
    }
    ```

1. for 文内で宣言する場合（foreach 文も同様）
    ```CSharp
    // Main.cs
    using UnityEngine;

    public class Main : MonoBehaviour {
        void Start() {
            new MyClass();
        }
    }
    class MyClass {
        private int _i = 999; //private変数
        public MyClass() { //コンストラクタ
            for (int _i=0; _i<=5; _i++) { //ローカル変数宣言
                Debug.Log(_i); //0、1、2、...、5
                Debug.Log(this._i); //999（private変数）
            }
            Debug.Log(_i); //999（ロカール変数のアクセスは不可）
            Debug.Log(this._i); //999（thisが無くても同じ）
        }
    }
    ```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年02月XX日  
[[TOP](#TOP)]


<a name="アクセサ"></a>
# <b>アクセサ （getter / setter）</b>

### 読み書き可能なプロパティ
```CSharp
// Main.cs
using UnityEngine;

public class Main : MonoBehaviour {
    void Start() {
        Nishimura _nishimura = new Nishimura();
        Debug.Log(_nishimura.Age); //50
        _nishimura.Age = 51; //値を変更可能
        Debug.Log(_nishimura.Age); //51
    }
}

class Nishimura {
    int _age = 50; //privateは省略
    public int Age {
        get { return _age; } //thisは省略
        set { _age = value; } //thisは省略 ←valueは予め定義された変数（決め打ち）
    }
}
```

### 読み取り専用のプロパティ
```CSharp
// Main.cs
using UnityEngine;

public class Main : MonoBehaviour {
    void Start() {
        Nishimura _nishimura = new Nishimura();
        Debug.Log(_nishimura.Age); //50
        //_nishimura.Age = 50; //error CS0272（値の変更は不可）
        _nishimura.NextYear();
        Debug.Log(_nishimura.Age); //51
    }
}

class Nishimura {
    int _age = 50; //privateは省略
    public int Age {
        get { return _age; } //thisは省略
        private set {} //外部からアクセス不可（読み取り専用にする）
    }
    public void NextYear() { _age += 1; } //クラスの内部からに限り変更可能
}
```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年02月XX日  
[[TOP](#TOP)]


<a name="演算子"></a>
# <b>演算子</b>

```CSharp
// Main.cs
using UnityEngine;

public class Main : MonoBehaviour {
    void Start() {
        Debug.Log(3 + 2); //5 (可算) 
        Debug.Log(5 - 8); //-3 (減算)
        Debug.Log(3 * 4); //12 (乗算)
        Debug.Log(1 + 2 * 3 - 4 / 2); //5 (複雑な計算)
        Debug.Log(63 % 60); //3 (余剰)
        
        // 除算（注意が必要です）
        Debug.Log(8 / 3); //2(除算) ←整数同士の場合、余りは切り捨てられる
        Debug.Log(8 / 3.0); //2.66666666666667（小数点第14位までの値＝double型）

        float _float = (float)8.0 / 3;
        Debug.Log(_float); //2.666667（小数点第6位までの値）

        decimal _decimal = (decimal)8.0 / 3;
        Debug.Log(_decimal); //2.6666666666666666666666666667（第28位まで）

        // 後ろに付けるインクリメント（デクリメント）
        // _hoge++（_hoge--）が返す値は、加算（減算）する前の_hogeの値です
        int _hoge = 0;
        int _piyo = _hoge++; //デクリメントの場合_hoge--
        Debug.Log(_hoge); //1（デクリメントの場合-1）
        Debug.Log(_piyo); //0（デクリメントの場合0）

        // 前に付けるインクリメント（デクリメント）
        // ++_hoge（--_hoge）が返す値は、加算（減算）後の_hogeの値です
        _hoge = _piyo = 0;
        _piyo = ++_hoge; //デクリメントの場合--_hoge
        Debug.Log(_hoge); //1（デクリメントの場合-1）
        Debug.Log(_piyo); //1（デクリメントの場合-1） ←注目
    }
}
```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年02月XX日  
[[TOP](#TOP)]


<a name="定数"></a>
# <b>定数</b>

### 通常の定数
```CSharp
// Main.cs
using UnityEngine;

public class Main : MonoBehaviour {
    void Start() {
        const float PI = 3.14159f; //staticは記述しない（注意）
        Debug.Log(PI); //=> 3.14159
        //PI = 3.14; //error CS0131（変更不可）
    }
}
```

### 静的定数（メンバ定数）
* 構文
```CSharp
class クラス名 {
    public const float 定数名 = 値; //staticは記述しない
    ...
}
```

* アクセス方法
```CSharp
クラス名.定数名
```

* 例文
```CSharp
// Main.cs
using UnityEngine;

public class Main : MonoBehaviour {
    void Start() {
        Debug.Log(MyMath.PI); //=> 3.14159
        //MyMath.PI = 3.14; //error CS0131（変更不可）
    }
}

//カスタムクラス（MyMath）
class MyMath {
    public const float PI = 3.14159f; //staticは記述しない（注意）
    public MyMath() {} //コンストラクタ
}
```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年02月XX日  
[[TOP](#TOP)]


<a name="メソッド"></a>
# <b>メソッド</b>

### 基本構文
```CSharp
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
```CSharp
// Main.cs
using UnityEngine;

public class Main : MonoBehaviour {
    void Start() {
        MyClass _myClass = new MyClass();
        Debug.Log(_myClass.Tashizan(1,10)); //55
        Debug.Log(_myClass.Tashizan(1,100)); //5050
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

### Awake()、Start()メソッド
* 特徴
    * .NET Framework 版の Main() メソッドと同等
    * Awake() に続き Start() が自動的に実行される

* 例文
```CSharp
// Main.cs
using UnityEngine;

public class Main : MonoBehaviour {
    void Awake() {
        MyMethod("Awake");
    }
    void Start() { //通常こちらを使用
        MyMethod("Start");
    }
    void MyMethod(string arg) { //staticである必要はない
        Debug.Log(arg);
    }
}
```

### Update()、FixedUpdate()メソッド
* 特徴
    * <b>Update()</b> は再生中に画面がアップデートされる度に実行（毎フレーム呼び出される）
    * <b>FixedUpdate()</b> は一定時間毎に実行（[Edit]-[Project Settings]-[Time]-[Fixed timestep] で変更可能／初期値0.02秒）
    * 他にも LastUpdate()（様々な計算終了後、毎フレーム呼び出される／要調査）や OnCollisionEnter() 等もある  

* 例文
```CSharp
// Main.cs
using UnityEngine;

public class Main : MonoBehaviour {
    void Update() {
        Debug.Log("Update"); //毎フレーム呼び出される
    }
    void FixedUpdate() {
        Debug.Log("FiexedUpdate"); //0.02秒毎（初期値）に呼び出される
    }
}
```

### コンストラクタ
* 書式
```CSharp
class クラス名 {
    public クラス名([型① 引数①, 型② 引数②, ...]) { //コンストラクタは省略可
        ......
    }
    ......
```

* 例文
```CSharp
// Main.cs
using UnityEngine;

public class Main : MonoBehaviour {
    void Start() {
        Point _point = new Point(100,150); //ここでコンストラクタを呼び出す
        Debug.Log(_point.X); //100
        Debug.Log(_point.Y); //150
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
```CSharp
// Main.cs
using UnityEngine;

public class Main : MonoBehaviour {
    void Start() {
        Debug.Log(Math.Pow(2,0)); //1（2の0乗）
        Debug.Log(Math.Pow(2,1)); //2（2の1乗）
        Debug.Log(Math.Pow(2,8)); //256（2の8乗）
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
```CSharp
// Main.cs
using UnityEngine;

public class Main : MonoBehaviour {
    void Start() {
        MyClass _myClass = new MyClass();
        _myClass.AddPoint(); //1
        _myClass.AddPoint(10); //11
    }
}

class MyClass {
    private int _point = 0;
    public void AddPoint(int arg = 1) { //初期値を1とした場合
        _point += arg;
        Debug.Log(_point);
    }
}
```

### 可変長引数
* 引数を固定の数ではなく任意の数にすることが可能
```CSharp
// Main.cs
using UnityEngine;

public class Main : MonoBehaviour {
    void Start() {
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
        Debug.Log(_result);
    }
}
```

### 名前付き引数
* 引数名を指定してメソッドを呼び出す（任意の順序で引数を渡すことが可能）
```CSharp
// Main.cs
using UnityEngine;

public class Main : MonoBehaviour {
    void Start() {
        MyClass _myClass = new MyClass();
        _myClass.Rect(endX:100, endY:100); //面積:10000m2
        _myClass.Rect(10,10,100,100); //面積:8100m2
    }
}

class MyClass {
    public void Rect(int startX=0, int startY=0, int endX=0, int endY=0) {
        int _result = (endX - startX) * (endY - startY);
        Debug.Log("面積:" + _result + "m2");
    }
}
```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年02月XX日  
[[TOP](#TOP)]


<a name="匿名メソッド"></a>
# <b>匿名メソッド</b>

```CSharp
// Main.cs
using UnityEngine;

public class Main : MonoBehaviour {
    void Start() {
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
            Debug.Log(_tmp);
        };
    }

    public void change() {
        _right = ! _right;
        if (_right) {
            //...匿名メソッドの再定義（メソッドの内容を変更）
            Move = delegate(int arg) {
                string _tmp = "";
                for (int i=0; i<arg; i++) _tmp += "→";
                Debug.Log(_tmp);
            };
        } else {
            //匿名メソッドの再定義（メソッドの内容を変更）
            Move = delegate(int arg) {
                string _tmp = "";
                for (int i=0; i<arg; i++) _tmp += "←";
                Debug.Log(_tmp);
            };
        }
    }
}
```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年02月XX日  
[[TOP](#TOP)]


<a name="ラムダ式"></a>
# <b>ラムダ式</b>
* [匿名メソッド](#匿名メソッド)を「ラムダ式」に置き換えたバージョン

```CSharp
// Main.cs
using UnityEngine;

public class Main : MonoBehaviour {
    void Start() {
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
            Debug.Log(_tmp);
        }; //メソッドの内容を変更
    }

    public void change() {
        _right = ! _right;
        if (_right) {
            Move = (int arg) => { //匿名メソッドの代りにラムダ式を利用
                string _tmp = "";
                for (int i=0; i<arg; i++) _tmp += "→";
                Debug.Log(_tmp);
            }; //メソッドの内容を変更
        } else {
            Move = (int arg) => { //匿名メソッドの代りにラムダ式を利用
                string _tmp = "";
                for (int i=0; i<arg; i++) _tmp += "←";
                Debug.Log(_tmp);
            }; //メソッドの内容を変更
        }
    }
}
```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年02月XX日  
[[TOP](#TOP)]


<a name="静的メンバ（static）"></a>
# <b>静的メンバ（static）</b>
* 静的メンバはクラスをインスタンス化せずにアクセスが可能

```CSharp
// Main.cs
using UnityEngine;

public class Main : MonoBehaviour {
    void Start() {
        Debug.Log(Math.PI); //3.14159265358979 ←静的変数の呼び出し
        Debug.Log(Math.Pow(2,8)); //256（2の8乗） ←静的メソッドの実行
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

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年02月XX日  
[[TOP](#TOP)]


<a name="if文"></a>
# <b>if 文</b>

### 基本例文
```CSharp
// Main.cs
using UnityEngine;

public class Main : MonoBehaviour {
    void Start() {
        int _age = 50;
        if (_age <= 20) {
            Debug.Log("20歳以下");
        } else if (_age <= 40) {
            Debug.Log("21〜40歳");
        } else if (_age <= 60) {
            Debug.Log("41〜60歳"); //これが出力される
        } else {
            Debug.Log("61歳以上");
        }
    }
}
```

### 論理積（AND）
1. 論理演算子（&&）を使う方法
    ```CSharp
    if (条件式① && 条件②) {
        処理A ←条件式① かつ 条件式② の両方がtrueの場合に実行
    } else {
        処理B
    }
    ```

1. if のネストを使う方法
    ```CSharp
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
    ```CSharp
    if (条件式① || 条件②) {
        処理A ←条件式①または条件式②の両方がtrueの場合に実行
    } else {
        処理B
    }
    ```

2. if のネストを使う方法
    ```CSharp
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
    ```CSharp
    // Main.cs
    using UnityEngine;

    public class Main : MonoBehaviour {
        void Start() {
            bool _a = true, _b = false;
            if (_a ^ _b) {
                Debug.Log("どちらか一方だけtrueです");
            } else {
                Debug.Log("両方共にtrueかfalseです");
            }
        }
    }
    ```

1. ^ 演算子を使わない方法
    ```CSharp
    // Main.cs
    using UnityEngine;

    public class Main : MonoBehaviour {
        void Start() {
            bool _a = true, _b = false;
            if ((_a || _b) && !(_a && _b)) {
                Debug.Log("どちらか一方だけtrueです");
            } else {
                Debug.Log("両方共にtrueかfalseです");
            }
        }
    }
    ```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年02月XX日  
[[TOP](#TOP)]


<a name="三項演算子"></a>
# <b>三項演算子</b>

### 比較式が１つの場合
* 構文
```CSharp
データ型 変数名 = (比較式) ? (true時の返り値) : (false時の返り値);
```

* 例文
```CSharp
// Main.cs
using UnityEngine;

public class Main : MonoBehaviour {
    void Start() {
        int _age = 50;
        string _result = (_age < 60) ? "現役" : "退職";
        Debug.Log(_result); //"現役"
    }
}
```

### 比較式が複数の場合
* 構文
```CSharp
データ型 変数名 = (比較式①) ? (①がtrueの場合の返り値) : //①がfalseの場合↓
変数名 = (比較式②) ? (②がtrueの場合の返り値) : //②がfalseの場合↓
変数名 = (①②の全てがfalseの場合の返り値);
```

* 例文
```CSharp
// Main.cs
using UnityEngine;

public class Main : MonoBehaviour {
    void Start() {
        int _age = 50;
        string _result = (_age < 20) ? "未成年" :
        _result = (_age < 60) ? "現役" :
        _result = "退職";
        Debug.Log(_result); //"現役"
    }
}
```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年02月XX日  
[[TOP](#TOP)]


<a name="switch文"></a>
# <b>switch 文</b>

### 基本サンプル
```CSharp
// Main.cs
using UnityEngine;

public class Main : MonoBehaviour {
    void Start() {
        string _name = "CHIKASHI";
        switch (_name) { //判別式には「整数型」「文字型」しか使えない!
            case "CHIKASHI" :
                Debug.Log("父");
                break;
            case "HANAKO" : 
                Debug.Log("母");
                break;
            case "TARO" :
                Debug.Log("長男");
                break;
            case "JIRO" :
                Debug.Log("次男");
                break;
            default:
                Debug.Log("家族以外");
                break; //defaultのbreakは省略不可（注意）
        }
    }
}
```

### 注意その１ : 判別式に bool 型が使えない
* 判別式に指定可能なもの
    * byte 型、short 型、int 型 などの整数型（浮動小数点型は指定不可）
    * char 型、string 型といった文字型

* 悪い例（エラー発生）
```CSharp
// Main.cs
using UnityEngine;

public class Main : MonoBehaviour {
    void Start() {
        int _age = 50;
        switch (true) { //bool型はエラー（注意）
            case _age < 20 :
                Debug.Log("未成年");
                break;
            default:
                Debug.Log("成人");
                break;
        }
    }
}
```

### 注意その２ : フォールスルーの禁止規則
* C#では、下記のように case で何か処理をしておきながら break 文を書かないで次の case の処理に入っていくことは不可（フォールスルーの禁止規則）
```CSharp
case "○○" : 何か処理; //何か処理をしておきながらbreakを書かないとエラー
case "□□" : 何か処理; break;
```

* 良い例
```CSharp
// Main.cs
using UnityEngine;

public class Main : MonoBehaviour {
    void Start() {
        string _name = "JIRO";
        switch (_name) {
            case "CHIKASHI" : //breakが無いと次のcaseも処理
            case "HANAKO" : 
                Debug.Log("親");
                break;
            case "TARO" : //breakが無いと次のcaseも処理
            case "JIRO" :
                Debug.Log("子");
                break;
            default:
                Debug.Log("家族以外");
                break; //defaultのbreakは省略不可
        }
    }
}
```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年02月XX日  
[[TOP](#TOP)]


<a name="for文"></a>
# <b>for 文</b>

### 基本構文
```CSharp
for (①初期化; ②ループ判定式; ③更新処理) {
    繰り返す処理
}
```

### ループカウンタ（ループ制御変数）の宣言位置
1. for 文の中で宣言
    ```CSharp
    // Main.cs
    using UnityEngine;

    public class Main : MonoBehaviour {
        void Start() {
            for (int i=0; i<10; i++) { //ここでint型を宣言すると...
                Debug.Log(i); //0,1,2,3,4,5,6,7,8,9
            }
            //Debug.Log(i); //error CS0103（for文の外では使用不可）
        }
    }
    ```

1. for 文の外でループ制御変数を宣言する
    ```CSharp
    // Main.cs
    using UnityEngine;

    public class Main : MonoBehaviour {
        void Start() {
            int _i; //ここでint型を宣言すると...
            for (_i=0; _i<10; _i++) {
                Debug.Log(_i); //0,1,2,3,4,5,6,7,8,9
            }
            Debug.Log(_i); //10（for文の外でも有効）
        }
    }
    ```

### ループカウンタを○つずつアップする
```CSharp
// Main.cs
using UnityEngine;

public class Main : MonoBehaviour {
    void Start() {
        for (int i=0; i<50; i+=5) { //5つずつアップする場合...
            Debug.Log(i); //0,5,10,15,20,25,30,35,40,45
        }
    }
}
```

### for 文のネスト
```CSharp
// Main.cs
using UnityEngine;

public class Main : MonoBehaviour {
    void Start() {
        for (int i=1; i<=5; i++) {
            for (int j=1; j<=5; j++) {
                Debug.Log("x" + i + "y" + j); //x1y1,x1y2,....,x5y4,x5y5
            }
        }
    }
}
```

### 無限ループと break 文
```CSharp
// Main.cs
using UnityEngine;

public class Main : MonoBehaviour {
    void Start() {
        int _count = 0;
        for (;;) { //①初期化 ②ループ判定式 ③更新処理...の全てを省略すると無限ループ
            _count++;
            if (_count > 100) break; //ループを終了
            Debug.Log(_count); //1,2,....,99,100
        }
        Debug.Log("for文終了");
    }
}
```

### for 文と continue 文
```CSharp
// Main.cs
using UnityEngine;

public class Main : MonoBehaviour {
    void Start() {
        for (int i=1; i<=20; i++) { //iは1,2,...19,20
            if ((i % 3) != 0) { //3で割って余りが0ではない（＝3の倍数ではない）場合
                continue; //for文の残処理をスキップしてfor文の次の反復を開始する
            }
            Debug.Log(i); //3,6,9,12,15,18（3の倍数）
        }
    }
}
```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年02月XX日  
[[TOP](#TOP)]


<a name="foreach文"></a>
# <b>foreach 文</b>

### 基本構文
```CSharp
foreach (データ型 変数名 in 配列等) {
    Debug.Log(変数名);
}
```

### 配列（1次元）の場合
```CSharp
// Main.cs
using UnityEngine;

public class Main : MonoBehaviour {
    void Start() {
        string[] _array = {"A","B","C","D"}; 
        foreach (string value in _array) {
            Debug.Log(value); //"A"→"B"→"C"→"D"
        }
    }
}
```

### 配列（2次元）の場合
```CSharp
// Main.cs
using UnityEngine;

public class Main : MonoBehaviour {
    void Start() {
        string[,] _array = {
            {"x0y0","x1y0","x2y0"}, //0行目
            {"x0y1","x1y1","x2y1"}  //1行目
        }; 
        foreach (string value in _array) {
            Debug.Log(value); //"x0y0"→"x1y0"→"x2y0"→"x0y1"→"x1y1"→"x2y1"
        }
    }
}
```

### 配列（ジャグ配列）の場合
* [Edit]-[Project Settings]-[Player] を選択し、「Other Settings」の「Configuration」の「.NET」のバージョンが低いと dynamic が利用できません
```CSharp
// Main.cs
using UnityEngine;

public class Main : MonoBehaviour {
    void Start() {
        dynamic[][] _array = new dynamic[2][];
        _array[0] = new dynamic[]{"A","あ"};
        _array[1] = new dynamic[]{"I","い"};
        foreach (object[] theArray in _array) {
            foreach (object value in theArray) {
                Debug.Log(value); //"A"→"あ"、"I"→"い"
            }
            Debug.Log(""); //オプション（改行）
        }
    }
}
```

### 動的配列（ArrayList）の場合
```CSharp
// Main.cs
using UnityEngine;
using System.Collections; //ArrayListに必要

public class Main : MonoBehaviour {
    void Start() {
        ArrayList _array = new ArrayList();
        _array.Add("CHIKASHI");
        _array.Add(50);
        foreach (object value in _array) {
            Debug.Log(value); //"CHIKASHI"→49
        }
    }
}
```

### 動的配列（List）の場合
```CSharp
// Main.cs
using UnityEngine;
using System.Collections.Generic; //Listに必要（一般的なC#と同じ）

public class Main : MonoBehaviour {
    void Start() {
        List<string> _list = new List<string>() { "A", "B" };
        foreach (string value in _list) {
            Debug.Log(value); //"A"→"B"
        }
    }
}
```

### 連想配列の場合
```CSharp
// Main.cs
using UnityEngine;
using System.Collections.Generic; //Listに必要（一般的なC#と同じ）

public class Main : MonoBehaviour {
    void Start() {
        Dictionary<string, string> _dic = new Dictionary<string, string>() {
            {"A", "あ"},{"I", "い"}
        };
        foreach (KeyValuePair<string, string> tmp in _dic) {
            Debug.Log(tmp.Key + ":" + tmp.Value); //A:あ → I:い
        }
    }
}
```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年02月XX日  
[[TOP](#TOP)]


<a name="while文"></a>
# <b>while 文</b>

### while 文
* 構文
```CSharp
while (ループ判定式) {
    繰り返す処理
}
```

* 例文
```CSharp
// Main.cs
using UnityEngine;

public class Main : MonoBehaviour {
    void Start() {
        int _i = 0;
        while (_i < 10) { //ループ判定式にはbool型しか使えない
            Debug.Log(_i); //0,1,2,3,4,5,6,7,8,9
            _i++;
        }
        Debug.Log(_i); //10（変数はまだ有効）
    }
}
```

### do...while 文
* 構文
```CSharp
do {
    繰り返す処理 ←ループ判定式がfalseの場合でも最低１回は実行される
} while(ループ判定式);
```

* 例文
```CSharp
// Main.cs
using UnityEngine;

public class Main : MonoBehaviour {
    void Start() {
        int _i = 0;
        do {
            Debug.Log(_i); //0 ←ループ判定式はfalseだが１回実行される
            _i++;
        } while(_i < 0);
    }
}
```

### while 文と break 文
```CSharp
// Main.cs
using UnityEngine;

public class Main : MonoBehaviour {
    void Start() {
        int _count = 0;
        while (true) { //ループ判別式をtrueにすると無限ループに
            _count++;
            if (_count > 100) {
                break; //break文を使ってループを終了→★
            }
            Debug.Log(_count); //1,2,....,99,100（1〜100までを出力）
        }
        Debug.Log("while文終了"); //★
    }
}
```

### while 文と continue 文
```CSharp
// Main.cs
using UnityEngine;

public class Main : MonoBehaviour {
    void Start() {
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

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年02月XX日  
[[TOP](#TOP)]


<a name="配列"></a>
# <b>配列</b>
* C# では配列宣言後の要素数変更は不可

### １次元配列の作成
* 構文（他にも var キーワードを使ってデータ型を省略した定義も可能）
```CSharp
データ型[] 変数名 = new データ型[要素数];
データ型[] 変数名 = new データ型[]{要素①,要素②,...};
データ型[] 変数名 = {要素①,要素②,...}; //簡単
```

* 例文
```CSharp
dynamic[] _array1 = new dynamic[4]; //4つの空の要素（動的型）を持つ配列を作成
string[] _array2 = new string[]{"A","B","C","D"};
string[] _array3 = {"A","B","C","D"}; //簡単
```

### ２次元配列（四角配列）の作成
* 構文
```CSharp
データ型[,] 変数名 = new データ型[行数,列数]; //縦x横の空の要素を持つ２次元配列
データ型[,] 変数名 = {{1行目の配列},{2行目の配列},...};
```

1. new 演算子を使う方法（≒５行x４列のコインロッカー）
    ```CSharp
    // Main.cs
    using UnityEngine;

    public class Main : MonoBehaviour {
        void Start() {
            string[,] _coinlocker = new string[5,4];
            _coinlocker[0,0] = "1083"; //0,0の値
            _coinlocker[0,1] = "7777"; //0,1の値
            _coinlocker[2,1] = "0135"; //2,1の値
            _coinlocker[4,3] = "1234"; //4,3の値
        }
    }
    ```

1. 配列リテラルを使う方法（≒５行x４列のコインロッカー）
    ```CSharp
    // Main.cs
    using UnityEngine;

    public class Main : MonoBehaviour {
        void Start() {
            string[,] _coinlocker = {
                {"1083","7777","",""}, //0行目
                {"","","",""}, //1行目
                {"","0135","",""}, //2行目
                {"","","",""}, //3行目
                {"","","","1234"} //4行目
            };
            //確認
            Debug.Log(_coinlocker[0,0]); //"1083"
            Debug.Log(_coinlocker[0,1]); //"7777"
            Debug.Log(_coinlocker[2,1]); //"0135"
            Debug.Log(_coinlocker[4,3]); //"1234"
        }
    }
    ```

### 配列の配列（ジャグ配列）の作成
* 構文（それぞれの配列の長さは異なるものにできる）
* データ型に dynamic を利用する場合、[Edit]-[Project Settings]-[Player] を選択し、「Other Settings」の「Configuration」の「.NET」のバージョンを確認して下さい（低いと利用できません）
```CSharp
①データ型[][] 変数名 = new データ型[要素数][];
②データ型[][] 変数名 = new データ型[][]{new データ型[]{配列①},...};
```

1. ジャグ配列の宣言→後で値を割り当てる方法
    ```CSharp
    // Main.cs
    using UnityEngine;

    public class Main : MonoBehaviour {
        void Start() {
            dynamic[][] _array = new dynamic[4][];
            _array[0] = new dynamic[]{"A","あ","ア"}; //配列リテラルは不可
            _array[1] = new dynamic[]{"I","い","イ"};
            _array[2] = new dynamic[]{"U","う","ウ"};
            _array[3] = new dynamic[]{"E","え","エ"};
        }
    }
    ```

1. ジャグ配列の宣言と同時に値を割り当てる方法
    ```CSharp
    // Main.cs
    using UnityEngine;

    public class Main : MonoBehaviour {
        void Start() {
            dynamic[][] _array = new dynamic[][]{
            new dynamic[]{"A","あ","ア"},
            new dynamic[]{"I","い","イ"},
            new dynamic[]{"U","う","ウ"},
            new dynamic[]{"E","え","エ"}
            };
            foreach (dynamic[] theArray in _array) { //確認 (コマンドライン版の例）
                foreach (object theValue in theArray) {
                    Debug.Log(theValue);
                }
            }
        }
    }
    ```

### 配列の Length プロパティ
```CSharp
// Main.cs
using UnityEngine;

public class Main : MonoBehaviour {
    void Start() {
        string[] _array = {"A","B","C","D"};
        for (int i=0; i<_array.Length; i++) { //配列の要素の数
            Debug.Log(_array[i]);
        }
    }
}
```

### 文字列→配列
```CSharp
// Main.cs
using UnityEngine;

public class Main : MonoBehaviour {
    void Start() {
        string _string = "A,B,C,D"; //「,」区切りの文字列
        string[] _array = _string.Split(','); //「,」区切りで分割して配列化
        foreach (string value in _array) {
            Debug.Log(value); //"A"→"B"→"C"→"D"
        }
    }
}
```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年02月XX日  
[[TOP](#TOP)]


<a name="動的配列（List）"></a>
# <b>動的配列（List）</b>

### 概要
* 配列と異なり List は要素の数を変更したり追加･削除などが可能
* 動的配列（ArrayList）の.NET framework 2.0 対応版

### 作成
* 構文
```CSharp
List<データ型> 変数名 = new List<データ型>(); //空のListを作成
List<データ型> 変数名 = new List<データ型>(数); //指定数の空の要素を持つList作成
List<データ型> 変数名 = new List<データ型>() { 要素①,要素②,... };
```
* 例文
```CSharp
// Main.cs
using UnityEngine;
using System.Collections.Generic; //Listに必要

public class Main : MonoBehaviour {
    void Start() {
        List<string> _list = new List<string>() { "A", "B" };
        foreach (object value in _list) {
            Debug.Log(value); //"A"→"B"
        }
    }
}
```

### 追加（最後）
* 構文
```CSharp
List.Add(値); //値はobject型（文字型、数値型等）で混在不可（dynamic型は除く）
```
* 例文
```CSharp
// Main.cs
using UnityEngine;
using System.Collections.Generic; //Listに必要

public class Main : MonoBehaviour {
    void Start() {
        //空 → "A" → "A","B"
        List<string> _list = new List<string>();
        _list.Add("A");
        _list.Add("B");
        foreach (object value in _list) {
            Debug.Log(value); //"A"→"B"
        }
    }
}
```

### 追加（指定位置）
* 構文
```CSharp
List.Insert(インデックス番号,値); //先頭（0）〜最後（List.Capacity-1）まで指定可能
```
* 例文
```CSharp
// Main.cs
using UnityEngine;
using System.Collections.Generic; //Listに必要

public class Main : MonoBehaviour {
    void Start() {
        //"A","B" → "C","A","B"
        List<string> _list = new List<string>() { "A", "B" };
        _list.Insert(0,"C"); //先頭に追加する場合は0
        foreach (object value in _list) {
            Debug.Log(value); //"C"→"A"→"B"
        }
    }
}
```

### 更新（任意の値）
* 構文
```CSharp
List[インデックス番号] = 値;
```
* 例文
```CSharp
// Main.cs
using UnityEngine;
using System.Collections.Generic; //Listに必要

public class Main : MonoBehaviour {
    void Start() {
        //"A","B" → "C","B"
        List<string> _list = new List<string>() { "A", "B" };
        _list[0] = "C"; //0番目を変更する場合
        foreach (object value in _list) {
            Debug.Log(value); //"C"→"B"
        }
    }
}
```

### 更新（null）
* 構文
```CSharp
List[インデックス番号] = null;
```
* 例文
```CSharp
// Main.cs
using UnityEngine;
using System.Collections.Generic; //Listに必要

public class Main : MonoBehaviour {
    void Start() {
        //"A","B","C" → "A","B",null
        List<string> _list = new List<string>() { "A", "B", "C" };
        _list[2] = null;
        foreach (object value in _list) {
            Debug.Log(value); // "A"→"B"→Null
        }
    }
}
```

### 削除（指定のオブジェクト）
* 構文
```CSharp
List.Remove(object); //最初に見つかった指定のオブジェクトを削除
```
* 例文
```CSharp
// Main.cs
using UnityEngine;
using System.Collections.Generic; //Listに必要

public class Main : MonoBehaviour {
    void Start() {
        //"A","B","C" → "A","C"
        List<string> _list = new List<string>() { "A", "B", "C" };
        _list.Remove("B");
        foreach (object value in _list) {
            Debug.Log(value); // "A"→"C"
        }
    }
}
```

### 削除（指定のインデックス）
* 構文
```CSharp
List.RemoveAt(インデックス番号); //先頭（0）〜最後（List.Capacity-1）まで指定可能
```
* 例文
```CSharp
// Main.cs
using UnityEngine;
using System.Collections.Generic; //Listに必要

public class Main : MonoBehaviour {
    void Start() {
        //"A","B","C" → "B","C"
        List<string> _list = new List<string>() { "A", "B", "C" };
        _list.RemoveAt(0); //先頭を削除する場合
        //_list.RemoveAt(_list.Capacity-1); //最後を削除する場合
        foreach (object value in _list) {
            Debug.Log(value); // "B"→"C"
        }
    }
}
```

### 削除（○番目から□個）
* 構文
```CSharp
List.RemoveRange(開始, 削除する個数); //開始＝削除開始したいインデックス番号
List.RemoveRange(開始, List.Capacity-開始); //○番目から最後まで削除
List.Clear(); //全て削除
```
* 例文
```CSharp
// Main.cs
using UnityEngine;
using System.Collections.Generic; //Listに必要

public class Main : MonoBehaviour {
    void Start() {
        //"A","B","C","D" → "A","B"
        List<string> _list = new List<string>() { "A", "B", "C", "D"};
        _list.RemoveRange(2, 2); //2番目から2個削除
        //]_list.RemoveRange(1, _list.Capacity-1); //1番目〜最後を削除する場合
        //_list.Clear(); //全て削除する場合
        foreach (object value in _list) {
            Debug.Log(value); // "A"→"B"
        }
    }
}
```

### 抽出（○番目から□個）
* 構文
```CSharp
List.GetRange(開始, 抜き出す個数); //開始＝抜出しを開始したいインデックス番号
```
* 例文
```CSharp
// Main.cs
using UnityEngine;
using System.Collections.Generic; //Listに必要

public class Main : MonoBehaviour {
    void Start() {
        //"A","B","C","D" → "C","D"を返す
        List<string> _list = new List<string>() { "A", "B", "C", "D"};
        List<string> _result = _list.GetRange(2, 2); //2番目から2個抽出する場合
        //List<string> _result = _list.GetRange(1, _list.Capacity-1);//1番目〜最後を抽出
        foreach (object value in _result) {
            Debug.Log(value); // "C"→"D"
        }
    }
}
```

### 検索(前から）
* 構文
```CSharp
List.IndexOf(object [,検索開始するインデックス番号]);
//最初に見つかったインデックス番号を返す（無い場合-1）
//第2引数を省略すると最初（0）から検索
```
* 例文
```CSharp
// Main.cs
using UnityEngine;
using System.Collections.Generic; //Listに必要

public class Main : MonoBehaviour {
    void Start() {
        List<string> _list = new List<string>() { "A", "B", "C", "D"};
        Debug.Log(_list.IndexOf("C",0)); //2
        //最初から検索する場合（第2引数が0の場合は省略可能）
    }
}
```

### 検索（後ろから）
* 構文
```CSharp
List.LastIndexOf(object [,検索開始するインデックス番号]);
//最後に見つかったインデックス番号を返す（無い場合-1）
//第2引数を省略すると最後（List.Capacity-1）から検索
```
* 例文
```CSharp
// Main.cs
using UnityEngine;
using System.Collections.Generic; //Listに必要

public class Main : MonoBehaviour {
    void Start() {
        List<string> _list = new List<string>() { "A", "B", "C", "D"};
        Debug.Log(_list.LastIndexOf("C")); //2
        //最初から検索する場合（第2引数が0の場合は省略可能）
    }
}
```

### 要素の数
* 構文
```CSharp
List.Count; //実際に格納されている要素の数
List.Capacity; //格納可能な要素の数
```
* 例文
```CSharp
// Main.cs
using UnityEngine;
using System.Collections.Generic; //Listに必要

public class Main : MonoBehaviour {
    void Start() {
        //List<string> _list = new List<string>() { "A", "B", "C"};
        List<string> _list = new List<string>(3); //空のArrayListを作成
        Debug.Log(_list.Count); //0 ←実際に格納されている要素の数
        Debug.Log(_list.Capacity); //3 ←格納可能な要素の数
    }
}
```

### 並べ替え（反転）
```CSharp
// Main.cs
using UnityEngine;
using System.Collections.Generic; //Listに必要

public class Main : MonoBehaviour {
    void Start() {
        List<string> _list = new List<string>() { "A", "B", "C", "D"};
        _list.Reverse();
        foreach (object value in _list) {
            Debug.Log(value); // "D"→"C"→"B"→"A"
        }
    }
}
```

### 並べ替え（ソート）
* 構文
```CSharp
List.Sort(); //引数で範囲や比較方法を指定することも可能
```
* 例文
```CSharp
// Main.cs
using UnityEngine;
using System.Collections.Generic; //Listに必要

public class Main : MonoBehaviour {
    void Start() {
        //"C", "02", "A", "01", "03", "B" → "01", "02", "03", "A", "B", "C"
        List<string> _list = new List<string>() { "C", "02", "A", "01", "03", "B" };
        _list.Sort();
        foreach (object value in _list) {
            Debug.Log(value); // "01"→"02"→"03"→"A"→"B"→"C"
        }
    }
}
```

### 結合
* 構文
```CSharp
// Main.cs
using UnityEngine;
using System.Collections.Generic; //Listに必要

public class Main : MonoBehaviour {
    void Start() {
        List<string> _list1 = new List<string>() { "A", "B", "C" };
        List<string> _list2 = new List<string>() { "D", "E", "F" };

        //_list1の末尾に_list2を結合
        _list1.AddRange(_list2);

        foreach (object value in _list1) {
            Debug.Log(value); // "A"→"B"→"C"→"D"→"E"→"F"
        }
    }
}
```

### 複製
```CSharp
// Main.cs
using UnityEngine;
using System.Collections.Generic; //Listに必要

public class Main : MonoBehaviour {
    void Start() {
        List<string> _list = new List<string>() { "A", "B", "C" };
        List<string> _listCopy = new List<string>(_list); //簡易型コピー方法
        _list[0] = "X";
        Debug.Log(_list[0]); //"X"
        Debug.Log(_listCopy[0]); //"A（参照コピーではない）
    }
}
```

### 文字列→ List
```CSharp
// Main.cs
using UnityEngine;
using System.Collections.Generic; //Listに必要

public class Main : MonoBehaviour {
    void Start() {
        string _string = "A,B,C,D"; //①元となる文字列
        string[] _array = _string.Split(','); //②文字列→配列に変換（「配列」参照）
        List<string> _list = new List<string>(); //③空のListを作成
        foreach (string _tmp in _array) { //データ型に注意
            _list.Add(_tmp); //④配列の要素を1つずつListに追加
        }

        //確認
        foreach (object value in _array) {
            Debug.Log(value); // "A"→"B"→"C"→"D"
        }
    }
}
```


### 全要素を取り出す
1. foreach 文を使う方法
    ```CSharp
    // Main.cs
    using UnityEngine;
    using System.Collections.Generic; //Listに必要

    public class Main : MonoBehaviour {
        void Start() {
            List<string> _list = new List<string>() { "A", "B", "C" };

            //全要素を取り出す
            foreach (object value in _list) {
                Debug.Log(value); // "A"→"B"→"C"
            }
        }
    }
    ```

1. for 文を使う方法
    ```CSharp
    // Main.cs
    using UnityEngine;
    using System.Collections.Generic; //Listに必要

    public class Main : MonoBehaviour {
        void Start() {
            List<string> _list = new List<string>() { "A", "B", "C" };

            //全要素を取り出す
            for (int i=0; i < _list.Count; i++) {
                Debug.Log(_list[i]); // "A"→"B"→"C"
            }
        }
    }
    ```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年02月XX日  
[[TOP](#TOP)]


<a name="連想配列（Dictionary）"></a>
# <b>連想配列（Dictionary）</b>

### 概要
* ディクショナリ、ハッシュとも呼ばれる「キー」と「値」の組み合わせを格納するデータ構造
* 匿名型クラスは、同様のデータ構造を持てるが読取り専用

### 作成方法
```CSharp
Dictionary<キーの型, 値の型> 変数名 = new Dictionary<キーの型, 値の型>();
Dictionary<キーの型, 値の型> 変数名 = new Dictionary<キーの型, 値の型>() {
    {"キー①", 値①},
    {"キー②", 値②}, 
    ......…
};
```

* 例文
    ```CSharp
    // Main.cs
    using UnityEngine;
    using System.Collections.Generic; //Dictionaryに必要

    public class Main : MonoBehaviour {
        void Start() {
            //①作成（空のDictionaryを作成する場合、{}は不要）
            Dictionary<string, string> _dic = new Dictionary<string, string>() {
                {"A", "あ"},
                {"I", "い"}
            };

            //②追加
            _dic.Add("U", "う");
            _dic.Add("E", "え");

            //③更新
            _dic["A"] = "ア"; //上書き変更

            //④取得
            Debug.Log(_dic["A"]); //"ア"
        }
    }
    ```

### キー、値の検索
```CSharp
// Main.cs
using UnityEngine;
using System.Collections.Generic; //Dictionaryに必要

public class Main : MonoBehaviour {
    void Start() {
        //①作成（空のDictionaryを作成する場合、{}は不要）
        Dictionary<string, string> _dic = new Dictionary<string, string>() {
            {"A", "あ"},{"I", "い"},{"U", "う"},{"E", "え"},{"O", "お"}
        };

        Debug.Log(_dic.ContainsKey("B")); //任意のキーがあるか否か（True／False）
        Debug.Log(_dic.ContainsValue("え")); //任意の値があるか否か（True／False）
    }
}
```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年02月XX日  
[[TOP](#TOP)]


<a name="this"></a>
# <b>this</b>

### this が必要な場合
1. 「引数」と「インスタンス変数」が同じ場合
1. 「ローカル変数」と「インスタンス変数」が同じ場合
* this は、this を記述したメソッドを所有するクラス（オブジェクト）を指す

### 例文
```CSharp
// Main.cs
using UnityEngine;

public class Main : MonoBehaviour {
    void Start() {
        Robot _robot = new Robot(500);
        _robot.Move();
        Debug.Log(_robot.X); //510
        Debug.Log(this); //GameObject（このC#に紐付いたGameObject名）
    }
}

//カスタムクラス
class Robot {
    private int _x; //インスタンス変数（thisは不要）
    
    public Robot(int _x) { //引数
        this._x = _x; //①thisが無いとWarning（引数を参照してしまう）
        Debug.Log(this); //Robot（このメソッドが実行されたオブジェクト）
    }

    public void Move() {
        int _x; //ローカル変数
        _x = this._x + 10; //②thisが無いとerror（ローカル変数を参照してしまう）
        if (_x >= 1920) _x = 0;
        this._x = _x; //②thisが無いとローカル変数を参照してしまう
        Debug.Log(this); //Robot（このメソッドが実行されたオブジェクト）
    }

    public int X {
        get { return _x; } //thisを付けてもよい（通常は省略）
        private set {}
    }
}
```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年02月XX日  
[[TOP](#TOP)]


<a name="文字列の操作"></a>
# <b>文字列の操作</b>

### string オブジェクトの作成
* 構文
```CSharp
string 変数名 = "○○"; //文字列リテラルを使う方法
string 変数名 = new string(new char[]{'○','○',...}); //new演算子とchar型配列を使う方法
```
* 例文
```CSharp
// Main.cs
using UnityEngine;

public class Main : MonoBehaviour {
    void Start() {
        //①文字列リテラルを使う
        string _string1 = "ABCDE";
        Debug.Log(_string1); //"ABCDE"

        //②new演算子とchar型配列を使う
        string _string2 = new string(new char[]{'A','B','C','D','E'});
        Debug.Log(_string2); //"ABCDE" 
    }
}
```

### 長さを調べる
```CSharp
// Main.cs
using UnityEngine;

public class Main : MonoBehaviour {
    void Start() {
        string _string = "ABCDE";
        Debug.Log(_string.Length); //5
    }
}
```

### 一部分を取得
* 構文
```CSharp
String[番号] ←0（最初）〜String.Length-1（最後）
String.Substring(開始 [,文字数])
```
* 例文
```CSharp
// Main.cs
using UnityEngine;

public class Main : MonoBehaviour {
    void Start() {
        string _string = "0123456789";
        Debug.Log(_string[4]); //"4"
        Debug.Log(_string.Substring(4)); //"456789"
        Debug.Log(_string.Substring(4,3)); //"456"
    }
}
```

### 一部分を削除
* 構文
```CSharp
String.Remove(開始位置, 削除する文字数);
```
* 例文
```CSharp
// Main.cs
using UnityEngine;

public class Main : MonoBehaviour {
    void Start() {
        string _string = "にしむらたかし";
        Debug.Log(_string.Remove(0, 4)); //"たかし"
    }
}
```

### 置換
* 構文
```CSharp
String.Replace("置換前の文字列", "置換後の文字列");
String.Replace('置換前の文字', '置換後の文字');
```
* 例文
```CSharp
// Main.cs
using UnityEngine;

public class Main : MonoBehaviour {
    void Start() {
       	string _string = "2018年03月13日";
        Debug.Log(_string.Replace("2018年", "平成30年")); //"平成30年03月13日"
    }
}
```

### 検索
* 構文
```CSharp
String.IndexOf("検索したい文字列", 開始位置);
String.IndexOf('検索したい文字', 開始位置);
```
* 例文
```CSharp
// Main.cs
using UnityEngine;

public class Main : MonoBehaviour {
    void Start() {
       	string _string = "ABCDEFG-ABCDEFG";
        string _word = "CD";
        int _i = 0;
        while (_string.IndexOf(_word, _i) != -1) { //見つからない場合「-1」
            int _num = _string.IndexOf(_word, _i);
            Debug.Log(_num); //2、10 ←"CD"が見つかった位置を出力
            Debug.Log(_string.Substring(_num, _word.Length)); //"CD"、"CD"
            _i = _num + 1;
        }
    }
}
```

### 文字列→配列
* 構文
```CSharp
String.Split('区切り文字');
```
* 例文
```CSharp
// Main.cs
using UnityEngine;

public class Main : MonoBehaviour {
    void Start() {
        string _string = "A,B,C,D"; //「,」区切りの文字列
        string[] _array = _string.Split(','); //「,」区切りで分割して配列化
        foreach (object value in _array) {
            Debug.Log(value); // "A"→"B"→"C"→"D"
        }
    }
}
```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年02月XX日  
[[TOP](#TOP)]


<a name="正規表現"></a>
# <b>正規表現</b>

* C# には以下のサンプル以外にも多くの正規表現の機能が用意されています

### マッチした数
```CSharp
// Main.cs
using UnityEngine;
using System.Text.RegularExpressions; //Regexに必要

public class Main : MonoBehaviour {
    void Start() {
        string _string = "cabacbbacbcba";
        //"a"がいくつ含まれるか
        MatchCollection _mc = Regex.Matches(_string, "a");
        Debug.Log(_mc.Count); //4
    }
}
```

### パスワード
```CSharp
// Main.cs
using UnityEngine;
using System.Text.RegularExpressions; //Regexに必要

public class Main : MonoBehaviour {
    void Start() {
        string _string = @"U7eLoERa"; //任意のパスワード（@を付ける）
        /* 条件
        8文字以上（全て半角）
        1文字以上の「数字」を含む
        1文字以上の大文字および小文字の「英字」を含む
        */
        Regex _regex = new Regex(@"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])\w{8,}$");//②
        Match _match = _regex.Match(_string);
        Debug.Log(_match.Success); //True ←パスワードとして条件に合致
    }
}
```

### 郵便番号（7桁）
```CSharp
// Main.cs
using UnityEngine;
using System.Text.RegularExpressions; //Regexに必要

public class Main : MonoBehaviour {
    void Start() {
        string _string = "123-4567"; //任意の郵便番号
        Regex _regex = new Regex("\\d{3}-\\d{4}");
        Match _match = _regex.Match(_string);
        Debug.Log(_match.Success); //True ←郵便番号として条件に合致
    }
}
```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年02月XX日  
[[TOP](#TOP)]


<a name="インターフェース"></a>
# <b>インターフェース</b>

### 概要
* クラスにどのような機能（メソッド）を持たせるか、ということだけを定める
* 抽象クラスと似ているが、抽象クラスとは異なり、実際の処理は一切記述できない
* 実際の処理はインターフェースを継承したクラスで定義（実装しないとエラー）
* 多重実装（複数のインターフェースを同時に指定）や多重継承も可能

### 構文
```CSharp
//インターフェースの宣言
interface Iインターフェース名 { //慣例的にインターフェース名の先頭にIを付けます
    戻り値の型 メソッド名Ａ([型① 引数①, 型② 引数②,...]); //暗黙的にpublic扱い
    ......
}
//インターフェースの実装
class クラス名 : Iインターフェース名 { ......
```

### 例文
```CSharp
// Main.cs
using UnityEngine;

public class Main : MonoBehaviour {
    void Start() {
        Moneybox _moneybox = new Moneybox();
        _moneybox.Add(5000);
        Debug.Log(_moneybox.Total); //5000
    }
}

//インターフェースの宣言
interface IMoneybox {
    void Add(int _money); //通常のメソッド（暗黙的にpublicになる）
    int Total { get; set; } //get/setアクセサ（暗黙的にpublicになる）
}

//インターフェースの実装（継承との併用は,を使う）
class Moneybox : IMoneybox {
    private int _total = 0;
    public void Add(int _money) { _total += _money; } 
    public int Total {
        get { return _total; }
        set { _total = value; }
    }
}
```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年02月XX日  
[[TOP](#TOP)]


<a name="抽象クラス（abstract）"></a>
# <b>抽象クラス（abstract）</b>

### 概要
* 派生クラスに"実装しなければならないメソッド"を抽象クラスで定義する
* 実際の処理は、抽象クラスを継承した派生クラスで、抽象メソッドを override して記述

### 構文
```CSharp
abstract class Abstract○○ { //抽象クラスの定義
    public abstract 戻り値の型 メソッド名Ａ([型① 引数①, 型② 引数②,...]);
}

class SubClass : Abstract○○ { //抽象クラスの継承
    public override 戻り値の型 メソッド名Ａ([型① 引数①, 型② 引数②,...]) {
        //実際の処理
    }
    ……
```

### 例文
```CSharp
// Main.cs
using UnityEngine;

public class Main : MonoBehaviour {
    void Start () {
        SubClass _subClass = new SubClass();
        _subClass.Common(); //"AbstractClass.Common()"
        _subClass.Method(); //"SubClass.Method()"
    }
}

abstract class AbstractClass { //「抽象クラス」の定義
    public void Common() { //共通のメソッド
        Debug.Log("AbstractClass.Common()");
    }
    public abstract void Method(); //「抽象メソッド」の宣言（実際の処理は書かない）
}

class SubClass : AbstractClass { //抽象クラスを継承
    public override void Method() { //オーバーライドして実際の処理を記述
        Debug.Log("SubClass.Method()"); //実際の処理
    }
}
```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年02月XX日  
[[TOP](#TOP)]


<a name="baseキーワード"></a>
# <b>base キーワード</b>

### 概要
基本クラスに定義されたコンストラクタ（private 以外）は、派生クラスのコンストラクタが実行される直前に必ず実行される。その際、基本クラスのコンストラクタへ、派生クラスのコンストラクタから引数を渡すことがbaseを使うことで可能になる（≒ super）。base.メソッド() で基本クラスのメソッドを呼び出す事が可能（「[オーバーライド](#オーバーライド)」参照）。

### 書式
```CSharp
class 基本クラス名 { 
    public 基本クラス名(型 引数) { //基本クラスのコンストラクタ
        //引数を使った処理etc.
    }
}
class 派生クラス名 : 基本クラス名 { //派生クラス（基本クラスを継承）
    public 派生クラス名() : base(引数) { //派生クラスのコンストラクタ
    }
}
```

### 例文
```CSharp
// Main.cs
using UnityEngine;

public class Main : MonoBehaviour {
    void Start () {
        SubClass _subClass = new SubClass("A");
    }
}

class SuperClass { //基本クラス
    public SuperClass(string p1, string p2) { //基本クラスのコンストラクタ
        Debug.Log("SuperClass:" + p1 + ":" + p2); //①番目（p1は"A"、p2は"B"）
    }
}

class SubClass : SuperClass { //派生クラス
    public SubClass(string p) : base(p, "B") { //派生クラスのコンストラクタ
        Debug.Log("SubClass:" + p); //②番目（pは"A"）
    } 
}
```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年02月XX日  
[[TOP](#TOP)]


<a name="オーバーライド"></a>
# <b>オーバーライド</b>

### 概要
* 基本クラス（または抽象クラス）で定義したメソッドを、派生クラスで再定義することをオーバーライドと呼ぶ
* オーバーライドできるメソッドは、基本クラスの場合 virtual 、抽象クラスの場合 abstract キーワードが付加されたものに限る
* 基本クラスのメソッドを、オーバーライドによって拡張する場合などで、基本クラスのメソッドを呼び出したい場合は、base.メソッド名() を使用する（「[base キーワード](#baseキーワード)」参照）。

### 「仮想メソッド」のオーバーライド
* 書式
```CSharp
class 基本クラス名 {
    アクセス修飾子 virtual 戻り値の型 メソッド名([型 引数]) {
        ……
    }
    ……
}
class 派生クラス名 : 基本クラス { //派生クラス（基本クラスを継承）
    アクセス修飾子 override 戻り値の型 メソッド名([型 引数]) { 
        base.メソッド名(引数); //基本クラスのメソッドを呼び出す（オプション）
        …… 
    }
    ……
}
```

* 例文
```CSharp
// Main.cs
using UnityEngine;

public class Main : MonoBehaviour {
    void Start () {
        SubClass _subClass = new SubClass();
        _subClass.Method();
    }
}

class SuperClass { //基本クラス
    public virtual void Method() { //オーバーライドを許可
        Debug.Log("SuperClass.Method");
    }
}

class SubClass : SuperClass { //派生クラス（基本クラスを継承）
    public override void Method() { //基本クラスのメソッドのオーバーライド
        Debug.Log("SubClass.Method");
        base.Method(); //"SuperClass.Method"←基本クラスのメソッド実行（オプション）
    } 
}
```

### 「抽象メソッド」のオーバーライド
* 書式
```CSharp
abstract class 抽象クラス名 { //抽象クラスの定義
    アクセス修飾子 abstract 型 抽象メソッド名([型 引数]); //抽象メソッド宣言
    ……
}
class 派生クラス : 抽象クラス名 { //抽象クラスを継承
    アクセス修飾子 override 型 抽象メソッド名([型 引数]) { //オーバーライド
        //実際の処理
    }
    ……
}
```

* 例文
```CSharp
// Main.cs
using UnityEngine;

public class Main : MonoBehaviour {
    void Start () {
        SubClass _subClass = new SubClass();
        _subClass.Method();
    }
}

abstract class AbstractClass { //抽象クラス
    public abstract void Method(); //抽象メソッドの宣言
}

class SubClass : AbstractClass { //派生クラス（抽象クラスを継承）
    public override void Method() { //オーバーライドして実際の処理を記述
        Debug.Log("AbstractClass.Method");
    } 
}
```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年02月XX日  
[[TOP](#TOP)]


<a name="カスタムイベント"></a>
# <b>カスタムイベント</b>

### 概要
イベントとは、あるアクションが発生したことを自動的に通知する仕組み。カスタムクラス内で何か処理をし終えた際、別のオブジェクトにそのことを知らせる場合に、このイベント機能を使用。イベントを設定したカスタムクラスからは、情報（イベント）を発信するだけ。情報を受けたいオブジェクトは、リスナーメソッドを準備して待ち受ける...。このことにより、カスタムクラスを汚さずに済む、というメリットが生まれる。C# に用意された event は、特殊なデリゲート（delegate）と言えるものです。デリゲートとの違いは、event 宣言した変数（イベント名）には、イベントハンドラ（≒リスナー関数）の追加（+=）または削除（-=）のみ可能ということ等。

### 書式
* イベントの設定
```CSharp
class クラス名 {
    public delegate void デリゲート名([型 引数]); //デリゲート宣言
    public event デリゲート名 イベント名; //これにイベントハンドラを登録
    public 戻り値の型 メソッド名([型 引数]) { //イベントを発生させたいメソッド
        ……
        イベント名([引数]); //ここでイベントハンドラを呼出す!
    }
    ……
}
```

* イベントハンドラの登録
```CSharp
クラス名 ○ = new クラス名();
○.イベント名 += イベントハンドラ名; //イベントハンドラを削除する場合「-=」
……
static 戻り値の型 イベントハンドラ名([型 引数]) {
    //イベントが発生した際に処理すること
}
```

### 例文
```CSharp
// Main.cs
using UnityEngine;

public class Main : MonoBehaviour {
    void Start () {
        MyGame _myGame = new MyGame();
        _myGame.GameOverEvent += GameOverHandler_myGame; //複数登録可能（+=、-=のみ）
        //_myGame.GameOverEvent -= GameOverHandler_myGame; //イベントハンドラの削除
        for (int i=0; i<10; i++) { //10回繰返す場合…
            Debug.Log("得点:" + _myGame.Point);
            _myGame.AddPoint();
        }
    }

    static void GameOverHandler_myGame(object arg) { //イベントハンドラ
        Debug.Log("ゲームオーバー! " + arg); //"ゲームオーバー! MyGame"
    }
}

//イベントを設定するクラス
class MyGame {
    private int _point = 0;
    public delegate void MyEventHandler(object arg); //デリゲート宣言
    public event MyEventHandler GameOverEvent; //これにイベントハンドラを登録
    public void AddPoint() { //イベントを発生させたいメソッド
        if (++_point >= 10) {
            if (GameOverEvent != null) {
                GameOverEvent(this); //イベントハンドラの呼出し
            }
        }
    }
    public int Point {
        get { return _point; }
        private set {} //読取専用
    }
}
```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年02月XX日  
[[TOP](#TOP)]


<a name="数学関数（Math）"></a>
# <b>数学関数（Math）</b>

### Math.Sin() : サイン（正弦）
```CSharp
// Main.cs
using UnityEngine;
using System; //Mathに必要

public class Main : MonoBehaviour {
    void Start () {
        Debug.Log(Math.Sin(0)); //0 ←0°
        Debug.Log(Math.Sin(Math.PI/2)); //1 ←90°
        Debug.Log(Math.Sin(Math.PI)); //1.22460635382238E-16（≒0）←180°
        Debug.Log(Math.Sin(Math.PI*3/2)); //-1 ←270°
        Debug.Log(Math.Sin(Math.PI*2)); //-2.44921270764475E-16（≒0）←360°
    }
}
```

### Math.Cos() : コサイン（余弦）
```CSharp
// Main.cs
using UnityEngine;
using System; //Mathに必要

public class Main : MonoBehaviour {
    void Start () {
        Debug.Log(Math.Cos(0)); //1 ←0°
        Debug.Log(Math.Cos(Math.PI/2)); //6.12303176911189E-17（≒0）←90°
        Debug.Log(Math.Cos(Math.PI)); //-1 ←180°
        Debug.Log(Math.Cos(Math.PI*3/2)); //-1.83690953073357E-16（≒0）←270°
        Debug.Log(Math.Cos(Math.PI*2)); //1 ←360°
    }
}
```

### Math.Atan2() : アークタンジェント2
```CSharp
// Main.cs
using UnityEngine;
using System; //Mathに必要

public class Main : MonoBehaviour {
    void Start () {
        //2つの値のアークタンジェント（逆タンジェント）。X、Y座標の角度をラジアン単位で返す
        //Πラジアン（3.141592…）は180°
        //三角形の各辺が1:2:√3の場合、2:√3の間の角度は30°であることを検証
        double _disX = Math.Sqrt(3); //√3のこと
        int _disY = 1;
        Debug.Log(Math.Atan2(_disY, _disX)); //0.523598775598299（ラジアン）
        Debug.Log(180*Math.Atan2(_disY, _disX)/Math.PI); //30（度）
    }
}
```

### Math.PI : 円周率
```CSharp
// Main.cs
using UnityEngine;
using System; //Mathに必要

public class Main : MonoBehaviour {
    void Start () {
        Debug.Log(Math.PI); //3.14159265358979（Math.PIラジアン=180°）
    }
}
```

### Math.Floor() : 切り捨て
```CSharp
// Main.cs
using UnityEngine;
using System; //Mathに必要

public class Main : MonoBehaviour {
    void Start () {
        Debug.Log(Math.Floor(1.001)); //1
        Debug.Log(Math.Floor(1.999)); //1
    }
}
```

### Math.Ceiling() : 切り上げ
```CSharp
// Main.cs
using UnityEngine;
using System; //Mathに必要

public class Main : MonoBehaviour {
    void Start () {
        Debug.Log(Math.Ceiling(1.001)); //2
        Debug.Log(Math.Ceiling(1.999)); //2
    }
}
```

### Math.Round() : 四捨五入
```CSharp
// Main.cs
using UnityEngine;
using System; //Mathに必要

public class Main : MonoBehaviour {
    void Start () {
        Debug.Log(Math.Round(1.499)); //1
        Debug.Log(Math.Round(1.500)); //2
    }
}
```

### Math.Abs() : 絶対値
```CSharp
// Main.cs
using UnityEngine;
using System; //Mathに必要

public class Main : MonoBehaviour {
    void Start () {
        Debug.Log(Math.Abs(100)); //100
        Debug.Log(Math.Abs(-100)); //100
    }
}
```

### Math.Pow() : 累乗（○の□乗）
```CSharp
// Main.cs
using UnityEngine;
using System; //Mathに必要

public class Main : MonoBehaviour {
    void Start () {
        Debug.Log(Math.Pow(2, 0)); //1（2の0乗）
        Debug.Log(Math.Pow(2, 8)); //256（2の8乗）
    }
}
```

### Math.Sqrt() : 平方根（√○）
```CSharp
// Main.cs
using UnityEngine;
using System; //Mathに必要

public class Main : MonoBehaviour {
    void Start () {
        Debug.Log(Math.Sqrt(2)); //1.4142135623731（一夜一夜にひとみごろ）
        Debug.Log(Math.Sqrt(3)); //1.73205080756888（人並みに奢れや）
        Debug.Log(Math.Sqrt(4)); //2
        Debug.Log(Math.Sqrt(5)); //2.23606797749979（富士山麓オウム鳴く）
    }
}
```

### Math.Max() : 比較（最大値）
```CSharp
// Main.cs
using UnityEngine;
using System; //Mathに必要

public class Main : MonoBehaviour {
    void Start () {
        Debug.Log(Math.Max(5.01, -10)); //5.01 ←「2つ」の数値の比較
    }
}
```

### Math.Min() : 比較（最小値）
```CSharp
// Main.cs
using UnityEngine;
using System; //Mathに必要

public class Main : MonoBehaviour {
    void Start () {
        Debug.Log(Math.Min(5.01, -10)); //-10 ←「2つ」の数値の比較
    }
}
```

### Math.Sign() : 符号（正か負の値か）
```CSharp
// Main.cs
using UnityEngine;
using System; //Mathに必要

public class Main : MonoBehaviour {
    void Start () {
        Debug.Log(Math.Sign(-0.1)); //-1（負の値）
        Debug.Log(Math.Sign(0)); //0（0）
        Debug.Log(Math.Sign(0.1)); //1（正の値）
    }
}
```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年02月XX日  
[[TOP](#TOP)]


<a name="乱数"></a>
# <b>乱数</b>
* Unity の独自仕様（一般的な C# の Random クラスとは異なります）

### 0〜1.0 未満
```CSharp
// Main.cs
using UnityEngine;

public class Main : MonoBehaviour {
    void Start () {
        Debug.Log(UnityEngine.Random.value); //0〜0.999…（1.0未満）
    }
}
```

### 最小値〜最大値（float 型）
```CSharp
// Main.cs
using UnityEngine;

public class Main : MonoBehaviour {
    void Start () {
        Debug.Log(UnityEngine.Random.Range(-0.3f, 0.8f)); //-0.3〜0.8以下
    }
}
```

### 最小値〜最大値（int型）
```CSharp
// Main.cs
using UnityEngine;

public class Main : MonoBehaviour {
    void Start () {
        int _u5=0,_u4=0,_u3=0,_u2=0,_u1=0,_o0=0,_o1=0,_o2=0,_o3=0,_o4=0,_o5=0;

        for (int i=0; i < 1000000; i++) {
            switch (UnityEngine.Random.Range(-5, 5)) {
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

        Debug.Log(_u5+","+_u4+","+_u3+","+_u2+","+_u1+","+_o0+","+_o1+","+_o2+","+_o3+","+_o4+","+_o5);
        //99736,100201,100107,99676,100238,100700,99774,100459,99486,99623,0
    }
}
```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年02月XX日  
[[TOP](#TOP)]


<a name="日時情報"></a>
# <b>日時情報</b>

### 書式
```CSharp
DateTime ○ = DateTime.Now; //DateTimeは構造体
○.Year; //年（2017等）
○.Month; //月（1〜12）
○.Day; //日（1〜31）
○.DayOfYear; //元日から日数（1〜366）
○.DayOfWeek; //曜日（Sanday〜Saturday）
○.Hour; //時間（0〜23）
○.Minute; //分（0〜59）
○.Second; //秒（0〜59）
○.Millisecond; //ミリ秒（0〜999）
○.Ticks; //0001年1月1日00:00:00からの経過時間（ナノ秒）：但し精度は10ミリ秒
```

### 例文
```CSharp
// Main.cs
using UnityEngine;
using System; //DateTimeに必要

public class Main : MonoBehaviour {
    void Start () {
        DateTime _now = DateTime.Now;
        Debug.Log(_now); //2018/03/13 18:00:08
        Debug.Log(_now.Year); //2018
        Debug.Log(_now.Month); //3
        Debug.Log(_now.Day); //13
        Debug.Log(_now.DayOfYear); //72（元日からの日数）
        Debug.Log(_now.DayOfWeek); //Tuesday
        Debug.Log(_now.Hour); //18
        Debug.Log(_now.Minute); //0
        Debug.Log(_now.Second); //8
        Debug.Log(_now.Millisecond); //853
        Debug.Log(_now.Ticks); //636565608088534190（100ナノ秒単位）
        
        //"hh:mm:ss"で現在の時間を表示する方法
        string _h = (_now.Hour < 10) ? "0" + _now.Hour : _now.Hour.ToString();
        string _m = (_now.Minute < 10) ? "0" + _now.Minute : _now.Minute.ToString();
        string _s = (_now.Second < 10) ? "0" + _now.Second : _now.Second.ToString();
        Debug.Log(_h + ":" + _m + ":" + _s); //"18:00:08"
    }
}
```

### 万年カレンダー
```CSharp
// Main.cs
using UnityEngine;
using System; //DateTimeに必要

public class Main : MonoBehaviour {
	void Start() {
		Calender(2016,2); //2016年2月の場合
	}
	
	void Calender(int _year, int _month) {
		DateTime _dateTime = new DateTime(_year, _month, 1); //○年○月1日

		int _fistWeek = (int)_dateTime.DayOfWeek; //その日が何曜日か（0は日曜日）

		int _lastDay = DateTime.DaysInMonth(_year, _month); //月の最終日は何日か

		//各週を配列化〜各配列に値（日にち）を代入
		int[] _1week = new int[7], _2week = new int[7], _3week = new int[7];
		int[] _4week = new int[7], _5week = new int[7];

		int _count = 1; //代入する日にち

		//第1週
		for (int i=_fistWeek; i<_1week.Length; i++) {
			_1week[i] = _count++;
		}

		//第2週
		for (int i=0; i<_2week.Length; i++) {
			_2week[i] = _count++;
		}

		//第3週
		for (int i=0; i<_3week.Length; i++) {
			_3week[i] = _count++;
		}

		//第4週
		for (int i=0; i<_4week.Length; i++) {
			_4week[i] = _count++;
		}

		//第5週
		for (int i=0; i<_5week.Length; i++) {
			if (_count <= _lastDay) {
				_5week[i] = _count++;
			}
		}

		//結果＝カレンダー表示（うるう年に対応）
		Debug.Log("第1週");
		for (int i=0; i<=6; i++) { Debug.Log(_1week[i]);} // 0, 1, 2, 3, 4, 5, 6
		Debug.Log("第2週");
		for (int i=0; i<=6; i++) { Debug.Log(_2week[i]); } // 7, 8, 9,10,11,12,13
		Debug.Log("第3週");
		for (int i=0; i<=6; i++) { Debug.Log(_3week[i]); } //14,15,16,17,18,19,20
		Debug.Log("第4週");
		for (int i=0; i<=6; i++) { Debug.Log(_4week[i]); } //21,22,23,24,25,26,27
		Debug.Log("第5週");
		for (int i=0; i<=6; i++) { Debug.Log(_5week[i]); } //28,29, 0, 0, 0, 0, 0
	}
}
```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年02月XX日  
[[TOP](#TOP)]


<a name="タイマー"></a>
# <b>タイマー</b>

### 繰り返し実行する
* システムタイマー（System.Timers.Timer）を利用する方法
```CSharp
// Main.cs
using UnityEngine;
using System; //ElapsedEventHandlerに必要
using System.Timers; //System.Timers.Timerに必要

public class Main : MonoBehaviour {
    private static Timer _timer; //privateは省略可

    void Start () {
        _timer = new Timer(); //タイマーの生成
        _timer.Interval = 1000; //1000ミリ秒間隔
        _timer.Elapsed += new ElapsedEventHandler(Loop); //イベントハンドラの追加
        _timer.Start(); //開始
    }
    
    static void Loop(object arg1, EventArgs arg2) { //1000ミリ秒毎に実行される
        Debug.Log(arg1); //System.Timers.Timer（タイマー本体）
        Debug.Log(arg2); //System.Timers.ElapsedEventArgs（各種情報）
        //_timer.Stop(); //停止 ←この場合１回で停止
    }
}
```
* ほかに MonoBehaviour.[InvokeRepeating()](https://docs.unity3d.com/ja/current/ScriptReference/MonoBehaviour.InvokeRepeating.html) を使う方法もあり

### 〇秒後に一度だけ実行する
* コールチンを利用する場合
```CSharp
// Main.cs
using UnityEngine;
using System.Collections; //IEnumeratorに必要

public class Main : MonoBehaviour {
    void Start () {
        TimerStart(3f);
    }

    void TimerStart(float arg) { //メソッド名は任意
        StartCoroutine(TimerEnd(arg)); //引数無しの場合"TimerEnd"でもよい
    }

    IEnumerator TimerEnd(float arg) { //メソッド名は任意
        yield return new WaitForSeconds(arg);
        Debug.Log(arg + "秒後に実行");
    }
}
```
* ほかに MonoBehaviour.[Invoke()](https://github.com/mubirou/Unity/tree/master/examples#029-%E6%95%B0%E7%A7%92%E5%BE%8C%E3%81%AB%E3%83%A1%E3%82%BD%E3%83%83%E3%83%89%E3%82%92%E5%AE%9F%E8%A1%8C) を使う方法もあり

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年02月XX日  
[[TOP](#TOP)]


<a name="処理速度計測"></a>
# <b>処理速度計測</b>
* DateTime 構造体を利用します
* 他に Stopwatch クラスを利用する方法もありますが、その場合 UnityEngine と System.Diagnostics がバッティングする為に Debug.Log() が使えません

```CSharp
// Main.cs
using UnityEngine;
using System; //DateTimeに必要

public class Main : MonoBehaviour {
    void Start () {
        long _start = DateTime.Now.Ticks; //100ナノ秒単位（精度は10ミリ秒）
        for (long i=0; i<1000000000; i++) { //10億回繰り返す場合…
            //速度計測したい処理
        }
        Debug.Log(DateTime.Now.Ticks - _start); //19560350（≒2秒）
    }
}
```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年02月XX日  
[[TOP](#TOP)]


<a name="外部テキストの読み込み"></a>
# <b>外部テキストの読み込み</b>
* [Web サーバ](http://bit.ly/2mbzR4D)を稼働する必要はありません

### テキストファイルの用意
* sample.txt / UTF-8 として Project フォルダ内に保存
```
あいうえお
かきくけこ
さしすせそ
```

### 例文（StreamReader クラスを使う方法）
```CSharp
// Main.cs
using UnityEngine;
using System.IO; //StreamReaderに必要

public class Main : MonoBehaviour {
    void Start () {
        string _path = "sample.txt";
        //↓Shift-JISなどUTF-8以外の場合、第2引数で指定します。
        StreamReader _stream = new StreamReader(_path); //.txt以外も可能
        string _string = _stream.ReadToEnd(); //全ての内容を読み込む
        _stream.Close(); //閉じる
        Debug.Log(_string); //結果を出力
    }
}
```

###  例文（File.OpenTextメソッドを使う方法）
```CSharp
// Main.cs
using UnityEngine;
using System.IO; //StreamReaderに必要

public class Main : MonoBehaviour {
    void Start () {
        string _path = "sample.txt";
        StreamReader _stream = File.OpenText(_path); //.txt以外も可能（UFT-8限定）
        string _string = _stream.ReadToEnd(); //全ての内容を読み込む
        _stream.Close(); //閉じる
        Debug.Log(_string); //結果を出力
    }
}
```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年02月XX日  
[[TOP](#TOP)]