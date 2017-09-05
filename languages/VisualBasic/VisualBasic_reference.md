# <b>Visual Basic .NET 基礎文法</b>

### <b>INDEX</b>

* Hello,world! （[Linux](https:'github.com/TakashiNishimura/HelloWorld/blob/master/languages/VisualBasic/VisualBasic_linux.md) / [macOS](https:'github.com/TakashiNishimura/HelloWorld/blob/master/languages/TypeScript/TypeScript_mac.md) / [Windows](https:'github.com/TakashiNishimura/HelloWorld/blob/master/languages/TypeScript/TypeScript_win.md)）
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
* [配列](#配列)
* [動的配列（ArrayList）](#動的配列（ArrayList）)
* [連想配列（Hashtable）](#連想配列（Hashtable）)
* [Me](#Me)
* [文字列の操作](#文字列の操作)
* [正規表現](#正規表現)
* [インターフェース](#インターフェース)
* [抽象クラス（MustInherit）](#抽象クラス（MustInherit）)
* [MyBase キーワード](#MyBaseキーワード)
* [オーバーライド](#オーバーライド)
* [イベント](#イベント)
* [数学関数（Math）](#数学関数（Math）)
* [乱数](#乱数)
* [日時情報](#日時情報)
* [タイマー](#タイマー)
* [処理速度計測](#処理速度計測)
* [外部テキストの読み込み](#外部テキストの読み込み)
***


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
        Console.WriteLine(_byte) '=> 255
        Console.WriteLine(TypeName(_byte)) '=> Byte

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

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
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

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
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
            Return _width * _height
        End Function
    End Class
End Module
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
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
            Return "基本クラスのメソッド"
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
            Return "派生クラスＡのメソッド"
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
            Return "派生クラスＢのメソッド"
        End Function
    End Class
End Module
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
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

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
作成者：Takashi Nishimura  
作成日：2017年06月26日


<a name="継承と委譲"></a>
# <b>継承と委譲</b>

### 概要
* GoF デザインパターンの [Adapter パターン](http:'bit.ly/2naab8x)等で利用される
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

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
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
* 静的（クラス）変数の場合「アクセス修飾子 Shared 変数名 データ型」とする

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

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
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

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
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

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
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

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
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
    Return 戻り値
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
            Return _Result
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
                Return 1
            End IF

            Dim _Result As Integer = _Arg1 'ローカル変数
            Dim _I As Integer 'カウンタ変数（ローカル変数）
            For _I = 1 To _Arg2
                _Result *= _Arg1
            Next
            Return _Result / _Arg1
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
            Return _Result
        End Function
    End Class
End Module
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
作成者：Takashi Nishimura  
作成日：2017年06月28日


<a name="デリゲート"></a>
# <b>デリゲート</b>

### 概要
* 「匿名関数」「アロー関数」（他の多くの言語で可能）と同等の処理が可能になる
* デリゲート（delegateg）とは「委譲」「代表者」「代理人」といった意味
* メソッドを呼び出す手法のひとつ
* 変数（デリゲート型）にメソッドを格納することが可能になる（入替え可能）

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
        Public Sub Change(ByVal _String As String)
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
            Return "Ａさん、" & _String
        End Function

        ''''''''''''''''''
        'タイプＢのメソッド
        ''''''''''''''''''
        Private Function TypeB(ByVal _String As String) As String
            Return "Mr.Ｂ, " & _String
        End Function
    End Class
End Module
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
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
                Return 1
            End IF

            Dim _Result As Integer = _Arg1 'ローカル変数
            Dim _I As Integer 'カウンタ変数（ローカル変数）
            For _I = 1 To _Arg2
                _Result *= _Arg1
            Next
            Return _Result / _Arg1
        End Function
    End Class
End Module
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
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

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
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

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
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

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
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

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
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
        '作成
        Dim _Num As Integer = 3
        Dim _Array As String()() = New String(_Num)() {}
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

### 動的配列（ArrayList）の場合
```
' test.vb
Imports System.Collections 'ArrayListに必要

Module test '名前（test）は任意
    Sub Main() '自動的に最初に実行される
        Dim _Array As New ArrayList()
        _Array.Add("TAKASHI")
        _Array.Add("HAKANO")

        For Each _Value As String In _Array
            Console.WriteLine(_Value) '"TAKASHI"=>"HANAKO"
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

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
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

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
作成者：Takashi Nishimura  
作成日：2017年07月04日


<a name="配列"></a>
# <b>配列</b>
* Visual Basic .NET では配列宣言後の要素数の変更は不可

### １次元配列
```
' test.vb
Module test '名前（test）は任意
    Sub Main() '自動的に最初に実行される
        '作成
        Dim _Array() As String = {"A","B","C","D"}
        
        'データの取得と変更
        Console.WriteLine(_Array(0)) '=> "A"
        _Array(0) = "あ" '変更
        Console.WriteLine(_Array(0)) '=> "あ"
    
        '全てのデータの取得
        For Each _Value As String In _Array
            Console.WriteLine(_Value) '=> "あ"=>"B"=>"C"=>"D"
        Next
    End Sub
End Module
```

### ２次元配列
```
' test.vb
Module test '名前（test）は任意
    Sub Main() '自動的に最初に実行される
        '作成
        Dim _Array(,) As String = {{"x0y0","x1y0","x2y0"},{"x0y1","x1y1","x2y1"}}

        'データの取得と変更
        Console.WriteLine(_Array(0,2)) '=> "x2y0"
        _Array(0,2) = "x02y00" '変更
        Console.WriteLine(_Array(0,2)) '=> "x02y00"

        '全てのデータの取得
        For Each _Value As String In _Array
            Console.WriteLine(_Value) '=>"x0y0"=>"x1y0"=>"x02y00"=>"x0y1"=>"x1y1"=>"x2y1"
        Next
    End Sub
End Module
```

### 配列の配列（ジャグ配列）の作成
* 構文（それぞれの配列の長さは異なるものにできる）
```
' test.vb
Module test '名前（test）は任意
    Sub Main() '自動的に最初に実行される
        '作成
        Dim _Num As Integer = 3
        Dim _Array As String()() = New String(_Num)() {}
        _Array(0) = New String() {"A","あ"}
        _Array(1) = New String() {"I","い"}
        _Array(2) = New String() {"U","う"}

        'データの取得と変更
        Console.WriteLine(_Array(0)(1)) '=> "あ"
        _Array(0)(1) = "ア"
        Console.WriteLine(_Array(0)(1)) '=> "ア"

        '全てのデータの取得
        For _Line As Integer = 0 To (_Num-1)
            For Each _Value As String In _Array(_Line)
                Console.WriteLine(_Value) '"A"=>"ア"、"I"=>"い"、"U"=>"う"
            Next
        Next
    End Sub
End Module
```

### 配列の Length プロパティ
```
' test.vb
Module test '名前（test）は任意
    Sub Main() '自動的に最初に実行される
        '作成
        Dim _Array() As String = {"A","B","C","D"}

        Console.WriteLine(_Array.Length) '=> 4

        For I As Integer = 0 To (_Array.Length-1)
            Console.WriteLine(_Array(I)) '"A"=>"B"=>"C"=>"D"
        Next
    End Sub
End Module
```

### 文字列→配列
```
' test.vb
Module test '名前（test）は任意
    Sub Main() '自動的に最初に実行される
        Dim _String As String = "A,B,C,D" '「,」区切りの文字列
        Dim _Array As String() = _String.Split(","c) '「,」区切りで分割して配列
        For Each _Value As String In _Array
            Console.WriteLine(_Value) '"A"=>"B"=>"C"=>"D"
        Next
    End Sub
End Module
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
作成者：Takashi Nishimura  
作成日：2017年07月04日


<a name="動的配列（ArrayList）"></a>
# <b>動的配列（ArrayList）</b>

### 概要
* 配列と異なり ArrayList は要素の数を変更したり追加･削除などが可能
* 動的配列には他に SortedList、Stack、Queue コレクションもあり

### 作成と追加（最後）
```
' test.vb
Imports System.Collections 'ArrayListに必要

Module test '名前（test）は任意
    Sub Main() '自動的に最初に実行される
        'ArrayListの宣言
        Dim _Array As New ArrayList()

        'データの追加
        _Array.Add("TAKASHI")
        _Array.Add("HAKANO")

        '全データの取得
        For Each _Value As String In _Array
            Console.WriteLine(_Value) '"TAKASHI"=>"HANAKO"
        Next
    End Sub
End Module
```

### 追加（指定位置）
```
' test.vb
Imports System.Collections 'ArrayListに必要

Module test '名前（test）は任意
    Sub Main() '自動的に最初に実行される
        Dim _Array As New ArrayList()
        _Array.Add("A")
        _Array.Add("B")
        _Array.Insert(0,"C") '先頭（0）〜最後（ArrayList.Count）まで指定可能
        Console.WriteLine(_Array.Count)
        For Each _Value As String In _Array
            Console.WriteLine(_Value) '"C"=>"A"=>"B"
        Next
    End Sub
End Module
```

### 更新（任意の値）
```
' test.vb
Imports System.Collections 'ArrayListに必要

Module test '名前（test）は任意
    Sub Main() '自動的に最初に実行される
        Dim _Array As New ArrayList()
        _Array.Add("A")
        _Array.Add("B")
        _Array(0) = "X" '要素番号0の値を変更
        Console.WriteLine(_Array.Count)
        For Each _Value As String In _Array
            Console.WriteLine(_Value) '"X"=>"B"
        Next
    End Sub
End Module
```

### 更新（Nothing）
```
' test.vb
Imports System.Collections 'ArrayListに必要

Module test '名前（test）は任意
    Sub Main() '自動的に最初に実行される
        Dim _Array As New ArrayList()
        _Array.Add("A")
        _Array.Add("B")
        _Array.Add("C")
        _Array(2) = Nothing 'C#の「null」相当
        For Each _Value As String In _Array
            Console.WriteLine(_Value) ' "A"=>"B"=>（Nothing）
        Next
    End Sub
End Module
```

### 削除（全て）
```
' test.vb
Imports System.Collections 'ArrayListに必要

Module test '名前（test）は任意
    Sub Main() '自動的に最初に実行される
        Dim _Array As New ArrayList()
        _Array.Clear() '全てのデータを削除
        Console.WriteLine(_Array.Count) '=> 0
    End Sub
End Module
```

### 削除（指定のデータ）
```
' test.vb
Imports System.Collections 'ArrayListに必要

Module test '名前（test）は任意
    Sub Main() '自動的に最初に実行される
        Dim _Array As New ArrayList()
        _Array.Add("A")
        _Array.Add("B")
        _Array.Add("C")
        _Array.Remove("B") '指定データを削除（最初の１個のみ）
        For Each _Value As String In _Array
            Console.WriteLine(_Value) '"A"=>"C"
        Next
    End Sub
End Module
```

### 削除（指定の要素番号）
```
' test.vb
Imports System.Collections 'ArrayListに必要

Module test '名前（test）は任意
    Sub Main() '自動的に最初に実行される
        Dim _Array As New ArrayList()
        _Array.Add("A")
        _Array.Add("B")
        _Array.Add("C")
        _Array.RemoveAt(0) '先頭を削除する場合は0
        '_Array.RemoveAt(_Array.Count-1) '最後を削除する場合
        For Each _Value As String In _Array
            Console.WriteLine(_Value) '"B"=>"C"
        Next
    End Sub
End Module
```

### 削除（○番目から□個）
```
' test.vb
Imports System.Collections 'ArrayListに必要

Module test '名前（test）は任意
    Sub Main() '自動的に最初に実行される
        Dim _Array As New ArrayList()
        _Array.Add("A")
        _Array.Add("B")
        _Array.Add("C")
        _Array.Add("D")
        _Array.RemoveRange(2, 2) '2番目から2個削除する場合
        For Each _Value As String In _Array
            Console.WriteLine(_Value) '"A"=>"B"
        Next
    End Sub
End Module
```

### 抽出（○番目から□個）
```
' test.vb
Imports System.Collections 'ArrayListに必要

Module test '名前（test）は任意
    Sub Main() '自動的に最初に実行される
        Dim _Array As New ArrayList()
        _Array.Add("A")
        _Array.Add("B")
        _Array.Add("C")
        _Array.Add("D")
        Dim _Result As New ArrayList = _Array.GetRange(2, 2) '2番目から2個抽出する場合
        For Each _Value As String In _Result
            Console.WriteLine(_Value) '"C"=>"D"
        Next
    End Sub
End Module
```

### 検索（前から）
```
' test.vb
Imports System.Collections 'ArrayListに必要

Module test '名前（test）は任意
    Sub Main() '自動的に最初に実行される
        Dim _Array As New ArrayList()
        _Array.Add("A")
        _Array.Add("B")
        _Array.Add("C")
        _Array.Add("D")
        Console.WriteLine(_Array.IndexOf("C",0)) '=> 2（見つからない場合-1）
        '最初から検索する場合（第2引数が0の場合は省略可能）
    End Sub
End Module
```

### 検索（後ろから）
```
' test.vb
Imports System.Collections 'ArrayListに必要

Module test '名前（test）は任意
    Sub Main() '自動的に最初に実行される
        Dim _Array As New ArrayList()
        _Array.Add("A")
        _Array.Add("B")
        _Array.Add("C")
        _Array.Add("D")
        Console.WriteLine(_Array.LastIndexOf("C")) '=> 2（見つからない場合-1）
    End Sub
End Module
```

### 要素の数
```
' test.vb
Imports System.Collections 'ArrayListに必要

Module test '名前（test）は任意
    Sub Main() '自動的に最初に実行される
        Dim _Array As New ArrayList()
        _Array.Add("A")
        _Array.Add("B")
        _Array.Add("C")
        Console.WriteLine(_Array.Count) '3 <=実際に格納されている要素の数
        Console.WriteLine(_Array.Capacity) '4 <=格納可能な要素の数
    End Sub
End Module
```

### 並べ替え（反転）
```
' test.vb
Imports System.Collections 'ArrayListに必要

Module test '名前（test）は任意
    Sub Main() '自動的に最初に実行される
        Dim _Array As New ArrayList()
        _Array.Add("A")
        _Array.Add("B")
        _Array.Add("C")
        _Array.Add("D")
        _Array.Reverse()
        For Each _Value As String In _Array
            Console.WriteLine(_Value) '"D"→"C"→"B"→"A"
        Next
    End Sub
End Module
```

### 並べ替え（ソート）
```
' test.vb
Imports System.Collections 'ArrayListに必要

Module test '名前（test）は任意
    Sub Main() '自動的に最初に実行される
        Dim _Array As New ArrayList()
        _Array.Add("C")
        _Array.Add("02")
        _Array.Add("A")
        _Array.Add("01")
        _Array.Add("03")
        _Array.Add("B")
        _Array.Sort() '並べ替える
        For Each _Value As String In _Array
            Console.WriteLine(_Value) '"01"→"02"→"03"→"A"→"B"→"C"
        Next
    End Sub
End Module
```

### 結合
```
' test.vb
Imports System.Collections 'ArrayListに必要

Module test '名前（test）は任意
    Sub Main() '自動的に最初に実行される
        Dim _Array1 As New ArrayList()
        _Array1.Add("A")
        _Array1.Add("B")
        _Array1.Add("C")

        Dim _Array2 As New ArrayList()
        _Array2.Add("D")
        _Array2.Add("E")
        _Array2.Add("F")

        _Array1.AddRange(_Array2) '_Array1の末尾に_Array2を結合
        
        For Each _Value As String In _Array1
            Console.WriteLine(_Value) '"A"→"B"→"C"→"D"→"E"→"F"
        Next
    End Sub
End Module
```

### 複製
```
' test.vb
Imports System.Collections 'ArrayListに必要

Module test '名前（test）は任意
    Sub Main() '自動的に最初に実行される
        Dim _Array As New ArrayList()
        _Array.Add("A")
        _Array.Add("B")
        _Array.Add("C")

        Dim _ArrayCopy As New ArrayList(_Array) '簡易型コピー方法

        _Array(0) = "X" 'データの一部を変更してみる

        Console.WriteLine(_Array(0)) '=> "X"
        Console.WriteLine(_ArrayCopy(0)) '=> "A"（変更なし＝参照コピーではない）
    End Sub
End Module
```

### 文字列→ ArrayList
```
' test.vb
Imports System.Collections 'ArrayListに必要

Module test '名前（test）は任意
    Sub Main() '自動的に最初に実行される
        '元となる文字列（「,」区切り）
        Dim _String As String = "A,B,C,D"

        '文字列→配列化
        Dim _Array As String() = _String.Split(","c) '「,」区切りで分割して配列化

        '配列→ArrayList化
        Dim _ArrayList As New ArrayList() '空のArrayListを作成
        For Each _Value As String In _Array
            _ArrayList.Add(_Value)
        Next

        '確認
        For Each _Value As String In _ArrayList
            Console.WriteLine(_Value) '"A"=>"B"=>"C"=>"D"
        Next
    End Sub
End Module
```

### 全要素を取り出す
1. For Each 文を使う方法
    ```
    ' test.vb
    Imports System.Collections 'ArrayListに必要

    Module test '名前（test）は任意
        Sub Main() '自動的に最初に実行される
            Dim _Array As New ArrayList()
            _Array.Add("A")
            _Array.Add("B")
            _Array.Add("C")

            For Each _Value As String In _Array
                Console.WriteLine(_Value) '"A"→"B"→"C"
            Next
        End Sub
    End Module
    ```

1. For 文を使う方法
    ```
    ' test.vb
    Imports System.Collections 'ArrayListに必要

    Module test '名前（test）は任意
        Sub Main() '自動的に最初に実行される
            Dim _Array As New ArrayList()
            _Array.Add("A")
            _Array.Add("B")
            _Array.Add("C")

            For I As Integer = 0 To (_Array.Count-1)
                Console.WriteLine(_Array(I)) '"A"→"B"→"C"
            Next
        End Sub
    End Module
    ```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
作成者：Takashi Nishimura  
作成日：2017年07月05日


<a name="連想配列（Hashtable）"></a>
# <b>連想配列（Hashtable）</b>

### 概要
* ディクショナリ、ハッシュとも呼ばれる「キー」と「値」の組み合わせを格納するデータ構造
* 匿名型クラスは、同様のデータ構造を持てるが読取り専用

### 基本例文
```
' test.vb
Imports System.Collections 'Hashtableに必要

Module test '名前（test）は任意
    Sub Main() '自動的に最初に実行される
        '①作成
        Dim _Hash As New Hashtable()

        '②追加
        _Hash.Add("A", "あ")
        _Hash.Add("I", "い")

        '③更新
        _Hash("A") = "ア"
        
        '④取得
        Console.WriteLine(_Hash("A")) '=> "ア"

        '全ての値の取得
        For Each _Key As String In _Hash.Keys
            Console.WriteLine(_Key, _Hash(_Key)) '"A"=>"I"
            Console.WriteLine(_Hash(_Key)) '"ア"=>"い"
        Next
    End Sub
End Module
```

### キー、値の検索
```
' test.vb
Imports System.Collections 'Hashtableに必要

Module test '名前（test）は任意
    Sub Main() '自動的に最初に実行される
        '作成
        Dim _Hash As New Hashtable()
        _Hash.Add("A", "あ")
        _Hash.Add("I", "い")
        _Hash.Add("U", "う")
        _Hash.Add("E", "え")
        _Hash.Add("O", "お")

        Console.WriteLine(_Hash.ContainsKey("B")) '任意のキーがあるか否か（True／False）
        Console.WriteLine(_Hash.ContainsValue("お")) '任意の値があるか否か（True／False）
    End Sub
End Module
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
作成者：Takashi Nishimura  
作成日：2017年07月05日


<a name="Me"></a>
# <b>Me</b>

### Me が必要な場合
1. 「引数」と「インスタンス変数」が同じ場合
1. 「ローカル変数」と「インスタンス変数」が同じ場合
* Me は、Me を記述したメソッドを所有するクラス（オブジェクト）を指す
* 「<b>Me</b>」と似た機能として「<b>MyClass</b>（オーバーライド時に利用）」「<b>MyBase</b>（継承元のクラス）」がある

### 例文
```
'test.vb
Module test '名前（test）は任意
    Sub Main() '名前（Main）は決め打ち
        Dim _Robot AS New Robot(500)
        _Robot.Move()
        Console.WriteLine(_Robot.X) '=> 510
        'Console.WriteLine(Me) '=> ERROR
    End Sub

    'カスタムクラス
    Public Class Robot
        Private _X As Integer 'インスタンス変数

        'コンストラクタは省略可（初期値はここで設定してもよい）
        Public Sub New(ByVal _X As Integer)
            Me._X = _X 'インスタンス変数へのアクセスには「Me」が必須
            Console.WriteLine(Me._X)
            Console.WriteLine(_X)
            Console.WriteLine(Me) '=> test+Robot（このメソッドが実行されたオブジェクト）
        End Sub

        'メソッドの定義
        Public Sub Move()
            Dim _X As Integer 'ローカル変数
            _X = Me._X + 10 'インスタンス変数へのアクセスには「Me」が必須
            If _X > 1920 Then
                _X = 0
            End If
            Me._X = _X
            Console.WriteLine(Me) '=> test+Robot（このメソッドが実行されたオブジェクト）
        End Sub

        'アクセサの定義
        Public Property X() As Integer
            Get
                X = Me._X 'Meは省略可能
            End Get
            Set(ByVal _newValue As Integer)
                Me._X = _newValue 'Meは省略可能
            End Set
        End Property
    End Class
End Module
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
作成者：Takashi Nishimura  
作成日：2017年07月05日


<a name="文字列の操作"></a>
# <b>文字列の操作</b>

### 長さを調べる
```
'test.vb
Module test '名前（test）は任意
    Sub Main() '名前（Main）は決め打ち
        Dim _String As String = "ABCDE"
        Console.WriteLine(_String.Length) '=> 5
    End Sub
End Module
```

### 一部分を取得
```
'test.vb
Module test '名前（test）は任意
    Sub Main() '名前（Main）は決め打ち
        Dim _String As String = "0123456789"
        Console.WriteLine(_String.Substring(4)) '=> "456789"
        Console.WriteLine(_String.Substring(4,1)) '=> "4"
        Console.WriteLine(_String.Substring(4,3)) '=> "456"
    End Sub
End Module
```

### 一部分を削除
```
'test.vb
Module test '名前（test）は任意
    Sub Main() '名前（Main）は決め打ち
        Dim _String As String = "にしむらたかし"
        Console.WriteLine(_String.Remove(0, 4)) '=> "たかし"
    End Sub
End Module
```

### 置換
```
'test.vb
Module test '名前（test）は任意
    Sub Main() '名前（Main）は決め打ち
        Dim _String As String = "2017年07月05日"
        Console.WriteLine(_String.Replace("2017年", "平成29年")) '=> "平成29年07月05日"
    End Sub
End Module
```

### 検索
```
'test.vb
Module test '名前（test）は任意
    Sub Main() '名前（Main）は決め打ち
        Dim _String As String = "ABCDEFG-ABCDEFG"
        Dim _Word As String = "CD"
        Dim _I As Integer = 0
        While _String.IndexOf(_Word, _I) <> -1 '見つからない場合「-1」
            Dim _Num As Integer = _String.IndexOf(_Word, _I)
            Console.WriteLine(_Num) '=> 2、10 ←"CD"が見つかった位置を出力
            Console.WriteLine(_String.Substring(_Num, _Word.Length)) '=> "CD"、"CD"
            _I = _Num + 1
        End While
    End Sub
End Module
```

### 文字列→配列
```
' test.vb
Module test '名前（test）は任意
    Sub Main() '自動的に最初に実行される
        Dim _String As String = "A,B,C,D" '「,」区切りの文字列
        Dim _Array As String() = _String.Split(","c) '「,」区切りで分割して配列
        For Each _Value As String In _Array
            Console.WriteLine(_Value) '"A"=>"B"=>"C"=>"D"
        Next
    End Sub
End Module
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
作成者：Takashi Nishimura  
作成日：2017年07月05日


<a name="正規表現"></a>
# <b>正規表現</b>

* Visual Basic .NET には以下のサンプル以外にも多くの正規表現の機能が用意されています

### マッチした数
```
' test.vb
Imports System.Text.RegularExpressions 'Regex.Matchesに必要

Module test '名前（test）は任意
    Sub Main() '自動的に最初に実行される
        Dim _String As String = "cabacbbacbcba"
        '"a"がいくつ含まれるか
        Dim _Match As MatchCollection = Regex.Matches(_String, "a")
        Console.WriteLine(_Match.Count) '=> 4
    End Sub
End Module
```

### パスワード
```
' test.vb
Imports System.Text.RegularExpressions 'Regex.Matchesに必要

Module test '名前（test）は任意
    Sub Main() '自動的に最初に実行される
        Dim _String As String = "U7eLoERa"
        
        '条件
        '① 8文字以上（全て半角）
        '② 1文字以上の「数字」を含む
        '③ 1文字以上の大文字および小文字の「英字」を含む
        Dim _Regex As Regex = New Regex("^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])\w{8,}$")
        Dim _Math As Match = _Regex.Match(_String)
        Console.WriteLine(_Math.Success) '=> True（パスワードとして条件に合致）
    End Sub
End Module
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
作成者：Takashi Nishimura  
作成日：2017年07月05日


<a name="インターフェース"></a>
# <b>インターフェース</b>
* インターフェースの多重継承も可能

```
'test.vb
Module test '名前（test）は任意
    Sub Main() '名前（Main）は決め打ち
        Dim _Moneybox AS New Moneybox()
        _Moneybox.Add(5000)
        Console.WriteLine(_Moneybox.Total) '=> 5000
    End Sub

    'インターフェースの宣言
    Public Interface IMoneybox
        Sub Add(ByVal _Money As Integer) '"Public"は記述しない
        Property Total() As Integer '"Public"は記述しない
    End Interface

    Public Class Moneybox
        Implements IMoneybox 'インターフェースの実装

        private _Total As Integer = 0

        Public Sub Add(ByVal _Money As Integer) Implements IMoneybox.Add 'インターフェースの実装
            _Total += _Money
        End Sub

        Public Property Total() As Integer Implements IMoneybox.Total 'インターフェースの実装
            Get
                Total = _Total
            End Get
            Set(ByVal _newValue As Integer)
                _Total = _newValue
            End Set
        End Property
    End Class
End Module
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
作成者：Takashi Nishimura  
作成日：2017年07月05日


<a name="抽象クラス（MustInherit）"></a>
# <b>抽象クラス（MustInherit）</b>

### 概要
* 派生クラスに"実装しなければならないメソッド"を抽象クラスで定義する
* 実際の処理は、抽象クラスを継承した派生クラスで、抽象メソッドを Overrides して記述

### 例文
```
'test.vb
Module test '名前（test）は任意
    Sub Main() '名前（Main）は決め打ち
        Dim _SomeClass AS New SomeClass()
        _SomeClass.MyMethod()
    End Sub

    '抽象クラスの定義
    Public MustInherit Class AbstractClass
        Public MustOverride Sub MyMethod() '抽象メソッド（MustOverrride"s"ではない）
    End Class

    Public Class SomeClass
        Inherits AbstractClass '抽象クラスの「継承」

        Public Overrides Sub MyMethod() 'オーバーライドして実際の処理を記述
            Console.WriteLine("SomeClass.MyMethod()") '実際の処理
        End Sub
    End Class
End Module
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
作成者：Takashi Nishimura  
作成日：2017年07月06日


<a name="MyBaseキーワード"></a>
# <b>MyBase キーワード</b>
* 他の多くの言語の「super」や C# の「base」と同等の機能

```
'test.vb
Module test '名前（test）は任意
    Sub Main() '名前（Main）は決め打ち
        Dim _Subclass AS New SubClass("from Main")
        '=> SubClass コンストラクタ: from Main
        '=> SuperClass コンストラクタ: from SubClass

        _Subclass.MethodSub("from Main")
        '=> SubClass メソッド: from Main
        '=> SuperClass メソッド: from SubClass
    End Sub

    '''''''''''''''''''''''''''
    '基本クラス（スーパークラス）
    '''''''''''''''''''''''''''
    Public Class SuperClass
        'コンストラクタ
        Public Sub New(ByVal _Arg As String)
            Console.WriteLine("SuperClass コンストラクタ: " & _Arg)
        End Sub

        'メソッド
        Public Sub MethodSuper(ByVal _Arg As String)
            Console.WriteLine("SuperClass メソッド: " & _Arg)
        End Sub
    End Class

    ''''''''''''''''''''''''
    '派生クラス（サブクラス）
    ''''''''''''''''''''''''
    Public Class SubClass
        Inherits SuperClass 'スーパークラスを継承

        'コンストラクタ
        Public Sub New(ByVal _Arg As String)
            Console.WriteLine("SubClass コンストラクタ: " & _Arg)
            MyBase.New("from SubClass") '基本クラスのコンストラクタの呼出し
        End Sub

        'メソッド
        Public Sub MethodSub(ByVal _Arg As String)
            Console.WriteLine("SubClass メソッド: " & _Arg)
            MyBase.MethodSuper("from SubClass") '基本クラスのメソッドの呼出しも可能
        End Sub
    End Class
End Module
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
作成者：Takashi Nishimura  
作成日：2017年07月06日


<a name="オーバーライド"></a>
# <b>オーバーライド</b>

### メソッドのオーバーライド

```
'test.vb
Module test '名前（test）は任意
    Sub Main() '名前（Main）は決め打ち
        Dim _SomeClass AS New SubClass()
        _SomeClass.MyMethod() '=> "SubClass.MyMethod()"
    End Sub

    '基本クラス
    Public Class SuperClass
        '構文: ○○ Overridable ○○ メソッド名(...
        Public Overridable Sub MyMethod()
            Console.WriteLine("SuperClass.MyMethod()")
        End Sub
    End Class

    '派生クラス
    Public Class SubClass
        Inherits SuperClass '基本クラスの「継承」

        '構文: ○○ Overrides ○○ メソッド名(...
        Public Overrides Sub MyMethod() 'オーバーライドして実際の処理を記述
            Console.WriteLine("SubClass.MyMethod()") '実際の処理
        End Sub
    End Class
End Module
```

### 抽象メソッドのオーバーライド
```
'test.vb
Module test '名前（test）は任意
    Sub Main() '名前（Main）は決め打ち
        Dim _SomeClass AS New SomeClass()
        _SomeClass.MyMethod()
    End Sub

    '抽象クラスの定義
    Public MustInherit Class AbstractClass
        '構文: ○○ MustOverride ○○ メソッド名(... ←MustOverrride"s"ではない
        Public MustOverride Sub MyMethod() '抽象メソッド
    End Class

    Public Class SomeClass
        Inherits AbstractClass '抽象クラスの「継承」

        '構文: ○○ Overrides ○○ メソッド名(...
        Public Overrides Sub MyMethod() 'オーバーライドして実際の処理を記述
            Console.WriteLine("SomeClass.MyMethod()") '実際の処理
        End Sub
    End Class
End Module
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
作成者：Takashi Nishimura  
作成日：2017年07月06日


<a name="イベント"></a>
# <b>イベント</b>

```
'test.vb
Module test '名前（test）は任意
    Sub Main()
        Dim _Robot As Robot = New Robot()
        AddHandler _Robot.DIE, AddressOf OnGameOver 'イベントリスナーの定義
        _Robot.Fight()
        _Robot.Fight()
        _Robot.Fight()
        _Robot.Fight() '=> "GAME OVER"
    End Sub

    'リスナー関数
    Sub OnGameOver(_Object As Object, _e As EventArgs)
        'Console.WriteLine(_Object) '=> test+Robot（Robotクラスのインスタンス）
        Console.WriteLine("GAME OVER")
    End Sub

    'イベントを設定するクラス
    Public Class Robot
        Public Event DIE As EventHandler 'イベントの宣言

        Private _Energy As Integer = 80

        Public Sub Fight()
            _Energy -= 20
            If _Energy <= 0 Then
                RaiseEvent DIE(Me) 'イベントの発生（リスナー関数の呼出し）
            End If
        End Sub
    End Class
End Module
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
作成者：Takashi Nishimura  
作成日：2017年07月06日


<a name="数学関数（Math）"></a>
# <b>数学関数（Math）</b>

### Math.Sin() : サイン（正弦）
```
'test.vb
Module test '名前（test）は任意
    Sub Main()
        Console.WriteLine(Math.Sin(0)) '=> 0 ←0°
        Console.WriteLine(Math.Sin(Math.PI/2)) '=> 1 ←90°
        Console.WriteLine(Math.Sin(Math.PI)) '=> 1.22460635382238E-16（≒0）←180°
        Console.WriteLine(Math.Sin(Math.PI*3/2)) '=> -1 ←270°
        Console.WriteLine(Math.Sin(Math.PI*2)) '=> -2.44921270764475E-16（≒0）←360°
    End Sub
End Module
```

### Math.Cos() : コサイン（余弦）
```
'test.vb
Module test '名前（test）は任意
    Sub Main()
        Console.WriteLine(Math.Cos(0)) '=> 1 ←0°
        Console.WriteLine(Math.Cos(Math.PI/2)) '=> 6.12303176911189E-17（≒0）←90°
        Console.WriteLine(Math.Cos(Math.PI)) '=> -1 ←180°
        Console.WriteLine(Math.Cos(Math.PI*3/2)) '=> -1.83690953073357E-16（≒0）←270°
        Console.WriteLine(Math.Cos(Math.PI*2)) '=> 1 ←360°
    End Sub
End Module
```

### Math.Atan2() : アークタンジェント2
```
'test.vb
Module test '名前（test）は任意
    Sub Main()
        '2つの値のアークタンジェント（逆タンジェント）。X、Y座標の角度をラジアン単位で返す
        'Πラジアン（3.141592…）は180°
        '三角形の各辺が1:2:√3の場合、2:√3の間の角度は30°であることを検証
        Dim _DisX As Double = Math.Sqrt(3) '=> √3のこと
        Dim _DisY As Integer = 1
        Console.WriteLine(Math.Atan2(_DisY, _DisX)) '=> 0.523598775598299（ラジアン）
        Console.WriteLine(180*Math.Atan2(_DisY, _DisX)/Math.PI) '=> 30（度）
    End Sub
End Module
```

### Math.PI : 円周率
```
'test.vb
Module test '名前（test）は任意
    Sub Main()
        Console.WriteLine(Math.PI) '=> 3.14159265358979（Math.PIラジアン=180°）
    End Sub
End Module
```

### Math.Floor() : 切り捨て
```
'test.vb
Module test '名前（test）は任意
    Sub Main()
        Console.WriteLine(Math.Floor(1.001)) '=> 1
        Console.WriteLine(Math.Floor(1.999)) '=> 1
    End Sub
End Module
```

### Math.Ceiling() : 切り上げ
```
'test.vb
Module test '名前（test）は任意
    Sub Main()
        Console.WriteLine(Math.Ceiling(1.001)) '=> 2
        Console.WriteLine(Math.Ceiling(1.999)) '=> 2
    End Sub
End Module
```

### Math.Round() : 四捨五入
```
'test.vb
Module test '名前（test）は任意
    Sub Main()
        Console.WriteLine(Math.Round(1.499)) '=> 1
        Console.WriteLine(Math.Round(1.500)) '=> 2
    End Sub
End Module
```

### Math.Abs() : 絶対値
```
'test.vb
Module test '名前（test）は任意
    Sub Main()
        Console.WriteLine(Math.Abs(100)) '=> 100
        Console.WriteLine(Math.Abs(-100)) '=> 100
    End Sub
End Module
```

### Math.Pow() : 累乗（○の□乗）
```
'test.vb
Module test '名前（test）は任意
    Sub Main()
        Console.WriteLine(Math.Pow(2, 0)) '=> 1（2の0乗）
        Console.WriteLine(Math.Pow(2, 8)) '=> 256（2の8乗）
    End Sub
End Module
```

### Math.Sqrt() : 平方根（√○）
```
'test.vb
Module test '名前（test）は任意
    Sub Main()
        Console.WriteLine(Math.Sqrt(2)) '=> 1.4142135623731（一夜一夜にひとみごろ）
        Console.WriteLine(Math.Sqrt(3)) '=> 1.73205080756888（人並みに奢れや）
        Console.WriteLine(Math.Sqrt(4)) '=> 2
        Console.WriteLine(Math.Sqrt(5)) '=> 2.23606797749979（富士山麓オウム鳴く）
    End Sub
End Module
```

### Math.Max() : 比較（最大値）
```
'test.vb
Module test '名前（test）は任意
    Sub Main()
        Console.WriteLine(Math.Max(5.01, -10)) '=> 5.01 ←「2つ」の数値の比較
    End Sub
End Module
```

### Math.Min() : 比較（最小値）
```
'test.vb
Module test '名前（test）は任意
    Sub Main()
        Console.WriteLine(Math.Min(5.01, -10)) '=> -10 ←「2つ」の数値の比較
    End Sub
End Module
```

### Math.Sign() : 符号（正か負の値か）
```
'test.vb
Module test '名前（test）は任意
    Sub Main()
        Console.WriteLine(Math.Sign(-0.1)) '=> -1（負の値）
        Console.WriteLine(Math.Sign(0)) '=> 0（0）
        Console.WriteLine(Math.Sign(0.1)) '=> 1（正の値）
    End Sub
End Module
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
作成者：Takashi Nishimura  
作成日：2017年07月07日


<a name="乱数"></a>
# <b>乱数</b>

```
'test.vb
Module test '名前（test）は任意
    Sub Main()
        Dim _Random As New Random()
        
        '0〜1.0までの乱数
        Console.WriteLine(_Random.NextDouble()) '=> 0.675613469758822
        Console.WriteLine(_Random.NextDouble()) '=> 0.0294376947122802
        Console.WriteLine(_Random.NextDouble()) '=> 0.747139839803399
        
        '整数値の乱数（百万〜数十億等）
        Console.WriteLine(_Random.Next()) '=> 465278074
        Console.WriteLine(_Random.Next()) '=> 945104086
        Console.WriteLine(_Random.Next()) '=> 425571283
        
        '任意の値までの整数値の乱数（整数）
        Console.WriteLine(_Random.Next(10)) '=> 9
        Console.WriteLine(_Random.Next(10)) '=> 2
        Console.WriteLine(_Random.Next(10)) '=> 5
    End Sub
End Module
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
作成者：Takashi Nishimura  
作成日：2017年07月07日


<a name="日時情報"></a>
# <b>日時情報</b>

### 書式
```
Dim ○ As DateTime = DateTime.Now
○.Year '=> 年（2017等）
○.Month '=> 月（1〜12）
○.Day '=> 日（1〜31）
○.DayOfYear '=> 元日から日数（1〜366）
○.DayOfWeek '=> 曜日（Sanday〜Saturday）
○.Hour '=> 時間（0〜23）
○.Minute '=> 分（0〜59）
○.Second '=> 秒（0〜59）
○.Millisecond '=> ミリ秒（0〜999）
○.Ticks '=> 0001年1月1日00:00:00からの経過時間（ナノ秒）：但し精度は10ミリ秒
```

### 例文
```
'test.vb
Module test '名前（test）は任意
    Sub Main()
        Dim _Now As DateTime = DateTime.Now
        Console.WriteLine(_Now) '=> 7/7/2017 9:15:36 AM
        Console.WriteLine(_Now.Year) '=> 2017
        Console.WriteLine(_Now.Month) '=> 7
        Console.WriteLine(_Now.Day) '=> 7
        Console.WriteLine(_Now.DayOfYear) '=> 188（元日からの日数）
        Console.WriteLine(_Now.DayOfWeek) '=> 5（日曜日は0）
        Console.WriteLine(_Now.Hour) '=> 9
        Console.WriteLine(_Now.Minute) '=> 15
        Console.WriteLine(_Now.Second) '=> 36
        Console.WriteLine(_Now.Millisecond) '=> 607
        Console.WriteLine(_Now.Ticks) '=> 636350157366073770（100ナノ秒単位）
        '"hh:mm:ss"で現在の時間を表示する方法
        Dim _H As String = If(_Now.Hour < 10, "0" & _Now.Hour, CStr(_Now.Hour))
        Dim _M As String = If(_Now.Minute < 10,"0" & _Now.Minute, CStr(_Now.Minute))
        Dim _S As String = If(_Now.Second < 10, "0" & _Now.Second, CStr(_Now.Second))
        Console.WriteLine(_H & ":" & _M & ":" & _S) '=> "09:15:36"
    End Sub
End Module
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
作成者：Takashi Nishimura  
作成日：2017年07月07日


<a name="タイマー"></a>
# <b>タイマー</b>

```
'test.vb
Imports System.Timers 'Timerに必要

Module test '名前（test）は任意
  Sub Main()
    Dim _Timer As Timer = New Timer(1000) 'タイマーの生成（1000ミリ秒毎）
    AddHandler _Timer.Elapsed, AddressOf MyFunction 'イベントハンドラの定義
    _Timer.Start() '開始
    Console.ReadLine() 'ここでは必須（要注意）
  End Sub

  Public Sub MyFunction(_TimerObject As Object, _E As ElapsedEventArgs) '1000ミリ秒毎に実行
    Console.WriteLine(_TimerObject) '=> System.Timers.Timer（タイマー本体）
    Console.WriteLine(_E) '=> System.Timers.ElapsedEventArgs（各種情報）
    '_TimerObject.Stop() '停止 ←この場合１回で停止
  End Sub
End Module
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
作成者：Takashi Nishimura  
作成日：2017年07月07日


<a name="処理速度計測"></a>
# <b>処理速度計測</b>

```
'test.vb
Imports System.Diagnostics 'Stopwatchに必要（.NET Framework 2.0から追加）

Module test '名前（test）は任意
  Sub Main()
    Dim _Stopwatch As Stopwatch = New Stopwatch() 'インスタンスの生成
    _Stopwatch.Start() '計測開始
    For I As Integer = 1 To 1000000000 '10億回繰り返す場合...
        '速度計測したい処理
    Next
    _Stopwatch.Stop()
    Console.WriteLine(_stopWatch.ElapsedMilliseconds) '=> 1701（ミリ秒）
    Console.WriteLine(_stopWatch.Elapsed) '=> 00:00:01.7017666（秒）
  End Sub
End Module

```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
作成者：Takashi Nishimura  
作成日：2017年07月07日


<a name="外部テキストの読み込み"></a>
# <b>外部テキストの読み込み</b>

### テキストファイルの用意（sample.txt/UTF-8として保存）
```
あいうえお
かきくけこ
さしすせそ
```

### 例文
```
'test.vb
Imports System.IO 'StreamReaderに必要

Module test '名前（test）は任意
  Sub Main()
    Dim _Path As String = "sample.txt"
    Dim _Stream As StreamReader = File.OpenText(_Path) '.txt以外も可能（UFT-8限定）
    Dim _String As String = _Stream.ReadToEnd() '全ての内容を読み込む
    _Stream.Close() '閉じる
    Console.WriteLine(_String) '結果を出力
  End Sub
End Module
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
作成者：Takashi Nishimura  
作成日：2017年07月07日