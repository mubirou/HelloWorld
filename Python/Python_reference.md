### <b>この項目は書きかけの項目です</b>

# <b>Python 基礎文法</b>

### <b>INDEX</b>

* Hello,world! （[Linux](https://github.com/TakashiNishimura/HelloWorld/blob/master/Python/Python_linux.md) / [macOS](https://github.com/TakashiNishimura/HelloWorld/blob/master/Python/Python_mac.md) / [Windows](https://github.com/TakashiNishimura/HelloWorld/blob/master/Python/Python_win.md)）
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
***
* [メソッド](#メソッド)
* [匿名関数（ラムダ式）](#匿名関数（ラムダ式）)
* [クラス定数･変数･メソッド](#クラス定数･変数･メソッド)
* [if 文](#if文)
* [三項演算子](#三項演算子)
* [case 文](#case文) ≒ switch 文
* [for 文](#for文)
* [each メソッド](#eachメソッド)
* [while 文](#while文)
* [配列（Array）](#配列（Array）)
* [連想配列（Hash）](#連想配列（Hash）)
* [self](#self) ≒ this
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

### 主なデータ型の種類
1. 論理型（bool）
1. 整数型（int）
1. 浮動小数点数（float）
1. 文字列（str）
1. リスト（list）
1. 変更不可のリスト（tuple）
1. 重複不許可な集合型（set）
1. 変更不可の集合型（frozenset）
1. クラス
1. 辞書型（dict）
1. 複素数オブジェクト型（complex）

### ①論理型（bool）
* TrueまたはFalse
```
#test.py
_bool = True #true/falseは不可
print(_bool) #True
print(type(_bool)) #<class 'bool'>
```

### ②整数型（int）
* 非常に大きな値も扱えます
```
#test.py
_int = 10000000000000000000 #1000京以上も扱える
print(_int) #10000000000000000000
print(type(_int)) #<class 'int'>
```

### ③浮動小数点数（float）
* 小数点第15桁まで
```
#test.py
_float = 3.141592653589793238462643383279502884197169399375105820974944592307816406286
print(_float) #3.141592653589793（小数点第15桁まで）
print(type(_float)) #<class 'float'>
```

### ④文字列（str）
* シングル/ダブルクォーテーション可
```
#test.py
_string = 'あいうえお' #"○"でも可（Python 2.Xではダブルバイトはエラー）
print(_string) #あいうえお
print(type(_string)) #<class 'str'>
```

### ⑤リスト（list）
* 配列（変更可）
```
#test.py
_list = ['A', 'I', 'U']
print(_list) #['A', 'I', 'U']
print(type(_list))  #<class 'list'>
```

### ⑥変更不可のリスト（tupleタプル）
* 配列（変更不可）
```
#test.py
_lockList = ('A', 'I', 'U')
print(_lockList) #('A', 'I', 'U')
print(type(_lockList)) #<class 'tuple'>
```

### ⑦重複不許可な集合型（set）
```
#test.py
_set = set(['0002', '0001', '0003'])
print(_set) #{'0003', '0001', '0002'} ←順序が変更される
print(type(_set)) #<class 'set'>
```

### ⑧変更不可の集合型（frozenset）
```
#test.py
_frozenset = frozenset(['A', 'C', 'B'])
print(_frozenset) #frozenset({'C', 'A', 'B'}) ←順序が変更される
print(type(_frozenset)) #<class 'frozenset'>
```

### ⑨クラス
```
#test.py
class MyClass: #前方宣言が必要
    def __init__(self): #コンストラクタ
        pass
_myClass = MyClass()
print(_myClass) #<__main__.MyClass object at 0x7fcbae161cc0>
print(type(_myClass)) #<class '__main__.MyClass'>
```

### ⑩辞書型（dict） : 連想配列
```
#test.py
_dict = {'A':'あ', 'I':'い'}
print(_dict) #{'A': 'あ', 'I': 'い'}
print(type(_dict)) #<class 'dict'>
```

### ⑪複素数オブジェクト型（complex）
```
#test.py
print(type(1+1j)) #<class 'complex'> ←内部では２つの別個の型扱い
```

### ⑫None型（None）……何もないことを示す定数
```
#test.py
print(type(None)) #<class 'NoneType'>
```

実行環境：Ubuntu 16.04.2 LTS、Python 3.5.2  
作成者：Takashi Nishimura  
作成日：2016年06月20日  
更新日：2017年04月10日


<a name="データ型の操作"></a>
# <b>データ型の操作</b>

### type() 関数 : データ型を返す
```
#test.py
print(type(True)) #<class 'bool'>
print(type(100)) #<class 'int'>
print(type(0.1)) #<class 'float'>
print(type('1')) #<class 'str'>
print(type(["TAKASHI", "TOHRU", "SACHIKO"])) #<class 'list'>
print(type(("TAKASHI", "TOHRU", "SACHIKO"))) #<class 'tuple'>
print(type(set(["TAKASHI", "TOHRU", "SACHIKO"]))) #<class 'set'>
print(type(frozenset(["TAKASHI", "TOHRU", "SACHIKO"]))) #<class 'frozenset'>
print(type({"TAKASHI":48, "TOHRU":13})) #<class 'dict'>
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
print(type(_tmp)); #<class 'int'>

#数値→string型
_tmp = str(100)
print(_tmp) #100
print(type(_tmp)) #<class 'str'>
```

実行環境：Ubuntu 16.04.2 LTS、Python 3.5.2  
作成者：Takashi Nishimura  
作成日：2016年06月20日  
更新日：2017年04月10日


<a name="クラス"></a>
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

実行環境：Ubuntu 16.04.2 LTS、Python 3.5.2  
作成者：Takashi Nishimura  
作成日：2016年06月20日  
更新日：2017年04月10日


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

実行環境：Ubuntu 16.04.2 LTS、Python 3.5.2  
作成者：Takashi Nishimura  
作成日：2016年06月21日  
更新日：2017年04月10日


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

実行環境：Ubuntu 16.04.2 LTS、Python 3.5.2  
作成者：Takashi Nishimura  
作成日：2016年06月28日  
更新日：2017年04月10日


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

実行環境：Ubuntu 16.04.2 LTS、Python 3.5.2  
作成者：Takashi Nishimura  
作成日：2016年06月21日  
更新日：2017年04月10日


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

実行環境：Ubuntu 16.04.2 LTS、Python 3.5.2  
作成者：Takashi Nishimura  
作成日：2016年06月21日  
更新日：2017年04月10日


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

nishimura_ = Nishimura()
print(nishimura_.age) #49
nishimura_.age = 18 #変更できてしまう
print(nishimura_.age) #18
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

nishimura_ = Nishimura()
print(nishimura_.age) #48
#nishimura_.age = 18 #エラー（変更不可）
```

実行環境：Ubuntu 16.04.2 LTS、Python 3.5.2  
作成者：Takashi Nishimura  
作成日：2016年06月22日  
更新日：2017年04月11日


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

実行環境：Ubuntu 16.04.2 LTS、Python 3.5.2  
作成者：Takashi Nishimura  
作成日：2016年06月22日  
更新日：2017年04月11日


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
MY_NAME = "TAKASHI NISHIMURA"

print(MY_NAME) #TAKASHI NISHIMURA

MY_NAME = "TARO NISHIMURA" #変更できてしまう（本当は定数ではない）
print(MY_NAME) #TARO NISHIMURA
#上記のようにせず「大文字の変数は定数扱い＝変更不可」というルールにする…だけです。
```

### クラス定数（クラスからもインスタンスからも呼び出せる）
```
#test.py
#カスタムクラス（MyClass）
class MyClass(object):
    #擬似「クラス定数」←実際はパブリック変数
    MY_NAME = "TAKASHI NISHIMURA"

#=====================================================
# 「インスタンス変数」と「クラス定数」の違いを検証
#=====================================================
myClass_ = MyClass() #インスタンスの生成
print(myClass_.MY_NAME) #TAKASHI NISHIMURA ←インスタンス変数へのアクセス
myClass_.MY_NAME = "HANAKO NISHIMURA" #インスタンス変数を変更（他人をいじる…）
#↑オブジェクト指向のルールとしてgetter/setterでアクセスすべきですが…
print(myClass_.MY_NAME) #HANAKO NISHIMURA

print(MyClass.MY_NAME) #TAKASHI NISHIMURA ←クラス変数とインスタンス変数は別扱い

MyClass.MY_NAME = "TARO NISHIMURA" #変更できてしまう（実際は定数ではない）
print(MyClass.MY_NAME) #TARO NISHIMURA
```

実行環境：Ubuntu 16.04.2 LTS、Python 3.5.2  
作成者：Takashi Nishimura  
作成日：2016年06月23日  
更新日：2017年04月11日


<a name="メソッド"></a>
# <b>メソッド</b>

### 基本構文
* メソッド名にはアルファベット、数字、_（アンダースコア）を使用可能（数字で開始は不可）
```
def メソッド名(引数①, 引数②, …)
    ……さまざまな処理……
    [return 戻り値]
end

メソッド名(引数①, 引数②, …)
```

### publicメソッド
```
#test.rb
class MyClass
    #○〜○までの値を足した合計を調べるメソッド
    def tashizan(_start, _end)
        _result = 0 #ローカル変数
        for i in _start.._end
            _result += i
        end
        return _result
    end
    public :tashizan #tashizan()をpublic宣言（省略可）
end

_myClass = MyClass.new()
puts(_myClass.tashizan(1,10)) #55
puts(_myClass.tashizan(1,100)) #5050
```

### privateメソッド
* private とだけ記述してその後のメソッドを一括して private パブリック宣言することも可能
```
#test.rb
class MyClass
    def initialize() #コンストラクタ
        puts(tashizan(1,10)) #55（クラス内はアクセス可）
        puts(tashizan(1,100)) #5050（クラス内はアクセス可）
    end
    
    #○〜○までの値を足した合計を調べるメソッド
    def tashizan(_start, _end)
        _result = 0 #ローカル変数
        for i in _start.._end
            _result += i
        end
        return _result
    end
    private :tashizan #tashizan()をprivate宣言
end

_myClass = MyClass.new()
#_myClass.tashizan(1,10) #エラー（外部からアクセス不可）
```

### protectedメソッド
* クラス及びサブクラス内でのみアクセス可能
```
#test.rb
class SuperClass #スーパークラス（基本クラス）
    def myMethod()
        puts("スーパークラスのメソッド")
    end
    protected :myMethod #myMethod()をprotected宣言
end
class SubClass < SuperClass #サブクラス（派生クラス）
    def initialize() #コンストラクタ
        myMethod() #"スーパークラスのメソッド"（サブクラスではアクセス可）
    end
end
_subClass = SubClass.new()
#_subClass.myMethod() #エラー（クラス/サブクラス外ではアクセス不可）
```

### initializeメソッド（コンストラクタ）
```
class クラス名:
    def initialize(引数①, 引数②, ...)
        ……変数の初期化等の処理……
    end
    private :initialize #initializeだけは省略するとprivate扱い
        ……
end
```

### クラスメソッド＝静的メソッド
* 構文（他にも方法あり）
```
class クラス
    class << self
        def メソッド名(引数①, 引数②, ...)
            ……さまざまな処理……
        end
    end
end
```

* 例文
```
#test.rb
class MyMath
    class << self #この中のメソッドがクラスメソッドになる
        def pow(arg1, arg2)
            if (arg2 == 0) then
                return 1 #0乗対策
            end
            _result = arg1 #ローカル変数
            for i in 1..arg2-1
                _result = _result * arg1
            end
            return _result
        end
    end
end

# 実行
puts(MyMath.pow(2,0)) #1（クラス.クラスメソッド()で呼び出せる）
puts(MyMath.pow(2,1)) #2
puts(MyMath.pow(2,8)) #256
_myMath = MyMath.new()
#puts(_myMath.pow(2,8)) #エラー（インスタンスからは呼出し不可）
```

### デフォルト値付き引数（引数が省略可能）
```
#test.rb
class MyClass
    @point #省略可能
    def initialize() #コンストラクタ
        @point = 0
    end
    def addPoint(arg=1) #初期値を1とした場合
        @point += arg
        puts(@point)
    end
end
_myClass = MyClass.new()
_myClass.addPoint() #1（引数を指定しないと初期値（1）で処理）
_myClass.addPoint(10) #10（引数を指定した場合）
```

### 可変長引数
* 引数を固定の数ではなく任意の数にすることが可能）
```
#test.rb
class MyClass
    def sum(*arg) #可変長引数はArray型
        _result = 0 #ローカル変数
        for i in 0..arg.length-1
            _result += arg[i]
        end
        puts(_result)
    end
end
_myClass = MyClass.new()
_myClass.sum(1,1) #2 1+1
_myClass.sum(1,2,3,4,5) #15（1+2+3+4+5）
```

### 名前付き引数
* 引数名を指定してメソッドを呼び出す＝任意の順序で引数を渡すことが可能
```
#test.rb
class MyClass
    #デフォルト値を省略する場合「引数名:」とだけ記述  
    def rect(startX:0, startY:0, endX:0, endY:0) 
        _result = (endX - startX) * (endY - startY)
        puts("面積:" + _result.to_s + "m2")
    end
end

_myClass = MyClass.new()
_myClass.rect(endX:100, endY:100) #面積:10000m2（デフォルト値付との併用）
```

実行環境：Ubuntu 16.04.2 LTS、Python 3.5.2  
作成者：Takashi Nishimura  
作成日：2016年07月06日  
更新日：2017年04月06日


<a name="匿名関数（ラムダ式）"></a>
# <b>匿名関数（ラムダ式）</b>

### 概要
* 実態は [Proc クラス](https://docs.Python-lang.org/ja/latest/class/Proc.html)
* Proc オブジェクトの生成には、Proc.new メソッドか Proc メソッド、または lambda メソッドを使用するが、ここでは ->(ブロック変数){処理} という方法を紹介

### ラムダ式による基本構文
* lambda メソッドを使う方法もあり
```
変数 = ->(引数①, 引数②, …) {
    ……いろいろな処理……
    [return 戻り値]
}

変数.call(引数①, 引数②, …)
```

### ラムダ式による例文
* lambda メソッドを使う方法もあり
```
#test.rb
#ラムダ式による匿名関数
_kakezan = ->(arg1, arg2) {
    return arg1 * arg2
}

#実態はProcクラス
p _kakezan #<Proc:0x00000000c45428@test.rb:1 (lambda)>
puts(_kakezan) #<Proc:0x00000000c45428@test.rb:1 (lambda)>
puts(_kakezan.class.name) #Proc（Proクラス）

#呼び出し方法
p _kakezan.call(9,9) #81
puts(_kakezan.call(9,9)) #81
#puts(_kakezan(9,9)) #Error（普通のメソッドと同じ方法では呼び出せない）
```

### 注意（Proc オブジェクトと通常のメソッドとの入れ替えは不可）
```
#test.rb
def hoge()
   puts("ほげ")
end

hoge() #"ほげ"
_piyo = hoge #"ほげ" ←hoge()を実行したことになってしまう
puts(_piyo) #（nil）
_piyo() #エラー
```

実行環境：Ubuntu 16.04.2 LTS、Python 3.5.2  
作成者：Takashi Nishimura  
作成日：2016年07月06日  
更新日：2017年04月07日


<a name="クラス定数･変数･メソッド"></a>
# <b>クラス定数･変数･メソッド</b>
* クラス定数･クラス変数･クラスメソッドは、クラスをインスタンス化せずにアクセスが可能
* 多くの言語にある static 修飾子はない
```
#test.rb
class MyClass
    #クラス定数（静的定数）の定義（静的定数）
    @@PI = 3.141592653589793 #@@xxx（大文字である必要はない）

    #アクセサ（getter）
    def MyClass.PI
        @@PI
    end

    #アクセサ（setter）
    def MyClass.PI=(value)
        @@PI = value
    end

    #静的メソッド（静的メソッド）の定義
    class << self #静的メソッドの宣言（決め打ち）
        def pow(arg1, arg2)
            if (arg2 == 0) then
                return 1 #0 乗対策
            end
            _result = arg1 #ローカル変数
            for i in 1..arg2-1
                _result = _result * arg1
            end
            return _result
        end
    end
end

#クラス定数の参照
puts(MyClass.PI) #3.141592653589793（静的変数の呼び出し）
puts(MyClass.pow(2,8)) #256（静的メソッドの呼び出し）

_myClass = MyClass.new() #インスタンスの生成
#puts(_myClass.PI) #エラー（インスタンスからの呼出しは不可）
#puts(_myClass.pow(2,8)) #エラー（インスタンスからの呼出しは不可）

MyClass.PI = 3.14 #変更も可能
puts(MyClass.PI) #3.14
```

実行環境：Ubuntu 16.04.2 LTS、Python 3.5.2  
作成者：Takashi Nishimura  
作成日：2016年07月06日  
更新日：2017年04月07日  


<a name="if文"></a>
# <b>if 文</b>
* if 文の反対の役割をする unless 文もあり

### 基本例文
* trueと評価される可能性が高い順に並べるとif文を早く抜け出せる可能性が高い

```
#test.rb
_age = 48
if (_age <= 30) then #()、thenは省略可
  puts("30歳以下")
elsif (_age <= 60) then #Pythonの「elif」と異なる（要注意）
  puts("31〜60歳") #これが出力される
else
  puts("61歳以上")
end
```

* 注意（中身が無いと false 扱い () も false 扱い）
```
#test.rb
if nil then 
    puts("A") 
else
    puts("B") #これが出力される
end

if "あ" then #中身が何かあればtrue扱い（''""含む）
    puts("A") #これが出力される
else
    puts("B")
end
```

### 論理積（AND）
* 2つの条件が true の場合

1. 論理演算子（&&）を使う方法
    ```
    if (条件式① && 条件②) then #()は省略可
        処理A ←条件式① かつ 条件式② の両方が true の場合に実行
    else
        処理B
    end
    ```

2. if のネストを使う方法
    ```
    if (条件式①) then #()は省略可
        if (条件②) then
            処理A ←条件式① かつ 条件式② の両方が true の場合に実行
        else
            処理B
        end
    else
        処理B
    end
    ```

### 論理和（OR）
* 2つの条件のどちらか一方でも true の場合

1. 論理演算子（||）を使う方法
    ```
    if (条件式① || 条件②) then #()は省略可
        処理A ←条件式①または条件式②の両方が true の場合に実行
    else
        処理B
    end
    ```

2. if のネストを使う方法
    ```
    if (条件式①) then #()は省略可
        処理A ←条件式①が true の場合に実行
    elsif (条件②) then
        処理A ←条件式②が true の場合に実行
    else
        処理B
    end
    ```

### 排他的論理和（XOR）
* 2つの条件のうちどちらか一方だけ true の場合
1. ^ 演算子を使う方法
    ```
    #test.rb
    _a = true
    _b = false
    if (_a ^ _b) then #()は省略可
        puts("どちらか一方だけtrueです")
    else
        puts("両方共にtrueかfalseです")
    end
    ```

2. ^ 演算子を使わない場合
    ```
    #test.rb
    _a = true
    _b = false
    if ((_a || _b) && !(_a && _b)) then #()は省略可
        puts("どちらか一方だけtrueです")
    else
    puts("両方共にtrueかfalseです")
    end
    ```

実行環境：Ubuntu 16.04.2 LTS、Python 3.5.2  
作成者：Takashi Nishimura  
作成日：2016年07月07日  
更新日：2017年04月07日


<a name="三項演算子"></a>
# <b>三項演算子</b>

### 比較式が１つの場合
* 構文
```
変数名 = (比較式) ? (true時の返り値) : (false時の返り値)
```

* 例文
```
#test.rb
def test(_age)
    _result = (_age < 60) ? "現役" : "退職"
    return _result
end
puts(test(49)) #"現役"
puts(test(89)) #"退職"
```

### 比較式が複数の場合
* 構文
```
変数名 = (比較式①) ? (①がtrueの場合の返り値) : #①がfalseの場合↓
変数名 = (比較式②) ? (②がtrueの場合の返り値) : #②がfalseの場合↓
変数名 = (①②の全てがfalseの場合の返り値);
```

* 例文
```
#test.rb
def test(_age)
    _result = (_age < 20) ? "未成年" :
    _result = (_age < 60) ? "現役" :
    _result = "退職"
    return _result
end
puts(test(19)) #"未成年"
puts(test(49)) #"現役"
puts(test(89)) #"退職"
```

実行環境：Ubuntu 16.04.2 LTS、Python 3.5.2  
作成者：Takashi Nishimura  
作成日：2016年07月07日  
更新日：2017年04月07日


<a name="case文"></a>
# <b>case 文</b> ≒ switch 文

### 基本構文
* thenは省略可
```
case 比較したいオブジェクト
when 値① then
    処理①
when 値② then
    処理②
else
    処理③
end
```

### 判別式が boolean 値ではない場合
```
#test.rb
_name = "TAKASHI"
case _name
when "TAKASHI"
    puts("父")
when "HANAKO"
    puts("母")
when "ICHIRO"
    puts("長男")
when "JIRO"
    puts("次男")
else
    puts("家族以外")
end
```

### 判別式が boolean 値の場合
* case 式に比較演算子が使われる
```
#test.rb
_age = 49
case true
when (_age <= 20)
    puts("20歳以下")
when (_age <= 60)
    puts("60歳以下")
else
    puts("61歳以上")
end
```

実行環境：Ubuntu 16.04.2 LTS、Python 3.5.2  
作成者：Takashi Nishimura  
作成日：2016年07月07日  
更新日：2017年04月07日


<a name="for文"></a>
# <b>for 文</b>

### 概要
* Python の for 文は内部処理的には each メソッド（参照「[each メソッド](#eachメソッド)」）を実行

### 例文
```
#test.rb
for i in 0..9 do #範囲オブジェクトの場合
    puts(i) #0→1→2→...→8→9
end

for tmp in ["A","B","C"] do #配列（Array）の場合
    puts(tmp) #"A"→"B"→"C"
end
```
* ハッシュ型 {"TAKASHI"=>49, "TARO"=>14} 等の場合、"TAKASHI"→49→"TARO"→14 という具合に、キー→オブジェクト→キー→オブジェクトの順で出力される

### for 文のネスト
* ループ制御変数には i, j, k が使われる
```
#test.rb
for i in 1..5 do
    for j in 1..5 do
        puts("x" + i.to_s + "y" + j.to_s) #x1y1,x1y2,....,x5y4,x5y5
    end
end
```

### next 文 ≒ continue 文
* ループカウンタを○つずつアップする
```
#test.rb
for i in 0..50 do
    if (i % 5)!=0 then
        next #以降処理せず、for文のブロックの先頭に戻って再度繰返す
    end
    puts(i) #0,5,10,15,20,25,30,35,40,45,50
end
```

### 無限ループと break 文
```
#test.rb
_count = 0
for i in 0..9e9 do #ほぼ無限ループ（厳密な無限にはloop文等を使用）
    _count += 1
    if (_count > 100) then
        break #100を超えたらループを抜け出す
    end
    puts(_count) #1,2,....,99,100
end
```

実行環境：Ubuntu 16.04.2 LTS、Python 3.5.2  
作成者：Takashi Nishimura  
作成日：2016年07月07日  
更新日：2017年04月07日


<a name="eachメソッド"></a>
# <b>each メソッド</b>

### 概要
* Python の for 文（参照「[for 文](#for文)」）は内部処理的はこの each メソッドを実行

### 例文
```
#test.rb
(0..9).each do |i| #範囲オブジェクトの場合
    puts(i) #0,1,2,3,4,5,6,7,8,9
end

["A","B","C"].each do |tmp| #配列（Array）の場合
    puts(tmp) #"A"→"B"→"C"
end
```
* ハッシュ型 {"TAKASHI"=>49, "TARO"=>14} 等の場合、"TAKASHI"→49→"TARO"→14 という具合に、キー→オブジェクト→キー→オブジェクトの順で出力される

### each メソッドのネスト
* ループ制御変数には i, j, k が使われる
```
#test.rb
(1..5).each do |i|
    (1..5).each do |j|
        puts("x" + i.to_s + "y" + j.to_s) #x1y1,x1y2,....,x5y4,x5y5
    end
end
```

### next 文 ≒ continue 文
* ループカウンタを○つずつアップする
```
#test.rb
(1..50).each do |i|
    if (i % 5)!=0 then
        next #以降処理せず、for文のブロックの先頭に戻って再度繰返す
    end
    puts(i) #0,5,10,15,20,25,30,35,40,45,50
end
```

### 無限ループと break 文
```
#test.rb
_count = 0
(0..9e9).each do |i| #ほぼ無限ループ（厳密な無限にはloop文等を使用）
    _count += 1
    if (_count > 100) then
        break #100を超えたらループを抜け出す
    end
    puts(_count) #1,2,....,99,100
end
```

実行環境：Ubuntu 16.04.2 LTS、Python 3.5.2  
作成者：Takashi Nishimura  
作成日：2016年07月07日  
更新日：2017年04月07日


<a name="while文"></a>
# <b>while 文</b>

### 概要
* while 文と条件判定が反対の until 文 もあり
* 他の言語にある do...while 文はない
* ループ判定式による終了条件がなく、ただ繰り返すだけの loop メソッドもあり

### 基本構文
```
while (ループ判定式) do #ループ判定式がtrueの間繰り返される（()、doは省略可）
    繰り返す処理
end
```

### 例文
```
#test.rb
_i = 0
while (_i < 10) do #()は省略可
  puts(_i) #0,1,2,3,4,5,6,7,8,9
  _i += 1
end
puts(_i) #10 ←while文の外でも変数はまだ有効
```

### while 文と break 文
* 1〜100までを出力
```
#test.rb
_count = 0
while true #ループ判別式をtrueにすると無限ループに!
  _count += 1
  if _count > 100 then
    break #ループを終了
  end
  puts(_count) #1,2,....,99,100
end
```

### while 文と next 文
* 3の倍数を出力
```
#test.rb
_i = 1
while (_i <= 20)
  if ((_i % 3) != 0) #3で割って余りが0でない（＝3の倍数ではない）場合
    _i += 1
    next #while文の残処理をスキップしてwhile文の次の反復を開始する
  end
  puts(_i) #3,6,9,12,15,18 ←3の倍数
  _i += 1
end
```

実行環境：Ubuntu 16.04.2 LTS、Python 3.5.2  
作成者：Takashi Nishimura  
作成日：2016年07月07日  
更新日：2017年04月07日


<a name="配列（Array）"></a>
# <b>配列（Array）</b>

### 作成
* 構文
```
変数名 = [] #空の配列を作成
変数名 = [nil] * 個数 #指定数の空（nil）の要素を持つ配列作成
変数名 = [要素①, 要素②,...] #要素のデータ型は何でも良い
```

* 例文
```
#test.rb
_array = []
p _array #[]
_array2 = ["A", "I", "U"]
p _array2 #["A", "I", "U"]
_array3 = [nil] * 10
p _array3 #[nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
```

### 要素の数
```
#test.rb
_array = ["00", "01", "02", "03"]
puts(_array.size) #4
```

### 追加（最後）
```
#test.rb
_array = ["ICHIRO", "JIRO"]
_array.push("TARO")
p _array #["ICHIRO", "JIRO", "TARO"]
```

### 追加（指定位置）
```
#test.rb
_array = ["ICHIRO", "JIRO"]
_array.insert(0,"TARO") #先頭（0）〜最後（配列.size）まで指定可能
p _array #["TARO", "ICHIRO", "JIRO"]
```

### 更新（任意の値）
```
#test.rb
_array = ["TAKASHI", "ICHIRO", "JIRO"]
_array[0] = "TARO" #0番目を変更する場合
p _array #["TARO", "ICHIRO", "JIRO"]
```

### 更新（nil 値）
```
#test.rb
_array = ["TAKASHI", "ICHIRO", "JIRO"]
_array[0] = nil
p _array #[nil, "ICHIRO", "JIRO"]
```

### 削除（指定の要素）
* 構文
```
配列.delete(削除する要素) #指定の要素を全て削除
```

* 例文
```
#test.rb
_array = ["ICHIRO", "JIRO", "TARO"]
_array.delete("TARO")
p _array #["ICHIRO", "JIRO"]
```

### 削除（指定の位置）
* 構文
```
配列.delete_at(インデックス番号) #指定のインデックス番号の要素を削除
```

* 例文
```
#test.rb
_array = ["ICHIRO", "JIRO", "TARO"]
_array.delete_at(0) #先頭を削除する場合
#_array.delete_at(_array.size-1) #最後を削除する場合
p _array #["JIRO", "TARO"]
```

### 削除（○〜○番目）
* 構文
```
配列.slice!(開始インデックス..終了インデックス) #削除した値を返します
```

* 例文
```
#test.rb
_array = ["00", "01", "02", "03", "04", "05"]
_array.slice!(1..4) #1〜4番目を削除する場合
p _array #["00", "05"]
```

### 抽出（○〜○番目）
* 構文
```
配列[開始インデックス..終了インデックス] #終了番目は含まない
```

* 例文
```
#test.rb
_array = ["00", "01", "02", "03", "04", "05"]
p _array[1..5] #["01", "02", "03", "04", "05"]
```

### 検索(ヒットしたか否か）
* 構文
```
配列.include?(検索する値)
```

* 例文
```
#test.rb
_array = ["A", "B", "C", "D", "E", "F", "D"]
puts(_array.include?("D")) #true（見つからなければfalse）
```

### 検索(ヒット位置）
* 構文
```
配列.index(検索する値)
```

* 例文
```
#test.rb
_array = ["A", "B", "C", "D", "E", "F", "D"]
puts(_array.index("D")) #3（見つからない場合、（nil））
```

### 検索（ヒット数）
* 構文
```
配列.count(検索する値)
```

* 例文
```
#test.rb
_array = ["A", "C", "B", "C", "A", "C"]
puts(_array.count("C")) #3（見つからなければ0）
```

### 並べ替え（反転）
* 構文
```
配列.reverse!()
```

* 例文
```
#test.rb
_array = ["00", "01", "02", "03", "04", "05"]
_array.reverse!()
p _array #["05", "04", "03", "02", "01", "00"]
```

### 並べ替え（ソート）
* 構文
```
配列.sort!()
```

* 例文
```
#test.rb
_array = ["C", "02", "A", "01", "03", "B"]
_array.sort!()
p _array #["01", "02", "03", "A", "B", "C"]
```

### 結合
* 構文
```
配列①.concat(追加する配列②) #配列①の末尾に配列②を結合
```

* 例文
```
#test.rb
_array1 = ["A","B","C"]
_array2 = ["D","E","F"]
_array1.concat(_array2)
p _array1 #["A", "B", "C", "D", "E", "F"]
```

### 複製
* 構文
```
変数 = コピー元の配列.dup
```

* 例文
```
#test.rb
_origin = ["A", "B", "C"]
_copy = _origin.dup
_copy[0] = "あ" #値を変更してみる
p _origin #["A", "B", "C"]（参照ではないことが判る）
p _copy #["あ", "B", "C"]
```

### 文字列→配列
* 構文
```
変数 = 文字列.split("区切り文字")
```

* 例文
```
#test.rb
_string = "A,B,C,D,E,F"
_array = _string.split(",") #カンマ区切り「,」で分割して配列化
p _array #["A", "B", "C", "D", "E", "F"]
```

### 全要素を取り出す
* for 文を使う場合
```
#test.rb
_array = ["A", "B", "C", "D", "E", "F"]
for tmp in _array do
    puts(tmp) #"A"→"B"→"C"→"D"→"E"→"F"
end
```

* each メソッドを使う場合
```
#test.rb
_array = ["A", "B", "C", "D", "E", "F"]
_array.each do |tmp|
    puts(tmp) #"A"→"B"→"C"→"D"→"E"→"F"
end
```

実行環境：Ubuntu 16.04.2 LTS、Python 3.5.2  
作成者：Takashi Nishimura  
作成日：2016年07月07日  
更新日：2017年04月07日


<a name="連想配列（Hash）"></a>
# <b>連想配列（Hash）</b>

### 作成
1. 変数名 = {"キー①"=>値①, "キー②"=>値②}  
    ※ {キー①:値①, キー②:値②} と同じ
1. 変数名 = Hash.new ←空のハッシュの作成

### 追加･更新
```
#test.rb
_hash = {"A"=>"あ", "I"=>"い"}
_hash["U"] = "う"
puts(_hash) #{"A"=>"あ", "I"=>"い", "U"=>"う"}（存在する場合更新）
```

### 取得
```
#test.rb
_hash = {"A"=>"あ", "I"=>"い", "U"=>"う"}
puts(_hash["A"]) #"あ"
```

### 削除
```
#test.rb
_hash = {"A"=>"あ", "I"=>"い", "U"=>"う"}
_hash.delete("U")
puts(_hash) #{"A"=>"あ", "I"=>"い"}
```

### キーの検索
```
#test.rb
_hash = {"A"=>"あ", "I"=>"い", "U"=>"う"}
puts(_hash.key?("A") ) #任意のキーがあるか否か（true／false）
```

### 要素数
```
#test.rb
puts({"A"=>"あ", "I"=>"い", "U"=>"う"}.size) #3
```

実行環境：Ubuntu 16.04.2 LTS、Python 3.5.2  
作成者：Takashi Nishimura  
作成日：2016年07月07日  
更新日：2017年04月07日


<a name="self"></a>
# <b>self</b> ≒ this

```
#test.rb
class MyClass
    puts(self) #MyClass（インスタンスではなくクラスそのもの）

    def initialize()
        puts(self) ##<MyClass:0x00000000f090d8>（MyClassのインスタンス★）
        self.myMethod() #myMethod（selfは省略可）
    end

    def myMethod()
        puts("myMethod")
    end
end

_myClass = MyClass.new()
puts(_myClass) ##<MyClass:0x00000000f090d8>（MyClassのインスタンス★）

def MyMethod()
    puts(self) 
end

MyMethod() #main
```

実行環境：Ubuntu 16.04.2 LTS、Python 3.5.2  
作成者：Takashi Nishimura  
作成日：2016年07月07日  
更新日：2017年04月07日


<a name="文字列の操作"></a>
# <b>文字列の操作</b>

### Stringクラスのオブジェクト作成
```
変数 = "○○"
変数 = '○○' ←ダブルクォーテーション（""）と同じ
変数 = "○○\n○○" ←\nで改行
```

### 連結
* 構文
```
文字列① + 文字列②
文字列① << 文字列② ←既にある文字列①に文字列②に追加する場合
```

* 例文
```
#test.rb
_string1 = "ABC"
_string2 = "DEF"
_string1 += _string2 #_string1 = _string1 + _string2 と同じ
puts(_string1) #"ABCDEF"
```

### 長さを調べる
```
#test.rb
_string1 = "ABCDE"
puts(_string1.size) #5

_string2 = "あいうえお"
puts(_string2.size) #5（全角文字も１字扱い）
```

### 一部分を取得
* 構文
```
文字列[番号] ←0〜len(文字列)
文字列[開始,文字数])
```

* 例文
```
#test.rb
_string = "0123456789"
puts(_string[4]) #"4"（4文字目を取得）
puts(_string[4,3]) #"456"（4文字目〜3文字取得）
puts(_string[4,9e9]) #"456789" ←9e9にすればほぼ間違いなく全部を取得可能
```

### 一部分を削除
* 構文
```
文字列.delete!('削除する文字列')
文字列.delete('削除する文字列') #元は変化なし
```

* 例文
```
#test.rb
_string = "ABCDCBA"
_string.delete!('A')
puts(_string) #BCDCB
```

### 置換
* 構文
```
文字列.gsub!("置換前の文字列", "置換後の文字列")
```

* 例文
```
#test.rb
_string = "2017年4月8日"
puts(_string.gsub!("2017年","平成29年")) #平成29年4月8日
```

### 検索
* 構文
```
文字列.include?(" 検索したい文字列") ←true または false
文字列.index("検索したい文字列") ←見つからない場合はnil
文字列.rindex("検索したい文字") ←見つからない場合はnil
```

* 例文
```
#test.rb
_string = "ABCDEFG-ABCDEFG"
if _string.include?("CD") then #見つかった場合
    puts(_string.index("CD")) #2（左から検索）
    puts(_string.rindex("CD")) #10（右から検索）
end
```

### 文字列→配列（Array）
* 構文
```
文字列.split("区切り文字") または 文字列.split(/区切り文字/)
```

* 例文
```
#test.rb
_string = "A,B,C,D,E,F" #「,」区切りの文字列
_array = _string.split(",") #「,」区切りで分割して配列（Array）化
p _array #["A", "B", "C", "D", "E", "F"]
```

実行環境：Ubuntu 16.04.2 LTS、Python 3.5.2  
作成者：Takashi Nishimura  
作成日：2016年07月08日  
更新日：2017年04月08日


<a name="正規表現"></a>
# <b>正規表現</b>

### 概要
* 正規表現は、URL、パスワード、メールアドレス等、特定の文字パターンを抽出するのに利用
* 正規表現の基本文法は、特定のプログラミング言語に依存しない
* Python には以下のサンプル以外にも多くの正規表現の機能が用意されている

### 検索＆置換
* 構文
```
正規表現 = Regexp.new(文字列)

#正規表現 = /文字列/ #Regex.new(文字列) と同じ
# /^文字列$/ のように「^」（行頭マッチ）「$」（行末マッチ）といったメタ文字の他、様々
# なパターン、例えば /[A-D]\d+/ など使うことでより細かな制御が可能

if 正規表現 =~ 文字列 then #thenは省略可能 ←ここで「検索」
    #マッチした場合の処理
    文字列.gsub!("置換前の文字列", "置換後の文字列") ←ここで「置換」
else
    マッチしなかった場合の処理
end
```

### 例文
```
#test.rb
_string = "吉田松蔭,高杉晋作,久坂玄瑞,吉田稔麿,伊藤博文";

_regex = Regexp.new("吉田")
#_regex = /吉田/ #Regex.new("吉田") と同じ

if _regex =~ _string then #thenは省略可能（ここで「検索」）
    #マッチした場合（"吉田"が含まれている）の処理
    _string.gsub!("吉田", "よしだ") #ここで「置換」
else
    puts("吉田は含まれていません")
end

p _string #"よしだ松蔭,高杉晋作,久坂玄瑞,よしだ稔麿,伊藤博文"
```

実行環境：Ubuntu 16.04 LTS、Python 2.3 
作成者：Takashi Nishimura  
作成日：2016年07月08日  
更新日：2017年04月10日


<a name="抽象クラス"></a>
# <b>抽象クラス</b>

### 概要
* Pythonには interface や abstract キーワードは存在しません
* Pythonでは、継承と例外を使って擬似的な抽象クラスを実現します

### 構文
```
class Abstract○○(object) #抽象クラスの定義（実際には単なるスーパークラス）
    def 抽象メソッド() #抽象メソッドの宣言（実際は単なるメソッド）
        raise "メッセージ" #派生クラスで実装しないとRuntimeErrorを発生させる

class 派生クラス名 < Abstract○○ #（擬似）抽象クラスを継承
    def 抽象メソッド():
        #実際の処理
    ……
```

### 例文
```
#test.rb
class AbstractClass #（擬似）抽象クラス
    def common() #共通のメソッド
        puts("共通のメソッド")
    end
    def abstractMethod() #（擬似）抽象メソッド
        #↓派生クラスでオーバーライドして実装しないとRuntimeError
        raise "派生クラスで実装して下さい" #例外
    end
end

class SubClass < AbstractClass #（擬似）抽象クラスを継承
    #↓（擬似）抽象クラスの（擬似）抽象メソッドをオーバーライドして実際の処理を記述
    def abstractMethod()
        puts("派生クラスでオーバーライドした抽象メソッド")
    end
end

_subClass = SubClass.new()
_subClass.common() #"共通のメソッド"
_subClass.abstractMethod() #"派生クラスでオーバーライドした抽象メソッド"
```

実行環境：Ubuntu 16.04.2 LTS、Python 3.5.2  
作成者：Takashi Nishimura  
作成日：2016年07月08日  
更新日：2017年04月10日


<a name="superキーワード"></a>
# <b>super キーワード</b>

### 書式
```
class スーパークラス
  def initialize(引数) #コンストラクタ
  end
  def メソッド(引数)
  end
end

class サブクラス < スーパークラス
  def initialize(引数) #コンストラクタ
    super(引数) #スーパークラスのコンストラクタを呼び出す
  end
  def メソッド(arg)
    super(引数) #スーパークラスの同名のメソッドを呼び出す
  end
end
```

### 例文
```
#test.rb
class SuperClass #スーパークラス
  def initialize(arg) #コンストラクタ
    puts("スーパークラスのコンストラクタ:" + arg)
  end
  def hoge(arg)
    puts("スーパークラスのhoge():" + arg)
  end
end

class SubClass < SuperClass
  def initialize() #コンストラクタ
    super("派生クラスからの呼び出し") #スーパークラスのコンストラクタを呼び出す
  end
  def hoge(arg)
    super(arg) #スーパークラスの同名メソッドを呼び出す（PythonやJSと異なる）
  end
end

_subClass = SubClass.new() #サブクラスのインスタンス生成
_subClass.hoge("派生クラスからの呼び出し")
```

実行環境：Ubuntu 16.04.2 LTS、Python 3.5.2  
作成者：Takashi Nishimura  
作成日：2016年07月08日  
更新日：2017年04月10日


<a name="オーバーライド"></a>
# <b>オーバーライド</b>

### 概要
* スーパークラスで定義したメソッドを派生クラスで再定義することをオーバーライドと呼ぶ
* スーパークラスの「同名のメソッド」を呼び出したい場合は、super([引数]) を使う

### 書式
```
class スーパークラス名
    def メソッド名(引数): #派生クラスでオーバーライドされる
        ……

class 派生クラス名 < 基本クラス名
    def メソッド名(引数) #スーパークラスのメソッドをオーバーライドする
        super(引数) #スーパークラスの「同名のメソッド」を呼び出す場合
        ……
```

### 例文
```
#test.rb
#スーパークラス
class SuperClass 
  #↓派生クラスでオーバーライドされる
  def myMethod()
    puts("スーパークラスのmyMethod()")
  end
end

#派生クラス
class SubClass < SuperClass 
  #↓スーパークラスのメソッドをオーバーライドする
  def myMethod()
    super() #スーパークラスの「同名のメソッド」を呼び出す場合
    puts("派生クラスのmyMethod()")
  end
end

_subClass = SubClass.new()
_subClass.myMethod()
```

実行環境：Ubuntu 16.04.2 LTS、Python 3.5.2  
作成者：Takashi Nishimura  
作成日：2016年07月08日  
更新日：2017年04月10日


<a name="カスタムイベント"></a>
# <b>カスタムイベント</b>

```
#test.rb
class Robot
  @energy #プライベート変数の宣言
  @dieHandler #プライベート変数の宣言（リスナーメソッドを格納）

  def initialize()
    @energy = 80 #プライベート変数の初期化
  end

  def addEventListener(_event, _method)
    if (_event == "die") then
      @dieHandler = _method #変数に匿名関数を格納（ポイント!!）
    else
      puts("Error: Robot.addEventListener()")
    end
  end

  def fight()
    @energy -= 20
    if (@energy <= 0) then
      @dieHandler.call(self) #匿名関数の呼び出し（selfはRobotクラスのインスタンス）
    end
  end
end

_die_Robot = ->(arg) { #匿名関数（ポイント!!）
  puts(arg) ##<Robot:0x0000000271c030> #Robotクラスのインスタンス
  puts("GAME OVER")
}

_robot = Robot.new()
_robot.addEventListener("die", _die_Robot)
_robot.fight()
_robot.fight()
_robot.fight()
_robot.fight() #"GAME OVER"
```

実行環境：Ubuntu 16.04.2 LTS、Python 3.5.2  
作成者：Takashi Nishimura  
作成日：2016年07月08日  
更新日：2017年04月10日


<a name="数学関数（Math）"></a>
# <b>数学関数（Math）</b>

### Math.sin() : サイン（正弦）
```
#test.rb
puts(Math.sin(0)) #0.0 ←0°
puts(Math.sin(Math::PI/2)) #1.0 ←90°
puts(Math.sin(Math::PI)) #1.2246467991473532e-16（≒0） ←180°
puts(Math.sin(Math::PI*3/2)) #-1.0 ←270°
puts(Math.sin(Math::PI*2)) #-2.4492935982947064e-16（≒0） ←360°
```

### Math.cos() : コサイン（余弦）
```
#test.rb
puts(Math.cos(0)) #1.0 ←0°
puts(Math.cos(Math::PI/2)) #6.123233995736766e-17（≒0） ←90°
puts(Math.cos(Math::PI)) #-1.0 ←180°
puts(Math.cos(Math::PI*3/2)) #-1.8369701987210297e-16（≒0） ←270°
puts(Math.cos(Math::PI*2)) #1.0 ←360°
```

### Math.atan2() : アークタンジェント2
* 2つの値のアークタンジェント（逆タンジェント）
* X、Y 座標の角度をラジアン単位で返す
* Π ラジアン（3.141592…）は180°
```
#test.rb
#横と縦の長さがわかっている直角三角形の角度Ａを調べるメソッド
def getKakudo(w, h)
  _radian = Math.atan2(h, w) #単位：ラジアン
  return 180 * _radian/Math::PI #単位：度
end

#三角形の各辺が 1:2:√3 の場合、2:√3 の間の角度は 30° であることを検証
_kakudo = getKakudo(Math.sqrt(3), 1) #Math.sqrt(3)は√3のこと
puts(_kakudo) #30.000000000000004（度）
```

### Math::PI : 円周率
```
#test.rb
puts(Math::PI) #3.141592653589793（math.piラジアン=180°）
```

### Math.sqrt() : 平方根（√○）
```
#test.rb
puts(Math.sqrt(2)) #1.4142135623730951（一夜一夜にひとみごろ）
puts(Math.sqrt(3)) #1.7320508075688772（人並みに奢れや）
puts(Math.sqrt(4)) #2.0
puts(Math.sqrt(5)) #2.23606797749979（富士山麓オウム鳴く）
```

以下は Math モジュールを使わないもの
***

### floor : 切り捨て
```
#test.rb
puts(1.001.floor) #1
puts(1.999.floor) #1
```

### round() : 四捨五入
```
#test.rb
puts(1.499.round(0)) #1 ←引数で小数点以下の何位を丸めるか指定可能
puts(1.499.round(1)) #1.5
puts(1.500.round(0)) #2
```

### ceil : 切り上げ
```
#test.rb
puts(1.001.ceil) #2
puts(1.999.ceil) #2
```

### abs : 絶対値
```
#test.rb
puts(100.abs) #100
puts(-100.abs) #100
```

### ** : 累乗（○の□乗）
```
#test.rb
puts(2**0) #1（2の0乗）
puts(2**8) #256（2の8乗）
```

### max : 比較（最大値）
```
#test.rb
puts([5.01, -10, 8, 2.9].max) #8 ←配列（Array）要素の比較
```

### min : 比較（最小値）
```
#test.rb
puts([5.01, -10, 8, 2.9].min) #-10 ←配列（Array）要素の比較
```

実行環境：Ubuntu 16.04.2 LTS、Python 3.5.2  
作成者：Takashi Nishimura  
作成日：2016年07月09日  
更新日：2017年04月10日


<a name="乱数"></a>
# <b>乱数</b>

### 0〜1.0未満
```
#test.rb
puts(Random.rand()) #0.5222174965949302（0〜0.999…）←()は省略可
```

### 最小値〜最大値（Fixnum型）
```
#test.rb
puts(Random.rand(5..9)) #5 ←5〜9のいずれか（整数）
```

### 0〜最大値（Fixnum型）
```
#test.rb
_i0 = _i1 = _i2 = _i3 = _i4 = _i5 = _i6 = _i7 = _i8 = _i9 = 0

for i in 1..10000000 do #1000万回繰り返す
  _tmp = Random.rand(10) #0〜9の乱数（0〜指定値未満の整数）
  case _tmp
  when 0 then _i0 += 1
  when 1 then _i1 += 1
  when 2 then _i2 += 1
  when 3 then _i3 += 1
  when 4 then _i4 += 1
  when 5 then _i5 += 1
  when 6 then _i6 += 1
  when 7 then _i7 += 1
  when 8 then _i8 += 1
  when 9 then _i9 += 1
  end
end

puts(_i0,_i1,_i2,_i3,_i4,_i5,_i6,_i7,_i8,_i9)
#999984→1000715→998330→1000162→1000477→1002110→999414→998289→999532→1000987
```

実行環境：Ubuntu 16.04.2 LTS、Python 3.5.2  
作成者：Takashi Nishimura  
作成日：2016年07月09日  
更新日：2017年04月10日


<a name="日時情報"></a>
# <b>日時情報</b>

### 例文
* Time クラスのほかに Date クラスもあり
```
#test.rb
_now = Time.now
puts(_now) #2017-04-10 11:09:36 +0900
puts(_now.year) #年（2016等）
puts(_now.month) #月（1〜12）
puts(_now.day) #日（1〜31）
puts(_now.wday) #0（日曜）〜6（土曜）
puts(_now.hour) #時間（0〜23）
puts(_now.min) #分（0〜59）
puts(_now.sec) #秒（0〜59）
puts(_now.usec) #マイクロ秒（0〜999999）

# "hh:mm:ss"で現在の時間を表示する
if (_now.hour < 10) then #「時」がひと桁の場合…
  _h = "0" + _now.hour.to_s
else 
  _h = _now.hour.to_s
end

if (_now.min < 10) then #「分」がひと桁の場合…
  _m = "0" + _now.min.to_s
else 
  _m = _now.min.to_s
end

if (_now.sec < 10) then #「秒」がひと桁の場合…
  _s = "0" + _now.sec.to_s
else
  _s = _now.sec.to_s
end

puts(_h + ":" + _m + ":" + _s) #"11:09:36"など
```

実行環境：Ubuntu 16.04.2 LTS、Python 3.5.2  
作成者：Takashi Nishimura  
作成日：2016年07月09日  
更新日：2017年04月10日


<a name="タイマー"></a>
# <b>タイマー</b>

* バックエンドで動作する Python の場合、サーバ負荷がかかるタイマー処理は多用すべきではない

### 一度だけ実行する場合（参考）
```
#test.rb
def onceExecute(_sec, _method)
  sleep(_sec) #指定秒待つ（他の処理は出来ません）
  _method.call() #匿名関数を呼出す
end

_someMethod = ->() { #匿名関数
  puts("指定秒後に１度だけ実行したい処理")
}

onceExecute(3, _someMethod) #3秒後に1度だけ実行させる
```

### 繰り返し実行する場合（参考）
```
#test.rb
class Loop
  @isLoop #プライベート変数宣言（省略可）
  def initialize() #コンストラクタ
    @isLoop = false
  end
  def start()
    @isLoop = true
    run()
  end
  def run()
    if (@isLoop) then
      puts("繰返す処理を記述")
      sleep(0.5) #0.5秒間隔で実行したい場合（他の処理は出来ません）
      run()
    end
  end
end

_loop = Loop.new()
_loop.start()
```

実行環境：Ubuntu 16.04.2 LTS、Python 3.5.2  
作成者：Takashi Nishimura  
作成日：2016年07月09日  
更新日：2017年04月10日


<a name="処理速度計測"></a>
# <b>処理速度計測</b>

### Time.nowを使う方法
```
#test.rb
_start = Time.now #計測開始

for i in 1 .. 100000000 do #1億回繰返す場合
  #速度計測したい処理（今回は何もしない）
end

_result = Time.now - _start #計測終了
puts(_result) #4.089608507（秒）
```

### Benchmarkライブラリーを使う方法
```
#test.rb
require "benchmark"

Benchmark.bm 10 do |r| #決め打ちで良い
  r.report "実験①" do
    #速度計測したい処理①
    for i in 1 .. 100000000 do #1億回繰返す場合
      2*2*2*2 #速度計測の比較をしたい処理①
    end
  end
  r.report "実験②" do
    # (計測したい処理その2)
    for i in 1 .. 100000000 do #1億回繰返す場合
      2**4 #速度計測の比較をしたい処理①
    end
  end
end

#                 user     system      total        real
#実験①         10.570000   0.000000  10.570000 ( 10.571983)
#実験②          8.030000   0.000000   8.030000 (  8.027341)
```

実行環境：Ubuntu 16.04.2 LTS、Python 3.5.2  
作成者：Takashi Nishimura  
作成日：2016年07月09日  
更新日：2017年04月10日


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
○ = File.open("□□.txt")
○.read() #テキストファイルの内容が返り値となります
```
または
```
File.read("□□.txt")
```

### 例文
```
#test.rb
_file = File.open("sample.txt") #同じ階層に○.txtがある場合
_result = _file.read()
puts(_result)
#あいうえお
#かきくけこ
#さしすせそ
```

### 外部テキストの書き込み（参考）
```
#test.py
_file = File.open("sample.txt")
_tmp = _file.read()
_tmp += "たちつてと\nなにぬねの" #読み込んだテキストに追加（「\n」で改行）
File.write("sample.txt", _tmp)

#ファイルの読み込み（確認）
_reslt = File.read("sample.txt")
puts(_reslt)
#あいうえお
#かきくけこ
#さしすせそ
#さしすせそ
#たちつてと
```

実行環境：Ubuntu 16.04.2 LTS、Python 3.5.2  
作成者：Takashi Nishimura  
作成日：2016年07月09日  
更新日：2017年04月10日