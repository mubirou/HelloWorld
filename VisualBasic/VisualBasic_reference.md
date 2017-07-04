### <b>この項目は書きかけの項目です</b>

# <b>Visual Basic .NET 基礎文法</b>

### <b>INDEX</b>

* Hello,world! （[Linux](https://github.com/TakashiNishimura/HelloWorld/blob/master/VisualBasic/VisualBasic_linux.md) / [macOS](https://github.com/TakashiNishimura/HelloWorld/blob/master/TypeScript/TypeScript_mac.md) / [Windows](https://github.com/TakashiNishimura/HelloWorld/blob/master/TypeScript/TypeScript_win.md)）
* [データ型](#データ型)
* [データ型の操作](#データ型の操作)
* [クラス](#クラス)
* [基本クラスと派生クラス](#基本クラスと派生クラス)
* [名前空間](#名前空間)
* [継承と委譲](#継承と委譲)
* [変数とスコープ](#変数とスコープ)
* [アクセサ （Get / Set）](#アクセサ)
* [演算子](#演算子)
* [定数](#定数)
* [メソッド](#メソッド)
* [デリゲート](#デリゲート)
* [クラス定数･クラスメソッド](#クラス定数･クラスメソッド)
* [If 文](#If文)
* [三項演算子](#三項演算子)
* [Select Case 文](#SelectCase文)
* [For 文](#For文)
* [For Each 文](#ForEach文)
* [While 文](#While文)
***
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
'test.vb
Module test '名前（test）は任意
    Sub Main() '名前（Main）は決め打ち
        'Boolean型
        Dim _boolean As Boolean = True 'またはFalse
        Console.WriteLine(_boolean) '=> True
        Console.WriteLine(TypeName(_boolean)) '=> Boolean

        '整数型①（0〜255）
        Dim _byte As Byte = 255
        Console.WriteLine(_byte)
        Console.WriteLine(TypeName(_byte))

        '整数型②（-127〜127）
        Dim _sbyte As SByte = 127
        Console.WriteLine(_sbyte) '=> 127
        Console.WriteLine(TypeName(_sbyte)) '=> SByte

        '整数型③（-32768〜32767）
        Dim _short As Short = 32767
        Console.WriteLine(_short) '=> 32768
        Console.WriteLine(TypeName(_short)) '=> Short

        '整数型④（0〜65535）
        Dim _ushort AS Ushort = 65535
        Console.WriteLine(_ushort) '=> 65535
        Console.WriteLine(TypeName(_ushort)) '=> Ushort

        '整数型⑤（-2147483648〜2147483647）
        Dim _int As Integer = -2147483648
        Console.WriteLine(_int) '=> -2147483648
        Console.WriteLine(TypeName(_int)) '=> Integer

        '整数型⑥（-9223372036854775808〜9223372036854775807）
        Dim _long As Long = 9223372036854775807
        Console.WriteLine(_long) '=> 9223372036854775807
        Console.WriteLine(TypeName(_long)) '=> Long

        '浮動小数点数型①（単精度）
        Dim _single As Single = 3.141592653589793
        Console.WriteLine(_single) '=> 3.141593
        Console.WriteLine(TypeName(_single)) '=> Single

        '浮動小数点数型②（倍精度）
        Dim _double As Double = 3.141592653589793
        Console.WriteLine(_double) '=> 3.14159265358979
        Console.WriteLine(TypeName(_double)) '=> Double

        '文字列型（〜約20億個の文字）
        Dim _string As String = "あいうえお"
        Console.WriteLine(_string) '=> あいうえお
        Console.WriteLine(TypeName(_string)) '=> String
    End Sub
End Module
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.0.1  
作成者：Takashi Nishimura  
作成日：2017年06月21日


<a name="データ型の操作"></a>
# <b>データ型の操作</b>

### データ型の調べ方
1. TypeOf...IS 演算子
    * インスタンスが特定の型か、あるいはその派生クラスか否か調べる
    ```
    'test.vb
    Module test '名前（test）は任意
        Sub Main() '名前（Main）は決め打ち
            Dim _subclass AS New SubClass
            Console.WriteLine(TypeOf _subclass IS SubClass) '=> True
            Console.WriteLine(TypeOf _subclass IS SuperClass) '=> True

            Console.WriteLine(TypeOf "ABC" IS String) '=> True
        End Sub

        '継承元クラス
        Public Class SuperClass
        End Class

        '派生クラス
        Public Class SubClass
            Inherits SuperClass
        End Class
    End Module
    ```

1. Is 演算子
    * 同一のオブジェクトを参照しているか否か調べる
    ```
    'test.vb
    Module test '名前（test）は任意
        Sub Main() '名前（Main）は決め打ち
            Dim _someClass1 AS New SomeClass
            Dim _someClass2 AS New SomeClass
            Console.WriteLine(_someClass1 Is _someClass2) '=> Falase

            Dim _someClass3 AS SomeClass = _someClass2
            Console.WriteLine(_someClass3 IS _someClass2) '=> True
        End Sub

        Public Class SomeClass
        End Class
    End Module
    ```

1. TypeName() 関数
    * データ型情報を含む文字列型（String）の値を返す
    ```
    'test.vb
    Module test '名前（test）は任意
        Sub Main() '名前（Main）は決め打ち
            Console.WriteLine(TypeName(True)) '=> Boolean
            Console.WriteLine(TypeName(100)) '=> Integer
            Console.WriteLine(TypeName(10000000000)) '=> Long
            Console.WriteLine(TypeName(0.1)) '=> Double
            Console.WriteLine(TypeName("1")) '=> String
            Console.WriteLine(TypeName(New SomeClass)) '=> someclass
        End Sub

        Public Class SomeClass 'MyClassだとerror
        End Class
    End Module
    ```

### データ型のキャスト
1. 数値⇆ boolean 型へ変換
    ```
    'test.vb
    Module test '名前（test）は任意
        Sub Main() '名前（Main）は決め打ち
            '数値→Boolean型
            Dim _boolean As Boolean = CBool(1)
            Console.WriteLine(_boolean) '=> True
            Console.WriteLine(TypeName(_boolean)) '=> Boolean

            'Boolean型→数値
            Dim _integer AS Integer = CInt(False)
            Console.WriteLine(_integer) '=> 0（注意：Trueだと-1）
            Console.WriteLine(TypeName(_integer)) '=> Integer
        End Sub
    End Module
    ```

1. 数値→数値（縮小変換は避ける）
    ```
    'test.vb
    Module test '名前（test）は任意
        Sub Main() '名前（Main）は決め打ち
            Dim _short As Short = 32767
            Dim _integer AS Integer = CInt(_short)
            Console.WriteLine(_integer) '=> 32767
            Console.WriteLine(TypeName(_integer)) '=> Integer
        End Sub
    End Module
    ```

1. 数値↔ String 型
    ```
    'test.vb
    Module test '名前（test）は任意
        Sub Main() '名前（Main）は決め打ち
            'String型→数値
            Dim _string1 As String = "001"
            Dim _integer1 AS Integer = CInt(_string1)
            Console.WriteLine(_integer1) '=> 1
            Console.WriteLine(TypeName(_integer1)) '=> Integer

            '数値→String型
            Dim _integer2 AS Integer = 100
            Dim _string2 AS String = CStr(_integer2)
            Console.WriteLine(_string2) '=> 100
            Console.WriteLine(TypeName(_string2)) '=> String
        End Sub
    End Module
    ```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.0.1  
作成者：Takashi Nishimura  
作成日：2017年06月22日


<a name="クラス"></a>
# <b>クラス</b>

```
'test.vb
Module test '名前（test）は任意
    Sub Main() '名前（Main）は決め打ち
        '①インタンスの生成
        Dim _rectangle AS New Rectangle

        '②プロパティの更新
        _rectangle.width = 1920
        _rectangle.height = 1080

        '③プロパティの取得
        Console.WriteLine(_rectangle.width) '=> 1920
        Console.WriteLine(_rectangle.height) '=> 1080

        '④メソッドの実行
        Console.WriteLine(_rectangle.GetArea()) '=> 2073600
    End Sub

    '長方形クラス
    Public Class Rectangle
        'プロパティの定義・初期値の設定
        private _width As Integer = 0
        private _height As Integer = 0

        'コンストラクタは省略可（初期値はここで設定してもよい）
        Public Sub New()
        End Sub

        'アクセサの定義
        Public Property width() As Integer
            Get
                width = _width
            End Get
            Set(ByVal _newValue As Integer)
                _width = _newValue
            End Set
        End Property

        Public Property height() As Integer
            Get
                height = _height
            End Get
            Set(ByVal _newValue As Integer)
                _height = _newValue
            End Set
        End Property

        'メソッドの定義
        Public Function GetArea() As Integer
            return _width * _height
        End Function
    End Class
End Module
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.0.1  
作成者：Takashi Nishimura  
作成日：2017年06月25日


<a name="基本クラスと派生クラス"></a>
# <b>基本クラスと派生クラス</b>

```
'test.vb
Module test '名前（test）は任意
    Sub Main() '名前（Main）は決め打ち
        '派生クラスＡのインスタンス
        Dim _SubclassA AS New SubClassA
        Console.WriteLine(_SubclassA.PSuperClass) '=> 基本クラスのプロパティ
        Console.WriteLine(_SubclassA.PSubClassA) '=> 派生クラスＡのプロパティ
        Console.WriteLine(_SubclassA.MSuperClass()) '=> 基本クラスのメソッド
        Console.WriteLine(_SubclassA.MSubClassA()) '=> 派生クラスＡのメソッド
        
        '派生クラスＢのインスタンス
        Dim _SubclassB AS New SubClassB
        Console.WriteLine(_SubclassB.PSuperClass) '=> 基本クラスのプロパティ
        Console.WriteLine(_SubclassB.PSubClassB) '=> 派生クラスＢのプロパティ
        Console.WriteLine(_SubclassB.MSuperClass()) '=> 基本クラスのメソッド
        Console.WriteLine(_SubclassB.MSubClassB()) '=> 派生クラスＢのメソッド
    End Sub

    '''''''''''''''''''''''''''''''
    '継承元クラス（スーパークラス）
    '''''''''''''''''''''''''''''''
    Public Class SuperClass
        'プロパティの定義・初期値の設定
        private _PSuperClass As String = "基本クラスのプロパティ"

        'コンストラクタは省略可（初期値はここで設定してもよい）
        Public Sub New()
        End Sub

        'アクセサの定義
        Public Property PSuperClass() As String
            Get
                PSuperClass = _PSuperClass
            End Get
            Set(ByVal _newValue As String)
                _PSuperClass = _newValue
            End Set
        End Property

        'メソッドの定義
        Public Function MSuperClass() As String
            return "基本クラスのメソッド"
        End Function
    End Class

    '''''''''''''''''''''''''''''''
    '派生クラスＡ（サブクラス）
    '''''''''''''''''''''''''''''''
    Public Class SubClassA
        Inherits SuperClass 'スーパークラスを継承

        'プロパティの定義・初期値の設定
        private _PSubClassA As String = "派生クラスＡのプロパティ"

        'アクセサの定義
        Public Property PSubClassA() As String
            Get
                PSubClassA = _PSubClassA
            End Get
            Set(ByVal _newValue As String)
                _PSubClassA = _newValue
            End Set
        End Property

        'メソッドの定義
        Public Function MSubClassA() As String
            return "派生クラスＡのメソッド"
        End Function
    End Class

    '''''''''''''''''''''''''''''''
    '派生クラスＢ（サブクラス）
    '''''''''''''''''''''''''''''''
    Public Class SubClassB
        Inherits SuperClass 'スーパークラスを継承

        'プロパティの定義・初期値の設定
        private _PSubClassB As String = "派生クラスＢのプロパティ"

        'アクセサの定義
        Public Property PSubClassB() As String
            Get
                PSubClassB = _PSubClassB
            End Get
            Set(ByVal _newValue As String)
                _PSubClassB = _newValue
            End Set
        End Property

        'メソッドの定義
        Public Function MSubClassB() As String
            return "派生クラスＢのメソッド"
        End Function
    End Class
End Module
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.0.1  
作成者：Takashi Nishimura  
作成日：2017年06月26日


<a name="名前空間"></a>
# <b>名前空間</b>

### 書式
```
Namespace 名前空間名 '名前空間のネストも可能
    Class クラス名
        ......
    End Class
    ......
End Namespace
```

### 例文
```
'test.vb
'Imports SomeClass = MyLibrary.SomeClass '...として名前空間名を省略することも可能

Module test '名前（test）は任意
    Sub Main() '名前（Main）は決め打ち
        Dim _SomeClass AS New MyLibrary.SomeClass()
        _SomeClass.MethodA()
    End Sub

End Module

Namespace MyLibrary '名前空間のネストも可能
    Class SomeClass
        Public Sub MethodA()
            Console.WriteLine("MyLibraryのSomeClassのMethodAメソッド")
        End Sub
    End Class
End Namespace
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.0.1  
作成者：Takashi Nishimura  
作成日：2017年06月26日


<a name="継承と委譲"></a>
# <b>継承と委譲</b>

### 概要
* GoF デザインパターンの [Adapter パターン](http://bit.ly/2naab8x)等で利用される
* 継承の場合は <b>Inherits クラス名</b> を使い、委譲の場合は <b>New クラス名()</b> を使ってオブジェクトを生成し、他のクラスの機能を利用する

### 継承版
```
'test.vb
Module test '名前（test）は任意
    Sub Main() '名前（Main）は決め打ち
        Dim _ClassB AS New ClassB()
        _ClassB.MyMethod()
    End Sub

    ''''''''''''''''''''''''''''
    '基本クラス（スーパークラス）
    ''''''''''''''''''''''''''''
    Public Class ClassA
        'メソッド
        Public Sub MyMethod()
            Console.WriteLine("ClassA.MyMethod()")
        End Sub
    End Class

    ''''''''''''''''''''''''''''
    '派生クラス（サブクラス）
    ''''''''''''''''''''''''''''
    Public Class ClassB
        Inherits ClassA 'ClassAを継承
    End Class
End Module
```

### 委譲版
```
'test.vb
Module test '名前（test）は任意
    Sub Main() '名前（Main）は決め打ち
        Dim _ClassB AS New ClassB()
        _ClassB.MyMethod()
    End Sub

    ''''''''''''''''''''''''''''
    '基本クラス（スーパークラス）
    ''''''''''''''''''''''''''''
    Public Class ClassA
        'メソッド
        Public Sub MyMethod()
            Console.WriteLine("ClassA.MyMethod()")
        End Sub
    End Class

    ''''''''''''''''''''''''''''
    '派生クラス（サブクラス）
    ''''''''''''''''''''''''''''
    Public Class ClassB 'この内容だけが継承と異なる
        private _ClassA As ClassA

        'コンストラクタは省略可（初期値はここで設定してもよい）
        Public Sub New()
            _ClassA = new ClassA() 'コンストラクタでオブジェクト生成
        End Sub

        'メソッド
        Public Sub MyMethod()
            _ClassA.MyMethod()
        End Sub
    End Class
End Module
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.0.1  
作成者：Takashi Nishimura  
作成日：2017年06月26日


<a name="変数とスコープ"></a>
# <b>変数とスコープ</b>

### 変数の種類
1. Public 変数 : 全クラスからアクセス可能
1. Protected 変数 : 同じクラスおよび派生クラス内でのみアクセス可能
1. Private 変数 : 同じクラス内のみアクセス可能
1. ローカル変数 : メソッド内でのみアクセス可能（メソッド内で宣言したもの）
* その他「Friend」「Protected Friend」あり

###  Public 変数
* 特徴
    * 全クラスからアクセスが可能
    * クラス定義の直後、コンストラクタの直前に定義
    * 通常は Private 変数を利用し、アクセスには「Get / Set アクセサ」を使用する

* 悪い例
```
'test.vb
Module test '名前（test）は任意
    Sub Main() '名前（Main）は決め打ち
        Dim _someClass AS New SomeClass
        Console.WriteLine(_someClass._P) '=> Public変数
    End Sub

    Public Class SomeClass
        Public _P As String = "Public変数"
    End Class
End Module
```

### Protected 変数
* 特徴
    * 同じクラスおよび派生クラス内でのみアクセス可能
    * 基本クラス（スーパークラス）の定義の直後、コンストラクタの直前に定義

* 例文
```
'test.vb
Module test '名前（test）は任意
    Sub Main() '名前（Main）は決め打ち
        Dim _SubClass AS New SubClass
        'Console.WriteLine(_SubClass._PSuperClass) 'アクセス不可
    End Sub

    '基本クラス（スーパークラス）
    Public Class SuperClass
        Protected _PSuperClass As String = "SuperClass変数"
    End Class

    '派生クラス（サブクラス）
    Public Class SubClass
        Inherits SuperClass '基本クラスを継承
        Public Sub New() 'コンストラクタ
            Console.WriteLine(_PSuperClass) 'アクセス可能
        End Sub
    End Class
End Module
```

### Private 変数
* 特徴
    * 同じクラス内のみアクセス可能
    * クラス定義の直後、コンストラクタの直前に定義
    * 「他人の変数を勝手にいじってはいけない」というルールに則り、インスタンス変数は通常、Private 変数とし、外部からは「Get / Set アクセサ」を使ってアクセスする

* 例文
```
'test.vb
Module test '名前（test）は任意
    Sub Main() '名前（Main）は決め打ち
        Dim _SomeClass AS New SomeClass
        'Console.WriteLine(_SomeClass._P) 'error（アクセス不可）
        Console.WriteLine(_SomeClass.P) '=> Private変数
        _SomeClass.P = "hoge" '変更可能
        Console.WriteLine(_SomeClass.P) '=> hoge
    End Sub

    Public Class SomeClass
        Private _P As String = "Private変数"
        'アクセサの定義
        Public Property P() As String
            Get
                P = _P
            End Get
            Set(ByVal _newValue As String)
                _P = _newValue
            End Set
        End Property
    End Class
End Module
```

### ローカル変数
* 特徴
    * 「Dim 変数名 AS データ型」で宣言
    * 宣言したメソッド内でのみアクセス可能

* 例文
```
'test.vb
Module test '名前（test）は任意
    Sub Main() '名前（Main）は決め打ち
        Dim _SomeClass AS New SomeClass
        _SomeClass.MyMethod()

    End Sub

    Public Class SomeClass
        Private _I As Integer = 999 'Private変数

        'メソッドの定義
        Public Sub MyMethod()
            Dim _I As Integer 'ローカル変数宣言

            For _I = 0 TO 5
                Console.WriteLine(_I) '=> 0、1、2、....、5

                'Me/MyClass/MyBaseどれでもアクセス可能（ここでは通常はMe）
                Console.WriteLine(Me._I) '=> 999（Private変数）
                Console.WriteLine(MyClass._I) '=> 999（Private変数）
                Console.WriteLine(MyBase._I) '=> 999（Private変数）
            Next
            
            Console.WriteLine(_I) '=> 6（注意）
        End Sub
    End Class
End Module
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.0.1  
作成者：Takashi Nishimura  
作成日：2017年06月27日


<a name="アクセサ"></a>
# <b>アクセサ （Get / Set）</b>

```
'test.vb
Module test '名前（test）は任意
    Sub Main() '名前（Main）は決め打ち
        Dim _Nishimura AS New Nishimura
        'Console.WriteLine(_Nishimura._Age) 'error（アクセス不可）
        Console.WriteLine(_Nishimura.Age) '=> 49
        _Nishimura.Age = 50 '値を変更可能
        Console.WriteLine(_Nishimura.Age) '=> 50

    End Sub

    Public Class Nishimura
        Private _Age As Integer = 49

        'アクセサの定義
        Public Property Age() As Integer
            Get
                Age = _Age
            End Get
            Set(ByVal _newValue As Integer)
                _Age = _newValue
            End Set
        End Property
    End Class
End Module
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.0.1  
作成者：Takashi Nishimura  
作成日：2017年06月27日


<a name="演算子"></a>
# <b>演算子</b>

```
'test.vb
Module test '名前（test）は任意
    Sub Main() '名前（Main）は決め打ち
        Console.WriteLine(3 + 2) '=> 5 (可算) 
        Console.WriteLine(5 - 8) '=> -3 (減算)
        Console.WriteLine(3 * 4) '=> 12 (乗算)
        Console.WriteLine(1 + 2 * 3 - 4 / 2) '=> 5 (複雑な計算)
        Console.WriteLine(63 Mod 60) '=> 3 (余剰)
        Console.WriteLine(8 / 3) '=> 2.66666666666667(除算)
        'インクリメント（++）やデクリメント（--）は存在しません（+=、-=はあり）
    End Sub
End Module
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.0.1  
作成者：Takashi Nishimura  
作成日：2017年06月27日


<a name="定数"></a>
# <b>定数</b>

### 通常の定数
```
'test.vb
Module test '名前（test）は任意
    Sub Main() '名前（Main）は決め打ち
        Const PI As Single = 3.141593 '定数の定義
        Console.WriteLine(PI)
        'PI = 3.14 'error（変更不可）
    End Sub
End Module
```

### 静的定数（クラス定数）
```
'test.vb
Module test '名前（test）は任意
    Sub Main() '名前（Main）は決め打ち
        Console.WriteLine(MyMath.PI) '=> 3.141593
        'MyMath.PI = 3.14 '変更不可
    End Sub

    Public Class MyMath
        Public Const PI As Single = 3.141593 '定数の定義
    End Class
End Module
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.0.1  
作成者：Takashi Nishimura  
作成日：2017年06月27日


<a name="メソッド"></a>
# <b>メソッド</b>

### Sub プロシージャ（戻り値がない）の基本構文
```
アクセス修飾子 Sub メソッド名(ByVal 引数① As 引数①の型[, ...])
    ......
End Sub
```

### Function プロシージャ（戻り値がある）の基本構文
```
アクセス修飾子 Function メソッド名(ByVal 引数① As 引数①の型[, ...]) As 戻り値の型
    ......
    return 戻り値
End Function
```

### アクセス修飾子
1. Public : 全クラスからアクセス可能
1. Protected : 同じクラスおよび派生クラス内でのみアクセス可能
1. Private : 同じクラス内のみアクセス可能
* Shared : 静的メソッド＝クラスメソッド  

### 基本例文
```
'test.vb
Module test '名前（test）は任意
    Sub Main() '名前（Main）は決め打ち
        Dim _SomeClass AS New SomeClass
        Console.WriteLine(_SomeClass.Tashizan(1,10)) '=> 55
        Console.WriteLine(_SomeClass.Tashizan(1,100)) '=> 5050
    End Sub

    Public Class SomeClass
        '○〜○までの値を足した合計を返す
        Public Function Tashizan(ByVal _Start As Integer, ByVal _End As Integer) As Integer
            Dim _Result As Integer 'ローカル変数宣言
            Dim _I As Integer 'カウンタ変数（ローカル変数）
            For _I = _Start To _End
                _Result += _I
            Next
            return _Result
        End Function
    End Class
End Module
```

### Main()メソッド
```
'test.vb
Module test '名前（test）は任意
    Sub Main() '自動的に最初に実行される
        MyMethod()
    End Sub

    'メソッドの定義
    Public Sub MyMethod()
        Console.WriteLine("MyMethod()")
    End Sub
End Module
```

### コンストラクタ
```
'test.vb
Module test '名前（test）は任意
    Sub Main() '自動的に最初に実行される
        Dim _Point As New Point(100,150) 'ここでコンストラクタを呼び出す
        Console.WriteLine(_Point.X) '=> 100
        Console.WriteLine(_Point.Y) '=> 150
    End Sub

    Public Class Point
        Private _X As Integer, _Y As Integer
        
        'コンストラクタ
        Public Sub New(ByVal _X As Integer, ByVal _Y As Integer)
            Me._X = _X
            Me._Y = _Y
        End Sub

        'アクセサの定義
        Public Property X() As Integer
            Get
                X = _X
            End Get
            Set(ByVal _newValue As Integer)
                _X = _newValue
            End Set
        End Property

        Public Property Y() As Integer
            Get
                Y = _Y
            End Get
            Set(ByVal _newValue As Integer)
                _Y = _newValue
            End Set
        End Property
    End Class
End Module
```

### 静的メソッド（クラスメソッド）
```
'test.vb
Module test '名前（test）は任意
    Sub Main() '自動的に最初に実行される
        Console.WriteLine(Math.Pow(2,0)) '=> 1（2の0乗）
        Console.WriteLine(Math.Pow(2,1)) '=> 2（2の1乗）
        Console.WriteLine(Math.Pow(2,8)) '=> 256（2の8乗）
    End Sub

    Public Class Math
        '静的メソッド（クラスメソッド）
        Shared Function Pow(ByVal _Arg1 As Integer, ByVal _Arg2 As Integer) As Integer
            ' 0乗対策
            IF _Arg2 = 0 Then '「==」ではない（注意）
                return 1
            End IF

            Dim _Result As Integer = _Arg1 'ローカル変数
            Dim _I As Integer 'カウンタ変数（ローカル変数）
            For _I = 1 To _Arg2
                _Result *= _Arg1
            Next
            return _Result / _Arg1
        End Function
    End Class
End Module
```

### 可変長引数
* 引数を固定の数ではなく任意の数にすることが可能
```
'test.vb
Module test '名前（test）は任意
    Sub Main() '自動的に最初に実行される
        Dim _SomeClass As New SomeClass()
        Console.WriteLine(_SomeClass.Sum(1,1)) '=> 2（1+1）
        Console.WriteLine(_SomeClass.Sum(1,2,3,4,5)) '=> 15（1+2+3+4+5）
    End Sub

    Public Class SomeClass
        Public Function Sum(ByVal ParamArray _Args() As Integer) As Integer
            Dim _Result As Integer = 0
            For Each _Int As Integer In _Args 
                _Result = _Result + _Int 
            Next
            return _Result
        End Function
    End Class
End Module
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.0.1  
作成者：Takashi Nishimura  
作成日：2017年06月28日


<a name="デリゲート"></a>
# <b>デリゲート</b>

### 概要
* デリゲート（delegateg）とは「委譲」「代表者」「代理人」といった意味
* メソッドを呼び出す手法のひとつ
* 変数（デリゲート型）にメソッドを格納することが可能になる（入替え可能）
* 他の多くの言語で「匿名関数」「アロー関数」を使って行う処理と同等の処理が可能になる

### 例文
```
'test.vb
Imports System

Module test '名前（test）は任意
    Sub Main() '自動的に最初に実行される
        Dim _SomeClass As New SomeClass()
        Console.WriteLine(_SomeClass.MyFunction("こんにちは!")) '=> Ａさん、こんにちは!

        _SomeClass.Change("B") 'メソッドＢに入れ替える
        Console.WriteLine(_SomeClass.MyFunction("Hello!")) '=> Mr.B, Hello!

        _SomeClass.Change("A") '（再び）メソッドＡに入れ替える
        Console.WriteLine(_SomeClass.MyFunction("今晩は!")) '=> Ａさん、今晩は!
    End Sub

    Public Class SomeClass
        'デリゲート定義および、メソッドを格納するデリゲート用の変数の定義
        Public Delegate Function MyDelegate(ByVal _String As String) As String 
        Public MyFunction As MyDelegate 'メソッドを格納する変数（MyFunction）

        'コンストラクタ
        Public Sub New()
            MyFunction = New MyDelegate(AddressOf TypeA) 'デリゲートにメソッドを格納
        End Sub

        '外部からメソッドを入れ替えるためのメソッド（
        public Sub Change(ByVal _String As String)
            IF _String = "A" Then '==ではない（注意）
                MyFunction = New MyDelegate(AddressOf TypeA) 'メソッド（TypeA）に入替え
            ElseIF _String = "B" Then
                MyFunction = New MyDelegate(AddressOf TypeB) 'メソッド（TypeB）に入替え
            End If
        End Sub

        ''''''''''''''''''
        'タイプＡのメソッド
        ''''''''''''''''''
        Private Function TypeA(ByVal _String As String) As String
            return "Ａさん、" & _String
        End Function

        ''''''''''''''''''
        'タイプＢのメソッド
        ''''''''''''''''''
        Private Function TypeB(ByVal _String As String) As String
            return "Mr.Ｂ, " & _String
        End Function
    End Class
End Module
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.0.1  
作成者：Takashi Nishimura  
作成日：2017年06月29日


<a name="クラス定数･クラスメソッド"></a>
# <b>クラス定数･クラスメソッド</b>
* クラスをインスタンス化せずにアクセスが可能

```
' test.vb
Module test '名前（test）は任意
    Sub Main() '自動的に最初に実行される
        'クラス定数の参照
        Console.WriteLine(MyMath.PI) '=> 3.14159265358979

        'クラスメソッドの実行
        Console.WriteLine(MyMath.Pow(2,0)) '=> 1（2の0乗）
        Console.WriteLine(MyMath.Pow(2,1)) '=> 2（2の1乗）
        Console.WriteLine(MyMath.Pow(2,8)) '=> 256（2の8乗）
    End Sub

    Public Class MyMath
        '''''''''''''''''
        'クラス定数の定義
        '''''''''''''''''
        Public Const PI As Double = 3.14159265358979

        ''''''''''''''''''''''''''''''''''''
        'クラスメソッド（静的メソッド）の定義
        ''''''''''''''''''''''''''''''''''''
        Shared Function Pow(ByVal _Arg1 As Integer, ByVal _Arg2 As Integer) As Integer
            ' 0乗対策
            IF _Arg2 = 0 Then '「==」ではない（注意）
                return 1
            End IF

            Dim _Result As Integer = _Arg1 'ローカル変数
            Dim _I As Integer 'カウンタ変数（ローカル変数）
            For _I = 1 To _Arg2
                _Result *= _Arg1
            Next
            return _Result / _Arg1
        End Function
    End Class
End Module
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.0.1  
作成者：Takashi Nishimura  
作成日：2017年06月30日


<a name="If文"></a>
# <b>If 文</b>
* 他の多くの言語で使われる「==」は「=」と記述します（要注意）
* 他の多くの言語で使われる「!」は「Not」と記述します

### 基本例文
```
' test.vb
Module test '名前（test）は任意
    Sub Main() '自動的に最初に実行される
        Dim _Age As Integer = 49
        If _Age <= 20 Then
            Console.WriteLine("20歳以下")
        ElseIf _Age <=40 Then
            Console.WriteLine("21〜40歳")
        ElseIf _Age <=60 Then
            Console.WriteLine("41〜60歳") 'これが出力される
        Else
            Console.WriteLine("61歳以上")
        End If
    End Sub
End Module
```

### 論理積（AND）
1. 論理演算子（And）を使う方法
    ```
    If 条件式① And 条件② Then
        処理A ←条件式① かつ 条件式② の両方がTrueの場合に実行
    Else
        処理B
    End If
    ```

1. If のネストを使う方法
    ```
    If 条件式① Then
        If 条件② Then
            処理A ←条件式① かつ 条件式② の両方がTrueの場合に実行
        Else
            処理B
        End If
    Else
        処理B
    End If
    ```

### 論理和（OR）
1. 論理演算子（Or）を使う方法
    ```
    If 条件式① Or 条件② Then
        処理A ←条件式①または条件式②の両方がTrueの場合に実行
    Else
        処理B
    End If
    ```

2. If のネストを使う方法
    ```
    If 条件式① Then
        処理A ←条件式①がtrueの場合に実行
    ElseIf 条件② Then
        処理A ←条件式②がtrueの場合に実行
    Else
        処理B
    End If
    ```

### 排他的論理和（XOR）
1. Xor 演算子を使う方法
    ```
    ' test.vb
    Module test '名前（test）は任意
        Sub Main() '自動的に最初に実行される
            Dim _A As Boolean = True
            Dim _B As Boolean = False
            
            If _A Xor _B Then
                Console.WriteLine("どちらか一方だけTrueです")
            Else
                Console.WriteLine("両方共にTrueかFalseです")
            End If
        End Sub
    End Module
    ```

1. Xor 演算子を使わない方法
    ```
    ' test.vb
    Module test '名前（test）は任意
        Sub Main() '自動的に最初に実行される
            Dim _A As Boolean = True
            Dim _B As Boolean = False
            
            If (_A Or _B) And Not (_A And _B) Then
                Console.WriteLine("どちらか一方だけTrueです")
            Else
                Console.WriteLine("両方共にTrueかFalseです")
            End If
        End Sub
    End Module
    ```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.0.1  
作成者：Takashi Nishimura  
作成日：2017年06月30日


<a name="三項演算子"></a>
# <b>三項演算子</b>

### 構文
```
If(比較式, Trueの場合の返り値, Flaseの場合の返り値)
```

### 例文
```
' test.vb
Module test '名前（test）は任意
    Sub Main() '自動的に最初に実行される
        Dim _Age As Integer = 49
        Dim _Result As String
        _Result = If(_Age < 60, "現役", "退職") '三項演算子
        Console.WriteLine(_Result) '=> 現役
    End Sub
End Module
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.0.1  
作成者：Takashi Nishimura  
作成日：2017年07月01日


<a name="SelectCase文"></a>
# <b>Select Case 文</b>
* 他の多くの言語と異なりフォロースルーがありません（break 文なし）

### 基本サンプル
```
' test.vb
Module test '名前（test）は任意
    Sub Main() '自動的に最初に実行される
        Dim _Name As String = "TARO"
        Select Case _Name
            Case "TAKASHI"
                Console.WriteLine("父")
            Case "HANAKO"
                Console.WriteLine("母")
            Case "TARO"
                Console.WriteLine("長男") 'これが出力
            Case "JIRO"
                Console.WriteLine("次男")
            Case Else
                Console.WriteLine("家族以外")
        End Select
    End Sub
End Module
```

### 判別式に Boolean 型を使う
```
' test.vb
Module test '名前（test）は任意
    Sub Main() '自動的に最初に実行される
        Dim _Age As Integer = 49
        Select Case True
            Case _Age < 20
                Console.WriteLine("未成年")
            Case Else
                Console.WriteLine("成人") 'これが出力
        End Select
    End Sub
End Module
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.0.1  
作成者：Takashi Nishimura  
作成日：2017年07月02日


<a name="For文"></a>
# <b>For 文</b>

### ループカウンタ（ループ制御変数）の宣言位置
1. For 文の中で宣言
    ```
    ' test.vb
    Module test '名前（test）は任意
        Sub Main() '自動的に最初に実行される
            For I As Integer = 0 To 9 'ここでInteger型を宣言すると...
                Console.WriteLine(I) '=> 0,1,2,3,4,5,6,7,8,9
            Next
            Console.WriteLine(I) 'error（For文の外では使用不可）
        End Sub
    End Module
    ```

1. For 文の外でループ制御変数を宣言する
    ```
    ' test.vb
    Module test '名前（test）は任意
        Sub Main() '自動的に最初に実行される
            Dim I As Integer 'ここでInteger型を宣言すると...
            For I = 0 To 9
                Console.WriteLine(I) '=> 0,1,2,3,4,5,6,7,8,9
            Next
            Console.WriteLine(I) '=> 10（For文の外でも有効）
        End Sub
    End Module
    ```

### ループカウンタを○つずつアップする
```
' test.vb
Module test '名前（test）は任意
    Sub Main() '自動的に最初に実行される
        For I As Integer = 0 To 50 Step 5 '5つずつアップする場合...
            Console.WriteLine(I) '=> 0,5,10,15,20,25,30,35,40,45,50
        Next
    End Sub
End Module
```

### For 文のネスト
```
' test.vb
Module test '名前（test）は任意
    Sub Main() '自動的に最初に実行される
        For I As Integer = 1 To 5
            For J As Integer = 1 To 5
                Console.WriteLine("x" & I & "y" & J) '=> x1y1,x1y2,....,x5y4,x5y5
            Next
        Next
    End Sub
End Module
```

### 無限ループと Exit For 文
```
' test.vb
Module test '名前（test）は任意
    Sub Main() '自動的に最初に実行される
        Dim _Count As Integer = 0
        For I As Integer = 0 To 1 '無限ループにするために（力技）
            I -= 1 '無限ループにするために（力技）
            _Count += 1
            If _Count > 100 Then
                Exit For 'ループを終了
            End If
            Console.WriteLine(_Count) '=> 1,2,....,99,100
        Next
    End Sub
End Module
```

### For 文と Continue For 文
```
' test.vb
Module test '名前（test）は任意
    Sub Main() '自動的に最初に実行される
        For I As Integer = 1 To 20
            If (I Mod 3) <> 0 Then 
                Continue For 'For文の残処理をスキップしてFor文の次の反復を開始する
            End If
            Console.WriteLine(I) '=> 3,6,9,12,15,18（3の倍数）
        Next
    End Sub
End Module
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.0.1  
作成者：Takashi Nishimura  
作成日：2017年07月04日


<a name="ForEach文"></a>
# <b>For Each 文</b>

### 配列（1次元）の場合
```
' test.vb
Module test '名前（test）は任意
    Sub Main() '自動的に最初に実行される
        Dim _Array() As String = {"A","B","C","D"}
        For Each _Value As String In _Array
            Console.WriteLine(_Value) '=> "A"=>"B"=>"C"=>"D"
        Next
    End Sub
End Module
```

### 配列（2次元）の場合
```
' test.vb
Module test '名前（test）は任意
    Sub Main() '自動的に最初に実行される
        Dim _Array(,) As String = {{"x0y0","x1y0","x2y0"},{"x0y1","x1y1","x2y1"}}
        For Each _Value As String In _Array
            Console.WriteLine(_Value) '=>"x0y0"=>"x1y0"=>"x2y0"=>"x0y1"=>"x1y1"=>"x2y1"
        Next
    End Sub
End Module
```

### 配列（ジャグ配列）の場合
```
' test.vb
Module test '名前（test）は任意
    Sub Main() '自動的に最初に実行される
        'ジャグ配列
        Dim _Num As Integer = 3
        Dim _Array As String()() = New String(3)() {}
        _Array(0) = New String() {"A","あ"}
        _Array(1) = New String() {"I","い"}
        _Array(2) = New String() {"U","う"}

        For _Line As Integer = 0 To (_Num-1)
            For Each _Value As String In _Array(_Line)
                Console.WriteLine(_Value) '"A"=>"あ"、"I"=>"い"、"U"=>"う"
            Next
        Next
    End Sub
End Module
```

### 連想配列（Hashtable）の場合
```
' test.vb
Imports System.Collections 'Hashtableに必要

Module test '名前（test）は任意
    Sub Main() '自動的に最初に実行される
        Dim _Hash As New Hashtable()
        _Hash.Add("A", "あ")
        _Hash.Add("I", "い")
        
        For Each _Key As String In _Hash.Keys
            Console.WriteLine(_Key, _Hash(_Key)) '"A"=>"I"
            Console.WriteLine(_Hash(_Key)) '"あ"=>"い"
        Next
    End Sub
End Module
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.0.1  
作成者：Takashi Nishimura  
作成日：2017年07月04日


<a name="While文"></a>
# <b>While 文</b>

### While 文
```
' test.vb
Module test '名前（test）は任意
    Sub Main() '自動的に最初に実行される
        Dim _I As Integer = 0
        While _I < 10
            Console.WriteLine(_I) '=> 0,1,2,3,4,5,6,7,8,9
            _I += 1
        End While
        Console.WriteLine(_I) '=> 10（変数はまだ有効）
    End Sub
End Module
```

### Do...Loop 文
```
' test.vb
Module test '名前（test）は任意
    Sub Main() '自動的に最初に実行される
        Dim _I As Integer = 0
        Do
            Console.WriteLine(_I) '=> 0（ループ判定式はFalseだが１回実行される）
            _I += 1
        Loop While _I < 0
    End Sub
End Module
```

### While 文と Exit While 文
```
' test.vb
Module test '名前（test）は任意
    Sub Main() '自動的に最初に実行される
        Dim _Count As Integer = 0
        While True 'ループ判別式をTrueにすると無限ループに
            _Count += 1
            If _Count > 100 Then
                Exit While 'ループを終了
            End If
            Console.WriteLine(_Count) '=> 1,2,....,99,100（1〜100までを出力）
        End While
    End Sub
End Module
```

### While 文と Continue While 文
```
' test.vb
Module test '名前（test）は任意
    Sub Main() '自動的に最初に実行される
        Dim _I As Integer = 1
        While _I <= 20
            If (_I Mod 3) <> 0 Then '3で割って余りが0ではない（＝3の倍数ではない）場合
                _I += 1
                Continue While 'While文の残処理をスキップしてWhile文の次の反復を開始する
            end If
            Console.WriteLine(_I) '=> 3,6,9,12,15,18（3の倍数を出力）
            _I += 1
        End While
    End Sub
End Module
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.0.1  
作成者：Takashi Nishimura  
作成日：2017年07月04日


<a name="配列"></a>
# <b>配列</b>
* C# では配列宣言後の要素数変更は不可

### １次元配列の作成
* 構文（他にも var キーワードを使ってデータ型を省略した定義も可能）
```
データ型[] 変数名 = new データ型[要素数];
データ型[] 変数名 = new データ型[]{要素①,要素②,...};
データ型[] 変数名 = {要素①,要素②,...}; //簡単
```

* 例文
```
dynamic[] _array1 = new dynamic[4]; //4つの空の要素（動的型）を持つ配列を作成
string[] _array2 = new string[]{"A","B","C","D"};
string[] _array3 = {"A","B","C","D"}; //簡単
```

### ２次元配列（四角配列）の作成
* 構文
```
データ型[,] 変数名 = new データ型[行数,列数]; //縦x横の空の要素を持つ２次元配列
データ型[,] 変数名 = {{1行目の配列},{2行目の配列},...};
```

1. new 演算子を使う方法（≒５行x４列のコインロッカー）
    ```
    //test.cs
    using System;
    class Test {
        static void Main() {
            string[,] _coinlocker = new string[5,4];
            _coinlocker[0,0] = "1083"; //0,0の値
            _coinlocker[0,1] = "7777"; //0,1の値
            _coinlocker[2,1] = "0135"; //2,1の値
            _coinlocker[4,3] = "1234"; //4,3の値
        }
    }
    ```

1. 配列リテラルを使う方法（≒５行x４列のコインロッカー）
    ```
    //test.cs
    using System;
    class Test {
        static void Main() {
            string[,] _coinlocker = 
            {{"1083","7777","",""}, //0行目
            {"","","",""},         //1行目
            {"","0135","",""},     //2行目
            {"","","",""},         //3行目
            {"","","","1234"}};    //4行目

            //確認
            Console.WriteLine(_coinlocker[0,0]); //"1083"
            Console.WriteLine(_coinlocker[0,1]); //"7777"
            Console.WriteLine(_coinlocker[2,1]); //"0135"
            Console.WriteLine(_coinlocker[4,3]); //"1234"
        }
    }
    ```

### 配列の配列（ジャグ配列）の作成
* 構文（それぞれの配列の長さは異なるものにできる）
```
①データ型[][] 変数名 = new データ型[要素数][];
②データ型[][] 変数名 = new データ型[][]{new データ型[]{配列①},...};
```

1. ジャグ配列の宣言→後で値を割り当てる方法
    ```
    //test.cs
    using System;
    class Test {
        static void Main() {
            dynamic[][] _array = new dynamic[4][];
            _array[0] = new dynamic[]{"A","あ","ア"}; //配列リテラルは不可
            _array[1] = new dynamic[]{"I","い","イ"};
            _array[2] = new dynamic[]{"U","う","ウ"};
            _array[3] = new dynamic[]{"E","え","エ"};
        }
    }
    ```

1. ジャグ配列の宣言と同時に値を割り当てる方法
    ```
    //test.cs
    using System;
    class Test {
        static void Main() {
            dynamic[][] _array = new dynamic[][]{
            new dynamic[]{"A","あ","ア"},
            new dynamic[]{"I","い","イ"},
            new dynamic[]{"U","う","ウ"},
            new dynamic[]{"E","え","エ"}
            };
            foreach (dynamic[] theArray in _array) { //確認 (コマンドライン版の例）
                foreach (object theValue in theArray) {
                    Console.WriteLine(theValue);
                }
            }
        }
    }
    ```

### 配列の Length プロパティ
```
//test.cs
using System;
class Test {
    static void Main() {
        string[] _array = {"A","B","C","D"};
        for (int i=0; i<_array.Length; i++) { //配列の要素の数
            Console.WriteLine(_array[i]);
        }
    }
}
```

### 文字列→配列
```
//test.cs
using System;
class Test {
    static void Main() {
        string _string = "A,B,C,D"; //「,」区切りの文字列
        string[] _array = _string.Split(','); //「,」区切りで分割して配列化
        foreach (string value in _array) {
            Console.WriteLine(value); //"A"→"B"→"C"→"D"
        }
    }
}
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.0.1  
作成者：Takashi Nishimura  
作成日：2017年07月XX日


<a name="動的配列（List）"></a>
# <b>動的配列（List）</b>

### 概要
* 配列と異なり List は要素の数を変更したり追加･削除などが可能
* 動的配列（ArrayList）の.NET framework 2.0 対応版

### 作成
* 構文
```
List<データ型> 変数名 = new List<データ型>(); //空のListを作成
List<データ型> 変数名 = new List<データ型>(数); //指定数の空の要素を持つList作成
List<データ型> 変数名 = new List<データ型>() { 要素①,要素②,... };
```
* 例文
```
//test.cs
using System;
using System.Collections.Generic; //Listに必要
class Test {
    static void Main() {
        List<string> _list = new List<string>() { "A", "B" };
        foreach (object value in _list) {
            Console.WriteLine(value); //"A"→"B"
        }
    }
}
```

### 追加（最後）
* 構文
```
List.Add(値); //値はobject型（文字型、数値型等）で混在不可（dynamic型は除く）
```
* 例文
```
//test.cs
using System;
using System.Collections.Generic; //Listに必要
class Test {
    static void Main() {
        //空 → "A" → "A","B"
        List<string> _list = new List<string>();
        _list.Add("A");
        _list.Add("B");
        foreach (object value in _list) {
            Console.WriteLine(value); //"A"→"B"
        }
    }
}
```

### 追加（指定位置）
* 構文
```
List.Insert(インデックス番号,値); //先頭（0）〜最後（List.Capacity-1）まで指定可能
```
* 例文
```
//test.cs
using System;
using System.Collections.Generic; //Listに必要
class Test {
    static void Main() {
        //"A","B" → "C","A","B"
        List<string> _list = new List<string>() { "A", "B" };
        _list.Insert(0,"C"); //先頭に追加する場合は0
        foreach (object value in _list) {
            Console.WriteLine(value); //"C"→"A"→"B"
        }
    }
}
```

### 更新（任意の値）
* 構文
```
List[インデックス番号] = 値;
```
* 例文
```
//test.cs
using System;
using System.Collections.Generic; //Listに必要
class Test {
    static void Main() {
        //"A","B" → "C","B"
        List<string> _list = new List<string>() { "A", "B" };
        _list[0] = "C"; //0番目を変更する場合
        foreach (object value in _list) {
            Console.WriteLine(value); //"C"→"B"
        }
    }
}
```

###更新（null型）
* 構文
```
List[インデックス番号] = null;
```
* 例文
```
//test.cs
using System;
using System.Collections.Generic; //Listに必要
class Test {
    static void Main() {
        //"A","B","C" → "A","B",null
        List<string> _list = new List<string>() { "A", "B", "C" };
        _list[2] = null;
        foreach (object value in _list) {
            Console.WriteLine(value); // "A"→"B"→（null）
        }
    }
}
```

### 削除（指定のオブジェクト）
* 構文
```
List.Remove(object); //最初に見つかった指定のオブジェクトを削除
```
* 例文
```
//test.cs
using System;
using System.Collections.Generic; //Listに必要
class Test {
    static void Main() {
        //"A","B","C" → "A","C"
        List<string> _list = new List<string>() { "A", "B", "C" };
        _list.Remove("B");
        foreach (object value in _list) {
            Console.WriteLine(value); // "A"→"C"
        }
    }
}
```

### 削除（指定のインデックス）
* 構文
```
List.RemoveAt(インデックス番号); //先頭（0）〜最後（List.Capacity-1）まで指定可能
```
* 例文
```
//test.cs
using System;
using System.Collections.Generic; //Listに必要
class Test {
    static void Main() {
        //"A","B","C" → "B","C"
        List<string> _list = new List<string>() { "A", "B", "C" };
        _list.RemoveAt(0); //先頭を削除する場合
        //_list.RemoveAt(_list.Capacity-1); //最後を削除する場合
        foreach (object value in _list) {
            Console.WriteLine(value); // "B"→"C"
        }
    }
}
```

### 削除（○番目から□個）
* 構文
```
List.RemoveRange(開始, 削除する個数); //開始＝削除開始したいインデックス番号
List.RemoveRange(開始, List.Capacity-開始); //○番目から最後まで削除
List.Clear(); //全て削除
```
* 例文
```
//test.cs
using System;
using System.Collections.Generic; //Listに必要
class Test {
    static void Main() {
        //"A","B","C","D" → "A","B"
        List<string> _list = new List<string>() { "A", "B", "C", "D"};
        _list.RemoveRange(2, 2); //2番目から2個削除
        //]_list.RemoveRange(1, _list.Capacity-1); //1番目〜最後を削除する場合
        //_list.Clear(); //全て削除する場合
        foreach (object value in _list) {
            Console.WriteLine(value); // "A"→"B"
        }
    }
}
```

### 抽出（○番目から□個）
* 構文
```
List.GetRange(開始, 抜き出す個数); //開始＝抜出しを開始したいインデックス番号
```
* 例文
```
//test.cs
using System;
using System.Collections.Generic; //Listに必要
class Test {
    static void Main() {
        //"A","B","C","D" → "C","D"を返す
        List<string> _list = new List<string>() { "A", "B", "C", "D"};
        List<string> _result = _list.GetRange(2, 2); //2番目から2個抽出する場合
        //List<string> _result = _list.GetRange(1, _list.Capacity-1);//1番目〜最後を抽出
        foreach (object value in _result) {
            Console.WriteLine(value); // "C"→"D"
        }
    }
}
```

### 検索(前から）
* 構文
```
List.IndexOf(object [,検索開始するインデックス番号]);
//最初に見つかったインデックス番号を返す（無い場合-1）
//第2引数を省略すると最初（0）から検索
```
* 例文
```
//test.cs
using System;
using System.Collections.Generic; //Listに必要
class Test {
    static void Main() {
        List<string> _list = new List<string>() { "A", "B", "C", "D"};
        Console.WriteLine(_list.IndexOf("C",0)); //2
        //最初から検索する場合（第2引数が0の場合は省略可能）
    }
}
```

### 検索（後ろから）
* 構文
```
List.LastIndexOf(object [,検索開始するインデックス番号]);
//最後に見つかったインデックス番号を返す（無い場合-1）
//第2引数を省略すると最後（List.Capacity-1）から検索
```
* 例文
```
//test.cs
using System;
using System.Collections.Generic; //Listに必要
class Test {
    static void Main() {
        List<string> _list = new List<string>() { "A", "B", "C", "D"};
        Console.WriteLine(_list.LastIndexOf("C")); //2
        //最初から検索する場合（第2引数が0の場合は省略可能）
    }
}
```

### 要素の数
* 構文
```
List.Count; //実際に格納されている要素の数
List.Capacity; //格納可能な要素の数
```
* 例文
```
//test.cs
using System;
using System.Collections.Generic; //Listに必要
class Test {
    static void Main() {
        //List<string> _list = new List<string>() { "A", "B", "C"};
        List<string> _list = new List<string>(3); //空のArrayListを作成
        Console.WriteLine(_list.Count); //0 ←実際に格納されている要素の数
        Console.WriteLine(_list.Capacity); //3 ←格納可能な要素の数
    }
}
```

### 並べ替え（反転）
```
//test.cs
using System;
using System.Collections.Generic; //Listに必要
class Test {
    static void Main() {
        List<string> _list = new List<string>() { "A", "B", "C", "D"};
        _list.Reverse();
        foreach (object value in _list) {
            Console.WriteLine(value); // "D"→"C"→"B"→"A"
        }
    }
}
```

### 並べ替え（ソート）
* 構文
```
List.Sort(); //引数で範囲や比較方法を指定することも可能
```
* 例文
```
//test.cs
using System;
using System.Collections.Generic; //Listに必要
class Test {
    static void Main() {
        //"C", "02", "A", "01", "03", "B" → "01", "02", "03", "A", "B", "C"
        List<string> _list = new List<string>() { "C", "02", "A", "01", "03", "B" };
        _list.Sort();
        foreach (object value in _list) {
            Console.WriteLine(value); // "01"→"02"→"03"→"A"→"B"→"C"
        }
    }
}
```

### 結合
* 構文
```
//test.cs
using System;
using System.Collections.Generic; //Listに必要
class Test {
    static void Main() {
        List<string> _list1 = new List<string>() { "A", "B", "C" };
        List<string> _list2 = new List<string>() { "D", "E", "F" };

        //_list1の末尾に_list2を結合
        _list1.AddRange(_list2);

        foreach (object value in _list1) {
            Console.WriteLine(value); // "A"→"B"→"C"→"D"→"E"→"F"
        }
    }
}
```

### 複製
```
//test.cs
using System;
using System.Collections.Generic; //Listに必要
class Test {
    static void Main() {
        List<string> _list = new List<string>() { "A", "B", "C" };
        List<string> _listCopy = new List<string>(_list); //簡易型コピー方法
        _list[0] = "X";
        Console.WriteLine(_list[0]); //"X"
        Console.WriteLine(_listCopy[0]); //"A（参照コピーではない）
    }
}
```

### 文字列→ List
```
//test.cs
using System;
using System.Collections.Generic; //Listに必要
class Test {
    static void Main() {
        string _string = "A,B,C,D"; //①元となる文字列
        string[] _array = _string.Split(','); //②文字列→配列に変換（「配列」参照）
        List<string> _list = new List<string>(); //③空のListを作成
        foreach (string _tmp in _array) { //データ型に注意
            _list.Add(_tmp); //④配列の要素を1つずつListに追加
        }

        //確認
        foreach (object value in _array) {
            Console.WriteLine(value); // "A"→"B"→"C"→"D"
        }
    }
}
```


### 全要素を取り出す
1. For Each 文を使う方法
    ```
    //test.cs
    using System;
    using System.Collections.Generic; //Listに必要
    class Test {
        static void Main() {
            List<string> _list = new List<string>() { "A", "B", "C" };

            //全要素を取り出す
            foreach (object value in _list) {
                Console.WriteLine(value); // "A"→"B"→"C"
            }
        }
    }
    ```

1. For 文を使う方法
    ```
    //test.cs
    using System;
    using System.Collections.Generic; //Listに必要
    class Test {
        static void Main() {
            List<string> _list = new List<string>() { "A", "B", "C" };

            //全要素を取り出す
            for (int i=0; i < _list.Count; i++) {
                Console.WriteLine(_list[i]); // "A"→"B"→"C"
            }
        }
    }
    ```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.0.1  
作成者：Takashi Nishimura  
作成日：2017年07月XX日


<a name="連想配列（Dictionary）"></a>
# <b>連想配列（Dictionary）</b>

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

実行環境：Ubuntu 16.04.2 LTS、Mono 4.0.1  
作成者：Takashi Nishimura  
作成日：2017年07月XX日


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

実行環境：Ubuntu 16.04.2 LTS、Mono 4.0.1  
作成者：Takashi Nishimura  
作成日：2017年07月XX日


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

実行環境：Ubuntu 16.04.2 LTS、Mono 4.0.1  
作成者：Takashi Nishimura  
作成日：2017年07月XX日


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

実行環境：Ubuntu 16.04.2 LTS、Mono 4.0.1  
作成者：Takashi Nishimura  
作成日：2017年07月XX日


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

実行環境：Ubuntu 16.04.2 LTS、Mono 4.0.1  
作成者：Takashi Nishimura  
作成日：2017年07月XX日


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

実行環境：Ubuntu 16.04.2 LTS、Mono 4.0.1  
作成者：Takashi Nishimura  
作成日：2017年07月XX日


<a name="baseキーワード"></a>
# <b>base キーワード</b>

### 概要
基本クラスに定義されたコンストラクタ（private 以外）は、派生クラスのコンストラクタが実行される直前に必ず実行される。その際、基本クラスのコンストラクタへ、派生クラスのコンストラクタから引数を渡すことがbaseを使うことで可能になる（≒ super）。base.メソッド() で基本クラスのメソッドを呼び出す事が可能（「[オーバーライド](#オーバーライド)」参照）。

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

実行環境：Ubuntu 16.04.2 LTS、Mono 4.0.1  
作成者：Takashi Nishimura  
作成日：2017年07月XX日


<a name="オーバーライド"></a>
# <b>オーバーライド</b>

### 概要
* 基本クラス（または抽象クラス）で定義したメソッドを、派生クラスで再定義することをオーバーライドと呼ぶ
* オーバーライドできるメソッドは、基本クラスの場合 virtual 、抽象クラスの場合 abstract キーワードが付加されたものに限る
* 基本クラスのメソッドを、オーバーライドによって拡張する場合などで、基本クラスのメソッドを呼び出したい場合は、base.メソッド名() を使用する（「[base キーワード](#baseキーワード)」参照）。

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

実行環境：Ubuntu 16.04.2 LTS、Mono 4.0.1  
作成者：Takashi Nishimura  
作成日：2017年07月XX日


<a name="カスタムイベント"></a>
# <b>カスタムイベント</b>

### 概要
イベントとは、あるアクションが発生したことを自動的に通知する仕組み。カスタムクラス内で何か処理をし終えた際、別のオブジェクトにそのことを知らせる場合に、このイベント機能を使用。イベントを設定したカスタムクラスからは、情報（イベント）を発信するだけ。情報を受けたいオブジェクトは、リスナーメソッドを準備して待ち受ける...。このことにより、カスタムクラスを汚さずに済む、というメリットが生まれる。C# に用意された event は、特殊なデリゲート（delegate）と言えるものです。デリゲートとの違いは、event 宣言した変数（イベント名）には、イベントハンドラ（≒リスナー関数）の追加（+=）または削除（-=）のみ可能ということ等。

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

実行環境：Ubuntu 16.04.2 LTS、Mono 4.0.1  
作成者：Takashi Nishimura  
作成日：2017年07月XX日


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
        //2つの値のアークタンジェント（逆タンジェント）。X、Y座標の角度をラジアン単位で返す
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

実行環境：Ubuntu 16.04.2 LTS、Mono 4.0.1  
作成者：Takashi Nishimura  
作成日：2017年07月XX日


<a name="乱数"></a>
# <b>乱数</b>
* システム時間を元に発生させているためFor文で同時に異なる乱数を発生できない

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

実行環境：Ubuntu 16.04.2 LTS、Mono 4.0.1  
作成者：Takashi Nishimura  
作成日：2017年07月XX日


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

実行環境：Ubuntu 16.04.2 LTS、Mono 4.0.1  
作成者：Takashi Nishimura  
作成日：2017年07月XX日


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

実行環境：Ubuntu 16.04.2 LTS、Mono 4.0.1  
作成者：Takashi Nishimura  
作成日：2017年07月XX日


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

実行環境：Ubuntu 16.04.2 LTS、Mono 4.0.1  
作成者：Takashi Nishimura  
作成日：2017年07月XX日


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
        //↓Shift-JISなどUTF-8以外の場合、第2引数で指定します。
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

実行環境：Ubuntu 16.04.2 LTS、Mono 4.0.1  
作成者：Takashi Nishimura  
作成日：2017年07月XX日