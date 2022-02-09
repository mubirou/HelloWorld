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
* [関数](#関数)
* [静的変数・静的関数](#静的変数・静的関数)
* [if 文](#if文)
* [三項演算子](#三項演算子)
* [match 文](#match文) ≒ switch 文
* [for 文](#for文)
* [while 文](#while文)
* [配列](#配列)
* [連想配列（辞書）](#連想配列（辞書）)
* [self](#self) ≒ this
* [文字列の操作](#文字列の操作)
* [正規表現](#正規表現)
* [抽象クラス](#抽象クラス)
* [.](#.) ≒ super
* [オーバーライド](#オーバーライド)
* [カスタムイベント](#カスタムイベント)
* [数学関数](#数学関数)
* [乱数](#乱数)
* [日時情報](#日時情報)
* [タイマー](#タイマー)
* [処理速度計測](#処理速度計測)
* [外部テキストの読み込み](#外部テキストの読み込み)（これは書きかけの項目です）
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

### クラス定数（[静的変数](#静的変数・静的関数)）
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
	print(_myClass.MY_NAME) #-> "mubirou"（インスタンスからのアクセスも可能）
	#_myClass.MY_NAME = "ICHIRO" # Error（変更は不可）
```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年01月09日  
[[TOP](#TOP)]


<a name="関数"></a>
# <b>関数</b>

### 基本構文
* 関数は必ず class 内に記述する必要があります
```GDScript
func 関数名(引数➀, 引数➁, ...):
    ......（何もしない場合 pass を記述）
    [return 戻り値]
```
* 例文（class 内に定義しない場合）
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

func tashizan(_start, _end):
	var _result = 0 #ローカル変数
	for i in range(_start, _end + 1):
		_result += i
	return _result

# print(tashizan(1, 10)) # Error（ここでは実行できない）

func _ready():
	print(tashizan(1, 10)) #-> 55
```

### パブリック関数
* 例：○〜○までの値を足した合計を調べる
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

class MyClass:
	func tashizan(_start, _end):
		var _result = 0 #ローカル変数
		for i in range(_start, _end + 1):
			_result += i
		return _result

func _ready():
	var _myClass = MyClass.new()
	print(_myClass.tashizan(1,10)) #-> 55
	print(_myClass.tashizan(1,100)) #-> 5050
```

### 疑似プライベート関数
* 実際は単なるパブリック関数
* アクセス修飾子が存在しないため、Python 風 に __メソッド名() と命名して外からアクセスしないようにする
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

class MyClass:
	func _init():
		print(__tashizan(1, 10)) #-> 55

	# 疑似プライベート関数
	func __tashizan(_start, _end):
		var _result = 0 #ローカル変数
		for i in range(_start, _end + 1):
			_result += i
		return _result

func _ready():
	var _myClass = MyClass.new()
	print(_myClass.__tashizan(1,10)) #-> 55（外からアクセスできてしまうが…）
```

### コンストラクタ
* 例文（class 内の定義）参考：[GODOT DOCS](https://docs.godotengine.org/ja/stable/tutorials/scripting/gdscript/gdscript_basics.html#class-constructor)  
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

class MyClass:
	func _init(arg): # コンストラクタ（引数は省略可）
		print("MyClass._init()")
		print(arg)

func _ready():
	var _myClass = MyClass.new("mubirou")
```

* 例文（class 内に定義しない場合）
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

func _init():
	print("_int()") # 先に実行される

func _ready(): # 通常はこちらを使う
	print("_ready()") # _init()の次に実行される
```

<a name="静的関数"></a>

### 静的関数
参考：[GODOT DOCS](https://docs.godotengine.org/ja/stable/tutorials/scripting/gdscript/gdscript_basics.html#static-functions)  
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

class MyMath:
	static func Pow(arg1, arg2): #個人的慣例で大文字で始める
		if arg2 == 0: return 1 # 0乗対策
		var _result = arg1
		for i in range(1, arg2):
			_result *= arg1
		return _result

func _ready():
	print(MyMath.Pow(2,3)) #-> 8

	var _myMath = MyMath.new()
	print(_myMath.Pow(2,4)) #-> 16（インスタンスからも実行可能）
```

### デフォルト値付き引数
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

class MyClass:
	var __point = 0 # 疑似プライベート変数

	func addPoint(arg := 1): #「=」でも動作
		__point += arg
		print(__point)	

func _ready():
	var _myClass = MyClass.new()
	_myClass.addPoint() #-> 1（引数を指定しない場合は初期値1で処理）
	_myClass.addPoint(10) #-> 11（引数を指定した場合）
```

参考：[GODOT DOCS](https://docs.godotengine.org/ja/stable/tutorials/scripting/gdscript/gdscript_basics.html#functions)  
実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年01月15日  
[[TOP](#TOP)]


<a name="静的変数・静的関数"></a>
# <b>静的変数・静的関数</b>

* 静的変数 ⇒ [定数](#定数)
* 静的関数 ⇒ [関数（静的関数）](#静的関数)

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年01月15日
[[TOP](#TOP)]


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

参考：[GODOT DOCS](https://docs.godotengine.org/ja/stable/tutorials/scripting/gdscript/gdscript_basics.html#for)  
実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年01月09日  
[[TOP](#TOP)]



<a name="while文"></a>
# <b>while 文</b>
* 他の多くの言語にある do...while 文はない

```GDscript
#test.gd
extends Spatial #2Dの場合はNode2D

func _ready():
	var _i = 0

	while (_i < 10): # ()は省略可
		print(_i) #-> 0,1,2,3,4,5,6,7,8,9
		_i += 1

	print(_i) #-> 10（while文の外でも変数はまだ有効）
```

### while 文と break 文
```GDscript
#test.gd
extends Spatial #2Dの場合はNode2D

func _ready():
	var _count = 0

	while (true) : #-> ループ判別式をtrueにすると無限ループに!
		_count += 1
		if (_count > 100) :
			break #-> ループを終了

		print(_count) #-> 1,2,....,99,100（1〜100までを出力）

	print("while文終了") # while文の外
```

### while 文と continue 文（3の倍数を出力）
```GDscript
#test.gd
extends Spatial #2Dの場合はNode2D

func _ready():
	var _i = 1

	while (_i <= 20) :

		if ((_i % 3) != 0) : # 3で割って余りが0ではない（＝3の倍数ではない）場合
			_i += 1
			continue #while文の残処理をスキップしてwhile文の次の反復を開始する

		print(_i) #-> 3,6,9,12,15,18（3の倍数を出力）
		_i += 1
```

参考：[GODOT DOCS](https://docs.godotengine.org/en/stable/getting_started/scripting/gdscript/gdscript_basics.html#while)  
実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年01月24日  
[[TOP](#TOP)]


<a name="配列"></a>
# <b>配列</b>

1. [作成](#配列作成)
1. [要素の数](#配列要素の数)
1. [抽出](#配列抽出)
1. [追加（最後）](#配列追加（最後）)
1. [追加（指定位置）](#配列追加（指定位置）)
1. [更新（任意の位置）](#配列更新（任意の位置）)
1. [削除（指定の要素）](#配列削除（指定の要素）)
1. [検索（ヒットしたか否か）](#配列検索（ヒットしたか否か）)
1. [検索（ヒット数）](#配列検索（ヒット数）)
1. [並べ替え（反転）](#配列並べ替え（反転）)
1. [並べ替え（ソート）](#配列並べ替え（ソート）)
1. [シャッフル](#配列シャッフル)
1. [結合](#配列結合)
1. [複製](#配列複製)
1. [文字列→配列](#配列文字列→配列)
1. [全要素を取り出す](#配列全要素を取り出す)

<a name="配列作成"></a>

### 作成
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

func _ready():
	var _array1 = [] # 空の配列を作成
	print(_array1) #-> []

	var _array2 = ["A", "B", "C"]
	print(_array2) #-> [A, B, C]

	var _array3 = [["A", "あ"], ["I", "い"]] # 配列のネスト
	print(_array3) #-> [[A, あ], [I, い]]

	var _array4 = range(0, 10)
	print(_array4) #-> [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
```
[[配列TOP](#配列)]

<a name="配列要素の数"></a>

### 要素の数
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

func _ready():
	var _array = [0,1,2,3,4,5,6,7,8,9]
	print(_array.size()) #-> 10
```
[[配列TOP](#配列)]

<a name="配列抽出"></a>

### 抽出
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

func _ready():
	var _array = [0,1,2,3,4,5,6,7,8,9]

	# 先頭の抽出
	print(_array.front()) #-> 0
	print(_array[0]) #-> 0

	# 最後尾の抽出
	print(_array.back()) #-> 9
	print(_array[-1]) #-> 9
	print(_array[_array.size() - 1])

	# 指定位置の抽出
	print(_array[5]) #-> 5（インデックス5番目）
```
[[配列TOP](#配列)]

<a name="配列追加（最後）"></a>

### 追加（最後）
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

func _ready():
	var _array = []
	_array.append("mubirou") # String型の追加
	_array.append(100) # int型の追加
	print(_array) #-> [mubirou, 100]（混在可能）
```
[[配列TOP](#配列)]

<a name="配列追加（指定位置）"></a>

### 追加（指定位置）
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

func _ready():
	var _array = ["A", "B"]
	_array.insert(0, "C") # インデックス0（先頭）に追加
	print(_array) #-> [C, A, B]
```
[[配列TOP](#配列)]

<a name="配列更新（任意の位置）"></a>

### 更新（任意の位置）
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

func _ready():
	var _array = ["A", "B", "C"]

	_array[0] = null # インデックス0（先頭）を更新
	print(_array) #-> [Null, B, C]
	
	_array[-1] = "D" # 後ろから1番目を更新
	print(_array) #-> [Null, B, D]
```
[[配列TOP](#配列)]

<a name="配列削除（指定の要素）"></a>

### 削除（指定の要素）
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

func _ready():
	var _array = ["A", "B", "C"]
	_array.remove("A") # 最初に見つかった指定の要素を削除
	print(_array) #-> [B, C]
```
[[配列TOP](#配列)]

<a name="配列検索（ヒットしたか否か）"></a>

### 検索（ヒットしたか否か）
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

func _ready():
	var _array = ["A", "B", "C", "D", "E"]
	print("E" in _array) #-> True
	print("F" in _array) #-> False
```
[[配列TOP](#配列)]

<a name="配列検索（ヒット数）"></a>

### 検索（ヒット数）
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

func _ready():
	var _array = ["A", "C", "B", "C", "A", "C"]
	print(_array.count("C")) #-> 3
	print(_array.count("D")) #-> 0
```
[[配列TOP](#配列)]

<a name="配列並べ替え（反転）"></a>

### 並べ替え（反転）
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

func _ready():
	var _array = [0,1,2,3,4,5,6,7,8,9]
	_array.invert()
	print(_array) #-> [9, 8, 7, 6, 5, 4, 3, 2, 1, 0]
```
[[配列TOP](#配列)]

<a name="配列並べ替え（ソート）"></a>

### 並べ替え（ソート）
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

func _ready():
	var _array = [3,6,2,8,4,1,9,0,5,7]
	_array.sort()
	print(_array) #-> [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
```
[[配列TOP](#配列)]

<a name="配列シャッフル"></a>

### シャッフル
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

func _ready():
	var _array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
	_array.shuffle()
	print(_array) #-> [5, 7, 8, 4, 6, 1, 2, 3, 0, 9]
```
（注意）内部では [randi()](https://docs.godotengine.org/ja/stable/classes/class_randomnumbergenerator.html#class-randomnumbergenerator-method-randi) 関数を利用しているため同じ値が返る（回避したい場合は[乱数](#乱数)を利用）  
[[配列TOP](#配列)]

<a name="配列結合"></a>

### 結合
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

func _ready():
	var _array1 = ["A","B","C"]
	var _array2 = ["D","E","F"]
	_array1 += _array2
	print(_array1) #-> [A, B, C, D, E, F]
```
[[配列TOP](#配列)]

<a name="配列複製"></a>

### 複製
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

func _ready():
	var _origin = ["A","B"]
	var _copy = _origin.duplicate()
	_copy[0] = "C" #値を変更してみる
	print(_origin) #-> [A, B]（参照ではないことが判る）
	print(_copy) #-> [C, B]
```
[[配列TOP](#配列)]

<a name="配列文字列→配列"></a>

### 文字列→配列
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

func _ready():
	var _string = "A,B,C"
	var _array = _string.rsplit (",") # カンマ区切りで分割してリスト化
	print(_array) #-> [A, B, C]
```
[[配列TOP](#配列)]

<a name="配列全要素を取り出す"></a>

### 全要素を取り出す
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

func _ready():
	for _tmp in ["A","B","C","D","E"]:
		print(_tmp) #-> A → B → C → D → E
```
※インデックス番号を取得したい場合はカウンタ変数を使用  

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年01月25日  
更新日：2022年02月09日 シャッフルを追加  
[[TOP](#TOP)]


<a name="連想配列（辞書）"></a>
# <b>連想配列（辞書）</b>

### 作成
```GDScript
var 変数名 = {"キー➀": 値➀, "キー➁": 値➁}
```

### 追加･更新
* 構文
```GDScript
辞書["キー"] = 値
```
* 例文
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

func _ready():
	var _dict = {"A": "あ", "I": "い"}
	_dict["U"] = "う" # 追加（存在する場合は更新）
	print(_dict) #-> {A:あ, I:い, U:う}
```

### 取得
* 構文
```GDScript
辞書["キー"]
辞書.get("キー", [キーが無い場合の初期値])
```
* 例文
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

func _ready():
	var _dict = {"A": "あ", "I": "い", "U": "う"}
	print(_dict["A"]) #-> あ
	print(_dict.get("A", null)) #-> あ（第2引数は省略可）
```

### 削除
* 構文
```GDScript
辞書.erase("キー") # 任意のキーのペア
辞書.clear() # 全てのキーのペア
```
* 例文
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

func _ready(): 
	var _dict = {"A": "あ", "I": "い", "U": "う"}
	_dict.erase("A")
	print(_dict) #-> {I:い, U:う}
```

### キーの検索
* 構文
```GDScript
"キー" in 辞書
```
* 例文
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

func _ready():
	var _dict = {"A": "あ", "I": "い", "U": "う"}
	print("A" in _dict) #-> True（任意のキーが無いとFalse）
```

### 要素数
* 構文
```GDScript
辞書.size()
len(辞書)
```
* 例文
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

func _ready():
	var _dict = {"A": "あ", "I": "い", "U": "う"}
	print(_dict.size()) #-> 3
	print(len(_dict)) #-> 3
```

参考：[GODOT DOCS](https://docs.godotengine.org/ja/stable/classes/class_dictionary.html#dictionary)  
実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年01月27日  
[[TOP](#TOP)]


<a name="self"></a>
# <b>self</b> ≒ this

self は現在のクラスインスタンスを参照するが Python のそれほど重要ではない
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

class MyClass:
	var _p = null # __p（擬似プライベート変数）にすれば問題ないが…
	
	func _init(_p): # 引数がインスタンス名を同じ場合…
		self._p = _p # この場合は self が必須（重要）
		print(self) #-> [Reference:1239]（※同じ）
		self.myMethod() # selfは省略可能

	func myMethod():
		print(_p)


func _ready():
	var _myClass = MyClass.new(500)
	print(_myClass) #-> [Reference:1239]（※同じ）
	_myClass.myMethod() #-> 500
```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年01月28日  
[[TOP](#TOP)]


<a name="文字列の操作"></a>
# <b>文字列の操作</b>

### String オブジェクトの作成
* 構文
```GDScript
➀変数 = "○○"
➁変数 = '○○' # ダブルクォーテーション（""）と同じ
➂変数 = "１行目\n２行目" # 改行を含む場合
```

* 例文
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

func _ready():
	var _string2 = "あいうえお"
	var _string1 = 'あいうえお' # "〇〇"と同じ
	var _string3 = "１行目\n２行目"
```

### 長さを調べる
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

func _ready():
	var _string1 = "ABCDE"
	print(_string1.length()) #-> 5
	
	var _string2 = "あいうえお"
	print(_string2.length()) #-> 5（全角文字も１字扱い）
```

### 文字列の連結
* 加算演算子を使う場合
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

func _ready():
	var _address1 = "東京都"
	var _address2 = "新宿区"
	print(_address1 + _address2) #-> "東京都新宿区"
```
* フォーマット文字列を使う場合
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

func _ready():
	var _address = "東京都%s"
	print(_address % "新宿区") #-> "東京都新宿区"
```
参考：[GODOT DOCS](https://docs.godotengine.org/ja/stable/tutorials/scripting/gdscript/gdscript_format_string.html#gdscript-format-strings)（フォーマット文字列）  

### 一部分を取得
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

func _ready():
	var _string = "0123456789"
	print(_string[4]) #-> "4"
	print(_string.substr(4)) #-> "456789"
	print(_string.substr(4, 3)) #-> "456"
```

### 一部分を削除
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

func _ready():
	var _string = "ABCDCBA"
	print(_string.lstrip("A")) #-> "BCDCBA"（左端から1つ削除）
	print(_string.rstrip("A")) #-> "ABCDCB"（右端から1つ削除）
	print(_string) #-> "ABCDCBA"（元は変更なし）
```

### 置換
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

func _ready():
	var _string = "2022年2月5日"
	print(_string.replace("2022年", "令和4年")) #-> "令和4年2月5日"
```

### 検索
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

func _ready():
	var _string = "ABCDEFG-ABCDEFG"
	if ("CD" in _string) : # 見つかった（True）場合…
		print(_string.find("CD")) #-> 2（左から検索）
		print(_string.rfind("CD")) #-> 10（右から検索）
```

### 文字列→配列
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

func _ready():
	var _string = "A,B,C" #「,」区切りの文字列
	var _list = _string.split(',') #「,」区切りで分割して配列化
	print(_list) #-> [A, B, C]
```

参考：[GODOT DOCS](https://docs.godotengine.org/ja/stable/classes/class_string.html#string)  
実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年02月05日  
[[TOP](#TOP)]


<a name="正規表現"></a>
# <b>正規表現</b>

### 概要
* 正規表現は、URL、パスワード、メールアドレス等、特定の文字パターンを抽出するのに利用
* 正規表現の基本文法は、特定のプログラミング言語に依存しない
* GDScript には以下のサンプル以外にも多くの正規表現の機能が用意されている

### 検索
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

func _ready():
	var _string = "吉田松蔭,高杉晋作,久坂玄瑞,吉田稔麿,伊藤博文"

	var _regex = RegEx.new()
	_regex.compile("吉田")
	var _result = _regex.search(_string)
	if _result == null:
		print("吉田は含まれていません")
	else:
		print("吉田は含まれています")
```

### 置換
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

func _ready():
	var _string = "吉田松蔭,高杉晋作,久坂玄瑞,吉田稔麿,伊藤博文"

	var _regex = RegEx.new()
	_regex.compile("吉田")
	print(_regex.sub(_string, "よしだ"))
	#-> "よしだ松蔭,高杉晋作,久坂玄瑞,よしだ稔麿,伊藤博文"
```

参考：[GODOT DOCS](https://docs.godotengine.org/ja/stable/classes/class_regex.html?highlight=RegEx#regex)  
実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年02月05日  
[[TOP](#TOP)]


<a name="抽象クラス"></a>
# <b>抽象クラス</b>

### 概要
* GDScript には interface や abstract キーワードは存在しない
* 以下のサンプルでは疑似的に継承と例外を使って抽象クラスを実現

```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

# 擬似抽象クラスの定義（実際には単なる基本クラス）
class AbstractClass:
	func common(): # 共通の関数
		print("共通の関数")

	func abstractFunction(): # 擬似抽象関数の宣言（実際は単なる関数）
		assert(false, "ERROR: 派生クラスで実装する必要があります") # 例外処理

# 派生クラス
class SubClass extends AbstractClass: #擬似抽象クラスを継承
	func abstractFunction(): # オーバーライドして実際の処理を記述
		print("派生クラスでオーバーライドした抽象関数") # 実際の処理

# 実行
func _ready():
	var _subClass = SubClass.new()
	_subClass.common() #-> "共通の関数"
	_subClass.abstractFunction() #-> "派生クラスでオーバーライドした抽象関数"
```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年02月06日  
[[TOP](#TOP)]


<a name="."></a>
# <b>.</b> ≒ super

```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

# 基本（基底）クラス
class SuperClass:
	func _init():
		print("SuperClass._init()")

	func hoge(arg): # 派生クラスでオーバーライドされる
		print("SuperClass.hoge(): " + arg)

# 派生クラス
class SubClass extends SuperClass:
	func _init():
		print("SubClass._init()")
		._init() # 基本クラスのコンストラクタを呼び出す
	
	func hoge(arg): # 基本クラスの関数をオーバーライド
		print("SubClass.hoge(): " + arg)
		.hoge("Hello2") # 基本クラスの関数を呼び出す

# 実行
func _ready():
	var _subClass = SubClass.new()
	_subClass.hoge("Hello1") 
```
（要調査）コンストラクタに引数がある場合構文エラー発生  

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年02月04日   
[[TOP](#TOP)]


<a name="オーバーライド"></a>
# <b>オーバーライド</b>

### 概要
* 基本クラスで定義したメソッドを派生クラスで再定義することをオーバーライドと呼ぶ
* GDScript には override キーワードはない
* 派生クラスから基本クラスのメソッドを呼び出したい場合は **.関数名()** を使う

```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

# 基本クラス
class SuperClass:
	func myFunction(): # 派生クラスでオーバーライドされる
		print("基本クラスのmyFunction()")

# 派生クラス
class SubClass extends SuperClass: #擬似抽象クラスを継承
	func myFunction(): # 基本クラスの関数をオーバーライドする
		print("派生クラスのmyFunction()")
		.myFunction() # 基本クラスのmyFunction()を呼出す場合

# 実行
func _ready():
	var _subClass = SubClass.new()
	_subClass.myFunction()
```

実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年02月06日  
[[TOP](#TOP)]


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

### 0.0〜1.0未満
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

func _ready():
	var _random = RandomNumberGenerator.new()
	_random.randomize() # シード値の初期化（任意）
	
	print(_random.randf()) #-> 0.521781（0.0〜1.0以下）
```
（注意）**.randomize()** を実行しないと毎回結果が同じになる（＝同じシード値を使用しているため）

### 最小値〜最大値（float型）
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

func _ready():
	var _random = RandomNumberGenerator.new()
	_random.randomize() # シード値の初期化（任意）
	
	print(_random.randf_range(0, 100)) #-> 35.13369（0.0〜100.0以下）
```
（注意）**.randomize()** を実行しないと毎回結果が同じになる（＝同じシード値を使用しているため）


### 最小値〜最大値（int型）
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

func _ready():
	var _i0=0; var _i1=0; var _i2=0; var _i3=0; var _i4=0
	var _i5=0; var _i6=0; var _i7=0; var _i8=0; var _i9=0

	var _random = RandomNumberGenerator.new()
	_random.randomize() # シード値の初期化（任意）

	for i in range(0, 100000): # 0～100000までの配列
		var _tmp = _random.randi_range(0, 9) # 0～9の整数
		if (_tmp == 0): _i0 += 1
		elif (_tmp == 1): _i1 += 1
		elif (_tmp == 2): _i2 += 1
		elif (_tmp == 3): _i3 += 1
		elif (_tmp == 4): _i4 += 1
		elif (_tmp == 5): _i5 += 1
		elif (_tmp == 6): _i6 += 1
		elif (_tmp == 7): _i7 += 1
		elif (_tmp == 8): _i8 += 1
		elif (_tmp == 9): _i9 += 1
		else: print("Error")
	print([_i0, _i1, _i2, _i3, _i4, _i5, _i6, _i7, _i8, _i9])
	#-> [10079, 10000, 10150, 10161, 10097, 9901, 10091, 9704, 9912, 9905]
```
（注意）**.randomize()** を実行しないと毎回結果が同じになる（＝同じシード値を使用しているため）

参考：[GODOT DOCS](https://docs.godotengine.org/ja/stable/classes/class_randomnumbergenerator.html#randomnumbergenerator)  
実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年02月09日  
[[TOP](#TOP)]


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
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

func timeOut():
	print("一度だけ実行したい処理")

func _ready():
	var _timer = Timer.new()
	_timer.set_wait_time(3.0) # 3.0秒後に実行したい場合（初期値1.0）
	_timer.set_one_shot(true) # ポイント（繰り返す場合は不要）
	_timer.connect("timeout", self, "timeOut")
	self.add_child(_timer) # selfは省略可能
	_timer.start()
```
※繰り返す場合は **.set_one_shot(true)** は不要  

### 繰り返し実行する場合
```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

func loop():
	print("繰返し実行したい処理")

func _ready():
	var _timer = Timer.new()
	_timer.set_wait_time(2.0) # 2.0秒毎に実行したい場合（初期値1.0）
	_timer.connect("timeout", self, "loop")
	self.add_child(_timer) # selfは省略可能
	_timer.start()
	#_timer.stop() #ループを止める場合
```
※一度だけ実行する場合は **.set_one_shot(true)** が必要  

参考：[GODOT DOCS](https://docs.godotengine.org/ja/stable/classes/class_timer.html#timer)  
実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年02月09日  
[[TOP](#TOP)]


<a name="処理速度計測"></a>
# <b>処理速度計測</b>

```GDScript
#test.gd
extends Spatial #2Dの場合はNode2D

func _ready():
	# UNIX時間（1970年1月1日0:00からの経過時間＝ミリ秒）
	var _start = OS.get_system_time_msecs()

	#===========================================
	# ここに計測したい様々な処理を記述
	for i in range(0,100000000): #1億回繰り返す
		#速度計測したい処理
		pass #今回は何もしない
	#===========================================

	var _result = OS.get_system_time_msecs() - _start
	print(str(_result) + " sec.") #-> 4189 sec.
```

参考：[GODOT DOCS](https://docs.godotengine.org/ja/stable/classes/class_os.html#os)  
実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年02月09日  
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

参考：[GODOT DOCS](https://docs.godotengine.org/ja/stable/classes/class_file.html#file)  
実行環境：Windows 10、Godot Engine 3.4.2  
作成者：夢寐郎  
作成日：2022年0X月XX日  
[[TOP](#TOP)]