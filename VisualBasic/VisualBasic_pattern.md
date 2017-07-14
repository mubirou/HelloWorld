### <b>この項目は編集中の項目です</b>

# <b>Visual Basic .NET デザインパターン</b>

### <b>INDEX</b>

* オブジェクトの「生成」に関するパターン
    * [<ruby>Singleton<rt>シングルトン</rt></ruby>](#Singleton) : たった１つのインスタンス 
    * [<ruby>Prototype<rt>プロトタイプ</rt></ruby>](#Prototype) : コピーしてインスタンスを作る
    * [<ruby>Builder<rt>ビルダー</rt></ruby>](#Builder) : 複雑なインスタンスを組み立てる
    * [<ruby>Factory Method<rt>ファクトリー メソッド</rt></ruby>](#FactoryMethod) : インスタンスの作成をサブクラスにまかせる
    ***
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
    * [<ruby>Interpreter<rt>インタプリタ</rt></ruby>](#Interpreter) : 文法規則を暮らすで表現する


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
            Console.WriteLine("インスタンスを生成しました") 'DEBUG
        End Sub

        '外部から唯一のインスタンスを呼出す
        Public Shared Function GetInstance() As Singleton
            Return _Singleton '唯一のインスタンス（静的変数）を返す
        End Function
    End Class
End Module
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
作成者：Takashi Nishimura  
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
作成者：Takashi Nishimura  
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
作成者：Takashi Nishimura  
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

    '抽象クラスの定義
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
作成者：Takashi Nishimura  
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
//test.cs
using System;
class Test {
    static void Main() {
        AbstractFactory _factoryICHIRO = AbstractFactory.createFactory("ICHIRO");
        _factoryICHIRO.CreateNewYear();
        /*
        HAPPY NEW YEAR
        ICHIRO NISHIMURA
        */
        _factoryICHIRO.CreateSummer();
        /*
        暑中お見舞い申し上げます
        西村一郎
        */
        
        AbstractFactory _factoryHARUKO = AbstractFactory.createFactory("HARUKO");
        _factoryHARUKO.CreateNewYear();
        /*
        明けましておめでとうございます
        西村春子
        */
        _factoryHARUKO.CreateSummer();
        /*
        暑中おみまいもうしあげます
        西村春子
        */
    }
}

//抽象クラス（抽象的な工場）
abstract class AbstractFactory {
    public static AbstractFactory createFactory(string _name) { //共通の静的メソッド
        if (_name == "ICHIRO") {
            return new ICHIRO(); //具体的な「一郎工場」を生成
        } else if (_name == "HARUKO") {
            return new HARUKO(); //具体的な「春子工場」を生成
        } else {
            return null; //必須（注意）
        }
    }
    public abstract void CreateNewYear(); //抽象メソッド宣言（派生クラスでoverride）
    public abstract void CreateSummer();  //抽象メソッド宣言（派生クラスでoverride）
}

//派生クラス群（実際の工場群）
class ICHIRO : AbstractFactory { //抽象クラスを継承
    public override void CreateNewYear() { //overrideして具体的処理を記述
        Console.WriteLine("HAPPY NEW YEAR");
        Console.WriteLine("ICHIRO NISHIMURA");
    }
    public override void CreateSummer() { //overrideして具体的処理を記述
        Console.WriteLine("暑中お見舞い申し上げます");
        Console.WriteLine("西村一郎");
    }
}

class HARUKO : AbstractFactory { //抽象クラスを継承
    public override void CreateNewYear() { //overrideして具体的処理を記述
        Console.WriteLine("明けましておめでとうございます");
        Console.WriteLine("西村春子");
    }
    public override void CreateSummer() { //overrideして具体的処理を記述
        Console.WriteLine("暑中おみまいもうしあげます");
        Console.WriteLine("西村春子");
    }
}
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
作成者：Takashi Nishimura  
更新日：2017年07月XX日


<a name="Adapter（継承）"></a>
# <b><ruby>Adapter<rt>アダプター</rt></ruby>（継承）</b>

### 概要
* 一皮かぶせて再利用。接続装置。
* 別名、Wrapper （ラッパー）パターン。クラスによる Adapter パターン。
* 継承を使って、オリジナルのクラスを拡張。

### 例文
```
//test.cs
using System;

//メインクラス
class Test {
    static void Main() {
        Exchange _exchange = new Exchange(10000, 111.844);
        _exchange.AddYen(8000);
        Console.WriteLine(_exchange.GetDollar()); //160.938449983906（ドル）
    }
}

//基本クラス（親クラス）の定義
class Moneybox {
    private int _yen; //privateは省略可
    public Moneybox(int _yen) { this._yen = _yen; } //コンストラクタ（★）
    public void Add(int _yen) { this._yen += _yen; }
    public int GetYen() { return _yen; }
}

//インターフェースの宣言
interface IExchange {
    void AddYen(int _yen); //暗黙的にpublic
    double GetDollar(); //暗黙的にpublic
}

//継承、インターフェースの実装
class Exchange : Moneybox, IExchange {
    private double _rate; //privateは省略可
    //↓baseキーワードで基本クラスのコンストラクタ（★）を実行
    public Exchange(int _firstYen, double _rate) : base(_firstYen) {
        this._rate = _rate;
    }
    public void AddYen(int _yen) { Add(_yen); } //Add()は基本クラスから継承
    public double GetDollar() { return GetYen() / _rate; } //GetYen()は基本〜から継承
}
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
作成者：Takashi Nishimura  
更新日：2017年07月XX日


<a name="Adapter（委譲）"></a>
# <b><ruby>Adapter<rt>アダプター</rt></ruby>（委譲）</b>

```
//test.cs
using System;

//メインクラス（「継承」版と同じ）
class Test {
    static void Main() {
        Exchange _exchange = new Exchange(10000, 111.844);
        _exchange.AddYen(8000);
        Console.WriteLine(_exchange.GetDollar()); //160.938449983906（ドル）
    }
}

//基本クラス（親クラス）の定義（「継承」版と同じ）
class Moneybox {
    private int _yen;
    public Moneybox(int _yen) { this._yen = _yen; }
    public void Add(int _yen) { this._yen += _yen; }
    public int GetYen() { return _yen; }
}

//インターフェースの宣言（「継承」版と同じ）
interface IExchange {
    void AddYen(int _yen);
    double GetDollar();
}

//継承、インターフェースの実装（この内容が「継承」版と異なる）
class Exchange : IExchange {
    Moneybox _moneybox; //Moneyboxクラスのインスタンスを格納（委譲）
    double _rate; //privateは省略
    public Exchange(int _firstYen, double _rate) {
        _moneybox = new Moneybox(_firstYen); //ここがポイント
        this._rate = _rate;
    }
    public void AddYen(int _yen) { 
        _moneybox.Add(_yen); //ポイント
    }
    public double GetDollar() { 
        return _moneybox.GetYen() / _rate; //ポイント
    }
}
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
作成者：Takashi Nishimura  
更新日：2017年07月XX日


<a name="Bridge"></a>
# <b><ruby>Bridge<rt>ブリッジ</rt></ruby></b>

### 概要
* 「機能」の階層と「実装」の階層を分ける。
* 例えば、Linux、Windows、MacOS を対象にした UI を実装する際、つい ① LinuxButton ② WindowsButton ③ MacOSButton の3つのクラスを作成してしまいがちですが、そうではなく ① Linux ② Windows ③ MacOS、そして④ Button の4つのクラスに分けて考えて作るのが、この Bridge パターンです。Bridge パターンを使うと、「新しい機能」や「新しい実装」を追加したい際、合理的です。
* 「機能」クラスと「実装」クラスの「橋」渡しには「委譲」を使います。

### 例文
```
//test.cs
using System;

//メインクラス
class Test {
    static void Main() {
        Tablet _tablet1 = new Tablet(new Android());
        Console.WriteLine(_tablet1.Version); //Android 7.1.2
        _tablet1.BigScreen(); //大きな画面で見る
        
        Tablet _tablet2 = new Tablet(new IOS());
        Console.WriteLine(_tablet2.Version); //iOS 10.3.1
        
        SmartPhone _smartPhone1 = new SmartPhone(new Android());
        Console.WriteLine(_smartPhone1.Version); //Android 7.1.2
        _smartPhone1.Phone(); //電話をかける
        
        SmartPhone _smartPhone2 = new SmartPhone(new IOS());
        Console.WriteLine(_smartPhone2.Version); //iOS 10.3.1
    }
}

//基本クラス＝「機能」のクラスの最上位
class SuperMobile {
    private AbstractOS _os; //「機能」クラスと「実装」クラスの「橋」（委譲）
    public SuperMobile(AbstractOS _os) { //コンストラクタ
        this._os = _os;
    }
    public string Version {
        get { return _os.rawVersion; } //「橋」を使って「実装」クラスにアクセス
        private set {} //外部からアクセス不可（読み取り専用）
    }
}

//「機能」のクラスに機能を追加したクラス
class Tablet : SuperMobile {
    public Tablet(AbstractOS _os) : base(_os) {} //親クラスのコンストラクタ呼出し
    public void BigScreen() { //タブレット特有の機能
        Console.WriteLine("大きな画面で見る");
    }
}

//「機能」のクラスに機能を追加したクラス
class SmartPhone : SuperMobile {
    public SmartPhone(AbstractOS _os) : base(_os) {} //親クラスのコンストラクタ呼出し
    public void Phone() { //スマートフォン特有の機能
        Console.WriteLine("電話をかける");
    }
}

//抽象クラス＝「実装」のクラスの最上位
abstract class AbstractOS {
    public abstract string rawVersion { get; set; } //抽象メソッドの宣言
}

//「実装」の具体的な実装者
class Android : AbstractOS {
    private string _version = "Android 7.1.2";
    public override string rawVersion { //オーバーライドして実際の処理を記述
        get { return _version; }
        set {}
    }
}

//「実装」の具体的な実装者
class IOS : AbstractOS {
    private string _version = "iOS 10.3.1";
    public override string rawVersion { //オーバーライドして実際の処理を記述
        get { return _version; }
        set {}
    }
}
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
作成者：Takashi Nishimura  
更新日：2017年07月XX日


<a name="Composite"></a>
# <b><ruby>Composite<rt>コンポジット</rt></ruby></b>

### 概要
* 容器と中身の同一視。合成物。
* 代表的な例はファイルシステム。ディレクトリとファイルは異なるものですが、どちらも「ディレクトリの中に入れることができるもの」です。つまり、同じ種類のものであると見なしている＝同一視です。
ディレクトリ（＝容器）とファイル（＝中身）の両方にとって、共通のインターフェースとして機能し「同じメソッド」を呼び出せるようにするのです。
* 以下のサンプルは root に Authoring フォルダを作成し、その中に Unity3D と Unreal Engine ファイルを格納してみます。

### 例文
```
//test.cs
using System;
using System.Collections.Generic; //Listに必要

/**************
 * メインクラス
**************/
class Test {
    static void Main() {
        //①フォルダの作成
        Folder _root = new Folder("root");
        Folder _authoring = new Folder("Authoring");
        //②ファイルの作成
        File _unity3d = new File("Unity3D");
        File _unrealEngine = new File("Unreal Engine");
        //③関連付け
        _root.Add(_authoring); 
        _authoring.Add(_unity3d);
        _authoring.Add(_unrealEngine);
        //④検証
        Console.WriteLine(_unrealEngine.GetName()); //"Unreal Engine"
        _root.GetList(); //"root/Authoring(Folder)"
        _authoring.GetList();
        //"Authoring/Unity3D(File)"
        //"Authoring/Unreal Engine(File)"
        _unity3d.GetList(); //"Authoring/Unity3D(File)"
    }
}

/*********************************
 * 抽象クラス（同一視するための役）
*********************************/
abstract class Component {
    protected string _name; //共通プロパティ
    protected Folder _parent; //共通プロパティ
    public string GetName() { return _name; } //共通メソッド
    public Folder Parent { //共通get/set
        get { return _parent; }
        set { _parent = value; }
    }
    public abstract void GetList(); //抽象メソッドの宣言（処理は派生クラスに記述）
}

/*********************************
 * Folderクラス（抽象クラスを実装）
*********************************/
class Folder : Component { //Directoryは不可
    private List<Component> _childList = new List<Component>(); //空のListを作成
    public Folder(string _name) { //コンストラクタ
        this._name = _name; 
    }
    public void Add(Component arg) { //Remove()は今回は省略
        _childList.Add(arg);
        arg.Parent = this;
    }
    public override void GetList() { //オーバーライドして実際の処理を記述
        foreach (Component tmp in _childList) {
            string _result = this.GetName() + "/" + tmp.GetName();
            if (tmp is Folder) {
                _result += "(Folder)"; 
            } else if (tmp is File) {
                _result += "(File)";
            }
            Console.WriteLine(_result);
        }
    }
}

/*******************************
 * Fileクラス（抽象クラスを実装）
*******************************/
class File : Component {
    public File(string _name) { //コンストラクタ
        this._name = _name;
    }
    public override void GetList() { //オーバーライドして実際の処理を記述
        Console.WriteLine(this.Parent.GetName() + "/" + this.GetName() + "(File)");
    }
}
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
作成者：Takashi Nishimura  
更新日：2017年07月XX日


<a name="Decorator"></a>
# <b><ruby>Decorator<rt>デコレータ</rt></ruby></b>

### 概要
* 飾り枠と中身の同一視。装飾者。
* 継承によって中身（Original）と飾り枠（DecoratorXXX）に同じ Show() メソッドを持たせることで、包まれるもの（Originalクラス）を変更することなく、機能の追加（装飾）をすることを可能にします。
* 例文では SuperDecorator を省略し、ICommon + SuperDecorator を合わせて Display クラスにしています。

### 例文
```
//test.cs
using System;

//メインクラス
class Test {
    static void Main() {
        Display _original = new Original("TAKASHI");
        _original.Show(); //TAKASHI
        
        Display _decorator1 = new Decorator1(new Original("TAKASHI"));
        _decorator1.Show(); //-TAKASHI-
        
        Display _decorator2 = new Decorator2(new Original("TAKASHI"));
        _decorator2.Show(); //<TAKASHI>
        
        Display _special = new Decorator2(
                                    new Decorator1(
                                        new Decorator1(
                                            new Decorator1(
                                                new Original("TAKASHI")
                                            )
                                        )
                                    )
                                );
        _special.Show(); //<---TAKASHI--->
    }
}

//「中身」と「飾り枠」に同じShow()メソッドを持たせるための基本クラス
class Display {
    protected string _content;
    public string getContent() {
        return _content;
    }
    public void Show() {
        Console.WriteLine(_content);
    }
}

//中身（飾りを施す前の元）
class Original : Display {
    //コンストラクタ
    public Original(string arg) {
        _content = arg; //_conentは基本クラスからの継承
    }
}

//飾り枠①
class Decorator1 : Display {
    //コンストラクタ
    public Decorator1(Display _display) {
        _content = "-" + _display.getContent() + "-"; //飾り①を付ける
    }
}

//飾り枠②
class Decorator2 : Display {
    public Decorator2(Display _display) { //コンストラクタ
        _content = "<" + _display.getContent() + ">"; //飾り②を付ける
    }
}
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
作成者：Takashi Nishimura  
更新日：2017年07月XX日


<a name="Facade"></a>
# <b><ruby>Facade<rt>ファサード</rt></ruby></b>

### 概要
* シンプルな窓口。見かけ。
* ファサード＝「建物の正面」の意味。
* たくさんのクラスやメソッドを、このパターン（窓口）を使うことでシンプルにして迷いを生じさせないようにします。
* 以下の例文では、「Decoratorパターン」をFacadeパターンでシンプルにします。
    ```
    Display _special = new Decorator2(
                                new Decorator1(
                                    new Decorator1(
                                        new Decorator1(
                                            new Original("TAKASHI")))));
    _special.Show();
    ```
    …としていたものを次の1行で実現可能になります。
    ```
    DecoratorFacade.exec("TAKASHI", 3, 1);
    ```

### 例文
```
//test.cs
using System;
class Test {
    static void Main() {
        //メイン内がシンプルになります
        DecoratorFacade.Exec("TAKASHI"); //TAKASHI
        DecoratorFacade.Exec("TAKASHI", 1, 0); //-TAKASHI-
        DecoratorFacade.Exec("TAKASHI", 0, 1); //<TAKASHI>
        DecoratorFacade.Exec("TAKASHI", 3, 1); //<---TAKASHI--->
    }
}

//シンプルな窓口 ←Decoratorパターンにこのクラスを追加するだけ
class DecoratorFacade { //Singletonパターン的に…
    private DecoratorFacade() {} //privateにして外部からnewできないようにする
    public static void Exec(string arg1, int arg2=0, int arg3=0) {
        Display _result = new Original(arg1);
        for (int i=0; i<arg2; i++) {
            _result = new Decorator1(_result);
        }
        for (int j=0; j<arg3; j++) {
            _result = new Decorator2(_result);
        }
        _result.Show();
    }
}

//以下の4つのクラスはDecoratorパターンの例文と全く同じ
class Display {
    protected string _content;
    public string getContent() {
        return _content;
    }
    public void Show() {
        Console.WriteLine(_content);
    }
}

class Original : Display {
    public Original(string arg) {
        _content = arg;
    }
}

class Decorator1 : Display {
    public Decorator1(Display _display) {
        _content = "-" + _display.getContent() + "-";
    }
}

class Decorator2 : Display {
    public Decorator2(Display _display) {
        _content = "<" + _display.getContent() + ">";
    }
}
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
作成者：Takashi Nishimura  
更新日：2017年07月XX日


<a name="Flyweight"></a>
# <b><ruby>Flyweight<rt>フライウエイト</rt></ruby></b>

### 概要
* 同じものを共有して無駄をなくす。
* フライ級（軽量級）。
* インスタンスをできるかぎり共有させて無駄に new しない…ということがポイント。
* 外部ファイルを読み込むなど「メモリの使用量」が多い場合などに有効です。
* 以下の例文では、外部テキストとして2つのファイルを使用します。
    * A.txt（"あいうえお"＝あ行）
    * KA.txt（"かきくけこ"＝か行）

### 例文
```
//test.cs
using System;
using System.Collections.Generic; //Dictionaryに必要
using System.IO; //StreamReaderに必要

/********
 * メイン
********/
class Test {
    static void Main() {
        //インスタンスの管理者を作る（シングルトンクラス）
        Manager _manager = Manager.GetInstance();
        
        //無駄に生成したくないオブジェクトを生成（既存の場合使いまわす）
        Reader _A = _manager.CreateReader("A");
        Reader _KA = _manager.CreateReader("KA");
        
        //既存のものを生成しようとすると…
        Reader _A2 = _manager.CreateReader("A"); //Aは既存です
        Console.WriteLine(_A == _A2); //True ←中身は同じインスタンス
        
        Console.WriteLine(_A.GetText()); //あいうえお
        Console.WriteLine(_KA.GetText()); //かきくけこ
    }
}

/******************************************
 * インスタンスの管理人（シングルトンクラス）
******************************************/
class Manager {
    private static Manager _manager = new Manager(); //シングルトン用
    private Dictionary<string, Reader> _dic = new Dictionary<string, Reader>();
    
    private Manager() {} //外部からnew Singleton()できないようにする
    
    public static Manager GetInstance() { //外部から唯一のインスタンスを呼出す
        return _manager; //唯一のインスタンス（静的変数）を返す
    }
    
    public Reader CreateReader(string arg) {
        bool _result = _dic.ContainsKey(arg); //既存か否か調べる
        if (!_result) { //_dic[arg]が存在しない場合…
            _dic.Add(arg, new Reader(arg)); //ここでやっと new Reader()
        } else { //_dic[arg]が既存の場合…（確認用）
            Console.WriteLine(arg + "は既存です");
        }
        return _dic[arg];
    }
}

/***************************************************************
 * フライ級の役（メモリの使用量が多いため無駄に生成したくないもの）
***************************************************************/
class Reader {
    private string _text; //外部から読み込んだテキストを格納
    public Reader(string arg) {
        string _path = arg + ".txt";
        StreamReader _stream = File.OpenText(_path);
        _text = _stream.ReadToEnd(); //全ての内容を読み込む
        _stream.Close(); //閉じる
    }
    public string GetText() {
        return _text;
    }
}
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
作成者：Takashi Nishimura  
更新日：2017年07月XX日


<a name="Proxy"></a>
# <b><ruby>Proxy<rt>プロキシー</rt></ruby></b>

### 概要
* 必要になってから作る。代理人。
* 本当に処理が必要になるまで、オブジェクトの生成を保留して待機。そして必要なタイミングでオブジェクトを生成します。
* Proxy パターンを使う場面は次のような場面です。
    * オブジェクトのロードに時間を要する。
    * 計算結果を出すのに時間がかかり、計算を実行している間に途中経過を表示する必要がある。
    * ネットワーク経由でロードするのに時間がかかる。
    * オブジェクトにアクセスする為に権限が必要で、Proxyがユーザに代り権利の承認を受ける。

### 例文
```
//test.cs
using System;
using System.IO; //StreamReaderに必要

// メインクラス
class Test {
    static void Main() {
        string _path = "sample.txt";
        
        //代理人（Proxy）役
        Loader _loader = new Loader(_path);
        
        //通常は、必要になった時に実際にロード
        _loader.Load();
    }
}

//==========================================
// ① Loader と ② Content のインターフェース
//==========================================
interface ILoader {
    void Load(); //暗黙的にpublicになる
}

//====================
// ①代理人（Proxy）役
//====================
class Loader : ILoader {
    private string _path; //privateは省略可
    public Loader(string _path) {
        this._path = _path;
    }
    public void Load() {
        //実際の本人が登場（代理人は実際の本人を知っている）
        Content _content = new Content(_path);
        _content.Load();
    }
}

//=============
// ②実際の本人
//=============
class Content : ILoader {
    private string _path; //privateは省略可
    public Content(string _path) {
        this._path = _path;
    }
    //重い処理をここで行う←ポイント
    public void Load() {
        //今回のサンプルの中身は重要ではない
        StreamReader _stream = File.OpenText(_path);
        string _text = _stream.ReadToEnd(); //全ての内容を読み込む
        _stream.Close(); //閉じる
        Console.WriteLine(_text);
    }
}
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
作成者：Takashi Nishimura  
更新日：2017年07月XX日


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
//test.cs
using System;
using System.Collections.Generic; //Listに必要

/**********
 * メイン
**********/
class Test {
    static void Main() {
        BikePark _bikePark = new BikePark();

        _bikePark.Add(new Bike("CB1100F", "神戸 X XX-XX"));
        _bikePark.Add(new Bike("W800", "宇都宮 X XX-XX"));
        _bikePark.Add(new Bike("SR400", "杉並区 X XX-XX"));
        
        Iterator _iterator = _bikePark.CreateIterator(); //イテレータ（管理人）生成
        
        while(_iterator.HasNext()) {
            Bike _nextBike = _iterator.Next();
            Console.WriteLine(_nextBike.GetName() + "," + _nextBike.GetNum());
        }
    }
}

/*************
 * Bikeクラス
*************/
class Bike {
    string _name, _num; //privateは省略
    public Bike(string _name, string _num) { //コンストラクタ
        this._name = _name;
        this._num = _num;
    }
    public string GetName() {	return _name; }
    public string GetNum() { return _num; }
}

/*****************
 * BikeParkクラス
*****************/
interface IBikePark {
    void Add(Bike arg); //暗黙的にpublicになる
    Bike GetBikeAt(int arg);
    int GetLength();
    Iterator CreateIterator();
}

class BikePark : IBikePark {
    List<Bike> _list = new List<Bike>(); //空のListを作成 
    public void Add(Bike arg) { _list.Add(arg); }
    public Bike GetBikeAt(int arg) {	return _list[arg]; }
    public int GetLength() { return _list.Count; }
    public Iterator CreateIterator() { return new Iterator(this); } //イテレータ生成
}

/***********************************
 * Iteratorクラス（≒駐輪場の管理人）
***********************************/
interface IIterator {
    bool HasNext(); //暗黙的にpublicになる
    Bike Next();
}

class Iterator : IIterator {
    BikePark _bikePark;
    int _count = 0;
    public Iterator(BikePark arg) { //コンストラクタ
        this._bikePark = arg;
    }
    public bool HasNext() { return _bikePark.GetLength() > _count; }
    public Bike Next() { return _bikePark.GetBikeAt(_count++); } //次のバイクを返す
}
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
作成者：Takashi Nishimura  
更新日：2017年07月XX日


<a name="TemplateMethod"></a>
# <b><ruby>Template Method<rt>テンプレート メソッド</rt></ruby></b>

### 概要
* 具体的な処理をサブクラスにまかせる。ひな型メソッド。
* 基本クラス（親クラス）で、一連の（瞬時に実行する連続した）処理の枠組みを定義し、それを継承する派生クラス（子クラス）で具体的処理を定義する…というデザインパターン。
* 処理フローは「ほぼ」同じだが、一部だけ処理内容が異なるといった場合に利用。

### 例文
```
//test.cs
using System;

//メイン
class Test {
    static void Main() {
        CardHaruko _cardHaruko = new CardHaruko();
        _cardHaruko.TemplateMethod();
        /*
        HAPPY NEW YEAR
        テニスがんばろうね
        */
        
        CardHanako _cardHanako = new CardHanako();
        _cardHanako.TemplateMethod();
        /*
        HAPPY NEW YEAR
        本年も宜しくお願い致します
        今年みんなで集まろう
        */
    }
}

//===================================
//抽象クラス
//===================================
abstract class AbstractCard {
    public void TemplateMethod() { //一連の連続した処理の枠組みを定義
        Order1(); //共通の処理
        if (IsAdult()) { //フックメソッド（派生クラスでoverride）
            Order2(); //条件により実行
        }
        Order3(); //派生クラスでoverride
    }
    private void Order1() { //共通の処理（privateは省略可）
        Console.WriteLine("HAPPY NEW YEAR");
    }
    protected abstract bool IsAdult(); //抽象メソッドの宣言
    private void Order2() { //条件により実行（privateは省略可）
        Console.WriteLine("本年も宜しくお願い致します");
    }
    protected abstract void Order3(); //抽象メソッドの宣言
}

//===================================
//派生クラス①（抽象クラスを継承）
//===================================
class CardHaruko : AbstractCard {
    //フックメソッドの実際の定義
    protected override bool IsAdult() {
        return false;
    }
    protected override void Order3() {
        Console.WriteLine("テニスがんばろうね");
    }
}

//===================================
//派生クラス②（抽象クラスを継承）
//===================================
class CardHanako : AbstractCard {
    //フックメソッドをoverrideして具体的処理を記述
    protected override  bool IsAdult() {
        return true;
    }
    //抽象メソッドをoverrideして具体的処理を記述
    protected override void Order3() {
        Console.WriteLine("今年みんなで集まろう");
    }
}
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
作成者：Takashi Nishimura  
更新日：2017年07月XX日


<a name="Strategy"></a>
# <b><ruby>Strategy<rt>ストラテジー</rt></ruby></b>

### 概要
* アルゴリズムをごっそり切り替える。戦略。Strategy ＝作戦。アルゴリズム（手順）。
* State パターン（後述）に似ていますが、State パターンの場合は…
    ```
    new Context()
    ```
    Strategyパターンの場合…
    ```
    new Context(new Strategy())
    ```
    …となります。

### 例文
```
//test.cs
using System;

// メインクラス
class Test {
    static void Main() {
        Janken _jankenA = new Janken(new StrategyA());
        Janken _jankenB = new Janken(new StrategyB());
        _jankenA.Exec(); //グー、グー、パー
        _jankenB.Exec(); //パー、グー、チョキ
    }
}

// StrategyXXX クラス
interface IStrategy {
    void Execute(); //暗黙的にpublicになる
}
class StrategyA : IStrategy {
    public void Execute() { Console.WriteLine("グー、グー、パー");	}
}
class StrategyB : IStrategy {
    public void Execute() { Console.WriteLine("パー、グー、チョキ"); 	}
}

// Janken クラス
class Janken {
    private IStrategy _strategy;
    public Janken(IStrategy _strategy) { this._strategy = _strategy; }
    public void Exec() { _strategy.Execute(); } //Exec()だと紛らわしいので…
}
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
作成者：Takashi Nishimura  
更新日：2017年07月XX日


<a name="Visitor"></a>
# <b><ruby>Visitor<rt>ビジター</rt></ruby></b>

### 概要
* 構造を渡り歩きながら仕事をする。訪問者。
* データ構造と処理を分離することがこのパターンの目的。
* 新しい処理を追加したい時は、訪問者（Visitor）を追加する。
* 家庭訪問に例えると…親御さん方は、訪問者＝先生が代わっても、これまで受け入れてきたのと同じメソッドを実行すれば良いのです。どの先生が来るかによって、いろいろとメソッドを用意していたら、親御さん方も大変ですから…。

### 例文
```
//test.cs
using System;

// メインクラス
class Test {
    static void Main() {
        //訪問先
        Hokkaido _saitama = new Hokkaido(); //北海道祖父母
        Chiba _chiba = new Chiba(); //千葉県親戚
        
        //訪問者
        Ichiro _ichiro = new Ichiro(); //一郎
        Haruko _haruko = new Haruko(); //春子
        
        //訪問する（訪問側から見ると「受け入れる」）
        _saitama.Accept(_ichiro);
        _saitama.Accept(_haruko);
        _chiba.Accept(_ichiro);
        _chiba.Accept(_haruko);
        
        //結果…
        Console.WriteLine(_ichiro.GetMoney()); //15000
        Console.WriteLine(_haruko.GetMoney()); //15000
    }
}

//=========
// 訪問先
//=========
interface IAcceptor {
    void Accept(IVisitor _visitor); //暗黙的にpublicになる
}

class Hokkaido : IAcceptor {
    private int _otoshidama = 5000*2; //お年玉
    public void Accept(IVisitor _visitor) { //Accept＝受け入れる
        _visitor.Visit(_otoshidama); //誰が訪問してきても同じメソッドを実行
    }
}

class Chiba : IAcceptor {
    private int _otoshidama = 5000; //お年玉
    public void Accept(IVisitor _visitor) { //Accept＝受け入れる
        _visitor.Visit(_otoshidama); //誰が訪問してきても同じメソッドを実行
    }
}

//========
// 訪問者
//========
interface IVisitor {
    void Visit(int _otoshidama);  //暗黙的にpublicになる
    int GetMoney(); //暗黙的にpublicになる
}

class Ichiro : IVisitor { //一郎
    private int _money = 0; //貯金
    public void Visit(int _otoshidama) { _money += _otoshidama; }
    public int GetMoney() { return _money; }
}

class Haruko : IVisitor { //春子
    private int _money = 0; //貯金
    public void Visit(int _otoshidama) { _money += _otoshidama; }
    public int GetMoney() { return _money; }
}
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
作成者：Takashi Nishimura  
更新日：2017年07月XX日


<a name="ChainofResponsibility"></a>
# <b><ruby>Chain of Responsibility<rt>チェーン オブ レスポンシビリティ</rt></ruby></b>

### 概要
* 責任のたらいまわし。責任の連鎖。
* 自分（クラス）で処理できるなら処理する。処理できないなら、次の人（クラス）に、たらい回しにする…というのがこのパターン。
* マウス関連のイベント処理等で使用。
* 新たな処理者のクラスを簡単に追加することが容易に可能。

### 例文
```
//test.cs
using System;

// メインクラス
class Test {
    static void Main() {
        //郵便局の設置
        AbstractPO _shinjukuPO = new ShinjukuPO();
        AbstractPO _tokyoPO = new TokyoPO();
        AbstractPO _japanPO = new JapanPO();
        
        //責任のたらいまわしのセット
        _shinjukuPO.SetNext(_tokyoPO).SetNext(_japanPO);
        
        //投函（全て新宿郵便局に投函する）
        _shinjukuPO.Send("新宿区XX町X-X-X"); //本日中に届きます
        _shinjukuPO.Send("東京都青梅市XXX町X-X-X"); //明後日中に届きます
        _shinjukuPO.Send("北海道XXX市XXX町X-X-X"); //一週間前後で届きます
    }
}

//=====================
// 各郵便局の抽象クラス
//=====================
abstract class AbstractPO {
    //共通の機能
    protected AbstractPO _nextPO; //たらいまわし先
    public AbstractPO SetNext(AbstractPO _po) {
        _nextPO = _po;
        return _nextPO;
    }
    //抽象メソッド（子クラスでoverride）	
    public abstract void Send(string _address);
}

//=====================
// 新宿郵便局
//=====================
class ShinjukuPO : AbstractPO {
    public override void Send(string _address) { //抽象メソッドの実際の処理
        if (_address.IndexOf("新宿",0) != -1) {
            Console.WriteLine("本日中に届きます");
        } else {
            _nextPO.Send(_address); //たらいまわし先に振る ←ポイント
        }
    }
}

//=====================
// 東京郵便局
//=====================
class TokyoPO : AbstractPO {
    public override void Send(string _address) { //抽象メソッドの実際の処理
        if (_address.IndexOf("東京",0) != -1) {
            Console.WriteLine("明後日中に届きます");
        } else {
            _nextPO.Send(_address); //たらいまわし先に振る ←ポイント
        }
    }	
}

//==========================
//日本郵便局
//==========================
class JapanPO : AbstractPO {
    public override void Send(string _address) { //抽象メソッドの実際の処理
        Console.WriteLine("一週間前後で届きます");
    }
}
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
作成者：Takashi Nishimura  
更新日：2017年07月XX日


<a name="Mediator"></a>
# <b><ruby>Mediator<rt>メディエイター</rt></ruby></b>

### 概要
* 相手は相談役１人だけ。調停者。
* メンバーの皆さん（ColleagueXXX）は相談役の私（Mediator）に状況を報告して下さい。そうしたら、私は全体を考慮した上で皆さんに指示を出しましょう。でも私は、皆さんの仕事の詳細まではとやかく言いませんからね、というパターン。メンバー同士は、その存在すら知る必要はない。
* Mediator 役のクラスは、専門性が高くなるので、使い捨てとなります。

### 例文
```
//test.cs
using System;
using System.Collections.Generic; //Listに必要
class Test {
    static void Main() {
        //相談役
        new Mediator(); //今回のサンプルではこのインスタンスは使用しない
        
        //検証（今回は静的変数を使いました）
        Mediator.MemberA.Request("西へ行く"); //メンバーAから報告
        /*
        MemberA: （Aよ）了解、そのまま西へ行け
        MemberB: （Bよ）東へ行け
        MemberC: （Cよ）その場で待機しろ
        */
    }
}

//====================================
// 相談役（専門性が高いため使い捨て）
//====================================
class Mediator {
    List<AbstractMember> _memberList = new List<AbstractMember>(); //メンバーリスト
    public static AbstractMember MemberA = new MemberA(); //静的変数
    public static AbstractMember MemberB = new MemberB(); //静的変数
    public static AbstractMember MemberC = new MemberC(); //静的変数
    
    public Mediator() { //コンストラクタ
        //メンバーの登録
        AddMember(MemberA); //★
        AddMember(MemberB); //★
        AddMember(MemberC); //★
    }
    
    //メンバーリストに登録
    private void AddMember(AbstractMember _member) { //←★
        _memberList.Add(_member);
        _member.SetMediator(this); //メンバーに相談役は自分であることを教える
    }
    
    //メンバーからの報告を受け指示を出す（特に専門性が高いメソッド）←⦿
    public void Request(AbstractMember _member, string _string) {
        if (_member == MemberA) {
            if (_string == "西へ行く") {
                //「メンバーA」から「西へ行く」と報告があった場合の処理
                _member.Advice("（Aよ）了解、そのまま西へ行け"); //Aへ指示
                foreach (AbstractMember theMember in _memberList) {
                    if (theMember == MemberB) {
                        theMember.Advice("（Bよ）東へ行け"); //Bへ指示
                    } else if (theMember == MemberC) {
                        theMember.Advice("（Cよ）その場で待機しろ"); //Cへ指示
                    }
                }
            }
        }
        //以降、各メンバーからの報告内容に対する処理を記述
    }
}

//====================
// 登録するメンバー達
//====================
//抽象クラス
abstract class AbstractMember {
    //共通の機能
    protected Mediator _mediator;
    public void SetMediator(Mediator _mediator) {
        this._mediator = _mediator;
    }	
    //抽象メソッドの宣言（派生クラスでoverride）
    public abstract void Request(string _string);
    public abstract void Advice(string _string);
}

//メンバーA
class MemberA : AbstractMember {
    public override void Request(string _string) { //抽象メソッドをoverride
        //ここにメンバーA独自の処理など
        _mediator.Request(this, _string); //相談役に報告→⦿
    }
    public override void Advice(string _string) { //相談役からの指示を受ける
        Console.WriteLine("MemberA: " + _string);
    }
}

//メンバーB
class MemberB : AbstractMember {
    public override void Request(string _string) { //抽象メソッドをoverride
        //ここにメンバーB独自の処理など
        _mediator.Request(this, _string); //相談役に報告→⦿
    }
    public override void Advice(string _string) { //相談役からの指示を受ける
        Console.WriteLine("MemberA: " + _string);
    }
}

//メンバーC
class MemberC : AbstractMember {
    public override void Request(string _string) { //抽象メソッドをoverride
        //ここにメンバーC独自の処理など
        _mediator.Request(this, _string); //相談役に報告→⦿
    }
    public override void Advice(string _string) { //相談役からの指示を受ける
        Console.WriteLine("MemberA: " + _string);
    }
}
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
作成者：Takashi Nishimura  
更新日：2017年07月XX日


<a name="Observer"></a>
# <b><ruby>Observer<rt>オブザーバ</rt></ruby></b>

### 概要
* 状態の変化を通知する。観察者。
* ECMAScript の addEventListener は能動的な観察。それに対し、Observer パターンは、受動的な観察と言える。
* 例えば OS メーカー（観察される役）が、OS をバージョンアップした場合、各端末に、状態の変化を通知。その通知を受けて各端末がアップデートをする…等。
* Mediator パターンに似ているが、Subuject 役、AddObserver()、RemoveObserver()、Notify() メソッドがあることが異なる。

### 例文
```
//test.cs
using System;
using System.Collections.Generic; //Listに必要

class Test {
    static void Main() {
        ISubject _apple = new Apple(); //観察される（Subject）役
        
        //リスナー（Observer）役
        IObserver _iPhone = new iPhone();
        IObserver _iPad = new iPad();
        IObserver _iPadPro = new iPadPro();
        
        //リスナー（Observer）の登録
        _apple.AddObserver(_iPhone);
        _apple.AddObserver(_iPad);
        _apple.AddObserver(_iPadPro);
        
        _apple.Notify(); //全リスナー（Observer）への通知
    }
}

interface ISubject {
    void AddObserver(IObserver _observer); //暗黙的にpublic扱い
    void RemoveObserver(IObserver _observer);
    void Notify();
}

class Apple : ISubject {
    List<IObserver> _observerList = new List<IObserver>(); //リスナーリスト
    public void AddObserver(IObserver _observer) { //リスナーの登録
        _observerList.Add(_observer);
    }
    public void RemoveObserver(IObserver _observer) { //リスナーの削除
        _observerList.Remove(_observer);
    }
    public void Notify() { //全リスナーへの通知
        foreach (IObserver _observer in _observerList) {
            _observer.Update(this);
        }
    }
    public string GetVersion() { return "10.3.1"; }
}

interface IObserver {
    void Update(Apple _apple); //暗黙的にpublic扱い
}

class iPhone : IObserver { //本来は大文字で始まるべきですが…
    public void Update(Apple _apple) {
        Console.WriteLine("iPhoneは" + _apple.GetVersion() + "にアップデート可能");
    }
}

class iPad : IObserver { //本来は大文字で始まるべきですが…
    public void Update(Apple _apple) {
        Console.WriteLine("iPadは" + _apple.GetVersion() + "にアップデート可能");
    }
}

class iPadPro : IObserver { //本来は大文字で始まるべきですが…
    public void Update(Apple _apple) {
        Console.WriteLine("iPadProは" + _apple.GetVersion() + "にアップデート可能");
    }
}
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
作成者：Takashi Nishimura  
更新日：2017年07月XX日


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
//test.cs
using System;
using System.Collections.Generic; //Listに必要
class Test {
    static void Main() {
        Gamer _gamer = new Gamer(100); //ゲームスタート（最初のポイントは100）
        SnapShot _snapShot = _gamer.Save(); //最初の状態を保存
        
        _gamer.Point = 2000; //いろいろゲームが進行して2000ポイントに…
        _snapShot = _gamer.Save(); //この時点での状態を保存
        
        _gamer.Point = 8000; //更にゲームが進行して8000ポイントに…
        _snapShot = _gamer.Save(); //この時点での状態を保存
        
        _gamer.History(); //履歴を調べる
        //	0:100
        // 1:2000
        // 2:8000
        
        _snapShot = _gamer.Undo(); //Undo（やり直し）
        Console.WriteLine(_snapShot.Point); //2000
        _snapShot = _gamer.Undo();
        Console.WriteLine(_snapShot.Point); //100
        _snapShot = _gamer.Undo();
        Console.WriteLine(_snapShot.Point); //これ以上、Undoできません 100
        
        _snapShot = _gamer.Redo(); //Redo（再実行）
        Console.WriteLine(_snapShot.Point); //2000
        _snapShot = _gamer.Redo();
        Console.WriteLine(_snapShot.Point); //8000
        _snapShot = _gamer.Redo();
        Console.WriteLine(_snapShot.Point); //これ以上、Redoできません 8000
    }
}

//============================
//主人公役 + バックアップ係
//============================
class Gamer {
    int _point;
    List<SnapShot> _history = new List<SnapShot>(); //履歴用リスト
    int _count; //Undo、Redo用
    
    public Gamer(int _point=0) { //コンストラクタ
        this._point = _point;
    }
    
    public int Point {
        get { return _point; }
        set { _point = value; }
    }

    //状態を保存	
    public SnapShot Save() {
        SnapShot _snapShot = new SnapShot(_point);
        _history.Add(_snapShot);
        _count = _history.Count - 1;
        return _snapShot;
    }
    
    //履歴	
    public void History() {
        for (int i=0; i < _history.Count; i++) {
            Console.WriteLine(i + ":" + _history[i].Point);
        }
    }
    
    //Undo（やり直し）
    public SnapShot Undo() {
        if (_count > 0) {
            return _history[--_count];
        } else {
            Console.WriteLine("これ以上、Undoできません");
            _count = 0;
            return _history[0];
        }
    }
    
    //Redo（再実行）
    public SnapShot Redo() {
        if (_count < _history.Count - 1) {
            return _history[++_count];
        } else {
            Console.WriteLine("これ以上、Redoできません");
            _count = _history.Count-1;
            return _history[_count];
        }
    }
}

//=============================================
// Memento役（その瞬間の状態をオブジェクト化）
//=============================================
class SnapShot {
    private int _point; //今回はシンプルに1つだけにしておきます
    public SnapShot(int _point) {
        this._point = _point;
    }
    public int Point {
        get { return _point; }
        set { _point = value; }
    }
}
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
作成者：Takashi Nishimura  
更新日：2017年07月XX日


<a name="State"></a>
# <b><ruby>State<rt>ステート</rt></ruby></b>

### 概要
* 状態をクラスとして表現。状態。
* Context オブジェクトが、異なる時点において、状態A（StateA）と状態B（StateB）のどちらとてでも振る舞うことができます。
* 例えばトグルスイッチのような動作。
* if 文などの条件分岐が散在し、保護が複雑になるのを避けることが可能。
* Strategy パターンに似ていて Strategy パターンの場合は…
    ```
    new Context(new Strategy())
    ```
    State パターンの場合は…
    ```
    new Context()
    ```
    …となります。

### 例文
```
//test.cs
using System;

//メイン
class Test {
    static void Main() {
        //Context役
        Janken _janken = new Janken();
        
        //State（状態）役
        IState _stateA = new StateA();
        IState _stateB = new StateB();
        
        //状態の設定＆実行
        _janken.SetState(_stateA);
        _janken.Exec(); //グー、グー、パー
        
        //状態の変更＆実行
        _janken.SetState(_stateB);
        _janken.Exec(); //パー、グー、チョキ
    }
}

//Context（状態を管理）役
class Janken {
    private IState _state; //状態（State○）を格納
    
    public void SetState(IState _state) {
        this._state = _state;
    }
    
    public void Exec() {
        _state.Execute(); //…→State○.Execute()メソッドを呼出す
    }
}

//=====================
// State（状態）役
//=====================
interface IState {
    void Execute(); //暗黙的にpublic扱い
}

//状態A
class StateA : IState {
    public void Execute() { //Janken.Exec()から呼び出される
        Console.WriteLine("グー、グー、パー");	
    }
}

//状態B
class StateB : IState {
    public void Execute() { //Janken.Exec()から呼び出される
        Console.WriteLine("パー、グー、チョキ");
    }
}
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
作成者：Takashi Nishimura  
更新日：2017年07月XX日


<a name="Command"></a>
# <b><ruby>Command<rt>コマンド</rt></ruby></b>

### 概要
* 命令をクラスにする。命令。
* 命令を実行する度にインスタンスを作り、履歴として管理する。
* Memento パターンは「状態を保存」するのに対し、Command パターンはクラス化した「命令を保存」する。

### 例文
```
//test.cs
using System;
using System.Collections.Generic; //Listに必要

// メインクラス
class Test {
    static void Main() {
        Inkscape _inkscape = new Inkscape(); //グラフィックソフト
        
        //命令の実行
        _inkscape.Draw("線を引く");
        _inkscape.Draw("縁取る");
        _inkscape.Draw("影を付ける");
        
        //バッチ処理（オプション）
        _inkscape.Batch(1,3); //実行履歴の1個目〜3個を再度実行する
        //	……
        // 線を引く
        // 縁取る
        // 影を付ける
        // 線を引く
        // 縁取る
        // 影を付ける
    }
}

// グラフィックソフト
class Inkscape {
    Canvas _canvas = new Canvas(); //Receiver（結果を表示する）役
    List<DrawCommand> _history = new List<DrawCommand>(); //履歴（命令クラス）を保存
    //命令の実行
    public void Draw(string _command) {
        //↓命令を実行する度にインスタンス生成
        DrawCommand _drawCommand = new DrawCommand(_canvas, _command); 
        _drawCommand.Execute(); //実行（＝キャンバスの再描画）→★
        _history.Add(_drawCommand); //命令クラスを履歴に保存
    }
    
    public void Batch(int _start, int _end) { //バッチ処理（オプション）
        //_startと_endが配列の範囲外の場合のエラー処理は今回は省略
        List<DrawCommand> _batch = _history.GetRange(_start-1, _end);
        foreach (DrawCommand _drawCommand in _batch) {
            _drawCommand.Execute();
        }
    }
}

// 命令クラス
class DrawCommand {	
    private Canvas _canvas;
    private string _command;
    public DrawCommand(Canvas _canvas, string _command) { //コンストラクタ
        this._canvas = _canvas;
        this._command = _command;
    }
    public void Execute() { //←★Inkscape.Draw()から呼び出される
        _canvas.Update(_command); //⦿
    }
}

// 結果を表示する役＝Receiver（受信者）の役
class Canvas {
    List<string> _history = new List<string>(); //履歴（実際の処理）を保存
    //キャンバスの再描画
    public void Update(string _command) { //←⦿DrawCommand.Execute()から呼び出される
        _history.Add(_command);
        foreach (string _string in _history) {
            Console.WriteLine(_string);
        }
        Console.WriteLine("-----");
    }
}
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
作成者：Takashi Nishimura  
更新日：2017年07月XX日


<a name="Interpreter"></a>
# <b><ruby>Interpreter<rt>インタプリタ</rt></ruby></b>

### 概要
* 文法規則をクラスで表現する。通訳。
* 自作ミニ言語を使って、ミニ･プログラムを実行。ミニ･プログラムはそれだけでは動作しない為、通訳（interpreter）の役目（インタプリタ）を果たすものを用意。この通訳プログラムの事を、インタプリタと呼ぶ。
* 例文は、ActionScript、SWF、AVM（ActionScript Virtual Machine）を自作ミニ言語と見立てています。
* 例文は「終端となる表現の役」を省略しています。

### 例文
```
//test.cs
using System;

//メイン
class Test {
    static void Main() {
        string _code = "+10;*50;/2;-4;="; //自作言語による記述（≒ActionScript）
        SWF _swf = new SWF(_code); //≒SWFファイルに変換
        AVM _avm = new AVM(); //≒ActionScript Virtual Machine
        _avm.Execute(_swf); //≒SWFファイルをAVM上で実行（計算結果は246）
    }
}

//================================
//≒SWFファイルを生成するクラス
//================================
class SWF {
    private string[] _codeArray; //命令を配列化（中間コード）
    private int _count = 0; //GetNextCode()で使用
    
    //コンストラクタ
    public SWF(string _code) {
        _codeArray = _code.Split(';'); //「;」区切りで分割し配列化（中間コードに変換）
    }
    public string GetNextCode() { //次の命令を返す
        return _codeArray[_count++];
    }
    
    public bool IsEnd() { //次の命令があるかどうか…
        return _count >= _codeArray.Length;
    }
}

//================================
//≒ActionScript Virtual Machine
//================================
class AVM {
    public void Execute(SWF _swf) {
        int _result = 0; //計算結果

        while (!_swf.IsEnd()) { //次の命令があれば…

            string _nextCode = _swf.GetNextCode(); //次の命令を調べる

            //ここからはサンプルの独自処理
            string _operator = _nextCode.Substring(0,1); //「+*/-=」の何れか
            if (_operator != "=") {
                int _int = Int32.Parse(_nextCode.Substring(1));
                switch (_operator) {
                    case "+" : _result += _int; break;
                    case "-" : _result -= _int; break;
                    case "*" : _result *= _int; break;
                    case "/" : _result /= _int; break;
                    default :
                        Console.WriteLine("error:演算子が異なります");
                        break;
                }
            } else { //「=」の場合…
                //本来はここで「終端となる表現」のクラスを生成して処理をしますが省略
                Console.WriteLine(_result);
            }
        }
    }
}
```

実行環境：Ubuntu 16.04.2 LTS、Mono 4.2.1  
作成者：Takashi Nishimura  
更新日：2017年07月XX日