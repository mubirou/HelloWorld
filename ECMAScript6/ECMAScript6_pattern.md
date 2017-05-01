### <b>この項目は書きかけの項目です</b>

# <b>ECMAScript 6 デザインパターン</b>

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

### 目的
* あるクラスに対してインスタンスが1つしか存在しないことを保証し、それをアクセスするためのグローバルな方法を提供する。（『オブジェクト指向における再利用のためのデザインパターン』より）
* 言い方を変えると、クラスを利用するプログラマがどのような方法で記述したとしても、そのインスタンスを勝手に生成できないようにし、かつ、唯一のインスタンスを利用できる機能を提供する。

### プログラミングの肝
* new クラス名() など（言語によって異なる）を使ったインスタンス生成をできないようにする。
* 唯一のインスタンスを呼び出す機能（メソッドの場合がほとんど）を用意する。

### 例文
```
<script>

class Singleton {
    constructor() { //コンストラクタ
        if (! Singleton.__isInstance) {
            throw new Error("Singleton.getSingleton()を使って下さい");
        }
    }
    static getSingleton() { //クラスメソッド
        if (Singleton.__singleton == undefined) { //もしまだ生成されていないなら...
            Singleton.__isInstance = true; //←↓（擬似）プライベートなクラスメンバ
            Singleton.__singleton = new Singleton(); //ここでインスタンス生成!!
            console.log("インスタンスが生成されました"); //DEBUG
            Singleton.__isInstance = false; //必須
        }
        return Singleton.__singleton; //←唯一のインスタンスを返す
    }
}

var _singleton1 = Singleton.getSingleton(); //=> "インスタンスが生成されました"
var _singleton2 = Singleton.getSingleton(); //2度目はインスタンスは生成されない
console.log(_singleton1 == _singleton2); //=> true（中身は全く同じインスタンス）
//var _singleton3 = new Singleton(); //=> Error: Singleton.getSingleton()を使って下さい

//問題点：実はパブリックのため外部から変更できてしまう（これは致し方ないでしょう...）
Singleton.__singleton = "改竄できますよ";
console.log(Singleton.getSingleton()); //=> "改竄できますよ"

</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2016年10月05日  
更新日：2017年04月28日


<a name="Prototype"></a>
# <b><ruby>Prototype<rt>プロトタイプ</rt></ruby></b>

### 目的
* 生成すべきオブジェクトの種類を原型となるインスタンスを使って明確にし、それをコピーすることで新たなオブジェクトの生成を行う。（『オブジェクト指向における再利用のためのデザインパターン 改訂版』より）
* 言い換えると new クラス名() などによってインスタンスを作るのではなく、作成済みのインスタンスをコピー（複製）して新しいインスタンスを作る。

### プログラミングの肝
1. パブリックな clone() メソッドを用意
1. そのメソッドの中で自分自身（同じクラス）のインスタンスを生成
1. 生成したインスタンスにコピー元の全てのインスタンス･プロパティの値をセット
1. そのインスタンスを返す。（各メソッドやアクセサは、何もせずにそのまま利用可能）

### 例文
```
<script>

//=================
// Prototypeクラス
//=================
class Prototype {
    //コンストラクタ
    constructor(_name, _address) {
        this.__name = _name;
        this.__address = _address;
    }

    clone() {
        var _prototype = new Prototype(); //自分自身（同じクラス）のインスタンスを生成
        _prototype.name = this.name; //コピー元のインスタンス･プロパティの値をセット
        _prototype.address = this.address; //コピー元のインスタンス･プロパティの値をセット
        return _prototype; //インスタンスをかえす
    }

    //各プロパティのアクセサ
    get name() { return this.__name; }
    set name(_newValue) { this.__name = _newValue; }
    get address() { return this.__address; }
    set address(_newValue) { this.__address = _newValue; }
}

//=====
//実行
//=====
var _memberA = new Prototype("鈴木一郎", "新宿区XX町X-X-X");
var _memberB = _memberA.clone(); //インスタンスをコピー（複製）
_memberB.name = "鈴木花子"; //プロパティを変更
console.log(_memberA.name, _memberA.address); //=> "鈴木一郎 新宿区XX町X-X-X"
console.log(_memberB.name, _memberB.address); //=> "鈴木花子 新宿区XX町X-X-X"

</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2016年10月05日  
更新日：2017年04月28日


<a name="Builder"></a>
# <b><ruby>Builder<rt>ビルダー</rt></ruby></b>

```
<script>

//===========================================================
// Builder役＝抽象クラス（全て抽象メソッドである必要はない）
//===========================================================
class AbstractBuilder {
    makeHeader() { throw new Error("サブクラスで実装して下さい"); }
    makeContent() { throw new Error("サブクラスで実装して下さい"); }
    makeFooter() { throw new Error("サブクラスで実装して下さい"); }
}

//==============================
// ConcreateBuilder役＝制作者Ａ
//==============================
class SummerCardBuilder extends AbstractBuilder {
    makeHeader() { console.log("暑中お見舞い申し上げます"); }
    makeContent() { console.log("スイカのイラスト"); }
    makeFooter() { console.log("盛夏"); }
}

//==============================
// ConcreateBuilder役＝制作者Ｂ
//==============================
class NewYearCardBuilder extends AbstractBuilder {
    makeHeader() { console.log("明けましておめでとうございます"); }
    makeContent() { console.log("干支のイラスト"); }
    makeFooter() { console.log("元旦"); }
}

//============================================
// Director役＝監督（作成手順を決め実行する）
//============================================
class Director {
    constructor(_builder) { 
        this.__builder = _builder;
    }
    construct() { //作成過程（ConcreteBuilder役特有のメソッドは使わないこと）
        this.__builder.makeHeader();
        this.__builder.makeContent();
        this.__builder.makeFooter();
    }
}

//======
// 実行
//======
var _summerCard = new Director(new SummerCardBuilder());
_summerCard.construct(); //作成過程の実行
//=> 暑中お見舞い申し上げます
//=> スイカのイラスト
//=> 盛夏

var _newYearCard = new Director(new NewYearCardBuilder());
_newYearCard.construct(); //作成過程の実行
//=> 明けましておめでとうございます
//=> 干支のイラスト
//=> 元旦

</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2016年10月05日  
更新日：2017年04月28日


<a name="FactoryMethod"></a>
# <b><ruby>Factory Method<rt>ファクトリー メソッド</rt></ruby></b>

```
<script>

//===========
// 抽象クラス
//===========
class AbstracShop {
    //templateMethod()のこと
    order(_type) {
        //↓「変化する部分」をカプセル化（汎用化にも寄与）
        var _card = this.factoryMethod(_type); //ここで new しない
        //↓変化しない部分（一連の処理／具体的な処理内容は各カードのクラスまかせ）
        _card.makeHeader();
        _card.makeContent();
        _card.makeFooter();
        return _card;
    }

    //抽象メソッド（オプション）
    factoryMethod() {
        throw new Error("サブクラスで実装して下さい");
    }
}

//=============
// サブクラスＡ
//=============
class CardShopICHIRO extends AbstracShop { //抽象クラスを継承
    //↓インスタンスの作成をサブクラスのfactoryMedthod()で行う
    factoryMethod(_type) {
        //↓「変化する部分」（手紙の種類は時とともに変化する可能性がある）
        if (_type == "暑中見舞い") {
            return new IchiroSummerCard(); //ここでインスタンス化
        } else if (_type == "年賀状") {
            return new IchiroNewYearCard(); //ここでインスタンス化
        } else if (_type == "喪中はがき") {
            return new IchiroMourningCard(); //ここでインスタンス化
        } else {
            throw new Error(_type + " にはまだ対応しておりません");
        }
    }
}

//=============
// サブクラスＢ
//=============
class CardShopHANAKO extends AbstracShop { //抽象クラスを継承
    //↓インスタンスの作成をサブクラスのfactoryMedthod()で行う
    factoryMethod(_type) {
        //↓「変化する部分」（手紙の種類は時とともに変化する可能性がある）
        if (_type == "暑中見舞い") {
            return new HanakoSummerCard(); //ここでインスタンス化
        } else if (_type == "年賀状") {
            return new HanakoNewYearCard(); //ここでインスタンス化
        } else {
            throw new Error(_type + "にはまだ対応しておりません");
        }
    }
}

//===================
// 生成したいクラス群
//===================
//抽象クラス
class AbstractCard {
    //↓共通の機能
    makeFooter() { this.__footer = "〒XXX-XXXX 新宿区XX町X-X-X"; }
    print() {
        console.log(this.__header);
        console.log(this.__content);
        console.log(this.__footer);
    }
}

//ICHIROショップスタイルの暑中見舞い
class IchiroSummerCard extends AbstractCard {
    makeHeader() { this.__header = "HAPPY SUMMER HOLIDAYS!"; }
    makeContent() { this.__content = "サーフィンのイラスト"; }
}

//ICHIROショップスタイルの年賀状
class IchiroNewYearCard extends AbstractCard {
    makeHeader() { this.__header = "HAPPY NEW YEAR!"; }
    makeContent() { this.__content = "干支のイラスト"; }
}

//ICHIROショップスタイルの喪中はがき
class IchiroMourningCard extends AbstractCard {
    makeHeader() { this.__header = "喪中のため年頭のご挨拶をご遠慮申し上げます"; }
    makeContent() { this.__content = "白黒のイラスト"; }
}

//HANAKOショップスタイルの暑中お見舞い
class HanakoSummerCard extends AbstractCard {
    makeHeader() { this.__header = "暑中お見舞い申し上げます"; }
    makeContent() { this.__content = "スイカのイラスト"; }
}

//HANAKOショップスタイルの年賀状
class HanakoNewYearCard extends AbstractCard {
    makeHeader() { this.__header = "明けましておめでとうございます"; }
    makeContent() { this.__content = "お餅のイラスト"; }
}

//======================
// 実行（ICHIROショップ）
//======================
var _ichiro = new CardShopICHIRO();

var _card = _ichiro.order("暑中見舞い"); //templateMethod()のこと
_card.print();
//=> HAPPY SUMMER HOLIDAYS!
//=> サーフィンのイラスト
//=> 〒XXX-XXXX 新宿区XX町X-X-X

var _card = _ichiro.order("年賀状"); //templateMethod()のこと
_card.print();
//=> HAPPY NEW YEAR!
//=> 干支のイラスト
//=> 〒XXX-XXXX 新宿区XX町X-X-X

var _card = _ichiro.order("喪中はがき"); //templateMethod()のこと
_card.print();
//=> 喪中のため年頭のご挨拶をご遠慮申し上げます
//=> 白黒のイラスト
//=> 〒XXX-XXXX 新宿区XX町X-X-X

//======================
// 実行（HANAKOショップ）
//======================
var _hanako = new CardShopHANAKO();

var _card = _hanako.order("暑中見舞い"); //templateMethod()のこと
_card.print();
//=> 暑中お見舞い申し上げます
//=> スイカのイラスト
//=> 〒XXX-XXXX 新宿区XX町X-X-X

var _card = _hanako.order("年賀状"); //templateMethod()のこと
_card.print();
//=> 明けましておめでとうございます
//=> お餅のイラスト
//=> 〒XXX-XXXX 新宿区XX町X-X-X

</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2016年10月07日  
更新日：2017年04月28日


<a name="AbstractFactory"></a>
# <b><ruby>Abstract Factory<rt>アブストラクト ファクトリー</rt></ruby></b>

```
<script>

// カードショップ ///////////////////////////////////////////////////
//==========================
// 抽象クラス（抽象的な工場）
//==========================
class AbstracShop {
    //静的メソッド
    static getShop(_className) {
        if (_className == "CardShopICHIRO") {
            return new CardShopICHIRO(); //ここでインスタンス化
        } else if (_className == "CardShopHANAKO") {
            return new CardShopHANAKO(); //ここでインスタンス化
        }
    }

    //抽象メソッド
    createSummerCard() { throw new Error("サブクラスで実装して下さい"); }
    createNewYearCard() { throw new Error("サブクラスで実装して下さい"); }
    createMourningCard() { throw new Error("サブクラスで実装して下さい"); }

    //共通の機能（オプション）
    makeFooter() { console.log("〒XXX-XXXX 新宿区XX町X-X-X"); }
}

//=============
// サブクラスＡ
//=============
class CardShopICHIRO extends AbstracShop { //抽象クラスを継承
    createSummerCard() { //抽象クラスをオーバーライド
        console.log("HAPPY SUMMER HOLIDAYS!");
        console.log("サーフィンのイラスト");
        this.makeFooter();
    }
    createNewYearCard() { //抽象メソッドをオーバーライド
        console.log("HAPPY NEW YEAR!");
        console.log("干支のイラスト");
        this.makeFooter();
    }
    createMourningCard() { //抽象メソッドをオーバーライド
        console.log("喪中のため年頭のご挨拶をご遠慮申し上げます");
        console.log("白黒のイラスト");
        this.makeFooter();
    }
}

//=============
// サブクラスＢ
//=============
class CardShopHANAKO extends AbstracShop { //抽象クラスを継承
    createSummerCard() { //抽象クラスをオーバーライド
        console.log("暑中お見舞い申し上げます");
        console.log("スイカのイラスト");
        this.makeFooter();
    }
    createNewYearCard() { //抽象クラスをオーバーライド
        console.log("明けましておめでとうございます");
        console.log("お餅のイラスト");
        this.makeFooter();
    }
    createMourningCard() { //抽象クラスをオーバーライド
        throw new Error("喪中はがきにはまだ対応しておりません");
    }
}
/////////////////////////////////////////////////////////////////////

//=======================
// 実行（ICHIROショップ）
//=======================
var _ichiro = AbstracShop.getShop("CardShopICHIRO"); //静的メソッドを使用

_ichiro.createSummerCard();
//=> HAPPY SUMMER HOLIDAYS!
//=> サーフィンのイラスト
//=> 〒XXX-XXXX 新宿区XX町X-X-X

_ichiro.createNewYearCard();
//=> HAPPY NEW YEAR!
//=> 干支のイラスト
//=> 〒XXX-XXXX 新宿区XX町X-X-X

_ichiro.createMourningCard();
//=> 喪中のため年頭のご挨拶をご遠慮申し上げます
//=> 白黒のイラスト
//=> 〒XXX-XXXX 新宿区XX町X-X-X

//=======================
// 実行（HANAKOショップ）
//=======================
var _hanako = AbstracShop.getShop("CardShopHANAKO"); //静的メソッドを使用

_hanako.createSummerCard();
//=> 暑中お見舞い申し上げます
//=> スイカのイラスト
//=> 〒XXX-XXXX 新宿区XX町X-X-X

_hanako.createNewYearCard();
//=> 明けましておめでとうございます
//=> お餅のイラスト
//=> 〒XXX-XXXX 新宿区XX町X-X-X

//_hanako.createMourningCard(); //=> Error: 喪中はがきにはまだ対応しておりません

</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2016年10月11日  
更新日：2017年04月28日


<a name="Adapter（継承）"></a>
# <b><ruby>Adapter<rt>アダプター</rt></ruby>（継承）</b>

```
<script>
    
    //===============
    // スーパークラス
    //===============
    class Moneybox {
        constructor(_firstYen) {
            this.__yen = _firstYen;
        }
        addYen(_yen) {
            this.__yen += _yen;
        }
        getYen() {
            return this.__yen;
        }
    }

    //=====================================================
    // サブクラス（このクラスの内容のみ「委譲」版と異なる）
    //=====================================================
    class Exchange extends Moneybox { //スーパークラスの継承
        constructor(_firstYen, _rate) { //コンストラクタ
            super(_firstYen); //スーパーラスのコンストラクタの呼出し
            this.__rate = _rate;
        }
        addYen(_yen) { //継承するスーパークラスのaddYen()と内容が同じなので省略可能ですが...
            super.addYen(_yen); //スーパークラスの同名メソッドの呼出し
        }
        getDollar() {
            return this.getYen() / this.__rate;
        }
    }

    //=====
    // 実行
    //=====
    var _exchange = new Exchange(10000, 111.520); //最初の貯金, レート
    _exchange.addYen(8000);
    console.log(_exchange.getDollar()); //=> 161.40602582496413（ドル）

</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2016年10月11日  
更新日：2017年04月29日


<a name="Adapter（委譲）"></a>
# <b><ruby>Adapter<rt>アダプター</rt></ruby>（委譲）</b>

```
<script>
    
    //===============
    // スーパークラス
    //===============
    class Moneybox {
        constructor(_firstYen) {
            this.__yen = _firstYen;
        }
        addYen(_yen) {
            this.__yen += _yen;
        }
        getYen() {
            return this.__yen;
        }
    }

    //=====================================================
    // サブクラス（このクラスの内容のみ「継承」版と異なる）
    //=====================================================
    class Exchange {
        constructor(_firstYen, _rate) { //コンストラクタ
            this.__moneybox = new Moneybox(_firstYen); //ポイント
            this.__rate = _rate;
        }
        addYen(_yen) {
            this.__moneybox.addYen(_yen); //スーパークラスの同名メソッドの呼出し
        }
        getDollar() {
            return this.__moneybox.getYen() / this.__rate;
        }
    }

    //=====
    // 実行
    //=====
    var _exchange = new Exchange(10000, 111.520); //最初の貯金, レート
    _exchange.addYen(8000);
    console.log(_exchange.getDollar()); //=> 161.40602582496413（ドル）

</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2016年10月11日  
更新日：2017年05月01日


<a name="Bridge"></a>
# <b><ruby>Bridge<rt>ブリッジ</rt></ruby></b>

```
<script>
    
//==================
//「機能クラス」関連
//==================
class SuperMobile {
    constructor(_os) {
        this.__os = _os; //「機能クラス」と「実装クラス」の「橋」（委譲）
    }
    get version() { //アクセサ（getter）
        return this.__os.version; //「橋」を使って「実装クラス」にアクセス
    }
    set version(_newValue) { throw new Error("versionは読み取り専用です"); }
}

class Tablet extends SuperMobile {
    constructor(_os) {
        super(_os); //スーパークラスのコンストラクタの呼出し
    }
    bigScreen() { //タブレット特有の機能
        console.log("大きな画面で見る");
    }
}

class SmartPhone extends SuperMobile {
    constructor(_os) {
        super(_os); //スーパークラスのコンストラクタの呼出し
    }
    phone() { //スマートフォン特有の機能
        console.log("電話をかける");
    }
}

//==================
//「実装クラス」関連
//==================
class AbstractOS { //（擬似）抽象クラス
    get version() { throw new Error("サブクラスで実装して下さい"); } //抽象メソッド
}

class Android extends AbstractOS {
    constructor() {
        super(); //何もしなくても必須
        this.__version = "Android 7.1.2 Nougat ";
    }
    get version() { //抽象メソッドの具体的な実装
        return this.__version;
    }
    set version(_newValue) { throw new Error("Android社外は操作不可"); }
}

class IOS extends AbstractOS {
    constructor() {
        super(); //何もしなくても必須
        this.__version = "iOS 10.3.1";
    }
    get version() { //抽象メソッドの具体的な実装
        return this.__version;
    }
    set version(_newValue) { throw new Error("Apple社外は操作不可!"); }
}

//========================================================================================
// 実行
//========================================================================================
var _tabletA = new Tablet(new Android());
console.log(_tabletA.version); //=> "Android 7.1.2 Nougat "
_tabletA.bigScreen(); //=> "大きな画面で見る"

var _tabletB = new Tablet(new IOS());
console.log(_tabletB.version); //=> "iOS 10.3.1"
_tabletB.bigScreen(); //=> "大きな画面で見る"

var _smartPhoneA = new SmartPhone(new Android());
console.log(_smartPhoneA.version); //=> "Android 7.1.2 Nougat "
_smartPhoneA.phone(); //=> "電話をかける"

var _smartPhoneB = new SmartPhone(new IOS());
console.log(_smartPhoneB.version); //=> "iOS 10.3.1"
_smartPhoneB.phone(); //=> "電話をかける"

</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2016年10月12日  
更新日：2017年05月01日


<a name="Composite"></a>
# <b><ruby>Composite<rt>コンポジット</rt></ruby></b>

```
<script>

//============
// Component役
//============
class Component { //抽象クラス
    get name() { return this.__name; }
    set name(_newValue) { this.__name = _newValue;} 
    get parent() { return this.__parent; }
    set parent(_newValue) { this.__parent = _newValue; }
    getList() { throw new Error("サブクラスで実装して下さい"); } //抽象メソッド
}

//=====================
// Composite（複合体）役
//=====================
class Folder extends Component {
    constructor(_name) {
        super();
        this.__name = _name;
        this.__childList = [];
    }
    add(_arg) {
        this.__childList.push(_arg);
        _arg.parent = this;
    }
    getList() { //抽象メソッドをオーバーライド
        var _theList =this.__childList;
        for (let _indexNum in _theList) {
            let _result = this.name + "/" + _theList[_indexNum].name;
            if (_theList[_indexNum] instanceof Folder) {
                _result = _result + "(Folder)";
            } else {
                _result = _result + "(File)";
            }
            console.log(_result);
        }
    }
}

//=============
// Leaf（葉）役
//=============
class File extends Component {
    constructor(_name) {
        super();
        this.__name = _name;
    }
    getList() { //抽象メソッドをオーバーライド
        console.log(this.parent.name + "/" + this.name + "(File)");
    }
}

//===============================================
// 実行
// root に Authoring フォルダを作成し、その中に 
// Unity3D と Unreal Engine ファイルを格納してみる
//===============================================
// ①フォルダの作成
var _root = new Folder("root");
var _authoring = new Folder("Authoring");

// ②ファイルの作成
var _unity3D = new File("Unity3D");
var _unrealEngine = new File("Unreal Engine");

// ③関連付け
_root.add(_authoring);
_authoring.add(_unity3D);
_authoring.add(_unrealEngine);

// ④検証
console.log(_unrealEngine.name); //=> "Unreal Engine"
_root.getList(); //=> "root/Authoring(Folder)"
_authoring.getList(); 
//=> "Authoring/Unity3D(File)"
//=> "Authoring/Unreal Engine(File)"
_unity3D.getList(); //=> "Authoring/Unity3D(File)"

</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2016年10月13日  
更新日：2017年05月01日


<a name="Decorator"></a>
# <b><ruby>Decorator<rt>デコレータ</rt></ruby></b>

```
<script>

/****************************************************
 * スーパークラス
 * 「中身」と「飾り枠」に同じshow()メソッドを持たせる
****************************************************/
class Display {
    constructor() { // コンストラクタ
        this.__content = undefined; //宣言（無くてもＯＫ）
    }

    // conentプロパティのアクセサ（getter/setter）
    get content() {
        return this.__content;
    }
    set content(_newValue) {
        throw new Error("contentは読取り専用です");
    }
    
    // 共通のメソッド
    show() {
        console.log(this.__content);
    }

    //本来はこのクラスは「抽象クラス」としここに「抽象メソッド」を記述すべきかもしれません...
}

/**************************
 * 中身（飾りを施す前の元）
**************************/
class Original extends Display {
    constructor(_string) {
        super(); //何もしなくても必須
        this.__content = _string;
    }
}

/***********
 * 飾り枠Ａ
***********/
class DecoratorA extends Display {
    constructor(_display) {
        super(); //何もしなくても必須
        this.__content = "-" + _display.content + "-";
    }
}

/***********
 * 飾り枠Ｂ
***********/
class DecoratorB extends Display {
    constructor(_display) {
        super(); //何もしなくても必須
        this.__content = "<" + _display.content + ">";
    }
}

/***********
 * 実行
***********/
var _original = new Original("NISHIMURA");
_original.show(); //=> NISHIMURA

var _decoratorA = new DecoratorA(new Original("NISHIMURA"));
_decoratorA.show(); //=> -NISHIMURA-

var _decoratorB = new DecoratorB(new Original("NISHIMURA"));
_decoratorB.show(); //=> <NISHIMURA>

var _special = new DecoratorB(
                    new DecoratorA(
                        new DecoratorA(
                            new DecoratorA(
                                new Original("NISHIMURA")
                            )
                        )
                    )
                );
_special.show(); //=> <---NISHIMURA--->

</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2016年10月13日  
更新日：2017年05月01日


<a name="Facade"></a>
# <b><ruby>Facade<rt>ファサード</rt></ruby></b>

```
<script>

/****************************************************
 * スーパークラス
 * 「中身」と「飾り枠」に同じshow()メソッドを持たせる
****************************************************/
class Display {
    constructor() { // コンストラクタ
        this.__content = undefined; //宣言（無くてもＯＫ）
    }

    // conentプロパティのアクセサ（getter/setter）
    get content() {
        return this.__content;
    }
    set content(_newValue) {
        throw new Error("contentは読取り専用です");
    }
    
    // 共通のメソッド
    show() {
        console.log(this.__content);
    }

    //本来はこのクラスは「抽象クラス」としここに「抽象メソッド」を記述すべきかもしれません...
}

/**************************
 * 中身（飾りを施す前の元）
**************************/
class Original extends Display {
    constructor(_string) {
        super(); //何もしなくても必須
        this.__content = _string;
    }
}

/***********
 * 飾り枠Ａ
***********/
class DecoratorA extends Display {
    constructor(_display) {
        super(); //何もしなくても必須
        this.__content = "-" + _display.content + "-";
    }
}

/***********
 * 飾り枠Ｂ
***********/
class DecoratorB extends Display {
    constructor(_display) {
        super(); //何もしなくても必須
        this.__content = "<" + _display.content + ">";
    }
}
// ↑以上4つのクラスはDecoratorパターンの例文と全く同じ

/**************************************************************
 * シンプルな窓口 ←Decoratorパターンにこのクラスを追加するだけ
**************************************************************/
class DecoratorFacade { //Singletonパターンにする場合も...
    static exec(_string, _decratorA_num, _decratorB_num) {
        var _result = new Original(_string);
        for (let i=0; i<_decratorA_num; i++) {
            _result = new DecoratorA(_result);
        }
        for (let i=0; i<_decratorB_num; i++) {
            _result = new DecoratorB(_result);
        }
        _result.show();
    }
}

/***********
 * 実行
***********/
DecoratorFacade.exec("NISHIMURA", 0, 0); //=> NISHIMURA
DecoratorFacade.exec("NISHIMURA", 1, 0); //=> -NISHIMURA-
DecoratorFacade.exec("NISHIMURA", 0, 1); //=> <NISHIMURA>
DecoratorFacade.exec("NISHIMURA", 3, 1); //=> <---NISHIMURA--->

</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2016年10月13日  
更新日：2017年05月01日


<a name="Flyweight"></a>
# <b><ruby>Flyweight<rt>フライウエイト</rt></ruby></b>

```
//xx.js
class Manager { //インスタンスの管理人（Singletonクラス）
    constructor() { //コンストラクタ
        if (! Manager.__isInstance) { throw new Error("newでのインスタンスは生成不可"); }
this.__pool = new Object(); //BigProcessをダブらずに保存する連想配列
    }
    static getInstance() { //クラスメソッド（Singleton用）
        if (Manager.__singleton == undefined) {
            Manager.__isInstance = true;
            Manager.__singleton = new Manager(); //Singletonパターン
            Manager.__isInstance = false;
        }
        return Manager.__singleton;
    }
createBigProcess(_type) { //BigProcessインスタンスをダブらないように連想配列に保存
    if (this.__pool[_type] == undefined) { //既存か否か調べる
        this.__pool[_type] = new BigProcess(_type);
    } else {
        console.log(_type + "は既存です");
    }
    return this.__pool[_type];
}
}

class BigProcess { //Flayweight役
    constructor(_type) { this.__type = _type; }
    getData() { return this.__type + "に対する重〜い処理の結果"; } //重い処理を実行
}

var _manager = Manager.getInstance(); //①インスタンスの管理者（Singletonクラス）
var _a = _manager.createBigProcess("TypeA"); //②無駄にしたくないオブジェクトを生成
var _b = _manager.createBigProcess("TypeB"); //←もしTypeAだと既存のものを共有します
var _a2 = _manager.createBigProcess("TypeA"); //実験（既成のものを生成してみる...）
console.log(_a == _a2); //=> true ←中身は同じインスタンス
console.log(_a.getData()); //=> "TypeAに対する重〜い処理の結果"
console.log(_b.getData()); //=> "TypeBに対する重〜い処理の結果"
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2016年10月14日  
更新日：2017年0X月XX日


<a name="Proxy"></a>
# <b><ruby>Proxy<rt>プロキシー</rt></ruby></b>

```
//xx.js
//========================================================================================
// ①代理人（Proxy役）
//========================================================================================
class Loader {
    constructor(_url) {
        this.__url = _url;
    }

    load() {
        //↓実際の本人登場（代理に実際の本人を知っている）
        var _content = new Content(this.__url);
        _content.load();
    }
}

//========================================================================================
// ②実際の本人（Real Subject役）
//========================================================================================
class Content {
    constructor(_url) {
        this.__url = _url;
    }

    //↓重い処理をここで行う（ポイント）
    load() {
        // 今回のサンプルの中身はあまり重要ではない...
        console.log("重い処理を実行中");
    }
}

//========================================================================================
// 実行（Cliant役）
//========================================================================================
var _loader = new Loader("http://...xxx.mp4");
_loader.load(); //=> "重い処理を実行中"
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2016年10月14日  
更新日：2017年0X月XX日


<a name="Iterator"></a>
# <b><ruby>Iterator<rt>イテレータ</rt></ruby></b>

```
//xx.js
//========================================================================================
// Bikeクラス
//========================================================================================
class Bike {
    // コンストラクタ
    constructor(_name, _num) {
        this.__name = _name;
        this.__num = _num;
    }

    //（擬似）プライベート変数のアクセサ（getter/setter）
    get name() { return this.__name; }
    set name(_newValue) { this.__name = _newValue; }
    get num() { return this.__num; }
    set num(_newValue) { this.__num = _newValue; }
}

//========================================================================================
// BikeParkクラス
//========================================================================================
class BikePark {
    // コンストラクタ
    constructor() {
        this.__list = []; //空の配列を作成
    }

    //↓以下の4つのメソッドは必須（ES6はinterfaceは非サポートのため簡略化）
    add(_bike) {
        this.__list.push(_bike);
    }
    getElementAt(_num) {
        return this.__list[_num];
    }
    getLength() {
        return this.__list.length;
    }
createIterator() {
    return new Iterator(this); //ここでイテレータ（管理人）の生成
}
}

//========================================================================================
// Iteratorクラス（≒駐輪場の管理人）
//========================================================================================
class Iterator {
    // コンストラクタ
    constructor(_bikePark) {
        this.__bikePark = _bikePark;
        this.__count = 0;
    }

    //↓以下の2つのメソッドは必須（ES6はinterfaceは非サポートのため簡略化）
hasNext() {
    return this.__bikePark.getLength() > this.__count;
}
next() {
    return this.__bikePark.getElementAt(this.__count++); //次のバイクを返す
}
}

//========================================================================================
// 実行
//========================================================================================
var _bikePark = new BikePark();
_bikePark.add(new Bike("CB1100F", "神戸 X XX-XX"));
_bikePark.add(new Bike("W800", "宇都宮 X XX-XX"));
_bikePark.add(new Bike("SR400", "杉並区 X XX-XX"));

_iterator = _bikePark.createIterator(); //イテレータ（管理人）生成

while (_iterator.hasNext()) {
    let _nextBike = _iterator.next();
    console.log(_nextBike.name + "," + _nextBike.num);
}
//=> "CB1100F", "神戸 X XX-XX";
//=> "W800", "宇都宮 X XX-XX";
//=> "SR400", "杉並区 X XX-XX";
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2016年10月14日  
更新日：2017年0X月XX日


<a name="TemplateMethod"></a>
# <b><ruby>Template Method<rt>テンプレート メソッド</rt></ruby></b>

```
// xx.js
class AbstractCard {
templateMethod() { //一連の連続した処理の枠組みを定義
    this.makeHeader();
    this.makeContent();
    if (this.isMakeDate()) { this.__makeDate(); } //フックメソッド（状況により実行）
    this.__makeFooter();
}
    makeHeader() { throw new Error("サブクラスで実装して下さい"); } //抽象メソッド
    makeContent() { throw new Error("サブクラスで実装して下さい"); } //抽象メソッド
    isMakeDate() { throw new Error("サブクラスで実装して下さい"); } //抽象メソッド
    __makeDate() { console.log("2017年 元旦"); } //共通の処理
    __makeFooter() { console.log("〒XXX-XXXX 千代田区XXX町X-X-X"); } //共通の処理
}
class SummerCard extends AbstractCard {
    makeHeader() { console.log("HAPPY SUMMER HOLIDAYS!"); } //オーバーライド
    makeContent() { console.log("夏のイラスト"); } //オーバーライド
    isMakeDate() { return false; } //オーバーライド
}
class NewYearCard extends AbstractCard {
    makeHeader() { console.log("HAPPY NEW YEAR!"); } //オーバーライド
    makeContent() { console.log("干支のイラスト"); } //オーバーライド
    isMakeDate() { return true; } //オーバーライド
}

var _summerCard = new SummerCard();
_summerCard.templateMethod();
//=> HAPPY SUMMER HOLIDAYS!
//=> 夏のイラスト
//=> 〒XXX-XXXX 千代田区XXX町X-X-X
var _newYearCard = new NewYearCard();
_newYearCard.templateMethod();
//=> HAPPY NEW YEAR!
//=> 干支のイラスト
//=> 2017年 元旦
//=> 〒XXX-XXXX 千代田区XXX町X-X-X
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2016年10月14日  
更新日：2017年0X月XX日


<a name="Strategy"></a>
# <b><ruby>Strategy<rt>ストラテジー</rt></ruby></b>

```
// xx.js
//========================================================================================
// Strategyクラス関連
//========================================================================================
class IStrategy {
    execute() { throw new Error("サブクラスで実装して下さい"); }
}

class StrategyA extends IStrategy {
    execute() { console.log("グー、グー、パー"); } //オーバーライド
}

class StrategyB extends IStrategy {
    execute() { console.log("パー、グー、チョキ"); } //オーバーライド
}

//========================================================================================
// Jankenクラス
//========================================================================================
class Janken {
    constructor(_strategy) {
        this.__strategy = _strategy;
    }
    exec() {
        this.__strategy.execute(); //exec()だと紛らわしいので...
    }
}

//========================================================================================
// 実行
//========================================================================================
var _jankenA = new Janken(new StrategyA());
var _jankenB = new Janken(new StrategyB());
_jankenA.exec(); //=> "グー、グー、パー"
_jankenB.exec(); //=> "パー、グー、チョキ"
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2016年10月17日  
更新日：2017年0X月XX日


<a name="Visitor"></a>
# <b><ruby>Visitor<rt>ビジター</rt></ruby></b>

```
// 訪問先（受入者＝Acceptor）============================================================
class I受入者 { //（擬似）インターフェース
    accept(_I訪問者) { throw new Error("サブクラスで実装して下さい"); }
}
class 佐藤家 extends I受入者 { //佐藤家
accept(_I訪問者) { _I訪問者.work(this); } //誰であっても「では、よろしく」とお任せする
}
class 高橋家 extends I受入者 { //高橋家
accept(_I訪問者) { _I訪問者.work(this); } //誰であっても「では、よろしく」とお任せする
}

// 訪問者（Visitor）の役 ================================================================
class I訪問者 { //（擬似）インターフェース
    work(_I受入者) { throw new Error("サブクラスで実装して下さい"); }
}
class 庭師 extends I訪問者 { //庭師
    work(_I受入者) {
        console.log(_I受入者, "生垣切り→枝落し→雑草除去...等");
    }
}
class エアコン設置業者 extends I訪問者 { //エアコン設置業者
    work(_I受入者) {
        console.log(_I受入者, "室内機取付→ホース接続→室外機取付...等")
    }
}

// 実行 ==================================================================================
var _佐藤家 = new 佐藤家(); //訪問先①
var _高橋家 = new 高橋家(); //訪問先②
var _庭師 = new 庭師(); //訪問者❶
var _エアコン設置業者 = new エアコン設置業者(); //訪問者❷

_佐藤家.accept(_庭師); //=> 佐藤家のインスタンス→"生垣切り→枝落し→雑草除去...等"
_佐藤家.accept(_エアコン設置業者); //=> 佐藤家のインスタンス→"生垣切り→枝落し→雑草除去...等"
_高橋家.accept(_庭師); //=> 高橋家のインスタンス→"生垣切り→枝落し→雑草除去...等"
_高橋家.accept(_エアコン設置業者); //=> 高橋家のインスタンス→"生垣切り→枝落し→雑草除去...等"
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2016年10月17日  
更新日：2017年0X月XX日


<a name="ChainofResponsibility"></a>
# <b><ruby>Chain of Responsibility<rt>チェーン オブ レスポンシビリティ</rt></ruby></b>

```
class AbstractPO { //各郵便局の抽象クラス
setNext(_nextPO) { //共通のメソッド（責任の「たらい回し先」のセット）
    this.__nextPO = _nextPO;
    return this.__nextPO;
}
    send(_address) { throw new Error("サブクラスで実装して下さい"); } //抽象メソッド
}

class SetagayaPO extends AbstractPO { //新宿郵便局
    send(_address) { //オーバーライドして実装
        if (_address.indexOf("新宿", 0) != -1) {
            console.log("本日中に届きます");
        } else {
this.__nextPO.send(_address); //「たらいまわし先」に送る
        }}}

class TokyoPO extends AbstractPO { //東京郵便局
    send(_address) { //オーバーライドして実装
        if (_address.indexOf("東京", 0) != -1) {
            console.log("明後日中に届きます");
        } else {
this.__nextPO.send(_address); //「たらいまわし先」に送る
        }}}

class JapanPO extends AbstractPO { //日本郵便局
    send(_address) { console.log("一週間前後で届きます"); }
}

// 実行 ==================================================================================
var _setagayaPO = new SetagayaPO(); //新宿郵便局の設置
var _tokyoPO = new TokyoPO(); //東京郵便局の設置
var _japanPO = new JapanPO(); //日本郵便局の設置
_setagayaPO.setNext(_tokyoPO).setNext(_japanPO); //責任の「たらい回し先」のセット
_setagayaPO.send("新宿区XX町X-X-X"); //=> "本日中に届きます"
_setagayaPO.send("東京都青梅市XXX町X-X-X"); //=> "明後日中に届きます"
_setagayaPO.send("北海道XXX市XXX町X-X-X"); //=> "一週間前後で届きます"
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2016年10月17日  
更新日：2017年0X月XX日


<a name="Mediator"></a>
# <b><ruby>Mediator<rt>メディエイター</rt></ruby></b>

```
// xx.js
//========================================================================================
// 各メンバー関連
//========================================================================================
class AbstractMember { //（擬似）抽象クラス
    setMediator(_mediator) { //共通の機能
        this.__mediator = _mediator;
    }
    advice(_string) { throw new Error("サブクラスで実装して下さい"); } //抽象メソッド
}

class YesButton extends AbstractMember { //メンバー①（YesButtonクラス）
on() { this.__mediator.report(this, "on"); } //...→相談役に報告
    advice(_string) {
        if (_string == "off") {
            console.log("YesButtonをoffにします");
        }
    }
}

class NoButton extends AbstractMember { //メンバー②（NoButtonクラス）
on() { this.__mediator.report(this, "on"); } //...→相談役に報告
    advice(_string) {
        if (_string == "off") {
            console.log("NoButtonをoffにします");
        }
    }
}

class TextBox extends AbstractMember { //メンバー③（TextBoxクラス）
    advice(_string) {
        if (_string == "enable") {
            console.log("TextBoxを入力可能にします");
        } else if (_string == "disabled") {
            console.log("TextBoxを入力不可にします");
        }
    }
}
//========================================================================================
// 相談役（専門性が高いため使い捨て）
//========================================================================================
class Mediator {
    constructor() {
        this.__yesButton = new YesButton(); //YesButtonの生成
        this.__noButton = new NoButton(); //NoButtonの生成
        this.__textBox = new TextBox(); //TextButtonの生成

        this.__yesButton.setMediator(this); //YesButtonに相談役が自分あることを教える
        this.__noButton.setMediator(this); //NoButtonに相談役が自分あることを教える
        this.__textBox.setMediator(this); //TextButtonに相談役が自分あることを教える
    }

    get yesButton() { return this.__yesButton; } //外部からYesButtonにアクセス可能に
    get NoButton() { return this.__noButton; } //外部からNoButtonにアクセス可能に

report(_member, _string) { //メンバーからの報告を受けて指示を出す
    if (_member == this.__yesButton) { //YesButtonからの報告の場合...
        if (_string == "on") {
            this.__noButton.advice("off");
            this.__textBox.advice("enable");
        }
    }
    if (_member == this.__noButton) { //NoButtonからの報告の場合...
        if (_string == "on") {
            this.__yesButton.advice("off");
            this.__textBox.advice("disabled");
        }
    }
}
}

// 実行 ==================================================================================
var _mediator = new Mediator();
_mediator.yesButton.on();
//=> "NoButtonをoffにします"
//=> "TextBoxを入力可能にします"
_mediator.NoButton.on();
//=> "YesButtonをoffにします"
//=> "TextBoxを入力不可にします"
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2016年10月17日  
更新日：2017年0X月XX日


<a name="Observer"></a>
# <b><ruby>Observer<rt>オブザーバ</rt></ruby></b>

```
// xx.js
//========================================================================================
// Subject（観察される側）関連
//========================================================================================
//↓Subject役＝（擬似）抽象クラス
class abstractSubject {
    addObserver(_observer) { throw new Error("サブクラスで実装して下さい"); }
    // 今回は removeObserver() は省略
    notify() { throw new Error("サブクラスで実装して下さい"); }
}

//↓ConcreteSubject役
class Apple extends abstractSubject {
    constructor() {
        super(); //必須（要注意）
        this.__observerList = []; //リスナーのリスト
    }
    addObserver(_observer) {
        this.__observerList.push(_observer); //リスナーの登録
    }
notify() { //全リスナーへの通知
    for (let _indexNum in this.__observerList) {
        this.__observerList[_indexNum].update(this);
    }
}
    get version() {
        return "10.0.3";
    }
}

//========================================================================================
// Observer（観察者＝リスナー）関連
//========================================================================================
//↓（擬似）インターフェース
class IObserver {
    update(_apple) { throw new Error("サブクラスで実装して下さい"); }
}

//↓ConcreteObserver役①（iPhoneクラス）
class iPhone extends IObserver {
update(_apple) {
    console.log("iPhoneは" + _apple.version + "にアップデート可能です");
}
}

//↓ConcreteObserver役②（iPadクラス）
class iPad extends IObserver {
update(_apple) {
    console.log("iPadは" + _apple.version + "にアップデート可能です");
}
}

//↓ConcreteObserver役③（iPadProクラス）
class iPadPro extends IObserver {
update(_apple) {
    console.log("iPadProは" + _apple.version + "にアップデート可能です");
}
}

//========================================================================================
// 実行
//========================================================================================
var _apple = new Apple(); //Subject（観察される側）の生成

//↓Observer（観察者）の生成
var _iPhone = new iPhone();
var _iPad = new iPad();
var _iPadPro = new iPadPro();

//↓観察される側に、観察者（リスナー）の登録
_apple.addObserver(_iPhone);
_apple.addObserver(_iPad);
_apple.addObserver(_iPadPro);

_apple.notify(); //全リスナー（Observer）への通知
//=> iPhoneは10.0.3にアップデート可能です
//=> iPadは10.0.3にアップデート可能です
//=> iPadProは10.0.3にアップデート可能です
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2016年10月18日  
更新日：2017年0X月XX日


<a name="Memento"></a>
# <b><ruby>Memento<rt>メメント</rt></ruby></b>

```
// xx.js
//========================================================================================
// 主人公 + バックアップ係
//========================================================================================
class Game {
    constructor(_point) { //コンストラクタ
this.__history = []; //履歴用リスト
        this.__point = _point;
        this.__count = undefined; //Undo、Redo用
    }
save() { //状態を保存
    var _snapShot = new SnapShot(this.__point);
    this.__history.push(_snapShot);
    this.__count = this.__history.length - 1;
    return _snapShot;
}
    history() { //履歴
        for (let i=0; i<this.__history.length; i++) {
            console.log(i + ":" + this.__history[i].point);
        }
    }
    undo() { //Undo（やり直し）
        if (this.__count > 0) {
            return this.__history[--this.__count];
        } else {
            console.log("これ以上、Undoできません");
            this.__count = 0;
            return this.__history[0];
        }
    }
    redo() { //Redo（再実行）
        if (this.__count < (this.__history.length - 1)) {
            return this.__history[++this.__count];
        } else {
            console.log("これ以上、Redoできません");
            this.__count = this.__history.length - 1;
            return this.__history[this.__count];
        }
    }
    get point() { return this.__point; } //アクセサ（getter）
    set point(_newPoint) { this.__point = _newPoint; } //アクセサ（setter）
}

//========================================================================================
// Memento役（その瞬間の状態をオブジェクト化）
//========================================================================================
class SnapShot {
    constructor(_point) {
        this.__point = _point;
    }
    get point() { return this.__point; }
}

// 実行 ==================================================================================
var _game = new Game(100); //ゲームスタート（最初のポイントは100）←①
var _snapShot = _game.save(); //最初の状態を保存
_game.point = 2000; //ゲームが進行して2000ポイントに... ←②
_snapShot = _game.save(); //この時点での状態を保存
_game.point = 8000; //更にゲームが進行して8000ポイントに... ←③
_snapShot = _game.save(); //この時点での状態を保存
_game.history(); //履歴を調べる
//=> 0:100 ←①
//=> 1:2000 ←②
//=> 2:8000 ←③
//↓Undo（やり直し）
_snapShot = _game.undo();
console.log(_snapShot.point); //=> 2000
_snapShot = _game.undo();
console.log(_snapShot.point); //=> 100
_snapShot = _game.undo(); //=> "これ以上、Undoできません"
console.log(_snapShot.point); //=> 100
//↓Redo（再実行）
_snapShot = _game.redo();
console.log(_snapShot.point); //=> 2000
_snapShot = _game.redo();
console.log(_snapShot.point); //=> 8000
_snapShot = _game.redo(); //=> "これ以上、Redoできません"
console.log(_snapShot.point); //=> 8000
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2016年10月18日  
更新日：2017年0X月XX日


<a name="State"></a>
# <b><ruby>State<rt>ステート</rt></ruby></b>

```
// xx.js
// Context（状態を管理）役 ===============================================================
class Janken {
    setState(_state) {
        this.__state = _state;
    }
    exec() {
        this.__state.execute();
    }
}

// State（状態）役 =======================================================================
class IState { //（擬似）インターフェース
    execute() { throw new Error("サブクラスで実装して下さい"); }
}

class StateA extends IState { //State（状態）役 ①
    execute() { //Janken.exec()から呼び出される
        console.log("グー、グー、パー");
    }
}

class StateB extends IState { //State（状態）役 ②
    execute() { //Janken.exec()から呼び出される
        console.log("パー、グー、チョキ");
    }
}

// 実行 ==================================================================================
var _janken = new Janken(); //Context（状態を管理）役の生成
_stateA = new StateA(); //State（状態）役 ①の生成
_stateB = new StateB(); //State（状態）役 ②の生成
_janken.setState(_stateA); //状態の設定
_janken.exec(); //=> "グー、グー、パー"
_janken.setState(_stateB); //状態の設定（変更）
_janken.exec(); //=> "パー、グー、チョキ"
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2016年10月18日  
更新日：2017年0X月XX日


<a name="Command"></a>
# <b><ruby>Command<rt>コマンド</rt></ruby></b>

```
class Inkscape { //グラフィックソフト（今回はバッチ処理は省略）
    constructor() {
        this.__canvas = new Canvas();
        this.__history = []; //履歴（命令クラスを保持）
    }
    draw(_command) {
        //↓命令を実行する度にインスタンスを生成
        var _drawCommand = new DrawCommand(this.__canvas, _command);
        _drawCommand.execute();
        this.__history.push(_drawCommand);
    }
}

class DrawCommand { //命令クラス
    constructor(_canvas, _command) {
        this.__canvas = _canvas;
        this.__command = _command;
    }
    execute() { this.__canvas.update(this.__command); }
}

class Canvas { //結果を表示する役（Receiver＝受信者の役）
    constructor() { this.__history = []; } //履歴（実際の処理を保持）
    update(_command) {
        this.__history.push(_command);
        for (let _indexNum in this.__history) {
            console.log(this.__history[_indexNum]);
        }
        console.log("---描画---");
    }
}
```

var _inkscape = new Inkscape(); //グラフィックソフト
_inkscape.draw("線を引く"); //命令の実行
_inkscape.draw("縁取る"); //命令の実行
_inkscape.draw("影をつける"); //命令の実行

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2016年10月18日  
更新日：2017年0X月XX日


<a name="Interpreter"></a>
# <b><ruby>Interpreter<rt>インタプリタ</rt></ruby></b>

```
class SWF {
    constructor(_code) { //コンストラクタ 
        this.__codeArray = _code.split(";"); //「;」区切りで配列化（≒中間コード）
        this.__count = 0; //this.getNextCode()で使用
    }
    getNextCode() { return this.__codeArray[this.__count++]; } //次の命令を調べる
    isEnd() {	return this.__count >= this.__codeArray.length; } //次の命令があるか否か
}

class AVM { //≒ ActionScript Virtual Machine
    execute(_swf) { //実行
        var _result = 0;
        while (! _swf.isEnd()) { //次の命令があれば...
            let _nextCode = _swf.getNextCode(); //次の命令を調べる
            //↓ここからはサンプルの独自処理
            let _operator = _nextCode.substr(0,1); //「+*/-=」の何れか
            if (_operator != "=") { //「=」以外の場合...
                let _num = Number(_nextCode.substr(1));
                switch (_operator) {
                    case "+": _result += _num; break;
                    case "-": _result -= _num; break;
                    case "*": _result *= _num; break;
                    case "/": _result /= _num; break;
                    default: throw new Error(_operator + "はサポートしていません");
                }
            } else { //「=」の場合...
                // 本来はここで「終端となる表現」のクラスを生成し処理しますが...
                console.log(_result);
            }}}}

var _code = "+10;*50;/2;-4;="; //①自作ミニ言語によるソースコード（文字列）を記述
//↓②中間言語コンパイラを使って、ソースコードを中間コードに変換（構文解析＝配列化）
var _swf = new SWF(_code); //≒SWFファイルに変換
//↓③インタプリタ（通訳プログラム）を使って、中間コードをもとに実行
var _avm = new AVM(); //インタプリタ（≒ActionScript Virtual Machine）の生成
_avm.execute(_swf); //≒SWFファイルをAVM上で実行 => 246
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2016年10月18日  
更新日：2017年0X月XX日
