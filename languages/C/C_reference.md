<a name="TOP"></a>

##### すこしだけ触れてみます…
# <b>C言語 基礎文法</b>

### <b>INDEX</b>

* Hello,world! （[Linux](https://github.com/mubirou/HelloWorld/blob/master/languages/C/C_linux.md) / [macOS](https://github.com/mubirou/HelloWorld/blob/master/languages/C/C_mac.md) / [Windows](https://github.com/mubirou/HelloWorld/blob/master/languages/C/C_win.md)）
* [データ型](#データ型)
* [データ型の操作](#データ型の操作)
* [構造体](#構造体)
* [変数とスコープ](#変数とスコープ)
* [演算子](#演算子)
* [関数](#関数)
* [if 文](#if文)
* [三項演算子](#三項演算子)
* [switch 文](#switch文)
* [for 文](#for文)
* [while 文](#while文)
* [配列](#配列)
* [ポインタ](#ポインタ)
* [文字列の操作](#文字列の操作)
* [数学関数](#数学関数)
* [乱数](#乱数)
* [日時情報](#日時情報)
* [処理速度計測](#処理速度計測)
* [外部テキストの読み込み](#外部テキストの読み込み)
***


<a name="データ型"></a>
# <b>データ型</b>

```cpp
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
作成者：夢寐郎  
作成日：2017年06月06日  
[[TOP](#TOP)]


<a name="データ型の操作"></a>
# <b>データ型の操作</b>

### サイズ（バイト）の調べ方 : sizeof()
* 「sizeof 式」または「sizeof(式)」、「sizeof(型の名前)」によって式や型のサイズ（バイト）を調べることが可能
* sizeof() 演算子で返す値は size_t 型である
```cpp
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
    ```cpp
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
    ```cpp
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
    ```cpp
    //test.c
    #include <stdio.h> //printf()関数に必要
    int main() {
        int _tmp = 2147483647; //intは-2,147,483,648〜2,147,483,647
        short int _tmp2= (short int)_tmp;
        printf("%d\n", _tmp2); //-1 <=元のデータが失われる
        return 0;
    }
    ```

1. 数値→数値（浮動小数点数の縮小変換）
    ```cpp
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
    ```cpp
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
    ```cpp
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

実行環境：Ubuntu 16.04.2 LTS、GCC 5.4.0  
作成者：夢寐郎  
作成日：2017年06月06日  
[[TOP](#TOP)]


<a name="構造体"></a>
# <b>構造体</b>

### 概要
* 異なるデータ型の変数をひとまとめにしたもの（配列のように順番にアクセスすることは出来ない）
* 例えばある人の「名前」「年齢」「身長」「体重」など異なるデータ型をひとまとめにしたもの
* C++ のクラスと異なり、扱えるメンバ（変数）はデータのみです（関数などは不可）
* C++ のクラスと異なり、アクセス修飾子によるスコープの指定は不可
* オブジェクト指向的な記述も可能だが煩雑

### 例文
```cpp
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
    _member01.name = "mubirou"; //メンバ（変数）の設定
    _member01.age = 49; //メンバ（変数）の設定

    //メンバー２
    struct Member _member02; //構造体変数の宣言
    _member02.name = "Hanako Nishimura"; //メンバ（変数）の設定
    _member02.age = 48; //メンバ（変数）の設定

    printf("%s\n", _member01.name); //=> mubirou
    printf("%d\n", _member01.age); //=> 49
    printf("%s\n", _member02.name); //=> Hanako Nishimura
    printf("%d\n", _member02.age); //=> 48

    return 0;
}
```

実行環境：Ubuntu 16.04.2 LTS、GCC 5.4.0  
作成者：夢寐郎  
作成日：2017年06月07日  
[[TOP](#TOP)]


<a name="変数とスコープ"></a>
# <b>変数とスコープ</b>

```cpp
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

実行環境：Ubuntu 16.04.2 LTS、GCC 5.4.0  
作成者：夢寐郎  
作成日：2017年06月09日  
[[TOP](#TOP)]


<a name="演算子"></a>
# <b>演算子</b>

```cpp
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

実行環境：Ubuntu 16.04.2 LTS、GCC 5.4.0  
作成者：夢寐郎  
作成日：2017年06月12日  
[[TOP](#TOP)]


<a name="関数"></a>
# <b>関数</b>

### 基本例文
```cpp
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
```cpp
//test.c
#include <stdio.h> //printf()関数に必要

int main() { //自動的に最初に実行される
    printf("%s\n", "自動的に実行");
    return 0;
}
```

実行環境：Ubuntu 16.04.2 LTS、GCC 5.4.0  
作成者：夢寐郎  
作成日：2017年06月13日  
[[TOP](#TOP)]


<a name="if文"></a>
# <b>if 文</b>

### 基本例文
```cpp
//test.c
#include <stdio.h> //printf()関数に必要

int main() {
    int _age = 49;
    if (_age <= 20) {
        printf("%s\n", "20歳以下");
    } else if (_age <= 40) {
        printf("%s\n", "21〜40歳");
    } else if (_age <= 60) {
        printf("%s\n", "41〜60歳"); //これが出力される
    } else {
        printf("%s\n",  "61歳以上");
    }
    return 0;
}
```

### 論理積（AND）
1. 論理演算子（&&）を使う方法
    ```cpp
    if (条件式① && 条件②) {
        処理A <=条件式① かつ 条件式② の両方がtrueの場合に実行
    } else {
        処理B
    }
    ```

1. if のネストを使う方法
    ```cpp
    if (条件式①) {
        if (条件②) {
            処理A <=条件式① かつ 条件式② の両方がtrueの場合に実行
        } else {
            処理B
        }
    } else {
        処理B
    }
    ```

### 論理和（OR）
1. 論理演算子（||）を使う方法
    ```cpp
    if (条件式① || 条件②) {
        処理A <=条件式①または条件式②の両方がtrueの場合に実行
    } else {
        処理B
    }
    ```

1. ifのネストを使う方法
    ```cpp
    if (条件式①) {
        処理A <=条件式①がtrueの場合に実行
    } else if (条件②) {
        処理A <=条件式②がtrueの場合に実行
    } else {
        処理B
    }
    ```

### 排他的論理和（XOR）
1. ^ 演算子を使う方法
    ```cpp
    //test.c
    #include <stdio.h> //printf()関数に必要

    int main() {
        int _a = 1;
        int _b = 0;
        if ((_a==1) ^ (_b==1)) {
            printf("%s\n","どちらか一方だけ1です"); //<= これが出力される
        } else {
            printf("%s\n","両方共に1（1以外）です");
        }
        return 0;
    }
    ```

2. ^ 演算子を使わない方法
    ```cpp
    //test.c
    #include <stdio.h> //printf()関数に必要

    int main() {
        int _a = 1;
        int _b = 0;
        if ((_a || _b) && !(_a && _b)) {
            printf("%s\n","どちらか一方だけ1です"); //<= これが出力される
        } else {
            printf("%s\n","両方共に1（1以外）です");
        }
        return 0;
    }
    ```

実行環境：Ubuntu 16.04.2 LTS、GCC 5.4.0  
作成者：夢寐郎  
作成日：2017年06月13日  
[[TOP](#TOP)]


<a name="三項演算子"></a>
# <b>三項演算子</b>

* 構文
```cpp
(比較式) ? (true時の返り値) : (false時の返り値);
```

* 例文
```cpp
//test.c
#include <stdio.h> //printf()関数に必要

int main() {
    int _age = 49;
    printf("%s\n", (_age < 60) ? "現役" : "退職"); //=> 現役
    return 0;
}
```

実行環境：Ubuntu 16.04.2 LTS、GCC 5.4.0  
作成者：夢寐郎  
作成日：2017年06月13日  
[[TOP](#TOP)]


<a name="switch文"></a>
# <b>switch 文</b>

### 基本例文
```cpp
//test.c
#include <stdio.h> //printf()関数に必要

int main() {
    char _char = 'u';
    switch (_char) {
        case 'a' : printf("%s\n", "あ"); break;
        case 'i' : printf("%s\n", "い"); break;
        case 'u' : printf("%s\n", "う"); break; //<= これが出力
        case 'e' : printf("%s\n", "え"); break;
        case 'o' : printf("%s\n", "お"); break;
        default : printf("%s\n", "あ行以外"); break; //省略可能
    }
    return 0;
}
```

### break 文を意図的に記述しない方法
```cpp
//test.c
#include <stdio.h> //printf()関数に必要

int main() {
    int _int = 3;
    switch (_int) {
        case 1 : printf("%s\n", "①");
        case 2 : printf("%s\n", "②"); break;
        case 3 : printf("%s\n", "③"); //<= 実行
        case 4 : printf("%s\n", "④"); break; //<= 実行（ここで止まる）
        case 5 : printf("%s\n", "⑤"); 
        default : printf("%s\n", "？"); break;
    }
    return 0;
}
```

実行環境：Ubuntu 16.04.2 LTS、GCC 5.4.0  
作成者：夢寐郎  
作成日：2017年06月13日  
[[TOP](#TOP)]


<a name="for文"></a>
# <b>for 文</b>

### 基本構文
```cpp
for (①初期化; ②ループ判定式; ③更新処理) {
    繰り返す処理
}
```

### ループカウンタ（ループ制御変数）の宣言位置

1. for文の中でループ制御変数を宣言する
    ```cpp
    //test.c
    #include <stdio.h> //printf()関数に必要

    int main() {
        for (int i=0; i<10; i++) { //for文内で宣言すると...
            printf("%d\n", i); //=> 0,1,2,3,4,5,6,7,8,9
        }
        //printf("%d\n", i); //error（for文の外では使えない）
        return 0;
    }
    ```

1. for文の外でループ制御変数を宣言する
    ```cpp
    //test.c
    #include <stdio.h> //printf()関数に必要

    int main() {
        int i; //for文外で宣言すると…
        for (i=0; i<10; i++) {
            printf("%d\n", i); //=> 0,1,2,3,4,5,6,7,8,9
        }
        printf("%d\n", i); //=> 10（for文の外でも有効）
        return 0;
    }
    ```

### ループカウンタをXつずつアップする
```cpp
//test.c
#include <stdio.h> //printf()関数に必要

int main() {
    for (int i=0; i<50; i+=5) { //5つずつアップする場合
        printf("%d\n", i); //=> 0,5,10,15,20,25,30,35,40,45
    }
    return 0;
}
```

### for 文のネスト
```cpp
//test.c
#include <stdio.h> //printf()に必要

int main() {
    for (int i=1; i<=5; i++) {
        for (int j=1; j<=5; j++) {
            printf("x%dy%d\n", i, j); //=> x1y1,x1y2,...,x5y4,x5y5
        }
    }
    return 0;
}
```

### 無限ループと break 文
```cpp
//test.c
#include <stdio.h> //printf()に必要

int main() {
    int _count = 0;
    for (;;) { //①初期化②ループ判定式③更新処理...の全てを省略すると無限ループに
        _count ++;
        if (_count > 100) break; //ループを終了
        printf("%d\n", _count); //=> 1,2,...,99,100
    }
    printf("%s\n", "for文終了");
    return 0;
}
    ```

### for 文と continue 文
```cpp
//test.c
#include <stdio.h> //printf()に必要

int main() {
    for (int i=1; i<=20; i++) { //iは1,2,...19,20
        if ((i % 3) != 0) { //3で割って余りが0ではない（＝3の倍数ではない）場合
            continue; //for文の残処理をスキップしてfor文の次の反復を開始する
        }
        printf("%d\n", i); //=> 3,6,9,12,15,18（3の倍数）
    }
    return 0;
}
```

実行環境：Ubuntu 16.04.2 LTS、GCC 5.4.0  
作成者：夢寐郎  
作成日：2017年06月13日  
[[TOP](#TOP)]


<a name="while文"></a>
# <b>while 文</b>

### while 文
* 構文
```cpp
while (ループ判定式) {
    繰り返す処理
}
```

* 例文
```cpp
//test.c
#include <stdio.h> //printf()に必要

int main() {
    int _i;
    while (_i < 10) {
        printf("%d\n", _i); //=> 0,1,2,3,4,5,6,7,8,9
        _i++;
    }
    printf("%d\n", _i); //=> 10（変数はまだ有効）
    return 0;
}
```

### do...while 文
* 構文
```cpp
do {
    繰り返す処理 <=ループ判定式がfalseの場合でも最低１回は実行される
} while(ループ判定式);
```

* 例文
```cpp
//test.c
#include <stdio.h> //printf()に必要

int main() {
    int _i = 0;
    do {
        printf("%d\n", _i); //=>0（ループ判定式はfalseだが１回実行される）
        _i++;
    } while(_i < 0);
    return 0;
}
```

### while 文と break 文
```cpp
//test.c
#include <stdio.h> //printf()に必要

int main() {
    int _count = 0;
    while (1) { //ループ判別式を1にすると無限ループ
        _count++;
        if (_count > 100) {
            break; //break文を使ってループを終了
        }
        printf("%d\n", _count); //=> 1,2,....,99,100（1〜100までを出力）
    }
    printf("%s\n", "while文終了");
    return 0;
}
```

### while 文と continue 文
```cpp
//test.c
#include <stdio.h> //printf()に必要

int main() {
    int _i = 1;
    while (_i <= 20) {
        if ((_i % 3) != 0) { //3で割って余りが0ではない（＝3の倍数ではない）場合
            _i++;
            continue; //while文の残処理をスキップしてwhile文の次の反復を開始する
        }
        printf("%d\n", _i); //=> 3,6,9,12,15,18（3の倍数を出力）
        _i++;
    }
    return 0;
}
```

実行環境：Ubuntu 16.04.2 LTS、GCC 5.4.0  
作成者：夢寐郎  
作成日：2017年06月14日  
[[TOP](#TOP)]


<a name="配列"></a>
# <b>配列</b>

### 作成
```cpp
//test.c
#include <stdio.h> //printf()に必要

int main() {
    char _array[3] = {'A', 'B', 'C'};
    for (int i=0; i<3; i++) {
        printf("%c\n", _array[i]); //=>'A'=>'B'=>'C'
    }
    return 0;
}
```

### 更新（任意の値）
* 構文
```cpp
vector[インデックス番号] = 値;
```
* 例文
```cpp
//test.c
#include <stdio.h> //printf()に必要

int main() {
    char _array[] = {'A', 'B', 'C'};
    _array[0] = 'X'; //0番目を変更する場合
    for (int i=0; i<3; i++) {
        printf("%c\n", _array[i]); //=>'X'=>'B'=>'C'
    }
    return 0;
}
```

### 要素の数
```cpp
//test.c
#include <stdio.h> //printf()に必要

int main() {
    char _array[3] = {'A', 'B', 'C'};
    int _arraySize = sizeof(_array) / sizeof(_array[0]); //要素の数を調べる
    printf("%d\n", _arraySize); //=> 3

    //要素の数（_arraySize）を利用して全要素を取り出す
    for (int i=0; i<_arraySize; i++) {
        printf("%c\n", *(_array + i)); //'A'=>'B'=>'C'
    }
    return 0;
}
```

実行環境：Ubuntu 16.04.2 LTS、GCC 5.4.0  
作成者：夢寐郎  
作成日：2017年06月14日  
[[TOP](#TOP)]


<a name="ポインタ"></a>
# <b>ポインタ</b>

### ポインタの基本
* 概要
    * ポインタを利用すると大きなオブジェクトを簡単に扱える
    * データそのものをコピーすることなく、複数の場所から同じデータを参照することが出来る
    * <b>ポインタ</b>とは、メモリ上の位置（<b>アドレス</b>）を格納する特殊な変数
    * <b>ポインタ</b>に、別の変数の<b>アドレス</b>を代入して置換することも可能

* 例文
    ```cpp
    //test.c
    #include <stdio.h> //printf()に必要

    int main() {
        int hensu = 100; //元となる変数
        int *pHensu; //ポインタの宣言（*変数名）
        pHensu = &hensu; //ポインタにhensuのアドレス（&変数名）を代入

        printf("%d\n", *pHensu); //=> 100（*ポインタでポインタから変数の値を取得）
        printf("%p\n", &hensu); //=> 0x7ffc6eb8e21c（アドレスの場合"%p"）
        printf("%p\n", pHensu); //=> 0x7ffc6eb8e21c（ポインタの場合"%p"）
        
        return 0;
    }
    ```

### 配列のポインタ
* 基本例文
    ```cpp
    //test.c
    #include <stdio.h> //printf()に必要

    int main() {
        char _array[3] = {'A', 'B', 'C'};
        for (int i=0; i<3; i++) {
            printf("%c\n", _array[i]); //=>'A'=>'B'=>'C'
        }

        printf("%p\n", &_array); //0x7ffdd52acb40 <=配列の先頭の要素の「アドレス」
        printf("%p\n", &_array[0]); //0x7ffdd52acb40 <=配列の先頭の要素の「アドレス」
        printf("%c\n", *_array); //'A' <=配列の先頭の要素の値
        //printf("%c\n", *_array[0]); //error
        printf("%c\n", _array[0]); //'A' <=配列の先頭の要素の値

        return 0;
    }
    ```

* ポインタ演算
    ```cpp
    //test.c
    #include <stdio.h> //printf()に必要

    int main() {
        char _array[3] = {'A', 'B', 'C'};

        //ポインタ演算
        printf("%c\n", *_array); //'A' <=配列の「先頭」の要素の値
        printf("%c\n", *(_array + 1)); //'B' <=配列の「先頭+1」の要素の値
        printf("%c\n", *(_array + 2)); //'C' <=配列の「先頭+2」の要素の値

        //「ポインタ演算」を使って全要素を取り出す
        int _arrayLength = sizeof(_array) / sizeof(_array[0]);
        for (int i=0; i<_arrayLength; i++) {
            printf("%c\n", *(_array + i)); //'A'→'B'→'C'
        }

        return 0;
    }
    ```

実行環境：Ubuntu 16.04.2 LTS、GCC 5.4.0  
作成者：夢寐郎  
作成日：2017年06月15日  
[[TOP](#TOP)]


<a name="文字列の操作"></a>
# <b>文字列の操作</b>

### 文字列の作成
```cpp
//test.c
#include <stdio.h> //printf()に必要

int main() {
    //1文字
    char _char = 'A';
    printf("%d\n", _char); //=> 65（ASCIIコード）
    printf("%c\n", _char); //=> 'A'

    //2文字以上
    char *_string = "mubirou"; //1文字目のアドレスに格納（重要）
    printf("%d\n", *_string); //=> 84（1文字目のASCIIコード）
    printf("%c\n", *_string); //=> 'T'（1文字目）
    printf("%s\n", _string); //=> "mubirou"
    return 0;
}
```

### 連結
```cpp
//test.c
#include <stdio.h> //printf()に必要
#include <string.h> //strcat()に必要

int main() {
    char _string1[] = "Takashi";
    char _string2[] = "Nishimura";
    char *_p; //ポインタの宣言
    _p = strcat(_string1, _string2); //連結
    printf("%s\n", _p); //=> "mubirou"
    return 0;
}
```

### 長さを調べる
```cpp
//test.c
#include <stdio.h> //printf()に必要
#include <string.h> //strlen()に必要

int main() {
    char *_string = "mubirou"; //1文字目のアドレスに格納（重要）
    int _len = strlen(_string);
    printf("%d\n", _len); //=> 17
    return 0;
}
```

### 一部分を取得
```cpp
//test.c
#include <stdio.h> //printf()に必要
#include <string.h> //strncpy()に必要

int main() {
    char _string[] = "mubirou"; //元の文字列
    char _tmp[64]; //コピーを格納する変数
    strncpy(_tmp, _string+0, 7); //0文字目から7文字を取得する場合
    printf("%s\n", _tmp); //=> "Takashi"
    return 0;
}
```

### 検索
```cpp
//test.c
#include <stdio.h> //printf()に必要
#include <string.h> //strstr()に必要

int main() {
    char _string[] = "ABCDEFGABCDEFG"; //元の文字列
    char *_p; //ポインタの宣言
    _p = strstr(_string, "CD"); //検索したい文字列
    printf("%s\n", _p); //=> "CDEFGABCDEFG"（見つかった場所以降を出力）
    return 0;
}
```

実行環境：Ubuntu 16.04.2 LTS、GCC 5.4.0  
作成者：夢寐郎  
作成日：2017年06月16日  
[[TOP](#TOP)]


<a name="数学関数"></a>
# <b>数学関数</b>

### sin() : サイン（正弦）
```cpp
//test.c
#include <stdio.h> //printf()に必要
#include <math.h> //数学関数に必要

int main() {
    printf("%f\n", sin(0)); //0.000000 <=0°
    printf("%f\n", sin(M_PI_2)); //1.000000 <=90°
    printf("%f\n", sin(M_PI)); //0.000000 <=180°
    printf("%f\n", sin(M_PI*3/2)); //-1.000000 <=270°
    printf("%f\n", sin(M_PI*2)); //-0.000000 <=360°
    return 0;
}
```

### cos() : コサイン（余弦）
```cpp
//test.c
#include <stdio.h> //printf()に必要
#include <math.h> //数学関数に必要

int main() {
    printf("%f\n", cos(0)); //1.000000 <=0°
    printf("%f\n", cos(M_PI_2)); //0.000000 <=90°
    printf("%f\n", cos(M_PI)); //-1.000000 <=180°
    printf("%f\n", cos(M_PI*3/2)); //-0.000000 <=270°
    printf("%f\n", cos(M_PI*2)); //1.000000 <=360°
    return 0;
}
```

### M_PI : 円周率
```cpp
//test.c
#include <stdio.h> //printf()に必要
#include <math.h> //数学関数に必要

int main() {
    printf("%f\n", M_PI); //3.141593（π）
    printf("%f\n", M_PI_2); //1.570796（π/2）
    printf("%f\n", M_PI_4); //0.785398（π/4）
    printf("%f\n", M_1_PI); //0.318310（1/π）
    printf("%f\n", M_2_PI); //0.636620（2/π）
    printf("%f\n", M_SQRT2); //1.414214（sqrt(2)）
    return 0;
}
```

### floor() : 切り捨て
```cpp
//test.c
#include <stdio.h> //printf()に必要
#include <math.h> //数学関数に必要

int main() {
    printf("%f\n", floor(1.001)); //1.000000
    printf("%f\n", floor(1.999)); //1.000000
    return 0;
}
```

### ceil() : 切り上げ
```cpp
//test.c
#include <stdio.h> //printf()に必要
#include <math.h> //数学関数に必要

int main() {
    printf("%f\n", ceil(1.001)); //2.000000
    printf("%f\n", ceil(1.999)); //2.000000
    return 0;
}
```

### pow() : 累乗（○の□乗）
```cpp
//test.c
#include <stdio.h> //printf()に必要
#include <math.h> //数学関数に必要

int main() {
    printf("%f\n", pow(2, 0)); //1.000000（2の0乗）
    printf("%f\n", pow(2, 8)); //256.000000（2の8乗）
    return 0;
}
```

### sqrt() : 平方根（√○）
```cpp
//test.c
#include <stdio.h> //printf()に必要
#include <math.h> //数学関数に必要

int main() {
    printf("%f\n", sqrt(2)); //1.414214（一夜一夜にひとみごろ）
    printf("%f\n", sqrt(3)); //1.732051（人並みに奢れや）
    printf("%f\n", sqrt(4)); //2.000000
    printf("%f\n", sqrt(5)); //2.236068（富士山麓オウム鳴く）
    return 0;
}
```

### fmaxf() : 比較（最大値）
```cpp
//test.c
#include <stdio.h> //printf()に必要
#include <math.h> //数学関数に必要

int main() {
    printf("%f\n", fmaxf(5.01, -10)); //5.010000 <=「2つ」の数値の比較
    return 0;
}
```

### fminf() : 比較（最小値）
```cpp
//test.c
#include <stdio.h> //printf()に必要
#include <math.h> //数学関数に必要

int main() {
    printf("%f\n", fminf(5.01, -10)); //-10.000000 <=「2つ」の数値の比較
    return 0;
}
```

実行環境：Ubuntu 16.04.2 LTS、GCC 5.4.0  
作成者：夢寐郎  
作成日：2017年06月16日  
[[TOP](#TOP)]


<a name="乱数"></a>
# <b>乱数</b>

```cpp
//test.c
#include <stdio.h> //printf()に必要
#include <math.h> //数学関数に必要

int main() {
    int n0=0, n1=0, n2=0, n3=0, n4=0, n5=0, n6=0, n7=0, n8=0, n9=0;
    for (int i = 0; i < 100000000; i++) { //1億回繰返す
        switch (rand() % 10) { //0〜9（整数）の乱数を発生（warningが発生）
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
        }
    }
    printf("%d\n", n0); //9999188
    printf("%d\n", n1); //10000364
    printf("%d\n", n2); //9996614
    printf("%d\n", n3); //10003534
    printf("%d\n", n4); //10000558
    printf("%d\n", n5); //9992621
    printf("%d\n", n6); //10002100
    printf("%d\n", n7); //9999641
    printf("%d\n", n8); //9998927
    printf("%d\n", n9); //10006453
    return 0;
}
```

実行環境：Ubuntu 16.04.2 LTS、GCC 5.4.0  
作成者：夢寐郎  
作成日：2017年06月16日  
[[TOP](#TOP)]


<a name="日時情報"></a>
# <b>日時情報</b>

```cpp
//test.c
#include <stdio.h> //printf()に必要
#include <time.h> //time()に必要

int main() {
    time_t _now = time(NULL);
    struct tm *_pNow = localtime(&_now);
    printf("%d\n", _pNow -> tm_year + 1900); //2017（年）
    printf("%d\n", _pNow -> tm_mon + 1); //6（月）
    printf("%d\n", _pNow -> tm_mday); //16（日）
    printf("%d\n", _pNow -> tm_yday); //166（年内通算日, 元日が0）
    printf("%d\n", _pNow -> tm_wday); //5（曜日, 0日曜〜6土曜）	
    printf("%d\n", _pNow -> tm_hour); //10（時間, 0〜23）
    printf("%d\n", _pNow -> tm_min); //23（分）
    printf("%d\n", _pNow -> tm_sec); //11（秒）
    return 0;
}
```

実行環境：Ubuntu 16.04.2 LTS、GCC 5.4.0  
作成者：夢寐郎  
作成日：2017年06月16日  
[[TOP](#TOP)]


<a name="処理速度計測"></a>
# <b>処理速度計測</b>

```cpp
//test.c
#include <stdio.h> //printf()に必要
#include <time.h> //clock系に必要

int main() {
    clock_t _start = clock(); //計測スタート
    for (int i=0; i<1000000000; ++i) { //10億回繰り返す場合
        //速度計測したい処理
    }
    clock_t _end = clock(); //計測終了
    printf("%f\n", (double)(_end - _start) / CLOCKS_PER_SEC); //2.528470（秒）
    return 0;
}
```

実行環境：Ubuntu 16.04.2 LTS、GCC 5.4.0  
作成日：2017年06月16日  
[[TOP](#TOP)]


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
```cpp
//test.c
#include <stdio.h> //printf()に必要
#include <string.h> //strcat()に必要

int main() {
    FILE *_p; //ファイルのポインタの宣言
    char _string[256];

    //①ファイルをオープン
    _p = fopen("sample.txt", "r");

    //②ファイルの読み込み
    while (fgets(_string, 256, _p) != NULL) {
        printf("%s", _string); //=> "あいうえお...
    }

    //③ファイルをクローズ
    fclose(_p);

    return 0;
}
```

実行環境：Ubuntu 16.04.2 LTS、GCC 5.4.0  
作成者：夢寐郎  
作成日：2017年06月16日  
[[TOP](#TOP)]