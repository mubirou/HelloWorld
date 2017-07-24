# <b>Swift デザインパターン</b>

### <b>INDEX</b>

* オブジェクトの「生成」に関するパターン
    * [<ruby>Singleton<rt>シングルトン</rt></ruby>](#Singleton): たった１つのインスタンス
    * [<ruby>Prototype<rt>プロトタイプ</rt></ruby>](#Prototype): コピーしてインスタンスを作る
    * [<ruby>Builder<rt>ビルダー</rt></ruby>](#Builder): 複雑なインスタンスを組み立てる
    * [<ruby>Factory Method<rt>ファクトリー メソッド</rt></ruby>](#FactoryMethod): インスタンスの作成をサブクラスにまかせる
    * [<ruby>Abstract Factory<rt>アブストラクト ファクトリー</rt></ruby>](#AbstractFactory): 関連する部品を組み合わせて製品を作る

* プログラムの「構造」に関するパターン
    * [<ruby>Adapter<rt>アダプター</rt></ruby>（継承）](#Adapter（継承）): 一皮かぶせて再利用
    * [<ruby>Adapter<rt>アダプター</rt></ruby>（委譲）](#Adapter（委譲）): クラスによる Adapter パターン
    * [<ruby>Bridge<rt>ブリッジ</rt></ruby>](#Bridge): 機能の階層と実装の階層を分ける
    * [<ruby>Composite<rt>コンポジット</rt></ruby>](#Composite): 容器と中身の同一視
    * [<ruby>Decorator<rt>デコレータ</rt></ruby>](#Decorator): 飾り枠と中身の同一視
    * [<ruby>Facade<rt>ファサード</rt></ruby>](#Facade): シンプルな窓口
    * [<ruby>Flyweight<rt>フライウエイト</rt></ruby>](#Flyweight): 同じものを共有して無駄をなくす
    * [<ruby>Proxy<rt>プロキシー</rt></ruby>](#Proxy): 必要になってから作る

* オブジェクトの「振る舞い」に関するパターン
    * [<ruby>Iterator<rt>イテレータ</rt></ruby>](#Iterator): １つ１つ数え上げる
    * [<ruby>Template Method<rt>テンプレート メソッド</rt></ruby>](#TemplateMethod): 具体的な処理をサブクラスにまかせる
    * [<ruby>Strategy<rt>ストラテジー</rt></ruby>](#Strategy): アルゴリズムをごっそり切り替える
    * [<ruby>Visitor<rt>ビジター</rt></ruby>](#Visitor): 構造を渡り歩きながら仕事をする
    * [<ruby>Chain of Responsibility<rt>チェーン オブ レスポンシビリティ</rt></ruby>](#ChainofResponsibility): 責任のたらいまわし
    * [<ruby>Mediator<rt>メディエイター</rt></ruby>](#Mediator): 相手は相談役１人だけ
    * [<ruby>Observer<rt>オブザーバ</rt></ruby>](#Observer): 状態の変化を通知する
    * [<ruby>Memento<rt>メメント</rt></ruby>](#Memento): 状態を保存する
    * [<ruby>State<rt>ステート</rt></ruby>](#State): 状態をクラスとして表現
    * [<ruby>Command<rt>コマンド</rt></ruby>](#Command): 命令をクラスにする
    * [<ruby>Interpreter<rt>インタプリタ</rt></ruby>](#Interpreter): 文法規則をクラスで表現する


<a name="Singleton"></a>
# <b><ruby>Singleton<rt>シングルトン</rt></ruby></b>

```
//test.swift

internal class Singleton { //internalは省略可
    internal static var isSinglton: Bool = false
    //↓クラス定数（internalは省略可）
    internal static let getSingleton: Singleton = Singleton() //インスタンス生成
    
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
var _singleton1: Singleton = Singleton.getSingleton //唯一のインスタンスを呼出す
var _singleton2: Singleton = Singleton.getSingleton //唯一のインスタンスを呼出す
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
    var firstName: String { get set }
    var lastName: String { get set }
    var age: Int { get set }
}

internal class Prototype: IPrototype { //プロトコルの実装←internalは省略可
    //インスタンス変数の初期化
    private var _firstName: String = "HOGE"
    private var _lastName: String = "FUGA"
    private var _age: Int = 0
    
    //コンストラクタ
    init(lastName _lastName: String) {
        self._lastName = _lastName
    }

    internal func clone() -> Prototype { //internalは省略可
        var _copy: Prototype
        _copy = Prototype(lastName: _lastName) //自分自身を生成
        _copy.firstName = _firstName //プロパティを複製
        _copy.age = _age //プロパティを複製
        return _copy //全てのプロパティを複製したインスタンスを返す
    }

    internal var firstName: String { //internalは省略可
        get { return _firstName }
        set { _firstName = newValue }
    }

    internal var lastName: String { //internalは省略可
        get { return _lastName }
        set { _lastName = newValue }
    }

    internal var age: Int { //internalは省略可
        get { return _age }
        set { _age = newValue }
    }
}

//インスタンスを生成
var _prototype1: Prototype = Prototype(lastName: "Nishimura")
_prototype1.firstName = "Ichiro"
_prototype1.age = 30

//コピーを作成
var _prototype2: Prototype = _prototype1.clone() //複製する（Prototype()を使わない）
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
    private var _builder: IBuilder
    //コンストラクタ
    init(builder _builder: IBuilder) {
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
class Builder009: IBuilder {
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
class Builder108: IBuilder {
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
var _director1: Director = Director(builder: Builder009())
_director1.construct() //共通の手順を実行
/*
あけましておめでとうございます
タイプ194用のイラスト
元旦
*/

var _director2: Director = Director(builder: Builder108())
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
        var _factoryMethod: IMessage
        _factoryMethod = factoryMethod(target: _arg)
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
class CardIchiro: AbstractCard {
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

class CardHanako: AbstractCard {
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
class Message1: IMessage {
    func exec() -> Void {
        print("謹賀新年")
    }
}
class Message2: IMessage {
    func exec() -> Void {
        print("HAPPY NEW YEAR!")
    }
}
class Message3: IMessage {
    func exec() -> Void {
        print("明けましておめでとうございます")
    }
}
class Message4: IMessage {
    func exec() -> Void {
        print("あけましておめでとう")
    }
}
class MessageDummy: IMessage { //苦肉の策（Swift独特の力技）
    func exec() -> Void { print("error: targetが存在しません") }
}

//=======
// 実行
//=======
var _cardIchiro: CardIchiro = CardIchiro()
_cardIchiro.templateMethod(target: "teacher")
/*
謹賀新年
〒XXX-XXXX 新宿区XX町-XX-XX
西村一郎
*/
_cardIchiro.templateMethod(target: "friend")
/*
HAPPY NEW YEAR!
〒XXX-XXXX 新宿区XX町-XX-XX
西村一郎
*/

var _cardHanako: CardHanako = CardHanako()
_cardHanako.templateMethod(target: "teacher")
/*
明けましておめでとうございます
〒XXX-XXXX 新宿区XX町-XX-XX
西村花子
*/
_cardHanako.templateMethod(target: "friend")
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
    static func createFactory(name _name: String) -> AbstractFactory { //静的メソッド
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
class Ichiro: AbstractFactory { //抽象クラスを継承
    override func createNewYear() -> Void { //overrideして具体的処理を記述
        print("HAPPY NEW YEAR!")
        print("ICHIRO NISHIMURA")
    }
    override func createSummer() -> Void { //overrideして具体的処理を記述
        print("暑中お見舞い申し上げます")
        print("西村一郎")
    }
}

class Hanako: AbstractFactory { //抽象クラスを継承
    override func createNewYear() -> Void { //overrideして具体的処理を記述
        print("明けましておめでとうございます")
        print("西村花子")
    }
    override func createSummer() -> Void { //overrideして具体的処理を記述
        print("暑中おみまいもうしあげます")
        print("西村花子")
    }
}

class Dummy: AbstractFactory { //苦肉の策（Swift独特の力技）
    override func createNewYear() -> Void { print("error: nameが存在しません") }
    override func createSummer() -> Void { print("error: nameが存在しません") }
}

var _factoryIchiro: AbstractFactory = AbstractFactory.createFactory(name: "ICHIRO")
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
var _factoryHanako: AbstractFactory = AbstractFactory.createFactory(name: "HANAKO")
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
    private var _yen: Int
    //コンストラクタ（★）
    init(yen _yen: Int) {
        self._yen = _yen 
    }
    func add(yen _yen: Int) -> Void { self._yen += _yen }
    func getYen() -> Int { return _yen }
}

//プロトコル（インターフェース）の宣言
protocol IExchange {
    func addYen(yen _yen: Int) -> Void
    func getDollar() -> Double
}

//継承、プロトコルの実装
class Exchange: Moneybox, IExchange {
    private var _rate: Double
    //↓super.init()でスーパークラスのコンストラクタ（★）を実行
    init(firstYen _firstYen: Int, rate _rate: Double) {
        self._rate = _rate
        super.init(yen: _firstYen)
    }
    func addYen(yen _yen: Int) -> Void { add(yen: _yen) } //スーパークラスから継承
    func getDollar() -> Double { return Double(getYen()) / _rate } //スーパークラスから継承
}

//実行
var _exchange: Exchange = Exchange(firstYen: 10000, rate: 113.378685)
_exchange.addYen(yen: 8000)
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
    private var _yen: Int
    //コンストラクタ（★）
    init(yen _yen: Int) {
        self._yen = _yen 
    }
    func add(yen _yen: Int) -> Void { self._yen += _yen }
    func getYen() -> Int { return _yen }
}

//プロトコル（インターフェース）の宣言 ←「継承」版と同じ
protocol IExchange {
    func addYen(yen _yen: Int) -> Void
    func getDollar() -> Double
}

//この内容が「継承」版と異なる
class Exchange: IExchange {
    private var _moneybox: Moneybox //Moneyboxクラスのインスタンスを格納（委譲）
    private var _rate: Double
    init(firstYen _firstYen_: Int, rate _rate: Double) {
        _moneybox = Moneybox(yen: _firstYen_) //ここがポイント
        self._rate = _rate
    }
    func addYen(yen _yen: Int) -> Void { 
        _moneybox.add(yen: _yen) //ポイント
    }
    func getDollar() -> Double { 
            return Double(_moneybox.getYen()) / _rate //ポイント
    }
}

//実行
var _exchange: Exchange = Exchange(firstYen: 10000, rate: 113.378685)
_exchange.addYen(yen: 8000)
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
    private var _os: AbstractOS //「機能」クラスと「実装」クラスの「橋」（委譲）
    init(os _os: AbstractOS) { //コンストラクタ
        self._os = _os
    }
    var version: String { //getter（読取専用）
        get { return _os.rawversion } //「橋」を使って「実装」クラスにアクセス
    }
}

//====================================
//「機能」のクラスに機能を追加したクラス
//====================================
class Tablet: SuperMobile {
    override init(os _os: AbstractOS) { //overrideが必要（要注意）
        super.init(os: _os) //スーパークラスのコンストラクタ呼出し
    }
    func bigScreen() -> Void { //タブレット特有の機能
        print("大きな画面で見る")
    }
}

//====================================
//「機能」のクラスに機能を追加したクラス
//====================================
class SmartPhone: SuperMobile {
    override init(os _os: AbstractOS) { //overrideが必要（要注意）
        super.init(os: _os) //スーパークラスのコンストラクタ呼出し
    }
    func phone() -> Void { //スマートフォン特有の機能
        print("電話をかける")
    }
}

//=====================================
//擬似抽象クラス＝「実装」のクラスの最上位
//=====================================
class AbstractOS {
    var rawversion: String {
        get { 
            print("サブクラスでオーバーライドして実装して下さい")
            return ""
        }
    }
}

//=======================
//「実装」の具体的な実装者
//=======================
class Android: AbstractOS {
    private var _version: String = "Android 7.1.2"
    override var rawversion: String { //オーバーライドして実際の処理を記述
        get { return _version } //getter（読取専用）
    }
}

//=======================
//「実装」の具体的な実装者
//=======================
class IOS: AbstractOS {
    private var _version: String = "iOS 10.3.1"
    override var rawversion: String { //オーバーライドして実際の処理を記述
        get { return _version } //getter（読取専用）
    }
}

//=======
// 実行
//=======
var _tablet1: Tablet = Tablet(os: Android())
print(_tablet1.version) //=> Android 7.1.2
_tablet1.bigScreen() //=> 大きな画面で見る

var _tablet2: Tablet = Tablet(os: IOS())
print(_tablet2.version) //=> iOS 10.3.1

var _smartPhone1: SmartPhone = SmartPhone(os: Android())
print(_smartPhone1.version) //=> Android 7.1.2
_smartPhone1.phone() //=> 電話をかける

var _smartPhone2: SmartPhone = SmartPhone(os: IOS())
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
    var _name: String = "" //共通プロパティ
    var _parent: Folder? = nil //共通プロパティ ←「?」が必須（要注意）
    func getName() -> String { //共通メソッド
        return _name
    }
    var parent: Folder! { //共通getter/setter ←「!」が必須（要注意）
        get { return _parent }
        set { _parent = newValue }
    }
    func getList() -> Void { //抽象メソッドの宣言（処理は派生クラスに記述）
        print("サブクラスでオーバーライドして実装して下さい")
    }
}

class Folder: Component {
    private var _childList: [Component] = [] //空の配列を作成
    init(name _name: String) { //コンストラクタ
        super.init() //必須（要注意）
        self._name = _name 
    }
    func add(component arg: Component) -> Void { //Remove()は今回は省略
        _childList.append(arg) //←Array.append(値)
        arg.parent = self
    }
    override func getList() -> Void { //オーバーライドして実際の処理を記述
        for tmp in _childList {
            var _result: String //ローカル変数宣言
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

class File: Component {
    init(name _name: String) { //コンストラクタ
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
var _root: Folder = Folder(name: "root")
var _authoring: Folder = Folder(name: "Authoring")

//②ファイルの作成
var _unity3d: File = File(name: "Unity3D")
var _unrealEngine: File = File(name: "Unreal Engine")

//③関連付け
_root.add(component: _authoring) 
_authoring.add(component: _unity3d)
_authoring.add(component: _unrealEngine)

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
    var _content: String = ""
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
class Original: Display {
    //コンストラクタ
    init(text arg: String) {
        super.init() //必須（要注意）
        _content = arg //conent_は基本クラスからの継承
    }
}

//=========
// 飾り枠①
//=========
class Decorator1: Display {
    init(display _display: Display) { //コンストラクタ
        super.init() //必須（要注意）
        _content = "-" + _display.getContent() + "-" //飾り①を付ける
    }
}

//=========
// 飾り枠②
//=========
class Decorator2: Display {
    init(display _display: Display) { //コンストラクタ
        super.init() //必須（要注意）
        _content = "<" + _display.getContent() + ">" //飾り②を付ける
    }
}

//=========
// 実行
//=========
var _original: Display = Original(text: "TAKASHI")
_original.show() //=> TAKASHI

var _decorator1: Display = Decorator1(display: Original(text: "TAKASHI"))
_decorator1.show() //=> -TAKASHI-

var _decorator2: Display = Decorator2(display: Original(text: "TAKASHI"))
_decorator2.show() //=> <TAKASHI>

var _special: Display = Decorator2(display: 
                                Decorator1(display: 
                                    Decorator1(display: 
                                        Decorator1(display: 
                                            Original(text: "TAKASHI")
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
var _special: Display = Decorator2(display: 
                                Decorator1(display: 
                                    Decorator1(display: 
                                        Decorator1(display: 
                                            Original(text: "TAKASHI")))))
_special.show()
```
...としていたものを次の1行で実現可能になります。
```
DecoratorFacade.exec(text: "TAKASHI", decrator1: 3, decrator2: 1)
```

### 例文
```
//test.swift

//===================================================================
//「中身」と「飾り枠」に同じshow()メソッドを持たせるためのスーパークラス
//===================================================================
class Display {
    var _content: String = ""
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
class Original: Display {
    //コンストラクタ
    init(text arg: String) {
        super.init() //必須（要注意）
        _content = arg //conent_は基本クラスからの継承
    }
}

//=========
// 飾り枠①
//=========
class Decorator1: Display {
    init(display _display: Display) { //コンストラクタ
        super.init() //必須（要注意）
        _content = "-" + _display.getContent() + "-" //飾り①を付ける
    }
}

//=========
// 飾り枠②
//=========
class Decorator2: Display {
    init(display _display: Display) { //コンストラクタ
        super.init() //必須（要注意）
        _content = "<" + _display.getContent() + ">" //飾り②を付ける
    }
}

//以上の4つのクラスはDecoratorパターンの例文と全く同じ

//==========================================================
//シンプルな窓口 ←Decoratorパターンにこのクラスを追加するだけ
//==========================================================
class DecoratorFacade {
    static func exec(text arg1: String, decrator1 arg2: Int=0, decrator2 arg3: Int=0) -> Void {
        var result_: Display //ローカル変数
        result_ = Original(text: arg1)
        for i in 0 ..< arg2 {
            print(i) //無いとwarningが出るので...
            result_ = Decorator1(display: result_)
        }
        for j in 0 ..< arg3 {
            print(j) //無いとwarningが出るので...
            result_ = Decorator2(display: result_)
        }
        result_.show()
    }
}

//==========
// 実行
//==========
DecoratorFacade.exec(text: "TAKASHI") //=> TAKASHI
DecoratorFacade.exec(text: "TAKASHI", decrator1: 1, decrator2: 0) //=> -TAKASHI-
DecoratorFacade.exec(text: "TAKASHI", decrator1: 0, decrator2: 1) //=> <TAKASHI>
DecoratorFacade.exec(text: "TAKASHI", decrator1: 3, decrator2: 1) //=> <---TAKASHI--->
```

実行環境：macOS 10.12.4、Swift 3.1  
作成者：Takashi Nishimura  
作成日：2016年08月09日  
更新日：2017年05月15日


<a name="Flyweight"></a>
# <b><ruby>Flyweight<rt>フライウエイト</rt></ruby></b>

```
//test.swift

//========================================
// インスタンスの管理人（シングルトンクラス）
//========================================
class Manager {
    static var isSinglton: Bool = false
    static let getInstance: Manager = Manager() //クラス定数←インスタンス生成
    //↓BigProcessインスタンスをダブらないように保存する辞書
    var _dic: Dictionary<String, BigProcess> = Dictionary<String, BigProcess>()
    
    //コンストラクタ
    private init() {
        if (!Manager.isSinglton) {
            print("インスタンスの生成")
            Manager.isSinglton = true
        } else {
            //本来は throw を使ってエラーを出すべきですが...
            print("Singleton()ではなく Singleton.getSingleton で生成して下さい")
        }
    }
    
    //BigProcessインスタンスをダブらないように辞書に保存
    func createBigProcess(type arg: String) -> BigProcess! { //「!」が必須（要注意）
        for tmp in _dic {
            if (tmp.key == arg) { //既存か否か調べる
                print(arg + "は既存です")
                return _dic[arg]
            }
        }
        //↓ここでやっとインスタンス生成
        _dic.updateValue(BigProcess(type: arg), forKey: arg) 
        return _dic[arg]
    }
}

//=============================================================
// フライ級の役（メモリの使用量が多いため無駄に生成したくないもの）
//=============================================================
class BigProcess {
    private var _result: String = ""
    init(type arg: String) {
        //本来は（引数に対応する）重〜い処理をここで行う
        _result = arg + "に対応する重〜い処理の結果"
    }
    func getData() -> String {
        return _result
    }
}

//=======
// 実行
//=======
//インスタンスの管理者を作る（シングルトンクラス）
var _manager: Manager = Manager.getInstance //唯一のインスタンスを呼出す
print(_manager) //=> test.Manager

//無駄に生成したくないオブジェクトを生成（既存の場合使いまわす）
var _A: BigProcess = _manager.createBigProcess(type: "A")
var _B: BigProcess = _manager.createBigProcess(type: "B")

//既存のものを生成しようとすると...
var _A2: BigProcess = _manager.createBigProcess(type: "A") //=> Aは既存です
print(_A === _A2) //=> true ←中身は同じインスタンス

print(_A.getData()) //=> Aに対応する重〜い処理の結果
print(_B.getData()) //=> Bに対応する重〜い処理の結果
```

実行環境：macOS 10.12.4、Swift 3.1  
作成者：Takashi Nishimura  
作成日：2016年08月09日  
更新日：2017年05月15日


<a name="Proxy"></a>
# <b><ruby>Proxy<rt>プロキシー</rt></ruby></b>

```
//test.swift

//=================================================
//①Loaderと②Contentのプロトコル（インターフェース）
protocol ILoader {
    func load() -> Void
}
//=================================================

//=================
//①代理人（Proxy）役
//=================
class Loader: ILoader {
    private var _path: String
    init(path _path: String) {
        self._path = _path
    }
    func load() -> Void {
        var _content: Content //ローカル変数宣言
        _content = Content(path: _path) //実際の本人が登場（代理人は実際の本人を知っている）
        _content.load()
    }
}

//============
//②実際の本人
//============
class Content: ILoader {
    private var _path: String
    init(path _path: String) {
        self._path = _path
    }
    //↓重い処理をここで行う（ポイント）
    func load() -> Void {
        //今回のサンプルの中身はあまり重要ではない...
        print("重い処理中")
    }
}

//=======
//実行
//=======
var _loader: Loader = Loader(path: "http: //...XXX.mp4") //代理人（Proxy）役
_loader.load() //=> 重い処理中 ←通常は必要になった時に実際にロード
```

実行環境：macOS 10.12.4、Swift 3.1  
作成者：Takashi Nishimura  
作成日：2016年08月09日  
更新日：2017年05月15日


<a name="Iterator"></a>
# <b><ruby>Iterator<rt>イテレータ</rt></ruby></b>

```
//test.swift

//==========
//Bikeクラス
//==========
class Bike {
    private var _name: String
    private var _num: String
    init(name _name: String, num _num: String) { //コンストラクタ
        self._name = _name
        self._num = _num
    }
    func getName() -> String {	return _name }
    func getNum() -> String { return _num }
}

//==============
//BikeParkクラス
//==============
protocol IBikePark {
    func add(bike arg: Bike) -> Void
    func getBikeAt(num arg: Int) -> Bike
    func getLength() -> Int
    func createIterator() -> Iterator
}

class BikePark: IBikePark {
    private var _list: [Bike] = [] //空の配列を作成
    func add(bike arg: Bike) -> Void { _list.append(arg) } //←Array.append(値)
    func getBikeAt(num arg: Int) -> Bike {return _list[arg] }
    func getLength() -> Int { return _list.count }
    func createIterator() -> Iterator { return Iterator(bikePark: self) } //イテレータ生成
}

//==============================
//Iteratorクラス（≒駐輪場の管理人）
//==============================
protocol IIterator {
    func hasNext() -> Bool
    func next() -> Bike
}

class Iterator: IIterator {
    private var _bikePark: BikePark
    private var _count: Int = 0
    init(bikePark _bikePark: BikePark) { //コンストラクタ
        self._bikePark = _bikePark
    }
    func hasNext() -> Bool {
        return _bikePark.getLength() > _count 
    }
    func next() -> Bike { 
        var _result: Bike
        _result = _bikePark.getBikeAt(num: _count) //次のバイクを返す
        _count += 1 //↑の処理後に加算すること
        return _result
    }
}

//=======
//実行
//=======
var _bikePark: BikePark = BikePark()
_bikePark.add(bike: Bike(name: "SR400", num: "神戸 き 15-63"))
_bikePark.add(bike: Bike(name: "ESTRELLA", num: "豊橋 お 12-13"))
_bikePark.add(bike: Bike(name: "W650", num: "品川 さ 13-46"))

var _iterator: Iterator = _bikePark.createIterator() //イテレータ（管理人）生成

while _iterator.hasNext() {
    var _nextBike: Bike
    _nextBike = _iterator.next()
    print(_nextBike.getName() + "," + _nextBike.getNum())
    //=> SR400,神戸 き 15-63 => ESTRELLA,豊橋 お 12-13 => W650,品川 さ 13-46
}
```

実行環境：macOS 10.12.4、Swift 3.1  
作成者：Takashi Nishimura  
作成日：2016年08月09日  
更新日：2017年05月16日


<a name="TemplateMethod"></a>
# <b><ruby>Template Method<rt>テンプレート メソッド</rt></ruby></b>

```
//test.swift

//==============
// 擬似抽象クラス
//==============
class AbstractCard {
    func templateMethod() -> Void { //一連の連続した処理の枠組みを定義
        order1() //共通の処理
        if (isAdult()) { //フックメソッド（派生クラスでoverride）
            order2() //←条件により実行
        }
        order3() //派生クラスでoverride
    }
    private func order1() -> Void { //共通の処理
        print("HAPPY NEW YEAR!")
    }
    func isAdult() -> Bool { //抽象メソッドの宣言
        print("サブクラスでoverrideして実装して下さい")
        return false //←何かBool値を返さないとならないため（力技）
    }
    private func order2() -> Void { //条件により実行
        print("勉強頑張ろう")
    }
    func order3() -> Void { //抽象メソッドの宣言
        print("サブクラスでoverrideして実装して下さい")
    } 
}

//================================
// 派生クラス①（抽象クラスを継承）
//================================
class CardHanako: AbstractCard {
    //フックメソッドの実際の定義
    override func isAdult() -> Bool {
        return false
    }
    override func order3() -> Void {
        print("テニスがんばろうね")
    }
}

//===============================
// 派生クラス②（抽象クラスを継承）
//===============================
class CardIchiro: AbstractCard {
    //フックメソッドをoverrideして具体的処理を記述
    override func isAdult() -> Bool {
        return true
    }
    //抽象メソッドをoverrideして具体的処理を記述
    override func order3() -> Void {
        print("テニス頑張ろう")
    }
}

//=======
// 実行
//=======
var _CardHanako: CardHanako = CardHanako()
_CardHanako.templateMethod()
/*
HAPPY NEW YEAR!
テニスがんばろうね
*/

var _cardIchiro: CardIchiro = CardIchiro()
_cardIchiro.templateMethod()
/*
HAPPY NEW YEAR!
勉強頑張ろう
テニス頑張ろう
*/
```

実行環境：macOS 10.12.4、Swift 3.1  
作成者：Takashi Nishimura  
作成日：2016年08月09日  
更新日：2017年05月16日


<a name="Strategy"></a>
# <b><ruby>Strategy<rt>ストラテジー</rt></ruby></b>

```
//test.swift

//================
// StrategyXXXクラス
//================
protocol IStrategy {
    func execute() -> Void
}
class StrategyA: IStrategy {
    func execute() -> Void { print("グー、グー、パー")	}
}
class StrategyB: IStrategy {
    func execute() -> Void { print("パー、グー、チョキ") }
}

//============
// Jankenクラス
//============
class Janken {
    private var _strategy: IStrategy
    init(strategy _strategy: IStrategy) { self._strategy = _strategy }
    func exec() -> Void { _strategy.execute() } //exec()だと紛らわしいので...
}

//=========
// 実行
//=========
var _jankenA: Janken = Janken(strategy: StrategyA())
var _jankenB: Janken = Janken(strategy: StrategyB())
_jankenA.exec() //=> グー、グー、パー
_jankenB.exec() //=> パー、グー、チョキ
```

実行環境：macOS 10.12.4、Swift 3.1  
作成者：Takashi Nishimura  
作成日：2016年08月09日  
更新日：2017年05月16日


<a name="Visitor"></a>
# <b><ruby>Visitor<rt>ビジター</rt></ruby></b>

```
//test.swift

//=======
// 訪問先
//=======
protocol Iacceptor {
    func accept(visitor _visitor: IVisitor) -> Void 
}

class Hokkaido: Iacceptor {
    private var _otoshidama: Int = 5000*2 //お年玉
    func accept(visitor _visitor: IVisitor) -> Void { //accept＝受け入れる
        _visitor.visit(otoshidama: _otoshidama) //←誰が訪問してきても同じメソッドを実行!
    }
}

class Chiba: Iacceptor {
    private var _otoshidama: Int = 5000 //お年玉
    func accept(visitor _visitor: IVisitor) -> Void { //accept＝受け入れる
        _visitor.visit(otoshidama: _otoshidama) //←誰が訪問してきても同じメソッドを実行!
    }
}

//=======
// 訪問者
//=======
protocol IVisitor {
    func visit(otoshidama _otoshidama: Int) -> Void
    func getMoney() -> Int
}

class Tohru: IVisitor { //亨
    private var money_: Int = 0 //貯金
    func visit(otoshidama _otoshidama: Int) -> Void { money_ += _otoshidama }
    func getMoney() -> Int { return money_ }
}

class Sachiko: IVisitor { //幸子
    private var money_: Int = 0 //貯金
    func visit(otoshidama _otoshidama: Int) -> Void { money_ += _otoshidama }
    func getMoney() -> Int { return money_ }
}

//=======
// 実行
//=======
//訪問先
var _hokkaido: Hokkaido = Hokkaido() //埼玉実家
var _chiba: Chiba = Chiba() //宮島家

//訪問者
var _ichiro: Tohru = Tohru() //亨
var _hanako: Sachiko = Sachiko() //幸子

//訪問する（訪問側から見ると「受け入れる」）
_hokkaido.accept(visitor: _ichiro)
_hokkaido.accept(visitor: _hanako)
_chiba.accept(visitor: _ichiro)
_chiba.accept(visitor: _hanako)

//結果...
print(_ichiro.getMoney()) //=> 15000
print(_hanako.getMoney()) //=> 15000
```

実行環境：macOS 10.12.4、Swift 3.1  
作成者：Takashi Nishimura  
作成日：2016年08月09日  
更新日：2017年05月16日


<a name="ChainofResponsibility"></a>
# <b><ruby>Chain of Responsibility<rt>チェーン オブ レスポンシビリティ</rt></ruby></b>

```
//test.swift

//文字列の一部分を取得する関数
func subString(string arg1: String, start arg2: Int, end arg3: Int) -> String {
    var _result: String
    _result = arg1[arg1.index(arg1.startIndex, offsetBy: arg2)
    ...
    arg1.index(arg1.startIndex, offsetBy: arg3)]
    return _result
}

//=======================
//各郵便局の擬似抽象クラス
//=======================
class AbstractPO {
    var _nextPO: AbstractPO? = nil //←たらいまわし先（「?」が必須）
    func setNext(po _po: AbstractPO) -> Void { //共通の機能
        _nextPO = _po
    }
    func send(address _address: String) -> Void { //擬似抽象メソッド（サブクラスでoverride）
        print("サブクラスでoverrideして実装して下さい")
    }
}

//===========
//新宿郵便局
//===========
class ShinjukuPO: AbstractPO {
    override func send(address _address: String) -> Void { //擬似抽象メソッドの実際の処理
        if (subString(string: _address, start: 0, end: 2) == "新宿区") {
            print("本日中に届きます")
        } else {
            _nextPO?.send(address: _address) //たらいまわし先に振る（「?」が必須）
        }
    }
}

//===========
//東京郵便局
//===========
class TokyoPO: AbstractPO {
    override func send(address _address: String) -> Void { //擬似抽象メソッドの実際の処理
        if (subString(string: _address, start: 0, end: 2) == "東京都") {
            print("明後日中に届きます")
        } else {
            _nextPO?.send(address: _address) //たらいまわし先に振る（「?」が必須）
        }
    }
}

//===========
//日本郵便局
//===========
class JapanPO: AbstractPO {
    override func send(address _address: String) -> Void { //擬似抽象メソッドの実際の処理
        print("一週間前後で届きます")
    }
}

//=========
//実行
//=========
//郵便局の設置
var _sinjukuPO: AbstractPO = ShinjukuPO()
var _tokyoPO: AbstractPO = TokyoPO()
var _japanPO: AbstractPO = JapanPO()

//責任のたらいまわしのセット
_sinjukuPO.setNext(po: _tokyoPO)
_tokyoPO.setNext(po: _japanPO)

//投函（全て新宿郵便局に投函する）
_sinjukuPO.send(address: "新宿区XX町X-X-X") //=> 本日中に届きます
_sinjukuPO.send(address: "東京都中野区XX町X-X") //=> 明後日中に届きます
_sinjukuPO.send(address: "北海道札幌市XX町X-X-X") //=> 一週間前後で届きます
```

実行環境：macOS 10.12.4、Swift 3.1  
作成者：Takashi Nishimura  
作成日：2016年08月10日  
更新日：2017年05月16日


<a name="Mediator"></a>
# <b><ruby>Mediator<rt>メディエイター</rt></ruby></b>

```
//test.swift

//=================================
// 相談役（専門性が高いため使い捨て）
//=================================
class Mediator {
    //メンバーリスト
    private var _memberList: [AbstractMember] = [] 
    //クラス定数
    static let Member_A: AbstractMember = MemberA()
    static let Member_B: AbstractMember = MemberB()
    static let Member_C: AbstractMember = MemberC()

    //コンストラクタ
    init() {
        addMember(member: Mediator.Member_A)
        addMember(member: Mediator.Member_B)
        addMember(member: Mediator.Member_C)
    }

    //メンバーリストに登録
    private func addMember(member _member: AbstractMember) -> Void {
        _memberList.append(_member) //Array.append(値)
        _member.setMediator(mediator: self) //メンバーに相談役は自分であることを教える
    }

    //メンバーからの報告を受け指示を出す（特に専門性が高いメソッド）
    func requestMediator(member _member: AbstractMember, string _string: String) {
        if (_member === Mediator.Member_A) { //「===」にすること
            if (_string == "西へ行く") {
                //「メンバーA」から「西へ行く」と報告があった場合の処理
                _member.advice(string: "（Aよ）了解、そのまま西へ行け") //Aへ指示
                //A以外への指示
                for theMember in _memberList {
                    if (theMember === Mediator.Member_B) { //「===」にすること
                        theMember.advice(string: "（Bよ）東へ行け") //Bへ指示
                    } else if (theMember === Mediator.Member_C) { //「===」にすること
                        theMember.advice(string: "（Cよ）その場で待機しろ") //Cへ指示
                    }
                }
            }
        }
        //以降、各メンバーからの報告内容に対する処理を記述
    }
}

//==================
// 登録するメンバー達
//==================
// 擬似抽象クラス //
class AbstractMember {
    var _mediator: Mediator? = nil //「?」が必須
    func setMediator(mediator _mediator: Mediator) -> Void { //共通の機能
        self._mediator = _mediator
    }
    //抽象メソッドの宣言（派生クラスでoverride）
    func request(string _string: String) -> Void {
        print("サブクラスでoverrideして実装して下さい")
    }
    func advice(string _string: String) -> Void {
        print("サブクラスでoverrideして実装して下さい")
    }
}

// メンバーA //
class MemberA: AbstractMember {
    override func request(string _string: String) -> Void { //抽象メソッドをoverride
        _mediator?.requestMediator(member: self, string: _string) //「?」が必須
    }
    //相談役からの指示を受ける
    override func advice(string _string: String) -> Void {
        print("MemberA: " + _string)
    }
}

// メンバーB //
class MemberB: AbstractMember {
    override func request(string _string: String) -> Void { //抽象メソッドをoverride
        _mediator?.requestMediator(member: self, string: _string) //「?」が必須
    }
    //相談役からの指示を受ける
    override func advice(string _string: String) -> Void {
        print("MemberB: " + _string)
    }
}

// メンバーC //
class MemberC: AbstractMember {
    override func request(string _string: String) -> Void { //抽象メソッドをoverride
        _mediator?.requestMediator(member: self, string: _string) //「?」が必須
    }
    //相談役からの指示を受ける
    override func advice(string _string: String) -> Void {
        print("MemberC: " + _string)
    }
}

//=======
// 実行
//=======
var mediator: Mediator = Mediator()
//検証（今回はクラス定数を使いました）
Mediator.Member_A.request(string: "西へ行く") //メンバーAから報告
//=> MemberA: （Aよ）了解、そのまま西へ行け
//=> MemberB: （Bよ）東へ行け
//=> MemberC: （Cよ）その場で待機しろ
```

実行環境：macOS 10.12.4、Swift 3.1  
作成者：Takashi Nishimura  
作成日：2016年08月10日  
更新日：2017年05月16日


<a name="Observer"></a>
# <b><ruby>Observer<rt>オブザーバ</rt></ruby></b>

```
//test.swift

protocol ISubject {
    func addObserver(observer _observer: IObserver) -> Void
    //removeObserver()は複雑になるので今回は省略
    func notify() -> Void
}

class Apple: ISubject {
    private var _observerList: [IObserver] = [] //リスナーリスト
    func addObserver(observer _observer: IObserver) -> Void { //リスナーの登録
        _observerList.append(_observer) //Array.append(値)
    }
    //全リスナーへの通知
    func notify() -> Void {
        for _observer in _observerList {
            _observer.update(apple: self)
        }
    }
    func getVersion() -> String { return "10.3.1" }
}

protocol IObserver {
    func update(apple _apple: Apple) -> Void
}

class IPhone: IObserver {
    func update(apple _apple: Apple) -> Void {
        print("iPhoneは" + _apple.getVersion() + "にアップデート可能")
    }
}

class IPad: IObserver {
    func update(apple _apple: Apple) -> Void {
        print("iPadは" + _apple.getVersion() + "にアップデート可能")
    }
}

class IPadPro: IObserver {
    func update(apple _apple: Apple) -> Void {
        print("iPadProは" + _apple.getVersion() + "にアップデート可能")
    }
}

//=======
// 実行
//=======
//観察される（Subject）役
var _apple: ISubject = Apple()
        
//リスナー（Observer）役
var _iPhone: IObserver = IPhone()
var _iPad: IObserver = IPad()
var _iPadPro: IObserver = IPadPro()

//リスナー（Observer）の登録
_apple.addObserver(observer: _iPhone)
_apple.addObserver(observer: _iPad)
_apple.addObserver(observer: _iPadPro)

_apple.notify() //全リスナー（Observer）への通知
//=> IPhoneは10.3.1にアップデート可能
//=> IPadは10.3.1にアップデート可能
//=> IPadProは10.3.1にアップデート可能
```

実行環境：macOS 10.12.4、Swift 3.1  
作成者：Takashi Nishimura  
作成日：2016年08月10日  
更新日：2017年05月16日


<a name="Memento"></a>
# <b><ruby>Memento<rt>メメント</rt></ruby></b>

```
//test.swift

//========================
//主人公役 + バックアップ係
//========================
class Gamer {
    private var _point: Int = 0
    private var _history: [SnapShot] = [] //履歴用リスト
    private var _count: Int = 0 //undo、redo用
    
    init(point _point: Int=0) { //コンストラクタ
        self._point = _point
    }
    
    var point: Int { //gettter/setter
        get { return _point }
        set { _point = newValue }
    }

    //状態を保存	
    func save() -> SnapShot {
        var _snapShot: SnapShot //ローカル変数宣言
        _snapShot = SnapShot(point: _point) //インスタンス生成
        _history.append(_snapShot) //←Array.append(値)
        _count = _history.count - 1
        return _snapShot
    }
    
    //履歴	
    func history() -> Void {
        for i in 0 ..< _history.count {
            print(String(i) + ": " + String(_history[i].point))
        }
    }
    
    //undo（やり直し）
    func undo() -> SnapShot {
        if (_count > 0) {
            _count -= 1
            return _history[_count]
        } else {
            print("これ以上、undoできません")
            _count = 0
            return _history[0]
        }
    }
    
    //redo（再実行）
    func redo() -> SnapShot {
        if (_count < _history.count - 1) {
            _count += 1
            return _history[_count]
        } else {
            print("これ以上、redoできません")
            _count = _history.count-1
            return _history[_count]
        }
    }
}

//==========================================
// Memento役（その瞬間の状態をオブジェクト化）
//==========================================
class SnapShot {
    private var _point: Int //今回はシンプルに1つだけにしておきます
    init(point _point: Int) {
        self._point = _point
    }
    var point: Int { //gettter/setter
        get { return _point }
        set { _point = newValue }
    }
}

//=======
// 実行
//=======
var _gamer: Gamer = Gamer(point: 100) //ゲームスタート（最初のポイントは100）
var _snapShot: SnapShot = _gamer.save() //最初の状態を保存

_gamer.point = 2000 //いろいろゲームが進行して2000ポイントに...
_snapShot = _gamer.save() //この時点での状態を保存

_gamer.point = 8000 //更にゲームが進行して8000ポイントに...
_snapShot = _gamer.save() //この時点での状態を保存

_gamer.history() //履歴を調べる
// 0: 100
// 1: 2000
// 2: 8000

_snapShot = _gamer.undo() //undo（やり直し）
print(_snapShot.point) //2000
_snapShot = _gamer.undo()
print(_snapShot.point) //100
_snapShot = _gamer.undo()
print(_snapShot.point) //これ以上、undoできません 100

_snapShot = _gamer.redo() //redo（再実行）
print(_snapShot.point) //2000
_snapShot = _gamer.redo()
print(_snapShot.point) //8000
_snapShot = _gamer.redo()
print(_snapShot.point) //これ以上、redoできません 8000
```

実行環境：macOS 10.12.4、Swift 3.1  
作成者：Takashi Nishimura  
作成日：2016年08月10日  
更新日：2017年05月16日


<a name="State"></a>
# <b><ruby>State<rt>ステート</rt></ruby></b>

```
//test.swift

//=======================
// Context（状態を管理）役
//=======================
class Janken {
    //状態（State○）を格納
    private var _state: IState? = nil //「?」が必須
    
    func setState(state _state: IState) -> Void {
        self._state = _state
    }
    
    func exec() -> Void {
        _state?.execute() //State○.execute()メソッドを呼出す（「?」が必須）
    }
}

//================
// State（状態）役
//================
//プロトコル（≒インターフェース）
protocol IState {
    func execute() -> Void
}

//状態A
class StateA: IState {
    func execute() -> Void { //←Janken.exec()から呼び出される
        print("グー、グー、パー")	
    }
}

//状態B
class StateB: IState {
    func execute() -> Void { //←Janken.exec()から呼び出される
        print("パー、グー、チョキ")
    }
}

//=======
// 実行
//=======
//Context役
var _janken: Janken = Janken()

//State（状態）役
var _stateA: IState = StateA()
var _stateB: IState = StateB()

//状態の設定＆実行
_janken.setState(state: _stateA)
_janken.exec() //=> グー、グー、パー

//状態の変更＆実行
_janken.setState(state: _stateB)
_janken.exec() //=> パー、グー、チョキ
```

実行環境：macOS 10.12.4、Swift 3.1  
作成者：Takashi Nishimura  
作成日：2016年08月10日  
更新日：2017年05月16日


<a name="Command"></a>
# <b><ruby>Command<rt>コマンド</rt></ruby></b>

```
//test.swift

//================
//グラフィックソフト
//================
class Inkscape {
    private var _canvas: Canvas = Canvas() //Receiver（結果を表示する）役
    private var _history: [DrawCommand] = [] //履歴（命令クラス）を保存
    func draw(command _command: String) -> Void { //命令の実行
        //↓命令を実行する度にインスタンス生成
        var _drawCommand: DrawCommand //ローカル変数宣言
        _drawCommand = DrawCommand(canvas: _canvas, command: _command) 
        _drawCommand.execute()
        _history.append(_drawCommand) //Array.append(値)
    }
}

//==========
//命令クラス
//==========
class DrawCommand {
    private var _canvas: Canvas
    private var _command: String
    init(canvas _canvas: Canvas, command _command: String) { //コンストラクタ
        self._canvas = _canvas
        self._command = _command
    }
    func execute() -> Void { //←Inkscape.draw()から呼び出される
        _canvas.update(command: _command)
    }
}

//=======================================
//結果を表示する役＝Receiver（受信者）の役
//=======================================
class Canvas {
    private var _history: [String] = [] //履歴（実際の処理）を保存
    func update(command _command: String) -> Void { //キャンバスの再描画
        _history.append(_command)
        for String_ in _history {
            print(String_)
        }
    }
}

//=======
// 実行
//=======
var _inkscape: Inkscape = Inkscape() //グラフィックソフト
_inkscape.draw(command: "線を引く") //=> 線を引く
_inkscape.draw(command: "縁取る") //=> 線を引く、縁取る
_inkscape.draw(command: "影を付ける") //=> 線を引く、縁取る、影を付ける
```

実行環境：macOS 10.12.4、Swift 3.1  
作成者：Takashi Nishimura  
作成日：2016年08月10日  
更新日：2017年05月16日


<a name="Interpreter"></a>
# <b><ruby>Interpreter<rt>インタプリタ</rt></ruby></b>

* 例文は ActionScript、SWF、AVM（ActionScript Virtual Machine）を自作ミニ言語と見立てています。
* 例文は「終端となる表現の役」を省略しています。

```
//test.swift

import Foundation //String.components()に必要

//============================
// 文字列の一部分を取得する関数
//============================
func subString(String arg1: String, start arg2: Int, end arg3: Int) -> String {
    var _result: String
    _result = arg1[arg1.index(arg1.startIndex, offsetBy: arg2)
    ...
    arg1.index(arg1.startIndex, offsetBy: arg3)]
    return _result
}

//============================
// ≒ SWFファイルを生成するクラス
//============================
class SWF {
    private var _codeArray: [String] = [] //命令を配列化（中間コード）
    private var _count: Int = 0 //getNextCode()で使用
    
    //コンストラクタ
    init(code _code: String) {
        _codeArray = _code.components(separatedBy: ";") //「;」で分割配列化（中間コードに変換）
    }

    //次の命令を返す
    func getNextCode() -> String { 
        var _result: String //ローカル変数宣言
        _result = _codeArray[_count]
        _count += 1
        return _result
    }
    
    //次の命令があるかどうか...
    func isEnd() -> Bool { 
        return _count >= _codeArray.count
    }
}
//==============================
// ≒ ActionScript Virtual Machine
//==============================
class AVM {
    func execute(swf _swf: SWF) -> Void {
        var _result: Int //ローカル変数宣言
        _result = 0 //計算結果
        //↓次の命令があれば...
        while !_swf.isEnd() {
            var _nextCode: String //ローカル変数宣言
            _nextCode = _swf.getNextCode() //次の命令を調べる

            //ここからはサンプルの独自処理
            var _operator: String //ローカル変数の宣言（必須）
            _operator = subString(String: _nextCode, start: 0, end: 0) //「+*/-=」の何れか
            if (_operator != "=") {
                var _int: Int //ローカル変数宣言
                _int = Int(subString(String: _nextCode, start: 1, end: _nextCode.characters.count-1))!
                switch (_operator) {
                    case "+" :  _result += _int
                    case "-" :  _result -= _int
                    case "*" :  _result *= _int
                    case "/" :  _result /= _int
                    default :  print("error: 演算子が異なります")
                }
            } else { //「=」の場合...
                //本来はここで「終端となる表現」のクラスを生成して処理をしますが省略
                print(_result)
            }
        }
    }
}

//======
// 実行
//======
var _code: String = "+10;*50;/2;-4;=" //自作言語による記述（≒ActionScript）
var _swf: SWF = SWF(code: _code) //≒SWFファイルに変換
var _avm_: AVM = AVM() //≒ActionScript Virtual Machine
_avm_.execute(swf: _swf) //≒SWFファイルをAVM上で実行（計算結果は246）
```

実行環境：macOS 10.12.4、Swift 3.1  
作成者：Takashi Nishimura  
作成日：2016年08月10日  
更新日：2017年05月16日