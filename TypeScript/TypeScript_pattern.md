### <b>この項目は書きかけの項目です</b>

# <b>TypeScript デザインパターン</b>

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
    ***
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
TypeScript 2.X から、コンストラクタにアクセス修飾子 private (同じクラスからのみアクセス可）の設定が可能になった

### 例文
```
//main.ts
class Singleton { //シングルトンクラス
    private static _singleton: Singleton; //唯一のインスタンスを格納

    //コンストラクタ（private）
    private constructor() {} //外部からnewできない

    //外部から唯一のインスタンスを呼出す
    public static get instance(): Singleton {
        if (!this._singleton) {
            console.log("インスタンスを生成しました"); //DEBUG
            this._singleton = new Singleton();
        }

        return this._singleton; //唯一のインスタンス（静的変数）を返す
    }
}

//new Singleton(); //error（外からはnewによるインスタンス生成は不可）
var _singleton1: Singleton = Singleton.instance; //唯一のインスタンスを呼出す
var _singleton2: Singleton = Singleton.instance; //唯一のインスタンスを呼出す
console.log(_singleton1 == _singleton2); //true（同じインスタンス）
```

実行環境：Ubuntu 16.04 LTS、Chromium 58、TypeScript 2.3.3  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月26日


<a name="Prototype"></a>
# <b><ruby>Prototype<rt>プロトタイプ</rt></ruby></b>

```
//main.ts

//===============================
// Prototypeクラスのインターフェース
//===============================
interface IPrototype {
    clone(): Prototype; //実装するクラス名に合わせます
}

//===============
// Prototypeクラス
//===============
class Prototype implements IPrototype {
    private _firstName: string;
    private _lastName: string;
    private _address: string;

    constructor() {} //コンストラクタ

    // getter
    get firstName(): string { return this._firstName; }
    get lastName(): string { return this._lastName; }
    get address(): string { return this._address; }

    // setter
    set firstName(_newValue: string) { this._firstName = _newValue; }
    set lastName(_newValue: string) { this._lastName = _newValue; }
    set address(_newValue: string) { this._address = _newValue; }

    public clone(): Prototype {
        var _prototype: Prototype = new Prototype();
        _prototype.firstName = this._firstName;
        _prototype.lastName = this._lastName;
        _prototype.address = this._address;
        return _prototype;
    }
}

//========
// 実行
//========
// インスタンスを生成
var _prototype1: Prototype = new Prototype();
_prototype1.firstName = "Takashi";
_prototype1.lastName = "Nishimura";
_prototype1.address = "X-XX-XX XXX, Shinjuku-ku";

// コピーを作成
var _prototype2: Prototype = _prototype1.clone();
_prototype2.firstName = "Hanako"; //検証用に一部プロパティの変更をしてみます

// 検証
console.log(_prototype1.firstName); //=> "Takashi"
console.log(_prototype1.lastName); //=> "Nishimura"
console.log(_prototype1.address); //=> "X-XX-XX XXX, Shinjuku-ku"

console.log(_prototype2.firstName); //=> "Hanako"
console.log(_prototype2.lastName); //=> "Nishimura"
console.log(_prototype2.address); //=> "X-XX-XX XXX, Shinjuku-ku"
```

実行環境：Ubuntu 16.04 LTS、Chromium 58、TypeScript 2.3.3  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月30日


<a name="Builder"></a>
# <b><ruby>Builder<rt>ビルダー</rt></ruby></b>

```
//main.ts

//==============
// Directorクラス
//==============
class Director {
    private _builder: IBuilder;
    constructor(arg: IBuilder) { //コンストラクタ
        this._builder = arg;
    }
    //同じ手順
    public construct(): void { //≠コンストラクタ
        this._builder.makeHeader();
        this._builder.makeContent();
        this._builder.makeFooter();
    }
}

//=================================
// BuilderXXXクラスのインターフェース
//=================================
interface IBuilder {
    makeHeader(): void;
    makeContent(): void;
    makeFooter(): void;
}

//==================
// BuilderXXXクラス群
//==================
//Builder009クラス
class Builder009 implements IBuilder {
    constructor() {} //コンストラクタ
    public makeHeader(): void {
        //ヘッダー用素材の呼び出し
        var _header: Header051 = new Header051();
        _header.exec();
    }
    public makeContent(): void {
        //コンテンツ用素材の呼び出し
        var _content: Content194 = new Content194();
        _content.exec();
    }
    public makeFooter(): void {
        //フッター用素材の呼び出し
        var _footer: Footer004 = new Footer004();
        _footer.exec();
    }
}

//Builder108クラス
class Builder108 implements IBuilder {
    constructor() {} //コンストラクタ
    public makeHeader(): void {
        //ヘッダー用素材の呼び出し
        var _header: Header040 = new Header040();
        _header.exec();
    }
    public makeContent(): void {
        //コンテンツ用素材の呼び出し
        var _content: Content023 = new Content023();
        _content.exec();
    }
    public makeFooter(): void {
        //フッター用素材の呼び出し
        var _footer: Footer011 = new Footer011();
        _footer.exec();
    }
}

//=================
// HeaderXXXクラス群
//=================
//Header040クラス
class Header040 {
    constructor() {} //コンストラクタ
    public exec(): void {
        console.log("HAPPY NEW YEAR!"); //ヘッダー用素材
    }
}

//Header051クラス
class Header051 {
    constructor() {} //コンストラクタ
    public exec(): void {
        console.log("あけましておめでとうございます"); //ヘッダー用素材
    }
}

//==================
// ContentXXXクラス群
//==================
//Content023クラス
class Content023 {
    constructor() {} //コンストラクタ
    public exec(): void {
        console.log("（タイプ023のイラスト）"); //コンテンツ用素材
    }
}

//Content194クラス
class Content194 {
    constructor() {} //コンストラクタ
    public exec(): void {
        console.log("（タイプ194のイラスト）"); //コンテンツ用素材
    }
}

//=================
// FooterXXXクラス群
//=================
//Footer004クラス
class Footer004 {
    constructor() {} //コンストラクタ
    public exec(): void {
        console.log("にしむらはなこ"); //フッター用素材
    }
}

//Footer011クラス
class Footer011 {
    constructor() {} //コンストラクタ
    public exec(): void {
        console.log("西村一郎"); //フッター用素材
    }
}

//========
// 実行
//========
//クライアントがタイプ「Builder009」の年賀状を「Director」に依頼
var _director: Director = new Director(new Builder009());
_director.construct(); //≠コンストラクタ
/*
あけましておめでとうございます
（タイプ194のイラスト）
にしむらはなこ
*/

//クライアントがタイプ「Builder108」の年賀状を「Director」に依頼
_director = new Director(new Builder108());
_director.construct(); //≠コンストラクタ
/*
HAPPY NEW YEAR!
（タイプ023のイラスト）
西村一郎
*/
```

実行環境：Ubuntu 16.04 LTS、Chromium 58、TypeScript 2.3.3  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月30日


<a name="FactoryMethod"></a>
# <b><ruby>Factory Method<rt>ファクトリー メソッド</rt></ruby></b>

```
//main.ts

//======================
// Abstract（抽象）クラス
//======================
class Abstract {
    constructor() {} //コンストラクタ

    public templateMethod(arg: string): void {//本来はfinalでオーバーライド禁止にしたい
        //サブクラスでオーバーライドして具体的処理を行う
        var _factoryMethod = this.factoryMethod(arg); //ここでnewしない
        _factoryMethod.exec();
        this.order1(); //共通の処理
        this.order2(); //サブクラスでオーバーライドして具体的処理を行う
    }

    //サブクラスでオーバーライドして具体的処理を行う
    public factoryMethod(arg: string): any { //本来はprotectedを使いたい
        console.log("Error 01: サブクラスでオーバーライドして定義して下さい");
        throw new Error(); //処理を停止させる
    }

    private order1(): void { //共通の処理
        console.log("〒XXX-XXXX 新宿区XXX町X-X-X");
    }

    //サブクラスでオーバーライドして具体的処理を行う
    public order2(): void {
        console.log("Error 02: サブクラスでオーバーライドして定義して下さい");
        throw new Error(); //処理を停止させる
    }
}

//=============================
// Cardクラス（抽象クラスを継承）
//=============================
class Card extends Abstract {
    constructor() { //コンストラクタ
        super();
    }

    //インスタンスを生成する工場（オーバーライドして実際にインスタンスを生成）
    public factoryMethod(arg: string): any {
        if (arg == "newYear") {
            return new NewYear_Message();
        } else if (arg == "summer") {
            return new Summer_Message();
        }
    }

    public order2(): void { //オーバーライド
        console.log("西村一郎");
    }
}

//==================================
// CardHanakoクラス（抽象クラスを継承）
//==================================
class CardHanako extends Abstract {
    constructor() { //コンストラクタ
        super();
    }

    //インスタンスを生成する工場
    public factoryMethod(arg: string): any { //オーバーライド
        if (arg == "newYear") {
            return new NewYear_Message();
        } else if (arg == "summer") {
            return new Summer_Message();
        }
    }

    public order2(): void { //オーバーライド
        console.log("西村花子");
    }
}

//=====================
// NewYear_Messageクラス
//=====================
class NewYear_Message {
    constructor() {} //コンストラクタ

    public exec(): void {
        console.log("明けましておめでとうございます");
        console.log("（正月用イラスト）");
    }
}

//====================
// Summer_Messageクラス
//====================
class Summer_Message {
    constructor() {} //コンストラクタ

    public exec(): void {
        console.log("暑中お見舞い申し上げます");
        console.log("（夏用イラスト）");
    }
}

//========
// 実行
//========
// 年賀状（一郎用）
var _cardIchiro: Card = new Card();
_cardIchiro.templateMethod("newYear");
/*
明けましておめでとうございます
（正月用イラスト）
〒XXX-XXXX 新宿区XXX町X-X-X
西村一郎
*/

// 暑中見舞い（一郎用）
_cardIchiro = new Card();
_cardIchiro.templateMethod("summer");
/*
暑中お見舞い申し上げます
（夏用イラスト）
〒XXX-XXXX 新宿区XXX町X-X-X
西村一郎
*/

// 年賀状（花子用）
var _cardHanako: CardHanako = new CardHanako();
_cardHanako.templateMethod("newYear");
/*
明けましておめでとうございます
（正月用イラスト）
〒XXX-XXXX 新宿区XXX町X-X-X
西村花子
*/

// 暑中見舞い（花子用）
_cardHanako = new CardHanako();
_cardHanako.templateMethod("summer");
/*
暑中お見舞い申し上げます
（夏用イラスト）
〒XXX-XXXX 新宿区XXX町X-X-X
西村花子
*/
```

実行環境：Ubuntu 16.04 LTS、Chromium 58、TypeScript 2.3.3  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月30日


<a name="AbstractFactory"></a>
# <b><ruby>Abstract Factory<rt>アブストラクト ファクトリー</rt></ruby></b>

```
//main.ts

//===================================
// AbstractFactoryクラス（抽象的な工場）
//===================================
class AbstractFactory {
    constructor() {} //コンストラクタ
    public static createFactory(arg: string): AbstractFactory {
        switch (arg) {
            case "ICHIRO":
                return new ICHIRO(); //具体的な「一郎工場」を生成
            case "HANAKO":
                return new HANAKO(); //具体的な「花子工場」を生成
        }
    }
    //抽象的な機能サブクラスでオーバーライドして、実際の機能を実装します
    public createNewYear(): void {
        console.log("Error 01: サブクラスでオーバーライドして定義して下さい");
        throw new Error(); //処理を停止させる
    }
    //抽象的な機能サブクラスでオーバーライドして、実際の機能を実装します
    public createSummer(): void {
        console.log("Error 02: サブクラスでオーバーライドして定義して下さい");
        throw new Error(); //処理を停止させる
    }
}

//===================================
// ICHIROクラス（実際の工場：一郎工場）
//===================================
class ICHIRO extends AbstractFactory {
    constructor() { //コンストラクタ
        super();
    }

    public createNewYear(): void {  //オーバーライド（overrideキーワードはない）
        console.log("HAPPY NEW YEAR!");
        console.log("（正月用イラスト）");
        console.log("西村一郎");
    }

    public createSummer(): void {  //オーバーライド（overrideキーワードはない）
        console.log("暑中お見舞い申し上げます");
        console.log("（夏用イラスト）");
        console.log("西村一郎");
    }
}

//===================================
// HANAKOクラス（実際の工場：花子工場）
//===================================
class HANAKO extends AbstractFactory {
    constructor() { //コンストラクタ
        super();
    }

    public createNewYear(): void { //オーバーライド（overrideキーワードはない）
        console.log("あけましておめでとうございます");
        console.log("（正月用イラスト）");
        console.log("西村花子");
    }

    public createSummer(): void { //オーバーライド（overrideキーワードはない）
        console.log("しょちゅうおみまいもうしあげます");
        console.log("（夏用イラスト）");
        console.log("西村花子");
    }
}

//========
// 実行
//========
//一郎
var _ichiro: AbstractFactory = AbstractFactory.createFactory("ICHIRO");
_ichiro.createNewYear();
/*
HAPPY NEW YEAR!
（正月用イラスト）
西村一郎
*/
_ichiro.createSummer();
/*
暑中お見舞い申し上げます
（夏用イラスト）
西村一郎
*/

//花子
var _hanako: AbstractFactory = AbstractFactory.createFactory("HANAKO");
_hanako.createNewYear();
/*
あけましておめでとうございます
（正月用イラスト）
西村花子
*/
_hanako.createSummer();
/*
しょちゅうおみまいもうしあげます
（夏用イラスト）
西村花子
*/
```

実行環境：Ubuntu 16.04 LTS、Chromium 58、TypeScript 2.3.3  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月30日


<a name="Adapter（継承）"></a>
# <b><ruby>Adapter<rt>アダプター</rt></ruby>（継承）</b>

```
//main.ts

//=============================================
// Moneyboxクラス＝実際の「貯金箱」スーパークラス
//=============================================
class Moneybox {
    public _yen: number; //この変数に貯金されます

    constructor(arg: number) { //コンストラクタ
        this._yen = arg;
    }

    public add(arg: number): void {
        this._yen += arg;
    }
    
    get moneyYen(): number {
        return this._yen;
    }
}

//=====================================
// MoneyboxAdapterクラス＝円をドルに変換
//=====================================
//スーパークラスを継承＆インターフェースの実装
class MoneyboxAdapter extends Moneybox { 
    private _rate: number;

    constructor(_firstYen: number, _rate: number) { //コンストラクタ
        super(_firstYen); //スーパークラスのコンストラクタを明示的に呼び出す
        this._rate = _rate;
    }

    public addYen(arg: number): void {
        this.add(arg); //スーパークラスから継承
    }

    get moneyDollar(): number {
        return this._yen / this._rate; // _yenはスーパークラスから継承
    }
}

//========
// 実行
//========
var _moneyboxAdapter = new MoneyboxAdapter(100, 110.975474); //最初の貯金, 為替レート
_moneyboxAdapter.addYen(1000);
console.log(_moneyboxAdapter.moneyDollar); //=> 9.91210003752721（ドル）
```

実行環境：Ubuntu 16.04 LTS、Chromium 58、TypeScript 2.3.3  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月30日


<a name="Adapter（委譲）"></a>
# <b><ruby>Adapter<rt>アダプター</rt></ruby>（委譲）</b>

```
//main.ts

//=============================================
// Moneyboxクラス＝実際の「貯金箱」スーパークラス
//=============================================
class Moneybox {
    public _yen: number; //この変数に貯金されます

    constructor(arg: number) { //コンストラクタ
        this._yen = arg;
    }

    public add(arg: number): void {
        this._yen += arg;
    }
    
    get moneyYen(): number {
        return this._yen;
    }
}

//=====================================
// MoneyboxAdapterクラス＝円をドルに変換
//=====================================
class MoneyboxAdapter {
    private _moneybox: Moneybox; //ポイント
    private _rate: number;

    constructor(_firstYen: number, _rate: number) { // コンストラクタ
        this._moneybox = new Moneybox(_firstYen); //ここがポイント
        this._rate = _rate;
    }

    public addYen(arg: number): void {
        this._moneybox.add(arg);
    }
    
    get moneyDollar(): number {
        return this._moneybox._yen / this._rate;
    }
}

//========
// 実行
//========
var _moneyboxAdapter = new MoneyboxAdapter(100, 110.975474); //最初の貯金, 為替レート
_moneyboxAdapter.addYen(1000);
console.log(_moneyboxAdapter.moneyDollar); //=> 9.91210003752721（ドル）
```

実行環境：Ubuntu 16.04 LTS、Chromium 58、TypeScript 2.3.3  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月30日


<a name="Bridge"></a>
# <b><ruby>Bridge<rt>ブリッジ</rt></ruby></b>

```
//main.ts

//===================
// SuperMobileクラス
//===================
class SuperMobile {
    private _os: IOS; //橋渡し役
    constructor(arg: IOS) { //コンストラクタ
        this._os = arg;
    } 
    public getVersion(): string { //getアクセサメソッドも使えるはずですが…（要検証）
        return this._os.getVersion();
    }
}

//===================
// Tabletクラス
//===================
class Tablet extends SuperMobile {
    constructor(arg: IOS) { //コンストラクタ
        super(arg);
    }
    //タブレット特有の機能
    public bigScreen(): void {
        console.log("大きな画面で見る");
    }
}

//===================
// SmartPhoneクラス
//===================
class SmartPhone extends SuperMobile {
    constructor(arg: IOS) { //コンストラクタ
        super(arg);
    }
    //スマートフォン特有の機能
    public phone(): void {
        console.log("電話をかける");
    }
}

//======================
// 各OSのインターフェース
//======================
interface IOS { //iOSではなく、OSのインターフェースの意味
    getVersion(): string;
}

//===================
// Androidクラス
//===================
class Android implements IOS {
    constructor() {} //コンストラクタ
    public getVersion(): string {
        return "Android 7.1.2";
    }
}

//===================
// iOSクラス
//===================
class iOS implements IOS { //本来は大文字から開始すべきですが...
    constructor() {} //コンストラクタ
    public getVersion(): string {
        return "iOS 10.3.2";
    }
}

//========
// 実行
//========
// Androidタブレット
var _tablet1: Tablet = new Tablet(new Android());
console.log(_tablet1.getVersion()); //Android 7.1.2（プロパティの取得）
_tablet1.bigScreen(); //大きな画面で見る（メソッドの実行）

// iPad
var _tablet2: Tablet = new Tablet(new iOS());
console.log(_tablet2.getVersion()); //iOS 10.3.2（プロパティの取得）
_tablet2.bigScreen(); //大きな画面で見る（メソッドの実行）

// Androidスマートフォン
var _smartPhone1: SmartPhone = new SmartPhone(new Android());
console.log(_smartPhone1.getVersion()); //Android 7.1.2（プロパティの取得）
_smartPhone1.phone(); //電話をかける（メソッドの実行）

// iPhone
var _smartPhone2: SmartPhone = new SmartPhone(new iOS());
console.log(_smartPhone2.getVersion()); //iOS 10.3.2（プロパティの取得）
_smartPhone2.phone(); //電話をかける（メソッドの実行）
```

実行環境：Ubuntu 16.04 LTS、Chromium 58、TypeScript 2.3.3  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月30日


<a name="Composite"></a>
# <b><ruby>Composite<rt>コンポジット</rt></ruby></b>

```
//main.ts

//================================================
// Samenessクラス＝"同一視"するための役（Component）
//================================================
class Sameness {
    public _name: string; //サブクラスで使います
    public _parent: Directory; //サブクラスで使います

    constructor() {} //コンストラクタ

    get name(): string {
    //public name: string {
        return this._name;
    }
    
    public getChild(): any { //getアクセサメソッドも使えるはずですが...
        console.log("Error: 入れ子はできません"); //FileNameクラス対応
        throw new Error(); //処理停止
    }

    public add(arg: Sameness): void {
        console.log("Error: 追加できません"); //FileNameクラス対応
        throw new Error(); //処理停止
    }

    public remove(arg: Sameness): void {
        console.log("Error: 削除できません");
        throw new Error(); //処理停止
    }

    public list(): void { //Linuxのlsコマンド風
        console.log("Error: サブクラスでオーバーライドして下さい");
        throw new Error(); //処理停止
    }

    set parent(_newValue: Directory) {
    //public setParent(directory: Directory): void {
        this._parent = _newValue;
    }
    
    get parent(): Directory {
        return this._parent;
    }
}

//=======================================
// Directoryクラス＝Composit（複合体）の役
//=======================================
class Directory extends Sameness {
    private _child: Sameness[] = new Array();

    constructor(name: string) { //コンストラクタ
        super(); //必須
        this._name = name;
    }

    public add(arg: Sameness): void { //オーバーライド（引数はDirectory or FileName）
        this._child.push(arg);
        arg.parent = this;
    }

    public remove(arg: Sameness): void { //オーバーライド（引数はDirectory or FileName）
        var _index: number = this._child.indexOf(arg); //検索（なければ-1、あれば位置を返す）
        if (_index != -1) {
            this._child.splice(_index,1);
        }
    }

    public getChild(): any { //オーバーライド
        return this._child;
    }

    public list(): void { //オーバーライド
        var _theArray: Sameness[] = this._child;
        for (var _propName in _theArray) {
             var _result: string = this.name + "/" + _theArray[_propName].name;
             if (_theArray[_propName] instanceof Directory) {
                _result = _result + "(Directory)";
             } else {
                _result = _result + "(File)";
             }
             console.log(_result);
        }
    }
}

//=================
// FileNameクラス
//=================
class FileName extends Sameness { //Fileだとエラーが出るみたいなので...
    constructor(name: string) { //コンストラクタ
        super(); //必須！
        this._name = name;
    }
    //オーバーライド
    public list(): void { //Linuxのコマンド風
        console.log(this.parent.name + "/" + this.name + "(File)");
    }
}

//========
// 実行
//========
// ディレクトリの作成
var _root: Sameness = new Directory("root");
var _adobe: Sameness = new Directory("Adobe");
var _macromedia: Sameness = new Directory("Macromedia");
var _flash: Sameness = new Directory("Flash");

// ファイルの作成
var _illustrator: Sameness = new FileName("Illustrator");
var _photoshop: Sameness = new FileName("Photoshop");
var _dreamweaver: Sameness = new FileName("Dreamweaver");
var _flashProfessional: Sameness = new FileName("Flash Professional");
var _flashBuilder: Sameness = new FileName("Flash Builder");

// 関連付け
_root.add(_adobe); //Directoryの追加
_root.add(_macromedia); //Directoryの追加
_adobe.add(_illustrator); //FileNameの追加
_adobe.add(_photoshop); //FileNameの追加
_macromedia.add(_flash); //Directoryの追加
_macromedia.add(_dreamweaver); //FileNameの追加
_flash.add(_flashProfessional); //FileNameの追加
_flash.add(_flashBuilder); //FileNameの追加

// 検証
//DirectoryやFileNameの「名前」を調べる
console.log(_flashProfessional.name); //=> Flash Professional

//Directoryの中のDirectoryとFileNameを調べる
console.log(_macromedia.getChild()); //=> [Directory, FileName] => [Directory, FileName]

//Directoryの中のDirectoryやFileNameを「削除」する
_macromedia.remove(_dreamweaver);
console.log(String(_macromedia.getChild())); //=> [object Object]

//指定した階層のDirectory（ディレクトリ内のDirectory & FileName）とFileNameを調べる
_macromedia.list(); //=> Macromedia/Flash(Directory)
_dreamweaver.list(); //=> Macromedia/Dreamweaver(File)
```

実行環境：Ubuntu 16.04 LTS、Chromium 58、TypeScript 2.3.3  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月30日


<a name="Decorator"></a>
# <b><ruby>Decorator<rt>デコレータ</rt></ruby></b>

```
//main.ts

//====================================
// Displayクラス＝共通のインターフェース
//====================================
class Display {
    public _content:string;
    constructor() {} //コンストラクタ
    public show():string {
        return this._content;
    }
}

//==============
// Originalクラス
//==============
class Original extends Display {
    constructor(arg:string) { //コンストラクタ
        super(); //必須
        this._content = arg;
    }
}

//================
// Decorator1クラス
//================
class Decorator1 extends Display {
    constructor(arg:Display) { //コンストラクタ
        super(); //必須！
        this._content = "-" + arg.show() + "-";
    }  
}

//================
// Decorator2クラス
//================
class Decorator2 extends Display {
    constructor(arg:Display) { //コンストラクタ
        super(); //必須！
        this._content = "(" + arg.show() + ")"; // "<" ">" はタグと認識されてしまう
    }  
}

//========
// 実行
//========
var _original:Display = new Original("TAKASHI");
console.log(_original.show()); // TAKASHI

var _decorator1:Display = new Decorator1(_original);
console.log(_decorator1.show()); // -TAKASHI-

var _decorator2:Display = new Decorator2(_original);
console.log(_decorator2.show()); // (TAKASHI)

var _special:Display = new Decorator2(
                            new Decorator1(
                                new Decorator1(
                                    new Decorator1(
                                        new Original("TAKASHI")))));
console.log(_special.show()); // (---TAKASHI---)
```

実行環境：Ubuntu 16.04 LTS、Chromium 58、TypeScript 2.3.3  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月31日


<a name="Facade"></a>
# <b><ruby>Facade<rt>ファサード</rt></ruby></b>

### 概要

Decorator パターンの場合...
```
var _special:Display = new Decorator2(
                            new Decorator1(
                                new Decorator1(
                                    new Decorator1(
                                        new Original("TAKASHI")))));
console.log(_special.show()); // (---TAKASHI---)
```
...としていたものを次の１行で済ますことが可能になります。
```
console.log(DecoratorFacade.exec("TAKASHI", 3, 1);
```

### 例文
```
//main.ts

//=======================================
// Displayクラス（Decoratorパターンと同じ）
//=======================================
class Display {
    public _content: string;
    constructor() {} //コンストラクタ
    public show(): string {
        return this._content;
    }
}

//========================================
// Originalクラス（Decoratorパターンと同じ）
//========================================
class Original extends Display {
    constructor(arg: string) { //コンストラクタ
        super(); //必須
        this._content = arg;
    }
}

//==========================================
// Decorator1クラス（Decoratorパターンと同じ）
//==========================================
class Decorator1 extends Display {
    constructor(arg: Display) { //コンストラクタ
        super(); //必須！
        this._content = "-" + arg.show() + "-";
    }  
}

//==========================================
// Decorator2クラス（Decoratorパターンと同じ）
//==========================================
class Decorator2 extends Display {
    constructor(arg: Display) { //コンストラクタ
        super(); //必須！
        this._content = "(" + arg.show() + ")"; // "<" ">" はタグと認識されてしまう
    }  
}

//===============================================================
// DecoratorFacadeクラス＝窓口（Facade）役 <= Decoratorパターンに追加 
//===============================================================
class DecoratorFacade {
    private static _decoratorFacade:  DecoratorFacade; //唯一のインスタンスを格納

    //コンストラクタ（private）
    private constructor() {} //外部からnewできない

    //外部から唯一のインスタンスを呼出す
    public static get instance():  DecoratorFacade {
        if (!this._decoratorFacade) {
            this._decoratorFacade = new DecoratorFacade();
        }

        return this._decoratorFacade; //唯一のインスタンス（静的変数）を返す
    }

    //arg1: オリジナルの文字
    //arg2: Decorator1クラスを施す回数
    //arg3: Decorator2クラスを施す回数
    public static exec(arg1: string, arg2: number=0, arg3: number=0): string {
        var _decoratorFacade:  DecoratorFacade = DecoratorFacade.instance; //Singletonパターン用
        var _result: Display = new Original(arg1);
        for (var _i: number=0; _i<arg2; _i++) {
            _result = new Decorator1(_result);
        }
        for (var _j: number=0; _j<arg3; _j++) {
            _result = new Decorator2(_result);
        }           
        return _result.show();
    }
}

//=================================
// 実行（Decoratorパターンとは異なる）
//=================================
console.log(DecoratorFacade.exec("TAKASHI", 5, 2)); // ((-----TAKASHI-----))
console.log(DecoratorFacade.exec("TAKASHI")); // TAKASHI
console.log(DecoratorFacade.exec("TAKASHI", 0, 1)); // (TAKASHI)
console.log(DecoratorFacade.exec("TAKASHI", 1, 0)); // -TAKASHI-
```

実行環境：Ubuntu 16.04 LTS、Chromium 58、TypeScript 2.3.3  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月31日


<a name="Flyweight"></a>
# <b><ruby>Flyweight<rt>フライウエイト</rt></ruby></b>

```
//main.ts

//============================================
// FlyweightFactoryクラス＝インスタンスの管理人
//============================================
class FlyweightFactory { //Singletonパターン
    private static _flyweightFactory:  FlyweightFactory; //唯一のインスタンスを格納

    //_poolに管理されるFlyweightオブジェクトはガベージコレクションされません
    // 明示的にdeleteする必要有り
    private _pool: Object = new Object();

    //コンストラクタ（private）
    private constructor() {} //外部からnewできない

    //外部から唯一のインスタンスを呼出す
    public static get instance():  FlyweightFactory {
        if (!this._flyweightFactory) {
            console.log("インスタンスを生成しました"); //DEBUG
            this._flyweightFactory = new FlyweightFactory();
        }

        return this._flyweightFactory; //唯一のインスタンス（静的変数）を返す
    }

    //既存ならそのインスタンスを使い、無い場合は新規作成
    public getFlyweight(arg: string): Flyweight {
        //プールにインスタンスが無ければ、Flyweightインスタンス生成しプール
        if (this._pool[arg] == undefined) {
            this._pool[arg] = new Flyweight(arg);
        } else {
            console.log(arg + "は既存です");
        }
        return this._pool[arg];
    }
}

//============================================
// Flyweightクラス＝無駄に生成したくないアイテム
//============================================
class Flyweight {
    private _text: string = ""; //ロードしたテキストを格納
    constructor(arg: string) {
        var _request: XMLHttpRequest =  new XMLHttpRequest();
        _request.onreadystatechange = () => { //イベントハンドラ（アロー関数方式）
            if (_request.readyState == 4) { //リクエストが完了した場合
                if (_request.status == 200) { //成功した場合（ローカル実行時は不可）
                    this._text = _request.responseText;
                }
            }
        }
        _request.open("GET", arg + ".txt"); //読み込む外部ファイルの指定
        _request.send(null);
    }
    public getText(): string {
        return this._text;
    }
}

//======
// 実行
//======
var _flyweightFactory: FlyweightFactory = FlyweightFactory.instance;
var _a: Flyweight = _flyweightFactory.getFlyweight("a");
var _ka: Flyweight = _flyweightFactory.getFlyweight("ka");
//_a = _flyweightFactory.getFlyweight("a"); // aは既存です

//console.log(this._a.getText()); //このタイミングでは外部テキストデータがロードされていない（注意）

setTimeout(()=>{
    console.log(_a.getText()); //=> あいうえお
    console.log(_ka.getText()); //=> かきくけこ
}, 500); //0.5秒後に値を取得
```

実行環境：Ubuntu 16.04 LTS、Chromium 58、TypeScript 2.3.3  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月31日


<a name="Proxy"></a>
# <b><ruby>Proxy<rt>プロキシー</rt></ruby></b>

```
//main.ts

//================
// 代理人（Proxy役）
//================
class Loader {
    private _url: string;

    constructor(_url) {
        this._url = _url;
    }

    public load(): void {
        //↓実際の本人登場（代理に実際の本人を知っている）
        var _content = new Content(this._url);
        _content.load();
    }
}

//===========================
// 実際の本人（Real Subject役）
//===========================
class Content {
    private _url: string;

    constructor(_url) {
        this._url = _url;
    }

    //重い処理をここで行う（ポイント）
    public load() {
        // 今回のサンプルの中身はあまり重要ではない...
        console.log("重い処理を実行中");
    }
}

//================
// 実行（Cliant役）
//================
var _loader: Loader = new Loader("http://sample.mp4");
_loader.load(); //=> "重い処理を実行中"
```

実行環境：Ubuntu 16.04 LTS、Chromium 58、TypeScript 2.3.3  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月31日


<a name="Iterator"></a>
# <b><ruby>Iterator<rt>イテレータ</rt></ruby></b>

```
//main.ts

//=================
// Carクラス
//=================
class Car {
    private _name: string;
    private _num: string;

    constructor(name: string, num: string) { //コンストラクタ関数
        this._name = name;
        this._num = num;
    }

    get name(): string {
        return this._name;
    }

    get num(): string {
        return this._num;
    }
}

//===========================
// CarParkクラスのインターフェース
//===========================
interface ICarPark {
    add(theElement: Car): void;
    getElementAt(index: number): Car;
    getLength(): number;
    createIterator(): Iterator;
}

//============================
// CarParkクラス
//============================
class CarPark implements ICarPark {
    private _list: Car[] = [];
    constructor() {}
    public add(theElement: Car): void {
        this._list.push(theElement);
    }
    public getElementAt(index: number): Car {
        return this._list[index];
    }
    public getLength(): number {
        return this._list.length;
    }
    public createIterator(): Iterator {
        return new Iterator(this); //イテレータを生成
    }
}

//===========================
// Iteratorクラスのインターフェース
//===========================
interface IIterator {
    hasNext(): boolean;
    next(): Car;
}

//=================
// Iteratorクラス
//=================
class Iterator implements IIterator {
    private _obj: CarPark;
    private _count: number = 0;
    constructor(obj: CarPark) {
        this._obj = obj;
    }
    public hasNext(): boolean {
        return this._obj.getLength() > this._count;
    }
    public next(): Car {
        return this._obj.getElementAt(this._count++); //次の車を返す
    }
}

//======
// 実行
//======
var _carPark = new CarPark();
_carPark.add(new Car("NISSAN GT-R", "品川300 し35-00"));
_carPark.add(new Car("BMW mini", "品川300 の32-32"));
_carPark.add(new Car("TOYOTA 2000GT", "練馬501 に20-00"));
var _carParkIterator: Iterator = _carPark.createIterator(); //イテレータを生成
while(_carParkIterator.hasNext()) {
    var _nextCar: Car = _carParkIterator.next();
    console.log(_nextCar.name + ", " + _nextCar.num);
}
```

実行環境：Ubuntu 16.04 LTS、Chromium 58、TypeScript 2.3.3  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月31日


<a name="TemplateMethod"></a>
# <b><ruby>Template Method<rt>テンプレート メソッド</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04 LTS、Chromium 58、TypeScript 2.3.3  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月XX日


<a name="Strategy"></a>
# <b><ruby>Strategy<rt>ストラテジー</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04 LTS、Chromium 58、TypeScript 2.3.3  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月XX日


<a name="Visitor"></a>
# <b><ruby>Visitor<rt>ビジター</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04 LTS、Chromium 58、TypeScript 2.3.3  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月XX日


<a name="ChainofResponsibility"></a>
# <b><ruby>Chain of Responsibility<rt>チェーン オブ レスポンシビリティ</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04 LTS、Chromium 58、TypeScript 2.3.3  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月XX日


<a name="Mediator"></a>
# <b><ruby>Mediator<rt>メディエイター</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04 LTS、Chromium 58、TypeScript 2.3.3  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月XX日


<a name="Observer"></a>
# <b><ruby>Observer<rt>オブザーバ</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04 LTS、Chromium 58、TypeScript 2.3.3  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月XX日


<a name="Memento"></a>
# <b><ruby>Memento<rt>メメント</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04 LTS、Chromium 58、TypeScript 2.3.3  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月XX日


<a name="State"></a>
# <b><ruby>State<rt>ステート</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04 LTS、Chromium 58、TypeScript 2.3.3  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月XX日


<a name="Command"></a>
# <b><ruby>Command<rt>コマンド</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04 LTS、Chromium 58、TypeScript 2.3.3  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月XX日


<a name="Interpreter"></a>
# <b><ruby>Interpreter<rt>インタプリタ</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04 LTS、Chromium 58、TypeScript 2.3.3  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月XX日