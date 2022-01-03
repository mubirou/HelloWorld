# <b>GDScript 基礎文法</b>

### これは書きかけの項目です

### <b>INDEX</b>

* [コメント](#コメント)
* [データ型](#データ型)
* <!--[データ型の操作](#データ型の操作)-->
* <!--[クラス](#クラス0)-->
* <!--[基本クラスと派生クラス](#基本クラスと派生クラス)-->
* <!--[名前空間](#名前空間)-->
* <!--[継承と委譲](#継承と委譲)-->
* <!--[変数とスコープ](#変数とスコープ)-->
* <!--[アクセサ （getter / setter）](#アクセサ)-->
* <!--[演算子](#演算子)-->
* <!--[定数](#定数)-->
* <!--[関数](#関数)-->
* <!--[匿名関数](#匿名関数)-->
* <!--[静的変数・静的関数](#静的変数・静的関数)-->
* <!--[if 文](#if文)-->
* <!--[三項演算子](#三項演算子)-->
* <!--[for 文](#for文)-->
* <!--[for...in 文](#for...in文)-->
* <!--[while 文](#while文)-->
* <!--[配列（タプル）](#配列（タプル）)-->
* <!--[動的配列（リスト）](#動的配列（リスト）)-->
* <!--[連想配列（辞書）](#連想配列（辞書）)-->
* <!--[self](#self) ≒ this-->
* <!--[文字列の操作](#文字列の操作)-->
* <!--[正規表現](#正規表現)-->
* <!--[抽象クラス](#抽象クラス)-->
* <!--[super 関数](#super関数)-->
* <!--[オーバーライド](#オーバーライド)-->
* <!--[カスタムイベント](#カスタムイベント)-->
* <!--[数学関数（math）](#数学関数（math）)-->
* <!--[乱数](#乱数)-->
* <!--[日時情報](#日時情報)-->
* <!--[タイマー](#タイマー)-->
* <!--[処理速度計測](#処理速度計測)-->
* <!--[外部テキストの読み込み](#外部テキストの読み込み)-->
***

<a name="コメント"></a>
# <b>コメント</b>

### 1行コメント

```GDScript
# 〇〇〇〇〇
```

```GDScript
var _x = 1 + 1 # 〇〇〇〇〇
```

```GDScript
"""〇〇〇〇〇""""
```

### 複数行コメント

```GDScript
"""
〇〇〇〇〇
〇〇〇〇〇
"""
```

```GDScript
"""コメント開始
〇〇〇〇〇
〇〇〇〇〇
コメント終了"""
```

参考：[GODOT DOCS](https://docs.godotengine.org/ja/stable/tutorials/scripting/gdscript/gdscript_basics.html?highlight=%E3%82%B3%E3%83%A1%E3%83%B3%E3%83%88#comments)  
実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年01月01日


<a name="データ型"></a>
# <b>データ型</b>

### 主なデータ型の種類
1. 論理型（bool）
1. 整数型（int）
1. 浮動小数点数（float）
1. 文字列（String）
1. 配列（Array）
1. 辞書型（Dictionary）
1. クラス
1. 複素数オブジェクト型（complex）


<a name="typeof()の戻り値一覧"></a>

### typeof()の戻り値一覧
|TYPE_*|番号|TYPE_*|番号|TYPE_*|番号|
|:--|:--:|:--|:--:|:--|:--:|
|TYPE_NIL|0|[TYPE_BOOL](#TYPE_BOOL)|**1**|[TYPE_INT](#TYPE_INT)|**2**|
|[TYPE_REAL](#TYPE_REAL)|**3**|[TYPE_STRING](#TYPE_STRING)|**4**|TYPE_VECTOR2|5|
|TYPE_RECT2|6|TYPE_VECTOR3|7|TYPE_TRANSFORM2D|8|
|TYPE_PLANE|9|TYPE_QUAT|10|TYPE_AABB|11|
|TYPE_BASIS|12|TYPE_TRANSFORM|13|TYPE_COLOR|14|
|TYPE_NODE_PATH|15|TYPE_RID|16|[TYPE_OBJECT](#TYPE_OBJECT)|**17**|
|[TYPE_DICTIONARY](#TYPE_DICTIONARY)|**18**|[TYPE_ARRAY](#TYPE_ARRAY)|**19**|TYPE_RAW_ARRAY|20|
|TYPE_INT_ARRAY|21|TYPE_REAL_ARRAY|22|TYPE_STRING_ARRAY|23|
|TYPE_VECTOR2_ARRAY|24|TYPE_VECTOR3_ARRAY|25|TYPE_COLOR_ARRAY|26|
|TYPE_MAX|27|||||


<a name="TYPE_BOOL"></a>

### ➀論理型（bool）
* trueまたはfalse
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

var _bool = true #True/Falaseは不可

func _ready():
	print(_bool) #-> True
	print(typeof(_bool)) #-> 1（TYPE_BOOL）
	print(_bool is bool) #-> True
```


<a name="TYPE_INT"></a>

### ➁整数型（int）
* 約±922京まで扱えます
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

var _int = 9223372036854775807 # ±9223372036854775807まで扱える

func _ready():
	print(_int) #-> 9223372036854775807
	print(typeof(_int)) #-> 2（TYPE_INT）
	print(_int is int) #-> True
```


<a name="TYPE_REAL"></a>

### ➂浮動小数点数（float）
* 小数点第6桁まで
```GDScript
#test.gd
extends Spatial

var _float = 3.141592653589793238462643383279502884197169399375105820974944592307816406286

func _ready():
	print(_float) #-> 3.141593（小数点第6桁まで）
	print(typeof(_float)) #-> 3（TYPE_REAL）
	print(_float is float) #-> True
```


<a name="TYPE_STRING"></a>

### ➃文字列（String）
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

var _string = "あいうえお" # '〇〇'でも可

func _ready():
	print(_string) #-> あいうえお
	print(typeof(_string)) #-> 4（TYPE_STRING）
	print(_string is String) #-> True
```


<a name="TYPE_ARRAY"></a>

### ➄配列（Array）
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

var _array = ["A", "I", "U"]

func _ready():
	print(_array) #-> True
	print(typeof(_array)) #-> 19（TYPE_ARRAY）
	print(_array is Array) #-> True
```
他にもさまざまな配列あり  


<a name="TYPE_DICTIONARY"></a>

### ➅辞書型（Dictionary） : 連想配列
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

var _dic = {"A":"あ", "I":"い"}

func _ready():
	print(_dic) #-> True
	print(typeof(_dic)) #-> 18（TYPE_ARRAY）
	print(_dic is Dictionary) #-> True
```


<a name="TYPE_OBJECT"></a>

### ➆クラス（Object）
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

func _ready():
	var _myClass = MyClass.new()
	print(_myClass) #-> TYPE_OBJECT
	print(typeof(_myClass)) #-> 17(TYPE_OBJECT)
	print(_myClass is Object) #-> True
```

### ⑪複素数オブジェクト型（complex）
```
#test.py
print(type(1+1j)) #<class 'complex'> ←内部では２つの別個の型扱い
```

### ⑫None型（None）......何もないことを示す定数
```
#test.py
print(type(None)) #<class 'NoneType'>
```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年0X月XX日


<a name="データ型の操作"></a>
# <b>データ型の操作</b>

### type() 関数 : データ型を返す
```
#test.py
print(type(True)) #<class 'bool'>
print(type(100)) #<class 'int'>
print(type(0.1)) #<class 'float'>
print(type('1')) #<class 'str'>
print(type(["CHIKASHI", "TARO", "HANAKO"])) #<class 'list'>
print(type(("CHIKASHI", "TARO", "HANAKO"))) #<class 'tuple'>
print(type(set(["CHIKASHI", "TARO", "HANAKO"]))) #<class 'set'>
print(type(frozenset(["CHIKASHI", "TARO", "HANAKO"]))) #<class 'frozenset'>
print(type({"CHIKASHI":48, "TARO":13})) #<class 'dict'>
print(type(1+1j)) #<class 'complex'>

class MyClass: #前方宣言が必要
    def __init__(self): #コンストラクタ
        pass #何もしない
_myClass = MyClass()
print(type(_myClass)) #<class '__main__.MyClass'>
```

### is 演算子 : 厳密一致
```
#test.py
# 数値のブール値の比較
print(1 is True) #False（厳密一致）

# クラスとインスタンスの比較
class MyClass: #前方宣言が必要
    def __init__(self): #コンストラクタ
        pass #何もしない

_myClass = MyClass()
print(_myClass is MyClass) #False（厳密一致）
```

### isinstance() 関数 : インスタンスの判定
* オブジェクトが指定したクラスのインスタンスか判定
```
#test.py
class MyClass: #前方宣言が必要
    def __init__(self): #コンストラクタ（オプション）
        pass #何もしない

_myClass = MyClass()
print(isinstance(_myClass, MyClass)) #True ←isinstance(オブジェクト, クラス名)
```

### データ型のキャスト（数値 ↔ bool 型）
```
#test.py
#数値→bool型
_tmp = bool(1)
print(_tmp) #True
print(type(_tmp)) #<class 'bool'>

#bool型→数値
_tmp = int(True) #True→1に変換（Falseは0に変換）
print(_tmp) #1
print(type(_tmp)) #<class 'int'>
```

### データ型のキャスト（数値 ↔ string 型）
```
#test.py
#string型→数値
_tmp = int("001")
print(_tmp) #1
print(type(_tmp)) #<class 'int'>

#数値→string型
_tmp = str(100)
print(_tmp) #100
print(type(_tmp)) #<class 'str'>
```

### 基数変換（◯進数→2進数）
```
#test.py
#10進数→2進数
_tmp = bin(6) #10進数の6を2進数に変換
print(_tmp) #0b110...「0b」は値が2進数であることを表している
print(type(_tmp)) #<class 'str'>

#16進数→2進数
_tmp = bin(0x1d) #16進数の1dを2進数に変換
print(_tmp) #0b11101...「0b」は値が2進数であることを表している
print(type(_tmp)) #<class 'str'>
```
* 参考: 10進数→2進数（list型で表示）
```
#test.py
def convert10to2(_num):
    _result = []
    
    while (_num != 0):
        _result.append(_num % 2)
        _num = _num // 2 #切り捨て除算≒math.floor()

    _result.reverse()
    return _result

print(convert10to2(6)) #[1, 1, 0] ←10進数の6を2進数に変換
```

### 基数変換（◯進数→16進数）
```
#test.py
#10進数→16進数
_tmp = hex(29) #10進数の29を16進数に変換
print(_tmp) #0x1d...「0x」は値が16進数であることを表している
print(type(_tmp)) #<class 'str'>

#2進数→16進数
_tmp = hex(0b11101) #2進数の11101を16進数に変換
print(_tmp) #0x1d...「0x」は値が16進数であることを表している
print(type(_tmp)) #<class 'str'>
```
* 参考: 10進数→16進数（list型で表示）
```
#test.py
def convert10to16(_num):
    _result = []
    
    while (_num != 0):
        _result.append(_num % 16)
        _num = _num // 16 #切り捨て除算

    #10〜15対策
    for _i, _tmp in enumerate(_result):
        if (_tmp == 10) : _result[_i] = "a"
        elif (_tmp == 11) : _result[_i] = "b"
        elif (_tmp == 12) : _result[_i] = "c"
        elif (_tmp == 13) : _result[_i] = "d"
        elif (_tmp == 14) : _result[_i] = "e"
        elif (_tmp == 15) : _result[_i] = "f"

    _result.reverse()
    return _result

print(convert10to16(29)) #[1, 'd'] ←10進数の29を16進数に変換
```

### 基数変換（◯進数→10進数）
```
#test.py
#2進数→10進数
print(int("0b11101", 2)) #29

#16進数→10進数
print(int("1d", 16)) #29
```
* 参考: X進数→10進数（通常は int() 関数を使えば済む処理）
```
#test.py
def convertXto10(_stringNum, _base): #文字列の数字, #進数
    _n = len(_stringNum) - 1 #指数
    _result = 0

    for _i, _tmp in enumerate(_stringNum): #"10100"の場合 1→0→1→0→0

        #a〜f対策
        if (_tmp == "a") or (_tmp == "A"): _tmp = 10
        elif (_tmp == "b") or (_tmp == "B"): _tmp = 11
        elif (_tmp == "c") or (_tmp == "C"): _tmp = 12
        elif (_tmp == "d") or (_tmp == "D"): _tmp = 13
        elif (_tmp == "e") or (_tmp == "E"): _tmp = 14
        elif (_tmp == "f") or (_tmp == "F"): _tmp = 15
    
        _result += (_base ** _n) * int(_tmp)
        _n -= 1
    
    return _result

print(convertXto10("10100", 2)) #20 ←2進数の"10100"を10進数に変換
print(convertXto10("1d", 16)) #29 ←16進数の"1d"を10進数に変換
```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年0X月XX日


<a name="クラス0"></a>
# <b>クラス</b>

### 最小構成
```
#test.py
class MyClass(object): #前方宣言が必要（(object)は省略可）
   pass #何もしない
_myClass = MyClass() #インスタンスの生成
```

* passについて  
Pythonのコードブロックは {} ではなくインデントを揃えることで見なします。しかしインデントを強制する文法の弱点として、インデントしたブロックは必ず１行以上の記述が必要になります。そこで「何もしない」という処理を意味するpass文が用意されています。

### 例文
```
#test.py
#==============
# 長方形クラス
#==============
class Rectangle(object): #(object)は省略可
    #-----------------------------------------------------------
    # プライベート変数（ここではself.は付けない／__○○にする）
    #-----------------------------------------------------------
    __width = None #値を設定可（コンストラクタ内に記述可）
    __height = None #値を設定可（コンストラクタ内に記述可）

    #----------------
    # コンストラクタ
    #----------------
    def __init__(self, w, h): #self（自分自身を指す）は省略不可
        self.__width = w
        self.__height = h

    #-----------------------------------
    # _widthアクセス用（getter/setter）
    #-----------------------------------
    def __getWidth(self): #__○○()でプライベート関数（selfは自分自身、省略不可）
        return self.__width

    def __setWidth(self, value): #__○○()でプライベート関数（selfは自分自身、省略不可）
        self.__width = value #引数名「value」は任意

    width = property(__getWidth, __setWidth) #プロパティを設定

    #------------------------------------
    # _heightアクセス用（getter/setter）
    #------------------------------------
    def __getHeight(self): #__○○()でプライベート関数（selfは自分自身、省略不可）
        return self.__height

    def __setHeight(self, value): #__○○()でプライベート関数（selfは自分自身、省略不可）
        self.__height = value #引数名「value」は任意

    height = property(__getHeight, __setHeight) #プロパティを設定

    #----------------
    # 面積計算用関数
    #----------------
    def getArea(self): #self（自分自身を指す）は省略不可（引数は追加可）
        return self.__width * self.__height

#======
# 実行
#======
#①インスタンスの生成
_rectangle = Rectangle(640,480)

#②プロパティの取得（その１）
print(_rectangle.width) #640
print(_rectangle.height) #480

#③プロパティの更新
_rectangle.width = 1920
_rectangle.height = 1080

#④プロパティの取得（その２）
print(_rectangle.width) #1920
print(_rectangle.height) #1080

#⑤関数の実行
print(_rectangle.getArea()) #2073600
```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年0X月XX日


<a name="基本クラスと派生クラス"></a>
# <b>基本クラスと派生クラス</b>

```
#test.py
#====================
# 基本（基底）クラス
#====================
class SuperClass(object):
    # プライベート変数
    __pSuperClass = "基本クラスのプロパティ"

    # getter/setter
    def __get__pSuperClass(self): #__○○()でプライベート関数（selfは自分自身、省略不可）
        return self.__pSuperClass
    def __set__pSuperClass(self, value): #__○○()でプライベート関数（selfは自分自身、省略不可）
        self.__pSuperClass = value
    pSuperClass = property(__get__pSuperClass, __set__pSuperClass)

    # 関数
    def mSuperClass(self):
        return "基本クラスのメソッド"

#=================================================================
# 派生クラスＡ
# class 派生クラス(基本クラス①, 基本クラス②, …) で多重継承可能
#=================================================================
class SubClassA(SuperClass): #基本クラス（SuperClass）を継承
    # 擬似プライベート変数
    __pSubClassA = "派生クラスＡのプロパティ"

    # getter/setter
    def __get__pSubClassA(self): #__○○()でプライベート関数（selfは自分自身、省略不可）
        return self.__pSubClassA
    def __set__pSubClassA(self, value): #__○○()でプライベート関数（selfは自分自身、省略不可）
        self.__pSubClassA = value
    pSubClassA = property(__get__pSubClassA, __set__pSubClassA)

    # 関数
    def mSubClassA(self):
        return "派生クラスＡのメソッド"

#==============
# 派生クラスＢ
#==============
class SubClassB(SuperClass): #基本クラス（SuperClass）を継承
    # 擬似プライベート変数
    __pSubClassB = "派生クラスＢのプロパティ"

    # getter/setter
    def __get__pSubClassB(self):
        return self.__pSubClassB
    def __set__pSubClassB(self, value):
        self.__pSubClassB = value
    pSubClassB = property(__get__pSubClassB, __set__pSubClassB)

    # 関数
    def mSubClassB(self):
        return "派生クラスＢのメソッド"

#======
# 実行
#======
# 派生クラスＡ
subClassA_ = SubClassA() #インスタンスの生成
print(subClassA_) #<__main__.SubClassA object at 0x7f3b6d678e80>
print(isinstance(subClassA_, SubClassA)) #True（SubClassのインスタンス）
print(isinstance(subClassA_, SuperClass)) #True（SuperClassのインスタンスでもある）
print(subClassA_.pSuperClass) #基本クラスのプロパティ
print(subClassA_.pSubClassA) #派生クラスＡのプロパティ
print(subClassA_.mSuperClass()) #基本クラスのメソッド
print(subClassA_.mSubClassA()) #派生クラスＡのメソッド
```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年0X月XX日


<a name="名前空間"></a>
# <b>名前空間</b>

### 概要
Python の名前空間の目的は、他のディレクトリ（パッケージ）にあるモジュールをインポートして活用できるようにする事です。モジュールとは、再利用可能なコードのまとまりの基本的な単位（xxx.py）です。

### 例文
* test.py と同階層に japan ディレクトリがあり、その中に tokyo.py が存在する場合

```
# japan/tokyo.py（tokyoモジュール）
class Member(object):
    #プライベート変数
    __name = None
    #コンストラクタ
    def __init__(self,name): self.__name = name
    #アクセサ（getter）
    def __getName(self): return self.__name
    name = property(__getName)
```

```
# test.py（モジュールを利用するファイル）
import sys #決め打ち
sys.path.append('japan') #japanディレクトリ（相対パス）を検索範囲に追加
import tokyo #モジュール（tokyo.py）をインポート
#「import tokyo as nw」等と別名を使って利用することも可能

_tokyo = tokyo.Member('nishimura') #別ディレクトリ、別ファイル内のクラスが利用可
print(_tokyo.name) #'nishimura'
```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年0X月XX日


<a name="継承と委譲"></a>
# <b>継承と委譲</b>

### 概要
*  GoF デザインパターンの [Adapter パターン](http://bit.ly/2naab8x)等で利用される
* 継承の場合は <b>class 派生クラス名(基本クラス名):</b> を使い、委譲の場合は <b>クラス名()</b> を使ってオブジェクトを生成し、他のクラスの機能を利用する

### 継承版
```
#test.py
class ClassA(object):
    def myMethod(self):
        print('ClassA.myMethod()')

class ClassB(ClassA): #クラスＡを継承（ポイント）
    pass

_classB = ClassB()
_classB.myMethod() #'ClassA.myMethod()'
```

### 委譲版
```
#test.py
class ClassA(object):
    def myMethod(self):
        print('ClassA.myMethod()')

class ClassB(): #この内容のみ継承と異なる
    __classA = None #プライベート変数の宣言（省略可）

    def __init__(self): #コンストラクタ
        self.__classA = ClassA() #クラスＡのインスタンスを生成（ポイント）

    def myMethod(self):
        self.__classA.myMethod()

_classB = ClassB()
_classB.myMethod() #'ClassA.myMethod
```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年0X月XX日

<a name="変数とスコープ"></a>
# <b>変数とスコープ</b>

### 変数の種類
1. [グローバル変数](#グローバル変数)
1. [パブリック変数](#パブリック変数)
1. [プライベート変数](#プライベート変数)
1. [ローカル変数](#ローカル変数)

<a name="グローバル変数"></a>
### グローバル変数
```
#test.py
_global = "グローバル変数" #関数の外部で宣言するとグローバル変数扱い

#=====================================
# 関数内のグローバル変数の扱い
#=====================================
def myFunction():
    global _global #グローバル変数を扱う「宣言」
    _global = "グローバル変数②" #global宣言すれば変更可（宣言なしでも参照は可）
    print(_global)

myFunction() #"グローバル変数②"

#=====================================
# クラス内のグローバル変数の扱い
#=====================================
class MyClass(object):
    #コンストラクタ（省略可）
    def __init__(self):
        pass #何もしない

    def myMethod(self):
        global _global #グローバル変数を扱う「宣言」
        _global = "グローバル変数③" #global宣言すれば変更可（宣言なしでも参照は可）
        print(_global)

_myClass = MyClass()
_myClass.myMethod() #"グローバル変数③"

print(_global) #"グローバル変数③" ←クラス内（または関数内）での変更が反映される
```

<a name="パブリック変数"></a>
### パブリック変数
* 全クラスからアクセスが可能
* クラス定義の直後、コンストラクタの直前に定義
* パブリック変数を使った以下のような例文は「他人の変数を勝手にいじってはいけない」というルールに反するため、プラーベート変数 + get / set アクセサを使うべきでしょう
```
#test.py（悪い例）
class MyClass(object):
    def __init__(self): #コンストラクタ
        self._p = "パブリック変数" #パブリック変数の宣言と設定

_myClass = MyClass()
print(_myClass._p) #"パブリック変数"（クラスの外からアクセス可能）
_myClass._p = "○△☆□？" #クラスの外から変更できてしまう
print(_myClass._p) #"○△☆□？"
```

<a name="プライベート変数"></a>
### プライベート変数
* 同じクラス内のみアクセス可能
* 外部からは get / set アクセサを使ってアクセス
* __○○と命名することでプライベート変数になる

```
#test.py
class MyClass(object):
    #プライベート変数の宣言（selfは不要）＝省略可
    __p = None

    #コンストラクタ
    def __init__(self):
        self.__p = "プライベート変数①"

    #-------------------------------------------------
    # プライベート変数へのアクセス用（getter/setter）
    #-------------------------------------------------
    def __getP(self): #__○○()でプライベート関数（selfは自分自身、省略不可）
        return self.__p
    def __setP(self, value): #__○○()でプライベート関数（selfは自分自身、省略不可）
        self.__p = value #引数名「value」は任意
    p = property(__getP, __setP) #プロパティを設定

_myClass = MyClass()
print(_myClass.p) #プライベート変数①（≠他人の変数を勝手にいじる行為）
_myClass.p = "プライベート変数②"
print(_myClass.p) #アクセス可（≠他人の変数を勝手にいじる行為）
```

<a name="プライベート変数"></a>
### ローカル変数
1. 関数内で宣言する場合
    ```
    #test.py
    def myFunction1():
        _local = "ローカル変数" #この関数内でのみ利用可能
        print(_local) #"ローカル変数"（アクセス可）

    def myfunction2():
        #print(_local) #ERROR（アクセス不可）
        pass

    myFunction1()
    myfunction2()
    #print(_local) #ERROR（アクセス不可）
    ```

1. クラスの関数内で宣言する場合
    ```
    #test.py
    class MyClass(object):
        def myMethod1(self): #selfは必須
            _local = "ローカル変数" #self.は付けない（付けるとパブリック変数扱い）
            print(_local) #この関数内でのみ利用可能!!
        def myMethod2(self): #selfは必須
            #print(_local) #ERROR（アクセス不可）
            pass

    _myClass = MyClass()
    _myClass.myMethod1()
    _myClass.myMethod2()
    #print(_myClass._local) #ERROR（アクセス不可）
    ```

1. for文内で宣言する場合
    ```
    #test.py
    class MyClass(object):
        def __init__(self): #コンストラクタ
            _i = 999 #ローカル変数
            for _i in range(6): #ローカル変数（_i）0〜5
                print(_i) #0、1、2、...、5
            print(_i) #5（for文を出ても関数内であればアクセス可能）

    _myClass = MyClass()
    ```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年0X月XX日


<a name="アクセサ"></a>
# <b>アクセサ （getter / setter）</b>

### 読み書き可能なプロパティ
```
#test.py
class Nishimura(object):
    #プライベート変数の宣言（selfは不要）←省略可
    __age = None
    #コンストラクタ
    def __init__(self): 
        self.__age = 49
    # プライベート変数へのアクセス用（getter/setter）
    # ↓__○○()でプライベート関数（最後__で終わるのは不可）
    def __getAge(self):
        return self.__age
    def __setAge(self, value): #プライベート関数（__○○()）←__○○__()は不可
        self.__age = value
    age = property(__getAge, __setAge)

_nishimura = Nishimura()
print(_nishimura.age) #49
_nishimura.age = 18 #変更できてしまう
print(_nishimura.age) #18
```

### 読み取り専用のプロパティ
```
class Nishimura(object):
    #プライベート変数の宣言（selfは不要）←個人的慣例として冒頭で宣言（省略可）
    __age = None
    #コンストラクタ
    def __init__(self): 
        self.__age = 49
    # プライベート変数へのアクセス用（getter/setter）
    def __getAge(self): #プライベート関数（__○○()）
        return self.__age
    age = property(__getAge) #setterを省略すれば良い

_nishimura = Nishimura()
print(_nishimura.age) #48
#_nishimura.age = 18 #エラー（変更不可）
```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年0X月XX日


<a name="演算子"></a>
# <b>演算子</b>

### 算術演算子
```
#test.py
print(3 + 2) #5 (可算) 
print(5 - 8) #-3 (減算)
print(3 * 4) #12 (乗算)
print(1 + 2 * 3 - 4 / 2) #5.0 (複雑な計算) ←浮動小数点数（自動的型変換）
print(63 % 60) #3 (余剰)
print(8 / 3) #2.6666666666666665(除算)（小数点第16位までの値）←Python2と異なる
print(8 // 3) #2（切り捨て除算／math.floor()より高速）
print(2 ** 8) #256(べき乗) ←2の8乗（他の多くの言語と異なる）

#インクリメント（++）・デクリメント（--）は存在しない（注意）
hoge_ = 0
hoge_ += 1
print(hoge_) #1
```

### その他の演算子
```
#test.py
print(True and True) #True（論理積）←他の多く言語と異なる（&ではない）
print(True or False) #True（論理和）←他の多く言語と異なる（||ではない）

print(not True) #False（否定）←他の多く言語と異なる（!ではない）

print(2 < 3) #True（比較/未満）
print(2 <= 2) #True（比較/以下）
print(1 == True) #True（等号）
print(1 != True) #False（不等号）
print(1 is True) #False（厳密一致）←他の多く言語と異なる（===ではない）
print(1 is not True) #True（厳密不一致）←他の多く言語と異なる（!===ではない）

print(3 & 1) #1（ビット積）
print(3 | 1) #3（ビット和）
print(3 ^ 1) #2（排他的ビット和）
print(2 << 7) #256（ビット･シフト）
print(~3) #-4（ビット反転）
```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年0X月XX日


<a name="定数"></a>
# <b>定数</b>

### 概要
* 多くの言語にある const 修飾子が存在しない
* 慣例的に_（アンダースコア）付で全て大文字にすることで定数と判断する
* 実際は通常のグローバル変数やパブリック変数と同じなので、変更は出来てしまう

### 通常の定数
```
#test.py
#擬似「定数」←実際はグローバル変数
MY_NAME = "mubirou"

print(MY_NAME) #"mubirou"

MY_NAME = "TARO NISHIMURA" #変更できてしまう（本当は定数ではない）
print(MY_NAME) #"TARO NISHIMURA"
```

### クラス定数（クラスからもインスタンスからも呼び出せる）
```
#test.py
#カスタムクラス（MyClass）
class MyClass(object):
    #擬似「クラス定数」←実際はパブリック変数
    MY_NAME = "mubirou"

#=====================================================
# 「インスタンス変数」と「クラス定数」の違いを検証
#=====================================================
_myClass = MyClass() #インスタンスの生成
print(_myClass.MY_NAME) #"mubirou" ←インスタンス変数へのアクセス
_myClass.MY_NAME = "HANAKO NISHIMURA" #インスタンス変数を変更（他人をいじる…）
#↑オブジェクト指向のルールとしてgetter/setterでアクセスすべきですが…
print(_myClass.MY_NAME) #"HANAKO NISHIMURA"

print(MyClass.MY_NAME) #"mubirou" ←クラス変数とインスタンス変数は別扱い

MyClass.MY_NAME = "TARO NISHIMURA" #変更できてしまう（実際は定数ではない）
print(MyClass.MY_NAME) #"TARO NISHIMURA"
```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年0X月XX日


<a name="関数"></a>
# <b>関数</b>

### 基本構文
```
def 関数名(引数①, 引数②, ...):
    ...... ←最低1行は記述する必要があるため何も無い場合は「pass（何もしない）」を記述
    [return 戻り値]
```
* 関数名を__○○にするとプライベート関数扱いになる

### パブリック関数
* 例：○〜○までの値を足した合計を調べる
```
#test.py
class MyClass(object): #前方宣言
    def tashizan(self, _start, end_): #self（第1引数）は必須 ←オブジェクト自身を指す
        _result = 0 #ローカル変数
        for i in range(_start, end_+1):
            _result += i
        return _result
        
_myClass = MyClass()
print(_myClass.tashizan (1,10)) #55
print(_myClass.tashizan (1,100)) #5050
```

### プライベート関数
* 例：○〜○までの値を足した合計を調べる
```
#test.py
class MyClass(object): #前方宣言
    def __init__(self):
        print(self.__Tashizan(1,10)) #55
        print(self.__Tashizan(1,100)) #5050

    #関数名は__○○にすることでプライベート関数扱いになります
    def __Tashizan(self, _start, end_): #self（第1引数）は必須 ←オブジェクト自身を指す
        _result = 0 #ローカル変数
        for i in range(_start, end_+1):
            _result += i
        return _result

_myClass = MyClass()
#print(_myClass.__Tashizan(1,10)) #エラー（プライベート関数はアクセス不可）
#print(_myClass.__Tashizan(1,100)) #エラー（プライベート関数はアクセス不可）
```

### コンストラクタ
* 他に __new__(cls) もあり（併用すると __init__(self) は実行されない）

* 書式
```
class MyClass(object): #前方宣言
    def __init__(self, 引数①, 引数②, ...): #省略可
        ...... ←最低1行は記述する必要があるため何も無い場合は「pass（何もしない）」を記述
```

* 例文
```
#test.py
#カスタムクラス
class Point(object):
    #プライベート変数の宣言
    __x = __y = None

    def __init__(self, arg1, arg2): #コンストラクタ（selfは省略不可）
        #変数の初期化などを行ないます
        self.__x = arg1
        self.__y = arg2

    # プライベート変数（__x）のアクセサ
    def __getX(self): #プライベート関数
        return self.__x
    def __setX(self, value): #プライベート関数
        self.__x = value
    x = property(__getX, __setX)

    # プライベート変数（__y）のアクセサ
    def __getY(self): #プライベート関数
        return self.__y
    def __setY(self, value): #プライベート関数
        self.__y = value
    y = property(__getY, __setY)

# 実行
_point = Point(100,150)
print(_point.x) #100
print(_point.y) #150
```

### 静的メソッドとクラスメソッド
* Pythonでは別々に扱われる

1. 静的メソッド
    ```
    #test.py
    #カスタムクラス（MyMath）
    class MyMath(object):
        @staticmethod #静的メソッドの宣言
        def Pow(arg1, arg2): #個人的な慣例として大文字で開始（selfは不要）
            if arg2 == 0:
                return 1 #0乗対策
            _result = arg1
            for i in range(1, arg2):
                _result = _result * arg1
            return _result

    # 実行
    print(MyMath.Pow(2,0)) #1
    print(MyMath.Pow(2,1)) #2
    print(MyMath.Pow(2,8)) #256
    myMath_ = MyMath()
    print(myMath_.Pow(2,0)) #1（インスタンスからも呼び出せる）
    ```

1. クラスメソッド
    ```
    #test.py
    #カスタムクラス（MyMath）
    class MyMath(object):
        @classmethod #クラスメソッドの宣言
        def Pow(cls, arg1, arg2): #cls（名前は任意／クラス自身）が必須
            if arg2 == 0:
                return 1 #0乗対策
            _result = arg1
            for i in range(1, arg2):
                _result = _result * arg1
            return _result

    # 実行
    print(MyMath.Pow(2,0)) #1
    print(MyMath.Pow(2,1)) #2
    print(MyMath.Pow(2,8)) #256
    myMath_ = MyMath()
    print(myMath_.Pow(2,0)) #1（インスタンスからも呼び出せる）
    ```

### デフォルト値付き引数
```
#test.py
class MyClass(object):
    __point = 0 #プライベート変数
    def addPoint(self, arg=1): #初期値を1とした場合（selfは必須）
       self.__point += arg
       print(self.__point)

_myClass = MyClass()
_myClass.addPoint() #1 ←引数を指定しないと初期値（1）で処理
_myClass.addPoint(10) #11 ←引数を指定した場合
```

### 可変長引数（シーケンス型）
* 他にも <b>**○○</b> で指定する「辞書型」がある
```
class MyClass(object):
    def sum(self, *arg): #可変長引数はtuple型（変更不可のリスト）
        _result = 0 #ローカル変数
        print(arg) #(1, 2, 3, 4, 5)等 ←tuple（変更不可のリスト）
        for i in range(len(arg)): #len(○)で要素の数を調べる
            _result += arg[i]
        print(_result)

_myClass = MyClass()
_myClass.sum(1,1) #2 ←1+1
_myClass.sum(1,2,3,4,5) #15 ←1+2+3+4+5（引数の数はいくつでも可能）
```

### 名前付き引数
* 引数名を指定してメソッドを呼び出す（任意の順序で引数を渡すことが可能）
```
#test.py
class MyClass(object):
    def rect(self, startX=0, startY=0, endX=0, endY=0): #デフォルト値はオプション
        _result = (endX - startX) * (endY - startY)
        print("面積:" + str(_result) + "m2")

_myClass = MyClass()
_myClass.rect(endX=100, endY=100) #面積:10000m2 ←デフォルト値付との併用
```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年0X月XX日


<a name="匿名関数"></a>
# <b>匿名関数</b>

### 基本構文
```
lambda 引数①, 引数②, ... : 戻り値   ←引数は省略可
```

### def / lamda（ラムダ）構文の違い

1. defの場合
    ```
    #test.py
    def myFunction1(arg1, arg2):
        #ここに様々な処理を記述可能（重要）
        return arg1 * arg2
    print(myFunction1) # <function myFunction1 at 0x7f4f0ad77378>
    print(type(myFunction1)) #<class 'function'> ←function型
    print(myFunction1(4,3)) #12 ←4x3
    ```

1. lambdaの場合
    ```
    #test.py
    myFunction2 = lambda arg1,arg2 : arg1*arg2 #戻り値しか記述できない
    print(myFunction2) # <function <lambda> at 0x7f3dcde4f378>
    print(type(myFunction2)) #<class 'function'> ←function型
    print(myFunction2(4,3)) #12 ←4x3
    ```

### 変数へ def / lambda 構文による関数の格納
* def 構文の場合、関数名（変数）に function 型のデータが格納される
* lambda 構文の場合、匿名の function 型のデータとなる（変数に格納可能）
* def / lambda ともに function 型のデータのため、１つの変数に入れ替えることが可能
```
#test.py
def japanesHello(): #「def」構文による関数
    import datetime
    _hour = datetime.datetime.now().hour
    if (_hour > 18) or (5 > _hour ) : return "今晩は"
    elif (11 > _hour) : return "おはようございます"
    else: return "こんにちは"

chinesehHello = lambda : "您好" #「lambda」構文による関数

hello = japanesHello #変数に「def」構文による関数を格納
print(hello()) #"こんにちは"（時間による）
hello = chinesehHello #変数の中を「lambda」構文による関数と入れ替える
print(hello()) #"您好"
```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年0X月XX日


<a name="静的変数・静的関数"></a>
# <b>静的変数・静的関数</b>

### 概要
* 静的変数・静的関数は、クラスをインスタンス化せずにアクセス可能
* Pythonでは静的関数は ①静的メソッド と ②クラスメソッド の２種類あり
* Pythonには static 修飾子は存在せず、パブリック変数を擬似的に静的変数扱いにする  

### 例文
```
#test.py
class MyClass(object):
    PI = 3.141592653589793 #擬似「静的変数」←実際は「パブリック変数」
    #↑パブリック変数はここで初期化しないようにしましょう（静的変数と混乱するため…）
    """ 
    ②クラスメソッド の場合、上記の２行を次の通りに変更
    @classmethod #「②クラスメソッド」の宣言
    def Pow(cls, arg1, arg2): #cls（名前は任意／クラス自身）が必須
    """
    @staticmethod #「①静的メソッド」の宣言
    def Pow(arg1, arg2):
        if arg2 == 0:
            return 1 #0乗対策
        _result = arg1
        for i in range(1, arg2):
            _result = _result * arg1
        return _result

print(MyClass.PI) #3.141592653589793
print(MyClass.Pow(2,8)) #256

_myClass = MyClass() #インスタンスの生成
print(_myClass.PI) #3.141592653589793 ←インスタンスからも呼び出せる
print(_myClass.Pow(2,8)) #256 ←インスタンスからも呼び出せる

MyClass.PI = 3.14 #変更が出来ます（変更不可にはできません）
print(MyClass.PI) #3.14
print(_myClass.PI) #3.14 ←インスタンス変数も変更される
```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年0X月XX日


<a name="if文"></a>
# <b>if 文</b>
* Python には switch 文は存在しない  
（何かをするのに明確な方法がただ１つあるべきという思想とか…）

### 基本構文
* Trueと評価される可能性が高い順に並べるとif文を早く抜け出せる可能性が高い
```
#test.py
_age = 49
if (_age <= 20) : #()は省略可
    print("20歳以下")
elif (_age <= 40) : #「else if」でも「elseif」でもない（要注意）
    print("21〜40歳")
elif (_age <= 60) :
    print("41〜60歳") #これが出力される
else:
    print("61歳以上")
```

* 注意：条件式の判断記述について
```
#test.py
if None : #() '' "" も同じFalseとして判断
    print("A")
else:
    print("B") #こちらが実行される

if "あ" : #中身が何かあればTrueとして判断
    print("A") #こちらが実行される
else:
    print("B")
```

### 論理積（and）
1. 論理演算子（and）を使う方法
    ```
    if (条件式① and 条件②) : #()は省略可
        処理A ←条件式① かつ 条件式② の両方がTrueの場合に実行
    else:
        処理B
    ```

1. ifのネストを使う方法
    ```
    if (条件式①) : #()は省略可
        if (条件②) :
            処理A ←条件式① かつ 条件式② の両方がTrueの場合に実行
        else:
            処理B
    else:
        処理B
    ```

### 論理和（or）
1. 論理演算子（or）を使う方法
    ```
    if (条件式① or 条件②) : #()は省略可
        処理A ←条件式①または条件式②の両方がTrueの場合に実行
    else:
        処理B
    ```

1. ifのネストを使う方法
    ```
    if (条件式①) : #()は省略可
        処理A ←条件式①がTrueの場合に実行
    elif (条件②) :
        処理A ←条件式②がTrueの場合に実行
    else:
        処理B
    ```

### 排他的論理和（XOR）
1. ^演算子を使う方法
    ```
    #test.py
    a_ = True
    b_ = False
    if (a_ ^ b_) : #()は省略可
        print("どちらか一方だけtrueです")
    else:
        print("両方共にtrueかfalseです")
    ```

1. ^演算子を使わない場合
    ```
    #test.py
    a_ = True
    b_ = False
    if ((a_ or b_) and not (a_ and b_)) : #()は省略可
        print("どちらか一方だけtrueです")
    else:
        print("両方共にtrueかfalseです")
    ```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年0X月XX日


<a name="三項演算子"></a>
# <b>三項演算子</b>

### 構文
* Python の三項演算子は if 文を使った独特のものです
```
変数 = (True時の返り値) if (比較式) else (False時の返り値)
```

### 例文
```
_age = 49
_result = "現役" if (_age < 60) else "退職"
print(_result)
```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年0X月XX日


<a name="for文"></a>
# <b>for 文</b>

### 基本構文
```
for 変数 in range(開始,終了):
    繰り返す処理
```

### 基本例文
```
#test.py
for i in range(0,10): #第１引数を省略すると0扱い
    print(i) #0,1,2,3,4,5,6,7,8,9

print(i) #9（for文の外でもiは有効）
```

### for文のネスト
* ループ制御変数にはi,j,kが使われる
```
#test.py
for i in range(1,6):
    for j in range(1,6):
        print("x" + str(i) + "y" + str(j)) #x1y1,x1y2,....,x5y4,x5y5
```

### continue文
* ループカウンタを○つずつアップする
```
#test.py
for i in range(0,50):
    if i % 5: #5つずつアップする場合…
        continue #以降処理せず、for文のブロックの先頭に戻って再度繰返す
    print(i) #0,5,10,15,20,25,30,35,40,45
```

### 無限ループと break 文
```
#test.py
count_ = 0
for i in range(0,int(9e9)): #ほぼ無限ループ（厳密な無限にはwhile文を使います）
    count_ += 1
    if (count_ > 100):
        break #100を超えたらループを抜け出す
    print(count_) #1,2,....,99,100
```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年0X月XX日


<a name="for...in文"></a>
# <b>for...in 文</b>

### 基本構文
```
for ループ制御変数, 要素変数 in enumerate(リスト等):
    print(ループ制御変数, 要素変数）
```
```
for 要素変数 in リスト等: ←要素だけ取り出したい場合はこちらを使います
    print(要素変数）
```

### リスト（変更可能な配列）
```
#test.py
_list = ["A", "B", "C"]
for i, tmp in enumerate(_list):
    print(i, tmp) # 0 A → 1 B → 2 C
```

### タプル（tuple／変更不可の配列）
```
#test.py
lock_list = ("A", "B", "C")
for i, tmp in enumerate(lock_list):
    print(i, tmp) # 0 A → 1 B → 2 C
```

### セット（重複不許可な集合体）
```
#test.py
set_ = set(["A", "B", "C"])
for i, tmp in enumerate(set_):
    print(i, tmp) # 0 C → 1 A → 2 B ←順序に注意
```

### フローズンセット（変更不可の集合型）
```
#test.py
frozenset_ = frozenset(["A", "B", "C"])
for i, tmp in enumerate(frozenset_):
    print(i, tmp) # 0 C → 1 B → 2 A ←順序に注意
```

### 辞書（連想配列）
```
#test.py
_dict = {"A":"あ", "I":"い"}
for i, tmp in enumerate(_dict):
    print(i, tmp, _dict[tmp]) # 0 A あ → 1 I い
```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年0X月XX日


<a name="while文"></a>
# <b>while 文</b>
* 他の多くの言語にある do...while 文はない

### 基本構文
```
while (ループ判定式) : #ループ判定式がTrueの間繰り返される（()は省略可）
    繰り返す処理
```

### 例文
```
#test.py
i_ = 0
while (i_ < 10) : #()は省略可
    print(i_) #0,1,2,3,4,5,6,7,8,9
    i_ += 1

print(i_) #10 ←while文の外でも変数はまだ有効
```

### while 文と break 文
```
#test.py
count_ = 0
while (True) : #ループ判別式をTrueにすると無限ループに!
    count_ += 1
    if (count_ > 100) :
        break #ループを終了
    print(count_) #1,2,....,99,100（1〜100までを出力）

print("while文終了") #while文の外
```

### while 文と continue 文（3の倍数を出力）
```
#test.py
i_ = 1
while (i_ <= 20) :
    if ((i_ % 3) != 0) : #3で割って余りが0ではない（＝3の倍数ではない）場合
        i_ += 1
        continue #while文の残処理をスキップしてwhile文の次の反復を開始する
    print(i_) #3,6,9,12,15,18（3の倍数を出力）
    i_ += 1
```

実行環境：Windows 10、Ruby 2.3.1  
作成者：夢寐郎  
作成日：2022年0X月XX日


<a name="配列（タプル）"></a>
# <b>配列（タプル）</b>

### 概要
* 要素の数を変更不可
* 要素の内容を変更不可

### 作成（２次元配列の作成可能）
* 構文
```
①変数名 = (要素①, 要素②, 要素③)
②変数名 = tuple([要素①, 要素②, 要素③])
```
* 例文
```
#test.py
tuple_ = ('A', 'B', 'C')
print(type(tuple_)) #<class 'tuple'> ←tuple（タプル）型
print(tuple_) #('A', 'B', 'C')
```

### 要素の数
* 構文
```
len(タプル)
```
* 例文
```
#test.py
tuple_ = ("A","B","C")
print(len(tuple_)) #3
```

### 抽出
* 構文
```
タプル[開始インデックス[:終了インデックス:ステップ]]
```
* 例文
```
#test.py
tuple_ = (0,1,2,3,4,5,6,7,8,9,10)
print(tuple_[10]) #10
print(tuple_[2:5]) #(2, 3, 4) ←インデックス番号2〜5未満までを抽出
print(tuple_[0:10:3]) #(0, 3, 6, 9) ←インデックス番号0〜10未満までを3つ毎に抽出
```

### 検索
* 構文
```
①タプル.index(検索する要素[,検索開始位置,検索終了位置]) ←見つかった位置を返す
②検索する要素 in タプル ←見つかるとTrue（見つからないとFalase）を返す
```
* 例文
```
#test.py
tuple_ = ("A","B","C","D","E","F","G","H","I","J","K")
print("E" in tuple_) #True ←"E"が見つかった
print(tuple_.index("E")) #4 ←"E"を検索（インデックス4番目にヒット）
```

### 全要素の取得
```
for 変数 in タプル: print(変数) ←要素だけを取得する場合
```
* [for...in 文](#for...in文)参照

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年0X月XX日


<a name="動的配列（リスト）"></a>
# <b>動的配列（リスト）</b>

### 概要
* [配列（タプル）](#配列（タプル）)とは異なり要素の数の変更･追加･削除等が可能

### 作成
* 構文
```
変数名 = [] #空のリストを作成
変数名 = [None] * 個数 #指定数の空（None）の要素を持つリスト作成
変数名 = [要素①, 要素②,...] #要素のデータ型は何でも良い
```
* 例文
```
#test.py
_list = []
print(_list) #[]
_list2 = ['A', 'B', 'C']
print(_list2) #['A', 'B', 'C']
list3_ = [None] * 10
print(list3_) #[None, None, None, None, None, None, None, None, None, None]
```

### 追加（最後）
* 構文
```
リスト.append(値) #値は何も良い（混在可能）
```
* 例文
```
#test.py
_list = []
_list.append('A')
_list.append('B')
print(_list) #['A', 'B']
```

### 追加（指定位置）
* 構文
```
リスト.insert(インデックス番号,値) #先頭（0）〜最後（len(リスト)）まで指定可能
```
* 例文
```
#test.py
_list = ['A','B']
_list.insert(0,'C')
print(_list) #['C', 'A', 'B']
```

### 更新（任意の位置）
* 構文
```
リスト[インデックス番号] = 値
```
* 例文
```
#test.py
_list = ['A', 'B', 'C']
_list[0] = None #0番目を変更する場合 ←None型も指定可能
print(_list) #[None, 'B', 'C']
```

### 削除（指定の要素）
* 構文
```
リスト.remove(削除する要素) #最初に見つかった指定の要素を削除
```
* 例文
```
#test.py
_list = ['A', 'B', 'C']
_list.remove("A")
print(_list) #['B', 'C']
```

### 削除（指定の位置）
* 構文
```
del リスト[インデックス番号] #指定のインデックス番号の要素を削除
```
* 例文
```
#test.py
_list = ['A', 'B', 'C']
del _list[0] #先頭を削除する場合
#del _list[len(_list)-1] #最後を削除する場合
print(_list) #['B', 'C']
```

### 削除（○〜○番目）
* 構文
```
del リスト[開始インデックス:終了インデックス[:ステップ]] #終了番目は含まない
```
* 例文
```
#test.py
_list = [0,1,2,3,4,5,6,7,8,9]
del _list[1:5] #1〜5番目（5番目は含まない）を削除する場合
print(_list) #[0, 5, 6, 7, 8, 9]
```

### 抽出（○〜○番目）
* 構文
```
リスト[開始インデックス:終了インデックス[:ステップ]] #終了番目は含まない
```
* 例文
```
#test.py
_list = [0,1,2,3,4,5,6,7,8,9]
print(_list[1:5]) #[1, 2, 3, 4]
```

### 検索(ヒットしたか否か）
* 構文
```
検索する値 in リスト
```
* 例文
```
#test.py
_list = [0,1,2,3,4,5,6,7,8,9]
print(5 in _list) #True（見つからなければFalse）
```

### 検索(ヒット位置）
* 構文
```
リスト.index(検索する値 [,開始位置,終了位置])
```
* 例文
```
#test.py
_list = [0,1,2,3,4,5,6,7,8,9]
print(_list.index(5)) #5（見つからない場合ValueError）
```

### 検索（ヒット数）
* 構文
```
リスト.count(検索する値)
```
* 例文
```
#test.py
_list = ['A','C','B','C','A','C']
print(_list.count('C')) #3（見つからなければ0）
```

### 要素の数
* 構文
```
len(リスト)
```
* 例文
```
#test.py
_list = [0,1,2,3,4,5,6,7,8,9]
print(len(_list)) #10
```

### 並べ替え（反転）
* 構文
```
リスト.reverse()
```
* 例文
```
#test.py
_list = [0,1,2,3,4,5,6,7,8,9]
_list.reverse()
print(_list) #[9, 8, 7, 6, 5, 4, 3, 2, 1, 0]
```

### 並べ替え（ソート）
* 構文
```
リスト.sort()
```
* 例文
```
#test.py
_list = [3,6,2,8,4,1,9,0,5,7]
_list.sort()
print(_list) #[0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
```

### 結合
* 構文
```
リスト①.extend(追加するリスト②) #リスト①の末尾にリスト②を結合
```
* 例文
```
#test.py
_list1 = ["A","B","C"]
_list2 = ["D","E","F"]
_list1.extend(_list2)
print(_list1) #['A', 'B', 'C', 'D', 'E', 'F']
```

### 複製
* 構文
```
import copy
変数 = copy.deepcopy(コピー元のリスト)
```
* 例文
```
#test.py
import copy
origin_ = ["A","B"]
_copy = copy.deepcopy(origin_)
_copy[0] = "C" #値を変更してみる
print(origin_) #['A', 'B'] ←参照ではないことが判る
print(_copy) #['C', 'B']
```

### 文字列→リスト
* 構文
```
変数 = 文字列.split("区切り文字")
```
* 例文
```
#test.py
_string = "A,B,C"
_list = _string.split(",") #カンマ区切りで分割してリスト化
print(_list) #['A', 'B', 'C']
```

### 全要素を取り出す
1. インデックス番号と要素を取り出す
    ```
    #test.py
    _list = ["A","B","C","D","E"]
    for i, tmp in enumerate(_list):
        print(i, tmp) # 0 A → 2 B → 3 C → 4 D → 5 E
    ```

1. 要素のみ取り出す
    ```
    #test.py
    _list = ["A","B","C","D","E"]
    for tmp in _list:
        print(tmp) # "A"→"B"→"C"→"D"→"E"
    ```

### 比較
```
#test.py
print(['A','B','C'] == ['A','B','C']) #True
print(['A','B','C'] == ["A","B","C"]) #True ←'○'と"○"は同一扱い
print(['A','B','C'] is ['A','B','C']) #False ←オブジェクトが異なるので…
```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年0X月XX日


<a name="連想配列（辞書）"></a>
# <b>連想配列（辞書）</b>

### 作成
```
①変数名 = {'キー①':値①, 'キー②':値②} ←これがわかり易い
②変数名 = dict(キー①=値②, キー②=値)
③変数名 = dict([('キー①',値①),('キー②',値②])
④変数名 = dict({'キー①':値①, 'キー②':値②})
```

### 追加･更新
* 構文
```
辞書['キー'] = 値
```
* 例文
```
#test.py
_dict = {'A':'あ', 'I':'い'}
_dict['U'] = 'う' #追加（存在する場合は更新）
print(_dict) #{'U': 'う', 'A': 'あ', 'I': 'い'}
```

### 取得
* 構文
```
辞書['キー']
```
* 例文
```
#test.py
_dict = {'A':'あ', 'I':'い', 'U':'う'}
print(_dict['A']) #'あ'
```

### 削除
* 構文
```
del 辞書['キー']
```
* 例文
```
#test.py
_dict = {'A':'あ', 'I':'い', 'U':'う'}
del _dict['A']
print(_dict) #{'U': 'う', 'I': 'い'}
```

### キーの検索
* 構文
```
'キー' in 辞書
```
* 例文
```
#test.py
_dict = {'A':'あ', 'I':'い', 'U':'う'}
print('A' in _dict) #True（任意のキーが無いとFalse）
```

### 要素数
* 構文
```
len(辞書)
```
* 例文
```
#test.py
_dict = {'A':'あ', 'I':'い', 'U':'う'}
print(len(_dict)) #3
```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年0X月XX日


<a name="self"></a>
# <b>self</b> ≒ this

```
#test.py
class MyClass(object):
    #↓通常はプライベート（__p）にするので問題ない（他の言語と異なるところ）
    _p = None #インスタンス変数（selfは不要）
    
    #コンストラクタ（第１引数にselfが必須)
    def __init__(self, _p): #引数名がインスタンス変数名と同じ場合…
        self._p = _p #selfが無いとローカル変数扱い
        
        #↓このメソッドが実行されたオブジェクト
        print(self) #<__main__.Robot object at 0x7f3667656b00>
        self.myMethod() #selfが必須（クラス内で関数を実行する場合）

    def myMethod(self): #selfが必須（クラス内に定義する関数）
        _p = None #ローカル変数
        _p = self._p + 10 #selfが無いとError]
        print(_p)
    
_myClass = MyClass(500)
_myClass.myMethod()
```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年0X月XX日


<a name="文字列の操作"></a>
# <b>文字列の操作</b>

### string オブジェクトの作成
* 構文
```
①変数 = "○○"
②変数 = '○○' ←ダブルクォーテーション（""）と同じ
③変数 = """○○""" ←\nを使わない改行が可能
```

* 例文
```
↓３つとも同じ結果になります。
①_string = "１行目\n２行目"
②_string = '１行目\n２行目'
③_string = """１行目
２行目"""
```

### 長さを調べる
* 構文
```
len(文字列)
```

* 例文
```
#test.py
_string1 = "ABCDE"
print(len(_string1)) #5
_string2 = "あいうえお"
print(len(_string2)) #5 ←全角文字も１字扱い
```

### 一部分を取得
* 構文
```
文字列[番号] ←0〜len(文字列)
文字列[開始:終了) ←終了は含まない
```

* 例文
```
#test.py
_string = "0123456789"
print(_string[4]) #4
print(_string[4:7]) #456
print(_string[4:len(_string)]) #456789
```

### 一部分を削除
* 構文
```
文字列.strip('削除する文字列') ←両端から削除
文字列.lstrip('削除する文字列') ←左端から削除
文字列.rstrip('削除する文字列') ←右端から削除
```

* 例文
```
#test.py
_string = "ABCDCBA"
print(_string.strip('A')) #BCDCB ←両端から削除
print(_string.lstrip('A')) #BCDCBA ←左端から削除
print(_string.rstrip('A')) #ABCDCB ←右端から削除
print(_string) #ABCDCBA ←元は変更なし
```

### 置換
* 構文
```
文字列.replace('置換前の文字列', '置換後の文字列')
```

* 例文
```
#test.py
_string = "2017年4月11日"
print(_string.replace('2017年','平成29年')) #平成29年4月11日
```

### 検索
* 構文
```
検索したい文字列 in 文字列 ←True or False
文字列.find("検索したい文字列" [,開始位置,終了位置]) ←見つからない場合-1
文字列.rfind("検索したい文字" [,開始位置,終了位置])←見つからない場合-1
```

* 例文
```
#test.py
_string = "ABCDEFG-ABCDEFG"
if ("CD" in _string) : #見つかった（True）場合…
    print(_string.find("CD")) #2 ←左から検索
    print(_string.rfind("CD")) #10 ←右から検索
```

### 文字列→配列
* 構文
```
String.split('区切り文字');
```

* 例文
```
#test.py
_string = "A,B,C" #「,」区切りの文字列
list_ = _string.split(',') #「,」区切りで分割してリスト化
print(list_) #['A', 'B', 'C']
```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年0X月XX日


<a name="正規表現"></a>
# <b>正規表現</b>

### 概要
* 正規表現は、URL、パスワード、メールアドレス等、特定の文字パターンを抽出するのに利用
* 正規表現の基本文法は、特定のプログラミング言語に依存しない
* Python では re モジュール（regex、regular expressionの略）として提供
* Python には以下のサンプル以外にも多くの正規表現の機能が用意されている

### 検索
* 構文
```
import re ←正規表現に必須
○ = re.compile('検索する文字列') ←正規表現をコンパイル
結果 = ○.search(文字列) ←見つからないとNone、見つかると<_sre.SRE_Match…が返る
```

* 例文
```
#test.py
import re #正規表現に必須
_string = "吉田松蔭,高杉晋作,久坂玄瑞,吉田稔麿,伊藤博文"
pattern_ = re.compile('吉田') #正規表現をコンパイル
_result = pattern_.search(_string) #見つからなければNone
if (_result is None) :
    print("吉田は含まれていません")
else :
    print("吉田は含まれています")
```

### 置換
* 構文
```
import re ←正規表現に必須
○ = re.compile('置換前の文字列') ←正規表現をコンパイル
結果 = ○.sub('置換後の文字列', 文字列)
```

* 例文
```
#test.py
import re #正規表現に必須
_string = "吉田松蔭,高杉晋作,久坂玄瑞,吉田稔麿,伊藤博文"
pattern_ = re.compile('吉田') #正規表現をコンパイル
print(pattern_.sub('よしだ', _string)) #よしだ松蔭,高杉晋作,久坂玄瑞,よしだ稔麿,伊藤博文
```

実行環境：Windows 10、Godot Engine 3.4.2 
作成者：夢寐郎  
作成日：2022年0X月XX日


<a name="抽象クラス"></a>
# <b>抽象クラス</b>

### 概要
* Pythonには interface や abstract キーワードは存在しません
* Pythonでは、継承と例外を使って擬似的な抽象クラスを実現します

### 構文
```
class Abstract○○(object): #擬似抽象クラスの定義（実際には単なる基本クラス）
    def □□(self): #擬似抽象関数の宣言（実際は単なる関数）
        raise NotImplementedError() #派生クラスで実装しないとErrorを発生させる

class 派生クラス名(Abstract○○): #抽象クラスを継承
    def □□(self):
        #実際の処理
```

### 例文
```
#test.py
class AbstractClass(object): #擬似抽象クラスの定義（実際には単なる基本クラス）
    def common(self): #共通の関数
        print("共通の関数")

    def abstractFunction(self): #擬似抽象関数の宣言（実際は単なる関数）
        #↓派生クラスで実装しないとErrorを発生させる（ポイント）
        raise NotImplementedError() #例外処理

#派生クラス
class SubClass(AbstractClass): #擬似抽象クラスを継承
    #↓オーバーライドして実際の処理を記述
    def abstractFunction(self):
        #↓実際の処理
        print("派生クラスでオーバーライドした抽象関数")

#実行
_subClass = SubClass()
_subClass.common() #"共通の関数"
_subClass.abstractFunction() #"派生クラスでオーバーライドした抽象関数"
```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年0X月XX日


<a name="super関数"></a>
# <b>super 関数</b>

### 書式
```
# 基本クラス
class 基本クラス名(object):
    def __init__(self, 引数): ←コンストラクタ
        …………
    def ○○(self, 引数): ←派生クラスでオーバーライドされる
        …………

# 派生クラス
class 派生クラス名(基本クラス名): ←基本クラスを継承
    def __init__(self, 引数): ←コンストラクタ
        super(派生クラス名, self).__init__(引数)
        …………
    def 関数名(self, 引数): ←基本クラスの関数をオーバーライド
        super(派生クラス名, self).○○(引数) ←基本クラスの同名の関数を呼び出す
        …………
```

## 例文
```
#test.py
#基本クラス
class SuperClass(object):
    def __init__(self, arg): #コンストラクタ
        print("基本クラスのコンストラクタ:" + arg)
    def hoge(self, arg): #派生クラスでオーバーライドされる
        print("基本クラスのhoge(): " + arg)

#派生クラス
class SubClass(SuperClass): #基本クラス（SuperClass）を継承
    def __init__(self): #コンストラクタ
        super(SubClass, self).__init__("派生クラスからの呼び出し")
    def hoge(self, arg): #基本クラスの関数をオーバーライド
        super(SubClass, self).hoge(arg) #基本クラスのhoge()を呼び出す

# 実行
_subClass = SubClass()
_subClass.hoge("派生クラスからの呼び出し")
```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年0X月XX日


<a name="オーバーライド"></a>
# <b>オーバーライド</b>

### 概要
* 基本クラスで定義したメソッドを派生クラスで再定義することをオーバーライドと呼ぶ
* 基本クラスのメソッドを呼び出したい場合は、super(クラス,self).メソッド()を使う

### 書式
```
class 基本クラス名(object):
    def 関数名(self, 引数): #派生クラスでオーバーライドされる
        ……

class 派生クラス名(基本クラス名):
    def 関数名(self, 引数): #基本クラスの関数をオーバーライドする
        #↓オーバーライドした基本クラスの関数を呼出す場合…
        super(派生クラス名, self).関数名(引数)
        ……
```

### 例文
```
#test.py
#基本クラス
class SuperClass(object):
    #↓派生クラスでオーバーライドされる
    def myFunction(self):
        print("基本クラスのmyFunction()")

#派生クラス
class SubClass(SuperClass): #基本クラス（SuperClass）を継承
    #↓基本クラスの関数をオーバーライドする
    def myFunction(self):
        #↓基本クラスのmyFunction()を呼出す場合…
        super(SubClass, self).myFunction()
        print("派生クラスのmyFunction()")

# 実行
_subClass = SubClass()
_subClass.myFunction()
```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年0X月XX日


<a name="カスタムイベント"></a>
# <b>カスタムイベント</b>

```
#test.py
#================
# カスタムクラス 
#================
class Robot(object):
    __energy = 100 #プライベート変数
    __dieHandler = None #プライベート変数（これにリスナー関数を格納）

    def __init__(self): #コンストラクタ関数
        pass
    
    def addEventListener(self, event_, function_):
        if (event_ == "die"):
            self.__dieHandler = function_ #変数にリスナー関数を格納（ポイント）
        else:
            print("Error: Robot.addEventListener()")

    def fight(self):
        self.__energy -= 20
        if (self.__energy <= 0):
           self.__dieHandler(self) #dieイベント発生!!（リスナー関数の呼出し）


# メイン =================================================================================
def die_Robot(arg): #前方定義
    print(arg) #<__main__.Robot object at 0x7f98ba5ebc50>
    print("GAME OVER!!") #dieイベントが発生した時に実行すること

_robot = Robot()
_robot.addEventListener("die", die_Robot)
_robot.fight()
_robot.fight()
_robot.fight()
_robot.fight()
_robot.fight() #"GAME OVER"
```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年0X月XX日


<a name="数学関数（math）"></a>
# <b>数学関数（math）</b>

### math.sin() : サイン（正弦）
```
#test.py
import math #必須
print(math.sin(0)) #0.0 ←0°
print(math.sin(math.pi/2)) #1.0 ←90°
print(math.sin(math.pi)) #1.2246467991473532e-16（≒0） ←180°
print(math.sin(math.pi*3/2)) #-1.0 ←270°
print(math.sin(math.pi*2)) #-2.4492935982947064e-16（≒0） ←360°
```

### math.cos() : コサイン（余弦）
```
#test.py
import math #必須
print(math.cos(0)) #1.0 ←0°
print(math.cos(math.pi/2)) #6.123233995736766e-17（≒0） ←90°
print(math.cos(math.pi)) #-1.0 ←180°
print(math.cos(math.pi*3/2)) #-1.8369701987210297e-16（≒0） ←270°
print(math.cos(math.pi*2)) #1.0 ←360°
```

### math.atan2() : アークタンジェント2
* 2つの値のアークタンジェント（逆タンジェント）
* X、Y 座標の角度をラジアン単位で返す
* Π ラジアン（3.141592…）は180°
```
#test.py
import math #必須
disX_ = math.sqrt(3) #√3のこと
disY_ = 1;
print(math.atan2(disY_, disX_)) #0.5235987755982989（ラジアン）
print(180*math.atan2(disY_, disX_)/math.pi) #30.000000000000004（度）
```

### math.pi : 円周率
```
#test.py
import math #必須
print(math.pi) #3.141592653589793 ※math.piラジアン=180°
```

### math.floor() : 切り捨て
```
#test.py
import math #必須
print(math.floor(1.001)) #1
print(math.floor(1.999)) #1
```
* 4倍程度高速な、[切り捨て除算演算子「//」](#演算子)もあり

### math.ceil() : 切り上げ
```
#test.py
import math #必須
print(math.ceil(1.001)) #2
print(math.ceil(1.999)) #2
```

### math.fabs() : 絶対値
```
#test.py
import math #必須
print(math.fabs(100)) #100.0
print(math.fabs(-100)) #100.0
```

### math.pow() : 累乗（○の□乗）
```
#test.py
import math #必須
print(math.pow(2, 0)) #1.0（2の0乗）
print(math.pow(2, 8)) #256.0（2の8乗）
```
* 指数演算子「**」を使う方法もある（こちらの方が5倍程度高速）
```
#test.py
print(2**0) #1（2の0乗）
print(2**8) #256（2の8乗）
```

### math.sqrt() : 平方根（√○）
```
#test.py
import math #必須
print(math.sqrt(2)) #1.4142135623730951（一夜一夜にひとみごろ）
print(math.sqrt(3)) #1.7320508075688772（人並みに奢れや）
print(math.sqrt(4)) #2.0
print(math.sqrt(5)) #2.23606797749979（富士山麓オウム鳴く）
```

以下は math モジュールを使わないもの
***

### round() : 四捨五入
```
#test.py
print(round(1.499)) #1
print(round(1.500)) #2
```

### max() : 比較（最大値）
```
#test.py
print(max(5.01, -10, 8, 2.9)) #8 ←リスト･タプルの要素の比較
```

### min() : 比較（最小値）
```
#test.py
print(min(5.01, -10, 8, 2.9)) #-10 ←リスト･タプルの要素の比較
```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年0X月XX日


<a name="乱数"></a>
# <b>乱数</b>

### 0〜1.0未満
```
#test.py
import random #必須
print(random.random()) #0.831427260696891 ←0〜0.999...
```

### 最小値〜最大値（float型）
```
#test.py
import random #必須
print(random.uniform(1,100)) #56.961497327378886 ←0.0〜100.0以下
```

### 最小値〜最大値（int型）
```
#test.py
import random #必須
i0=0; i1=0; i2=0; i3=0; i4=0; i5=0; i6=0; i7=0; i8=0; i9=0;
for i in range(0,1000000): #100万回繰り返します
    tmp = random.randint(0,9)
    if (tmp == 0): i0 += 1
    elif (tmp == 1): i1 += 1
    elif (tmp == 2): i2 += 1
    elif (tmp == 3): i3 += 1
    elif (tmp == 4): i4 += 1
    elif (tmp == 5): i5 += 1
    elif (tmp == 6): i6 += 1
    elif (tmp == 7): i7 += 1
    elif (tmp == 8): i8 += 1
    elif (tmp == 9): i9 += 1
    else: print("Error")
print(i0, i1, i2, i3, i4, i5, i6, i7, i8, i9)
#100059 99956 100599 100200 99863 99702 99881 99715 99783 100242
```

### ランダムな文字
```
#test.py
import random #必須
print(random.choice("1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ")) #"X"...など
```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年0X月XX日


<a name="日時情報"></a>
# <b>日時情報</b>

### 書式
```
import datetime #必須
○ = datetime.datetime.now()
○.year #年（2016等）
○.month #月（1〜12）
○.day #日（1〜31）
○.weekday() #0（月曜）〜6（日曜） ←これだけ関数（注意）
○.hour #時間（0〜23）
○.minute #分（0〜59）
○.second #秒（0〜59）
○.microsecond #マイクロ秒（0〜999999）
```

### 例文
```
#test.py
import datetime #必須
now_ = datetime.datetime.now()
print(now_) #2017-04-11 14:23:07.857409
print(now_.year) #年（2017等）
print(now_.month) #月（1〜12）
print(now_.day) #日（1〜31）
print(now_.weekday()) #0（月曜）〜6（日曜） ←…これだけ関数（注意）
print(now_.hour) #時間（0〜23）
print(now_.minute) #分（0〜59）
print(now_.second) #秒（0〜59）
print(now_.microsecond) #マイクロ秒（0〜999999）

#"hh:mm:ss"で現在の時間を表示する方法
if (now_.hour < 10) : h_ = "0" + str(now_.hour)
else: h_ = str(now_.hour)
if (now_.minute < 10) : m_ = "0" + str(now_.minute)
else: m_ = str(now_.minute)
if (now_.second < 10) : s_ = "0" + str(now_.second)
else: s_ = str(now_.second)
print(h_ + ":" + m_ + ":" + s_) #14:23:07
```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年0X月XX日


<a name="タイマー"></a>
# <b>タイマー</b>

### 一度だけ実行する場合
```
#test.py
import threading #必須
def timeOut():
    print("一度だけ実行したい処理")
timer_ = threading.Timer(3, timeOut) # 3秒後に1度だけ実行したい場合…
timer_.start()
```

### 繰り返し実行する場合
```
# test.py（threading.Thread を継承したクラスを作成した方法）
import threading #必須
import time

class Loop(threading.Thread):
    __isLoop = False

    def run(self):
        if (self.__isLoop) :
            print("繰返し実行したい処理を記述")
            time.sleep(0.5) #0.5秒間隔で実行したい場合…
            self.run() #これが無いと1回だけしか実行しない

    def stop(self): #カスタム関数
        self.__isLoop = False

    def start(self): #継承元の関数をオーバーライド
        self.__isLoop = True
        super(Loop, self).start() #継承元の関数を呼出す

_loop = Loop()
_loop.start()
#_loop.stop() #ループを止める場合
```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年0X月XX日


<a name="処理速度計測"></a>
# <b>処理速度計測</b>

### 構文
```
#test.py
import time #timeモジュール（日付と時間を扱うCライブラリ関数を提供）
開始時間 = time.time() #UNIX時間（1970年1月1日 午前0:00からの経過時間）
………
様々な処理
………
結果 = time.time() - 開始時間
print(結果) #○○秒（浮動小数点数値＝小数点15桁）
```

### 例文
```
#test.py
import time #必須
_start = time.time() #計測開始時間

#===========================================
#ここに計測したい様々な処理を記述
for i in range(0,100000000): #1億回繰り返す
    #速度計測したい処理
    pass #今回は何もしない
#===========================================

_result = time.time() - _start
print(str(_result) + 'sec.') #3.835374116897583sec.
```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年0X月XX日


<a name="外部テキストの読み込み"></a>
# <b>外部テキストの読み込み</b>
* [Web サーバ](http://bit.ly/2mbzR4D)を稼働する必要はない

### テキストファイルの用意（sample.txt/UTF-8として保存）
```
あいうえお
かきくけこ
さしすせそ
```

### 構文
```
○ = open("□□.txt", "r")
○.read() #テキストファイルの内容が返る
```

### 例文
```
#test.py
file_ = open("sample.txt", "r") #同じ階層に○.txtがある場合…
result_ = file_.read()
print(result_)
#あいうえお
#かきくけこ
#さしすせそ
```

### 外部テキストの書き込み（参考）
```
#test.py
#ファイルの書き込み
file_ = open("sample.txt", "w") # "r" ではなく "w"
file_.write("さしすせそ\nたちつてと") #「\n」で改行も可能
file_.close()

#ファイルの読み込み（確認）
file_ = open("sample.txt", "r") #同じ階層に○.txtがある場合
result_ = file_.read()
print(result_)
#さしすせそ
#たちつてと
```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年0X月XX日
