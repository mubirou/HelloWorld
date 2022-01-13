<a name="TOP"></a>

# <b>GDScript 基礎文法</b>
[[Godot Study Notes](https://github.com/mubirou/Godot)]

### これは書きかけの項目です

### <b>INDEX</b>

* [コメント](#コメント)
* [データ型](#データ型)
* [データ型の操作](#データ型の操作)
* [クラス](#クラス)
* [基本クラスと派生クラス](#基本クラスと派生クラス)
* [名前空間](#名前空間)
* [継承と委譲](#継承と委譲)
* [変数とスコープ](#変数とスコープ)
* [アクセサ（getter / setter）](#アクセサ)
* [演算子](#演算子)
* [定数](#定数)
* <!--[関数](#関数)-->
* <!--[匿名関数](#匿名関数)-->
* <!--[静的変数・静的関数](#静的変数・静的関数)-->
* [if 文](#if文)
* [三項演算子](#三項演算子)
* [match 文](#match文) ≒ switch 文
* [for 文](#for文)
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
* [カスタムイベント](#カスタムイベント)
* [数学関数](#数学関数)
* <!--[乱数](#乱数)-->
* [日時情報](#日時情報)
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
[[TOP](#TOP)]


<a name="データ型"></a>
# <b>データ型</b>

### 主なデータ型の種類
1. [論理型](#TYPE_BOOL)（bool / TYPE_BOOL）
1. [整数型](#TYPE_INT)（int / TYPE_INT）
1. [浮動小数点数](#TYPE_REAL)（float / TYPE_REAL）
1. [文字列](#TYPE_STRING)（String / TYPE_STRING）
1. [配列](#TYPE_ARRAY)（Array / TYPE_ARRAY）
1. [辞書型](#TYPE_DICTIONARY)（Dictionary / TYPE_DICTIONARY）
1. [クラス](#TYPE_OBJECT)（Object / TYPE_OBJECT）
1. [null](#TYPE_NIL)（null）

<a name="typeof()の戻り値一覧"></a>

* [typeof()](#typeof()関数) の戻り値一覧  

|TYPE_*|番号|TYPE_*|番号|TYPE_*|番号|
|:--|:--:|:--|:--:|:--|:--:|
|[TYPE_NIL](#TYPE_NIL)|**0**|[TYPE_BOOL](#TYPE_BOOL)|**1**|[TYPE_INT](#TYPE_INT)|**2**|
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
[[データ型TOP](#データ型)]


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
[[データ型TOP](#データ型)]


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
[[データ型TOP](#データ型)]


<a name="TYPE_OBJECT"></a>

### ➆クラス（Object）
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

class MyClass: #前方宣言でなくてもよい
	pass

func _ready():
	var _myClass = MyClass.new()
	print(_myClass) #-> TYPE_OBJECT
	print(typeof(_myClass)) #-> 17(TYPE_OBJECT)
	print(_myClass is Object) #-> True
```


<a name="TYPE_NIL"></a>

### ➇null…何もないことを示す定数
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

func _ready():
	var _something
	print(_something) #Null
	print(typeof(_something)) #-> 0（TYPE_NIL）
	print(_something == null) #-> True
```
[[データ型TOP](#データ型)]

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年01月03日  
[[TOP](#TOP)]


<a name="データ型の操作"></a>
# <b>データ型の操作</b>

<a name="typeof()関数"></a>

### typeof() 関数
* データ型を返す（[戻り値一覧](#typeof()の戻り値一覧)）

```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

func _ready():
	print(typeof(true)) #-> 1（TYPE_BOOL）
	print(typeof(100)) #-> 2（TYPE_INT）
	print(typeof(0.1)) #-> 3（TYPE_REAL）
	print(typeof("1")) #-> 4（TYPE_STRING）
	print(typeof(["A", "B", "C"])) #-> 19（TYPE_ARRAY）
	print(typeof({"ICHIRO":54, "HANAKO":"15"})) #-> 18（TYPE_ARRAY）
	print(typeof(MyClass.new())) #-> 17(TYPE_OBJECT)

class MyClass:
	pass
```

### is 演算子
* データ型を判断する
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

func _ready():
	print(true is bool) #-> True
	print(100 is int) #-> True
	print(0.1 is float) #-> True
	print("1" is String) #-> True
	print(["A", "B", "C"] is Array) #-> True
	print({"ICHIRO":54, "HANAKO":"15"} is Dictionary) #-> True

	var _myClass = MyClass.new()
	print(_myClass is Object) #-> True
	print(_myClass is MyClass) #-> True

class MyClass:
	pass
```

### as 演算子
* キャスト成功時に変換後の値が、失敗すると Null が返される
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

func _ready():
	print(1 as bool) #-> True
	print("123" as int) #-> 123（int型）
	print("X12Y34" as int) #-> 1234（int型）
	
	var _hogeClass = HogeClass.new()
	print(_hogeClass as FugaClass) #-> Null

class HogeClass:
	pass

class FugaClass:
	pass
```         

### データ型のキャスト（数値 ⇔ bool型）
```GDScript
# 数値（int）型 → bool型
var _tmp = bool(1)
print(_tmp) #-> Trye
print(typeof(_tmp)) #-> 1（bool型）

# bool型 → 数値（int）型
_tmp = int(true)
print(_tmp) #-> 1
print(typeof(_tmp)) #-> 2（int型）
```

### データ型のキャスト（数値 ⇔ String型）
```GDScript
# String型 → 数値（int）型
var _tmp = int("001")
print(_tmp) #-> 1
print(typeof(_tmp)) #-> 2（int型）

# 数値（int）型 → String型
_tmp = str(100)
print(_tmp) #-> "100"
print(typeof(_tmp)) #-> 4（String型）
```

参考：[GODOT DOCS](https://docs.godotengine.org/ja/stable/tutorials/scripting/gdscript/gdscript_format_string.html#placeholder-types)（String型の〇進数変換）  
実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年01月13日  
[[TOP](#TOP)]


<a name="クラス"></a>
# <b>クラス</b>

### 最小構成
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

class MyClass: #前方宣言でなくてもよい
	pass #何もしない

func _ready():
	var _myClass = MyClass.new() #インスタンスの生成
```

* passについて  
Pythonのコードブロックは {} ではなくインデントを揃えることで見なします。しかしインデントを強制する文法の弱点として、インデントしたブロックは必ず１行以上の記述が必要になります。そこで「何もしない」という処理を意味するpass文が用意されています。

### 例文
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

#==============
# 長方形クラス
#==============
class Rectangle:
	# 公開プロパティ
	var width setget setWidth, getWidth
	var height setget setHeight, getHeight

	# 疑似プライベート変数（値の設定も可）
	var __width
	var __height

	# コンストラクタ
	func _init(w,h):
		__width = w
		__height = h
	
	# 公開プロパティ用（setter/getter）
	func setWidth(value):
		__width = value

	func getWidth():
		return __width

	func setHeight(value):
		__height = value
	
	func getHeight():
		return __height
	
	# 公開関数（面積計算用）
	func getArea():
		return __width * __height
	
#======
# 実行
#======
func _ready():
	# ➀インスタンスの生成
	var _rectangle = Rectangle.new(640,480)

	# ➁プロパティの取得（その１）
	print(_rectangle.width) #-> 640
	print(_rectangle.height) #-> 480

	# ➂プロパティの更新
	_rectangle.width = 1920
	_rectangle.height = 1080

	# ➃プロパティの取得（その２）
	print(_rectangle.width) #-> 1920
	print(_rectangle.height) #-> 1080

	# ➄関数の実行
	print(_rectangle.getArea()) #-> 2073600
```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年01月04日  
[[TOP](#TOP)]


<a name="基本クラスと派生クラス"></a>
# <b>基本クラスと派生クラス</b>

```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

#=================
# 基本（基底）クラス
#=================
class SuperClass:
	# 疑似プライベート変数
	var __pSuper = "基本クラスのプロパティ"

	# getter/setter
	var pSuper setget set_pSuper, get_pSuper

	func set_pSuper(value):
		__pSuper = value
	
	func get_pSuper():
		return __pSuper
	
	# 関数
	func mSuper():
		return "基本クラスのメソッド"

#============
# 派生クラスＡ
#============
class SubClassA extends SuperClass: #多重継承は不可
	# 疑似プライベート変数
	var __pSubA = "派生クラスＡのプロパティ"

	# getter/setter
	var pSubA setget set_pSubA, get_pSubA

	func set_pSubA(value):
		__pSubA = value
	
	func get_pSubA():
		return __pSubA

	# 関数
	func mSubA():
		return "派生クラスＡのメソッド"
	
#============
# 派生クラスＢ
#============
class SubClassB extends SuperClass: #多重継承は不可
	# 疑似プライベート変数
	var __pSubB = "派生クラスＢのプロパティ"

	# getter/setter
	var pSubB setget set_pSubB, get_pSubB

	func set_pSubB(value):
		__pSubB = value
	
	func get_pSubB():
		return __pSubB

	# 関数
	func mSubB():
		return "派生クラスＢのメソッド"

#=====
# 実行
#=====
func _ready():
	var _subClassA = SubClassA.new()
	print(_subClassA) #-> [Reference:1240]
	print(_subClassA is SubClassA) #-> True（SubClassA型である）
	print(_subClassA is SuperClass) #-> True（SuperClass型でもある）
	print(_subClassA.pSuper) #-> 基本クラスのプロパティ
	print(_subClassA.pSubA) #-> 派生クラスＡのプロパティ
	print(_subClassA.mSuper()) #-> 基本クラスのメソッド
	print(_subClassA.mSubA()) #-> 派生クラスＡのメソッド

	var _subClassB = SubClassB.new()
	print(_subClassB) #-> [Reference:1241]
	print(_subClassB is SubClassB) #-> True（SubClassB型である）
	print(_subClassB is SuperClass) #-> True（SuperClass型でもある）
	print(_subClassB.pSuper) #-> 基本クラスのプロパティ
	print(_subClassB.pSubB) #-> 派生クラスＢのプロパティ
	print(_subClassB.mSuper()) #-> 基本クラスのメソッド
	print(_subClassB.mSubB()) #-> 派生クラスＢのメソッド
```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年01月05日  
[[TOP](#TOP)]


<a name="名前空間"></a>
# <b>名前空間</b>

### 概要
他のディレクトリにある .gd ファイルモジュールを読み込んで活用します。.gd ファイルには再利用可能なコード（クラス）群を記述します。

### 例文
* test.gd と同階層に japan ディレクトリがあり、その中に tokyo.gd が存在する場合

```GDScript
# japan/tokyo.gd
class Shinjuku:
	func _init():
		print("japan/tokyo/Shinjuku")

class Setagaya:
	func _init():
		print("japan/tokyo/Setagaya")
```

```GDScript
#test.gd（外部.gdファイルを利用する側）
extends Spatial #2Dの場合はNode2D

var _tokyo = preload("japan/tokyo.gd") #外部.gdファイルの読み込み

func _ready():
	_tokyo.Shinjuku.new() #-> "japan/tokyo/Shinjuku"
	_tokyo.Setagaya.new() #-> "japan/tokyo/Setagaya"
```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年01月13日  
[[TOP](#TOP)]


<a name="継承と委譲"></a>
# <b>継承と委譲</b>

### 概要
*  GoF デザインパターンの [Adapter パターン](http://bit.ly/2naab8x)等で利用される
* 継承の場合は **extends クラス名** を使い、委譲の場合は **クラス名.new()** を使ってオブジェクトを生成し、他のクラスの機能を利用する

### 継承版
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

class ClassA:
	func myMethod():
		print("ClassA.myMethod()")
	
class ClassB extends ClassA: # ClassAを継承（ポイント）
	pass


func _ready():
	var _classB = ClassB.new()
	_classB.myMethod() #-> "ClassA.myMethod()"
```

### 委譲版
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

class ClassA:
	func myMethod():
		print("ClassA.myMethod()")
	
class ClassB: # この中身のみ継承と異なる
	var _classA = ClassA.new() # ClassAのインスタンスを生成（ポイント）

	func myMethod():
		_classA.myMethod()

func _ready():
	var _classB = ClassB.new()
	_classB.myMethod() #-> "ClassA.myMethod()"
```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年01月06日  
[[TOP](#TOP)]


<a name="変数とスコープ"></a>
# <b>変数とスコープ</b>

### 変数の種類
1. [グローバル変数](#グローバル変数) 
1. [疑似プライベート変数](#疑似プライベート変数) 
1. [ローカル変数](#ローカル変数) 

<a name="グローバル変数"></a>

### グローバル変数
1. [Godot Engine]-[ファイルシステム]上で右クリック→[新規スクリプト]を選択
1. [パス]は"res://**Global.gd**"としコードを次の通りに記述  
    ```GDScript
    #Global.gd
    extends Node

    var _someGlobal = 100
    ```
1. [プロジェクト]-[プロジェクト設定]-[自動読み込み]を選択
1. [パス]を"res://**Global.gd**"に設定し[追加]を選択
1. [グローバル変数]は[✓有効]のままにする
1. 動作確認  
    ```GDScript
    #test.gd
    extends Spatial #2Dの場合はNode2D

    #-----------------------------
    # 関数内でのグローバル変数の扱い
    #-----------------------------
    func _ready():
        print(Global._someGlobal) #-> 100（参照）
        Global._someGlobal = 200 # 変更
        print(Global._someGlobal) #-> 200（変更されている）

        var _myClass = MyClass.new()

    #-------------------------------
    # クラス内でのグローバル変数の扱い
    #-------------------------------
    class MyClass:
        func _init():
            print(Global._someGlobal) #-> 200（参照）
            Global._someGlobal = 300 # 変更
            print(Global._someGlobal) #-> 300（変更されている）
    ```

<a name="疑似プライベート変数"></a>

### 疑似プライベート変数
* 実際は単なるパブリック変数
* 変数へのアクセスは[アクセサ](#アクセサ)を利用する（推奨）
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

class MyClass:
	# 擬似プライベート変数の定義
	var __propA = "いろは" # 変数名は__xxxにする（任意）
	
	# setter/getter
	var propA setget setPropA, getPropA

	func setPropA(value):
		__propA = value

	func getPropA():
		return __propA

func _ready():
	var _myClass = MyClass.new()

	# 良い例（setter/getterを使ってアクセスする）
	print(_myClass.propA) #-> "いろは"（参照）
	_myClass.propA = "ABC" # 変更
	print(_myClass.propA) #-> "ABC"（変更されている）

	# 悪い例（外部から直接アクセスするべきではない）
	_myClass.__propA = "あいう" # 外部から直接変更
	print(_myClass.__propA) #-> "あいう"（変更できてしまう）
```
[[変数とスコープTOP](#変数とスコープ)]

<a name="ローカル変数"></a>

### ローカル変数
1. 関数内で宣言する場合（for 文、if 文等でも同様）  
    ※宣言した場所より大きい＝深いインデント範囲内で有効
    ```GDScript
    #test.gd
    extends Spatial #2Dの場合はNode2D

    func myFunction1():
        var _local = "ローカル変数" # ローカル変数の宣言
        print(_local) #-> "ローカル変数"

    func myfunction2():
        #print(_local) # Error（アクセス不可）
        pass

    func _ready():
        myFunction1()
        myfunction2()
        #print(_local) # Error（アクセス不可）
    ```

1. クラスの関数内で宣言する場合
    ```GDScript
    #test.gd
    extends Spatial #2Dの場合はNode2D

    class MyClass:
        func myMethod1():
            var _local = "ローカル変数" # メソッド外で定義するとパブリック変数扱い
            print(_local)

    func _ready():
        var _myClass = MyClass.new()
        _myClass.myMethod1()
        #print(_myClass._local) # アクセス不可
    ```

1. for文内のループ変数
    ```GDScript
    #test.gd
    extends Spatial #2Dの場合はNode2D

    class MyClass:
        func _init():
            for _i in range(6): #ローカル変数（_i）0～5
                print(_i) #-> 0,1,2,...,5
            #print(_i) # Error（for文外ではアクセス不可）

    func _ready():
        var _myClass = MyClass.new()
    ```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年01月08日  
更新日：2022年01月09日 ローカル変数を修正  
[[TOP](#TOP)]


<a name="アクセサ"></a>
# <b>アクセサ（getter / setter）</b>

### 読み書き可能なプロパティ
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

class Member:
	# 疑似プライベート変数
	var __age = 19
	
	# setter/getter
	var age setget setAge, getAge

	func setAge(value):
		__age = value

	func getAge():
		return __age
	
#======
# 実行
#======
func _ready():
	var _member = Member.new()
	print(_member.age) #-> 19
	_member.age = 20
	print(_member.age) #-> 20
```

### 読み取り専用のプロパティ
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

class Member:
	# 疑似プライベート変数
	var __age = 19
	
	# getter（set〇〇を記述しない）
	var age setget , getAge

	func getAge():
		return __age
	
#======
# 実行
#======
func _ready():
	var _member = Member.new()
	print(_member.age) #-> 19
	_member.age = 20 # 変更不可（エラーは出ない）
	print(_member.age) #-> 19
```

### 書き込み専用のプロパティ
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

class Member:
	# 疑似プライベート変数
	var __age = 19
	
	# setter（get〇〇を記述しない）
	var age setget setAge

	func setAge(value):
		__age = value
	
#======
# 実行
#======
func _ready():
	var _member = Member.new()
	_member.age = 20
	print(_member.age) #-> null
	print(_member.__age) #-> 20（内部では変更されている）
```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年01月06日  
[[TOP](#TOP)]  


<a name="演算子"></a>
# <b>演算子</b>

### 算術演算子
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

func _ready():
	print(3 + 2) #-> 5 (可算) 
	print(5 - 8) #-> -3 (減算)
	print(3 * 4) #-> 12 (乗算)
	print(1 + 2 * 3 - 4 / 2) #-> 5 (複雑な計算)
	print(63 % 60) #-> 3 (余剰)

	# 除算（注意が必要です）
	print(8 / 3) #-> 2(除算) ←整数同士の場合、余りは切り捨てられる
	print(8 / 3.0) #-> 2.666667（小数点第6位までの値＝float型）

	#インクリメント（++）・デクリメント（--）は存在しないので以下で代用
	var _hoge = 0
	_hoge += 1
	print(_hoge) #-> 1
```

### その他の演算子
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

func _ready():
	# 論理積
	print(true and true) #-> True
	print(true && true) #-> True

	# 論理和
	print(true or false) #-> True
	print(true || false) #-> True

	# 否定
	print(not true) #-> False
	print(! true) #-> False
 
	print(2 < 3) #-> True（比較/未満）
	print(2 <= 2) #-> True（比較/以下）
	print(1 == 1.0) #-> True（等号）
	print(1 != 1.0) #-> False（不等号）

	print(3 & 1) #-> 1（ビット積）
	print(3 | 1) #-> 3（ビット和）
	print(3 ^ 1) #-> 2（排他的ビット和）
	print(2 << 7) #-> 256（ビット･シフト）
	print(~3) #-> -4（ビット反転）
```
参考：[GODOT DOCS](https://docs.godotengine.org/ja/stable/tutorials/scripting/gdscript/gdscript_basics.html#operators)  
実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年01月09日  
[[TOP](#TOP)]


<a name="定数"></a>
# <b>定数</b>

### 通常の定数
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

const MY_NAME = "mubirou"

func _ready():
	print(MY_NAME) #-> "mubirou"
	#MY_NAME = "ICHIRO" # Error（変更不可）
```

### クラス定数（インスタンスからも呼び出せる）
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

class MyClass:
	const MY_NAME = "mubirou" # 定数の定義

	func _init():
		print(MY_NAME) #-> "mubioru"（クラス内でのアクセス方法）

func _ready():
	print(MyClass.MY_NAME) #-> "mubirou"（クラス外からのアクセス方法）
	#MyClass.MY_NAME = "ICHIRO" # Error（変更不可）

	# 実験
	var _myClass = MyClass.new()
	print(_myClass.MY_NAME) #-> "mubirou"（インスタンスからのアクセスも可能！）
	#_myClass.MY_NAME = "ICHIRO" # Error（変更は不可）
```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年01月09日  
[[TOP](#TOP)]


<a name="関数"></a>
# <b>関数</b>

### 基本構文
```
func 関数名(引数➀, 引数➁, ...):
    ......（何もしない場合 pass を記述）
    [return 戻り値]
```

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

### 基本構文
* Trueと評価される可能性が高い順に並べるとif文を早く抜け出せる可能性が高い
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

func _ready():
	var _age = 54
	
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
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

func _ready():
	if null : # '' "" も同じFalseとして判断
		print("A")
	else:
		print("B") #こちらが実行される

	if "あ" : #中身が何かあればTrueとして判断
		print("A") #こちらが実行される
	else:
		print("B")
```

### 論理積（and または &&）
1. 論理演算子（and または &&）を使う方法
    ```GDScript
    if (条件式➀ and 条件➁) : #()は省略可
        処理A ←条件式➀かつ条件式➁の両方がTrueの場合に実行
    else:
        処理B
    ```

1. ifのネストを使う方法
    ```GDScript
    if (条件式➀) : #()は省略可
        if (条件➁) :
            処理A ←条件式➀かつ条件式➁の両方がTrueの場合に実行
        else:
            処理B
    else:
        処理B
    ```

### 論理和（or または ||）
1. 論理演算子（or または ||）を使う方法
    ```GDScript
    if (条件式➀ or 条件➁) : #()は省略可
        処理A ←条件式➀または条件式➁の両方がTrueの場合に実行
    else:
        処理B
    ```

1. ifのネストを使う方法
    ```GDScript
    if (条件式➀) : #()は省略可
        処理A ←条件式➀がTrueの場合に実行
    elif (条件➁) :
        処理A ←条件式②がTrueの場合に実行
    else:
        処理B
    ```

### 排他的論理和（XOR）
* GDScriptでは ^ 演算子は使えない（要調査）
* 「&& は and」「|| は or」「! は NOT」でも可  
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

func _ready():
    var _a = false
    var _b = true

    if ((_a || _b) && !(_a || _b)) : #()は省略可
        print("どちらか一方だけTrueです")
    else:
        print("両方共にTrueかFalseです")
```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年01月08日  
[[TOP](#TOP)]


<a name="三項演算子"></a>
# <b>三項演算子</b>

### 構文
* GDScript の三項演算子は [Pythonと同様](https://github.com/mubirou/HelloWorld/blob/master/languages/Python/Python_reference.md#%E4%B8%89%E9%A0%85%E6%BC%94%E7%AE%97%E5%AD%90) if 文を使った独特のものです
```GDScript
変数 = (True時の返り値) if (比較式) else (False時の返り値)
```

### 例文
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

func _ready():
	var _age = 54
	var _result = "現役" if (_age < 60) else "退職"
	print(_result)
```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年01月09日  
[[TOP](#TOP)]


<a name="match文"></a>
# <b>match ≒ switch 文</b>

### 判別式が bool 値ではない場合
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

func _ready():
	var _name = "TARO"
	
	match _name:
		"TARO":
			print("父") # これが出力される
		"HANAKO":
			print("母")
		"ICHIRO":
			print("長男")
		"JIRO":
			print("次男")
		_:
			print("家族以外")
```

### 注意➀：判別式に bool 型が使えない
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

func _ready():
	var _age = 54
	
	match true:
		_age < 20: # Error（比較演算子を使った条件式は不可）
			print("未成年")
		_:
			print("成人")
```

### 注意➁：フォロースルーの動作
* 以下の場合 "A" "C" が出力される
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

func _ready():
	var _value = "A"
	
	match _value:
		"A":
			print("A")
			continue
		"B":
			print("B")
			continue
		_:
			print("C")
```

参考：[GODOT DOCS](https://docs.godotengine.org/ja/stable/tutorials/scripting/gdscript/gdscript_basics.html#match)  
実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2021年01月09日  
[[TOP](#TOP)]


<a name="for文"></a>
# <b>for 文</b>

### 基本構文
```GDScript
for 変数 in range(開始,終了):
    繰り返す処理
```

### 基本例文
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

func _ready():
	for i in range(0,10): #第1引数を省略すると0扱い
		print(i) #-> 0,1,2,3,4,5,6,7,8,9

	# print(i) # Error（for文の外ではiは無効）
```

### for 文のネスト
* ループ制御変数には i, j, k が使われる
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

func _ready():
	for i in range(1,6):
		for j in range(1,6):
			print("x" + str(i) + "y" + str(j)) #x1y1, x1y2, ...., x5y4, x5y5
```

### continue 文
* ループカウンタを○つずつアップする
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

func _ready():
	for i in range(0,50):
		if i % 5: # 5つずつアップする場合…
			continue # 以降処理せず、for文のブロックの先頭に戻って再度繰返す
		
		print(i) #->0, 5, 10, 15, 20, 25, 30, 35, 40, 45
```

### 無限ループと break 文
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

func _ready():
	var _count = 0
	for i in range(0, 9e9): # ほぼ無限ループ（厳密な無限にはwhile文を使用）
		_count += 1
		if (_count > 100):
			break #100 を超えたらループを抜け出す
		print(_count) #1, 2, ...., 99, 100
```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年01月09日  
[[TOP](#TOP)]


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

```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

#==============
# カスタムクラス 
#==============
class MyGame:
	signal gameover #イベント名の定義
	
	#疑似プライベート変数
	var __energy = 100

	func _init(): #コンストラクタ
		pass

	func fight():
		__energy -= 20
		if (__energy <= 0):
			emit_signal("gameover") #イベント発生

#=====
# 実行
#=====
func _ready():
	var _robot = MyGame.new()
	_robot.connect("gameover", self, "gameoverHandler") #≒addEventListener
	_robot.fight()
	_robot.fight()
	_robot.fight()
	_robot.fight()
	_robot.fight() #-> GAMEOVER

func gameoverHandler(): #前方定義でなくてもよい
	print("GAMEOVER")
```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年01月05日  
[[TOP](#TOP)]


<a name="数学関数"></a>
# <b>数学関数</b>

### abs() : 絶対値
```GDScript
print(abs(100)) #-> 100
print(abs(-100)) #-> 100
```

### atan2() : アークタンジェント2
* 2つの値のアークタンジェント（逆タンジェント）
* X、Y 座標の角度をラジアン単位で返す
* Π ラジアン（3.141592…）は180°
```GDScript
var _disX = sqrt(3) # √3のこと
var _disY = 1
print(atan2(_disY, _disX)) #-> 0.523599（ラジアン）
print(180 * atan2(_disY, _disX) / PI) #-> 30（度）
```

### ceil() : 切り上げ
```GDScript
print(ceil(1.001)) #-> 2
print(ceil(1.999)) #-> 2
```

### cos() : コサイン（余弦）
```GDScript
print(cos(0)) #-> 1（0°）
print(cos(PI / 2)) #-> 0（90°）
print(cos(PI)) #-> -1（180°）
print(cos(PI * 3 / 2)) #-> -0（270°）←要注意
print(cos(PI * 2)) #-> 1（360°）
```

### floor() : 切り捨て
```GDScript
print(floor(1.001)) #-> 1
print(floor(1.999)) #-> 1
```

### max() : 比較（最大値）
```GDScript
print(max(5.01, -10)) #-> 5.01（2つの数値の比較）
```

### min() : 比較（最小値）
```GDScript
print(min(5.01, -10)) #-> -10（2つの数値の比較）
```

### PI : 円周率
```GDScript
print(PI) #-> 3.141593
print(PI == 3.141593) #-> False
```

### pow() : 累乗（べき乗）
```GDScript
print(pow(2, 0)) #-> 1（2の0乗）
print(pow(2, 8)) #-> 256（2の8乗）
```

### round() : 四捨五入
```GDScript
print(round(1.499)) #-> 1
print(round(1.500)) #-> 2
```

### sin() : サイン（正弦）
```GDScript
print(sin(0)) #-> 0（0°）
print(sin(PI / 2)) #-> 1（90°）
print(sin(PI)) #-> 0（180°）
print(sin(PI * 3 / 2)) #-> -1（270°）
print(sin(PI * 2)) #-> -0（360°）
print(sin(PI * 2) == 0) #-> False（要注意）
```

### sqrt() : 平方根（√XXX）
```GDScript
print(sqrt(2)) #-> 1.414214（一夜一夜にひとみごろ）
print(sqrt(3)) #-> 1.732051（人並みに奢れや）
print(sqrt(4)) #-> 2
print(sqrt(5)) #-> 2.236068（富士山麓オウム鳴く）
print(sqrt(6)) #-> 2.44949（二夜シクシク）
```

参考：[GODOT DOCS](https://docs.godotengine.org/en/3.0/classes/class_@gdscript.html)  
実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年01月10日  
[[TOP](#TOP)]


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
```GDScript
var XXX = OS.get_datetime()
XXX.year # 年（2016等）
XXX.month # 月（1〜12）
XXX.day # 日（1〜31）
XXX.weekday() # 0（日曜）〜6（土曜）←Pythonと異なる
XXX.hour # 時間（0〜23）
XXX.minute # 分（0〜59）
XXX.second # 秒（0〜59）
XXX.dst # サマータイム（True or False）
# マイクロ秒を取得する場合 OS.get_system_time_msecs() を利用
```

### 例文
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

func _ready():
	var _now = OS.get_datetime()
	print(_now) #-> {day:9, dst:False, hour:18, minute:21, month:1, second:45, weekday:0, year:2022}
	print(_now.year) # 年（2017等）
	print(_now.month) # 月（1〜12）
	print(_now.day) # 日（1〜31）
	print(_now.weekday) #0（日曜）〜6（土曜）←Pythonと異なる
	print(_now.hour) # 時間（0〜23）
	print(_now.minute) # 分（0〜59）
	print(_now.second) # 秒（0〜59）
	
	#"hh:mm:ss"で現在の時間を表示する方法
	var _h
	var _m
	var _s
	if (_now.hour < 10) : _h = "0" + str(_now.hour)
	else: _h = str(_now.hour)
	if (_now.minute < 10) : _m = "0" + str(_now.minute)
	else: _m = str(_now.minute)
	if (_now.second < 10) : _s = "0" + str(_now.second)
	else: _s = str(_now.second)
	print(_h + ":" + _m + ":" + _s) #-> "18:21:45"
```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年01月09日  
[[TOP](#TOP)]


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
