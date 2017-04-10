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
***
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

実行環境：Ubuntu 16.04.2 LTS、Ruby 2.3.1  
作成者：Takashi Nishimura  
作成日：2016年07月04日  
更新日：2017年04月06日


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

実行環境：Ubuntu 16.04.2 LTS、Ruby 2.3.1  
作成者：Takashi Nishimura  
作成日：2016年07月05日  
更新日：2017年04月06日


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

実行環境：Ubuntu 16.04.2 LTS、Ruby 2.3.1  
作成者：Takashi Nishimura  
作成日：2016年07月05日  
更新日：2017年04月06日  


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
    @pSuperClass #インスタンス変数の宣言（省略可）←派生クラスでも利用可能
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

実行環境：Ubuntu 16.04.2 LTS、Ruby 2.3.1  
作成者：Takashi Nishimura  
作成日：2016年07月05日  
更新日：2017年04月06日


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

実行環境：Ubuntu 16.04.2 LTS、Ruby 2.3.1  
作成者：Takashi Nishimura  
作成日：2016年07月08日  
更新日：2017年04月06日


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

実行環境：Ubuntu 16.04.2 LTS、Ruby 2.3.1  
作成者：Takashi Nishimura  
作成日：2016年07月05日  
更新日：2017年04月06日


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

実行環境：Ubuntu 16.04.2 LTS、Ruby 2.3.1  
作成者：Takashi Nishimura  
作成日：2016年07月05日  
更新日：2017年04月06日


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

実行環境：Ubuntu 16.04.2 LTS、Ruby 2.3.1  
作成者：Takashi Nishimura  
作成日：2016年07月05日  
更新日：2017年04月06日


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

実行環境：Ubuntu 16.04.2 LTS、Ruby 2.3.1  
作成者：Takashi Nishimura  
作成日：2016年07月05日  
更新日：2017年04月06日


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

実行環境：Ubuntu 16.04.2 LTS、Ruby 2.3.1  
作成者：Takashi Nishimura  
作成日：2016年07月05日  
更新日：2017年04月06日


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

実行環境：Ubuntu 16.04.2 LTS、Ruby 2.3.1  
作成者：Takashi Nishimura  
作成日：2016年07月06日  
更新日：2017年04月06日


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

実行環境：Ubuntu 16.04.2 LTS、Ruby 2.3.1  
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

実行環境：Ubuntu 16.04.2 LTS、Ruby 2.3.1  
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

実行環境：Ubuntu 16.04.2 LTS、Ruby 2.3.1  
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

実行環境：Ubuntu 16.04.2 LTS、Ruby 2.3.1  
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

実行環境：Ubuntu 16.04.2 LTS、Ruby 2.3.1  
作成者：Takashi Nishimura  
作成日：2016年07月07日  
更新日：2017年04月07日


<a name="for文"></a>
# <b>for 文</b>

### 概要
* Ruby の for 文は内部処理的には each メソッド（参照「[each メソッド](#eachメソッド)」）を実行

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

実行環境：Ubuntu 16.04.2 LTS、Ruby 2.3.1  
作成者：Takashi Nishimura  
作成日：2016年07月07日  
更新日：2017年04月07日


<a name="eachメソッド"></a>
# <b>each メソッド</b>

### 概要
* Ruby の for 文（参照「[for 文](#for文)」）は内部処理的はこの each メソッドを実行

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

実行環境：Ubuntu 16.04.2 LTS、Ruby 2.3.1  
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

実行環境：Ubuntu 16.04.2 LTS、Ruby 2.3.1  
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

実行環境：Ubuntu 16.04.2 LTS、Ruby 2.3.1  
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

実行環境：Ubuntu 16.04.2 LTS、Ruby 2.3.1  
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

実行環境：Ubuntu 16.04.2 LTS、Ruby 2.3.1  
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

実行環境：Ubuntu 16.04.2 LTS、Ruby 2.3.1  
作成者：Takashi Nishimura  
作成日：2016年07月08日  
更新日：2017年04月08日


<a name="正規表現"></a>
# <b>正規表現</b>

### 概要
* 正規表現は、URL、パスワード、メールアドレス等、特定の文字パターンを抽出するのに利用
* 正規表現の基本文法は、特定のプログラミング言語に依存しない
* Ruby には以下のサンプル以外にも多くの正規表現の機能が用意されている

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

実行環境：Ubuntu 16.04 LTS、Ruby 2.3 
作成者：Takashi Nishimura  
作成日：2016年07月08日  
更新日：2017年04月10日


<a name="抽象クラス"></a>
# <b>抽象クラス</b>

### 概要
* Rubyには interface や abstract キーワードは存在しません
* Rubyでは、継承と例外を使って擬似的な抽象クラスを実現します

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

実行環境：Ubuntu 16.04.2 LTS、Ruby 2.3.1  
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

実行環境：Ubuntu 16.04.2 LTS、Ruby 2.3.1  
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

実行環境：Ubuntu 16.04.2 LTS、Ruby 2.3.1  
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

実行環境：Ubuntu 16.04.2 LTS、Ruby 2.3.1  
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

### Math.sqrt()
* 平方根（√○）
```
#test.rb
puts(Math.sqrt(2)) #1.4142135623730951（一夜一夜にひとみごろ）
puts(Math.sqrt(3)) #1.7320508075688772（人並みに奢れや）
puts(Math.sqrt(4)) #2.0
puts(Math.sqrt(5)) #2.23606797749979（富士山麓オウム鳴く）
```

## Mathモジュールを使わないもの

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
puts(100.abs) #100.0
puts(-100.abs) #100.0
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

実行環境：Ubuntu 16.04.2 LTS、Ruby 2.3.1  
作成者：Takashi Nishimura  
作成日：2016年07月09日  
更新日：2017年03月22日

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

実行環境：Ubuntu 16.04.2 LTS、Ruby 2.3.1  
作成者：Takashi Nishimura  
作成日：2016年07月0X日  
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

実行環境：Ubuntu 16.04.2 LTS、Ruby 2.3.1  
作成者：Takashi Nishimura  
作成日：2016年07月0X日  
更新日：2017年03月22日


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

実行環境：Ubuntu 16.04.2 LTS、Ruby 2.3.1  
作成者：Takashi Nishimura  
作成日：2016年07月0X日  
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

実行環境：Ubuntu 16.04.2 LTS、Ruby 2.3.1  
作成者：Takashi Nishimura  
作成日：2016年07月0X日  
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

実行環境：Ubuntu 16.04.2 LTS、Ruby 2.3.1  
作成者：Takashi Nishimura  
作成日：2016年07月0X日  
更新日：2017年03月22日