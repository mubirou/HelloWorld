### <b>この項目は、書きかけの項目です。</b>

# <b>Ruby 基礎文法</b>

### <b>INDEX</b>

* Hello,world! （[Linux](https://github.com/TakashiNishimura/HelloWorld/blob/master/Ruby/Ruby_linux.md) / [macOS](https://github.com/TakashiNishimura/HelloWorld/blob/master/Ruby/Ruby_mac.md) / [Windows](https://github.com/TakashiNishimura/HelloWorld/blob/master/Ruby/Ruby_win.md)）
* [データ型](#データ型)
* [データ型の操作](#データ型の操作)
* [クラス](#クラス)
* [スーパークラスとサブクラス](#スーパークラスとサブクラス)
* [名前空間](#名前空間)
* [継承と委譲](#継承と委譲)
* [変数とスコープ](#変数とスコープ)
* [アクセサ （getter / setter）](#アクセサ)
* [演算子](#演算子)
* [定数](#定数)
* [メソッド](#メソッド)
* [匿名関数（ラムダ式）](#匿名関数（ラムダ式）)
* [クラス定数･変数･メソッド](#クラス定数･変数･メソッド)
* [if 文](#if文)
* [三項演算子](#三項演算子)
* [case 文](#case文) ≒ switch 文
***
* [for 文](#for文)
* [each メソッド](#eachメソッド)
* [while文](#while文)
* [配列（Array）](#配列（Array）)
* [配列（Set）](#配列（Set）)
* [連想配列（Object）](#連想配列（Object）)
* [連想配列（Map）](#連想配列（Map）)
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
1. TrueClass / FalseClass（論理型）
1. Fixnum / Bignum（整数型）
1. Float（浮動小数点数）
1. String（文字列）
1. Array（配列）
1. Hash(ハッシュ≒連想配列）
1. クラス（class）
1. NilClass（オブジェクトが存在しない事を意味）

### 例文
```
#test.rb
# ①TrueClass / FalseClass（論理型）
_bool = true #ローカル変数
puts(_bool) #true
puts(_bool.class.name) #TrueClass（falseの場合FalseClass）

# ②Fixnum / Bignum（整数型）
_num = 4611686018427387903
puts(_num) #4611686018427387903
puts(_num.class.name) #Fixnum

_num = 4611686018427387904 #4,611,686,018,427,387,904以上は「Bignum」型
puts(_num) #4611686018427387904
puts(_num.class.name) #Bignum

# ③Float（浮動小数点数）
_float = 3.141592653589793238462643383279502884197169399375105820974944592307816406286
puts(_float) #3.141592653589793（小数点第15桁まで）
puts(_float.class.name) #Float

# ④文字列（String）
_string = "あいうえお"
puts(_string) #"あいうえお"
puts("あいうえお".class.name) #String

# ⑤配列（Array）
_list = ["A","B","C"]
puts(_list) #"A" → "B" → "C"
puts(_list.class.name) #Array

# ⑥ハッシュ（Hash）……連想配列
_hash = {"name"=>"TARO", "age"=>49} #他の記述方法あり
puts(_hash) #{"name"=>"TARO", "age"=>49}
puts(_hash.class.name) #Hash

# ⑦クラス
class MyClass #前方宣言が必要
    def initialize() #コンストラクタ
    end
end
_myClass = MyClass.new() #()は省略可
puts(_myClass) # #<MyClass:0x00000000deeab8>
puts(_myClass.class.name) #MyClass

# ⑧NilClass
puts(nil) #何も表示されず
puts(nil.class.name) #NilClass（オブジェクトが存在しない事を意味する）
```

実行環境：Ubuntu 16.04 LTS、Ruby 2.3  
作成者：Takashi Nishimura  
作成日：2017年04月06日  


<a name="データ型の操作"></a>
# <b>データ型の操作</b>

### データ型を調べる
* xxx.class.name
```
#test.rb
puts(true.class.name) #TrueClass（falseの場合はFalseClass型）
puts(100.class.name) #Fixnum（4611686018427387904以上の場合はBignum型）
puts(0.1.class.name) #Float
puts("1".class.name) #String
puts(["TAKASHI", "HANAKO", "TARO"].class.name) #Array
puts({"TAKASHI"=>49}.class.name) #Hash

class MyClass #前方宣言が必要
    def initialize() #コンストラクタ
    end
end
_myClass = MyClass.new() #()は省略可
puts(_myClass.class.name) #MyClass
```

### 同値性を調べる
* ==、===、eql?()
```
#test.rb
puts(1 == 1.0) #true
puts(1 === 1.0) #true
puts(1.eql?(1.0)) #false（値が同じでもクラスが異なるとfalse）
```

### インスタンスの判定①
* xxx.instance_of?()
* オブジェクトが指定したクラスのインスタンスか判定
```
#test.rb
class MyClass #前方宣言が必要
    def initialize() #コンストラクタ
    end
end
_myClass = MyClass.new() #()は省略可
puts(_myClass.instance_of?(MyClass)) #true
```

### インスタンスの判定②
* xxx.is_a?()
* オブジェクトが指定したクラスのインスタンスか継承をさかのぼって判定
```
#test.rb
class BaseClass #基本クラス（スーパークラス）
    def initialize()
    end
end
class SubClass < BaseClass #派生クラス（サブクラス）
    def initialize()
    end
end
_subClass = SubClass.new() #()は省略可
puts(_subClass.instance_of?(BaseClass)) #false
puts(_subClass.is_a?(BaseClass)) #true（継承をさかのぼって判定）
```

### スーパークラスを調べる
* xxx.class.superclass
```
#test.rb
class BaseClass #基本クラス（スーパークラス）
    def initialize()
    end
end
class SubClass < BaseClass #派生クラス（サブクラス）
    def initialize()
    end
end
_subClass = SubClass.new() #()は省略可
puts(_subClass.class.superclass) #BaseClass（オブジェクトのスーパークラスを返す）
```

### データ型のキャスト（文字列→数値）
* xxx.to_i
```
#test.rb
_tmp = "001".to_i
puts(_tmp) #1
puts(_tmp.class.name) #Fixnum

_tmp = "001".to_f
puts(_tmp) #1.0
puts(_tmp.class.name) #Float
```

### データ型のキャスト（数値→文字列）
* xxx.to_s
```
#test.rb
_tmp = 100.to_s(10) #10進数の場合（(10)は省略可）
puts(_tmp) #"100"
puts(_tmp.class.name) #String
```

### データ型のキャスト（ブール値への変換）
* Rubyには特別な機能が用意されていない

実行環境：Ubuntu 16.04 LTS、Ruby 2.3  
作成者：Takashi Nishimura  
作成日：2017年04月06日


<a name="クラス"></a>
# <b>クラス</b>

### 最小構成
```
#test.rb
class MyClass #前方宣言が必要（必ず大文字で始めなければならない）
    def initialize() #コンストラクタ（省略可）
    end
end
_myClass = MyClass.new() #()は省略可  
```

### 例文
```
#test.rb
#================================================================
# 長方形クラス
#================================================================
class Rectangle #前方宣言が必要
    #----------------------------------------------
    # インスタンス変数の宣言（通常は省略）
    #----------------------------------------------
    @width = nil #省略可（@widthだけでも可）
    @height = nil #省略可（@heightだけでも可）

    #----------------------------------------------
    # コンストラクタ
    #----------------------------------------------
    def initialize(w,h)
        @width = w
        @height = h
    end

    #----------------------------------------------
    # @widthアクセス用（getter/setter）
    #----------------------------------------------
    def width #getter
        @width
    end
    def width=(value) #setter
        @width = value
    end

    #----------------------------------------------
    # @heightアクセス用（getter/setter）
    #----------------------------------------------
    def height #getter
        @height
    end
    def height=(value) #setter
        @height = value
    end

    #----------------------------------------------
    # 面積計算用メソッド
    #----------------------------------------------
    def getArea
        return @width * @height
    end
end

#================================================================
# 実行
#================================================================
#①インスタンスの生成
_rectangle = Rectangle.new(640,480)

#②プロパティの取得（その１）
#puts(_rectangle.@width) #syntax error（外からのアクセス不可）
puts(_rectangle.width) #640
puts(_rectangle.height) #480

#③プロパティの更新
_rectangle.width = 1920
_rectangle.height = 1080

#④プロパティの取得（その２）
puts(_rectangle.width) #1920
puts(_rectangle.height) #1080

#⑤メソッドの実行
puts(_rectangle.getArea()) #2073600（()は省略可）
```

実行環境：Ubuntu 16.04 LTS、Ruby 2.3  
作成者：Takashi Nishimura  
作成日：2017年04月06日  


<a name="スーパークラスとサブクラス"></a>
# <b>スーパークラスとサブクラス</b>

### 概要
* スーパークラス ＝ 基本（基底）クラス、親クラスのこと
* サブクラス ＝ 派生クラス、子クラスのこと
* 多重継承は不可

### 例文
```
#test.rb
#================
# スーパークラス
#================
class SuperClass
    @pSuperClass #インスタンス変数の宣言（省略可）←…派生クラスでも利用可能
    def initialize() #コンストラクタ
        @pSuperClass = "スーパークラスの変数"
    end
    def pSuperClass #getter
        @pSuperClass
    end
    def mSuperClass
        puts("スーパークラスのメソッド")
    end
end

#================
# サブクラスＡ
#================
class SubClassA < SuperClass
    @pSubClassA #インスタンス変数≒プライベート変数の宣言（省略可）
    def initialize()
        super() #必須（スーパークラスのinitialize()をオーバーライドしてしまう為）
        @pSubClassA = "サブクラスＡの変数"
    end
    def pSubClassA #getter
        @pSubClassA
    end
    def mSubClassA
        puts("サブクラスＡのメソッド")
    end
end
#================
# サブクラスＢ
#================
class SubClassB < SuperClass
    @pSubClassB #インスタンス変数≒プライベート変数の宣言（省略可）
    def initialize()
        super() #必須（スーパークラスのinitialize()をオーバーライドしてしまう為）
        @pSubClassB = "サブクラスＢの変数"
    end
    def pSubClassB #getter
        @pSubClassB
    end
    def mSubClassB
        puts("サブクラスＢのメソッド")
    end
end

#================
# 実行
#================
#サブクラスＡ
_subClassA = SubClassA.new() #インタンスの生成（()は省略可）
puts(_subClassA) ##<SubClassA:0x00000001e42748>
puts(_subClassA.is_a?(SubClassA)) #true（SubClassAのインスンタンス）
puts(_subClassA.is_a?(SuperClass)) #true（SuperClassのインスンタンスでもある）
puts(_subClassA.pSuperClass) #"スーパークラスの変数"
puts(_subClassA.pSubClassA) #"サブクラスＡの変数"
_subClassA.mSuperClass() #"スーパークラスのメソッド"
_subClassA.mSubClassA() #"サブクラスのメソッド"

#サブクラスＢ
_subClassB = SubClassB.new() #インタンスの生成（()は省略可）
puts(_subClassB) ##<SubClassB:0x00000001e42478>
puts(_subClassB.is_a?(SubClassB)) #true（SubClassBのインスンタンス）
puts(_subClassB.is_a?(SuperClass)) #true（SuperClassのインスンタンスでもある）
puts(_subClassB.pSuperClass) #"スーパークラスの変数"
puts(_subClassB.pSubClassB) #"サブクラスＢの変数"
_subClassB.mSuperClass() #"スーパークラスのメソッド"
_subClassB.mSubClassB() #"サブクラスのメソッド"
```

実行環境：Ubuntu 16.04 LTS、Ruby 2.3  
作成者：Takashi Nishimura  
作成日：2017年04月06日


<a name="名前空間"></a>
# <b>名前空間</b>

### 構文
```
modlue モジュール名 #大文字で開始
    class クラス名
        ……
    end
    ……
end

include モジュール名
変数 = クラス名.new() #includeで事前にモジュールを取り込むと「モジュール名::」は省略可
```

### 例文
```
#test.rb
module MyLibrary #モジュール名は大文字で開始（注意）
    #---------------
    #スーパークラス
    #---------------
    class SuperClass
        @myProperty #インスタンス変数の宣言（省略可）
        def initialize() #コンストラクタ
            @myProperty = "スーパークラスの変数"
        end
        def AAA()
            puts("SuperClass.AAA")
        end
        def myProperty #アクセサ（getter）
            @myProperty
        end
    end

    #---------------
    #サブクラス
    #---------------
    class SubClass < SuperClass #継承も可能
        def BBB()
            puts("SubClass.BBB")
        end
    end
end

include MyLibrary
_subclass = SubClass.new() #includeで事前にモジュールを取込めばモジュール名::は省略可
#_subclass = MyLibrary::SubClass.new() #includeしておかないと「モジュール名::」が必要
_subclass.AAA() #"AAA"
_subclass.BBB() #"SubClass.BBB"
```

実行環境：Ubuntu 16.04 LTS、Ruby 2.3  
作成者：Takashi Nishimura  
作成日：2017年04月06日  


<a name="継承と委譲"></a>
# <b>継承と委譲</b>

### 概要
*  GoF デザインパターンの [Adapter パターン](http://bit.ly/2naab8x)等で利用される
* 継承の場合は「class サブクラス <b>< スーパークラス</b>」を使い、委譲の場合は <b>クラス.new()</b> を使ってオブジェクトを生成し、他のクラスの機能を利用する

### 継承版
```
#test.rb
class ClassA
    def myMethod()  #()は省略可
        puts("ClassA.myMethod")
    end
end

class ClassB < ClassA #ClassAを継承（ポイント）
end

_classB = ClassB.new()
_classB.myMethod() #"ClassA.myMethod"
```

### 委譲版
```
#test.rb
class ClassA
    def myMethod()  #()は省略可
        puts("ClassA.myMethod")
    end
end

class ClassB
    def initialize() #コンストラクタ
        @classA = ClassA.new() #ClassAのインスタンスを変数に格納（ポイント）
    end
    def myMethod()
        @classA.myMethod()
    end
end

_classB = ClassB.new()
_classB.myMethod() #"ClassA.myMethod"
```

実行環境：Ubuntu 16.04 LTS、Ruby 2.3  
作成者：Takashi Nishimura  
作成日：2017年04月06日


<a name="変数とスコープ"></a>
# <b>変数とスコープ</b>

### 変数の種類
1. [グローバル変数](#グローバル変数) : プログラムのどこからでも参照＆変更可能
1. [インスタンス変数](#インスタンス変数) : 同じインスタンス内であれば参照＆変更可能（未定義はnil）
1. [ローカル変数](#ローカル変数) : メソッド等の中でのみ参照＆変更可能
1. [クラス変数](#クラス変数) : 静的変数（クラスをインスタンス化せずにアクセス可能）
* パブリック変数という概念はない（attr_xxx で代用）

<a name="グローバル変数"></a>
### グローバル変数（大域変数） : $xxx
```
#test.rb
$global = "グローバル変数" #一般的にグローバル変数は好まれない

#===========================================
# メソッド内のグローバル変数の扱い
#===========================================
def myMethod()
    puts($global) #"グローバル変数"
    $global = "グローバル②" #関数内で変更可能
    puts($global) #"グローバル②"
end

myMethod()

#===========================================
# クラス内のグローバル変数の扱い
#===========================================
class MyClass
    def myMethod
        puts($global) #"グローバル変数②"
        $global = "グローバル③" #クラス内で変更可能
        puts($global) #"グローバル③"
    end
end

_myClass = MyClass.new()
_myClass.myMethod()
```

<a name="インスタンス変数"></a>
### インスタンス変数 : @xxx
* 全クラスからアクセスが可能なパブリック変数（実用性は無い）は存在しない
* プライベート変数的ですが継承先でもアクセス可能（注意）
* Rubyでは３つアクセスメソッドが用意されている
    * attr_reader : 参照のみ
    * attr_writer : 変更のみ
    * attr_accessor : 参照･変更可

* ふつうの getter / setter を使った例文
    ```
    #test.rb
    class MyClass
        @hensu #インスタンス変数の宣言（省略可）

        def initialize()
            @hensu = "インスタンス変数①"
        end

        def hensu
            @hensu
        end
        def hensu=(value)
            @hensu = value
        end
    end

    _myClass = MyClass.new()
    puts(_myClass.hensu) #"インスタンス変数①"
    _myClass.hensu = "インスタンス変数②" #外からも変更可能
    puts(_myClass.hensu) #"インスタンス変数②"
    ```

* attr_reader（参照のみ可）を使った例文 ＝ getter
    ```
    #test.rb
    class MyClass
        attr_reader :hensu #インスタンス変数を外部から参照のみ可能にする

        def initialize()
            @hensu = "インスタンス変数"
        end
    end

    _myClass = MyClass.new()
    #puts(_myClass.@hensu) #エラー（外からはアクセス不可）
    puts(_myClass.hensu) #"インスタンス変数"
    #_myClass.hensu = "インスタンス変数②" #Error（変更は不可）
    ```

* attr_writer（変更のみ可）を使った例文 = Ruby流setter
    ```
    #test.rb
    class MyClass
        attr_writer :hensu #インスタンス変数を外部から変更のみ可能にする

        def initialize()
            @hensu = "インスタンス変数"
        end
        def test()
            puts(@hensu)
        end
    end

    _myClass = MyClass.new()
    #puts(_myClass.hensu) #Error（参照は不可）
    _myClass.hensu = "インスタンス変数②" #変更は可能
    _myClass.test() #"インスタンス変数②"
    ```

* attr_accessor（参照･変更可）を使った例文 ＝ getter / setter
    ```
    #test.rb
    class MyClass
        attr_accessor :hensu #インスタンス変数を外部から参照･変更可能にする

        def initialize()
            @hensu = "インスタンス変数①"
        end
    end

    _myClass = MyClass.new()
    puts(_myClass.hensu) #"インスタンス変数①"
    _myClass.hensu = "インスタンス変数②" #変更は可能
    puts(_myClass.hensu) #"インスタンス変数②"
    ```

<a name="ローカル変数"></a>
### ローカル変数（局所変数） : _xxx
* メソッド内で宣言する場合
    ```
    #test.rb
    def myMethod
        _local = "ローカル変数" #このメソッド内でのみ利用可
        puts(_local) #"ローカル変数"
    end

    def myMethod2
        #puts(_local) #エラー（アクセス不可）
    end
    myMethod()
    myMethod2()
    #puts(_local) #エラー（アクセス不可）
    ```

    * クラスの関数内で宣言する場合
    ```
    #test.rb
    class MyClass
        def myMethod1()
            _local = "ローカル変数"
            puts(_local) #このメソッド内でのみ利用可能!!
        end
        def myMethod2()
            #print(_local) #エラー（アクセス不可）
        end
    end
    _myClass = MyClass.new()
    _myClass.myMethod1() #"ローカル変数"
    _myClass.myMethod2()
    #puts(myClass_._local) #undefined（アクセス不可）
    ```

* for 文内で宣言する場合（内部処理は each メソッドと同じ）
    ```
    #test.rb
    class MyClass
        def initialize()
            i = 999 #ローカル変数
            for i in 0..5
                puts(i) #0,1,...,5
            end
            puts(i) #5（メソッド内であればアクセス可）
        end
    end
    _myClass = MyClass.new()
    ```

<a name="クラス変数"></a>
### クラス変数（静的変数） : @@xxx
```
#test.rb
class MyClass
    @@hensu = "クラス変数"
    def MyClass.hensu #アクセサ（getter）が必要
        @@hensu
    end
end
#puts(MyClass.@@hensu) #エラー（アクセス不可）
puts(MyClass.hensu) #"クラス変数"（アクセス可能）
```

実行環境：Ubuntu 16.04 LTS、Ruby 2.3  
作成者：Takashi Nishimura  
作成日：2017年04月06日


<a name="アクセサ"></a>
# <b>アクセサ （getter / setter）</b>

### 概要
* 下記の他に3つのアクセスメソッドがある
    * attr_reader : 参照のみ
    * attr_writer : 変更のみ
    * attr_accessor : 参照･変更可
* 参照「 [変数とスコープ](#変数とスコープ)」

### 読み書き可能なプロパティ
```
#test.rb
class Nishimura
    @age #省略可
    def initialize() #コンストラクタ
        @age = 49
    end
    def age #アクセスメソッド（getter）
        @age
    end
    def age=(value) #アクセスメソッド（setter）
        @age = value
    end
end

_nishimura = Nishimura.new() #()は省略可
puts(_nishimura.age) #49
#puts(_nishimura.@age) #エラー（インスタンス変数へ直接のアクセスは不可）
_nishimura.age = 50 #変更可能
puts(_nishimura.age) #50
```

### 読み取り専用のプロパティ
```
#test.rb
class Nishimura
    def initialize() #コンストラクタ
        @age = 49
    end
    def age #アクセスメソッド（getter）
        @age
    end
end
_nishimura = Nishimura.new() #()は省略可
puts(_nishimura.age) #49
#_nishimura.age = 49 #エラー（変更不可）
```

実行環境：Ubuntu 16.04 LTS、Ruby 2.3  
作成者：Takashi Nishimura  
作成日：2017年04月06日


<a name="演算子"></a>
# <b>演算子</b>

### 算術演算子
* 他にも複合代入演算子 += -= *= /= %= などもあり
* インクリメント（++）、デクリメント（--）は存在しない
```
#test.rb
puts(3 + 2) #5 (可算) 
puts(5 - 8) #-3 (減算)
puts(3 * 4) #12 (乗算)
puts(1 + 2 * 3 - 4 / 2) #5 (複雑な計算)
puts(63 % 60) #3 (余剰)
puts(8 / 3) #2（除算）←整数の場合、余りは切り捨てられる
puts(8.0 / 3) #2.6666666666666665（小数点第16位まで）
puts(2 ** 8) #256(べき乗) ←2の8乗

#インクリメント（++）、デクリメント（--）の代替として…
hoge_ = 0
hoge_ += 1
puts(hoge_) #1
```

### その他の演算子
```
#test.rb
puts(true && true) #true（論理積）←Pythonと異なります
puts(true || false) #true（論理和）←Pythonと異なります

puts(! true) #false（否定）←Pythonと異なります

puts(2 < 3) #true（比較/未満）
puts(2 <= 2) #true（比較/以下）
puts(1 == 1.0) #true（等号）
puts(1 != 1.0) #false（不等号）
puts(1.eql?(1.0)) #false ←値が同じでもクラスが異なる

# 注意（参照：データ型の操作（同値性））
puts(1 == true) #falseとなります（他の多くの言語と異なる）

puts(3 & 1) #1（ビット積）
puts(3 | 1) #3（ビット和）
puts(3 ^ 1) #2（排他的ビット和）
puts(2 << 7) #256（ビット･シフト）
puts(~3) #-4（ビット反転）
```

実行環境：Ubuntu 16.04 LTS、Ruby 2.3  
作成者：Takashi Nishimura  
作成日：2017年04月06日


<a name="定数"></a>
# <b>定数</b>

### 概要
* 多くの言語にある「const」は存在しない
* 全て大文字（途中_は付けて良い）で命名するだけで、値を変更する際に警告（worning）を発生

### 通常の定数
```
#test.rb
MY_NAME = "TAKASHI NISHIMURA" #先頭はアルファベットの大文字にしなければならない
puts(MY_NAME) #"TAKASHI NISHIMURA"
MY_NAME = "TARO NISHIMURA" #警告（worning）は出るが変更は出来てしまう
puts(MY_NAME) #"TARO NISHIMURA"
```

### クラス定数
```
#test.rb
#=======================================
# カスタムクラス
#=======================================
class MyClass
  MY_NAME = "TAKASHI NISHIMURA" #先頭はアルファベットの大文字
  def initialize(init=0)
    puts(MY_NAME) #"TAKASHI NISHIMURA" #クラス内でのアクセス方法
  end
end

#=======================================
# 実行（クラス名::クラス定数でアクセス）
#=======================================
puts(MyClass::MY_NAME) #"TAKASHI NISHIMURA"（外からのアクセス方法）
MyClass::MY_NAME = "TARO NISHIMURA" #警告（worning）は出るが変更は出来てしまう
puts(MyClass::MY_NAME) #"TARO NISHIMURA"

#インスタンスからのアクセスは不可
_myClass = MyClass.new()
#puts(_myClass.MY_NAME) #エラー（アクセス不可）
```

実行環境：Ubuntu 16.04 LTS、Ruby 2.3  
作成者：Takashi Nishimura  
作成日：2017年04月06日


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
_myClass.sum(1,1) #2 ←…1+1
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

実行環境：Ubuntu 16.04 LTS、Ruby 2.3  
作成者：Takashi Nishimura  
作成日：2017年04月06日  


<a name="匿名関数（ラムダ式）"></a>
# <b>匿名関数（ラムダ式）</b>

### 概要
* 実態は [Proc クラス](https://docs.ruby-lang.org/ja/latest/class/Proc.html)
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

実行環境：Ubuntu 16.04 LTS、Ruby 2.3  
作成者：Takashi Nishimura  
作成日：2017年04月07日


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

実行環境：Ubuntu 16.04 LTS、Ruby 2.3  
作成者：Takashi Nishimura  
作成日：2017年04月07日  


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
elsif (_age <= 60) then #←…Pythonの「elif」と異なる（要注意）
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

実行環境：Ubuntu 16.04 LTS、Ruby 2.3  
作成者：Takashi Nishimura  
作成日：2017年04月07日


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

実行環境：Ubuntu 16.04 LTS、Ruby 2.3  
作成者：Takashi Nishimura  
作成日：2017年04月07日


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

実行環境：Ubuntu 16.04 LTS、Ruby 2.3  
作成者：Takashi Nishimura  
作成日：2017年04月07日  


<a name="for文"></a>
# <b>for 文</b>

### 概要
* Ruby の for 文は内部処理的には each メソッド（参照「[each メソッド](#eachメソッド)」）を実行

### 例文
```
#test.rb
for i in 0..9 do #←範囲オブジェクトの場合
    puts(i) #0,1,2,3,4,5,6,7,8,9
end

for tmp in ["A","B","C"] do #←配列（Array）の場合
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

実行環境：Ubuntu 16.04 LTS、Ruby 2.3  
作成者：Takashi Nishimura  
作成日：2017年04月07日  


<a name="for...in文"></a>
# <b>for...in 文</b>

### 基本構文
```
for (変数名 in 配列等) {
    //配列の場合はインデックス番号、連想配列の場合はプロパティ名
    console.log(変数名);

    //配列の場合は要素の値、連想配列の場合はプロパティ値
    console.log(配列等[変数名]);
}
```

### 配列（1次元）の場合
```
<script>
    var _array = ["TARO", "HANAKO", "ICHIRO", "JIRO"];
    for (let _indexNum in _array) {
        console.log(_indexNum); //0→1→2→3
        console.log(_array[_indexNum]); //"TARO"→"HANAKO"→"ICHIRO"→"JIRO"
    }
</script>
```

### 配列（2次元）の場合
```
<script>
    var _array = [
        ["x0y0", "x1y0", "x2y0"], //0行目
        ["x0y1", "x1y1", "x2y1"]  //1行目
    ];
    for (let _indexNum in _array) {
        console.log(_indexNum); //0→1
        console.log(_array[_indexNum]); //["x0y0","x1y0","x2y0"]→["x0y1","x1y1","x2y1"]
    }
</script>
```

### 連想配列（Object＝オブジェクトリテラル）の場合
```
<script>
    var _object = { name: "Takashi Nishimura", age: 49 };
    for (let _propName in _object) {
        console.log(_propName); //name→age
        console.log(_object[_propName]); //"Takashi Nishimura" → 49
    }
</script>
```

実行環境：Ubuntu 16.04 LTS、Ruby 2.3  
作成者：Takashi Nishimura  
作成日：2017年03月21日  


<a name="for...of文"></a>
# <b>for...of 文</b>

### 一次元配列（Array）の場合
```
<script>
    var _array = ["TARO", "HANAKO", "ICHIRO", "JIRO"];
    for (let _data of _array) {
        console.log(_data); //"TARO"→"HANAKO"→"ICHIRO"→"JIRO"
    }
</script>
```

### 二次元配列（Array）の場合
```
<script>
    var _array = [
        ["x0y0", "x1y0", "x2y0"], //0行目
        ["x0y1", "x1y1", "x2y1"]  //1行目
    ];
    for (let _theArray of _array) {
        console.log(_theArray); //["x0y0","x1y0","x2y0"]→["x0y1","x1y1","x2y1"]
    }
</script>
```

### 配列（Set）の場合
```
<script>
    var _set = new Set();
    _set.add("TARO");
    _set.add("HANAKO");
    for (let _data of _set) {
        console.log(_data); //"TARO"→"HANAKO"
    }
</script>
```

### 連想配列（Map）の場合
```
<script>
    var _map = new Map();
    _map.set("RYOMA", "1836-01-03");
    _map.set("YUKICHI", "1835-01-10");
    for (let [_key, _value] of _map) {
        console.log(_key, _value);
        //"RYOMA" "1836-01-03
        //"YUKICHI" "1835-01-10"
    }
</script>
```

実行環境：Ubuntu 16.04 LTS、Ruby 2.3  
作成者：Takashi Nishimura  
作成日：2017年03月21日  


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
<script>
    var _i = 0;
    while (_i < 10) { //ループ判定式にはboolean値しか使えない
        console.log(_i); //0,1,2,3,4,5,6,7,8,9
        _i++;
    }
</script>
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
<script>
    var _i = 0;
    do {
        console.log(_i); //0 ←ループ判定式はfalseだが１回実行される
        _i++;
    } while (_i < 0);
</script>
```

### while文とbreak文
* 例文（1〜100までを出力）
```
<script>
    var _count = 0;
    while (true) { //ループ判別式をtrueにすると無限ループに
        _count++;
        if (_count > 100) {
            break; //break文を使ってループを終了（while文の次の行へ）
        }
        console.log(_count); //1,2,....,99,100
    }
</script>
```

### while 文と continue 文
* 例文（3の倍数を出力）
```
<script>
    var _i = 1;
    while (_i <= 20) {
        if ((_i % 3) != 0) { //3で割って余りが0ではない（＝3の倍数ではない）場合
            _i++;
            continue; //while文の残処理をスキップしてwhile文の次の反復を開始する
        }
        console.log(_i); //3,6,9,12,15,18 ←3の倍数
        _i++;
    }
</script>
```

実行環境：Ubuntu 16.04 LTS、Ruby 2.3  
作成者：Takashi Nishimura  
作成日：2017年03月21日  


<a name="配列（Array）"></a>
# <b>配列（Array）</b>

### 作成
* new 演算子を使う方法
    ```
    var _array = new Array(); //空の配列を作成
    var _array = new Array(4); //4つの空の要素（undefined）を持つ配列を作成
    var _array = new Array("A", "I");
    var _array = new Array(["A","あ"], ["I","い"]); //配列のネスト
    ```

* 配列リテラルを使う方法
    ```
    var _array = []; //空の配列を作成
    var _array = ["A", "I"];
    var _array = [["A","あ"], ["I","い"]]; //配列のネスト
    ```

### 要素の数
```
<script>
    var _array = ["00", "01", "02", "03"];
    console.log(_array.length); //4
</script>
```

### 追加（最後）
```
<script>
    var _array = ["ICHIRO", "JIRO"];
    _array.push("TARO"); //カンマ（,）を使って複数同時に追加可能
    console.log(_array); //["ICHIRO", "JIRO", "TARO"]
</script>
```

### 追加（先頭）
```
<script>
    var _array = ["ICHIRO", "JIRO"];
    _array.unshift("TARO"); //カンマ（,）を使って複数同時に追加可能
    console.log(_array); //["TARO", "ICHIRO", "JIRO"]
</script>
```

### 更新（任意の値）
```
<script>
    var _array = ["TAKASHI", "ICHIRO", "JIRO"];
    _array[0] = "TARO"; //0番目を変更する場合
    console.log(_array); //["TARO", "ICHIRO", "JIRO"]
</script>
```

### 更新（null 値）
```
<script>
    var _array = ["TARO", "ICHIRO", "JIRO"];
    _array[0] = null;
    console.log(_array); //[null, "ICHIRO", "JIRO"]
</script>
```

### 削除（最後）
```
<script>
    var _array = ["ICHIRO", "JIRO", "TARO"];
    console.log(_array.pop()); //"TARO"（削除した要素を返す）
    console.log(_array); //["ICHIRO", "JIRO"]
</script>
```

### 削除（最初）
```
<script>
    var _array = ["TARO", "ICHIRO", "JIRO"];
    console.log(_array.shift()); //"TARO"（削除した要素を返す）
    console.log(_array); //["ICHIRO", "JIRO"]
</script>
```

### 削除（○番目から□個）
```
<script>
    var _array = ["00", "01", "02", "03", "04", "05"];
    console.log(_array.splice(3, 2)); //["03", "04"]
    console.log(_array) //["00", "01", "02", "05"]
</script>
```

### 削除（○番目から全て）
```
<script>
    var _array = ["00", "01", "02", "03", "04", "05"];
    console.log(_array.splice(3)); //["03", "04", "05"]
    console.log(_array) //["00", "01", "02"]
</script>
```

### 抽出（○番目から□番目）
```
<script>
    var _array = ["00", "01", "02", "03", "04", "05"];
    console.log(_array.slice(2, 4)); //["02", "03"]（4番目は含まず）
    console.log(_array) //["00", "01", "02", "03", "04", "05"]（元配列に変化なし）
</script>
```

### 抽出（○番目から全て）
```
<script>
    var _array = ["00", "01", "02", "03", "04", "05"];
    console.log(_array.slice(2)); //["02", "03", "04", "05"]
    console.log(_array) //["00", "01", "02", "03", "04", "05"]（元配列に変化なし）
</script>
```

### 検索(前から）
* 第2引数番目から、後ろに向かって検索（最初に見つかったインデックス番号を返す）
```
<script>
    var _array = ["A", "B", "C", "D", "E", "F", "D"];
    console.log(_array.indexOf("D", 0)); //3（見つからない場合「-1」を返す）
</script>
```

### 検索（後ろから）
* 第2引数番目から、前に向かって検索（最初に見つかったインデックス番号を返す）
```
<script>
    var _array = ["A", "B", "C", "D", "E", "F", "D"];
    console.log(_array.lastIndexOf("D")); 
    //6（第2引数を省略すると _array.length と同じ）
</script>
```

### 並べ替え（反転）
```
<script>
    var _array = ["00", "01", "02", "03", "04", "05"];
    console.log(_array.reverse()); //["05", "04", "03", "02", "01", "00"]
    console.log(_array) //["05", "04", "03", "02", "01", "00"]（元配列も変更）
</script>
```

### 並べ替え（ソート）
```
<script>
    var _array = ["C", "02", "A", "01", "03", "B"];
    console.log(_array.sort()); //["01", "02", "03", "A", "B", "C"]
    console.log(_array) //["01", "02", "03", "A", "B", "C"]（元配列も変更）
</script>
```

### 結合
```
<script>
    var _array1 = ["A", "B", "C"];
    var _array2 = ["D", "E", "F"];
    var _array3 = _array1.concat(_array2);
    console.log(_array3) //["A", "B", "C", "D", "E", "F"]
</script>
```

### 複製
```
<script>
    var _original = ["A", "B", "C"];
    var _copy = _original.concat(); //複製

    //実験（参照コピーではなく複製されているか否か）
    _original[0] = "あ";
    console.log(_original[0], _copy[0]); //"あ" "A"（参照コピーではない）
</script>
```

### 文字列→配列
```
<script>
    var _string = "A,B,C,D,E,F";
    var _array = _string.split(","); //カンマ区切りで配列化
    console.log(_array); //["A", "B", "C", "D", "E", "F"]
</script>
```

### 全要素を取り出す
```
<script>
    var _array = ["A", "B", "C", "D", "E", "F"];
    _array.forEach(function(arg) {
        console.log(arg); //"A"→"B"→"C"→"D"→"E"→"F"
    });
</script>
```
* for文、for...in文を使う方法もあり（参照「[for...in 文](#for...in文)」）

実行環境：Ubuntu 16.04 LTS、Ruby 2.3  
作成者：Takashi Nishimura  
作成日：2017年03月21日  


<a name="配列（Set）"></a>
# <b>配列（Set）</b>

* 配列（Array）と異なりデータの重複ができない
```
<script>
    //①作成
    var _set = new Set();

    //②データの追加
    _set.add("ICHIRO");
    _set.add("JIRO");

    //参考：既存データの追加
    _set.add("ICHIRO"); //無視される

    //③データの数
    console.log(_set.size); //2

    //④全てのデータの取得
    for (let _data of _set) {
        console.log(_data);
        //"ICHIRO"
        //"JIRO"
    }

    //⑤データがあるか否か
    console.log(_set.has("TARO")); //false
    console.log(_set.has("ICHIRO")); //true

    //⑥データの削除
    _set.delete("ICHIRO");
</script>
```

実行環境：Ubuntu 16.04 LTS、Ruby 2.3  
作成者：Takashi Nishimura  
作成日：2017年03月22日  


<a name="連想配列（Object）"></a>
# <b>連想配列（Object）</b>

```
<script>
    //①作成
    var _object = new Object();
    //他にも {プロパティ名①:値, プロパティ名②:値} という方法もある

    //②プロパティの追加（更新も同じ方法）
    _object.name = "Takashi Nishimura";
    _object.age = 49;

    //③関数の追加
    _object.hello = function() {
        return "Hello! How are you?";
    }

    //④プロパティの参照
    console.log(_object.name); //"Takashi Nishimura"
    console.log(_object["name"]); //配列演算子[]を使うことも可能
    console.log(_object.age); //49

    //⑤関数の実行
    console.log(_object.hello()); //"Hello! How are you?"

    //⑥全ての要素の取得
    for (let _propName in _object) {
        console.log(_propName + " : " + _object[_propName]);
    }
    //name : Takashi Nishimura
    //age : 49
    //hello : function() {...
</script>
```

実行環境：Ubuntu 16.04 LTS、Ruby 2.3  
作成者：Takashi Nishimura  
作成日：2017年03月22日  


<a name="連想配列（Map）"></a>
# <b>連想配列（Map）</b>

### [Object](http://bit.ly/2nkyLU0) との違い
1. キーに文字列以外でも使える
1. データの個数を調べるプロパティが用意されている
1. Object オブジェクトを継承していない（クリーンな連想配列の生成が可能）

### 例文
```
<script>
    //①作成
    var _map = new Map();

    //②データの追加
    _map.set("RYOMA", "1836-01-03");
    _map.set("YUKICHI", "1835-01-10");

    //③データの数
    console.log(_map.size); //2

    //④データの取得
    console.log(_map.get("RYOMA")); //"1836-01-03"
    console.log(_map.get("YUKICHI")); //"1835-01-10"

    //⑤全てのデータの取得
    for (let [_key, _value] of _map) {
        console.log(_key, _value);
        //"RYOMA" "1836-01-03"
        //"YUKICHI" "1835-01-10"
    }

    //⑥データがあるか否か
    console.log(_map.has("SHINSAKU")); //false
    console.log(_map.has("RYOMA")); //true

    //⑦データの削除
    _map.delete("RYOMA");
</script>
```

実行環境：Ubuntu 16.04 LTS、Ruby 2.3  
作成者：Takashi Nishimura  
作成日：2017年03月22日  


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
                    this.__mousedown_image_method(_e);
                }

                //Image用イベントハンドラの定義
                this.__image.addEventListener("mousedown", this.__mousedown_image, false);
            }

            //MyClass.__mousedown_image（アロー関数）からの呼出し
            __mousedown_image_method(_mouseEvent) {
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

実行環境：Ubuntu 16.04 LTS、Ruby 2.3  
作成者：Takashi Nishimura  
作成日：2017年03月22日  


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
        console.log(_num); //2,10 "CD"が見つかった場所（0から開始）を返す
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

実行環境：Ubuntu 16.04 LTS、Ruby 2.3  
作成者：Takashi Nishimura  
作成日：2017年03月22日  


<a name="正規表現"></a>
# <b>正規表現</b>

* ECMAScript 6 には以下のサンプル以外にも多くの正規表現の機能が用意されています

### 検索＆置換
```
<script>
    var _string = "吉田松蔭,高杉晋作,久坂玄瑞,吉田稔麿,伊藤博文";
    var _regExp = new RegExp("吉田", "g"); //第2引数を省略すると全てを置換（"g"と同等）
    /*
    "^○○$"のように「^（行頭マッチ）」「$（行末マッチ）」といったメタ文字の他、様々なパターン、例えば "[A-D]\d+" など…を使うことでより細かな制御が可能
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

### 正規表現について…
* 文字パータンを表現するオブジェクト（RegExp クラス）のこと
* JavaScriptの正規表現は、ECMAScript 3 で標準化された
* String と RegExp クラスには、次のような正規表現用のメソッドが用意されている
    1. RegExp.exec()
    1. RegExp.test()
    1. String.search()
    1. String.match()
    1. String.replace()
    1. String.split()

実行環境：Ubuntu 16.04 LTS、Ruby 2.3  
作成者：Takashi Nishimura  
作成日：2017年03月22日  


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

実行環境：Ubuntu 16.04 LTS、Ruby 2.3  
作成者：Takashi Nishimura  
作成日：2017年03月22日  


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

実行環境：Ubuntu 16.04 LTS、Ruby 2.3  
作成者：Takashi Nishimura  
作成日：2017年03月22日  


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

実行環境：Ubuntu 16.04 LTS、Ruby 2.3  
作成者：Takashi Nishimura  
作成日：2017年03月22日  


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
                this.__dieHandler(this); //←"die"イベントの発生（リスナー関数の呼出し）
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

実行環境：Ubuntu 16.04 LTS、Ruby 2.3  
作成者：Takashi Nishimura  
作成日：2017年03月22日  


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
    console.log(Math.cos(Math.PI * 2)); //1 360°
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

実行環境：Ubuntu 16.04 LTS、Ruby 2.3  
作成者：Takashi Nishimura  
作成日：2017年03月22日  

<a name="乱数"></a>
# <b>乱数</b>

### Math.random()
* 0以上、1未満（0.9999…）の値を返す
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
    //909595 908581 908332 909483 907921 908880 909161 909607 909295 910453 908692
</script>
```

実行環境：Ubuntu 16.04 LTS、Ruby 2.3  
作成者：Takashi Nishimura  
作成日：2017年03月22日  


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

実行環境：Ubuntu 16.04 LTS、Ruby 2.3  
作成者：Takashi Nishimura  
作成日：2017年03月22日  


<a name="タイマー"></a>
# <b>タイマー</b>

### 繰返し実行する
```
<script>
    _count = 0;
    callbackFunction = () => {
        if (++_count <= 10) { //10回繰返す場合…
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

実行環境：Ubuntu 16.04 LTS、Ruby 2.3  
作成者：Takashi Nishimura  
作成日：2017年03月22日  


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

実行環境：Ubuntu 16.04 LTS、Ruby 2.3  
作成者：Takashi Nishimura  
作成日：2017年03月22日  



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

実行環境：Ubuntu 16.04 LTS、Ruby 2.3  
作成者：Takashi Nishimura  
作成日：2017年03月22日  
