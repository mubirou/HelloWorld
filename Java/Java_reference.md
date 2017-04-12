### <b>この項目は書きかけの項目です</b>

# <b>Java 基礎文法</b>

### <b>INDEX</b>

* Hello,world! （[Linux](https://github.com/TakashiNishimura/HelloWorld/blob/master/Java/Jav_alinux.md) / [macOS](https://github.com/TakashiNishimura/HelloWorld/blob/master/Java/Jav_amac.md) / [Windows](https://github.com/TakashiNishimura/HelloWorld/blob/master/Java/Jav_awin.md)）
* [データ型](#データ型)
* [データ型の操作](#データ型の操作)
* [クラス](#クラス)
* [スーパークラスとサブクラス](#スーパークラスとサブクラス)
* [名前空間（パッケージ）](#名前空間（パッケージ）)
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
***
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
1. 論理型（boolean 型）
1. 整数型（byte 型 : -128〜127）
1. 整数型（short 型 : -32768〜32767）
1. 整数型（int 型 : -2147493649〜2147493647）
1. 整数型（long 型 : -9223372036854775808〜9223372036854775807）
1. 浮動小数点数型（float 型 : 小数点第7位までの値）
1. 浮動小数点数型（double 型 : 小数点第15位までの値）
1. 文字型（char 型）
1. 文字列型（String 型: プリミティブ型ではなく String クラスのオブジェクト）
1. 列挙型（enum）
1. クラス
1. 配列
1. リスト（LinkedList 他）
1. セット（TreeSet 他）
1. マップ（HashMap 他）

### 例文
```
//Main.java
public class Main { //publicは省略可
    public static void main(String[] args) { //決め打ち
        //①論理型（boolean型）
        boolean _bool = true; //プリミティブ型
        System.out.println(_bool); //true
        Boolean _bool2 = new Boolean(true); //オブジェクト型
        System.out.println(_bool2.getClass()); //class java.lang.Boolean

        //②整数型（byte型 -128〜127）
        byte _byte = 127;
        System.out.println(_byte); //127

        //③整数型（short型 -32768〜32767）
        short _short = 32767;
        System.out.println(_short); //32767

        //④整数型（int型 -2147493649〜2147493647）
        int _int = 2147493647; //プリミティブ型
        System.out.println(_int); //2147493647
        Integer _int2 = new Integer(100); //オブジェクト型
        System.out.println(_int2.getClass()); //class java.lang.Integer

        //⑤整数型（long型 -9223372036854775808〜9223372036854775807）
        long _long = 9223372036854775807L; //最後にLかl
        System.out.println(_long); //9223372036854775807

        //⑥浮動小数点数型（float型 小数点第7位までの値）
        float _float = 3.14159265358979323846264338327950F; //最後にFかf
        System.out.println(_float); //3.1415927（小数点第7位までの値）

        //⑦浮動小数点数型（double型 小数点第15位までの値）
        double _double = 3.14159265358979323846264338327950; //プリミティブ型
        System.out.println(_double); //3.141592653589793（小数点第15位までの値）
        Double _double2 = new Double(3.14159265358979323846264338327950); //オブジェクト型
        System.out.println(_double2.getClass()); //class java.lang.Double

        //⑧文字型（char型）
        char _char = 'a'; //シングルクォーテーションで囲む
        System.out.println(_char); //a

        //⑨文字列型（String型）＝プリミティブ型ではなくStringクラスのオブジェクト
        String _string = "999"; //new String("999")でも同じ ←オブジェクト型
        System.out.println(_string); //999
        System.out.println(_string.getClass()); //class java.lang.String

        //⑩列挙型（enum）
        System.out.println(Signal.BLUE); //BLUE
        System.out.println(Signal.BLUE.getClass()); //class Signal

        //⑪クラス
        MyClass _myClass = new MyClass();
        System.out.println(_myClass); //MyClass@6bc7c054
        System.out.println(_myClass.getClass()); //class MyClass

        //⑫配列
        int[] _array = new int[4]; //4個の空の要素を持つ配列の場合
        System.out.println(_array); //[I@232204a1
        System.out.println(_array.getClass()); //class [I

        //⑬リスト（LinkedList他）
        java.util.LinkedList<String> _list = new java.util.LinkedList<String>();
        System.out.println(_list); //[]
        System.out.println(_list.getClass()); //class java.util.LinkedList

        //⑭セット（TreeSet他）
        java.util.Set<String> _set = new java.util.HashSet<String>();
        System.out.println(_set); //[]
        System.out.println(_set.getClass()); //class java.util.HashSet

        //⑮マップ（HashMap他）
        java.util.Map<String, Integer> _map 
        = new java.util.HashMap<String, Integer>();
        System.out.println(_map); //{}
        System.out.println(_map.getClass()); //class java.util.HashMap
    }
}

enum Signal { BLUE,YELLOW,RED } //⑩列挙型の定義
class MyClass {} //⑪クラスの定義
```

実行環境：Ubuntu 16.04 LTS、Java SE 8 Update 121  
作成者：Takashi Nishimura  
作成日：2016年07月13日  
更新日：2017年04月12日


<a name="データ型の操作"></a>
# <b>データ型の操作</b>

### データ型の調べ方
1. オブジェクト.getClass()
    * プリミティブ型の場合エラー（注意）
    ```
    //Main.java
    public class Main { //publicは省略可
        public static void main(String[] args) { //決め打ち
            Class _class = new MyClass().getClass();
            System.out.println(_class); //=> class MyClass
            System.out.println(new Integer(99).getClass()); //=>class java.lang.Integer
        }
    }
    class MyClass {}
    ```

1. オブジェクト.getClass().getName()
    ```
    //Main.java
    public class Main { //publicは省略可
        public static void main(String[] args) { //決め打ち
            String _string = new MyClass().getClass().getName();
            System.out.println(_string); //=> "MyClass"
        }
    }
    class MyClass {}
    ```

1. instanceof演算子
    * プリミティブ型の場合エラー（注意）、さかのぼってチェック可
    ```
    //Main.java
    public class Main { //publicは省略可
        public static void main(String[] args) { //決め打ち
            SubClass _subClass = new SubClass();
            System.out.println(_subClass instanceof SuperClass); //=> true
            System.out.println(_subClass instanceof ISubClass); //=> true
            SubSubClass _subSubClass = new SubSubClass();
            System.out.println(_subSubClass instanceof SuperClass); //=> true
            System.out.println(new Integer(99) instanceof Integer); //=> true
        }
    }
    interface ISubClass {} //インターフェース
    class SuperClass {} //スーパークラス
    class SubClass extends SuperClass implements ISubClass {} //サブクラス
    class SubSubClass extends SubClass {} //サブクラスを継承
    ```

### データ型のキャスト
1. 数値↔boolean型
    ```
    //Main.java
    public class Main { //publicは省略可
        public static void main(String[] args) { //決め打ち
            //数値→bool型へ変換
            int _int = 0;
            boolean _bool = _int != 0; //0をfalseに変換（0以外はtrueに変換）
            System.out.println(_bool); //=> false

            //bool型→数値へ変換
            boolean _bool2 = true;
            int _int2 = (_bool2) ? 1 : 0; //三項演算子を活用
            System.out.println(_int2); //=> 1
        }
    }
    ```

1. 数値↔数値（縮小変換）
    ```
    //Main.java
    public class Main { //publicは省略可
        public static void main(String[] args) { //決め打ち
            //整数の場合
            long _long = 2147493649L; //intは-2147493649〜2147493647
            int _int = (int)_long; //long型→int型へ変換
            System.out.println(_int); //=> -2147493649 ←元のデータが失われる

            //浮動小数点数の場合
            double _double = 3.141592653589793;
            float _float = (float)_double;
            System.out.println(_float); //=> 3.1415927 ←データの一部が失われる
        }
    }
    ```

1. 数値↔数値（拡張変換）
    ```
    //Main.java
    public class Main { //publicは省略可
        public static void main(String[] args) { //決め打ち
            int _int = 2147493647; //intは-2147493649〜2147493647
            long _long = (long)_int + 1; //int型→long型へ変換
            System.out.println(_long); //=> 2147493649
        }
    }
    ```

1. 数値↔string型
    ```
    //Main.java
    public class Main { //publicは省略可
        public static void main(String[] args) { //決め打ち
            //string型→数値
            String _string = "001";
            int _int = Integer.parseInt(_string); //"001"（String型）→1（int型）に変換
            System.out.println(_int); //1

            //数値→string型
            int _int2 = 100;
            String _string2 = String.valueOf(_int2); //100（int型）→"100"（String）に変換
            System.out.println(_string2); //=> "100"
            System.out.println(_string2.getClass()); //=> class java.lang.String
            //↑プリミティブ型ではなくStringクラスのオブジェクトなので.getClass()が使える
        }
    }
    ```

実行環境：Ubuntu 16.04 LTS、Java SE 8 Update 121  
作成者：Takashi Nishimura  
作成日：2016年07月14日  
更新日：2017年04月12日


<a name="クラス"></a>
# <b>クラス</b>

```
//Main.java
public class Main { //メインクラス（publicは省略可）
    public static void main(String[] args) { //決め打ち（自動的に最初に実行）
        //①インタンスの生成
        Rectangle _rectangle = new Rectangle(); 

        //②フィールドの更新
        _rectangle.setWidth(1920);
        _rectangle.setHeight(1080);

        //③フィールドの取得
        System.out.println(_rectangle.getWidth()); //=> 1920
        System.out.println(_rectangle.getHeight()); //=> 1080

        //④メソッドの実行
        System.out.println(_rectangle.getArea()); //=> 2073600
    }
}

class Rectangle { //長方形クラス
    //フィールド（プロパティ）の宣言（初期値の設定も可）
    private int _width = 0; //アクセス修飾子を除くと同じパッケージ内でアクセス可に...
    private int _height = 0;

    public Rectangle() {} //コンストラクタ（戻り値は指定しない／ここで初期化も可）

    //メソッドの定義（thisは省略可）↓専用のget/setアクセサは用意されていません
    public int getWidth() { return this._width; } //_widthのgetter
    public void setWidth(int w) { this._width = w; } //_widthのsetter

    public int getHeight() { return this._height; } //_heightのgetter
    public void setHeight(int h) { this._height = h; } //_heightのsetter
    
    public int getArea() { //面積を計算して値を返す
        return this._width * this._height;
    }
}
```

実行環境：Ubuntu 16.04 LTS、Java SE 8 Update 121  
作成者：Takashi Nishimura  
作成日：2016年07月14日  
更新日：2017年04月12日


<a name="スーパークラスとサブクラス"></a>
# <b>スーパークラスとサブクラス</b>

```
//Main.java
public class Main { //メインクラス（publicは省略可）
    public static void main(String[] args) { //決め打ち（自動的に最初に実行）
        SubClassA _subclassA = new SubClassA(); //サブクラスＡのインスタンスの生成
        System.out.println(_subclassA.getFieldS()); //=> "スーパークラスのフィールド"
        System.out.println(_subclassA.getFieldA()); //=> "サブクラスＡのフィールド"
        System.out.println(_subclassA.methodS()); //=> "スーパークラスのメソッド"
        System.out.println(_subclassA.methodA()); //=> "サブクラスＡのメソッド"
        SubClassB _subclassB = new SubClassB(); //サブクラスＢのインスタンスの生成
        System.out.println(_subclassB.getFieldS()); //=> "スーパークラスのフィールド"
        System.out.println(_subclassB.getFieldB()); //=> "サブクラスＢのプロパティ"
        System.out.println(_subclassB.methodS()); //=> "スーパークラスのメソッド"
        System.out.println(_subclassB.methodB()); //=> "サブクラスＢのメソッド"
    }
}

//スーパークラス
class SuperClass { 
    private String _fieldS = "スーパークラスのフィールド"; //①フィールドの定義
    public String getFieldS() { return _fieldS; } //②アクセサ（getter）※thisは省略
    public String methodS() { return "スーパークラスのメソッド"; } //③メソッド
}

//サブクラスＡ（スーパークラス継承）※多重継承不可
class SubClassA extends SuperClass {
    private String _fieldA = "サブクラスＡのフィールド"; //①フィールド
    public String getFieldA() { return _fieldA; } //②アクセサ（getter）※thisは省略
    public String methodA() { return "サブクラスＡのメソッド";    } //③メソッド
}

//サブクラスＢ（スーパークラス継承）※多重継承不可
class SubClassB extends SuperClass { 
    private String _fieldB = "サブクラスＢのフィールド"; //①フィールド
    public String getFieldB() { return _fieldB; } //②アクセサ（getter）※thisは省略
    public String methodB() { return "サブクラスＢのメソッド"; } //③メソッド
}
```

実行環境：Ubuntu 16.04 LTS、Java SE 8 Update 121  
作成者：Takashi Nishimura  
作成日：2016年07月14日  
更新日：2017年04月12日


<a name="名前空間（パッケージ）"></a>
# <b>名前空間（パッケージ）</b>

### 概要
* ここでいう名前空間とはパッケージを指す
* 物理的なフォルダ単位で管理する
* 一般的にパッケージ名はドメインを逆にしたものを使用

### クラス作成とパッケージ宣言
* Main.java と同階層に jp/xxx/ フォルダを作成しその中に次のファイルを作成
```
//MyClass.java
package jp.xxx;
public class MyClass {
    private float _version = 0.9F;
    public MyClass() { //コンストラクタ
        System.out.println("MyClassが生成されました");
    }
    public float getVersion() {
        return _version;
    } 
}
```

### コンパイル
1. Main.java ファイルがあるディレクトリに移動  
    $ cd /home/（ユーザー名）/デスクトップ/ ←デスクトップ上にある場合

1. コンパイル  
    $ javac jp/xxx/MyClass.java  
    ※MyClass.<b>class</b>が生成される

### メインクラスの記述
```
//Main.java
import jp.xxx.MyClass;
public class Main { //public は省略可
    public static void main(String[] args) { //決め打ち(自動的に実行)
        MyClass _MyClass = new MyClass(); //=> "MyClassが生成されました"
        System.out.println(_MyClass.getVersion()); //=> 0.9
    }
}
```

実行環境：Ubuntu 16.04 LTS、Java SE 8 Update 121  
作成者：Takashi Nishimura  
作成日：2016年07月19日  
更新日：2017年04月12日


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

実行環境：Ubuntu 16.04 LTS、Java SE 8 Update 121  
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

実行環境：Ubuntu 16.04 LTS、Java SE 8 Update 121  
作成者：Takashi Nishimura  
作成日：2016年07月14日  
更新日：2017年04月12日


<a name="アクセサ"></a>
# <b>アクセサ （getter / setter）</b>

### 概要
オブジェクト指向プログラミングの「他人の変数を勝手にいじってはいけない」というルールに則り、メンバ変数は private 変数とし、外部からはメソッドを使ってアクセスします。Java には他の多くの言語にある専用のアクセサが用意されていません。そこで、get○○()、set○○(型,引数) といった記述をして同じ機能を実現します。

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

実行環境：Ubuntu 16.04 LTS、Java SE 8 Update 121  
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

実行環境：Ubuntu 16.04 LTS、Java SE 8 Update 121  
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
    ………
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

実行環境：Ubuntu 16.04 LTS、Java SE 8 Update 121  
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

### アクセス修飾子】※省略すると同じパッケージ内からのみアクセス可能…とのこと。
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
    public int tashizan(int start_, int end_) {
        int _result = 0; //ローカル変数
        for (int i = start_; i <= end_; i++) {
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
            ……
        }
        ……
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

実行環境：Ubuntu 16.04 LTS、Java SE 8 Update 121  
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

実行環境：Ubuntu 16.04 LTS、Java SE 8 Update 121  
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
    ……
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

実行環境：Ubuntu 16.04 LTS、Java SE 8 Update 121  
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

実行環境：Ubuntu 16.04 LTS、Java SE 8 Update 121  
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

実行環境：Ubuntu 16.04 LTS、Java SE 8 Update 121  
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

実行環境：Ubuntu 16.04 LTS、Java SE 8 Update 121  
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

実行環境：Ubuntu 16.04 LTS、Java SE 8 Update 121  
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

実行環境：Ubuntu 16.04 LTS、Java SE 8 Update 121  
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

実行環境：Ubuntu 16.04 LTS、Java SE 8 Update 121  
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

実行環境：Ubuntu 16.04 LTS、Java SE 8 Update 121  
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
List<String> result_ = _list.subList(2,4); //2番目から3番目まで抽出
List<String> result_ = _list.subList(1,_list.size()); //1番目〜最後を抽出
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
        String[] array_ = _string.split(","); //②文字列→配列に変換（「配列」参照）
        LinkedList<String> _list = new LinkedList<>(); //③空のLinkedListを作成
        for (String _value : array_) {
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

実行環境：Ubuntu 16.04 LTS、Java SE 8 Update 121  
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

実行環境：Ubuntu 16.04 LTS、Java SE 8 Update 121  
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

実行環境：Ubuntu 16.04 LTS、Java SE 8 Update 121  
作成者：Takashi Nishimura  
作成日：2016年07月17日  
更新日：2017年04月12日


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
                    this.__mousedown_im_agemethod(_e);
                }

                //Image用イベントハンドラの定義
                this.__image.addEventListener("mousedown", this.__mousedown_image, false);
            }

            //MyClass.__mousedown_image（アロー関数）からの呼出し
            __mousedown_im_agemethod(_mouseEvent) {
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

実行環境：Ubuntu 16.04 LTS、Java SE 8 Update 121  
作成者：Takashi Nishimura  
作成日：2016年09月28日  
更新日：2017年03月22日


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
        console.log(_num); //2,10 ←"CD"が見つかった場所（0から開始）を返す
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

実行環境：Ubuntu 16.04 LTS、Java SE 8 Update 121  
作成者：Takashi Nishimura  
作成日：2016年09月28日  
更新日：2017年03月22日


<a name="正規表現"></a>
# <b>正規表現</b>

* ECMAScript 6 には以下のサンプル以外にも多くの正規表現の機能が用意されています

### 検索＆置換
```
<script>
    var _string = "吉田松蔭,高杉晋作,久坂玄瑞,吉田稔麿,伊藤博文";
    var _regExp = new RegExp("吉田", "g"); //第2引数を省略すると全てを置換（"g"と同等）
    /*
    "^○○$"のように「^（行頭マッチ）」「$（行末マッチ）」といったメタ文字の他、様々なパターン、例えば "[A-D]\d+" など...を使うことでより細かな制御が可能
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

### 正規表現について...
* 文字パータンを表現するオブジェクト（RegExp クラス）のこと
* JavaScriptの正規表現は、ECMAScript 3 で標準化された
* String と RegExp クラスには、次のような正規表現用のメソッドが用意されている
    1. RegExp.exec()
    1. RegExp.test()
    1. String.search()
    1. String.match()
    1. String.replace()
    1. String.split()

実行環境：Ubuntu 16.04 LTS、Java SE 8 Update 121  
作成者：Takashi Nishimura  
作成日：2016年09月28日  
更新日：2017年03月22日


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

実行環境：Ubuntu 16.04 LTS、Java SE 8 Update 121  
作成者：Takashi Nishimura  
作成日：2016年09月29日  
更新日：2017年03月22日


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

実行環境：Ubuntu 16.04 LTS、Java SE 8 Update 121  
作成者：Takashi Nishimura  
作成日：2016年09月29日  
更新日：2017年03月22日


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

実行環境：Ubuntu 16.04 LTS、Java SE 8 Update 121  
作成者：Takashi Nishimura  
作成日：2016年09月29日  
更新日：2017年03月22日


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
                this.__dieHandler(this); //"die"イベントの発生（リスナー関数の呼出し）
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

実行環境：Ubuntu 16.04 LTS、Java SE 8 Update 121  
作成者：Takashi Nishimura  
作成日：2016年09月29日  
更新日：2017年03月22日


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
    console.log(Math.cos(Math.PI * 2)); //1 ←360°
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

実行環境：Ubuntu 16.04 LTS、Java SE 8 Update 121  
作成者：Takashi Nishimura  
作成日：2016年09月29日  
更新日：2017年03月22日

<a name="乱数"></a>
# <b>乱数</b>

### Math.random()
* 0以上、1未満（0.9999...）の値を返す
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
    //909595 908581 908332 909493 907921 908880 909161 909607 909295 910453 908692
</script>
```

実行環境：Ubuntu 16.04 LTS、Java SE 8 Update 121  
作成者：Takashi Nishimura  
作成日：2016年09月30日  
更新日：2017年03月22日


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

実行環境：Ubuntu 16.04 LTS、Java SE 8 Update 121  
作成者：Takashi Nishimura  
作成日：2016年09月30日  
更新日：2017年03月22日


<a name="タイマー"></a>
# <b>タイマー</b>

### 繰返し実行する
```
<script>
    _count = 0;
    callbackFunction = () => {
        if (++_count <= 10) { //10回繰返す場合...
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

実行環境：Ubuntu 16.04 LTS、Java SE 8 Update 121  
作成者：Takashi Nishimura  
作成日：2016年09月30日  
更新日：2017年03月22日


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

実行環境：Ubuntu 16.04 LTS、Java SE 8 Update 121  
作成日：2016年09月30日  
更新日：2017年03月22日



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

実行環境：Ubuntu 16.04 LTS、Java SE 8 Update 121  
作成者：Takashi Nishimura  
作成日：2016年09月30日  
更新日：2017年03月22日