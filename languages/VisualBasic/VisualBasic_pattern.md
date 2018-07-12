# <b>Visual Basic .NET デザインパターン</b>

### <b>INDEX</b>

* オブジェクトの「生成」に関するパターン
    * [<ruby>Singleton<rt>シングルトン</rt></ruby>](#Singleton) : たった１つのインスタンス 
    * [<ruby>Prototype<rt>プロトタイプ</rt></ruby>](#Prototype) : コピーしてインスタンスを作る
    * [<ruby>Builder<rt>ビルダー</rt></ruby>](#Builder) : 複雑なインスタンスを組み立てる
    * [<ruby>Factory Method<rt>ファクトリー メソッド</rt></ruby>](#FactoryMethod) : インスタンスの作成をサブクラスにまかせる
    * [<ruby>Abstract Factory<rt>アブストラクト ファクトリー</rt></ruby>](#AbstractFactory) : 関連する部品を組み合わせて製品を作る

* プログラムの「構造」に関するパターン
    * [<ruby>Adapter<rt>アダプター</rt></ruby>（継承）](#Adapter（継承）) : 一皮かぶせて再利用
    * [<ruby>Adapter<rt>アダプター</rt></ruby>（委譲）](#Adapter（委譲）) : クラスによる Adapter パターン
    * [<ruby>Bridge<rt>ブリッジ</rt></ruby>](#Bridge) : 機能の階層と実装の階層を分ける
    * [<ruby>Composite<rt>コンポジット</rt></ruby>](#Composite) : 容器と中身の同一視
    * [<ruby>Decorator<rt>デコレータ</rt></ruby>](#Decorator) : 飾り枠と中身の同一視
    * [<ruby>Facade<rt>ファサード</rt></ruby>](#Facade) : シンプルな窓口
    * [<ruby>Flyweight<rt>フライウエイト</rt></ruby>](#Flyweight) : 同じものを共有して無駄をなくす
    * [<ruby>Proxy<rt>プロキシー</rt></ruby>](#Proxy) : 必要になってから作る

* オブジェクトの「振る舞い」に関するパターン
    * [<ruby>Iterator<rt>イテレータ</rt></ruby>](#Iterator) : １つ１つ数え上げる
    * [<ruby>Template Method<rt>テンプレート メソッド</rt></ruby>](#TemplateMethod) : 具体的な処理をサブクラスにまかせる
    * [<ruby>Strategy<rt>ストラテジー</rt></ruby>](#Strategy) : アルゴリズムをごっそり切り替える
    * [<ruby>Visitor<rt>ビジター</rt></ruby>](#Visitor) : 構造を渡り歩きながら仕事をする
    * [<ruby>Chain of Responsibility<rt>チェーン オブ レスポンシビリティ</rt></ruby>](#ChainofResponsibility) : 責任のたらいまわし
    * [<ruby>Mediator<rt>メディエイター</rt></ruby>](#Mediator) : 相手は相談役１人だけ
    * [<ruby>Observer<rt>オブザーバ</rt></ruby>](#Observer) : 状態の変化を通知する
    * [<ruby>Memento<rt>メメント</rt></ruby>](#Memento) : 状態を保存する
    * [<ruby>State<rt>ステート</rt></ruby>](#State) : 状態をクラスとして表現
    * [<ruby>Command<rt>コマンド</rt></ruby>](#Command) : 命令をクラスにする
    * [<ruby>Interpreter<rt>インタプリタ</rt></ruby>](#Interpreter) : 文法規則をクラスで表現する


<a name="Singleton"></a>
# <b><ruby>Singleton<rt>シングルトン</rt></ruby></b>

### 概要
* たった１つのインスタンス。一人っ子。
* クラスのインスタンスが絶対に１個しか存在しないことを保証し、そこに外部からアクセスする唯一の方法を提供するデザインパターン。
* 注意深くプログラミングして、New クラス名() を１回しか実行しないようにすれば良いわけですが、絶対にミスしないと保証することはできませんから…。

### 例文
```
'test.vb
Imports System.IO 'StreamReaderに必要

Module test '名前（test）は任意
    Sub Main()
        Dim _Singleton1 As Singleton = Singleton.GetInstance() '唯一のインスタンスを呼出す
        Dim _Singleton2 As Singleton = Singleton.GetInstance() '唯一のインスタンスを呼出す
        Console.WriteLine(_Singleton1.Equals(_Singleton2)) '=> True（同じインスタンス）
    End Sub

    ''''''''''''''''''
    'シングルトンクラス
    ''''''''''''''''''
    Public Class Singleton
        Private Shared _Singleton As New Singleton() '唯一のインスタンスを格納（静的変数）

        'コンストラクタ
        Private Sub New() '外部からNew Singleton()できないようにする
            Console.WriteLine("インスタンスを生成しました")
        End Sub

        '外部から唯一のインスタンスを呼出す
        Public Shared Function GetInstance() As Singleton
            Return _Singleton '唯一のインスタンス（静的変数）を返す
        End Function
    End Class
End Module
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
作成者：夢寐郎  
更新日：2017年07月07日


<a name="Prototype"></a>
# <b><ruby>Prototype<rt>プロトタイプ</rt></ruby></b>

### 概要
* コピーしてインスタンスを作る。原型。
* New クラス名() でインスタンスを生成するのではなく、インスタンスを複製（≠参照）して新しいインスタンスを作ります。

### ポイント
1. 複製には、インスタンス.Clone() を使う。
1. Clone() メソッド内では、New を使ってインスタンスを生成。そのインスタンスに複製元のプロパティをそのままコピーする。

### 例文
```
'test.vb
Module test '名前（test）は任意
    Sub Main() '名前（Main）は決め打ち
        Dim _MemberA AS New Prototype("鈴木一郎", "新宿区XX町X-X-X")
        Dim _MemberB = _MemberA.Clone() 'インスタンスをコピー（複製）
        _MemberB.Name = "鈴木花子" 'プロパティを変更
        Console.WriteLine(_MemberA.Name) '=> "鈴木一郎"
        Console.WriteLine(_MemberA.Address) '=> "新宿区XX町X-X-X"
        Console.WriteLine(_MemberB.Name) '=> "鈴木花子"
        Console.WriteLine(_MemberA.Address) '=> "新宿区XX町X-X-X"
    End Sub

    '派生クラス
    Public Class Prototype
        Private _Name As String
        Private _Address As String

        'コンストラクタ
        Public Sub New(ByVal _Name As String, ByVal _Address As String)
            Me._Name = _Name
            Me._Address = _Address
        End Sub

        'アクセサの定義
        Public Property Name() As String
            Get
                Name = _Name
            End Get
            Set(ByVal _newValue As String)
                _Name = _newValue
            End Set
        End Property

        Public Property Address() As String
            Get
                Address = _Address
            End Get
            Set(ByVal _newValue As String)
                _Address = _newValue
            End Set
        End Property

        'メソッドの定義
        Public Function Clone() As Prototype
            '自分自身（同じクラス）のインスタンスを生成
            Dim _Prototype As New Prototype(Me._Name, Me._Address)
            Return _Prototype
        End Function
    End Class
End Module
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
作成者：夢寐郎  
更新日：2017年07月09日


<a name="Builder"></a>
# <b><ruby>Builder<rt>ビルダー</rt></ruby></b>

### 概要
* 複雑なインスタンスを組み立てる。構築者。
* 複雑な構造を持ったものを一気に完成させるのではなく、段階を踏んで組み上げていきます。
* "手順"と"材料"を分けておき、"同じ手順"で異なるオブジェクトを生成させます。
* ポリモーフィズム（多態性）と委譲を活用したパターンです。
* "抽象クラス"（AbstractBuilder）ではなく"インターフェース"として記述する場合もあります。

### 例文
```
'test.vb
Imports System.IO 'StreamReaderに必要

Module test '名前（test）は任意
    Sub Main()
        '暑中御見舞
        Dim _SummerCard As New Director(NEw SummerCardBuilder())
        _SummerCard.Construct() '作成過程の実行
        '=> 暑中お見舞い申し上げます
        '=> スイカのイラスト
        '=> 盛夏

        '年賀状
        Dim _NewYearCard As New Director(New NewYearCardBuilder())
        _NewYearCard.Construct() '作成過程の実行
        '=> 明けましておめでとうございます
        '=> 干支のイラスト
        '=> 元旦
    End Sub

    '''''''''''''''''''''''
    'Builder役（抽象クラス）
    '''''''''''''''''''''''
    Public MustInherit Class AbstractBuilder
        '抽象メソッド（MustOverrride"s"ではない）
        Public MustOverride Sub MakeHeader()
        Public MustOverride Sub MakeContent()
        Public MustOverride Sub MakeFooter()
    End Class

    '''''''''''''''''''''''''''''
    ' ConcreateBuilder役＝制作者Ａ
    '''''''''''''''''''''''''''''
    Public Class SummerCardBuilder
        Inherits AbstractBuilder '抽象クラスの「継承」

        Public Overrides Sub MakeHeader() 'オーバーライドして実際の処理を記述
            Console.WriteLine("暑中お見舞い申し上げます")
        End Sub

        Public Overrides Sub MakeContent() 'オーバーライドして実際の処理を記述
            Console.WriteLine("スイカのイラスト")
        End Sub

        Public Overrides Sub MakeFooter() 'オーバーライドして実際の処理を記述
            Console.WriteLine("盛夏")
        End Sub
    End Class

    '''''''''''''''''''''''''''''
    ' ConcreateBuilder役＝制作者Ｂ
    '''''''''''''''''''''''''''''
    Public Class NewYearCardBuilder
        Inherits AbstractBuilder '抽象クラスの「継承」

        Public Overrides Sub MakeHeader() 'オーバーライドして実際の処理を記述
            Console.WriteLine("明けましておめでとうございます")
        End Sub

        Public Overrides Sub MakeContent() 'オーバーライドして実際の処理を記述
            Console.WriteLine("干支のイラスト")
        End Sub

        Public Overrides Sub MakeFooter() 'オーバーライドして実際の処理を記述
            Console.WriteLine("元旦")
        End Sub
    End Class

    ''''''''''''''''''''''''''''''''''''''''''
    ' Director役＝監督（作成手順を決め実行する）
    ''''''''''''''''''''''''''''''''''''''''''
    Public Class Director
        private _Builder As AbstractBuilder

        'コンストラクタ
        Public Sub New(ByVal _Builder As AbstractBuilder)
            Me._Builder = _Builder
        End Sub

        Public Sub Construct() '作成過程
            Me._Builder.MakeHeader()
            Me._Builder.MakeContent()
            Me._Builder.MakeFooter()
        End Sub
    End Class
End Module
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
作成者：夢寐郎  
更新日：2017年07月10日


<a name="FactoryMethod"></a>
# <b><ruby>Factory Method<rt>ファクトリー メソッド</rt></ruby></b>

### 概要
* インスタンス作成をサブクラスにまかせる。
* Factory とは「工場」、つまり工場メソッド。
* Template Method パターンの典型的な応用。
* インスタンスを生成する工場を、Template Method パターンで構成したもの。

### 例文
```
'test.vb
Module test '名前（test）は任意
    Sub Main() '名前（Main）は決め打ち
        '''''''''''''''
        ' Ichiroショップ
        '''''''''''''''
        Dim _CardShopIchiro AS New CardShopIchiro()
        Dim _IchiroSummerCard As AbstractCard = _CardShopIchiro.Order("暑中見舞い")
        _IchiroSummerCard.Print()
        '=> HAPPY SUMMER HOLIDAYS!
        '=> サーフィンのイラスト
        '=> 〒XXX-XXXX 新宿区XX町X-X-X

        Dim _IchiroNewYearCard As AbstractCard = _CardShopIchiro.Order("年賀状")
        _IchiroNewYearCard.Print()
        '=> HAPPY NEW YEAR!
        '=> 干支のイラスト
        '=> 〒XXX-XXXX 新宿区XX町X-X-X

        Dim _IchiroMourningCard As AbstractCard = _CardShopIchiro.Order("喪中はがき")
        _IchiroMourningCard.Print()
        '=> 喪中のため年頭のご挨拶をご遠慮申し上げます
        '=> 白黒のイラスト
        '=> 〒XXX-XXXX 新宿区XX町X-X-X

        ''''''''''''''''
        ' Hanakoショップ
        ''''''''''''''''
        Dim _CardShopHanako AS New CardShopHanako()
        Dim _HanakoSummerCard As AbstractCard = _CardShopHanako.Order("暑中見舞い")
        _HanakoSummerCard.Print()
        '=> 暑中お見舞い申し上げます
        '=> スイカのイラスト
        '=> 〒XXX-XXXX 新宿区XX町X-X-X

        Dim _HanakoNewYearCard As AbstractCard = _CardShopHanako.Order("年賀状")
        _HanakoNewYearCard.Print()
        '=> 明けましておめでとうございます
        '=> お餅のイラスト
        '=> 〒XXX-XXXX 新宿区XX町X-X-X
    End Sub

    ''''''''''''''''
    '抽象クラスの定義
    ''''''''''''''''
    Public MustInherit Class AbstracShop
        Public Function Order(ByVal _Type As String) As AbstractCard
            '↓「変化する部分」をカプセル化（汎用化にも寄与）
            Dim _Card As AbstractCard = FactoryMethod(_Type) 'ここで New しない
            '↓変化しない部分（一連の処理／具体的な処理内容は各カードのクラスまかせ）
            _Card.MakeHeader()
            _Card.MakeContent()
            _Card.MakeFooter()
            Return _Card
        End Function

        '抽象メソッド（MustOverrride"s"ではない）
        Public MustOverride Function FactoryMethod(ByVal _Type As String) As AbstractCard
    End Class

    '''''''''''''''''''''''''''''
    ' 抽象クラスを継承するクラスＡ
    '''''''''''''''''''''''''''''
    Public Class CardShopIchiro
        Inherits AbstracShop '抽象クラスの「継承」

        'オーバーライドして実際の処理を記述
        Public Overrides Function FactoryMethod(ByVal _Type As String) As AbstractCard
            Dim _Result As AbstractCard
            If _Type = "暑中見舞い" Then
                _Result = New IchiroSummerCard() 'ここでインスタンス化
            ElseIf _Type = "年賀状" Then
                _Result = New IchiroNewYearCard() 'ここでインスタンス化
            ElseIf _Type = "喪中はがき" Then
                _Result = New IchiroMourningCard() 'ここでインスタンス化
            End If
            Return _Result
        End Function
    End Class

    '''''''''''''''''''''''''''''
    ' 抽象クラスを継承するクラスＢ
    '''''''''''''''''''''''''''''
    Public Class CardShopHanako
        Inherits AbstracShop '抽象クラスの「継承」

        'オーバーライドして実際の処理を記述
        Public Overrides Function FactoryMethod(ByVal _Type As String) As AbstractCard
            Dim _Result As AbstractCard
            If _Type = "暑中見舞い" Then
                _Result = New HanakoSummerCard() 'ここでインスタンス化
            ElseIf _Type = "年賀状" Then
                _Result = New HanakoNewYearCard() 'ここでインスタンス化
            End If
            Return _Result
        End Function
    End Class

    '''''''''''''''''''
    '生成したいクラス群
    '''''''''''''''''''
    '抽象クラスの定義
    Public MustInherit Class AbstractCard
        Private _Footer As String
        Protected _Header As String
        Protected _Content As String

        '抽象メソッド（MustOverrride"s"ではない）
        Public MustOverride Sub MakeHeader()
        Public MustOverride Sub MakeContent()

        'メソッドの定義（共通）
        Public Sub MakeFooter()
            _Footer = "〒XXX-XXXX 新宿区XX町X-X-X"
        End Sub
        
        Public Sub Print()
            Console.WriteLine(_Header)
            Console.WriteLine(_Content)
            Console.WriteLine(_Footer)
        End Sub
    End Class

    ''''''''''''''''
    ' IchiroXXXXCard
    ''''''''''''''''
    Public Class IchiroSummerCard
        Inherits AbstractCard '抽象クラスの「継承」
        Public Overrides Sub MakeHeader() 'オーバーライドして実際の処理を記述
            _Header = "HAPPY SUMMER HOLIDAYS!"
        End Sub
        Public Overrides Sub MakeContent() 'オーバーライドして実際の処理を記述
            _Content = "サーフィンのイラスト"
        End Sub
    End Class

    Public Class IchiroNewYearCard
        Inherits AbstractCard '抽象クラスの「継承」
        Public Overrides Sub MakeHeader() 'オーバーライドして実際の処理を記述
            _Header = "HAPPY NEW YEAR!"
        End Sub
        Public Overrides Sub MakeContent() 'オーバーライドして実際の処理を記述
            _Content = "干支のイラスト"
        End Sub
    End Class

    Public Class IchiroMourningCard
        Inherits AbstractCard '抽象クラスの「継承」
        Public Overrides Sub MakeHeader() 'オーバーライドして実際の処理を記述
            _Header = "喪中のため年頭のご挨拶をご遠慮申し上げます"
        End Sub
        Public Overrides Sub MakeContent() 'オーバーライドして実際の処理を記述
            _Content = "白黒のイラスト"
        End Sub
    End Class

    ''''''''''''''''
    ' HanakoXXXXCard
    ''''''''''''''''
    Public Class HanakoSummerCard
        Inherits AbstractCard '抽象クラスの「継承」
        Public Overrides Sub MakeHeader() 'オーバーライドして実際の処理を記述
            _Header = "暑中お見舞い申し上げます"
        End Sub
        Public Overrides Sub MakeContent() 'オーバーライドして実際の処理を記述
            _Content = "スイカのイラスト"
        End Sub
    End Class

    Public Class HanakoNewYearCard
        Inherits AbstractCard '抽象クラスの「継承」
        Public Overrides Sub MakeHeader() 'オーバーライドして実際の処理を記述
            _Header = "明けましておめでとうございます"
        End Sub
        Public Overrides Sub MakeContent() 'オーバーライドして実際の処理を記述
            _Content = "お餅のイラスト"
        End Sub
    End Class
End Module
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
作成者：夢寐郎  
更新日：2017年07月14日


<a name="AbstractFactory"></a>
# <b><ruby>Abstract Factory<rt>アブストラクト ファクトリー</rt></ruby></b>

### 概要
* 関連する部品を組み合わせて製品を作る。
* Abstract は「抽象的な」、Factoryは「工場」の意味。
* Factory Method パターンに類似。クラスを作ってオブジェクトを生成する FactoryMethod に対し、AbstractFactory はオブジェクトを作ってオブジェクトを作成…。
* 生成を行うクラスの規格統一をしておく為に、抽象クラスを作ります。

### 例文
```
'test.vb
Module test '名前（test）は任意
    Sub Main() '名前（Main）は決め打ち
        ''''''''''''''''
        ' Ichiroショップ
        ''''''''''''''''
        Dim _Ichiro As AbstracShop = AbstracShop.GetShop("CardShopIchiro") '静的メソッドを使用

        _Ichiro.CreateSummerCard()
        '=> HAPPY SUMMER HOLIDAYS!
        '=> サーフィンのイラスト
        '=> 〒XXX-XXXX 新宿区XX町X-X-X

        _Ichiro.CreateNewYearCard()
        '=> HAPPY NEW YEAR!
        '=> 干支のイラスト
        '=> 〒XXX-XXXX 新宿区XX町X-X-X

        _Ichiro.CreateMourningCard()
        '=> 喪中のため年頭のご挨拶をご遠慮申し上げます
        '=> 白黒のイラスト
        '=> 〒XXX-XXXX 新宿区XX町X-X-X

        ''''''''''''''''
        ' Hanakoショップ
        ''''''''''''''''
        Dim _Hanako As AbstracShop = AbstracShop.GetShop("CardShopHanako") '静的メソッドを使用
        _Hanako.CreateSummerCard()
        '=> 暑中お見舞い申し上げます
        '=> スイカのイラスト
        '=> 〒XXX-XXXX 新宿区XX町X-X-X

        _Hanako.CreateNewYearCard()
        '=> 明けましておめでとうございます
        '=> 干支のイラスト
        '=> 〒XXX-XXXX 新宿区XX町X-X-X

        _Hanako.CreateMourningCard()
        '=> Error: 喪中はがきにはまだ対応しておりません
    End Sub

    ' カードショップ
    '''''''''''''''''''''''''''
    ' 抽象クラス（抽象的な工場）
    '''''''''''''''''''''''''''
    Public MustInherit Class AbstracShop 
        '''''''''''''
        '静的メソッド
        '''''''''''''
        Shared Function GetShop(ByVal _ClassName As String) As AbstracShop
            IF _ClassName = "CardShopIchiro" Then '「==」ではない（注意）
                Return New CardShopIchiro() 'ここでインスタンス化
            ElseIf _ClassName = "CardShopHanako" Then
                Return New CardShopHanako() 'ここでインスタンス化
            End IF
        End Function

        '抽象メソッド（MustOverrride"s"ではない）
        Public MustOverride Sub CreateSummerCard()
        Public MustOverride Sub createNewYearCard()
        Public MustOverride Sub createMourningCard()

        '共通の機能（オプション）
        Public Sub MakeFooter()
            Console.WriteLine("〒XXX-XXXX 新宿区XX町X-X-X")
        End Sub
    End Class

    '''''''''''''''''''''''''''''
    ' 抽象クラスを継承したクラスＡ
    '''''''''''''''''''''''''''''
    Public Class CardShopIchiro
        Inherits AbstracShop '抽象クラスの「継承」

        Public Overrides Sub CreateSummerCard() 'オーバーライドして実際の処理を記述
            Console.WriteLine("HAPPY SUMMER HOLIDAYS!")
            Console.WriteLine("サーフィンのイラスト")
            Me.MakeFooter()
        End Sub

        Public Overrides Sub createNewYearCard() 'オーバーライドして実際の処理を記述
            Console.WriteLine("HAPPY NEW YEAR!")
            Console.WriteLine("干支のイラスト")
            Me.MakeFooter()
        End Sub

        Public Overrides Sub createMourningCard() 'オーバーライドして実際の処理を記述
            Console.WriteLine("喪中のため年頭のご挨拶をご遠慮申し上げます")
            Console.WriteLine("白黒のイラスト")
            Me.MakeFooter()
        End Sub
    End Class


    '''''''''''''''''''''''''''''
    ' 抽象クラスを継承したクラスＢ
    '''''''''''''''''''''''''''''
    Public Class CardShopHanako
        Inherits AbstracShop '抽象クラスの「継承」

        Public Overrides Sub CreateSummerCard() 'オーバーライドして実際の処理を記述
            Console.WriteLine("暑中お見舞い申し上げます")
            Console.WriteLine("スイカのイラスト")
            Me.MakeFooter()
        End Sub

        Public Overrides Sub createNewYearCard() 'オーバーライドして実際の処理を記述
            Console.WriteLine("明けましておめでとうございます")
            Console.WriteLine("干支のイラスト")
            Me.MakeFooter()
        End Sub

        Public Overrides Sub createMourningCard() 'オーバーライドして実際の処理を記述
            Console.WriteLine("Error: 喪中はがきにはまだ対応しておりません")
        End Sub
    End Class
End Module
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
作成者：夢寐郎  
更新日：2017年07月18日


<a name="Adapter（継承）"></a>
# <b><ruby>Adapter<rt>アダプター</rt></ruby>（継承）</b>

### 概要
* 一皮かぶせて再利用。接続装置。
* 別名、Wrapper （ラッパー）パターン。クラスによる Adapter パターン。
* 継承を使って、オリジナルのクラスを拡張。

### 例文
```
'test.vb
Module test '名前（test）は任意
    Sub Main() '名前（Main）は決め打ち
        Dim _Exchange As Exchange = new Exchange(10000, 112.157918) '最初の貯金, レート
        _Exchange.AddYen(8000)
        Console.WriteLine(_Exchange.GetDollar()) '=> 160.488（ドル）
    End Sub

    ''''''''''''''''''''''''''''
    '基本クラス（スーパークラス）
    ''''''''''''''''''''''''''''
    Public Class Moneybox
        Private _Yen As Integer

        'コンストラクタ
        Public Sub New(ByVal _FirstYen As Integer)
            _Yen = _FirstYen
        End Sub

        'メソッド
        Public Sub AddYen(ByVal _Yen As Integer)
            Me._Yen += _Yen
        End Sub
        Public Function GetYen() As Integer
            Return _Yen
        End Function
    End Class

    ''''''''''''''''''''''''''''
    '派生クラス（サブクラス）
    ''''''''''''''''''''''''''''
    Public Class Exchange
        Inherits Moneybox 'Moneyboxを継承

        Private _Rate As Single

        'コンストラクタ
        Public Sub New(ByVal _FirstYen As Integer, ByVal _Rate As Single)
            MyBase.New(_FirstYen) '基本クラスのコンストラクタの呼出し
            Me._Rate = _Rate
        End Sub

        'メソッド
        Public Sub AddYen(ByVal _Yen As Integer)
            MyBase.AddYen(_Yen)
        End Sub
        Public Function GetDollar() As Single
            Return Me.GetYen() / _Rate
        End Function
    End Class
End Module
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
作成者：夢寐郎  
更新日：2017年07月18日


<a name="Adapter（委譲）"></a>
# <b><ruby>Adapter<rt>アダプター</rt></ruby>（委譲）</b>

```
'test.vb
Module test '名前（test）は任意
    Sub Main() '名前（Main）は決め打ち
        Dim _Exchange As Exchange = new Exchange(10000, 112.157918) '最初の貯金, レート
        _Exchange.AddYen(8000)
        Console.WriteLine(_Exchange.GetDollar()) '=> 160.488（ドル）
    End Sub

    ''''''''''''''''''''''''''''
    '基本クラス（スーパークラス）
    ''''''''''''''''''''''''''''
    Public Class Moneybox
        Private _Yen As Integer

        'コンストラクタ
        Public Sub New(ByVal _FirstYen As Integer)
            _Yen = _FirstYen
        End Sub

        'メソッド
        Public Sub AddYen(ByVal _Yen As Integer)
            Me._Yen += _Yen
        End Sub
        Public Function GetYen() As Integer
            Return _Yen
        End Function
    End Class

    '''''''''''''''''''''''''''''''''''''''''''''''''''
    '派生クラス（このクラスの内容のみ「継承」版と異なる）
    '''''''''''''''''''''''''''''''''''''''''''''''''''
    Public Class Exchange
        Inherits Moneybox 'Moneyboxを継承

        Private _MoneyBox As Moneybox
        Private _Rate As Single

        'コンストラクタ
        Public Sub New(ByVal _FirstYen As Integer, ByVal _Rate As Single)
            _MoneyBox = New Moneybox(_FirstYen) 'ポイント
            Me._Rate = _Rate
        End Sub

        'メソッド
        Public Sub AddYen(ByVal _Yen As Integer)
            _MoneyBox.AddYen(_Yen)
        End Sub
        Public Function GetDollar() As Single
            Return _MoneyBox.GetYen() / _Rate
        End Function
    End Class
End Module
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
作成者：夢寐郎  
更新日：2017年07月18日


<a name="Bridge"></a>
# <b><ruby>Bridge<rt>ブリッジ</rt></ruby></b>

### 概要
* 「機能」の階層と「実装」の階層を分ける。
* 例えば、Linux、Windows、MacOS を対象にした UI を実装する際、つい ① LinuxButton ② WindowsButton ③ MacOSButton の3つのクラスを作成してしまいがちですが、そうではなく ① Linux ② Windows ③ MacOS、そして④ Button の4つのクラスに分けて考えて作るのが、この Bridge パターンです。Bridge パターンを使うと、「新しい機能」や「新しい実装」を追加したい際、合理的です。
* 「機能」クラスと「実装」クラスの「橋」渡しには「委譲」を使います。

### 例文
```
'test.vb
Module test '名前（test）は任意
    Sub Main() '名前（Main）は決め打ち
        Dim _TabletA As New Tablet(New Android())
        Console.WriteLine(_TabletA.Version) '=> "Android 7.1.2 Nougat"
        _TabletA.BigScreen() '=> "大きな画面で見る"

        Dim _TabletB As New Tablet(New IOS())
        Console.WriteLine(_TabletB.Version) '=> "iOS 10.3.2"
        _TabletB.BigScreen() '=> "大きな画面で見る"

        Dim _SmartPhoneA As New SmartPhone(New Android())
        Console.WriteLine(_SmartPhoneA.Version) '=> "Android 7.1.2 Nougat"
        _SmartPhoneA.Phone() '=> "電話をかける"

        Dim _SmartPhoneB As New SmartPhone(New IOS())
        Console.WriteLine(_SmartPhoneB.Version) '=> "iOS 10.3.2"
        _SmartPhoneB.Phone() '=> "電話をかける"
    End Sub

    ''''''''''''''''''''''''''''''''
    '基本クラス（「機能クラス」関連）
    ''''''''''''''''''''''''''''''''
    Public Class SuperMobile 'スーパークラス
        Private _Os As AbstractOS

        'コンストラクタ
        Public Sub New(ByVal _Os As AbstractOS)
            '「機能クラス」と「実装クラス」の「橋」（委譲）
            Me._Os = _Os
        End Sub

        'アクセサの定義
        Public Property Version() As String
            Get
                '「橋」を使って「実装クラス」にアクセス
                Return _Os.Version
            End Get
            Set(ByVal _newValue As String)
                Console.WriteLine("Error: Versionは読み取り専用です")
            End Set
        End Property
    End Class

    Public Class Tablet 'サブクラス（タブレットクラス）
        Inherits SuperMobile

        'コンストラクタ
        Public Sub New(ByVal _Os As AbstractOS)
            MyBase.New(_Os) '基本クラスのコンストラクタの呼出し
        End Sub

        'メソッド（タブレット特有の機能）
        Public Sub BigScreen()
            Console.WriteLine("大きな画面で見る")
        End Sub
    End Class

    Public Class SmartPhone 'サブクラス（スマートフォンクラス）
        Inherits SuperMobile

        'コンストラクタ
        Public Sub New(ByVal _Os As AbstractOS)
            MyBase.New(_Os) '基本クラスのコンストラクタの呼出し
        End Sub

        'メソッド（スマートフォン特有の機能）
        Public Sub Phone()
            Console.WriteLine("電話をかける")
        End Sub
    End Class

    '''''''''''''''''''
    '「実装クラス」関連
    '''''''''''''''''''
    '抽象クラス
    Public MustInherit Class AbstractOS
        Public MustOverride Property Version() As String '抽象メソッド（MustOverrride"s"ではない）
    End Class

    'Androidクラス
    Public Class Android
        Inherits AbstractOS '抽象クラスの「継承」

        Private _Version As String

        'コンストラクタ
        Public Sub New()
            _Version = "Android 7.1.2 Nougat"
        End Sub

        'アクセサの定義（抽象メソッドの具体的な実装）
        Public Overrides Property Version() As String 'オーバーライド
            Get
                Return _Version
            End Get
            Set(ByVal _newValue As String)
                Console.WriteLine("Error: Versionは読み取り専用です")
            End Set
        End Property
    End Class

    'IOSクラス
    Public Class IOS
        Inherits AbstractOS '抽象クラスの「継承」

        Private _Version As String

        'コンストラクタ
        Public Sub New()
            _Version = "iOS 10.3.2"
        End Sub

        'アクセサの定義（抽象メソッドの具体的な実装）
        Public Overrides Property Version() As String 'オーバーライド
            Get
                '「橋」を使って「実装クラス」にアクセス
                Return _Version
            End Get
            Set(ByVal _newValue As String)
                Console.WriteLine("Error: Apple社外は操作不可!")
            End Set
        End Property
    End Class
End Module
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
作成者：夢寐郎  
更新日：2017年07月21日


<a name="Composite"></a>
# <b><ruby>Composite<rt>コンポジット</rt></ruby></b>

### 概要
* 容器と中身の同一視。合成物。
* 代表的な例はファイルシステム。ディレクトリとファイルは異なるものですが、どちらも「ディレクトリの中に入れることができるもの」です。つまり、同じ種類のものであると見なしている＝同一視です。
ディレクトリ（＝容器）とファイル（＝中身）の両方にとって、共通のインターフェースとして機能し「同じメソッド」を呼び出せるようにするのです。
* 以下のサンプルは root に Authoring フォルダを作成し、その中に Unity3D と Unreal Engine ファイルを格納してみます。

### 例文
```
'test.vb
Imports System.Collections 'ArrayListに必要

Module test '名前（test）は任意
    Sub Main() '名前（Main）は決め打ち
        '''''''''''''''''''''''''''''''''''''''''''''''''
        ' root に Authoring フォルダを作成し、その中に
        ' Unity3D と Unreal Engine ファイルを格納してみる
        '''''''''''''''''''''''''''''''''''''''''''''''''
        ' ①フォルダの作成
        Dim _Root As New Folder("root")
        Dim _Authoring As New Folder("Authoring")

        ' ②ファイルの作成
        Dim _Unity3D As New File("Unity3D")
        Dim _UnrealEngine As New File("Unreal Engine")

        ' ③関連付け
        _Root.add(_Authoring)
        _Authoring.add(_Unity3D)
        _Authoring.add(_UnrealEngine)

        ' ④検証
        Console.WriteLine(_UnrealEngine.Name) '=> "Unreal Engine"
        _Root.GetList() '=> "root/Authoring(Folder)"
        _Authoring.GetList() 
        '=> "Authoring/Unity3D(File)"
        '=> "Authoring/Unreal Engine(File)"
        _Unity3D.GetList() '=> "Authoring/Unity3D(File)"
    End Sub

    '''''''''''''
    ' Component役
    '''''''''''''
    Public MustInherit Class Component '抽象クラス
        Protected _Name As String
        Protected _Parent As Component

        'アクセサの定義
        Public Property Name() As String
            Get
                Name = _Name
            End Get
            Set(ByVal _newValue As String)
                _Name = _newValue
            End Set
        End Property

        Public Property Parent() As Component
            Get
                Parent = _Parent
            End Get
            Set(ByVal _newValue As Component)
                _Parent = _newValue
            End Set
        End Property
        
        '抽象メソッド
        Public MustOverride Sub GetList()
    End Class

    '''''''''''''''''''''''
    ' Composite（複合体）役
    '''''''''''''''''''''''
    Public Class Folder
        Inherits Component '抽象クラスの「継承」

        Private _Name As String
        Private _ChildList As New ArrayList() 'ArrayListの宣言

        Public Sub New(ByVal _Name As String) 'コンストラクタ
            MyBase._Name = _Name
        End Sub

        Public Sub Add(ByVal _Arg As Component)
            _ChildList.Add(_Arg)
            _Arg.Parent = Me
        End Sub

        Public Overrides Sub GetList() '抽象メソッドをオーバーライド
            Dim _TheList As New ArrayList = _ChildList

            For I As Integer = 0 To (_TheList.Count-1)
                Dim _Result As String = MyBase._Name & "/" & _TheList(I).Name
                If (TypeOf _TheList(I) IS Folder) Then
                    _Result = _Result & "(Folder)"
                Else
                    _Result = _Result & "(File)"
                End If
                Console.WriteLine(_Result)
            Next
        End Sub
    End Class

    ''''''''''''''
    ' Leaf（葉）役
    ''''''''''''''
    Public Class File
        Inherits Component '抽象クラスの「継承」

        Private _Name As String

        Public Sub New(ByVal _Name As String) 'コンストラクタ
            MyBase._Name = _Name
        End Sub

        Public Overrides Sub GetList() '抽象メソッドをオーバーライド
            Console.WriteLine(Parent.Name + "/" + Name + "(File)")
        End Sub
    End Class
End Module
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
作成者：夢寐郎  
更新日：2017年07月21日


<a name="Decorator"></a>
# <b><ruby>Decorator<rt>デコレータ</rt></ruby></b>

### 概要
* 飾り枠と中身の同一視。装飾者。
* 継承によって中身（Original）と飾り枠（DecoratorXXX）に同じ Show() メソッドを持たせることで、包まれるもの（Originalクラス）を変更することなく、機能の追加（装飾）をすることを可能にします。

### 例文
```
'test.vb
Module test '名前（test）は任意
    Sub Main() '名前（Main）は決め打ち
        Dim _Original As New Original("NISHIMURA")
        _Original.Show() '=> NISHIMURA

        Dim _DecoratorA As New DecoratorA(New Original("NISHIMURA"))
        _DecoratorA.Show() '=> -NISHIMURA-

        Dim _DecoratorB As New DecoratorB(New Original("NISHIMURA"))
        _DecoratorB.Show() '=> <NISHIMURA>

        Dim _Special As New DecoratorB(
                            New DecoratorA(
                                New DecoratorA(
                                    New DecoratorA(
                                        New Original("NISHIMURA")
                                    )
                                )
                            )
                        )
        _Special.Show() '=> <---NISHIMURA--->
    End Sub

    ''''''''''''''''''''''''''''''''''''''''''''''''''''
    ' スーパークラス
    '「中身」と「飾り枠」に同じ Show() メソッドを持たせる
    ''''''''''''''''''''''''''''''''''''''''''''''''''''
    Public Class Display
        Protected _Content As String

        'アクセサの定義
        Public Property Content() As String
            Get
                Content = _Content
            End Get
            Set(ByVal _newValue As Integer)
                _Content = _newValue
            End Set
        End Property

        Public Sub Show()
            Console.WriteLine(_Content)
        End Sub
    End Class

    '''''''''''''''''''''''''
    ' 中身（飾りを施す前の元）
    '''''''''''''''''''''''''
    Public Class Original
        Inherits Display '抽象クラスの「継承」

        Public Sub New(ByVal _String As String) 'コンストラクタ
            _Content = _String
        End Sub
    End Class

    ''''''''''
    ' 飾り枠Ａ
    ''''''''''
    Public Class DecoratorA
        Inherits Display '抽象クラスの「継承」

        Public Sub New(ByVal _Display As Display) 'コンストラクタ
            _Content = "-" & _Display.Content & "-"
        End Sub
    End Class

    ''''''''''
    ' 飾り枠Ｂ
    ''''''''''
    Public Class DecoratorB
        Inherits Display '抽象クラスの「継承」

        Public Sub New(ByVal _Display As Display) 'コンストラクタ
            _Content = "<" & _Display.Content & ">"
        End Sub
    End Class
End Module
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
作成者：夢寐郎  
更新日：2017年07月21日


<a name="Facade"></a>
# <b><ruby>Facade<rt>ファサード</rt></ruby></b>

### 概要
* シンプルな窓口。見かけ。
* ファサード＝「建物の正面」の意味。
* たくさんのクラスやメソッドを、このパターン（窓口）を使うことでシンプルにして迷いを生じさせないようにします。
* 以下の例文では、「Decoratorパターン」を Facade パターンでシンプルにします。
    ```
    Dim _Special As New DecoratorB(
                        New DecoratorA(
                            New DecoratorA(
                                New DecoratorA(
                                    New Original("NISHIMURA")
                                )
                            )
                        )
                    )
    ```
    …としていたものを次の1行で実現可能になります。
    ```
    DecoratorFacade.Exec("CHIKASHI", 3, 1)
    ```

### 例文
```
'test.vb
Module test '名前（test）は任意
    Sub Main() '名前（Main）は決め打ち
        DecoratorFacade.Exec("NISHIMURA", 0, 0) '=> NISHIMURA
        DecoratorFacade.Exec("NISHIMURA", 1, 0) '=> -NISHIMURA-
        DecoratorFacade.Exec("NISHIMURA", 0, 1) '=> <NISHIMURA>
        DecoratorFacade.Exec("NISHIMURA", 3, 1) '=> <---NISHIMURA--->
    End Sub

    ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    ' シンプルな窓口 ←Decoratorパターンにこのクラスを追加するだけ
    ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    Public Class DecoratorFacade 'Singletonパターンにする場合も...
        Shared Sub Exec( 'クラスメソッド（静的メソッド）の定義
            ByVal _String As String,
            ByVal _DecratorA_Num As Integer,
            ByVal _DecratorB_Num As Integer)

            Dim _Result As Display = New Original(_String)

            For I As Integer = 0 To _DecratorA_Num - 1
                _Result = new DecoratorA(_Result)
            Next

            For I As Integer = 0 To _DecratorB_Num - 1
                _Result = new DecoratorB(_Result)
            Next

            _Result.Show()
        End Sub
    End Class

    '以下の4つのクラスはDecoratorパターンの例文と全く同じ
    Public Class Display
        Protected _Content As String

        Public Property Content() As String
            Get
                Content = _Content
            End Get
            Set(ByVal _newValue As Integer)
                _Content = _newValue
            End Set
        End Property

        Public Sub Show()
            Console.WriteLine(_Content)
        End Sub
    End Class

    Public Class Original
        Inherits Display

        Public Sub New(ByVal _String As String)
            _Content = _String
        End Sub
    End Class

    Public Class DecoratorA
        Inherits Display

        Public Sub New(ByVal _Display As Display)
            _Content = "-" & _Display.Content & "-"
        End Sub
    End Class

    Public Class DecoratorB
        Inherits Display

        Public Sub New(ByVal _Display As Display)
            _Content = "<" & _Display.Content & ">"
        End Sub
    End Class
End Module
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
作成者：夢寐郎  
更新日：2017年07月21日


<a name="Flyweight"></a>
# <b><ruby>Flyweight<rt>フライウエイト</rt></ruby></b>

### 概要
* 同じものを共有して無駄をなくす。
* フライ級（軽量級）。
* インスタンスをできるかぎり共有させて無駄に new しない…ということがポイント。
* 外部ファイルを読み込むなど「メモリの使用量」が多い場合などに有効です。

### 例文
```
'test.vb
Imports System.Collections 'Hashtableに必要

Module test '名前（test）は任意
    Sub Main()
        '①インスタンスの管理者（Singletonクラス）
        Dim _Manager As Manager = Manager.GetInstance()

        '②無駄にしたくないオブジェクトを生成
        Dim _A As BigProcess = _Manager.CreateBigProcess("TypeA") 
        Dim _B As BigProcess = _Manager.CreateBigProcess("TypeB")
        Dim _A2 As BigProcess = _Manager.CreateBigProcess("TypeA") '=> "TypeAは既存です"
        
        Console.WriteLine(_A Is _A2) '=> True
        Console.WriteLine(_A.GetData()) '=> "TypeAに対する重〜い処理の結果"
        Console.WriteLine(_B.GetData()) '=> "TypeBに対する重〜い処理の結果"
    End Sub

    ''''''''''''''''''''''''''''''''''''''''
    ' インスタンスの管理人（Singletonクラス）
    ''''''''''''''''''''''''''''''''''''''''
    Public Class Manager
        Private Shared _Manager As New Manager() '唯一のインスタンスを格納（静的変数）
        Private _Pool As New Hashtable()

        'コンストラクタ
        Private Sub New() '外部からNew Manager()できないようにする
            Console.WriteLine("インスタンスを生成しました")
            
            Dim _Pool As New Hashtable() '①連想配列の作成
        End Sub

        '外部から唯一のインスタンスを呼出す
        Public Shared Function GetInstance() As Manager
            Return _Manager '唯一のインスタンス（静的変数）を返す
        End Function


        'BigProcessインスタンスをダブらないように連想配列に保存
        Public Function CreateBigProcess(ByVal _Type As String) As BigProcess
            If Not _Pool.ContainsKey(_Type) Then '既存か否か調べる
                _Pool(_Type) = New BigProcess(_Type)
            Else
                Console.WriteLine(_Type & "は既存です")
            End If
            Return _Pool(_Type)
        End Function
    End Class

    ''''''''''''''
    ' Flayweight役
    ''''''''''''''
    Public Class BigProcess
        Private _Type As String

        'コンストラクタ
        Public Sub New(Byval _Type As String)
            Me._Type = _Type
        End Sub
        
        Public Function GetData() As String
            Return _Type & "に対する重〜い処理の結果" '重い処理を実行
        End Function
    End Class
End Module
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
作成者：夢寐郎  
更新日：2017年07月21日


<a name="Proxy"></a>
# <b><ruby>Proxy<rt>プロキシー</rt></ruby></b>

### 概要
* 必要になってから作る。代理人。
* 本当に処理が必要になるまで、オブジェクトの生成を保留して待機。そして必要なタイミングでオブジェクトを生成します。
* Proxy パターンを使う場面は次のような場面です。
    * オブジェクトのロードに時間を要する。
    * 計算結果を出すのに時間がかかり、計算を実行している間に途中経過を表示する必要がある。
    * ネットワーク経由でロードするのに時間がかかる。
    * オブジェクトにアクセスする為に権限が必要で、Proxy がユーザに代り権利の承認を受ける。

### 例文
```
'test.vb
Module test '名前（test）は任意
    Sub Main()
        ' 実行（Cliant役）
        Dim _Loader As New Loader("http:'sample.mp4")
        _Loader.Load() '=> "重い処理を実行中"
    End Sub

    '''''''''''''''''''''
    ' ①代理人（Proxy役）
    '''''''''''''''''''''
    Public Class Loader
        Private _Url As String

        'コンストラクタ
        Public Sub New(ByVal _Url As String)
            Me._Url = _Url
        End Sub

        Public Sub Load()
            '↓実際の本人登場（代理に実際の本人を知っている）
            Dim _Content As New Content(_Url)
            _Content.Load()
        End Sub
    End Class

    ''''''''''''''''''''''''''''''''
    ' ②実際の本人（Real Subject役）
    ''''''''''''''''''''''''''''''''
    Public Class Content
        Private _Url As String

        'コンストラクタ
        Public Sub New(ByVal _Url As String)
            Me._Url = _Url
        End Sub

        '↓重い処理をここで行う（ポイント）
        Public Sub Load()
            ' 今回のサンプルの中身はあまり重要ではない...
            Console.WriteLine("重い処理を実行中")
        End Sub
    End Class
End Module
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
作成者：夢寐郎  
更新日：2017年07月22日


<a name="Iterator"></a>
# <b><ruby>Iterator<rt>イテレータ</rt></ruby></b>

### 概要
* １つ１つ数え上げる。繰り返し。
* interate は「繰り返す」という意味。
* データの集合体に対して、for 文等による操作でデータを取り出すのではなく、HasNext() と Next() メソッドを使って取り出します。
* データの集合体がどのような形態であれ、それを隠蔽することができるのがメリットです。
* 以下の例文の Iterator クラスは「駐輪場の管理人」と言えます。

### 例文
```
'test.vb
Imports System.Collections 'ArrayListに必要

Module test '名前（test）は任意
    Sub Main() '名前（Main）は決め打ち
        Dim _BikePark As New BikePark()
        _BikePark.Add(New Bike("CB1100F", "神戸 X XX-XX"))
        _BikePark.Add(New Bike("W800", "宇都宮 X XX-XX"))
        _BikePark.Add(New Bike("SR400", "杉並区 X XX-XX"))

        Dim _Iterator As Iterator = _BikePark.CreateIterator() 'イテレータ（管理人）生成
        While _Iterator.HasNext()
            Dim _NextBike As Bike = _Iterator.NextBike()
            Console.WriteLine(_NextBike.Name & ", " & _NextBike.Num)
        End While
        '=> "CB1100F", "神戸 X XX-XX"
        '=> "W800", "宇都宮 X XX-XX"
        '=> "SR400", "杉並区 X XX-XX"
    End Sub

    ''''''''''''
    ' Bikeクラス
    ''''''''''''
    Public Class Bike
        Private _Name As String
        Private _Num As String

        'コンストラクタ
        Public Sub New(ByVal _Name As String, ByVal _Num As String)
            Me._Name = _Name
            Me._Num = _Num
        End Sub

        'プライベート変数のアクセサ
        Public Property Name() As String
            Get
                Name = _Name
            End Get
            Set(ByVal _newValue As String)
                _Name = _newValue
            End Set
        End Property
        Public Property Num() As String
            Get
                Num = _Num
            End Get
            Set(ByVal _newValue As String)
                _Num = _newValue
            End Set
        End Property
    End Class

    ''''''''''''''''
    ' BikeParkクラス
    ''''''''''''''''
    Public Class BikePark
        Private _Array As New ArrayList() '空の配列（ArrayList）の作成

        ' 以下の4つのメソッドは必須（今回は Interface は省略）
        Public Sub Add(ByVal _Bike As Bike)
            _Array.Add(_Bike)
        End Sub

        Public Function GetElementAt(ByVal _Num As Integer) As Bike
            Return _Array(_Num)
        End Function

        Public Function GetLength() As Integer
            Return _Array.Count
        End Function

        Public Function CreateIterator() As Iterator
            Return New Iterator(Me) 'ここでイテレータ（管理人）の生成
        End Function
    End Class

    '''''''''''''''''''''''''''''''''''
    ' Iteratorクラス（≒駐輪場の管理人）
    '''''''''''''''''''''''''''''''''''
    Public Class Iterator
        Private _BikePark As BikePark
        Private _Count As Integer = -1

        ' コンストラクタ
        Public Sub New(ByVal _BikePark As BikePark)
            Me._BikePark = _BikePark
        End Sub

        ' 以下の2つのメソッドは必須（今回は Interface は省略）
        Public Function HasNext() As Boolean
            Return _BikePark.GetLength() > _Count + 1
        End Function

        Public Function NextBike() As Bike 'Next()は不可
            _Count += 1
            Return _BikePark.GetElementAt(_Count) '次のバイクを返す
        End Function
    End Class
End Module
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
作成者：夢寐郎  
更新日：2017年07月23日


<a name="TemplateMethod"></a>
# <b><ruby>Template Method<rt>テンプレート メソッド</rt></ruby></b>

### 概要
* 具体的な処理をサブクラスにまかせる。ひな型メソッド。
* 基本クラス（親クラス）で、一連の（瞬時に実行する連続した）処理の枠組みを定義し、それを継承する派生クラス（子クラス）で具体的処理を定義する…というデザインパターン。
* 処理フローは「ほぼ」同じだが、一部だけ処理内容が異なるといった場合に利用。

### 例文
```
'test.vb
Module test '名前（test）は任意
    Sub Main() '名前（Main）は決め打ち
        Dim _SummerCard As New SummerCard()
        _SummerCard.TemplateMethod()
        '=> HAPPY SUMMER HOLIDAYS!
        '=> 夏のイラスト
        '=> 〒XXX-XXXX 千代田区XXX町X-X-X

        Dim _NewYearCard As New NewYearCard()
        _NewYearCard.TemplateMethod()
        '=> HAPPY NEW YEAR!
        '=> 干支のイラスト
        '=> 2017年 元旦
        '=> 〒XXX-XXXX 千代田区XXX町X-X-X
    End Sub

    '抽象クラスの定義
    Public MustInherit Class AbstractCard
        '一連の連続した処理の枠組みを定義
        Public Sub TemplateMethod()
            MakeHeader()
            MakeContent()
            If IsMakeDate() Then 'フックメソッド（状況により実行）
                MakeDate()
            End If
            MakeFooter()
        End Sub

        '抽象メソッド（MustOverrride"s"ではない）
        Public MustOverride Sub MakeHeader()
        Public MustOverride Sub MakeContent()
        Public MustOverride Function IsMakeDate() As Boolean

        '共通の処理
        Private Sub MakeDate()
            Console.WriteLine("2017年 元旦")
        End Sub
        Private Sub MakeFooter()
            Console.WriteLine("〒XXX-XXXX 千代田区XXX町X-X-X")
        End Sub
    End Class

    Public Class SummerCard
        Inherits AbstractCard '抽象クラスの「継承」

        'オーバーライドして実際の処理を記述
        Public Overrides Sub MakeHeader()
            Console.WriteLine("HAPPY SUMMER HOLIDAYS!")
        End Sub
        Public Overrides Sub MakeContent()
            Console.WriteLine("夏のイラスト")
        End Sub
        Public Overrides Function IsMakeDate() As Boolean
            Return False
        End Function
    End Class

    Public Class NewYearCard
        Inherits AbstractCard '抽象クラスの「継承」

        'オーバーライドして実際の処理を記述
        Public Overrides Sub MakeHeader()
            Console.WriteLine("HAPPY NEW YEAR!")
        End Sub
        Public Overrides Sub MakeContent()
            Console.WriteLine("干支のイラスト")
        End Sub
        Public Overrides Function IsMakeDate() As Boolean
            Return True
        End Function
    End Class
End Module
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
作成者：夢寐郎  
更新日：2017年07月23日


<a name="Strategy"></a>
# <b><ruby>Strategy<rt>ストラテジー</rt></ruby></b>

### 概要
* アルゴリズムをごっそり切り替える。戦略。Strategy ＝作戦。アルゴリズム（手順）。
* State パターン（後述）に似ていますが、State パターンの場合は…
    ```
    New Context()
    ```
    Strategy パターンの場合…
    ```
    New Context(New Strategy())
    ```
    …となります。

### 例文
```
'test.vb
Module test '名前（test）は任意
    Sub Main() '名前（Main）は決め打ち
        Dim _JankenA As New Janken(New StrategyA())
        Dim _jankenB As New Janken(New StrategyB())
        _JankenA.Exec() '=> "グー、グー、パー"
        _jankenB.Exec() '=> "パー、グー、チョキ"
    End Sub

    ''''''''''''''''''''
    ' Strategyクラス関連
    ''''''''''''''''''''
    Public Interface IStrategy 'インターフェースの宣言
        Sub Execute() '"Public"は記述しない
    End Interface

    Public Class StrategyA
        Implements IStrategy 'インターフェースの実装

        Public Sub Execute() Implements IStrategy.Execute 'インターフェースの実装
            Console.WriteLine("グー、グー、パー")
        End Sub
    End Class

    Public Class StrategyB
        Implements IStrategy 'インターフェースの実装
        
        Public Sub Execute() Implements IStrategy.Execute 'インターフェースの実装
            Console.WriteLine("パー、グー、チョキ")
        End Sub
    End Class

    ''''''''''''''
    ' Jankenクラス
    ''''''''''''''
    Public Class Janken
        Private _Strategy As IStrategy

        ' コンストラクタ
        Public Sub New(ByVal _Strategy As IStrategy)
            Me._Strategy = _Strategy
        End Sub

        Public Sub Exec()
            _Strategy.Execute() 'Exec()だと紛らわしいので...
        End Sub
    End Class
End Module
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
作成者：夢寐郎  
更新日：2017年07月23日


<a name="Visitor"></a>
# <b><ruby>Visitor<rt>ビジター</rt></ruby></b>

### 概要
* 構造を渡り歩きながら仕事をする。訪問者。
* データ構造と処理を分離することがこのパターンの目的。
* 新しい処理を追加したい時は、訪問者（Visitor）を追加する。
* 家庭訪問に例えると…親御さん方は、訪問者＝先生が代わっても、これまで受け入れてきたのと同じメソッドを実行すれば良いのです。どの先生が来るかによって、いろいろとメソッドを用意していたら、親御さん方も大変ですから…。

### 例文
```
'test.vb
Module test '名前（test）は任意
    Sub Main()
        Dim _佐藤家 As New 佐藤家() '訪問先①
        Dim _高橋家 As New 高橋家() '訪問先②
        Dim _庭師 As New 庭師() '訪問者❶
        Dim _エアコン設置業者 As New エアコン設置業者() '訪問者❷

        _佐藤家.Accept(_庭師)
        '=> test+佐藤家（佐藤家のインスタンス）
        '=> "生垣切り→枝落し→雑草除去...等"

        _佐藤家.Accept(_エアコン設置業者) 
        '=> test+佐藤家（佐藤家のインスタンス）
        '=> "生垣切り→枝落し→雑草除去...等"

        _高橋家.Accept(_庭師)
        '=> test+高橋家（高橋家のインスタンス）
        '=> "生垣切り→枝落し→雑草除去...等"
        
        _高橋家.Accept(_エアコン設置業者)
        '=> test+高橋家（高橋家のインスタンス）
        '=> "生垣切り→枝落し→雑草除去...等"
    End Sub

    ''''''''''''''''''''''''''''
    ' 訪問先（受入者＝Acceptor）
    ''''''''''''''''''''''''''''
    Public Interface I受入者 'インターフェース
        Sub Accept(ByVal _I訪問者 As I訪問者) '"Public"は記述しない
    End Interface

    Public Class 佐藤家
        Implements I受入者 'インターフェースの実装

        Public Sub Accept(ByVal _I訪問者 As I訪問者) Implements I受入者.Accept '実装
            _I訪問者.Work(Me) '誰であっても「では、よろしく」とお任せする
        End Sub
    End Class

    Public Class 高橋家
        Implements I受入者 'インターフェースの実装

        Public Sub Accept(ByVal _I訪問者 As I訪問者) Implements I受入者.Accept '実装
            _I訪問者.Work(Me) '誰であっても「では、よろしく」とお任せする
        End Sub
    End Class

    '''''''''''''''''''''''
    ' 訪問者（Visitor）の役
    '''''''''''''''''''''''
    Public Interface I訪問者 'インターフェース
        Sub Work(ByVal _I受入者 As I受入者) '"Public"は記述しない
    End Interface

    Public Class 庭師
        Implements I訪問者 'インターフェースの実装

        Public Sub Workd(ByVal _I受入者 As I受入者) Implements I訪問者.Work '実装
            Console.WriteLine(_I受入者)
            Console.WriteLine("生垣切り→枝落し→雑草除去...等")
        End Sub
    End Class

    Public Class エアコン設置業者
        Implements I訪問者 'インターフェースの実装

        Public Sub Workd(ByVal _I受入者 As I受入者) Implements I訪問者.Work '実装
            Console.WriteLine(_I受入者)
            Console.WriteLine("室内機取付→ホース接続→室外機取付...等")
        End Sub
    End Class
End Module
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
作成者：夢寐郎  
更新日：2017年07月24日


<a name="ChainofResponsibility"></a>
# <b><ruby>Chain of Responsibility<rt>チェーン オブ レスポンシビリティ</rt></ruby></b>

### 概要
* 責任のたらいまわし。責任の連鎖。
* 自分（クラス）で処理できるなら処理する。処理できないなら、次の人（クラス）に、たらい回しにする…というのがこのパターン。
* マウス関連のイベント処理等で使用。
* 新たな処理者のクラスを簡単に追加することが容易に可能。

### 例文
```
'test.vb
Module test '名前（test）は任意
    Sub Main() '名前（Main）は決め打ち
        Dim _ShinjukuPO As New ShinjukuPO() '新宿郵便局の設置
        Dim _TokyoPO As New TokyoPO() '東京郵便局の設置
        Dim _JapanPO As New JapanPO() '日本郵便局の設置
        _ShinjukuPO.SetNext(_TokyoPO).SetNext(_JapanPO) '責任の「たらい回し先」のセット
        _ShinjukuPO.Send("新宿区XX町X-X-X") '=> "本日中に届きます"
        _ShinjukuPO.Send("東京都青梅市XXX町X-X-X") '=> "明後日中に届きます"
        _ShinjukuPO.Send("北海道XXX市XXX町X-X-X") '=> "一週間前後で届きます"
    End Sub

    '各郵便局の抽象クラス
    Public MustInherit Class AbstractPO
        Protected _NextPO As AbstractPO

        '共通のメソッド（責任の「たらい回し先」のセット）
        Public Function SetNext(ByVal _NextPO As AbstractPO) As AbstractPO
            Me._NextPO = _NextPO
            return _NextPO
        End Function

        '抽象メソッド（MustOverrride"s"ではない）
        Public MustOverride Sub Send(ByVal _Address As String)
    End Class

    ' 新宿郵便局
    Public Class ShinjukuPO
        Inherits AbstractPO '抽象クラスの「継承」

        'オーバーライドして実際の処理を記述
        Public Overrides Sub Send(ByVal _Address As String)
            If Not (_Address.IndexOf("新宿", 0) = -1) Then
                Console.WriteLine("本日中に届きます")
            Else
                _NextPO.Send(_Address) '「たらいまわし先」に送る
            End If
        End Sub
    End Class

    ' 東京郵便局
    Public Class TokyoPO
        Inherits AbstractPO '抽象クラスの「継承」

        'オーバーライドして実際の処理を記述
        Public Overrides Sub Send(ByVal _Address As String)
            If Not (_Address.IndexOf("東京", 0) = -1) Then
                Console.WriteLine("明後日中に届きます")
            Else
                _NextPO.Send(_Address) '「たらいまわし先」に送る
            End If
        End Sub
    End Class

    ' 日本郵便局
    Public Class JapanPO
        Inherits AbstractPO '抽象クラスの「継承」

        'オーバーライドして実際の処理を記述
        Public Overrides Sub Send(ByVal _Address As String)
            Console.WriteLine("一週間前後で届きます")
        End Sub
    End Class
End Module
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
作成者：夢寐郎  
更新日：2017年07月24日


<a name="Mediator"></a>
# <b><ruby>Mediator<rt>メディエイター</rt></ruby></b>

### 概要
* 相手は相談役１人だけ。調停者。
* メンバーの皆さん（ColleagueXXX）は相談役の私（Mediator）に状況を報告して下さい。そうしたら、私は全体を考慮した上で皆さんに指示を出しましょう。でも私は、皆さんの仕事の詳細まではとやかく言いませんからね、というパターン。メンバー同士は、その存在すら知る必要はない。
* Mediator 役のクラスは、専門性が高くなるので、使い捨てとなります。

### 例文
```
'test.vb
Module test '名前（test）は任意
    Sub Main() '名前（Main）は決め打ち
        Dim _Mediator As New Mediator()

        _Mediator.YesButton.SwitchON()
        '=> "NoButtonをOFFにします"
        '=> "TextBoxを入力可能にします"

        _Mediator.NoButton.SwitchON()
        '=> "YesButtonをOFFにします"
        '=> "TextBoxを入力不可にします"
    End Sub

    ''''''''''''''''
    ' 各メンバー関連
    ''''''''''''''''
    ' 抽象クラス
    Public MustInherit Class AbstractMember
        Protected _Mediator As Mediator

        '共通のメソッド
        Public Sub SetMediator(ByVal _Mediator As Mediator)
            Me._Mediator = _Mediator
        End Sub

        '抽象メソッド（MustOverrride"s"ではない）
        Public MustOverride Sub Advice(ByVal _String As String)
    End Class

    ' メンバー①（YesButtonクラス）
    Public Class YesButton
        Inherits AbstractMember '抽象クラスの「継承」

        Public Sub SwitchON() 'On()は不可
            _Mediator.Report(Me, "on") '相談役に報告
        End Sub

        'オーバーライドして実際の処理を記述
        Public Overrides Sub Advice(ByVal _String As String)
            If _String = "off" Then
                Console.WriteLine("YesButtonをOFFにします")
            End If
        End Sub
    End Class

    ' メンバー②（NoButtonクラス）
    Public Class NoButton
        Inherits AbstractMember '抽象クラスの「継承」

        Public Sub SwitchON()
            _Mediator.Report(Me, "on") '相談役に報告
        End Sub

        'オーバーライドして実際の処理を記述
        Public Overrides Sub Advice(ByVal _String As String)
            If _String = "off" Then
                Console.WriteLine("NoButtonをOFFにします")
            End If
        End Sub
    End Class

    'メンバー③（TextBoxクラス）
    Public Class TextBox
        Inherits AbstractMember '抽象クラスの「継承」

        'オーバーライドして実際の処理を記述
        Public Overrides Sub Advice(ByVal _String As String)
            if _String = "enable" Then
                Console.WriteLine("TextBoxを入力可能にします")
            Else If _String = "disabled" Then
                Console.WriteLine("TextBoxを入力不可にします")
            End If
        End Sub
    End Class

    ''''''''''''''''''''''''''''''''''''
    ' 相談役（専門性が高いため使い捨て）
    ''''''''''''''''''''''''''''''''''''
    Public Class Mediator
        Private _YesButton As New YesButton() 'YesButtonの生成
        Private _NoButton As New NoButton() 'NoButtonの生成
        Private _TextBox As New TextBox() 'TextButtonの生成

        Public Sub New() ' コンストラクタ
            _YesButton.SetMediator(Me) 'YesButtonに相談役が自分あることを教える
            _NoButton.SetMediator(Me) 'NoButtonに相談役が自分あることを教える
            _TextBox.SetMediator(Me) 'TextButtonに相談役が自分あることを教える
        End Sub

        'アクセサの定義
        Public Property YesButton() As YesButton '外部からYesButtonにアクセス可能に
            Get
                YesButton = _YesButton
            End Get
            Set(ByVal _newValue As YesButton)
                Console.WriteLine("変更不可です")
            End Set
        End Property

        Public Property NoButton() As NoButton '外部からNoButtonにアクセス可能に
            Get
                NoButton = _NoButton
            End Get
            Set(ByVal _newValue As NoButton)
                Console.WriteLine("変更不可です")
            End Set
        End Property

        'メンバーからの報告を受けて指示を出す
        Public Sub Report(ByVal _Member As AbstractMember, ByVal _String As String)
            If _Member IS _YesButton Then 'YesButtonからの報告の場合...
                If _String = "on" Then
                    _NoButton.Advice("off")
                    _TextBox.Advice("enable")
                End If
            End If
            If _Member IS _NoButton Then 'NoButtonからの報告の場合...
                If _String = "on" Then
                    _YesButton.Advice("off")
                    _TextBox.Advice("disabled")
                End If
            End If
        End Sub
    End Class
End Module
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
作成者：夢寐郎  
更新日：2017年07月24日


<a name="Observer"></a>
# <b><ruby>Observer<rt>オブザーバ</rt></ruby></b>

### 概要
* 状態の変化を通知する。観察者。
* ECMAScript の addEventListener は能動的な観察。それに対し、Observer パターンは、受動的な観察と言える。
* 例えば OS メーカー（観察される役）が、OS をバージョンアップした場合、各端末に、状態の変化を通知。その通知を受けて各端末がアップデートをする…等。
* Mediator パターンに似ているが、Subuject 役、AddObserver()、RemoveObserver()、Notify() メソッドがあることが異なる。

### 例文
```
'test.vb
Imports System.Collections 'ArrayListに必要

Module test '名前（test）は任意
    Sub Main() '名前（Main）は決め打ち
        Dim _Apple As New Apple() 'Subject（観察される側）の生成

        'Observer（観察者）の生成
        Dim _iPhone As New iPhone()
        Dim _iPad As New iPad()
        Dim _iPadPro As New iPadPro()

        '観察される側に、観察者（リスナー）の登録
        _Apple.AddObserver(_iPhone)
        _Apple.AddObserver(_iPad)
        _Apple.AddObserver(_iPadPro)

        _Apple.Notify() '全リスナー（Observer）への通知
        '=> iPhoneは10.3.2にアップデート可能です
        '=> iPadは10.3.2にアップデート可能です
        '=> iPadProは10.3.2にアップデート可能です
    End Sub

    '''''''''''''''''''''''''''''
    ' Subject（観察される側）関連
    '''''''''''''''''''''''''''''
    '↓Subject役＝抽象クラス
    Public MustInherit Class AbstractSubject
        '抽象メソッド（MustOverrride"s"ではない）
        Public MustOverride Sub AddObserver(ByVal _Observer As IObserver)
        Public MustOverride Sub Notify()
        ' 今回は RemoveObserver() は省略
    End Class

    ' ConcreteSubject役
    Public Class Apple
        Inherits AbstractSubject '抽象クラスの「継承」

        Private _ObserverList As New ArrayList() 'リスナーのリスト
        Private _Version As String = "10.3.2"

        'コンストラクタ（省略可)
        Public Sub New()
        End Sub

        'オーバーライドして実際の処理を記述
        Public Overrides Sub AddObserver(ByVal _Observer As IObserver)
            'データの追加
            _ObserverList.Add(_Observer) 'リスナーの登録
        End Sub

        Public Overrides Sub Notify()
            For Each _TheObserver As IObserver In _ObserverList
                _TheObserver.Update(Me)
            Next
        End Sub

        'アクセサの定義
        Public Property Version() As String
            Get
                Version = _Version
            End Get
            Set(ByVal _newValue As String)
                Console.WriteLine("変更不可")
            End Set
        End Property
    End Class

    ''''''''''''''''''''''''''''''''''
    ' Observer（観察者＝リスナー）関連
    ''''''''''''''''''''''''''''''''''
    'インターフェースの宣言
    Public Interface IObserver
        Sub Update(ByVal _Apple As Apple) '"Public"は記述しない
    End Interface

    '↓ConcreteObserver役①（iPhoneクラス）
    Public Class iPhone
        Implements IObserver 'インターフェースの継承
        Public Sub Update(ByVal _Apple As Apple) Implements IObserver.Update 'インターフェースの実装
            Console.WriteLine("iPhoneは" & _Apple.Version & "にアップデート可能です")
        End Sub
    End Class

    '↓ConcreteObserver役②（iPadクラス）
    Public Class iPad
        Implements IObserver 'インターフェースの継承
        Public Sub Update(ByVal _Apple As Apple) Implements IObserver.Update 'インターフェースの実装
            Console.WriteLine("iPadは" & _Apple.Version & "にアップデート可能です")
        End Sub
    End Class

    '↓ConcreteObserver役③（iPadProクラス）
    Public Class iPadPro
        Implements IObserver 'インターフェースの継承
        Public Sub Update(ByVal _Apple As Apple) Implements IObserver.Update 'インターフェースの実装
            Console.WriteLine("iPadProは" & _Apple.Version & "にアップデート可能です")
        End Sub
    End Class
End Module
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
作成者：夢寐郎  
更新日：2017年07月24日


<a name="Memento"></a>
# <b><ruby>Memento<rt>メメント</rt></ruby></b>

### 概要
* 状態を保存する。形見。
* OOP でアンドゥを行うには、インスタンスの状態を保存し、さらに元の状態に復元できなければなりません。これを、カプセル化の破壊をせずにおこなうのが、このパターン。
* 状態をさまざまなプロパティを格納したオブジェクト（Mementoクラス）としてカプセル化して、そのまま配列に格納する…というところがポイント。
* Undo（やり直し）、Redo（再実行）、History（作業履歴）、Snapshot（現在の状態の保存）等が行えるようになります。
* 以下の例文では、主人公が世話人の役もつとめています。

### 例文
```
'test.vb
Imports System.Collections 'ArrayListに必要

Module test '名前（test）は任意
    Sub Main() '名前（Main）は決め打ち
        'ゲームスタート（最初のポイントは100）←①
        Dim _Game As New Game(100)

        Dim _SnapShot As SnapShot = _Game.Save() '最初の状態を保存
        _Game.Point = 2000 'ゲームが進行して2000ポイントに... ←②
        _SnapShot = _Game.Save() 'この時点での状態を保存
        _Game.Point = 8000 '更にゲームが進行して8000ポイントに... ←③
        _SnapShot = _Game.Save() 'この時点での状態を保存

        '履歴を調べる
        _Game.History()
        '=> 0:100 ←①
        '=> 1:2000 ←②
        '=> 2:8000 ←③

        'Undo（やり直し）
        _SnapShot = _Game.Undo()
        Console.WriteLine(_SnapShot.Point) '=> 2000
        _SnapShot = _Game.Undo()
        Console.WriteLine(_SnapShot.Point) '=> 100
        _SnapShot = _Game.Undo() '=> "これ以上、Undoできません"
        Console.WriteLine(_SnapShot.Point) '=> 100

        'Redo（再実行）
        _SnapShot = _Game.Redo()
        Console.WriteLine(_SnapShot.Point) '=> 2000
        _SnapShot = _Game.Redo()
        Console.WriteLine(_SnapShot.Point) '=> 8000
        _SnapShot = _Game.Redo() '=> "これ以上、Redoできません"
        Console.WriteLine(_SnapShot.Point) '=> 8000
    End Sub

    '''''''''''''''''''''''''
    ' 主人公 + バックアップ係
    '''''''''''''''''''''''''
    Public Class Game
        Private _History As New ArrayList() '履歴用リスト
        Private _Point As Integer
        Private _Count As Integer = Nothing 'Undo、Redo用

        'コンストラクタ
        Public Sub New(ByVal _Point As Integer)
            Me._Point = _Point
        End Sub

        Public Function Save() As SnapShot '状態を保存
            Dim _SnapShot As New SnapShot(_Point)
            _History.Add(_SnapShot)
            _Count = _History.Count - 1
            Return _SnapShot
        End Function

        Public Sub History() '履歴
            For I As Integer = 0 To (_History.Count-1)
                Console.WriteLine(I & ": " & _History(I).Point) '"A"→"B"→"C"
            Next
        End Sub

        Public Function Undo() As SnapShot 'Undo（やり直し）
            If _Count > 0 Then
                _Count -= 1
                Return _History(_Count)
            Else
                Console.WriteLine("これ以上、Undoできません")
                _Count = 0
                Return _History(0)
            End If
        End Function

        Public Function Redo() 'Redo（再実行）
            If _Count < (_History.Count - 1) Then
                _Count += 1
                Return _History(_Count)
            Else
                Console.WriteLine("これ以上、Redoできません")
                _Count = _History.Count - 1
                Return _History(_Count)
            End If
        End Function

        'アクセサの定義
        Public Property Point() As Integer
            Get
                Point = _Point
            End Get
            Set(ByVal _newValue As Integer)
                _Point = _newValue
            End Set
        End Property
    End Class

    '''''''''''''''''''''''''''''''''''''''''''''
    ' Memento役（その瞬間の状態をオブジェクト化）
    '''''''''''''''''''''''''''''''''''''''''''''
    Public Class SnapShot
        Private _Point As Integer

        'コンストラクタ
        Public Sub New(ByVal _Point As Integer)
            Me._Point = _Point
        End Sub

        'アクセサの定義
        Public Property Point() As Integer
            Get
                Point = _Point
            End Get
            Set(ByVal _newValue As Integer)
                _Point = _newValue
            End Set
        End Property
    End Class
End Module
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
作成者：夢寐郎  
更新日：2017年07月24日


<a name="State"></a>
# <b><ruby>State<rt>ステート</rt></ruby></b>

### 概要
* 状態をクラスとして表現。状態。
* Context オブジェクトが、異なる時点において、状態A（StateA）と状態B（StateB）のどちらとてでも振る舞うことができます。
* 例えばトグルスイッチのような動作。
* if 文などの条件分岐が散在し、保護が複雑になるのを避けることが可能。
* Strategy パターンに似ていて Strategy パターンの場合は…
    ```
    New Context(New Strategy())
    ```
    State パターンの場合は…
    ```
    New Context()
    ```
    …となります。

### 例文
```
'test.vb
Module test '名前（test）は任意
    Sub Main() '名前（Main）は決め打ち
        Dim _Janken As New Janken() 'Context（状態を管理）役の生成

        Dim _StateA As New StateA() 'State（状態）役 ①の生成
        Dim _StateB As New StateB() 'State（状態）役 ②の生成

        _Janken.SetState(_StateA) '状態の設定
        _Janken.Exec() '=> "グー、グー、パー"
        _Janken.SetState(_StateB) '状態の設定（変更）
        _Janken.Exec() '=> "パー、グー、チョキ"
    End Sub

    '''''''''''''''''''''''''
    ' Context（状態を管理）役
    '''''''''''''''''''''''''
    Public Class Janken
        Private _State As IState

        Public Sub SetState(ByVal _State As IState)
            Me._State = _State
        End Sub

        Public Sub Exec()
            _State.Execte()
        End Sub
    End Class

    '''''''''''''''''
    ' State（状態）役
    '''''''''''''''''
    'インターフェースの宣言
    Public Interface IState
        Sub Execte() '"Public"は記述しない
    End Interface

    'State（状態）役 ①
    Public Class StateA
        Implements IState 'インターフェースの継承
        Public Sub Execte() Implements IState.Execte 'インターフェースの実装
            Console.WriteLine("グー、グー、パー")
        End Sub
    End Class

    'State（状態）役 ②
    Public Class StateB
        Implements IState 'インターフェースの継承
        Public Sub Execte() Implements IState.Execte 'インターフェースの実装
            Console.WriteLine("パー、グー、チョキ")
        End Sub
    End Class
End Module
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
作成者：夢寐郎  
更新日：2017年07月24日


<a name="Command"></a>
# <b><ruby>Command<rt>コマンド</rt></ruby></b>

### 概要
* 命令をクラスにする。命令。
* 命令を実行する度にインスタンスを作り、履歴として管理する。
* Memento パターンは「状態を保存」するのに対し、Command パターンはクラス化した「命令を保存」する。

### 例文
```
'test.vb
Imports System.Collections 'ArrayListに必要

Module test '名前（test）は任意
    Sub Main() '名前（Main）は決め打ち
        Dim _Inkscape As New Inkscape() 'グラフィックソフト
        _Inkscape.Draw("線を引く") '命令の実行
        _Inkscape.Draw("縁取る") '命令の実行
        _Inkscape.Draw("影をつける") '命令の実行
    End Sub

    Public Class Inkscape 'グラフィックソフト（今回はバッチ処理は省略）
        Private _Canvas As New Canvas()
        Private _History As New ArrayList() '履歴（命令クラスを保持）

        Public Sub Draw(ByVal _Command As String)
            '↓命令を実行する度にインスタンスを生成
            Dim _DrawCommand As New DrawCommand(_Canvas, _Command)
            _DrawCommand.Execute()
            _History.Add(_DrawCommand)
        End Sub
    End Class

    Public Class DrawCommand '命令クラス
        Private _Canvas As Canvas
        Private _Command As String

        'コンストラクタ
        Public Sub New(ByVal _Canvas As Canvas, ByVal _Command As String)
            Me._Canvas = _Canvas
            Me._Command = _Command
        End Sub

        Public Sub Execute()
            _Canvas.Update(_Command)
        End Sub
    End Class

    Public Class Canvas '結果を表示する役（Receiver＝受信者の役）
        Private _History As New ArrayList() '履歴（実際の処理を保持）

        Public Sub Update(ByVal _Command As String)
            _History.Add(_Command)
            For Each _TheCommand As String In _History
                Console.WriteLine(_TheCommand)
            Next
            Console.WriteLine("---描画---")
        End Sub
    End Class
End Module
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
作成者：夢寐郎  
更新日：2017年07月24日


<a name="Interpreter"></a>
# <b><ruby>Interpreter<rt>インタプリタ</rt></ruby></b>

### 概要
* 文法規則をクラスで表現する。通訳。
* 自作ミニ言語を使って、ミニ･プログラムを実行。ミニ･プログラムはそれだけでは動作しない為、通訳（interpreter）の役目（インタプリタ）を果たすものを用意。この通訳プログラムの事を、インタプリタと呼ぶ。
* 例文は、ActionScript、SWF、AVM（ActionScript Virtual Machine）を自作ミニ言語と見立てています。
* 例文は「終端となる表現の役」を省略しています。

### 例文
```
'test.vb
Imports System.Collections 'ArrayListに必要

Module test '名前（test）は任意
    Sub Main() '名前（Main）は決め打ち
        '①自作ミニ言語によるソースコード（文字列）を記述
        Dim _Code As String = "+10;*50;/2;-4;="

        '②中間言語コンパイラを使って、ソースコードを中間コードに変換（構文解析＝配列化）
        Dim _Swf As New SWF(_Code) '≒SWFファイルに変換

        '③インタプリタ（通訳プログラム）を使って、中間コードをもとに実行
        Dim _Avm As New AVM() 'インタプリタ（≒ActionScript Virtual Machine）の生成
        _Avm.Execute(_Swf) '≒SWFファイルをAVM上で実行 => 246
    End Sub

    Public Class SWF
        Private _Count As Integer = 0 'GetNextCode()で使用
        Private _CodeArray As String() '配列の初期化（≠動的配列）

        'コンストラクタ
        Public Sub New(ByVal _Code As String)
            _CodeArray = _Code.Split(";"c) '「'」区切りで配列化（≒中間コード）
        End Sub

        Public Function GetNextCode() As String
            _Count += 1
            Return _CodeArray(_Count - 1) '次の命令を調べる
        End Function

        Public Function IsEnd() As Boolean
            Return _Count >= _CodeArray.Length '次の命令があるか否か
        End Function
    End Class

    Public Class AVM '≒ ActionScript Virtual Machine
        Public Sub Execute(ByVal _Swf As SWF) '実行
            Dim _Result As Integer = 0

            While Not _Swf.IsEnd() '次の命令があれば...
                Dim _NextCode As String = _Swf.GetNextCode()' '次の命令を調べる

                '↓ここからはサンプルの独自処理
                Dim _Operator As String = _NextCode.Substring(0,1) '「+*/-=」の何れか

                If Not (_Operator = "=") Then '「=」以外の場合...

                    Dim _Num As Integer = CInt(_NextCode.Substring(1))

                    Select Case _Operator
                        Case "+"
                            _Result += _Num
                        Case "-"
                            _Result -= _Num
                        Case "*"
                            _Result *= _Num
                        Case "/"
                            _Result /= _Num
                        Case Else
                            Console.WriteLine(_Operator & "はサポートしていません")
                    End Select

                Else '「=」の場合...
                    ' 本来はここで「終端となる表現」のクラスを生成し処理しますが...
                    Console.WriteLine(_Result)
                End If
            End While
        End Sub
    End Class
End Module
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
作成者：夢寐郎  
更新日：2017年07月24日