### <b>この項目は編集中の項目です</b>

# <b>C言語 基礎文法</b>

### <b>INDEX</b>

* Hello,world! （[Linux](https://github.com/TakashiNishimura/HelloWorld/blob/master/C/C_linux.md) / [macOS](https://github.com/TakashiNishimura/HelloWorld/blob/master/C/C_mac.md) / [Windows](https://github.com/TakashiNishimura/HelloWorld/blob/master/C/C_win.md)）
* [データ型](#データ型)
* [データ型の操作](#データ型の操作)
* [構造体](#構造体)
* [変数とスコープ](#変数とスコープ)
* [演算子](#演算子)
***
* [関数](#関数)
* [匿名メソッド](#匿名メソッド)
* [ラムダ式](#ラムダ式)
* [静的メンバ（static）](#静的メンバ（static）)
* [if 文](#if文)
* [三項演算子](#三項演算子)
* [switch 文](#switch文)
* [for 文](#for文)
* [foreach 文](#foreach文)
* [while 文](#while文)
* [配列](#配列)
* [動的配列（List）](#動的配列（List）)
* [連想配列（Dictionary）](#連想配列（Dictionary）)
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

```
//test.c
#include <stdio.h> //printf()関数に必要
#include <stdbool.h> //boolに必要（標準では未サポート）

int main() {
    //========================
    //bool型（stdbool.hが必要）
    //========================
    bool _bool = true; //or false
    printf("%d\n", _bool); //=> 1（or 0）

    //====================================
    // 整数型 : unsigned short型（0〜65,535）
    //====================================
    unsigned short int _uShortInt = 65535;
    printf("%d\n", _uShortInt); //=> 65535

    //======================================
    // 整数型 : short int型（-32,768〜32,767）
    //======================================
    short int _shortInt = -32768;
    printf("%d\n", _shortInt); //=> -32768

    //======================================================
    // 整数型 : unsigned int型（-2,147,483,647〜2,147,483,647）
    //======================================================
    unsigned int _uInt = 2147483647;
    printf("%d\n", _uInt); //=> 2147483647

    //============================
    //整数型 : int型（16進数の場合）
    //============================
    int _int16 = 0xFFCC00; //16進数の場合
    printf("%d\n", _int16); //=> 16763904

    //========================
    //浮動小数点数型（4バイト）
    //========================
    float _float = 3.1415926f; //最後に「f」
    printf("%f\n", _float); //3.141593

    //======================
    //文字型（char型＝1文字）
    //======================
    char _char = 'a'; //シングルクォーテーション
    printf("%c\n", _char); //=> a

    //===========================
    //文字型（string型＝2文字以上）
    //===========================
    char _string[] = "abc"; //ダブルクォーテーション
    printf("%s\n", _string); //=> abc

    //=========
    // 構造体型
    //=========
    struct name { //定義は先に記述する必要あり（関数の外で定義可）
        char romaji[32];
        char kanji[32];
    };
    struct name _taro = {"TARO", "太郎"};
    struct name _hanako = {"HANAKO", "花子"};
    printf("%s\n", _taro.romaji); //-> TARO
    printf("%s\n", _taro.kanji); //=> 太郎
    printf("%s\n", _hanako.romaji); //=> HANAKO
    printf("%s\n", _hanako.kanji); //=> 花子

    //=======
    // 配列
    //=======
    char _array[3] = {'A','B','C'}; //4個の空の要素を持つ配列の場合
    printf("%c\n", _array[0]); //=> A
    printf("%c\n", _array[1]); //=> B
    printf("%c\n", _array[2]); //=> C

    return 0;
}
```

実行環境：Ubuntu 16.04.2 LTS、GCC 5.4.0  
作成者：Takashi Nishimura  
作成日：2017年06月06日  


<a name="データ型の操作"></a>
# <b>データ型の操作</b>

### サイズ（バイト）の調べ方 : sizeof()
* 「sizeof 式」または「sizeof(式)」、「sizeof(型の名前)」によって式や型のサイズ（バイト）を調べることが可能
* sizeof() 演算子で返す値は size_t 型である
```
//test.c
#include <stdio.h> //printf()関数に必要
#include <stdbool.h> //boolに必要（標準では未サポート）

int main() {
    size_t _size; //sizeof()の返り値（sizes_t型）を格納する

    //========================
    // bool型（stdbool.hが必要）
    //========================
    bool _bool = true; //or false
    _size = sizeof _bool;
    printf("%d\n", (int)_size); //=> 1（バイト）

    //====================================
    // 整数型 : unsigned short型（0〜65,535）
    //====================================
    unsigned short int _uShortInt = 65535;
    _size = sizeof _uShortInt;
    printf("%d\n", (int)_size); //=> 2（バイト）

    //======================================
    // 整数型 : short int型（-32,768〜32,767）
    //======================================
    short int _shortInt = -32768;
    _size = sizeof _shortInt;
    printf("%d\n", (int)_size); //=> 2（バイト）

    //=======================================================
    // 整数型 : unsigned int型（-2,147,483,647〜2,147,483,647）
    //=======================================================
    unsigned int _uInt = -2147483647;
    _size = sizeof _uInt;
    printf("%d\n", (int)_size); //=> 4（バイト）

    //==============================
    // 整数型 : int型（16進数の場合）
    //==============================
    int _int16 = 0xFFCC00; //16進数の場合
    _size = sizeof _int16;
    printf("%d\n", (int)_size); //=> 4（バイト）

    //========================
    // 浮動小数点数型（4バイト）
    //========================
    float _float = 3.1415926f; //最後に「f」
    _size = sizeof _float;
    printf("%d\n", (int)_size); //=> 4（バイト）

    //===============
    // 文字型（1文字）
    //===============
    char _char = 'a'; //シングルクォーテーション
    _size = sizeof _char;
    printf("%d\n", (int)_size); //=> 1（バイト）

    //===================
    // 文字型（2文字以上）
    //===================
    char _string[] = "abc"; //ダブルクォーテーション
    _size = sizeof _string;
    printf("%d\n", (int)_size); //=> 4（バイト）

    //=========
    // 構造体型
    //=========
    struct name { //定義は先に記述する必要あり（関数の外で定義可）
        char romaji[32];
        char kanji[32];
    };
    struct name _taro = {"TARO", "太郎"};
    struct name _hanako = {"HANAKO", "花子"};
    _size = sizeof _taro;
    printf("%d\n", (int)_size); //=> 64（バイト）

    //=======
    // 配列
    //=======
    char _array[3] = {'A','B','C'}; //4個の空の要素を持つ配列の場合
    _size = sizeof _array;
    printf("%d\n", (int)_size); //=> 3（バイト）

    return 0;
}
```

### データ型のキャスト
1. 数値→bool型へ変換
    ```
    //test.c
    #include <stdio.h> //printf()関数に必要
    #include <stdbool.h> //boolに必要（標準では未サポート）
    int main() {
        int _int = 999;
        bool _bool = (bool)_int; //数値をbool型に変換
        printf("%d\n", _bool); //=> 1（true）
        return 0;
    }
    ```

1. bool型→数値へ変換
    ```
    //test.c
    #include <stdio.h> //printf()関数に必要
    #include <stdbool.h> //boolに必要（標準では未サポート）
    int main() {
        bool _bool = true;
        int _int = (int)_bool; //数値をbool型に変換
        printf("%d\n", _int); //=> 1（falseの場合0）
        return 0;
    }
    ```

1. 数値→数値（整数の縮小変換＝変換失敗）
    ```
    //test.c
    #include <stdio.h> //printf()関数に必要
    int main() {
        int _tmp = 2147483647; //intは-2,147,483,648〜2,147,483,647
        short int _tmp2= (short int)_tmp;
        printf("%d\n", _tmp2); //-1 ←元のデータが失われる
        return 0;
    }
    ```

1. 数値→数値（浮動小数点数の縮小変換）
    ```
    //test.c
    #include <stdio.h> //printf()関数に必要
    int main() {
        double _double = 3.14159265358979323846264338327950288;
        float _float = (float)_double;
        printf("%f\n", _float); //=> 3.141593（元のデータが失われる）
        return 0;
    }
    ```

1. 文字列→数値
    ```
    //test.c
    #include <stdio.h> //printf()関数に必要
    #include <stdlib.h> //atoi関数に必要
    int main() {
        int _int = atoi("001");
        printf("%d\n", _int); //=> 1
        return 0;
    }
    ```

1. 数値→文字列
    ```
    //test.c
    #include <stdio.h> //printf()関数に必要
    #include <stdlib.h> //atoi関数に必要
    int main() {
        int _int = 100;
        char _char[32];
        sprintf(_char, "%d", _int); //数値（_int）を文字列（_char）に変換
        printf("%s\n", _char); //=> 100（文字列）
        return 0;
    }
    ```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2017年06月06日


<a name="構造体"></a>
# <b>構造体</b>

### 概要
* 異なるデータ型の変数をひとまとめにしたもの（配列のように順番にアクセスすることは出来ない）
* 例えばある人の「名前」「年齢」「身長」「体重」など異なるデータ型をひとまとめにしたもの
* C++ のクラスと異なり、扱えるメンバ（変数）はデータのみです（関数などは不可）
* C++ のクラスと異なり、アクセス修飾子によるスコープの指定は不可
* オブジェクト指向的な記述も可能だが煩雑

### 例文
```
//test.c
#include <stdio.h> //printf()関数に必要

//================
// 長方形「構造体」
//================
struct Member {
    char *name; //メンバ（変数）の宣言
    int age; //メンバ（変数）の宣言
}; //ここに構造体変数（初期値設定可能）を設定することも可能


int main() {
    //メンバー１
    struct Member _member01; //構造体変数の宣言
    _member01.name = "Takashi Nishimura"; //メンバ（変数）の設定
    _member01.age = 49; //メンバ（変数）の設定

    //メンバー２
    struct Member _member02; //構造体変数の宣言
    _member02.name = "Hanako Nishimura"; //メンバ（変数）の設定
    _member02.age = 48; //メンバ（変数）の設定

    printf("%s\n", _member01.name); //=> Takashi Nishimura
    printf("%d\n", _member01.age); //=> 49
    printf("%s\n", _member02.name); //=> Hanako Nishimura
    printf("%d\n", _member02.age); //=> 48

    return 0;
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2017年06月07日


<a name="変数とスコープ"></a>
# <b>変数とスコープ</b>

```
//test.c
#include <stdio.h> //printf()関数に必要

//==================================
//グローバル変数の定義（宣言のみでも可）
//==================================
char _char[] = "グローバル変数";

int main() {
    printf("%s\n", _char); //=> "グローバル変数"

    //=============================================
    //ローカル変数の定義（関数またはブロック内のみ有効）
    //=============================================
    char _char[] = "ローカル変数"; //グローバル変数より優先

    printf("%s\n", _char); //=> "ローカル変数"

    return 0;
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2017年06月09日


<a name="演算子"></a>
# <b>演算子</b>

```
//test.c
#include <stdio.h> //printf()関数に必要

int main() {
    printf("%d\n", 3 + 2); //5(可算)
    printf("%d\n", 5 - 8); //-3(減算)
    printf("%d\n", 3 * 4); //12(乗算)
    printf("%d\n", 7 / 3); //2(除算) <=整数の場合、余りは切り捨てられる
    printf("%f\n", 7.0 / 3); //2.333333(除算:6位迄)
    printf("%d\n", 1 + 2 * 3 - 4 / 2); //5(複雑な計算)
    printf("%d\n", 63 % 60); //3(余剰)

    //除算（注意が必要）
    printf("%d\n", 8 / 3); //2(除算) <=整数同士の場合、余りは切り捨てられる
    printf("%f\n", 8 / 3.0); //2.666667（小数点第6位までの値）

     // 後ろに付けるインクリメント（デクリメント）
    // _hoge++（_hoge--）が返す値は、加算（減算）する前の_hogeの値です
    int _hoge = 0;
    int _piyo = _hoge++; //デクリメントの場合_hoge--
    printf("%d\n", _hoge); //1（デクリメントの場合-1）
    printf("%d\n", _piyo); //0（デクリメントの場合0）

    // 前に付けるインクリメント（デクリメント）
    // ++_hoge（--_hoge）が返す値は、加算（減算）後の_hogeの値です
    _hoge = _piyo = 0;
    _piyo = ++_hoge; //デクリメントの場合--_hoge
    printf("%d\n", _hoge); //1（デクリメントの場合-1）
    printf("%d\n", _piyo); //1（デクリメントの場合-1） <=注目

    return 0;
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2017年06月12日


<a name="関数"></a>
# <b>関数</b>

### 基本例文
```
//test.c
#include <stdio.h> //printf()関数に必要

//関数の定義（XX〜XXまでの値を足した合計を返す）
int tashizan(int _start, int _end) { //前方宣言
    int _result = 0; //ローカル変数
    for (int i = _start; i <= _end; i++) {
        _result += i;
    }
    return _result;
}

int main() {
    printf("%d\n", tashizan(1,10)); //=> 55
    printf("%d\n", tashizan(1,100)); //=> 5050
    return 0;
}
```

### main() 関数
```
//test.c
#include <stdio.h> //printf()関数に必要

int main() { //自動的に最初に実行される
    printf("%s\n", "自動的に実行");
    return 0;
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2017年06月13日


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
作成日：2017年06月1X日


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
作成日：2017年06月1X日


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
作成日：2017年06月1X日


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
作成日：2017年06月1X日


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
作成日：2017年06月1X日


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
作成日：2017年06月1X日


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
作成日：2017年06月1X日

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
作成日：2017年06月1X日


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
作成日：2017年06月1X日


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
作成日：2017年06月1X日


<a name="連想配列（map）"></a>
# <b>連想配列（map）</b>

### 作成と操作の基本
```
//test.cpp
#include <iostream> //cout に必要
#include <map> //map クラスに必要
using namespace std;
int main() {
    //①作成
    map<string, string> _map;
    //②追加
    _map["A"] = "あ"; //③削除は_map.erase("A")
    //_map.insert(make_pair("A", "あ")); //これでも可能
    _map["I"] = "い";
    _map["U"] = "う";
    //④更新
    _map["A"] = "ア";
    //⑤取得
    cout << _map["A"] << endl;
    return 0;
}
```

### キーの検索
```
//test.cpp
#include <iostream> //cout に必要
#include <map> //map クラスに必要
using namespace std;
int main() {
    map<string, string> map_;
    map_["A"] = "あ";
    map_["I"] = "い";
    map_["U"] = "う";
    auto iterator_ = map_.find("U");
    if (iterator_ != map_.end()) { cout << "存在します" << endl; //これが出力される
    } else { cout << "存在しません" << endl;
    } 
    return 0;
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2017年06月1X日


<a name="ポインタ"></a>
# <b>ポインタ</b>

### ポインタのメリット
* 大きなオブジェクトを簡単に扱える
* データそのものをコピーすることなく、複数の場所から同じデータを参照することが出来る

### 「参照」と「アドレス」
* 概要
    * <b>参照</b> は、C++ になって追加された機能で <b>変数につける別名</b> をいう
    * <b>&別名</b> は、メモリ上の位置（<b>アドレス</b>）を表します
    * <b>別名</b> の値にアクセスする場合は <b>&</b> は必要ない
    * <b>別名</b> もしくは元となる変数の値を変更すると、もう一方の値も変更されます
* 例文
    ```
    //test.cpp
    #include <iostream> //cout に必要
    using namespace std;

    int main() {
        string _tNishimura = "Takashi Nishimura"; //元となる変数
        string &tn = _tNishimura; //「別名」（&別名）を付ける
        _tNishimura = "Taro Nishimura";
        cout << _tNishimura << endl; //"Taro Nishimura"
        cout << tn << endl; //「別名」の値も"Taro Nishimura"に変更される
        cout << &tn << endl; //0x7ffce8727890 ←「&別名」で「アドレス」が返ります
        return 0;
    }
    ```

### ポインタ
* 概要
    * <b>ポインタ</b>とは、メモリ上の位置（<b>アドレス</b>）を格納する特殊な変数
    * <b>ポインタ</b>に、別の変数の<b>アドレス</b>を代入して置換することも可能
* 例文
    ```
    //test.cpp
    #include <iostream> //cout に必要
    using namespace std;

    int main() {
        string _name = "TAKASHI"; //変数の定義
        string* _pName = &_name; //変数の「アドレス」を「ポインタ」に格納
        
        //検証
        cout << _name << endl; //"TAKASHI" ←変数の値
        cout << &_name << endl; //0x7ffc37c32e90 ←変数の「アドレス」
        cout << _pName << endl; //0x7ffc37c32e90 ←「ポインタ」
        cout << *_pName << endl; //"TAKASHI" ←「ポインタ」から変数の値を取得
    }
    ```

### 引数にポインタを使う
* 通常、関数に引数を渡すときにはコピーが必要である。もし大量のデータをコピーしなければならない場合とても時間を要するが、ポインタを使うことでこれを回避できる。
* 利用方法
    ```
    値の型 変数名 = 値; //通常の変数の定義①
    cout << &変数名 << endl; //変数の「アドレス」が返る②
    値の型* ポインタ変数名 = &変数名; //変数の「アドレス」を「ポインタ」変数に格納③③'
    cout << ポインタ変数名 << endl; //「ポインタ」変数＝変数の「アドレス」が返る④
    cout << *ポインタ変数名 << endl; //「ポインタ」変数の値＝変数の値 が返る⑤
    *ポインタ変数名 = 新しい値; //「ポインタ」変数の値＝変数の値 を変更する⑥
    cout << 変数名_ << endl; //「ポインタ」変数に代入した新しい値が返る⑦
    ```
* 例文
    ```
    //test.cpp
    #include <iostream> //cout に必要
    using namespace std;

    //======
    // 関数
    //======
    void myFunction(string* _pName) { //渡された「アドレス」を「ポインタ」として引数に③'
        cout << _pName << endl; //0x7fff9c1ec060 ←変数の「アドレス」を格納したポインタ④
        cout << *_pName << endl; //"TAKASHI" ←「ポインタ」から変数の値を取得⑤
        *_pName = "TARO"; //変数の値を変更⑥
    }

    //============
    // メイン関数
    //============
    int main() {
        string _name = "TAKASHI"; //変数の定義①
        cout << &_name << endl; //0x7fff9c1ec060 ←変数の「アドレス」②
        myFunction(&_name); //「アドレス」を渡して関数を呼出す③
        cout << _name << endl; //"TARO" ←関数内で変数の値が変更されているため⑦
        return 0;
    }
    ```

### ポインタからメンバへのアクセス
* <b>ポインタ</b>からメンバにアクセスする場合には <b>アロー演算子（->）</b> を利用する
* 例文
    ```
    //test.cpp
    #include <iostream> //coutに必要
    using namespace std;

    //========
    // クラス
    //========
    class MyClass {
        public:
            void MyFunction();
    };
    void MyClass::MyFunction() {
        cout << "こんにちは" << endl;
    }

    //============
    // メイン関数
    //============
    int main() {
    MyClass* _pMyClass = new MyClass; //クラスのインスタンスを「ポインタ」に格納
        //_pMyClass.MyFunction(); //エラー
        //「ポインタ」からメンバにアクセスする場合には「アロー演算子（->）」を利用
        _pMyClass -> MyFunction(); //こんにちは ←ポインタからメンバ関数にアクセス
        return 0;
    }
    ```

### this ポインタ
* <b>this</b> ポインタは、class 型や struct 型（構造体型）のメンバー関数内でのみアクセスできる特殊なポインタ
* 例文
    ```
    //test.cpp
    #include <iostream> //coutに必要
    using namespace std;

    //========
    // クラス
    //========
    class MyClass {
        public:	MyClass Clone();
    };
    MyClass MyClass::Clone() {
        return *this; //thisポインタのオブジェクト自身の値（≒アドレス）を返す
    }

    //============
    // メイン関数
    //============
    int main() {
        MyClass _myClass;
        MyClass _copy = _myClass.Clone();
        cout << (&_myClass == &_copy) << endl; //0（アドレスが異なる＝参照ではなく複製）
        return 0;
    }
    ```

### 配列のポインタ
* 基本例文
    ```
    //test.cpp
    #include <iostream> //cout に必要
    using namespace std;
    int main() {
        using namespace std;
        string _array[] = {"A","B","C"};
        cout << _array[0] << endl; //"A"
        cout << _array[1] << endl; //"B"
        cout << _array[2] << endl; //"C"
        
        //検証
        cout << &_array << endl;    //0x7ffe74921f90 ←配列の先頭の要素の「アドレス」
        cout << &_array[0] << endl; //0x7ffe74921f90 ←配列の先頭の要素の「アドレス」
        cout << *_array << endl;    //"A" ←配列の先頭の要素の値
        //cout << *_array[0] << endl; //エラー
        cout << _array[0] << endl;  //"A" ←配列の先頭の要素の値
        
        return 0;
    }
    ```

* ポインタ演算
    ```
    //test.cpp
    #include <iostream> //cout に必要
    using namespace std;
    int main() {
        using namespace std;
        string _array[] = {"A","B","C"};
        
        //ポインタ演算
        cout << *_array << endl; //"A" ←配列の「先頭」の要素の値
        cout << *(_array + 1) << endl; //"B" ←配列の「先頭+1」の要素の値
        cout << *(_array + 2) << endl; //"C" ←配列の「先頭+2」の要素の値
        
        //「ポインタ演算」を使って全要素を取り出す
        int _arrayLength = sizeof(_array) / sizeof(_array[0]);
        for (int i=0; i<_arrayLength; i++) {
            cout << *(_array + i) << endl; //"A"→"B"→"C"
        }

        return 0;
    }
    ```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2017年06月1X日


<a name="this"></a>
# <b>this</b>

### 概要
* this が必要な場合は...
    * 「引数」と「メンバ変数」が同じ場合
    * 「ローカル変数」と「メンバ変数」が同じ場合
* this は、<b>this-></b> を記述したメソッドを所有するクラス（オブジェクト）を指す

### 例文
```
//test.cpp
#include <iostream> //cout に必要
using namespace std;

//========
// クラス
//========
class Robot {
    private:
        int _x; //「メンバ変数」の「宣言」
    public:
        Robot(int _x); //コンストラクタの「宣言」
        void Move(); //メンバ関数の「宣言」
        int X(); //_xのアクセス用メンバ関数（getter）	
};

Robot::Robot(int _x) {
    this->_x = _x; //①「this->」が無いと「引数」と「メンバ変数」がぶつかる
    cout << this << endl; //0x7ffdbae24810（この関数を実行されたオブジェクトを指す）
}

void Robot::Move() {
    int _x; //「ローカル変数」の「宣言」
    _x = this->_x + 10; //←②「this->」が無いと「ローカル変数」と「メンバ変数」がぶつかる
    if (_x >= 1920) _x = 0;
    this->_x = _x; //②「this->」が無いと「ローカル変数」と「メンバ変数」がぶつかる
    cout << this << endl; //0x7ffdbae24810（この関数を実行されたオブジェクトを指す）
}

int Robot::X() { return _x; } //「this->」を付けてもよい（通常は省略）

//============
// メイン関数
//============
int main() {
    Robot _robot(500); //インスタンスの生成
    _robot.Move();
    cout << _robot.X() << endl; //510
    //cout << this << endl; //エラー（参照できず）
    return 0;
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2017年06月1X日


<a name="文字列の操作"></a>
# <b>文字列の操作</b>

### 文字列オブジェクトの作成
```
//test.cpp
#include <iostream> //cout に必要
using namespace std;
int main() {
    string _string = "あいうえお";
    cout << _string << endl; //"あいうえお"
    return 0;
}
``` 

### 長さを調べる
```
//test.cpp
#include <iostream> //cout に必要
using namespace std;
int main() {
    string _string = "ABCDE";
    cout << _string.size() << endl; //5（_string.length()でも同じ）
}
```

### 一部分を取得
```
//test.cpp
#include <iostream> //cout に必要
using namespace std;
int main() {
    string _string = "0123456789";
    cout << _string[4] << endl; //"4" ←1文字だけ取得（string.length()-1まで指定可）
    cout << _string.substr(4) << endl; //"456789"
    cout << _string.substr(4,3) << endl; //"456"
}
```

### 一部分を削除
```
//test.cpp
#include <iostream> //cout に必要
using namespace std;
int main() {
    string _string = "0123456789";
    //_string.erase(4); //この場合4文字目以降を削除（0123となる）
    _string.erase(4,3); //4文字目（含む）から3文字を削除
    cout << _string << endl; //0123789
}
```

### 検索＆置換
```
//test.cpp
#include <iostream> //cout に必要
using namespace std;
int main() {
    string _string = "2017-04-27";
    string _old = "2017";
    string _new = "H29";
    string::size_type _pos = _string.find(_old, 0); //見つかった位置を返す
    while(_pos != string::npos){
        _string.replace(_pos, _old.size(), _new);
        _pos = _string.find(_old, _pos + _new.size()); //これが無いと無限ループ
    }
    cout << _string << endl;  // "H29-04-27"
    return 0;
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2017年06月1X日


<a name="正規表現"></a>
# <b>正規表現</b>

* C++ には以下のサンプル以外にも多くの正規表現の機能が用意されています

### 文字列を検索する
```
//test.cpp
#include <iostream> //cout に必要
#include <regex> //regex に必要
using namespace std;

int main() {
    string _string = "吉田松蔭,高杉晋作,久坂玄瑞,吉田稔麿,伊藤博文";
    regex regex_("吉田"); //完全一致
    //regex regex_("西*"); //部分一致
    if (regex_search(_string, regex_)) {
        cout << "吉田は含まれています" << endl;	
    } else {
        cout << "吉田は含まれていません" << endl;
    }
    return 0;
}
```

### 文字列を検索＆置換する
```
//test.cpp
#include <iostream> //cout に必要
#include <regex> //regex に必要
using namespace std;

int main() {
    string _string = "吉田松蔭,高杉晋作,久坂玄瑞,吉田稔麿,伊藤博文";
    regex regex_("吉田"); //完全一致
    if (regex_search(_string, regex_)) { //検索して見つかったら…
        cout << regex_replace(_string, regex_, "よしだ") << endl;
        //=> "よしだ松蔭,高杉晋作,久坂玄瑞,よしだ稔麿,伊藤博文"
    }
    return 0;
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2017年06月1X日


<a name="インターフェース"></a>
# <b>インターフェース</b>

### 概要
* interface キーワードは存在しない
* インターフェースと同等の処理を行うためには「純粋仮想関数」を利用する
* インターフェースクラスにはどんな機能（関数）を持たせるかということだけを定める

### 例文
```
//test.cpp
#include <iostream> //cout に必要
using namespace std;

//======================
// 擬似インターフェース
//======================
class IMoneybox {
    public:
        virtual void Add(int _money) = 0; //純粋仮想関数
        virtual int Total() = 0; //純粋仮想関数
        virtual void Total(int _total) = 0; //純粋仮想関数
};

//======================================
// 擬似インターフェースを継承するクラス
//======================================
class Moneybox : public IMoneybox { //擬似インターフェースクラスの継承
    private: int _total;
    public:
        Moneybox(); //コンストラクタの「宣言」
        void Add(int _money); //メンバ関数の「宣言」
        int Total(); //_totalのアクセス用メンバ関数（getter）
        void Total(int _total); //_totalのアクセス用メンバ関数（setter）
};
Moneybox::Moneybox() { _total = 0; }
void Moneybox::Add(int _money) { _total += _money; }
int Moneybox::Total() { return _total; }
void Moneybox::Total(int _total) { this->_total = _total; }

//============
// メイン関数
//============
int main() {
    Moneybox _moneybox; //インスタンスの生成
    _moneybox.Add(5000);
    cout << _moneybox.Total() << endl; //5000
    return 0;
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2017年06月1X日


<a name="抽象クラス"></a>
# <b>抽象クラス</b>

### 概要
* 標準では abstract キーワードは存在しない
* 抽象クラスと同等の処理を行うために「純粋仮想関数」を利用する
* インターフェースとは異なり、実装しなければならない関数の宣言だけでなく、共通の関数については実際の処理を記述することも可能
* 抽象クラスのインスタンスは生成することはできない

### 例文
```
//test.cpp
#include <iostream> //cout に必要
using namespace std;

class AbstractMakePage { //抽象クラス
    public:
        void MakeHeader(); //共通の関数の宣言
        virtual void MakeBody(string _string) = 0; //純粋仮想関数
};
void AbstractMakePage::MakeHeader() { //共通の関数の定義
    cout << "共通のお題：○○○" << endl;
}

class MakePageA : public AbstractMakePage { //抽象クラスの継承
    public:
        void MakeBody(string _string);
};
void MakePageA::MakeBody(string _string) {
    cout << _string << endl;
}

int main() {
    MakePageA _makePageA;
    _makePageA.MakeHeader();
    _makePageA.MakeBody("本文：○○○○○○");
    return 0;
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2017年06月1X日


<a name="基本クラスのコンストラクタを呼ぶ"></a>
# <b>基本クラスのコンストラクタを呼ぶ</b>

### 概要
* 基本（基底）クラスの「コンストラクタ」や「関数」を呼び出す
* コンストラクタの呼出しについては、C++の「base」キーワードにほぼ同じ挙動
* C++ には「base」キーワードは存在せず、その代りに「基本クラス名」を使用する

### 書式
```
//============
// 基本クラス
//============
class 基本クラス名 {
    public:
        基本クラス名(型 引数); //コンストラクタの宣言
        型 関数名(型 引数); //メンバ関数の宣言
    }
}
基本クラス名::基本クラス名(型 引数) { //コンストラクタの定義（引数は複数可能）
    //引数を使った処理etc
}
型 基本クラス名::関数名(型 引数) { //メンバ関数の定義
    ......
}

//============
// 派生クラス
//============
class 派生クラス名 : public 基本クラス名 { //基本クラスの継承
    public:
        派生クラス名(型 引数); //コンストラクタの宣言
        型 関数名(型 引数); //メンバ関数の宣言 ←基本クラスの関数と同名
}
派生クラス名::派生クラス名(型 引数) : 基本クラス名(引数) { //コンストラクタの定義
    //（残念ながら）ここの処理は基本クラスのコンストラクタの後で実行される
}
型 派生クラス名::関数名(型 引数) { //メンバ関数の定義 ←自動的にオーバーライド
    基本クラス::基本クラスの関数名(引数); //基本クラスの関数の呼出しは簡単！
}
```

### 例文
```
//test.cpp
#include <iostream> //coutに必要
using namespace std;

//============
// 基底クラス
//============
class SuperClass {
    public:
        SuperClass(string arg1, string arg2); //コンストラクタの宣言
        void MyFunction(string arg); //メンバ関数の定義
};
SuperClass::SuperClass(string arg1, string arg2) { //コンストラクタの定義
    cout << "基底クラスのコンストラクタ: " << arg1 << endl;
    cout << "2つ目の引数はオプション：" << arg2 << endl;
}
void SuperClass::MyFunction(string arg) { //派生クラスに同名あり（オーバーライド）
    cout << "基底クラスの関数: " << arg << endl;
}

//============
// 派生クラス
//============
class SubClass : public SuperClass { //基本クラスを継承
    public:
        SubClass(string arg); //コンストラクタの宣言
        void MyFunction(string arg); //メンバ関数（基底クラスに同名あり）の定義
};
SubClass::SubClass(string arg1) : SuperClass(arg1, "ほげ") { //コンストラクタの定義
    cout << "（残念ながら）ここの処理は基本クラスのコンストラクタの後で実行" << endl;
}
void SubClass::MyFunction(string arg) { //自動的にオーバーライドされる（重要）
    SuperClass::MyFunction(arg); //基底クラスの関数の呼出しは簡単！
}

//============
// メイン関数
//============
int main() {
    SubClass _subClass("派生クラスからの呼出し");
    _subClass.MyFunction("派生クラスからの呼出し");
    return 0;
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2017年06月1X日


<a name="オーバーライド"></a>
# <b>オーバーライド</b>

### 概要
基本クラス（または抽象クラス、インターフェースクラス）で定義した関数を、派生クラスで再定義することをオーバーライドと呼ぶ

### 普通のメンバ関数のオーバーライド
```
//test.cpp
#include <iostream> //coutに必要
using namespace std;

//============
// 基本クラス
//============
class SuperClass {
    public:
        void MyFunction(); //メンバ関数の宣言
};
void SuperClass::MyFunction() { //メンバ関数の定義
    cout << "基本クラスの関数" << endl;
}

//============
// 派生クラス
//============
class SubClass : public SuperClass {
    public:
        void MyFunction(); //自動的にオーバーライドされる
};
void SubClass::MyFunction() { //自動的にオーバーライドされる
    cout << "派生クラスの関数" << endl;
}

//============
// メイン関数
//============
int main() {
    SubClass _subClass;
    _subClass.MyFunction();
    return 0;
}
```

### 「仮想関数」のオーバーライド
```
//test.cpp
#include <iostream> //coutに必要
using namespace std;

class AbstractClass { //基本クラス（抽象クラス）
    public:
        virtual void MyFunction(); //「仮想関数」の宣言
};
void AbstractClass::MyFunction() { //「仮想関数」の定義
    cout << "抽象クラスの関数" << endl;
}

class MyClass : public AbstractClass { //派生クラス
    public:
        void MyFunction(); //これが無い場合は抽象クラスの関数が実行される
};
void MyClass::MyFunction() { //これが無い場合は抽象クラスの関数が実行される
    cout << "派生クラスの関数" << endl;
}

int main() { //メイン関数
    MyClass _myClass;
    _myClass.MyFunction(); //"MyClassの関数"
    return 0;
}
```

### 「純粋仮想関数」のオーバーライド
```
//test.cpp
#include <iostream> //coutに必要
using namespace std;

class AbstractClass { //基本クラス（抽象クラス）
    public:
        virtual void MyFunction() = 0; //「純粋仮想関数」（定義はしない）
};

class MyClass : public AbstractClass { //派生クラス
    public:
        void MyFunction(); //必ず定義（オーバーライド）する必要がある
};
void MyClass::MyFunction() { //必ず定義（オーバーライド）する必要がある
    cout << "派生クラスの関数" << endl; //実際の処理
}

int main() { //メイン関数
    MyClass _myClass;
    _myClass.MyFunction(); //"MyClassの関数"
    return 0;
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2017年06月1X日


<a name="カスタムイベント"></a>
# <b>カスタムイベント</b>

```
//test.cpp
#include <iostream> //coutに必要
#include <functional> //functionに必要
using namespace std;

//=================================
// カスタムクラス（Robotクラス）
//=================================
class Robot {
    private:
        int _energy = 100;
        //↓「匿名関数」を参照
        function<void()> _dieHandler; //die用のリスナー関数を格納する
    
    public:
        static const string DIE; //オプション
        //↓リスナー関数の「宣言」
        void AddEventListener(string _event, function<void()> _function);
        void Fight(); //メンバ関数の「宣言」
};

const string Robot::DIE = "die"; //オプション

//今回は removeEventListener() は省略
void Robot::AddEventListener(string _event, function<void()> _function) {
    if (_event == "die") {
        _dieHandler = _function; //die用のリスナー関数を設定（記憶）する
    } else {
        cout << "ERROR: Robot::AddEventListener()" << endl;
    }
}

void Robot::Fight() { //メンバ関数の「定義」
    _energy -= 20; //戦う度に25%エネルギーが減る…みたいな
    if (_energy <= 0) {
        _dieHandler(); //dieイベントの発生（リスナー関数を呼出す!!）
    }
}

//================
// メイン関数ほか
//================
void die_robot() { //リスナー関数
    cout << "GAME OVER!" << endl; //dieイベントが発生した時に実行すること
}

int main() {
    Robot _robot;
    _robot.AddEventListener("die", die_robot);
    //_robot.AddEventListener(Robot::DIE, die_robot); //これでも同じ
    _robot.Fight();	
    _robot.Fight();	
    _robot.Fight();
    _robot.Fight();	
    _robot.Fight(); //"GAME OVER!" ←ここでenery_が0となりdieイベント発生
    return 0;
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2017年06月1X日


<a name="数学関数"></a>
# <b>数学関数</b>

### sin() : サイン（正弦）
```
//test.cpp
#include <iostream> //coutに必要
#include <math.h> //「数学関数」に必要
using namespace std;
int main() {
    cout << sin(0) << endl; //0 ←0°
    cout << sin(M_PI_2) << endl; //1（sin(M_PI/2)と同じ）←90°
    cout << sin(M_PI) << endl; //1.22465e-16（≒0）←180°
    cout << sin(M_PI*3/2) << endl; //-1 ←270°
    cout << sin(M_PI*2) << endl; //-2.44929e-16（≒0）←360°
    return 0;
}
```

### cos() : コサイン（余弦）
```
//test.cpp
#include <iostream> //coutに必要
#include <math.h> //「数学関数」に必要
using namespace std;
int main() {
    cout << cos(0) << endl; //1 ←0°
    cout << cos(M_PI_2) << endl; //6.12323e-17（≒0）（cos(M_PI/2)と同じ）←90°
    cout << cos(M_PI) << endl; //-1 ←180°
    cout << cos(M_PI*3/2) << endl; //-1.83697e-16（≒0）←270°
    cout << cos(M_PI*2) << endl; //1 ←360°
    return 0;
}
```

### atan2() : アークタンジェント2
```
//test.cpp
#include <iostream> //coutに必要
#include <math.h> //「数学関数」に必要
using namespace std;
int main() {
    // 2つの値のアークタンジェント（逆タンジェント）。X、Y座標の角度をラジアン単位で返す
    // Πラジアン（3.141592…）は180°
    // 以下では、三角形の各辺が1:2:√3の場合、2:√3の間の角度は30°であることを検証
    double _disX = sqrt(3); //√3のこと
    int _disY = 1;
    cout << atan2(_disY, _disX) << endl; //0.523599（単位：ラジアン）
    cout << 180 * atan2(_disY, _disX) / M_PI << endl; //30（単位：度）
    return 0;
}
```

### M_PI : 円周率
```
//test.cpp
#include <iostream> //coutに必要
#include <math.h> //「数学関数」に必要
using namespace std;
int main() {
    cout << M_PI << endl; //3.14159（π）
    cout << M_PI_2 << endl; //1.5708（π/2）
    cout << M_PI_4 << endl; //0.785398（π/4）
    cout << M_1_PI << endl; //0.31831（1/π）
    cout << M_2_PI << endl; //0.63662（2/π）
    cout << M_SQRT2 << endl; //1.41421（sqrt(2)）
    return 0;
}
```

### floor() : 切り捨て
```
//test.cpp
#include <iostream> //coutに必要
#include <math.h> //「数学関数」に必要
using namespace std;
int main() {
    cout << floor(1.001) << endl; //1
    cout << floor(1.999) << endl; //1
    return 0;
}
```

### ceil() : 切り上げ
```
//test.cpp
#include <iostream> //coutに必要
#include <math.h> //「数学関数」に必要
using namespace std;
int main() {
    cout << ceil(1.001) << endl; //2
    cout << ceil(1.999) << endl; //2
    return 0;
}
```

### rint() : 四捨五入
```
//test.cpp
#include <iostream> //coutに必要
#include <math.h> //「数学関数」に必要
using namespace std;
int main() {
    cout << rint(1.499) << endl; //1
    cout << rint(1.500) << endl; //2
    return 0;
}
```

### fabs() : 絶対値
```
//test.cpp
#include <iostream> //coutに必要
#include <math.h> //「数学関数」に必要
using namespace std;
int main() {
    cout << fabs(100) << endl; //100
    cout << fabs(-100) << endl; //100
    return 0;
}
```

### pow() : 累乗（○の□乗）
```
//test.cpp
#include <iostream> //coutに必要
#include <math.h> //「数学関数」に必要
using namespace std;
int main() {
    cout << pow(2, 0) << endl; //1（2の0乗）
    cout << pow(2, 8) << endl; //256（2の8乗）
    return 0;
}
```

### sqrt() : 平方根（√○）
```
//test.cpp
#include <iostream> //coutに必要
#include <math.h> //「数学関数」に必要
using namespace std;
int main() {
    cout << sqrt(2) << endl; //1.41421（一夜一夜にひとみごろ）
    cout << sqrt(3) << endl; //1.73205（人並みに奢れや）
    cout << sqrt(4) << endl; //2
    cout << sqrt(5) << endl; //2.23607（富士山麓オウム鳴く）
    return 0;
}
```

### fmaxf() : 比較（最大値）
```
//test.cpp
#include <iostream> //coutに必要
#include <math.h> //「数学関数」に必要
using namespace std;
int main() {
    cout << fmaxf(5.01, -10) << endl; //5.01 ←「2つ」の数値の比較
    return 0;
}
```

### fminf() : 比較（最小値）
```
//test.cpp
#include <iostream> //coutに必要
#include <math.h> //「数学関数」に必要
using namespace std;
int main() {
    cout << fminf(5.01, -10) << endl; //-10 ←「2つ」の数値の比較
    return 0;
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2017年06月1X日


<a name="乱数"></a>
# <b>乱数</b>

### C 言語版
* 生成される範囲が0〜32767と狭い
```
//test.cpp
#include <iostream> //coutに必要
using namespace std;
int main() {
    int n0=0, n1=0, n2=0, n3=0, n4=0, n5=0, n6=0, n7=0, n8=0, n9=0;
    for (int i = 0; i < 100000000; i++) { //1億回繰返す
        switch (rand() % 10) { //0〜9（整数）の乱数を発生
            case 0: n0++; break;
            case 1: n1++; break;
            case 2: n2++; break;
            case 3: n3++; break;
            case 4: n4++; break;
            case 5: n5++; break;
            case 6: n6++; break;
            case 7: n7++; break;
            case 8: n8++; break;
            case 9: n9++; break;
            default: cout << "ERROR: main():for:switch" << endl; break;
        }
    }
    cout << n0 << endl; //10000356≒10.00％
    cout << n1 << endl; // 9994690≒ 9.99％
    cout << n2 << endl; // 9997965≒10.00％
    cout << n3 << endl; // 9999060≒10.00％
    cout << n4 << endl; //10000500≒10.00％
    cout << n5 << endl; //10001148≒10.00％
    cout << n6 << endl; //10000574≒10.00％
    cout << n7 << endl; //10001730≒10.00％
    cout << n8 << endl; // 9998347≒10.00％
    cout << n9 << endl; //10005630≒10.00％
    return 0;
}
```

### C++ 版
* C++11以降で利用可能（記述が冗長、処理時間非常にかかる）
```
//test.cpp
#include <iostream> //coutに必要
#include <random> //乱数発生に必要
using namespace std;
int main() {
    int n0=0, n1=0, n2=0, n3=0, n4=0, n5=0, n6=0, n7=0, n8=0, n9=0;
    for (int i = 0; i < 100000; i++) { //10万回繰返す
        random_device rnd_;
        mt19937 mt_(rnd_());
        uniform_int_distribution<int> randomX(0, 9); //←0〜9（整数）の乱数を発生
        switch (randomX(mt_)) { //0〜9（整数）の乱数を発生
            case 0: n0++; break;
            case 1: n1++; break;
            case 2: n2++; break;
            case 3: n3++; break;
            case 4: n4++; break;
            case 5: n5++; break;
            case 6: n6++; break;
            case 7: n7++; break;
            case 8: n8++; break;
            case 9: n9++; break;
            default: cout << "ERROR: main():for:switch" << endl; break;
        }
    }
    cout << n0 << endl; //10092≒10.1％
    cout << n1 << endl; // 9882≒ 9.9％
    cout << n2 << endl; // 9917≒ 9.9％
    cout << n3 << endl; //10006≒10.0％
    cout << n4 << endl; // 9855≒ 9.9％
    cout << n5 << endl; // 9959≒10.0％
    cout << n6 << endl; //10148≒10.1％
    cout << n7 << endl; //10096≒10.1％
    cout << n8 << endl; // 9826≒ 9.8％
    cout << n9 << endl; //10219≒10.2％
    return 0;
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2017年06月1X日


<a name="日時情報"></a>
# <b>日時情報</b>

```
//test.cpp
#include <iostream> //coutに必要
#include <sstream> //ostringstreamに必要。
using namespace std;

string changeHoge(int arg) { //ひと桁の場合はふた桁表示にする関数
    ostringstream _stream;
    _stream << arg;
    if (arg < 10) { //0〜9の場合…
        return "0" + _stream.str();
    } else { //10以上の場合…
        return _stream.str();
    }
}

int main() {
time_t _now = time(NULL);
struct tm *_pNow = localtime(&_now);
    
    cout << _pNow -> tm_year + 1900 << endl; //2017（年）
    cout << _pNow -> tm_mon + 1 << endl; //4（月）
    cout << _pNow -> tm_mday << endl; //28（日）
    cout << _pNow -> tm_yday << endl; //117（年内通算日, 元日が0）
    cout << _pNow -> tm_wday << endl; //5（曜日, 0日曜〜6土曜）	
    cout << _pNow -> tm_hour << endl; //9（時間, 0〜23）
    cout << _pNow -> tm_min << endl; //12（分）
    cout << _pNow -> tm_sec << endl; //4（秒）
    
    //"hh:mm:ss"で現在の時間を表示する方法
    string _h = changeHoge(_pNow -> tm_hour);
    string _m = changeHoge(_pNow -> tm_min);
    string _s = changeHoge(_pNow -> tm_sec);
    cout << _h + ":" + _m + ":" + _s << endl; //"09:12:04"
    
    return 0;
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2017年06月1X日


<a name="タイマー"></a>
# <b>タイマー</b>

### 概要
* C++ の標準機能では、他の多くの言語で可能なスマートな機能は無い
* 各 OS 限定では様々な方法は存在する

### 基本編
```
//test.cpp
#include <iostream> //coutに必要
#include <unistd.h> //usleepに必要
using namespace std;

int main() {
    int _cout = 0;
    for (;;) { //無限ループ
        if (_cout++ < 30) { //30回繰り返す場合…
            //sleep(1); //1秒間隔の場合
            //usleep(1000000); //1秒（1,000,000マイクロ秒）間隔の場合
            usleep(33670); //≒29.7fpsの場合
            cout << "繰り返したい処理をここに記述" << endl;
        } else {
            break; //繰り返しを終了
        }
    }
    return 0;
}
```

### 応用編
```
//test.cpp
#include <iostream> //coutに必要
#include <unistd.h> //usleepに必要
#include <functional> //functionに必要
using namespace std;

//================================
// カスタムクラス（Canvasクラス）
//================================
class Canvas {
    private:
        int _cout = 0; //タイマー用カウンター
        function<void()> enterframeHandler; //enterframe用のリスナー関数を格納
    
    public:
        void AddEventListener(string _event, function<void()> _function);
};

void Canvas::AddEventListener(string _event, function<void()> _function) {
    if (_event == "enterframe") {
        enterframeHandler = _function; //enterframe用リスナー関数を設定（記憶）
        //タイマー関連
        for (;;) { //無限ループ
            if (_cout++ < 9e9) { //9000000000回（約9.6年）繰り返す場合
                //sleep(1); //1秒間隔の場合
                //usleep(1000000); //1秒（1,000,000マイクロ秒）間隔の場合
                usleep(33670); //≒29.7fpsの場合
                enterframeHandler(); //enterframeイベント発生（リスナー関数を呼出す）
            } else {
                break; //繰り返しを終了
                //↑実際にはremoveEventListener()を用意して他で終了することも可能
            }
        }
    } else {
        cout << "ERROR: Canvas::AddEventListener()" << endl;
    }
}

//================
// メイン関数ほか
//================
void enterframe_Canvas() { //リスナー関数
    cout << "繰り返し実行したいことをここに記述" << endl;
}

int main() {
    Canvas Canvas_;
    Canvas_.AddEventListener("enterframe", enterframe_Canvas);
    //↑この記述で直ちにenterframe_Canvas()が29.7fpsで繰り返し実行されます。
    return 0;
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2017年06月1X日


<a name="処理速度計測"></a>
# <b>処理速度計測</b>

### clock を使う方法
* C 言語標準の関数（単位はミリ秒）
```
//test.cpp
#include <iostream> //coutに必要
#include <time.h> //clock系に必要
using namespace std;

int main() {
    clock_t _start = clock(); //計測スタート

    for (int i=0; i<1000000000; ++i) { //10億回繰り返す場合
        //速度計測したい処理
    }

    clock_t _end = clock(); //計測終了

    cout << (double)(_end - _start) / CLOCKS_PER_SEC << "秒\n"; //2.36981秒

    return 0;
}
```

### chrono を使う方法
* C++11 で追加された機能
```
//test.cpp
#include <iostream> //coutに必要
#include <chrono> //chronoに必要
using namespace std;

int main() {
    auto _start = chrono::system_clock::now(); //計測スタート

    for (int i=0; i<1000000000; ++i) { //10億回繰り返す場合
        //速度計測したい処理
    }
    
    auto _end = chrono::system_clock::now(); //計測終了

    cout << 
    chrono::duration_cast<chrono::milliseconds>(_end - _start).count()
    << "ミリ秒\n"; //2338ミリ秒

    return 0;
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成日：2017年06月1X日


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
//test.cpp
#include <iostream> //coutに必要
#include <fstream> //ファイルの入出力に必要
#include <string>
using namespace std;

int main() {
    //①ファイルをオープン
    ifstream _stream("sample.txt");
    
    //ファイルのオープンに成功したか否か調べる（オプション）
    if (_stream.fail()) {
        cout << "ファイルのオープンに失敗" << endl;
            return -1;		
    } else {
        cout << "ファイルのオープンに成功" << endl;
    }
    
    //②ファイルの読み込み
    string _string;
    while (getline(_stream, _string)) { //1行ずつ読み込む場合…
        cout << _string << endl;
    }
    //"あいうえお"→"かきくけこ"が出力

    //③ファイルをクローズ（オプション）
    _stream.close();
    
    return 0;
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2017年06月1X日