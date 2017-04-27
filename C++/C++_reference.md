### <b>この項目は書きかけの項目です</b>

# <b>C++ 基礎文法</b>

### <b>INDEX</b>

* Hello,world! （[Linux](https://github.com/TakashiNishimura/HelloWorld/blob/master/C%2B%2B/C%2B%2B_linux.md) / [macOS](https://github.com/TakashiNishimura/HelloWorld/blob/master/C%2B%2B/C%2B%2B_mac.md) / [Windows](https://github.com/TakashiNishimura/HelloWorld/blob/master/C%2B%2B/C%2B%2B_win.md)）
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
* [関数](#関数)
* [匿名関数（ラムダ式）](#匿名関数（ラムダ式）)
* [静的メンバ（static）](#静的メンバ（static）)
* [if 文](#if文)
* [三項演算子](#三項演算子)
* [switch 文](#switch文)
* [for 文](#for文)
* [foreach 文](#foreach文)
* [while 文](#while文)
* [配列](#配列)
* [動的配列（vector）](#動的配列（vector）)
***
* [連想配列（map）](#連想配列（map）)
* [this](#this)
* [文字列の操作](#文字列の操作)
* [正規表現](#正規表現)
* [インターフェース](#インターフェース)
* [抽象クラス（abstract）](#抽象クラス（abstract）)
* [base キーワード](#baseキーワード)
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
    * unsigned short 型 : 0〜65535（16bit）←約6万
    * short int 型 : -32768〜32767（16bit）←約±3万
    * unsigned int 型 : 0〜4294967295（32bit）←約40億
    * int 型 : -2147483648〜2147483647（32bit）←約±20億／16進数（0xFFCC00等）も可／初期値

* 浮動小数点数型
    * float 型 : 有効数字7桁
    * double 型 : 有効数字15桁 ←初期値

* 文字型
    * char 型 : 1文字（シングルクォーテーションで囲む）
    * string 型 : 2文字以上（ダブルクォーテーションで囲む）

上記の他に以下のデータ型などもあり
* 列挙型（enum） : 内部的には0、1、2...（int型）で処理 
* 構造体（struct） : 継承が出来ない、クラスに似たもの
* クラス（class） : classを使った参照型（データそのものではなくアドレスを保持）

### 検証
```
//test.cpp
#include <iostream> //coutに必要
#include <typeinfo> //typeid()に必要
using namespace std;
class MyClass {}; //前方宣言が必要
int main() {
    //===================
    // 論理型（bool型）
    //===================
    bool _bool = true;
    cout << _bool << "\n"; //1
    cout << typeid(_bool).name() << "\n"; //b（bool）
    //===============
    // 整数型
    //===============
    // ①unsigned short型（0〜65,535）
    unsigned short int _uShortInt = 65535;
    cout << _uShortInt << "\n"; //65535
    cout << typeid(_uShortInt).name() << "\n"; //t（unsigned short int）
    
    // ②short int型（-32,768〜32,767）
    short int _shortInt = -32768;
    cout << _shortInt << "\n"; //-32768
    cout << typeid(_shortInt).name() << "\n"; //s（short int）
    
    // ③unsigned int型（0〜4,294,967,295）
    unsigned int _uInt = 4294967295;
    cout << _uInt << "\n"; //4294967295
    cout << typeid(_uInt).name() << "\n"; //j（unsigned int）
    
    // ④int型（-2,147,483,648〜2,147,483,647）
    int _int = -2147483648;
    cout << _int << "\n"; //-2147483648
    cout << typeid(_int).name() << "\n"; //i（int）
    
    int _int16 = 0xFFCC00; //16進数の場合
    cout << _int16 << "\n"; //16763904
    cout << typeid(_int16).name() << "\n"; //i（int）
    
    //================
    // 浮動小数点数型
    //================
    // ①float型（有効数字7桁）
    float _float = 3.14159265358979323846264338327950288;
    cout << _float << "\n"; //3.14159
    cout << typeid(_float).name() << "\n"; //f（float）
    
    // ②double型（有効数字15桁）
    double _double = 3.14159265358979323846264338327950288;
    cout << _double << "\n"; //3.14159
    cout << typeid(_double).name() << "\n"; //d（double）
    
    //================
    // 文字型
    //================
    // ①char型（1文字）
    char _char = 'a';
    cout << _char << "\n"; //a
    cout << typeid(_char).name() << "\n"; //c（char）
    
    // ②string型（2文字以上）
    string _string = "999";
    cout << _string << "\n"; //999
    cout << typeid(_string).name() << "\n"; //NSt7__cxx1112...

    //================
    // その他
    //================
    //列挙型（enum）
    enum ABC {AAA=1, BBB=2, CCC=3}; //列挙の定義（関数の外で定義可）
    ABC _bbb = BBB; //列挙以外の値だとエラー
    cout << _bbb << "\n"; //2（値を省略すると0から始まる順番が返る）
    
    //構造体型（注意：private/publicを省略した場合public扱い）
    struct Name { //定義は先に記述する必要あり（関数の外で定義可）
        string romaji;
        string kanji;
    };
    Name _taro = {"TARO", "太郎"};
    Name _hanako = {"HANAKO", "花子"};
    cout << _taro.romaji << "\n" << _taro.kanji << "\n";
    cout << _hanako.romaji << "\n" << _hanako.kanji << "\n";
    
    //クラス
    MyClass _myClass; //MyClassのオブジェクトを生成
    cout << typeid(_myClass).name() << "\n"; //7MyClass
    
    //配列
    int _array[4]; //4個の空の要素を持つ配列の場合
    cout << _array << "\n"; //0x7fff9849e280
    cout << typeid(_array).name() << "\n"; //A4_i
 
    return 0;
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2016年05月12日  
更新日：2017年04月24日


<a name="データ型の操作"></a>
# <b>データ型の操作</b>

### データ型の調べ方 : typeid()
```
//test.cpp
#include <iostream> //coutに必要
#include <typeinfo>  //typeid()に必要
using namespace std;
class MyClass {}; //前方宣言が必要

int main() {
    cout << typeid(true).name() << "\n"; //b（bool）
    cout << typeid(100).name() << "\n"; //i（int）
    cout << typeid(2147483648).name() << "\n"; //l（long int）
    cout << typeid(0.1).name() << "\n"; //d（double）
    cout << typeid('1').name() << "\n"; //c（char）
    cout << typeid("1").name() << "\n"; //A2_c ←string
    MyClass _myClass;
    cout << typeid(_myClass).name() << "\n"; //7MyClass
    return 0;
}
```

### データ型のキャスト
1. 数値→bool型へ変換
    ```
    //test.cpp
    #include <iostream> //coutに必要
    #include <typeinfo>  //typeid()に必要
    using namespace std;
    int main() {
        bool _tmp = (bool)1;
        cout << _tmp << "\n"; //1
        cout << typeid(_tmp).name() << "\n"; //b（bool）
        return 0;
    }
    ```

1. bool型→数値へ変換
    ```
    //test.cpp
    #include <iostream> //coutに必要
    #include <typeinfo>  //typeid()に必要
    using namespace std;
    int main() {
        int _tmp = (int)true;
        cout << _tmp << "\n"; //1（falseの場合0）
        cout << typeid(_tmp).name() << "\n"; //i（int）
        return 0;
    }
    ```

1. 数値→数値（整数の縮小変換）
    ```
    //test.cpp
    #include <iostream> //coutに必要
    #include <typeinfo>  //typeid()に必要
    using namespace std;
    int main() {
        int _tmp = 3350000; //intは-2,147,483,648〜2,147,483,647
        short int _tmp2= (short int)_tmp;
        cout << _tmp2 << "\n"; //776 ←元のデータが失われる
    }
    ```

1. 数値→数値（浮動小数点数の縮小変換）
    ```
    //test.cpp
    #include <iostream> //coutに必要
    #include <typeinfo>  //typeid()に必要
    using namespace std;
    int main() {
        double _double = 3.14159265358979323846264338327950288;
        float _float = (float)_double;
        cout << _float << "\n"; //3.14159 ←元のデータが失われる
    }
    ```

1. 数値↔数値（拡張変換）
    ```
    //test.cpp
    #include <iostream> //coutに必要
    #include <typeinfo>  //typeid()に必要
    using namespace std;
    int main() {
        short int _tmp = 32767; //short int型は-32,768〜32,767
        int _tmp2 = (int)_tmp + 1; //short int型→int型へ変換
        cout << _tmp2 << "\n"; //32768
        cout << typeid(_tmp2).name() << "\n"; //i（int）
    }
    ```

1. string型→数値
    ```
    //test.cpp
    #include <iostream> //coutに必要
    #include <typeinfo> //typeid()に必要
    #include <cstdlib> //atoiに必要
    using namespace std;

    int main() {
        string _tmp = "001";
        int _tmp2 = atoi(_tmp.c_str()); //string型→int型に変換
        cout << _tmp2 << "\n"; //1
        cout << typeid(_tmp2).name() << "\n"; //i（int）
        return 0;
    }
    ```

1. 数値→string型
    ```
    //test.cpp
    #include <iostream> //coutに必要
    #include <typeinfo> //typeid()に必要
    #include <sstream> //ostringstreamに必要
    using namespace std;

    int main() {
        int _tmp = 100;
        ostringstream _stream;
        _stream << _tmp;
        string _tmp2 = _stream.str();
        cout << _tmp2 << "\n"; //"100"
        cout << typeid(_tmp2).name() << "\n"; //NSt7__cxx1112basic…
        return 0;
    }
    ```


実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2016年05月12日  
更新日：2017年04月25日


<a name="クラス"></a>
# <b>クラス</b>

```
//test.cpp
#include <iostream> //coutに必要
using namespace std;

//==============
// 長方形クラス
//==============
class Rectangle { //長方形クラスの「宣言」
    private: //省略可能
        int _width; //メンバ変数（＝プロパティ）
        int _height; //メンバ変数
    
    public:
        Rectangle(); //引数なしのコンストラクタ
        Rectangle(int _w, int _h); //引数ありのコンストラクタ
        
        //_widthのアクセス用メンバ関数（＝メソッド）
        int Width(); //getter
        void Width(int _w); //setter
        
        //_heightのアクセス用メンバ関数
        int Height(); //getter
        void Height(int _h); //setter
        
        //面積の計算用のメンバ関数
        int GetArea();  
};

//コンストラクタ（引数なし）
Rectangle::Rectangle() {
    _width = 0;
    _height = 0;
}

//コンストラクタ（引数あり）
Rectangle::Rectangle(int _w, int _h) {
    _width = _w;
    _height = _h;
}

//_widthのアクセス用メンバ関数
int Rectangle::Width() { //getter
    return _width;
}
void Rectangle::Width(int _w) { //setter
    _width = _w;
}

//_heightのアクセス用メンバ関数
int Rectangle::Height() { //getter
    return _height;
}
void Rectangle::Height(int _h) { //setter
    _height = _h;
}

//面積の計算用のメンバ関数
int Rectangle::GetArea() {
    return _width * _height;
} 


//============
// メイン関数
//============
int main() { //注意：利用するクラスは前方宣言が必要
    //①インスタンスの生成
    Rectangle _rectangle(640,480); //引数なしも可
    // Rectangle _rectangle; //注意：引数なしの場合()はいらない
    
    cout << _rectangle.Width() << "\n"; //640
    cout << _rectangle.Height() << "\n"; //480
    
    //②メンバ変数の更新
    _rectangle.Width(1920);
    _rectangle.Height(1080);
    
    //③メンバ変数の取得
    cout << _rectangle.Width() << "\n"; //1920
    cout << _rectangle.Height() << "\n"; //1080
    
    //④メンバ関数の実行
    cout << _rectangle.GetArea() << "\n"; //2073600
    
    return 0;
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2016年05月12日  
更新日：2017年04月26日


<a name="基本クラスと派生クラス"></a>
# <b>基本クラスと派生クラス</b>

### 概要
1. 呼び名
    * 基本クラス ≒ 基底クラス、スーパークラス、親クラス
    * 派生クラス ≒ サブクラス、子クラス
    * メンバ変数 ≒ プロパティ
    * メンバ関数 ≒ メソッド

1. 多重継承（複数の基本クラスを継承する）が可能
    ```
    //多重継承の構文
    class 派生クラス : アクセス指定子 基本クラスA, アクセス指定子 基本クラスB,… {
    ……
    }
    ```
    * 複数の基本クラスで同じメンバ関数を持つ場合、以下の方法でそれぞれのメンバ関数にアクセス可能
    ```
    _subclass.SuperClassA::mSuperClass();
    ```

### 例文
```
//Test.cpp
#include <iostream> //coutに必要
using namespace std;

//=============================
// 基本クラス（スーパークラス）
//=============================
class SuperClass { //基本クラスの「宣言」
    private: //省略可能
        string _vSuperClass; //メンバ変数（プロパティ）の「宣言」
    public:
        SuperClass(); //コンストラクタの「宣言」
        string vSuperClass(); //メンバ変数（プロパティ）のgetter
        string mSuperClass(); //メンバ関数（メソッド）の「宣言」
};

//コンストラクタの「定義」
SuperClass::SuperClass() {
    _vSuperClass = "基本クラスのメンバ変数";
}

//getterの「定義」
string SuperClass::vSuperClass() {
    return _vSuperClass; //getter
}

//メンバ関数（メソッド）の「定義」
string SuperClass::mSuperClass() {
    return "基本クラスのメンバ関数";
}

//============================
// 派生クラスA（サブクラスA）
//============================
class SubClassA : public SuperClass { //派生クラスAの「宣言」
    private: //省略可能
        string _vSubClassA; //メンバ変数（プロパティ）の「宣言」
    public:
        SubClassA(); //コンストラクタの「宣言」
        string vSubClassA(); //メンバ変数（プロパティ）のgetter
        string mSubClassA(); //メンバ関数（メソッド）の「宣言」
};

//コンストラクタの「定義」
SubClassA::SubClassA() {
    _vSubClassA = "派生クラスAのメンバ変数";
}

//getterの「定義」
string SubClassA::vSubClassA() {
    return _vSubClassA; //getter
}

//メンバ関数（メソッド）の「定義」
string SubClassA::mSubClassA() {
    return "派生クラスAのメンバ関数";
}

//============================
// 派生クラスB（サブクラスB）
//============================
class SubClassB : public SuperClass { //派生クラスBの「宣言」
    private: //省略可能
        string _vSubClassB; //メンバ変数（プロパティ）の「宣言」
    public:
        SubClassB(); //コンストラクタの「宣言」
        string vSubClassB(); //メンバ変数（プロパティ）のgetter
        string mSubClassB(); //メンバ関数（メソッド）の「宣言」
};

//コンストラクタの「定義」
SubClassB::SubClassB() {
    _vSubClassB = "派生クラスBのメンバ変数";
}

//getterの「定義」
string SubClassB::vSubClassB() {
    return _vSubClassB; //getter
}

//メンバ関数（メソッド）の「定義」
string SubClassB::mSubClassB() {
    return "派生クラスBのメンバ関数";
}

//============
// メイン関数
//============
int main() {
    //派生クラスA
    SubClassA _subclassA; //インスタンスの生成
    cout << _subclassA.vSuperClass() << "\n"; //基本クラスのメンバ変数
    cout << _subclassA.mSuperClass() << "\n"; //基本クラスのメンバ関数
    cout << _subclassA.vSubClassA() << "\n"; //派生クラスAのメンバ変数
    cout << _subclassA.mSubClassA() << "\n"; //派生クラスAのメンバ関数
    
    //派生クラスB
    SubClassB _subclassB; //インステンスの生成
    cout << _subclassB.vSuperClass() << "\n"; //基本クラスのメンバ変数
    cout << _subclassB.mSuperClass() << "\n"; //基本クラスのメンバ関数
    cout << _subclassB.vSubClassB() << "\n"; //派生クラスBのメンバ変数
    cout << _subclassB.mSubClassB() << "\n"; //派生クラスBのメンバ関数
    
    return 0;
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2016年05月13日  
更新日：2017年04月26日


<a name="名前空間"></a>
# <b>名前空間</b>

### 概要
* 名前空間（namespace）とは、関数名や変数名の重複を防ぐための機能
* 名前空間を使うと、関数や変数の有効範囲を限定できる
* フォルダによる階層構造でファイルを管理するかのようにクラスを管理（但し論理的）

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
//test.cpp
#include <iostream> //cout に必要
using namespace std;

namespace Shinano { //名前空間の定義（前方宣言が必要）
    //名前空間の中↓は変更なし
    class MyClass {
        public:
            void MyFunction(); //メンバ関数の宣言
    };
    void MyClass::MyFunction() {
        cout << "ほげほげ" << endl;
    }
}

int main() {
using namespace Shinano;
MyClass _myClass; //「Shinano::」が省略可能になる
    _myClass.MyFunction(); //"ほげほげ"
    return 0;
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2016年05月25日  
更新日：2017年04月26日


<a name="継承と委譲"></a>
# <b>継承と委譲</b>

### 概要
* GoF デザインパターンの [Adapter パターン](http://bit.ly/2naab8x)等で利用される
* 継承の場合は <b>class ClassB : public ClassA</b> といった使い方で、委譲の場合は <b>ClassA _classA</b> といった記述をしてオブジェクトを生成し、他のクラスの機能を利用する

### 継承版
```
//test.cpp
#include <iostream> //coutに必要
using namespace std;

//===========================
// ClassA : 委譲版と全く同じ
//===========================
class ClassA {
    public:
        void MyMethod();
};

void ClassA::MyMethod() {
    cout << "ClassA.MyMethod()" << "\n";
}

//=================================
// ClassB : ここだけ委譲版と異なる
//=================================
class ClassB : public ClassA {}; //ClassAを継承

//===============================
// メイン関数 : 委譲版と全く同じ
//===============================
int main() {
    ClassB _classB;
    _classB.MyMethod();
    return 0;
}
```

### 委譲版
```
//test.cpp
#include <iostream> //coutに必要
using namespace std;

//===========================
// ClassA : 委譲版と全く同じ
//===========================
class ClassA {
    public:
        void MyMethod();
};

void ClassA::MyMethod() {
    cout << "ClassA.MyMethod()" << "\n";
}

//=================================
// ClassB : ここだけ委譲版と異なる
//=================================
class ClassB {
    private:
        ClassA _classA; //ClassAのインスタンスを生成＆管理（ポイント）
    public:
        void MyMethod(); //メンバ関数の「宣言」
};

void ClassB::MyMethod() { //メンバ関数の「定義」
    _classA.MyMethod(); //ClassAのメンバ関数の実行（ポイント）
}

//===============================
// メイン関数 : 委譲版と全く同じ
//===============================
int main() {
    ClassB _classB;
    _classB.MyMethod();
    return 0;
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2016年05月13日  
更新日：2017年04月26日


<a name="変数とスコープ"></a>
# <b>変数とスコープ</b>

### 変数の種類
1. [public 変数](#public変数) : 全クラスからアクセス可能（非推奨）
1. [protected 変数](#protected変数) : 同じクラスおよび派生クラス内でのみアクセス可能
1. [private 変数](#private変数) : 同じクラス内のみアクセス可能（省略すると private 扱い）
1. [ローカル変数](#ローカル変数) : 関数、for 文、if 文内でのみアクセス可能
* その他に「名前空間変数」「グローバル変数」もあり

<a name="public変数"></a>
### public 変数（非推奨）

```
//test.cpp
#include <iostream> //coutに必要
using namespace std;

//=========
// MyClass
//=========
class MyClass {
    public:
        MyClass(); //コンストラクタの「宣言」
        string _string; //ここではメンバ変数の「宣言」だけ行う
};

MyClass::MyClass() { //コンストラクタの「定義」
    _string = "public変数"; //ここでメンバ変数の「初期化」を行う
}

//============
// メイン関数
//============
int main() {
    MyClass _myClass; //MyClassクラスのインスタンスの生成
    cout << _myClass._string << "\n"; //"public変数"
    return 0;
}
```

<a name="protected変数"></a>

### protected 変数
```
//test.cpp
#include <iostream> //coutに必要
using namespace std;

//==========================
// SuperClass（基本クラス）
//==========================
class SuperClass {
    public:
        SuperClass(); //コンストラクタの「宣言」
    protected:
        string _p; //メンバ変数の「宣言」
};

SuperClass::SuperClass() { //コンストラクタの「定義」
    _p = "SuperClass変数"; //メンバ変数の「初期化」
}

//===============================================
// SubClass（派生クラス）
//===============================================
class SubClass : public SuperClass {
    public:
        SubClass(); //コンストラクタの「宣言」
};

SubClass::SubClass() { //コンストラクタの「定義」
   cout << _p << "\n"; //派生クラスからもアクセス可（ポイント）
}

//============
// メイン関数
//============
int main() {
    SubClass _subClass; //SubClassクラスのインスタンスの生成
    //cout << _subClass._p << "\n"; //アクセス不可（ポイント）
    return 0;
}
```

<a name="private変数"></a>

### private 変数
```
//test.cpp
#include <iostream> //coutに必要
using namespace std;

//=========
// MyClass
//=========
class MyClass {
    private:
        string _p; //メンバ変数の「宣言」
    public: //悪い例（通常はprivateにする）
        MyClass(); //コンストラクタの「宣言」
        string P(); //getter用メンバ関数の「宣言」
        void P(string _str); //setter用メンバ関数の「宣言」
};

MyClass::MyClass() { //コンストラクタの「定義」
    _p = "private変数"; //メンバ変数の「初期化」
}

string MyClass::P() { //getter用メンバ関数の「定義」
    return _p;
}

void MyClass::P(string _str) { //setter用メンバ関数の「定義」
    _p = _str;
}

//============
// メイン関数
//============
int main() {
    MyClass _myClass; //MyClassクラスのインスタンスの生成
    //_myClass.P("○○"); //メンバ変数の値を変更したい場合はsetterを利用する
    cout << _myClass.P() << "\n"; //"private変数" ←getterでアクセス
    return 0;
}
```

<a name="ローカル変数"></a>

### ローカル変数

1. 関数内で宣言する場合
    ```
    //test.cpp
    #include <iostream> //coutに必要
    using namespace std;

    //===============================================
    // MyClass
    //===============================================
    class MyClass {
        private:
            string _p; //メンバ変数の「宣言」←これはprivate変数
        public:
            MyClass(); //コンストラクタの「宣言」
            void MyMethod(); //メンバ関数の「宣言」
    };

    MyClass::MyClass() { //コンストラクタの「定義」
        _p = "private変数"; //メンバ変数の「初期化」←これはprivate変数
    }

    void MyClass::MyMethod() { //getter用メンバ関数の「定義」
        cout << _p << "\n"; //=> "private変数"
        string _p = "ローカル変数"; //これがローカル変数
        cout << _p << "\n"; //=> "ローカル変数"（ポイント）
        cout << MyClass::_p << "\n"; //=> "private変数"（ポイント）
    }

    //===============================================
    // メイン関数
    //===============================================
    int main() {
        MyClass _myClass; //MyClassクラスのインスタンスの生成
        _myClass.MyMethod();
        return 0;
    }
    ```

1. for 文、if 文内で宣言する場合
    ```
    //test.cpp
    #include <iostream> //coutに必要
    using namespace std;

    //===============================================
    // MyClass
    //===============================================
    class MyClass {
        private:
            int i; //private変数
        public:
            MyClass(); //コンストラクタの「宣言」
    };

    MyClass::MyClass() { //コンストラクタの「定義」
        i = 999; //private変数

        for (int i=0; i<=5; i++) { //iはローカル変数
            string _string = "test"; //ローカル変数（for文内のみ有効）
            cout << i << "\n"; //0、1、2、…、5 ←ローカル変数にアクセス
            cout << MyClass::i << "\n"; //999 ←private変数（i）にアクセス
        }
        //cout << _string << "\n"; //ERROR（for文外はアクセス不可）

        if (true) {
            string string2_ = "test2"; //ローカル変数（if文内のみ有効）
        }
        //cout << string2_ << "\n"; //ERROR（if文外はアクセス不可）

    }

    //===============================================
    // メイン関数
    //===============================================
    int main() {
        MyClass _myClass; //MyClassクラスのインスタンスの生成
        return 0;
    }
    ```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2016年05月13日  
更新日：2017年04月26日


<a name="アクセサ"></a>
# <b>アクセサ （getter / setter）</b>

### 概要
* OOP（オブジェクト指向プログラミング）の「他人の変数を勝手にいじってはいけない」というルールに則り、メンバ変数は通常 private 変数とし、外部からは関数を使ってアクセスする
* C++ には、C# のような get、set アクセサといったものが用意されていない
* GetXXX()、SetXXX(型,引数) といった記述もできるが、C++ の場合は「引数が異なる同名の関数を定義することが可能」なため以下のような記述をする

### 例文
```
//test.cpp
#include <iostream> //coutに必要
using namespace std;

//========
// クラス
//========
class Nishimura {
    private: int _age; //private変数（外部から勝手にいじらせない為）
    public:
        Nishimura(int _age); //コンストラクタの「宣言」
        int Age(); //メンバ関数（getter）の「宣言」
        void Age(int _age); //メンバ関数（setter）の「宣言」
};
Nishimura::Nishimura(int _age) { //コンストラクタの「定義」
    Nishimura::_age = _age;
}
int Nishimura::Age() { //メンバ関数（getter）の定義
    return _age;
}
void Nishimura::Age(int _age) { //メンバ関数（setter）の定義
    Nishimura::_age = _age;
}

//============
// メイン関数
//============
int main() {
    Nishimura _nishimura(49); //Nishimuraクラスのインスタンスの生成
    cout << _nishimura.Age() << "\n"; //49 ←getterを使って値を取得
    _nishimura.Age(50); //setterを使って値を変更
    cout << _nishimura.Age() << "\n"; //50 ←getterを使って値を取得
    return 0;
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2016年05月16日  
更新日：2017年04月26日


<a name="演算子"></a>
# <b>演算子</b>

```
//test.cpp
#include <iostream> //標準ライブラリ（coutに必要）
using namespace std;

int main() {
    cout << 3 + 2 << "\n"; //5(可算)
    cout << 5 - 8 << "\n"; //-3(減算)
    cout << 3 * 4 << "\n"; //12(乗算)
    cout << 7 / 3 << "\n"; //2(除算) ←整数の場合、余りは切り捨てられる
    cout << 7.0 / 3 << "\n"; //2.33333(除算:5 位迄)
    cout << 1 + 2 * 3 - 4 / 2 << "\n"; //5(複雑な計算)
    cout << 63 % 60 << "\n"; //3(余剰)
    
    //除算（注意が必要）
    cout << 8 / 3 << "\n"; //2(除算) ←整数同士の場合、余りは切り捨てられる
    cout << 8 / 3.0 << "\n"; //2.66667（小数点第5位までの値）
    
    float _float = (float)8.0 / 3;
    cout << _float << "\n"; //2.66667 ←(double)XXXの場合も同じ
    
    // 後ろに付けるインクリメント（デクリメント）
    // _hoge++（_hoge--）が返す値は、加算（減算）する前の_hogeの値です
    int _hoge = 0;
    int _piyo = _hoge++; //デクリメントの場合_hoge--
    cout << _hoge << "\n"; //1（デクリメントの場合-1）
    cout << _piyo << "\n"; //0（デクリメントの場合0）

    // 前に付けるインクリメント（デクリメント）
    // ++_hoge（--_hoge）が返す値は、加算（減算）後の_hogeの値です
    _hoge = _piyo = 0;
    _piyo = ++_hoge; //デクリメントの場合--_hoge
    cout << _hoge << "\n"; //1（デクリメントの場合-1）
    cout << _piyo << "\n"; //1（デクリメントの場合-1） ←注目
    
    return 0; //関数 main()の終了部分
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2016年05月16日  
更新日：2017年04月26日


<a name="定数"></a>
# <b>定数</b>

### 注意
* C++ ではクラス定数ではなく「メンバ定数」と呼ぶ
* メンバ定数を宣言するには <b>static const 型 変数名</b> と記述する
* C++ の場合、定数名は慣例的に小文字を使う

### 通常の定数
```
//test.cs
#include <iostream> //coutに必要
using namespace std;
int main() { // メイン関数
    const string myname = "TAKASHI NISHIMURA";
    cout << myname << "\n"; //"TAKASHI NISHIMURA"
    //atoz = "にしむらたかし"; //変更しようとするとERROR
    return 0;
}
```

### メンバ定数
```
//test.cpp
#include <iostream>
using namespace std;

class MyClass {
    public:
        static const string myname; //メンバ定数の「宣言」
};

//↓"static"の記述はいらない
const string MyClass::myname = "TAKASHI NISHIMURA"; //メンバ定数の「定義」

//main()関数の定義
int main() {
    cout << MyClass::myname << "\n"; //"TAKASHI NISHIMURA"
    return 0;
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2016年05月16日  
更新日：2017年04月26日


<a name="関数"></a>
# <b>関数</b>

### 基本構文
```
class クラス名 {
    アクセス指定子:
        //メンバ関数の「宣言」
        [static] 戻り値のデータ型 メソッド名([データ型 引数, ...]); 
}
戻り値のデータ型 クラス名::メソッド名([データ型 引数, …]) { //メンバ関数の「定義」
    [return 戻り値;]
}
```

### アクセス指定子
1. public : 全クラスからアクセス可能
1. protected : 同じクラスおよび派生クラス内でのみアクセス可能
1. private : 同じクラス内のみアクセス可能（省略するとprivate扱い）
* 他にも internal （アセンブリ内でのみアクセス可能）などあり
* static（静的メンバ関数）: クラスメソッドクラスのインスタンスを作らなくても <b>クラス名::静的メンバ関数()</b> でメソッドが使用可能（アクセス指定子は通常 public にする）

### 基本例文
```
//test.cpp
#include <iostream>
using namespace std;

//========
// クラス
//========
class MyClass {
    public:
        int Tashizan(int start_, int end_); //メンバ関数の「宣言」
};

//○〜○までの値を足した合計を返す
int MyClass::Tashizan(int start_, int end_) { //メンバ関数の「定義」
    int _result = 0; //ローカル変数
    for (int i = start_; i <= end_; i++) {
        _result += i;
    }
    return _result;
}

//============
// メイン関数
//============
int main() {
    MyClass myClass_;
    cout << myClass_.Tashizan(1,10) << "\n"; //55
    cout << myClass_.Tashizan(1,100) << "\n"; //5050
    return 0;
}
```

### Main() 関数
```
//test.cpp
#include <iostream>
using namespace std;
int main() { //C++では原則としてmain()関数から処理が行われます
    cout << "自動的に実行" << "\n";
    return 0;
}
```

### コンストラクタ
* 引数なしと引数ありの場合を同時に定義することが可能
```
//test.cpp
#include <iostream>
using namespace std;

//========
// クラス
//========
class MyClass {
    public:
        MyClass(); //引数なしのコンストラクタの「宣言」
        MyClass(string str_); //引数ありのコンストラクタの「宣言」
};

MyClass::MyClass() { //引数なしのコンストラクタの「定義」
    cout << "インスタンスが生成" << "\n";
}

MyClass::MyClass(string str_) { //引数ありのコンストラクタの「定義」
    cout << "インスタンスが生成:" << str_ << "\n";
}

//============
// メイン関数
//============
int main() {
    MyClass myClass1_; //引数なしでインスタンスを生成 ←()は付けない（注意）
    MyClass myClass2_("引数あり"); //引数ありでインスタンスを生成
    return 0;
}
```

### 静的メンバ関数（クラスメソッド）
```
//test.cpp
#include <iostream>
using namespace std;

//========
// クラス
//========
class Math {
    public:
       static int Pow(int arg1, int arg2); //静的メンバ関数の「宣言」
};

int Math::Pow(int arg1, int arg2) { //ここに"static"の記述はいらない
    if (arg2 == 0) { return 1; } //0乗対策
    int _result = arg1;
    for (int i=1; i<arg2; i++) {
        _result = _result * arg1;
    }
    return _result;
}

//============
// メイン関数
//============
int main() {
    cout << Math::Pow(2,0) << "\n"; //1（2の0乗）
    cout << Math::Pow(2,1) << "\n"; //2（2の1乗）
    cout << Math::Pow(2,8) << "\n"; //256（2の8乗）
    return 0;
}
```

### デフォルト値付き引数（引数は省略可能オプション引数）
```
//test.cpp
#include <iostream>
using namespace std;

//========
// クラス
//========
class MyClass {
    private:
        int po_int; 
    public:
        MyClass(); //コンストラクタの「宣言」
        //↓デフォルト引数付のメンバ関数の「宣言」
        void AddPoint(int arg); //ここにデフォルト値は記述しない
};

MyClass::MyClass() { //コンストラクタの「定義」
    po_int = 0;
}

//デフォルト引数付のメンバ関数の「定義」
//引数が複数ある場合、デフォルト値がある引数を右側に記述
void MyClass::AddPoint(int arg = 1) { //デフォルト値が1の場合
    po_int += arg;
    cout << po_int << "\n";
}

//============
// メイン関数
//============
int main() {
    MyClass myClass_; //インスタンスを生成
    myClass_.AddPoint(); //1（引数を省略してメンバ関数を実行）
    myClass_.AddPoint(10); //11（引数付でメンバ関数を実行）
    return 0;
}
```

### 可変長引数
```
//test.cpp
#include <iostream>
using namespace std;

//========
// クラス
//========
class MyClass {
    public: 
        void Sum(int arg[], int listLength_);
};

void MyClass::Sum(int arg[], int listLength_) { 
    int _result = 0; 
    for (int i=0; i<listLength_; i++) {
         _result += arg[i]; 
    } 
    cout << _result << "\n";
}

//============
// メイン関数
//============
int main() { MyClass _myClass;
    //1,1を足す
    int tmp1[] = {1,1}; 
    int listLength_ = sizeof(tmp1) / sizeof(tmp1[0]); //配列の要素数を調べる
    _myClass.Sum(tmp1, listLength_); //=> 2

    //1,2,3...9,10を足す
    int tmp2[] = {1,2,3,4,5,6,7,8,9,10};
    listLength_ = sizeof(tmp2) / sizeof(tmp2[0]); //配列の要素数を調べる
    _myClass.Sum(tmp2, listLength_); //=> 55
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2016年05月17日  
更新日：2017年04月26日


<a name="匿名関数（ラムダ式）"></a>
# <b>匿名関数（ラムダ式）</b>

### 基本構文
```
function<戻り値の型(引数の型)> 変数名 = [](引数の型 引数) [-> 戻り値の型] {
    ......
}
```

### 例文
```
//test.cpp
#include <iostream> //coutに必要
#include <functional> //functionに必要
using namespace std;

class MyClass {
    public:
        MyClass(); //コンストラクタの「宣言」
        function<int(int, int)> _kakezan; //匿名関数の「宣言」
};

MyClass::MyClass() { //コンストラクタの「定義」
    //匿名関数の「定義」
    _kakezan = [](int arg1, int arg2) -> int { //ラムダ式（-> intは省略可）
        return arg1 * arg2; 
    };
}

int main() { // メイン関数
    MyClass _myClass;
    cout << _myClass._kakezan(9,9) << endl; //81
    return 0;
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2016年05月18日  
更新日：2017年04月27日


<a name="静的メンバ（static）"></a>
# <b>静的メンバ（static）</b>

### 構文（宣言部分）
```
class クラス名 {
    public:
        static データ型 静的メンバ変数名;
        static 戻り値の型 静的メンバ関数名(引数);
};
```

### 例文
```
//test.cpp
#include <iostream> //coutに必要
using namespace std;

class MyClass {
    public:
        static double pi; //静的メンバ変数の「宣言」
        static int Pow(int arg1, int arg2); //静的メンバ関数の「宣言」
};

//静的メンバ変数の「定義」
double MyClass::pi = 3.14159; 

//静的メンバ関数の「定義」※MyClass内で定義することも可能
int MyClass::Pow(int arg1, int arg2) {
    if (arg2 == 0) { return 1; } //0乗対策
    long _result = arg1;
    for (int i=1; i<arg2; i++) {
        _result = _result * arg1;
    }
    return _result;
}

int main() { // メイン関数
    cout << MyClass::pi << endl; //3.14159
    cout << MyClass::Pow(2,8) << endl; //256（2の8乗）
    return 0;
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2016年05月18日  
更新日：2017年04月27日


<a name="if文"></a>
# <b>if 文</b>

### 基本例文
```
//test.cpp
#include <iostream> //coutに必要
using namespace std;
int main() {
    int _age = 49;
    if (_age <= 20) {
        cout << "20歳以下" << endl;
    } else if (_age <= 40) {
        cout << "21〜40歳" << endl;
    } else if (_age <= 60) {
        cout << "41〜60歳" << endl; //これが出力される
    } else {
        cout << "61歳以上" << endl;
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
1. ^ 演算子を使う方法
    ```
    //test.cpp
    #include <iostream> //coutに必要
    using namespace std;
    int main() {
        bool a_ = true, b_ = false;
        if (a_ ^ b_) {
            cout << "どちらか一方だけtrueです" << endl; //これが出力される
        } else {
            cout << "両方共にtrue（false）です" << endl;
        }
    }
    ```

2. ^ 演算子を使わない方法
    ```
    //test.cpp
    #include <iostream> //coutに必要
    using namespace std;
    int main() {
        bool a_ = true, b_ = false;
        if ((a_ || b_) && !(a_ && b_)) {
            cout << "どちらか一方だけtrueです" << endl; //これが出力される
        } else {
            cout << "両方共にtrue（false）です" << endl;
        }
    }
    ```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2016年05月18日  
更新日：2017年04月27日


<a name="三項演算子"></a>
# <b>三項演算子</b>

### 比較式が１つの場合
* 構文
```
データ型 変数名 = (比較式) ? (true時の返り値) : (false時の返り値);
```

* 例文
```
//test.cpp
#include <iostream> //coutに必要
using namespace std;

int main() {
    int age_ = 49;
    string _result = (age_ < 60) ? "現役" : "退職";
    cout << _result << endl; //"現役"
}
```

### 比較式が複数の場合
* 構文
```
データ型 変数名 = (比較式①) ? (①がtrueの場合の返り値) : //①がfalseの場合↓
(比較式②) ? (②がtrueの場合の返り値) : //②がfalseの場合↓
(①②の全てがfalseの場合の返り値);
```

* 例文
```
//test.cpp
#include <iostream> //coutに必要
using namespace std;

int main() {
    int age_ = 49;
    string _result = (age_ < 20) ? "未成年" : //条件がfalseの場合↓
    (age_ < 60) ? "現役" : //条件がfalseの場合↓
    "退職"; //上記の条件が全てfalseの場合
    cout << _result << endl; //"現役"が出力
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2016年05月18日  
更新日：2017年04月27日


<a name="switch文"></a>
# <b>switch 文</b>

### 基本例文
```
//test.cpp
#include <stdio.h> //puts()に必要
int main() {
    char char_ = 'u';
    switch (char_) { //intやchar型は可（stringやbool型は不可）
        case 'a' : puts("あ"); break;
        case 'i' : puts("い"); break;
        case 'u' : puts("う"); break; //'u'の場合、これが出力
        case 'e' : puts("え"); break;
        case 'o' : puts("お"); break;
        default : puts("あ行以外"); break; //省略可能
    }
    return 0;
}
```

### break 文を意図的に記述しない方法
```
//test.cpp
#include <stdio.h> //puts()に必要
int main() {
    int _int = 3;
    switch (_int) { //intやchar型は可（stringやbool型は不可）
        case 1 : puts("①"); //何か処理した後breakを書かないのも可（C#では不可）
        case 2 : puts("②"); break;
        case 3 : puts("③");
        case 4 : puts("④"); break;
        case 5 : puts("⑤"); 
        default : puts("？"); break; //省略可能
    }
    return 0;
}
```

_int の値が「1の場合①」「2の場合①②」「3の場合③④」「4の場合④」「5の場合⑤？」
「それ以外の場合？」が出力される
（各行で何も処理しないのことも可能）

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2016年05月19日  
更新日：2017年04月27日


<a name="for文"></a>
# <b>for 文</b>

### 基本構文
```
for (①初期化; ②ループ判定式; ③更新処理) {
    繰り返す処理
}
```

### ループカウンタ（ループ制御変数）の宣言位置

1. for文の中でループ制御変数を宣言する
    ```
    //test.cpp
    #include <iostream> //coutに必要
    using namespace std;
    int main() {
        for (int i=0; i<10; i++) { //ここでint型を宣言すると...
            cout << i << endl; //0,1,2,3,4,5,6,7,8,9
        }
        //cout << i << endl; //error（for文の外では使えない）
        return 0;
    }
    ```

1. for文の外でループ制御変数を宣言する
    ```
    //test.cpp
    #include <iostream> //coutに必要
    using namespace std;
    int main() {
        int i; //ここでint型を宣言すると…
        for (i=0; i<10; i++) {
            cout << i << endl; //0,1,2,3,4,5,6,7,8,9
        }
        cout << i << endl; //10（for文の外でも有効）
        return 0;
    }
    ```

### ループカウンタを○つずつアップする
    ```
    //test.cpp
    #include <iostream> //coutに必要
    using namespace std;
    int main() {
        for (int i=0; i<50; i+=5) { //5つずつアップする場合
            cout << i << endl; //0,5,10,15,20,25,30,35,40,45
        }
        return 0;
    }
    ```

### for 文のネスト
```
//test.cpp
#include <iostream> //coutに必要
using namespace std;
int main() {
    for (int i=1; i<=5; i++) {
        for (int j=1; j<=5; j++) {
            cout << "x" << i << "y" << j << endl; //x1y1,x1y2,...,x5y4,x5y5
        }
    }
    return 0;
}
```

### 無限ループと break 文
    ```
    //test.cpp
    #include <iostream> //coutに必要
    using namespace std;
    int main() {
        int _count = 0;
        for (;;) { //①初期化②ループ判定式③更新処理...の全てを省略すると無限ループに
            _count ++;
            if (_count > 100) break; //ループを終了
            cout << _count << endl; //1,2,...,99,100
        }
        cout << "for文終了" << endl;
        return 0;
    }
    ```

### for 文と continue 文
```
//test.cpp
#include <iostream> //coutに必要
using namespace std;
int main() {
    for (int i=1; i<=20; i++) { //iは1,2,...19,20
        if ((i % 3) != 0) { //3で割って余りが0ではない（＝3の倍数ではない）場合
            continue; //for文の残処理をスキップしてfor文の次の反復を開始する
        }
        cout << i << endl; //3,6,9,12,15,18（3の倍数）
    }
    return 0;
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2016年05月19日  
更新日：2017年04月27日


<a name="foreach文"></a>
# <b>foreach 文</b>
* 他の多くの言語にある foreach キーワードと同等（構文は異なる）

### 基本構文
```
for (auto 変数名 : 配列等) {
    cout << 変数名 << endl;
}
```

### 配列（1次元）の場合
```
//test.cpp
#include <iostream> //coutに必要
using namespace std;

int main() {
    string _array[] = {"A","B","C"};
    for (auto tmp : _array) {
        cout << tmp << endl; //"A"→"B"→"C"
    }
    return 0;
}
```

### 配列（2次元）の場合
```
//test.cpp
#include <iostream> //coutに必要
using namespace std;

int main() {
    string _array[2][3] = {{"x0y0","x1y0","x2y0"},{"x0y1","x1y1","x2y1"}}; 
    for (auto tmp : _array) {
        cout << tmp << endl; //0x7ffed94ea9c0 → 0x7ffed94eaa20 等
        cout << tmp[0] << endl; //"x0y0" → "x0y1"
    }
    return 0;
}
```

### 動的配列（vectorクラス)の場合
```
//test.cpp
#include <iostream> //coutに必要
#include <vector> //vectorクラスに必要
using namespace std;

int main() {
    vector<string> _vector; //string型を格納するvectorオブジェクトを生成
    _vector.push_back("A"); //配列の最後に追加
    _vector.push_back("B"); //配列の最後に追加
    for (auto tmp : _vector) {
        cout << tmp << endl; //"A"→"B"
    }
    return 0;
}
```

### 連想配列の場合
```
//test.cpp
#include <iostream> //coutに必要
#include <map> //mapクラスに必要
using namespace std;

int main() {
    map<string, string> _map; //キーの型（string）と値の型（int）のmapインスタンスの生成
    _map["A"] = "あ";
    _map["I"] = "い";
    _map["U"] = "う";
    for (auto tmp : _map) {
        cout << tmp.first << ":" << tmp.second << endl;
        //「A:あ」→「I:い」→「U:う」
    }
    return 0;
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2016年05月19日  
更新日：2017年04月27日


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
//test.cpp
#include <iostream> //coutに必要
using namespace std;

int main() {
    int _i = 0;
    while (_i < 10) {
        cout << _i << endl; //0,1,2,3,4,5,6,7,8,9
        _i++;
    }
    cout << _i << endl; //10（変数はまだ有効）
    return 0;
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
//test.cpp
#include <iostream> //coutに必要
using namespace std;

int main() {
    int _i = 0;
    do {
        cout << _i << endl; //0 ←ループ判定式はfalseだが１回実行される
        _i++;
    } while(_i < 0);
    return 0;
}
```

### while 文と break 文
```
//test.cpp
#include <iostream> //coutに必要
using namespace std;

int main() {
    int _count = 0;
    while (true) { //ループ判別式をtrueにすると無限ループ
        _count++;
        if (_count > 100) {
            break; //break文を使ってループを終了→★へ
        }
        cout << _count << endl; //1,2,....,99,100（1〜100までを出力）
    }
    cout << "while文終了" << endl; //★
    return 0;
}
```

### while 文と continue 文
```
//test.cpp
#include <iostream> //coutに必要
using namespace std;

int main() {
    int _i = 1;
    while (_i <= 20) {
        if ((_i % 3) != 0) { //3で割って余りが0ではない（＝3の倍数ではない）場合
            _i++;
            continue; //while文の残処理をスキップしてwhile文の次の反復を開始する
        }
        cout << _i << endl; //3,6,9,12,15,18（3の倍数を出力）
        _i++;
    }
    return 0;
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2016年05月19日  
更新日：2017年04月27日


<a name="配列"></a>
# <b>配列</b>

### １次元配列の作成
* 構文（配列の宣言後は要素数の変更不可）
```
データ型 変数名[] = {要素①,要素②,...};
```

* 例文
```
//test.cpp
#include <iostream> //coutに必要
using namespace std;
int main() {
    string _array[] = {"A","B","C"};
    for (auto tmp : _array) {
        cout << tmp << endl; //"A"→"B"→"C"
    }
    return 0;
}
```

### ２次元配列（四角配列）の作成
* 構文
```
データ型 変数名[○行][○個] = {{1行目の配列},...,{○行目の配列}};
```

* 最初に宣言のみ行って後でデータを入れる方法
```
//test.cpp
//最初に宣言のみ行ない後でデータを入れる方法
#include <iostream> //coutに必要
using namespace std;
int main() {
    //最初に宣言のみ（5行x4個で固定）
    string coinlocker_[5][4];
    coinlocker_[0][0] = "1083";
    coinlocker_[0][1] = "7777";
    coinlocker_[2][1] = "0135";
    coinlocker_[4][3] = "1234";
    //coinlocker_[6][0] = "9999"; //ERROR（6行目は不可）
    //coinlocker_[4][5] = "9999"; //ERROR（5個目は不可）
    cout << coinlocker_[0][0] << endl; //"1083"
    cout << coinlocker_[0][1] << endl; //"7777"
    cout << coinlocker_[2][1] << endl; //"0135"
    cout << coinlocker_[4][3] << endl; //"1234"
}
```

* 配列リテラルを使った方法
```
//test.cpp
#include <iostream> //coutに必要
using namespace std;
int main() {
    //配列リテラルを使った方法
    string coinlocker_[5][4] = { //5行x4個で固定
        {"1083","7777","",""}, //0行目
        {"","","",""},         //1行目
        {"","0135","",""},     //2行目
        {"","","",""},         //3行目
        {"","","","1234"}      //4行目
    };
}
```

### 配列の要素の数を調べる
```
//test.cpp
#include <iostream> //coutに必要
using namespace std;
int main() {
    string _array[] = {"A","B","C"};
    cout << sizeof(_array) << endl; //96
    cout << sizeof(_array) / sizeof(_array[0]) << endl; //3 ←要素数
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2016年05月20日  
更新日：2017年04月27日


<a name="動的配列（vector）"></a>
# <b>動的配列（vector）</b>

### 作成
* 構文
```
vector<データ型> 変数名(数); //指定数の空の要素を持つList作成
vector<データ型> 変数名{要素①,要素②,...};
vector<データ型> 変数名 = {要素①,要素②,...}; //これが分かりやすい
```
* 例文
```
//test.cpp
#include <iostream> //cout に必要
#include <vector> //vector クラスに必要
using namespace std;
int main() {
    vector<string> _vector = {"A","B","C"};
    for (auto tmp : _vector ) {
        cout << tmp << endl; //"A"→"B"→"C"
    }
    return 0;
}
```

### 追加（最後）
* 構文
```
vector.push_back(値);
```
* 例文
```
//test.cpp
#include <iostream> //cout に必要
#include <vector> //vector クラスに必要
using namespace std;
int main() {
    vector<string> _vector = {}; //空のvectorを作成
    _vector.push_back("A"); //追加
    _vector.push_back("B"); //最後に追加
    for (auto tmp : _vector ) {
        cout << tmp << endl; //"A"→"B"
    }
}
```

### 追加（最初）
* 構文
```
vector.insert(vector.begin(), 値);
```
* 例文
```
//test.cpp
#include <iostream> //cout に必要
#include <vector> //vector クラスに必要
using namespace std;
int main() {
    vector<string> _vector = {"A","B"};
    _vector.insert(_vector.begin(), "X"); //最初に追加
    for (auto tmp : _vector ) {
        cout << tmp << endl; //"X"→"A"→"B"
    }
}
```

### 追加（指定位置）
* 構文
```
vector.insert(vector.begin() + インデックス番号,値);
//インデックス番号は、先頭「0」〜「vector.size()」まで指定可能
```
* 例文
```
//test.cpp
#include <iostream> //cout に必要
#include <vector> //vector クラスに必要
using namespace std;
int main() {
    vector<string> _vector = {"A","B"};
    _vector.insert(_vector.begin() + 0,"X"); //先頭に追加する場合は0
    for (auto tmp : _vector ) {
        cout << tmp << endl; //"X"→"A"→"B"
    }
}
```

### 更新（任意の値）
* 構文
```
vector[インデックス番号] = 値;
```
* 例文
```
//test.cpp
#include <iostream> //cout に必要
#include <vector> //vector クラスに必要
using namespace std;
int main() {
    vector<string> _vector = {"A","B","C"};
    _vector[0] = "X"; //0番目を変更する場合
    for (auto tmp : _vector ) {
        cout << tmp << endl; //"X"→"B"→"C"
    }
}
```

### 削除（指定のインデックス）
* 構文
```
vector.erase(vector.begin() + インデックス番号);
//インデックス番号は、先頭「0」〜「vector.size()」まで指定可能
```
* 例文
```
//test.cpp
#include <iostream> //cout に必要
#include <vector> //vector クラスに必要
using namespace std;
int main() {
    vector<string> _vector = {"A","B","C","D"};
    _vector.erase(_vector.begin() + 0); //先頭を削除する場合
    //_vector.erase(_vector.begin() + _vector.size()); //最後を削除する場合
    for (auto tmp : _vector ) {
        cout << tmp << endl; //"B"→"C"→"D"
    }
}
```

### 抽出（指定位置）
* 構文
```
vector[インデックス番号]
```
* 例文
```
//test.cpp
#include <iostream> //cout に必要
#include <vector> //vector クラスに必要
using namespace std;
int main() {
    vector<string> _vector = {"A","B","C","D"};
    cout << _vector[0] << endl; //=> "A"
    //インデックス番号は、先頭「0」〜「vector.size()」まで指定可能
}
```

### 検索（力技）
```
//test.cpp
#include <iostream> //cout に必要
#include <vector> //vector クラスに必要
using namespace std;

//検索用の自作関数
int indexOf(vector<string> arg1, string arg2) {
    for (int i=0; i<arg1.size(); i++) {
        if (arg1[i] == arg2) {
            return i; //見つかった場合インデックス番号を返す
        }
    }
    return -1; //見つからなければ-1を返す
}

int main() {
    vector<string> _vector = {"A","B","C","D"};
    cout << indexOf(_vector, "B") << endl; //1
    cout << indexOf(_vector, "X") << endl; //-1
    return 0;
}
```

### 要素の数
* 構文
```
vector.size();
```
* 例文
```
//test.cpp
#include <iostream> //cout に必要
#include <vector> //vector クラスに必要
using namespace std;
int main() {
    vector<string> _vector = {"A","B","C","D"};
    cout << _vector.size() << endl; //=> 4
}
```

### 並べ替え（反転）
1. algorithm ライブラリを使用する方法
    ```
    //test.cpp
    #include <iostream> //cout に必要
    #include <vector> //vector クラスに必要
    #include <algorithm> //reverseに必要
    using namespace std;
    int main() {
        vector<string> _vector = {"A","B","C","D","E","F"};
        reverse(_vector.begin(), _vector.end());
        for (auto tmp : _vector) {
            cout <<tmp<< endl; //"F"→"E"→"D"→"C"→"B"→"A"
        }
        return 0;
    }
    ```

1. algorithm ライブラリを使用しない方法
    ```
    //test.cpp
    #include <iostream> //cout に必要
    #include <vector> //vector クラスに必要
    using namespace std;

    vector<string> myReverse(vector<string> arg) {
        vector<string> result_ = {};
        for (auto tmp : arg) {
            result_.insert(result_.begin(), tmp);
        }
        return result_;
    }

    int main() {
        vector<string> _vector = {{"A","B","C","D","E","F"}};
        vector<string> vector2_ = myReverse(_vector);
        for (auto tmp : vector2_) {
            cout <<tmp<< endl; //"F"→"E"→"D"→"C"→"B"→"A"
        }
        return 0;
    }
    ```

### 並べ替え（ソート）
```
//test.cpp
#include <iostream> //cout に必要
#include <vector> //vector クラスに必要
#include <algorithm> //sorに必要
using namespace std;

int main() {
    vector<string> _vector = {"C", "02", "A", "01", "03", "B"};
    sort(_vector.begin(), _vector.end()); //ソート
    for (auto tmp : _vector) {
        cout <<tmp<< endl; //"01"→"02"→"03"→"A"→"B"→"C"
    }
    return 0;
}
```

### 結合
```
//test.cpp
#include <iostream> //cout に必要
#include <vector> //vector クラスに必要
using namespace std;

int main() {
    vector<string> vector1_ = {"A","B","C","D"};
    vector<string> vector2_ = {"a","b","c","d"};
    vector1_.insert(vector1_.end(), vector2_.begin(), vector2_.end()); //結合
    //copy(vector2_.begin(), vector2_.end(), back_inserter(vector1_)); //これでも可
    for (auto tmp : vector1_) {
        cout << tmp << endl; //"A","B","C","D","a","b","c","d" ←追加されている
    }    
    for (auto tmp : vector2_) {
        cout << tmp << endl; //"a","b","c","d"
    }
    return 0;
}
```

### 複製（力技）
```
//test.cpp
#include <iostream> //cout に必要
#include <vector> //vector クラスに必要
using namespace std;

int main() {
    vector<string> vectorOrign_ = {"A","B","C","D"}; //元の配列
    vector<string> vectorCopy_ = {}; //コピーしたものを格納する配列
    for (auto tmp : vectorOrign_) {
        vectorCopy_.push_back(tmp); 
    }
    vectorCopy_.push_back("E"); //コピーしたものにだけ要素を追加してみる
    for (auto tmp : vectorOrign_) {
        cout << tmp << endl; //"a","b","c","d"
    }
    cout << "----------------" << endl;
    for (auto tmp : vectorCopy_) {
        cout << tmp << endl; //"a","b","c","d","E" ←こっちだけ追加されている
    }
    return 0;
}
```

### 文字列→vector
```
//test.cpp
#include <iostream> //cout に必要
#include <vector> //vector クラスに必要
#include <string.h> //strtokに必要
using namespace std;

int main() {
    char _string[] = "A,B,C,D,E,F";
    char *tp;
    vector<string> _vector; //文字列を格納する配列
    tp = strtok(_string, ","); //カンマ区切り（,）で分割する場合
    _vector.push_back(tp); //1個目を配列に格納
    while ( tp != NULL ) {
            tp = strtok(NULL,","); //カンマ区切り（,）で分割する場合
            if ( tp != NULL ) {
                _vector.push_back(tp); //2個目以降を配列に格納
            }
    }

    //動作確認
    for (auto tmp : _vector) {
        cout << tmp << endl; //A→B→C→D→E→F
    }

    return 0;
}
```

### 全要素を取り出す
```
//test.cpp
#include <iostream> //cout に必要
#include <vector> //vector クラスに必要
using namespace std;

int main() {
    vector<string> _vector = {"あ","い","う","え","お"};
    for (auto tmp : _vector) {
        cout <<tmp<< endl; //"あ"→"い"→"う"→"え"→"お"
    }
    return 0;
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2015年05月23日  
更新日：2017年04月27日


<a name="連想配列（map）"></a>
# <b>連想配列（map）</b>

### 概要
* ディクショナリ、ハッシュとも呼ばれる「キー」と「値」の組み合わせを格納するデータ構造
* 匿名型クラスは、同様のデータ構造を持てるが読取り専用

### 作成方法
```
Dictionary<キーの型, 値の型> 変数名 = new Dictionary<キーの型, 値の型>();
Dictionary<キーの型, 値の型> 変数名 = new Dictionary<キーの型, 値の型>() {
    {"キー①", 値①},
    {"キー②", 値②}, 
    ......…
};
```

* 例文
    ```
    //test.cs
    using System;
    using System.Collections.Generic; //Dictionaryに必要（Unity版でも必要）
    class Test {
        static void Main() {
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
            Console.WriteLine(_dic["A"]); //"ア"
        }
    }
    ```

### キー、値の検索
```
//test.cs
using System;
using System.Collections.Generic; //Dictionaryに必要（Unity版でも必要）
class Test {
    static void Main() {
        //①作成（空のDictionaryを作成する場合、{}は不要）
        Dictionary<string, string> _dic = new Dictionary<string, string>() {
            {"A", "あ"},{"I", "い"},{"U", "う"},{"E", "え"},{"O", "お"}
        };

        Console.WriteLine(_dic.ContainsKey("B")); //任意のキーがあるか否か（True／False）
        Console.WriteLine(_dic.ContainsValue("え")); //任意の値があるか否か（True／False）
    }
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2015年12月11日  
更新日：2017年04月19日


<a name="this"></a>
# <b>this</b>

### thisが必要な場合
1. 「引数」と「インスタンス変数」が同じ場合
1. 「ローカル変数」と「インスタンス変数」が同じ場合
* this は、this を記述したメソッドを所有するクラス（オブジェクト）を指す

### 例文
```
//test.cs
using System;

//メインクラス
class Test {
    static void Main() {
        Robot _robot = new Robot(500);
        _robot.Move();
        Console.WriteLine(_robot.X); //510
        //Console.WriteLine(this); //error（staticメソッド内では参照できず）
    }
}

//カスタムクラス
class Robot {
    private int _x; //インスタンス変数（thisは不要）
    
    public Robot(int _x) { //引数
        this._x = _x; //①thisが無いとWarning（引数を参照してしまう）
        Console.WriteLine(this); //Robot（このメソッドが実行されたオブジェクト）
    }

    public void Move() {
        int _x; //ローカル変数
        _x = this._x + 10; //②thisが無いとerror（ローカル変数を参照してしまう）
        if (_x >= 1920) _x = 0;
        this._x = _x; //②thisが無いとWarning（ローカル変数を参照してしまう）
        Console.WriteLine(this); //Robot（このメソッドが実行されたオブジェクト）
    }

    public int X {
        get { return _x; } //thisを付けてもよい（通常は省略）
        private set {}
    }
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2015年11月15日  
更新日：2017年04月19日


<a name="文字列の操作"></a>
# <b>文字列の操作</b>

### string オブジェクトの作成
* 構文
```
string 変数名 = "○○"; //文字列リテラルを使う方法
string 変数名 = new string(new char[]{'○','○',...}); //new演算子とchar型配列を使う方法
```
* 例文
```
//test.cs
using System;
class Test {
    static void Main() {
        //①文字列リテラルを使う
        string _string1 = "ABCDE";
        Console.WriteLine(_string1); //"ABCDE"

        //②new演算子とchar型配列を使う
        string _string2 = new string(new char[]{'A','B','C','D','E'});
        Console.WriteLine(_string2); //"ABCDE" 
    }
}
```

### 長さを調べる
```
//test.cs
using System;
class Test {
    static void Main() {
        string _string = "ABCDE";
        Console.WriteLine(_string.Length); //5
    }
}
```

### 一部分を取得
* 構文
```
String[番号] ←0（最初）〜String.Length-1（最後）
String.Substring(開始 [,文字数])
```
* 例文
```
//test.cs
using System;
class Test {
    static void Main() {
        string _string = "0123456789";
        Console.WriteLine(_string[4]); //"4"
        Console.WriteLine(_string.Substring(4)); //"456789"
        Console.WriteLine(_string.Substring(4,3)); //"456"
    }
}
```

### 一部分を削除
* 構文
```
String.Remove(開始位置, 削除する文字数);
```
* 例文
```
//test.cs
using System;
class Test {
    static void Main() {
        string _string = "にしむらたかし";
        Console.WriteLine(_string.Remove(0, 4)); //"たかし"
    }
}
```

### 置換
* 構文
```
String.Replace("置換前の文字列", "置換後の文字列");
String.Replace('置換前の文字', '置換後の文字');
```
* 例文
```
//test.cs
using System;
class Test {
    static void Main() {
        string _string = "2017年04月19日";
        Console.WriteLine(_string.Replace("2017年", "平成29年")); //"平成29年04月19日"
    }
}
```

### 検索
* 構文
```
String.IndexOf("検索したい文字列", 開始位置);
String.IndexOf('検索したい文字', 開始位置);
```
* 例文
```
//test.cs
using System;
class Test {
    static void Main() {
        string _string = "ABCDEFG-ABCDEFG";
        string _word = "CD";
        int _i = 0;
        while (_string.IndexOf(_word, _i) != -1) { //見つからない場合「-1」
            int _num = _string.IndexOf(_word, _i);
            Console.WriteLine(_num); //2、10 ←"CD"が見つかった位置を出力
            Console.WriteLine(_string.Substring(_num, _word.Length)); //"CD"、"CD"
            _i = _num + 1;
        }
    }
}
```

### 文字列→配列
* 構文
```
String.Split('区切り文字');
```
* 例文
```
//test.cs
using System;
class Test {
    static void Main() {
        string _string = "A,B,C,D"; //「,」区切りの文字列
        string[] _array = _string.Split(','); //「,」区切りで分割して配列化
        foreach (object value in _array) {
            Console.WriteLine(value); // "A"→"B"→"C"→"D"
        }
    }
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2015年11月17日  
更新日：2017年04月19日


<a name="正規表現"></a>
# <b>正規表現</b>

* C# には以下のサンプル以外にも多くの正規表現の機能が用意されています

### マッチした数
```
//test.cs
using System;
using System.Text.RegularExpressions; //Regexに必要
class Test {
    static void Main() {
        string _string = "cabacbbacbcba";
        //"a"がいくつ含まれるか
        MatchCollection _mc = Regex.Matches(_string, "a");
        Console.WriteLine(_mc.Count); //4
    }
}
```

### パスワード
```
//test.cs
using System;
using System.Text.RegularExpressions; //Regexに必要
class Test {
    static void Main() {
        string _string = @"U7eLoERa"; //任意のパスワード（@を付ける）
        /* 条件
        8文字以上（全て半角）
        1文字以上の「数字」を含む
        1文字以上の大文字および小文字の「英字」を含む
        */
        Regex _regex = new Regex(@"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])\w{8,}$");//②
        Match _match = _regex.Match(_string);
        Console.WriteLine(_match.Success); //True ←パスワードとして条件に合致
    }
}
```

### 郵便番号（7桁）
```
//test.cs
using System;
using System.Text.RegularExpressions; //Regexに必要
class Test {
    static void Main() {
        string _string = "156-0057"; //任意の郵便番号
        Regex _regex = new Regex("\\d{3}-\\d{4}");
        Match _match = _regex.Match(_string);
        Console.WriteLine(_match.Success); //True ←郵便番号として条件に合致
    }
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2015年11月19日  
更新日：2017年04月19日


<a name="インターフェース"></a>
# <b>インターフェース</b>

### 概要
* クラスにどのような機能（メソッド）を持たせるか、ということだけを定める
* 抽象クラスと似ているが、抽象クラスとは異なり、実際の処理は一切記述できない
* 実際の処理はインターフェースを継承したクラスで定義（実装しないとエラー）
* 多重実装（複数のインターフェースを同時に指定）や多重継承も可能

### 構文
```
//インターフェースの宣言
interface Iインターフェース名 { //慣例的にインターフェース名の先頭にIを付けます
    戻り値の型 メソッド名Ａ([型① 引数①, 型② 引数②,...]); //暗黙的にpublic扱い
    ......
}
//インターフェースの実装
class クラス名 : Iインターフェース名 { ......
```

### 例文
```
//test.cs
using System;
class Test {
    static void Main() {
        Moneybox _moneybox = new Moneybox();
        _moneybox.Add(5000);
        Console.WriteLine(_moneybox.Total); //5000
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

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2015年11月21日  
更新日：2017年04月19日


<a name="抽象クラス（abstract）"></a>
# <b>抽象クラス（abstract）</b>

### 概要
* 派生クラスに"実装しなければならないメソッド"を抽象クラスで定義する
* 実際の処理は、抽象クラスを継承した派生クラスで、抽象メソッドを override して記述

### 構文
```
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
```
//test.cs
using System;
class Test {
    static void Main() {
        SubClass _subClass = new SubClass();
        _subClass.Common(); //"AbstractClass.Common()"
        _subClass.Method(); //"SubClass.Method()"
    }
}
abstract class AbstractClass { //「抽象クラス」の定義
    public void Common() { //共通のメソッド
        Console.WriteLine("AbstractClass.Common()");
    }
    public abstract void Method(); //「抽象メソッド」の宣言（実際の処理は書かない）
}
class SubClass : AbstractClass { //抽象クラスを継承
    public override void Method() { //オーバーライドして実際の処理を記述
        Console.WriteLine("SubClass.Method()"); //実際の処理
    }
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2015年11月24日  
更新日：2017年04月21日


<a name="baseキーワード"></a>
# <b>base キーワード</b>

### 概要
基本クラスに定義されたコンストラクタ（private 以外）は、派生クラスのコンストラクタが実行される直前に必ず実行されるその際、基本クラスのコンストラクタへ、派生クラスのコンストラクタから引数を渡すことがbaseを使うことで可能になる（≒ super）base.メソッド() で基本クラスのメソッドを呼び出す事が可能（「[オーバーライド](#オーバーライド)」参照）

### 書式
```
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
```
//test.cs
using System;
class Test {
    static void Main() {
        SubClass _subClass = new SubClass("A");
    }
}
class SuperClass { //基本クラス
    public SuperClass(string p1, string p2) { //基本クラスのコンストラクタ
        Console.WriteLine("SuperClass:" + p1 + ":" + p2); //①番目（p1は"A"、p2は"B"）
    }
}
class SubClass : SuperClass { //派生クラス
    public SubClass(string p) : base(p, "B") { //派生クラスのコンストラクタ
        Console.WriteLine("SubClass:" + p); //②番目（pは"A"）
    } 
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2015年11月24日  
更新日：2017年04月21日


<a name="オーバーライド"></a>
# <b>オーバーライド</b>

### 概要
* 基本クラス（または抽象クラス）で定義したメソッドを、派生クラスで再定義することをオーバーライドと呼ぶ
* オーバーライドできるメソッドは、基本クラスの場合 virtual 、抽象クラスの場合 abstract キーワードが付加されたものに限る
* 基本クラスのメソッドを、オーバーライドによって拡張する場合などで、基本クラスのメソッドを呼び出したい場合は、base.メソッド名() を使用する（「[base キーワード](#baseキーワード)」参照）

### 「仮想メソッド」のオーバーライド
* 書式
```
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
```
//test.cs
using System;

class Test {
    static void Main() {
        SubClass _subClass = new SubClass();
        _subClass.Method();
    }
}

class SuperClass { //基本クラス
    public virtual void Method() { //オーバーライドを許可
        Console.WriteLine("SuperClass.Method");
    }
}

class SubClass : SuperClass { //派生クラス（基本クラスを継承）
    public override void Method() { //基本クラスのメソッドのオーバーライド
        Console.WriteLine("SubClass.Method");
        base.Method(); //"SuperClass.Method"←基本クラスのメソッド実行（オプション）
    } 
}
```

### 「抽象メソッド」のオーバーライド
* 書式
```
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
```
//test.cs
using System;

class Test {
    static void Main() {
        SubClass _subClass = new SubClass();
        _subClass.Method();
    }
}

abstract class AbstractClass { //抽象クラス
    public abstract void Method(); //抽象メソッドの宣言
}

class SubClass : AbstractClass { //派生クラス（抽象クラスを継承）
    public override void Method() { //オーバーライドして実際の処理を記述
        Console.WriteLine("AbstractClass.Method");
    } 
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2015年11月24日  
更新日：2017年04月21日


<a name="カスタムイベント"></a>
# <b>カスタムイベント</b>

### 概要
イベントとは、あるアクションが発生したことを自動的に通知する仕組みカスタムクラス内で何か処理をし終えた際、別のオブジェクトにそのことを知らせる場合に、このイベント機能を使用イベントを設定したカスタムクラスからは、情報（イベント）を発信するだけ情報を受けたいオブジェクトは、リスナーメソッドを準備して待ち受ける...このことにより、カスタムクラスを汚さずに済む、というメリットが生まれるC# に用意された event は、特殊なデリゲート（delegate）と言えるものですデリゲートとの違いは、event 宣言した変数（イベント名）には、イベントハンドラ（≒リスナー関数）の追加（+=）または削除（-=）のみ可能ということ等

### 書式
* イベントの設定
```
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
```
クラス名 ○ = new クラス名();
○.イベント名 += イベントハンドラ名; //イベントハンドラを削除する場合「-=」
……
static 戻り値の型 イベントハンドラ名([型 引数]) {
    //イベントが発生した際に処理すること
}
```

### 例文
```
//test.cs
using System;

class Test {
    static void Main() {
        MyGame _myGame = new MyGame();
        _myGame.GameOverEvent += GameOverHandler_myGame; //複数登録可能（+=、-=のみ）
        //_myGame.GameOverEvent -= GameOverHandler_myGame; //イベントハンドラの削除
        for (int i=0; i<10; i++) { //10回繰返す場合…
            Console.WriteLine("得点:" + _myGame.Point);
            _myGame.AddPoint();
        }
    }

    static void GameOverHandler_myGame(object arg) { //イベントハンドラ
        Console.WriteLine("ゲームオーバー! " + arg); //"ゲームオーバー! MyGame"
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

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2015年11月25日  
更新日：2017年04月21日


<a name="数学関数（Math）"></a>
# <b>数学関数（Math）</b>

### Math.Sin() : サイン（正弦）
```
//test.cs
using System;
class Test {
    static void Main() {
        Console.WriteLine(Math.Sin(0)); //0 ←0°
        Console.WriteLine(Math.Sin(Math.PI/2)); //1 ←90°
        Console.WriteLine(Math.Sin(Math.PI)); //1.22460635382238E-16（≒0）←180°
        Console.WriteLine(Math.Sin(Math.PI*3/2)); //-1 ←270°
        Console.WriteLine(Math.Sin(Math.PI*2)); //-2.44921270764475E-16（≒0）←360°
    }
}
```

### Math.Cos() : コサイン（余弦）
```
//test.cs
using System;
class Test {
    static void Main() {
        Console.WriteLine(Math.Cos(0)); //1 ←0°
        Console.WriteLine(Math.Cos(Math.PI/2)); //6.12303176911189E-17（≒0）←90°
        Console.WriteLine(Math.Cos(Math.PI)); //-1 ←180°
        Console.WriteLine(Math.Cos(Math.PI*3/2)); //-1.83690953073357E-16（≒0）←270°
        Console.WriteLine(Math.Cos(Math.PI*2)); //1 ←360°
    }
}
```

### Math.Atan2() : アークタンジェント2
```
//test.cs
using System;
class Test {
    static void Main() {
        //2つの値のアークタンジェント（逆タンジェント）X、Y座標の角度をラジアン単位で返す
        //Πラジアン（3.141592…）は180°
        //三角形の各辺が1:2:√3の場合、2:√3の間の角度は30°であることを検証
        double _disX = Math.Sqrt(3); //√3のこと
        int _disY = 1;
        Console.WriteLine(Math.Atan2(_disY, _disX)); //0.523598775598299（ラジアン）
        Console.WriteLine(180*Math.Atan2(_disY, _disX)/Math.PI); //30（度）
    }
}
```

### Math.PI : 円周率
```
//test.cs
using System;
class Test {
    static void Main() {
        Console.WriteLine(Math.PI); //3.14159265358979（Math.PIラジアン=180°）
    }
}
```

### Math.Floor() : 切り捨て
```
//test.cs
using System;
class Test {
    static void Main() {
        Console.WriteLine(Math.Floor(1.001)); //1
        Console.WriteLine(Math.Floor(1.999)); //1
    }
}
```

### Math.Ceiling() : 切り上げ
```
//test.cs
using System;
class Test {
    static void Main() {
        Console.WriteLine(Math.Ceiling(1.001)); //2
        Console.WriteLine(Math.Ceiling(1.999)); //2
    }
}
```

### Math.Round() : 四捨五入
```
//test.cs
using System;
class Test {
    static void Main() {
        Console.WriteLine(Math.Round(1.499)); //1
        Console.WriteLine(Math.Round(1.500)); //2
    }
}
```

### Math.Abs() : 絶対値
```
//test.cs
using System;
class Test {
    static void Main() {
        Console.WriteLine(Math.Abs(100)); //100
        Console.WriteLine(Math.Abs(-100)); //100
    }
}
```

### Math.Pow() : 累乗（○の□乗）
```
//test.cs
using System;
class Test {
    static void Main() {
        Console.WriteLine(Math.Pow(2, 0)); //1（2の0乗）
        Console.WriteLine(Math.Pow(2, 8)); //256（2の8乗）
    }
}
```

### Math.Sqrt() : 平方根（√○）
```
//test.cs
using System;
class Test {
    static void Main() {
        Console.WriteLine(Math.Sqrt(2)); //1.4142135623731（一夜一夜にひとみごろ）
        Console.WriteLine(Math.Sqrt(3)); //1.73205080756888（人並みに奢れや）
        Console.WriteLine(Math.Sqrt(4)); //2
        Console.WriteLine(Math.Sqrt(5)); //2.23606797749979（富士山麓オウム鳴く）
    }
}
```

### Math.Max() : 比較（最大値）
```
//test.cs
using System;
class Test {
    static void Main() {
        Console.WriteLine(Math.Max(5.01, -10)); //5.01 ←「2つ」の数値の比較
    }
}
```

### Math.Min() : 比較（最小値）
```
//test.cs
using System;
class Test {
    static void Main() {
        Console.WriteLine(Math.Min(5.01, -10)); //-10 ←「2つ」の数値の比較
    }
}
```

### Math.Sign() : 符号（正か負の値か）
```
//test.cs
using System;
class Test {
    static void Main() {
        Console.WriteLine(Math.Sign(-0.1)); //-1（負の値）
        Console.WriteLine(Math.Sign(0)); //0（0）
        Console.WriteLine(Math.Sign(0.1)); //1（正の値）
    }
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2015年11月26日  
更新日：2017年04月21日


<a name="乱数"></a>
# <b>乱数</b>
* システム時間を元に発生させているためfor文で同時に異なる乱数を発生できない

### 書式
```
Random ○ = new Random([seed値]);
//↑引数（シード値）を省略するとEnvironment.TickCount（システム時間）を利用
○.NextDouble(); //0〜1.0までの浮動小数点数の乱数
○.Next(); //整数値の乱数（百万〜数十億等）
○.Next(整数値); //0〜整数値の値の乱数（整数）
```

### 例文
```
//test.cs
using System;
class Test {
    static void Main() {
        Random _random = new Random();
        
        //0〜1.0までの乱数
        Console.WriteLine(_random.NextDouble()); //0.0432652673350072
        Console.WriteLine(_random.NextDouble()); //0.78664848541429
        Console.WriteLine(_random.NextDouble()); //0.545385330900118
        
        //整数値の乱数
        Console.WriteLine(_random.Next()); //369339869
        Console.WriteLine(_random.Next()); //1966699381
        Console.WriteLine(_random.Next()); //6900123
        
        //任意の値までの整数値の乱数
        Console.WriteLine(_random.Next(10)); //0
        Console.WriteLine(_random.Next(10)); //3
        Console.WriteLine(_random.Next(10)); //9
    }
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2015年11月26日  
更新日：2017年04月21日


<a name="日時情報"></a>
# <b>日時情報</b>

### 書式
```
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
```
//test.cs
using System;
class Test {
    static void Main() {
        DateTime _now = DateTime.Now;
        Console.WriteLine(_now); //4/21/2017 10:16:04 AM
        Console.WriteLine(_now.Year); //2017
        Console.WriteLine(_now.Month); //4
        Console.WriteLine(_now.Day); //21
        Console.WriteLine(_now.DayOfYear); //111（元日からの日数）
        Console.WriteLine(_now.DayOfWeek); //Friday
        Console.WriteLine(_now.Hour); //10
        Console.WriteLine(_now.Minute); //16
        Console.WriteLine(_now.Second); //4
        Console.WriteLine(_now.Millisecond); //337
        Console.WriteLine(_now.Ticks); //636283665643372990（100ナノ秒単位）
        //"hh:mm:ss"で現在の時間を表示する方法
        string _h = (_now.Hour < 10) ? "0" + _now.Hour : _now.Hour.ToString();
        string _m = (_now.Minute < 10) ? "0" + _now.Minute : _now.Minute.ToString();
        string _s = (_now.Second < 10) ? "0" + _now.Second : _now.Second.ToString();
        Console.WriteLine(_h + ":" + _m + ":" + _s); //"10:16:04"
    }
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2015年11月27日  
更新日：2017年04月21日


<a name="タイマー"></a>
# <b>タイマー</b>

### スレッドタイマー（System.Threading.Timer）を使う方法
```
//test.cs
/*
システムタイマー（後述）と比較すると軽量
Windows Formでの使用は非推奨
*/
using System;
using System.Threading; //System.Threading.Timerに必要

class Test {
    private static Timer _timer; //privateは省略可
        
    static void Main() {
        _timer = new Timer(new TimerCallback(Loop)); //タイマーの生成
        _timer.Change(0, 1000); //0ミリ秒後から、1000ミリ秒間隔で開始!
        Console.ReadLine(); //ここでは必須（要注意）
    }

    static void Loop(object arg) { //1000ミリ秒毎に実行される
        Console.WriteLine(arg); //System.Threading.Timer
        //_timer.Change(Timeout.Infinite, Timeout.Infinite); //停止 ←力技
    }
}
```

### システムタイマー（System.Timers.Timer）を使う方法
```
//test.cs
/* 
サーバベース・タイマーとも呼ばれる
スレッドタイマー（前述）と比較すると重いが精度が高い
スレッドの経過時間とは独立した時間監視をする
Windows Formでの使用もＯＫ
*/
using System;
using System.Timers; //System.Timers.Timerに必要

class Test {
    private static Timer _timer; //privateは省略可

    static void Main() {
        _timer = new Timer(); //タイマーの生成
        _timer.Interval = 1000; //1000ミリ秒間隔
        _timer.Elapsed += new ElapsedEventHandler(Loop); //イベントハンドラの追加
        _timer.Start(); //開始!
        Console.ReadLine(); //ここでは必須（要注意）
    }
    
    static void Loop(object arg1, EventArgs arg2) { //1000ミリ秒毎に実行される
        Console.WriteLine(arg1); //System.Timers.Timer（タイマー本体）
        Console.WriteLine(arg2); //System.Timers.ElapsedEventArgs（各種情報）
        //_timer.Stop(); //停止 ←この場合１回で停止
    }
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2015年11月27日  
更新日：2017年04月21日


<a name="処理速度計測"></a>
# <b>処理速度計測</b>

### DateTime構造体を使う方法
```
//test.cs
//日時情報を得るためのDatetime構造体を利用して計測する方法
using System; //DateTimeに必要
class Test {
    static void Main() {
        long _start = DateTime.Now.Ticks; //100ナノ秒単位（精度は10ミリ秒）
        for (long i=0; i<10000000000; i++) { //100億回繰り返す場合…
            //速度計測したい処理
        }
        Console.WriteLine(DateTime.Now.Ticks - _start); //33060210（≒3.3秒）
    }
}
```

### Stopwatchクラスを使う方法
```
//test.cs
/*
.NET Framework 2.0から追加された機能
Stopwatchクラスのインスタンスを生成しStart/Stopメソッドを実行するだけで可能
*/
using System; 
using System.Diagnostics; //Stopwatchに必要
class Program     { 
    static void Main() { 
        Stopwatch _stopWatch = new Stopwatch(); //インスタンスの生成
        _stopWatch.Start(); //計測開始
        for (long i=0; i<10000000000; i++) { //100億回繰り返す場合…
            //速度計測したい処理
        }
        _stopWatch.Stop(); //計測終了
        Console.WriteLine(_stopWatch.ElapsedMilliseconds); //3230（ミリ秒）
        Console.WriteLine(_stopWatch.Elapsed); //00:00:03.2302265（秒）
    }
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成日：2015年11月28日  
更新日：2017年04月21日


<a name="外部テキストの読み込み"></a>
# <b>外部テキストの読み込み</b>
* [Web サーバ](http://bit.ly/2mbzR4D)を稼働する必要はない

### テキストファイルの用意（sample.txt/UTF-8として保存）
```
あいうえお
かきくけこ
さしすせそ
```

### 例文（StreamReader クラスを使う方法）
```
//test.cs
using System;
using System.IO; //StreamReaderに必要
class Test { 
    static void Main() {
        string _path = "sample.txt";
        //↓Shift-JISなどUTF-8以外の場合、第2引数で指定します
        StreamReader _stream = new StreamReader(_path); //.txt以外も可能
        string _string = _stream.ReadToEnd(); //全ての内容を読み込む
        _stream.Close(); //閉じる
        Console.WriteLine(_string); //結果を出力
    }
}
```

###  例文（File.OpenTextメソッドを使う方法）
```
//test.cs
using System;
using System.IO; //StreamReaderに必要
class Test { 
    static void Main() {
        string _path = "sample.txt";
        StreamReader _stream = File.OpenText(_path); //.txt以外も可能（UFT-8限定）
        string _string = _stream.ReadToEnd(); //全ての内容を読み込む
        _stream.Close(); //閉じる
        Console.WriteLine(_string); //結果を出力
    }
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2015年11月30日  
更新日：2017年04月21日