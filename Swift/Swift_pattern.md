### <b>この項目は書きかけの項目です</b>

# <b>Swift デザインパターン</b>

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
    ***
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

```
//test.swift

internal class Singleton { //internalは省略可
    internal static var isSinglton:Bool = false
    //↓クラス定数（internalは省略可）
    internal static let getSingleton:Singleton = Singleton() //インスタンス生成
    
    //コンストラクタ
    private init() { //privateにしても外部からSingleton()出来てしまう（要調査）
        if (!Singleton.isSinglton) {
            print("インスタンスの生成")
            Singleton.isSinglton = true
        } else {
            //本来はthrowを使ってエラーを出すべきでしょう...
            print("Singleton()ではなくSingleton.getSingletonで生成して下さい")
        }
    }
}

//var tmp = Singleton() //=> "Singleton()ではなくSingleton.getSingletonで生成して下さい"
var _singleton1:Singleton = Singleton.getSingleton //唯一のインスタンスを呼出す
var _singleton2:Singleton = Singleton.getSingleton //唯一のインスタンスを呼出す
print(_singleton1 === _singleton2) //=> true
```

実行環境：macOS 10.12.4、Swift 3.1  
作成者：Takashi Nishimura  
作成日：2016年08月02日  
更新日：2017年05月14日


<a name="Prototype"></a>
# <b><ruby>Prototype<rt>プロトタイプ</rt></ruby></b>

### ポイント
1. 複製には <b>インスタンス.clone()</b> を使う。
1. clone() メソッド内では、<b>クラス()</b> を使ってインスタンスを生成。そのインスタンスに複製元のプロパティをそのままコピーする。

### 例文
```
//test.swift

//プロトコル（≒インターフェース）の宣言
protocol IPrototype {
    func clone() -> Prototype
    var firstName:String { get set }
    var lastName:String { get set }
    var age:Int { get set }
}

internal class Prototype : IPrototype { //プロトコルの実装←internalは省略可
    //インスタンス変数の初期化
    private var _firstName:String = "HOGE"
    private var _lastName:String = "FUGA"
    private var _age:Int = 0
    
    //コンストラクタ
    init(lastName _lastName:String) {
        self._lastName = _lastName
    }

    internal func clone() -> Prototype { //internalは省略可
        var _copy:Prototype
        _copy = Prototype(lastName:_lastName) //自分自身を生成
        _copy.firstName = _firstName //プロパティを複製
        _copy.age = _age //プロパティを複製
        return _copy //全てのプロパティを複製したインスタンスを返す
    }

    internal var firstName:String { //internalは省略可
        get { return _firstName }
        set { _firstName = newValue }
    }

    internal var lastName:String { //internalは省略可
        get { return _lastName }
        set { _lastName = newValue }
    }

    internal var age:Int { //internalは省略可
        get { return _age }
        set { _age = newValue }
    }
}

//インスタンスを生成
var _prototype1:Prototype = Prototype(lastName:"Nishimura")
_prototype1.firstName = "Ichiro"
_prototype1.age = 30

//コピーを作成
var _prototype2:Prototype = _prototype1.clone() //複製する（Prototype()を使わない）
_prototype2.firstName = "Hanako"
_prototype2.age = 25

//検証（コピー元）
print(_prototype1.firstName) //=> "Ichiro"
print(_prototype1.lastName) //=> "Nishimura"
print(_prototype1.age) //=> 30

//検証（複製したもの）
print(_prototype2.firstName) //=> "Hanako" ←「参照」ではない
print(_prototype2.lastName) //=> "Nishimura"
print(_prototype2.age) //=> 25
```

実行環境：macOS 10.12.4、Swift 3.1  
作成者：Takashi Nishimura  
作成日：2016年08月05日  
更新日：2017年05月15日


<a name="Builder"></a>
# <b><ruby>Builder<rt>ビルダー</rt></ruby></b>

```
//test.swift（アクセス修飾子internalは省略）

//=============================
//Directorクラス（年賀印刷業者）
//=============================
class Director {
    //↓Builder○○クラスのインスタンスを格納（委譲）
    private var _builder:IBuilder
    //コンストラクタ
    init(builder _builder:IBuilder) {
        self._builder = _builder //builer_はBuilder○○クラスのインスタンス
    }
    //共通の手順（≠コンストラクタ。紛らわしいですが...）
    func construct() -> Void {
        _builder.makeHeader()  //手順①
        _builder.makeContent() //手順②
        _builder.makeFooter()  //手順③
    }
}

//=======================================
//BuilderXXXクラスのプロトコル（オプション）
//=======================================
protocol IBuilder {
    func makeHeader() -> Void
    func makeContent() -> Void
    func makeFooter() -> Void
}

//=====================================
//Builder○○クラス群（年賀状のタイプ群）
//=====================================
//タイプ009の年賀状
class Builder009 : IBuilder {
    func makeHeader() -> Void {
        Header051().exec() //ヘッダー用素材の呼出しと実行
    }
    func makeContent() -> Void {
        Content194().exec() //コンテンツ用素材の呼出しと実行
    }
    func makeFooter() -> Void {
        Footer004().exec() //フッター用素材の呼出しと実行
    }
}

//タイプ108の年賀状
class Builder108 : IBuilder {
    func makeHeader() -> Void {
        Header040().exec() //ヘッダー用素材の呼出しと実行
    }
    func makeContent() -> Void {
        Content023().exec() //コンテンツ用素材の呼出しと実行
    }
    func makeFooter() -> Void {
        Footer011().exec() //フッター用素材の呼出しと実行
    }
}

//====================================
//Header○○クラス群（ヘッダー用材料群）
//====================================
class Header040 {
    func exec() -> Void { print("HAPPY YEAR!") }
}

class Header051 {
    func exec() -> Void { print("あけましておめでとうございます") }
}

//=======================================
//Content○○クラス群（コンテンツ用材料群）
//=======================================
class Content023 {
    func exec() -> Void { print("タイプ023用のイラスト") }
}

class Content194 {
    func exec() -> Void { print("タイプ194用のイラスト") }
}

//====================================
//Footer○○クラス群（フッター用材料群）
//====================================
class Footer004 {
    func exec() -> Void { print("元旦") }
}

class Footer011 {
    func exec() -> Void { print("2018.1.1") }
}

//=======
//実行
//=======
var _director1:Director = Director(builder:Builder009())
_director1.construct() //共通の手順を実行
/*
あけましておめでとうございます
タイプ194用のイラスト
元旦
*/

var _director2:Director = Director(builder:Builder108())
_director2.construct() //共通の手順を実行
/*
HAPPY YEAR!
タイプ023用のイラスト
2018.1.1
*/
```

実行環境：macOS 10.12.4、Swift 3.1  
作成者：Takashi Nishimura  
作成日：2016年08月05日  
更新日：2017年05月15日


<a name="FactoryMethod"></a>
# <b><ruby>Factory Method<rt>ファクトリー メソッド</rt></ruby></b>

```
//test.swift

//===========
// 抽象クラス
//===========
class AbstractCard {
    func templateMethod(target _arg: String) -> Void {
        //↓ここでインスタンスを生成しない（汚さない）
        var _factoryMethod:IMessage
        _factoryMethod = factoryMethod(target:_arg)
        _factoryMethod.exec() //処理①
        order1() //処理②
        order2() //処理③
    }
    func factoryMethod(target _arg: String) -> IMessage { //サブクラスでoverride
        print("サブクラスでオーバーライドして実装して下さい")
        return MessageDummy() //苦肉の策
    }
    func order1() -> Void { //共通の処理
        print("〒XXX-XXXX 新宿区XX町-XX-XX")
    }
    func order2() -> Void { //サブクラスでoverride
        print("サブクラスでオーバーライドして実装して下さい")
    }
}

//===============================
// サブクラス群（抽象クラスを継承）
//===============================
class CardIchiro : AbstractCard {
    override func factoryMethod(target _arg: String) -> IMessage {
        if (_arg == "teacher") {
            return Message1() //ここでインスタンスを生成
        } else if (_arg == "friend") {
            return Message2() //ここでインスタンスを生成
        }
        return MessageDummy() //苦肉の策（Swift独特の力技）
    }
    override func order2() -> Void {
        print("西村一郎")
    }
}

class CardHanako : AbstractCard {
    override func factoryMethod(target _arg: String) -> IMessage {
        if (_arg == "teacher") {
            return Message3() //ここでインスタンスを生成
        } else if (_arg == "friend") {
            return Message4() //ここでインスタンスを生成
        } 
        return MessageDummy() //苦肉の策（Swift独特の力技）
    }
    override func order2() -> Void {
        print("西村花子")
    }
}

//==================
// 生成したいクラス群 
//==================
protocol IMessage { //プロトコル（≒インターフェース）の宣言
    func exec() -> Void //共通のメソッド
}
class Message1 : IMessage {
    func exec() -> Void {
        print("謹賀新年")
    }
}
class Message2 : IMessage {
    func exec() -> Void {
        print("HAPPY NEW YEAR!")
    }
}
class Message3 : IMessage {
    func exec() -> Void {
        print("明けましておめでとうございます")
    }
}
class Message4 : IMessage {
    func exec() -> Void {
        print("あけましておめでとう")
    }
}
class MessageDummy : IMessage { //苦肉の策（Swift独特の力技）
    func exec() -> Void { print("error:targetが存在しません") }
}

//=======
// 実行
//=======
var _cardIchiro: CardIchiro = CardIchiro()
_cardIchiro.templateMethod(target:"teacher")
/*
謹賀新年
〒XXX-XXXX 新宿区XX町-XX-XX
西村一郎
*/
_cardIchiro.templateMethod(target:"friend")
/*
HAPPY NEW YEAR!
〒XXX-XXXX 新宿区XX町-XX-XX
西村一郎
*/

var _cardHanako: CardHanako = CardHanako()
_cardHanako.templateMethod(target:"teacher")
/*
明けましておめでとうございます
〒XXX-XXXX 新宿区XX町-XX-XX
西村花子
*/
_cardHanako.templateMethod(target:"friend")
/*
あけましておめでとう
〒XXX-XXXX 新宿区XX町-XX-XX
西村花子
*/
```

実行環境：macOS 10.12.4、Swift 3.1  
作成者：Takashi Nishimura  
作成日：2016年08月08日  
更新日：2017年05月15日


<a name="AbstractFactory"></a>
# <b><ruby>Abstract Factory<rt>アブストラクト ファクトリー</rt></ruby></b>

```
//test.swift

//抽象クラス（抽象的な工場）
class AbstractFactory {
    static func createFactory(name _name:String) -> AbstractFactory { //静的メソッド
        if (_name == "ICHIRO") {
            return Ichiro() //具体的な「亨工場」を生成
        } else if (_name == "HANAKO") {
            return Hanako() //具体的な「幸子工場」を生成
        }
        return Dummy() //苦肉の策（Swift独特の力技）
    }
    func createNewYear() -> Void { //擬似抽象メソッド宣言
        print("サブクラスでオーバーライドして実装して下さい")
    }
    func createSummer() -> Void { //擬似抽象メソッド宣言
        print("サブクラスでオーバーライドして実装して下さい")
    }
}

//派生クラス群（実際の工場群）
class Ichiro : AbstractFactory { //抽象クラスを継承
    override func createNewYear() -> Void { //overrideして具体的処理を記述
        print("HAPPY NEW YEAR!")
        print("ICHIRO NISHIMURA")
    }
    override func createSummer() -> Void { //overrideして具体的処理を記述
        print("暑中お見舞い申し上げます")
        print("西村一郎")
    }
}

class Hanako : AbstractFactory { //抽象クラスを継承
    override func createNewYear() -> Void { //overrideして具体的処理を記述
        print("明けましておめでとうございます")
        print("西村花子")
    }
    override func createSummer() -> Void { //overrideして具体的処理を記述
        print("暑中おみまいもうしあげます")
        print("西村花子")
    }
}

class Dummy : AbstractFactory { //苦肉の策（Swift独特の力技）
    override func createNewYear() -> Void { print("error:nameが存在しません") }
    override func createSummer() -> Void { print("error:nameが存在しません") }
}

var _factoryIchiro:AbstractFactory = AbstractFactory.createFactory(name:"ICHIRO")
_factoryIchiro.createNewYear()
/*
HAPPY NEW YEAR!
ICHIRO NISHIMURA
*/
_factoryIchiro.createSummer()
/*
暑中お見舞い申し上げます
西村一郎
*/
var _factoryHanako:AbstractFactory = AbstractFactory.createFactory(name:"HANAKO")
_factoryHanako.createNewYear()
/*
明けましておめでとうございます
西村花子
*/
_factoryHanako.createSummer()
/*
暑中おみまいもうしあげます
西村花子
*/
```

実行環境：macOS 10.12.4、Swift 3.1  
作成者：Takashi Nishimura  
作成日：2016年08月08日  
更新日：2017年05月15日


<a name="Adapter（継承）"></a>
# <b><ruby>Adapter<rt>アダプター</rt></ruby>（継承）</b>

```
//test.swift

//スーパークラスの定義
class Moneybox {
    private var _yen:Int
    //コンストラクタ（★）
    init(yen _yen:Int) {
        self._yen = _yen 
    }
    func add(yen _yen:Int) -> Void { self._yen += _yen }
    func getYen() -> Int { return _yen }
}

//プロトコル（インターフェース）の宣言
protocol IExchange {
    func addYen(yen _yen:Int) -> Void
    func getDollar() -> Double
}

//継承、プロトコルの実装
class Exchange : Moneybox, IExchange {
    private var _rate:Double
    //↓super.init()でスーパークラスのコンストラクタ（★）を実行
    init(firstYen _firstYen:Int, rate _rate:Double) {
        self._rate = _rate
        super.init(yen:_firstYen)
    }
    func addYen(yen _yen:Int) -> Void { add(yen:_yen) } //スーパークラスから継承
    func getDollar() -> Double { return Double(getYen()) / _rate } //スーパークラスから継承
}

//実行
var _exchange:Exchange = Exchange(firstYen:10000, rate:113.378685)
_exchange.addYen(yen:8000)
print(_exchange.getDollar()) //=> 158.759999730108（ドル）
```

実行環境：macOS 10.12.4、Swift 3.1  
作成者：Takashi Nishimura  
作成日：2016年08月08日  
更新日：2017年05月15日


<a name="Adapter（委譲）"></a>
# <b><ruby>Adapter<rt>アダプター</rt></ruby>（委譲）</b>

```
//test.swift

//スーパークラスの定義 ←「継承」版と同じ
class Moneybox {
    private var _yen:Int
    //コンストラクタ（★）
    init(yen _yen:Int) {
        self._yen = _yen 
    }
    func add(yen _yen:Int) -> Void { self._yen += _yen }
    func getYen() -> Int { return _yen }
}

//プロトコル（インターフェース）の宣言 ←「継承」版と同じ
protocol IExchange {
    func addYen(yen _yen:Int) -> Void
    func getDollar() -> Double
}

//この内容が「継承」版と異なる
class Exchange : IExchange {
    private var _moneybox:Moneybox //Moneyboxクラスのインスタンスを格納（委譲）
    private var _rate:Double
    init(firstYen _firstYen_:Int, rate _rate:Double) {
        _moneybox = Moneybox(yen:_firstYen_) //ここがポイント
        self._rate = _rate
    }
    func addYen(yen _yen:Int) -> Void { 
        _moneybox.add(yen:_yen) //ポイント
    }
    func getDollar() -> Double { 
            return Double(_moneybox.getYen()) / _rate //ポイント
    }
}

//実行
var _exchange:Exchange = Exchange(firstYen:10000, rate:113.378685)
_exchange.addYen(yen:8000)
print(_exchange.getDollar()) //=> 158.759999730108（ドル）
```

実行環境：macOS 10.12.4、Swift 3.1  
作成者：Takashi Nishimura  
作成日：2016年08月08日  
更新日：2017年05月15日


<a name="Bridge"></a>
# <b><ruby>Bridge<rt>ブリッジ</rt></ruby></b>

```
//test.swift

//==================================
//基本クラス＝「機能」のクラスの最上位
//==================================
class SuperMobile {
    private var _os:AbstractOS //「機能」クラスと「実装」クラスの「橋」（委譲）
    init(os _os:AbstractOS) { //コンストラクタ
        self._os = _os
    }
    var version:String { //getter（読取専用）
        get { return _os.rawversion } //「橋」を使って「実装」クラスにアクセス
    }
}

//====================================
//「機能」のクラスに機能を追加したクラス
//====================================
class Tablet : SuperMobile {
    override init(os _os:AbstractOS) { //overrideが必要（要注意）
        super.init(os:_os) //スーパークラスのコンストラクタ呼出し
    }
    func bigScreen() -> Void { //タブレット特有の機能
        print("大きな画面で見る")
    }
}

//====================================
//「機能」のクラスに機能を追加したクラス
//====================================
class SmartPhone : SuperMobile {
    override init(os _os:AbstractOS) { //overrideが必要（要注意）
        super.init(os:_os) //スーパークラスのコンストラクタ呼出し
    }
    func phone() -> Void { //スマートフォン特有の機能
        print("電話をかける")
    }
}

//=====================================
//擬似抽象クラス＝「実装」のクラスの最上位
//=====================================
class AbstractOS {
    var rawversion:String {
        get { 
            print("サブクラスでオーバーライドして実装して下さい")
            return ""
        }
    }
}

//=======================
//「実装」の具体的な実装者
//=======================
class Android : AbstractOS {
    private var _version:String = "Android 7.1.2"
    override var rawversion:String { //オーバーライドして実際の処理を記述
        get { return _version } //getter（読取専用）
    }
}

//=======================
//「実装」の具体的な実装者
//=======================
class IOS : AbstractOS {
    private var _version:String = "iOS 10.3.1"
    override var rawversion:String { //オーバーライドして実際の処理を記述
        get { return _version } //getter（読取専用）
    }
}

//=======
// 実行
//=======
var _tablet1:Tablet = Tablet(os:Android())
print(_tablet1.version) //=> Android 7.1.2
_tablet1.bigScreen() //=> 大きな画面で見る

var _tablet2:Tablet = Tablet(os:IOS())
print(_tablet2.version) //=> iOS 10.3.1

var _smartPhone1:SmartPhone = SmartPhone(os:Android())
print(_smartPhone1.version) //=> Android 7.1.2
_smartPhone1.phone() //=> 電話をかける

var _smartPhone2:SmartPhone = SmartPhone(os:IOS())
print(_smartPhone2.version) //=> iOS 10.3.1
```

実行環境：macOS 10.12.4、Swift 3.1  
作成者：Takashi Nishimura  
作成日：2016年08月08日  
更新日：2017年05月15日


<a name="Composite"></a>
# <b><ruby>Composite<rt>コンポジット</rt></ruby></b>

* 以下のサンプルは root に Authoring フォルダを作成し、その中に Unity3D と Unreal Engine ファイルを格納してみます。

```
//test.swift

class Component { //抽象クラス（同一視するための役）
    var _name:String = "" //共通プロパティ
    var _parent:Folder? = nil //共通プロパティ ←「?」が必須（要注意）
    func getName() -> String { //共通メソッド
        return _name
    }
    var parent:Folder! { //共通getter/setter ←「!」が必須（要注意）
        get { return _parent }
        set { _parent = newValue }
    }
    func getList() -> Void { //抽象メソッドの宣言（処理は派生クラスに記述）
        print("サブクラスでオーバーライドして実装して下さい")
    }
}

class Folder : Component {
    private var _childList:[Component] = [] //空の配列を作成
    init(name _name:String) { //コンストラクタ
        super.init() //必須（要注意）
        self._name = _name 
    }
    func add(component arg:Component) -> Void { //Remove()は今回は省略
        _childList.append(arg) //←Array.append(値)
        arg.parent = self
    }
    override func getList() -> Void { //オーバーライドして実際の処理を記述
        for tmp in _childList {
            var _result:String //ローカル変数宣言
            _result = self.getName() + "/" + tmp.getName()
            if (tmp is Folder) {
                _result += "(Folder)" 
            } else if (tmp is File) {
                _result += "(File)"
            }
            print(_result)
        }
    }
}

class File : Component {
    init(name _name:String) { //コンストラクタ
        super.init() //必須（要注意）
        self._name = _name 
    }
    override func getList() -> Void { //オーバーライドして実際の処理を記述
        print(self.parent.getName() + "/" + self.getName() + "(File)")
    }
}

//=======
// 実行
//=======
//①フォルダの作成
var _root:Folder = Folder(name:"root")
var _authoring:Folder = Folder(name:"Authoring")

//②ファイルの作成
var _unity3d:File = File(name:"Unity3D")
var _unrealEngine:File = File(name:"Unreal Engine")

//③関連付け
_root.add(component:_authoring) 
_authoring.add(component:_unity3d)
_authoring.add(component:_unrealEngine)

//④検証
print(_unrealEngine.getName()) //=> "Unreal Engine"
_root.getList() //=> "root/Authoring(Folder)"
_authoring.getList()
//=> "Authoring/Unity3D(File)"
//=> "Authoring/Unreal Engine(File)"
_unity3d.getList() //=> "Authoring/Unity3D(File)"
```

実行環境：macOS 10.12.4、Swift 3.1  
作成者：Takashi Nishimura  
作成日：2016年08月08日  
更新日：2017年05月15日


<a name="Decorator"></a>
# <b><ruby>Decorator<rt>デコレータ</rt></ruby></b>

```
//test.swift

//===================================================================
//「中身」と「飾り枠」に同じshow()メソッドを持たせるためのスーパークラス
//===================================================================
class Display {
    var _content:String = ""
    func getContent() -> String {
        return _content
    }
    func show() -> Void {
        print(_content)
    }
}

//=======================
// 中身（飾りを施す前の元）
//=======================
class Original : Display {
    //コンストラクタ
    init(text arg:String) {
        super.init() //必須（要注意）
        _content = arg //conent_は基本クラスからの継承
    }
}

//=========
// 飾り枠①
//=========
class Decorator1 : Display {
    init(display _display:Display) { //コンストラクタ
        super.init() //必須（要注意）
        _content = "-" + _display.getContent() + "-" //飾り①を付ける
    }
}

//=========
// 飾り枠②
//=========
class Decorator2 : Display {
    init(display _display:Display) { //コンストラクタ
        super.init() //必須（要注意）
        _content = "<" + _display.getContent() + ">" //飾り②を付ける
    }
}

//=========
// 実行
//=========
var _original:Display = Original(text:"TAKASHI")
_original.show() //=> TAKASHI

var _decorator1:Display = Decorator1(display:Original(text:"TAKASHI"))
_decorator1.show() //=> -TAKASHI-

var _decorator2:Display = Decorator2(display:Original(text:"TAKASHI"))
_decorator2.show() //=> <TAKASHI>

var _special:Display = Decorator2(display:
                                Decorator1(display:
                                    Decorator1(display:
                                        Decorator1(display:
                                            Original(text:"TAKASHI")
                                        )
                                    )
                                )
                            )
_special.show() //=> <---TAKASHI--->
```

実行環境：macOS 10.12.4、Swift 3.1  
作成者：Takashi Nishimura  
作成日：2016年08月09日  
更新日：2017年05月15日


<a name="Facade"></a>
# <b><ruby>Facade<rt>ファサード</rt></ruby></b>

* 以下の例文では、「Decoratorパターン」を Facade パターンでシンプルにします。
```
var _special:Display = Decorator2(display:
                                Decorator1(display:
                                    Decorator1(display:
                                        Decorator1(display:
                                            Original(text:"TAKASHI")))))
_special.show()
```
...としていたものを次の1行で実現可能になります。
```
DecoratorFacade.exec(text:"TAKASHI", decrator1:3, decrator2:1)
```

### 例文
```
//test.swift

//===================================================================
//「中身」と「飾り枠」に同じshow()メソッドを持たせるためのスーパークラス
//===================================================================
class Display {
    var _content:String = ""
    func getContent() -> String {
        return _content
    }
    func show() -> Void {
        print(_content)
    }
}

//=======================
// 中身（飾りを施す前の元）
//=======================
class Original : Display {
    //コンストラクタ
    init(text arg:String) {
        super.init() //必須（要注意）
        _content = arg //conent_は基本クラスからの継承
    }
}

//=========
// 飾り枠①
//=========
class Decorator1 : Display {
    init(display _display:Display) { //コンストラクタ
        super.init() //必須（要注意）
        _content = "-" + _display.getContent() + "-" //飾り①を付ける
    }
}

//=========
// 飾り枠②
//=========
class Decorator2 : Display {
    init(display _display:Display) { //コンストラクタ
        super.init() //必須（要注意）
        _content = "<" + _display.getContent() + ">" //飾り②を付ける
    }
}

//以上の4つのクラスはDecoratorパターンの例文と全く同じ

//==========================================================
//シンプルな窓口 ←Decoratorパターンにこのクラスを追加するだけ
//==========================================================
class DecoratorFacade {
    static func exec(text arg1:String, decrator1 arg2:Int=0, decrator2 arg3:Int=0) -> Void {
        var result_:Display //ローカル変数
        result_ = Original(text:arg1)
        for i in 0 ..< arg2 {
            print(i) //無いとwarningが出るので...
            result_ = Decorator1(display:result_)
        }
        for j in 0 ..< arg3 {
            print(j) //無いとwarningが出るので...
            result_ = Decorator2(display:result_)
        }
        result_.show()
    }
}

//==========
// 実行
//==========
DecoratorFacade.exec(text:"TAKASHI") //=> TAKASHI
DecoratorFacade.exec(text:"TAKASHI", decrator1:1, decrator2:0) //=> -TAKASHI-
DecoratorFacade.exec(text:"TAKASHI", decrator1:0, decrator2:1) //=> <TAKASHI>
DecoratorFacade.exec(text:"TAKASHI", decrator1:3, decrator2:1) //=> <---TAKASHI--->
```

実行環境：macOS 10.12.4、Swift 3.1  
作成者：Takashi Nishimura  
作成日：2016年08月09日  
更新日：2017年05月15日


<a name="Flyweight"></a>
# <b><ruby>Flyweight<rt>フライウエイト</rt></ruby></b>

XXXX

実行環境：macOS 10.12.4、Swift 3.1  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="Proxy"></a>
# <b><ruby>Proxy<rt>プロキシー</rt></ruby></b>

XXXX

実行環境：macOS 10.12.4、Swift 3.1  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="Iterator"></a>
# <b><ruby>Iterator<rt>イテレータ</rt></ruby></b>

XXXX

実行環境：macOS 10.12.4、Swift 3.1  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="TemplateMethod"></a>
# <b><ruby>Template Method<rt>テンプレート メソッド</rt></ruby></b>

XXXX

実行環境：macOS 10.12.4、Swift 3.1  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="Strategy"></a>
# <b><ruby>Strategy<rt>ストラテジー</rt></ruby></b>

XXXX

実行環境：macOS 10.12.4、Swift 3.1  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="Visitor"></a>
# <b><ruby>Visitor<rt>ビジター</rt></ruby></b>

XXXX

実行環境：macOS 10.12.4、Swift 3.1  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="ChainofResponsibility"></a>
# <b><ruby>Chain of Responsibility<rt>チェーン オブ レスポンシビリティ</rt></ruby></b>

XXXX

実行環境：macOS 10.12.4、Swift 3.1  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="Mediator"></a>
# <b><ruby>Mediator<rt>メディエイター</rt></ruby></b>

XXXX

実行環境：macOS 10.12.4、Swift 3.1  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="Observer"></a>
# <b><ruby>Observer<rt>オブザーバ</rt></ruby></b>

XXXX

実行環境：macOS 10.12.4、Swift 3.1  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="Memento"></a>
# <b><ruby>Memento<rt>メメント</rt></ruby></b>

XXXX

実行環境：macOS 10.12.4、Swift 3.1  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="State"></a>
# <b><ruby>State<rt>ステート</rt></ruby></b>

XXXX

実行環境：macOS 10.12.4、Swift 3.1  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="Command"></a>
# <b><ruby>Command<rt>コマンド</rt></ruby></b>

XXXX

実行環境：macOS 10.12.4、Swift 3.1  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="Interpreter"></a>
# <b><ruby>Interpreter<rt>インタプリタ</rt></ruby></b>

XXXX

実行環境：macOS 10.12.4、Swift 3.1  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日