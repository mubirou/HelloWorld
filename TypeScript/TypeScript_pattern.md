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
    * [<ruby>Template Method<rt>テンプレート メソッド</rt></ruby>](#TemplateMethod) : 具体的な処理をサブクラスにまかせる
    * [<ruby>Strategy<rt>ストラテジー</rt></ruby>](#Strategy) : アルゴリズムをごっそり切り替える
    * [<ruby>Visitor<rt>ビジター</rt></ruby>](#Visitor) : 構造を渡り歩きながら仕事をする
    * [<ruby>Chain of Responsibility<rt>チェーン オブ レスポンシビリティ</rt></ruby>](#ChainofResponsibility) : 責任のたらいまわし
    * [<ruby>Mediator<rt>メディエイター</rt></ruby>](#Mediator) : 相手は相談役１人だけ
    * [<ruby>Observer<rt>オブザーバ</rt></ruby>](#Observer) : 状態の変化を通知する
    * [<ruby>Memento<rt>メメント</rt></ruby>](#Memento) : 状態を保存する
    * [<ruby>State<rt>ステート</rt></ruby>](#State) : 状態をクラスとして表現
    ***
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

```
//main.ts

//======================
// Abstract（抽象）クラス
//======================
class AbstractClass {
    constructor() {} //本来はインスタンスの生成はできないようにしますが...

    public templateMethod() { //本来はfinalでオーバライド禁止にしたい...
        this.order1(); //共通の処理
        if (this.isAdult()) { //フックメソッド
            this.order2(); //条件により実行
        }
        this.order3(); //サブクラスでオーバーライドして具体的処理を行う
    }

    private order1(): void { //共通の処理
        console.log("HAPPY NEW YEAR!");
    }

    //フックメソッド実際はサブクラスでオーバーライドして定義（オプション）
    public isAdult(): boolean { //本来はprotecedを使えるといいですが...
        return true; //今回は初期値を設定
    }

    private order2(): void { //条件により実行
        console.log("本年も宜しくお願い致します");
    }

    //必ずサブクラスでオーバーライドして定義させる
    public order3(): void { //本来はprotecedを使いたい...
        console.log("Error: サブクラスでオーバーライドして定義して下さい");
        throw new Error(); //処理を停止させる（要調査）
    }
}

//=================================
// サブクラス（１）：抽象クラスを継承
//=================================
class NewYearCard_Ichiro extends AbstractClass { //スーパークラス（抽象クラス）を継承
    public NewYearCard_Ichiro() { } //コンストラクタ

    //フックメソッドの実際の定義（オプション）
    public isAdult(): boolean { //オーバーライドして記述
        return false;
    }

    //オーバーライドして具体的処理を記述（必須）
    public order3(): void { 
        console.log("テニスがんばろうね！");
    }
}

//=================================
// サブクラス（２）：抽象クラスを継承
//=================================
class NewYearCard_Hanako extends AbstractClass { //スーパークラスを継承
    public NewYearCard_Hanako() { } //コンストラクタ
    
    //オーバーライドして具体的処理を記述（必須）
    public order3(): void { //本来はprotecedを使いたい...
        console.log("今度みんなで集まろう！");
    }
}

//======
// 実行
//======
var _newYearCard_Toru: NewYearCard_Ichiro = new NewYearCard_Ichiro();
_newYearCard_Toru.templateMethod();
/*
HAPPY NEW YEAR!
テニスがんばろうね！
*/

var _newYearCard_Tomoko: NewYearCard_Hanako = new NewYearCard_Hanako();
_newYearCard_Tomoko.templateMethod();
/*
HAPPY NEW YEAR!
本年も宜しくお願い致します
今度みんなで集まろう！
*/
```

実行環境：Ubuntu 16.04 LTS、Chromium 58、TypeScript 2.3.3  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月31日


<a name="Strategy"></a>
# <b><ruby>Strategy<rt>ストラテジー</rt></ruby></b>

```
//main.ts

//=========================================
// Jankenクラス（Context：コンテキスト＝文脈役）
//=========================================
class Janken {
    private _strategy;
    constructor(arg: IStrategy) { //コンストラクタ
        this._strategy = arg;
    }
    public exec(): void {
        this._strategy.execute();
    }
}

//=================================
// StrategyXXクラスのインターフェース
//=================================
interface IStrategy {
    execute(): void;
}


//==============================
//StrategyAクラス（具体的な作戦Ａ）
//==============================
class StrategyA implements IStrategy {
    constructor() {} //コンストラクタ
    public execute(): void {
        document.write("グー、グー、パー");
    }
}

//==============================
//StrategyBクラス（具体的な作戦Ｂ）
//==============================
class StrategyB implements IStrategy {
    constructor() {} //コンストラクタ
    public execute(): void {
        document.write("パー、グー、チョキ");
    }
}

//======
// 実行
//======
var _partner: string = "HANAKO"; // or "ICHIRO"
var _janken: Janken;

//対戦相手によって作戦を変える
if (_partner == "HANAKO") {
    _janken = new Janken(new StrategyA());
} else if (_partner == "ICHIRO") {
    _janken = new Janken(new StrategyB());
}

//じゃんけんの実行
_janken.exec(); //グー、グー、パー 
```

実行環境：Ubuntu 16.04 LTS、Chromium 58、TypeScript 2.3.3  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月31日


<a name="Visitor"></a>
# <b><ruby>Visitor<rt>ビジター</rt></ruby></b>

```
//main.ts

//===================================
// 受け入れ者＝Acceptorのインターフェース
//===================================
interface IAccepter {
    accept(arg: IVisitor): void;
}

//=====================
// 訪問先１＝千葉県の親戚
//=====================
class Chiba implements IAccepter {
    private _otoshidama: number = 5000; //お年玉
    constructor() {} //コンストラクタ
    public accept(arg: IVisitor): void {
        arg.visit(this._otoshidama);
    }
}

//=====================
// 訪問先２＝北海道の親戚
//=====================
class Hokkaido implements IAccepter {
    private _otoshidama: number = 10000; //お年玉
    constructor() {} //コンストラクタ
    public accept(arg: IVisitor): void {
        arg.visit(this._otoshidama);
    }
}

//=======================
// 訪問者のインターフェース
//=======================
interface IVisitor {
    visit(arg: number): void;
    getPoint(): number;
}

//===============
// 訪問者１（一郎）
//===============
class Ichiro implements IVisitor {
    private _point: number = 0; //貯金
    constructor() {} //コンストラクタ
    public visit(arg: number): void {
        this._point += arg;
    }
    public getPoint(): number {
        return this._point;
    }
}

//===============
// 訪問者２（花子）
//===============
class Hanako implements IVisitor {
    private _point: number = 0; //貯金
    constructor() {} //コンストラクタ
    public visit(arg: number): void {
        this._point += arg;
    }
    public getPoint(): number {
        return this._point;
    }
}

//======
// 実行
//======
//訪問先（Acceptor）の追加
var _acceptorList: IAccepter[] = [new Chiba(), new Hokkaido()];

//訪問する人（Visitor）
var _ichiro: IVisitor = new Ichiro();
var _hanako: IVisitor = new Hanako();

//訪問する
for (var _propName in _acceptorList) {
    var _theAcceptor: IAccepter = _acceptorList[_propName];
    _theAcceptor.accept(_ichiro);
    _theAcceptor.accept(_hanako);
}

console.log(_ichiro.getPoint()); //15000
console.log(_hanako.getPoint()); //15000
```

実行環境：Ubuntu 16.04 LTS、Chromium 58、TypeScript 2.3.3  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月31日


<a name="ChainofResponsibility"></a>
# <b><ruby>Chain of Responsibility<rt>チェーン オブ レスポンシビリティ</rt></ruby></b>

```
//main.ts

//==================================
// SuperPOクラス（郵便局のスーパークラス）
//==================================
class SuperPO {
    public _next: SuperPO; //たらい回し先

    constructor() {} //コンストラクタ

    public setNext(arg: SuperPO): SuperPO {
        this._next = arg;
        return this._next;
    }

    public send(arg: string): void { //抽象メソッド
        alert("Error: サブクラスでオーバーライドして定義して下さい");
        throw new Error(); //処理を停止させる
    }
}

//================================
// ShinjukuPOクラス＝新宿郵便局
//================================
class ShinjukuPO extends SuperPO {
    constructor() { //コンストラクタ
        super(); //this._nextにアクセスする為に必須
    }
    
    public send(arg: string): void { //オーバーライド
        if (new RegExp("新宿").test(arg)) {
            console.log("本日中に届きます");
        } else {
            this._next.send(arg); //たらい回し先に振る
        } 
    }
}

//===========================
// TokyoPOクラス＝東京郵便局
//===========================
class TokyoPO extends SuperPO {
    constructor() { //コンストラクタ
        super(); //this._nextにアクセスする為に必須
    }
    
    public send(arg: string): void { //オーバーライド
        if (new RegExp("東京都").test(arg)) {
            console.log("明日中に届きます");
        } else {
            this._next.send(arg); //たらい回し先に振る
        } 
    }
}

//===========================
// JapanPOクラス＝日本郵便局
//===========================
class JapanPO extends SuperPO {
    constructor() { //コンストラクタ
        super(); //必須
    }

    public send(arg: string): void { //オーバーライド
        console.log("明後日以降に届きます");
    }
}

//======
// 実行
//======
//郵便局（Post Office）
var _setagayaPO: SuperPO = new ShinjukuPO();
var _tokyoPO: SuperPO = new TokyoPO();
var _japanPO: SuperPO = new JapanPO();

//責任のたらいまわしをセット
_setagayaPO.setNext(_tokyoPO).setNext(_japanPO);

//投函
_setagayaPO.send("東京都新宿区XX町X-X-X"); //本日中に届きます
_setagayaPO.send("東京都青梅市XX町X-X-X"); //明日中に届きます
_setagayaPO.send("宮城県仙台市XX町X-X-X"); //明後日以降に届きます
```

実行環境：Ubuntu 16.04 LTS、Chromium 58、TypeScript 2.3.3  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月31日


<a name="Mediator"></a>
# <b><ruby>Mediator<rt>メディエイター</rt></ruby></b>

```
//main.ts

//==============
// 各メンバー関連
//==============
abstract class AbstractMember { //抽象クラス
    protected _mediator: Mediator;

    public setMediator(_mediator: Mediator): void { //共通の機能
        this._mediator = _mediator;
    }

    abstract advice(_string: string): void; //抽象メソッド
}

class YesButton extends AbstractMember { //メンバー１（YesButtonクラス）
    public on(): void { //相談役に報告
        this._mediator.report(this, "on");
    }

    public advice(_string: string): void {
        if (_string == "off") {
            console.log("YesButtonをoffにします");
        }
    }
}

class NoButton extends AbstractMember { //メンバー２（NoButtonクラス）
    public on(): void { //相談役に報告
        this._mediator.report(this, "on");
    }

    public advice(_string: string): void {
        if (_string == "off") {
            console.log("NoButtonをoffにします");
        }
    }
}

class TextBox extends AbstractMember { //メンバー３（TextBoxクラス）
    public advice(_string: string): void {
        if (_string == "enable") {
            console.log("TextBoxを入力可能にします");
        } else if (_string == "disabled") {
            console.log("TextBoxを入力不可にします");
        }
    }
}

//=================================
// 相談役（専門性が高いため使い捨て）
//=================================
class Mediator {
    private _yesButton: YesButton;
    private _noButton: NoButton;
    private _textBox: TextBox;

    constructor() {
        this._yesButton = new YesButton(); //YesButtonの生成
        this._noButton = new NoButton(); //NoButtonの生成
        this._textBox = new TextBox(); //TextButtonの生成

        this._yesButton.setMediator(this); //YesButtonに相談役が自分あることを教える
        this._noButton.setMediator(this); //NoButtonに相談役が自分あることを教える
        this._textBox.setMediator(this); //TextButtonに相談役が自分あることを教える
    }

    get yesButton(): YesButton { return this._yesButton; } //外部からYesButtonにアクセス可能に
    get NoButton(): NoButton { return this._noButton; } //外部からNoButtonにアクセス可能に

    //メンバーからの報告を受けて指示を出す
    public report(_member: any, _string: string): void {
        if (_member == this._yesButton) { //YesButtonからの報告の場合...
            if (_string == "on") {
                this._noButton.advice("off");
                this._textBox.advice("enable");
            }
        }
        if (_member == this._noButton) { //NoButtonからの報告の場合...
            if (_string == "on") {
                this._yesButton.advice("off");
                this._textBox.advice("disabled");
            }
        }
    }
}

//======
// 実行
//======
var _mediator: Mediator = new Mediator();

_mediator.yesButton.on();
//=> "NoButtonをoffにします"
//=> "TextBoxを入力可能にします"

_mediator.NoButton.on();
//=> "YesButtonをoffにします"
//=> "TextBoxを入力不可にします"
```

実行環境：Ubuntu 16.04 LTS、Chromium 58、TypeScript 2.3.3  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月31日


<a name="Observer"></a>
# <b><ruby>Observer<rt>オブザーバ</rt></ruby></b>

```
//main.ts

//=============================================
// 観察される役のインターフェース（数作る場合に特に必要）
//=============================================
interface ISubject {
    //Observerパターン（観察される側）に必須のメソッド
    addObserver(arg: IObserver): void; //リスナーの登録
    deleteObserver(arg: IObserver): void; //リスナーの削除
    notify(): void; //全リスナーへの通知
}

//=======================================
// Appleクラス（観察される役＝Subuject役）
//=======================================
class Apple implements ISubject {
    private _observerArray: IObserver[] = [];
    private _version: string = "10.3.2"; //iOS Version

    constructor() {} //コンストラクタ

    //リスナーの登録
    public addObserver(arg: IObserver): void {
        this._observerArray.push(arg);
    }

    //リスナーの削除
    public deleteObserver(arg: IObserver): void {
        var _theNum: number = this._observerArray.indexOf(arg,0);
        if (_theNum != -1) {
            this._observerArray.splice(_theNum, 1);
        }
    }

    //全リスナーへの通知
    public notify(): void {
        for (var _i in this._observerArray) {
            this._observerArray[_i].update(this);
        }
    }

    get version(): string {
        return this._version; //最新のiOSのバージョンを返す
    }
}

//=======================
// リスナー役のインターフェース
//=======================
interface IObserver {
    update(arg: Apple): void; //Observerパターン（リスナー側）に必須のメソッド
}

//=========================================
// IPadProクラス（リスナー役１＝Observer役）
//=========================================
class IPadPro implements IObserver {
    constructor() {} //コンストラクタ
    public update(arg: Apple): void {
        console.log("iPadProを" + arg.version + "にアップデートします");
    }
}

//=========================================
// IPadクラス（リスナー役２＝Observer役）
//=========================================
class IPad implements IObserver {
    constructor() {} //コンストラクタ
    public update(arg: Apple): void {
        console.log("iPadを" + arg.version + "にアップデートします");
    }
}

//=========================================
// IPhoneクラス（リスナー役３＝Observer役）
//=========================================
class IPhone implements IObserver {
    constructor() {} //コンストラクタ
    public update(arg: Apple): void {
        console.log("iPhoneを" + arg.version + "にアップデートします");
    }
}

//======
// 実行
//======
//観察される役（Subject）
var _apple: ISubject = new Apple();

//リスナー（Observer）役
var _iPadPro: IObserver = new IPadPro();
var _iPad: IObserver = new IPad();
var _iPhone: IObserver = new IPhone();

//リスナー（Observer）の登録
_apple.addObserver(_iPadPro);
_apple.addObserver(_iPad);
_apple.addObserver(_iPhone);

//全リスナー（Observer）への通知
_apple.notify();
```

実行環境：Ubuntu 16.04 LTS、Chromium 58、TypeScript 2.3.3  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月31日


<a name="Memento"></a>
# <b><ruby>Memento<rt>メメント</rt></ruby></b>

```
//main.ts

//===================
// Gamerクラス＝主人公
//===================
class Gamer {
    private _totalX: number = 0;
    private _totalY: number = 0;

    constructor() {} //コンストラクタ

    public addX(saikoro: number): void {
        this._totalX += saikoro;
    }

    public addY(saikoro: number): void {
        this._totalY += saikoro;
    }

    public getMemento(): Memento {
        return new Memento(this._totalX, this._totalY);
    }
}

//=====================================
// Memoryクラス＝世話人（バックアップ係）
//=====================================
class Memory {
    private _history: Memento[] = []; //状態の履歴を保存
    private _snapshot: Memento; //最後に記録したスナップショット
    private _count: number; //undo()、redo()用

    constructor() {} //コンストラクタ

    public save(memento: Memento): void {
        this._snapshot = memento;
        this._history.push(this._snapshot);
        this._count = this._history.length - 1;
    }

    // アンドゥ（やり直し）
    public undo(): Memento {
        if (this._count > 0) {
            return this._history[--this._count];
        } else {
            console.log("これ以上、アンドゥできません");
            this._count = 0;
            return this._history[this._count];
        }
    }

    // リドゥ（再実行）
    public redo(): Memento {
        if (this._count < this._history.length-1) {
            return this._history[++this._count];
        } else {
            console.log("これ以上、リドゥできません");
            this._count = this._history.length - 1;
            return this._history[this._count];
        }
    }
}

//==================================================
// Mementoクラス＝その瞬間の状態をオブジェクトとして保存
//==================================================
class Memento {
    //状態を表すプロパティ（複数可能）
    private _totalX: number;
    private _totalY: number;
    constructor(totalX: number, totalY: number) { //コンストラクタ
        this._totalX = totalX;
        this._totalY = totalY;
    }
    public getX(): number { //getアクセサメソッドも使えるはずですが…
        return this._totalX;
    }
    public getY(): number {
        return this._totalY;
    }
}

//サイコロ（1〜6の整数が返る）
function saikoro():  number {
    return Math.floor(Math.random()*6)+1;
}

//======
// 実行
//======
//登場人物
var _gamer: Gamer = new Gamer(); //主人公
var _memory: Memory = new Memory(); //世話人（記録係）

//サイコロを５回振る => 毎回、合計値を記録
for (var _i: number=0; _i<5; _i++) { //５回繰返す
    //さいころを振る
    _gamer.addX(this.saikoro());
    _gamer.addY(this.saikoro());
    //この瞬間の状態をオブジェクトとして保存
    _memory.save(_gamer.getMemento()); 
}

// アンドゥ
// 何度もアンドゥを繰り返し、最初まで到達した場合その後ずっと最初の状態が返ります
var _theMemento: Memento = _memory.undo();
console.log(_theMemento.getX() + "," + _theMemento.getY());
var _theMemento: Memento = _memory.undo();
console.log(_theMemento.getX() + "," + _theMemento.getY());
var _theMemento: Memento = _memory.undo();
console.log(_theMemento.getX() + "," + _theMemento.getY());
var _theMemento: Memento = _memory.undo();
console.log(_theMemento.getX() + "," + _theMemento.getY());
var _theMemento: Memento = _memory.undo(); //=> これ以上、アンドゥできません

// リドゥ
// 何度もリドゥを繰り返し、最後まで到達した場合その後はずっと最後の状態が返ります
_theMemento = _memory.redo();
console.log(_theMemento.getX() + "," + _theMemento.getY());
_theMemento = _memory.redo();
console.log(_theMemento.getX() + "," + _theMemento.getY());
_theMemento = _memory.redo();
console.log(_theMemento.getX() + "," + _theMemento.getY());
_theMemento = _memory.redo();
console.log(_theMemento.getX() + "," + _theMemento.getY());
_theMemento = _memory.redo(); //=> これ以上、リドゥできません
```

実行環境：Ubuntu 16.04 LTS、Chromium 58、TypeScript 2.3.3  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月31日


<a name="State"></a>
# <b><ruby>State<rt>ステート</rt></ruby></b>

```
//main.ts

//========================================================
// Kanjiクラス＝ Context役（漢字検定）複数の状態を管理する役
//========================================================
class Kanji {
    private _state: IState; //級別問題集を格納

    constructor() {} //コンストラクタ

    set state(arg: IState) {
        this._state = arg;
    }

    public testA(): void {
        this._state.mondaiA();
    }

    public testB(): void {
        this._state.mondaiB();
    }
}

//==================================
// QuestionXXXクラスのインターフェース
//==================================
interface IState {
    mondaiA(): void;
    mondaiB(): void;
}

//===============================================
// Question7クラス＝ StateA役（漢字検定７級の問題集）
//===============================================
class Question7 implements IState {
    constructor() {} //コンストラクタ

    public mondaiA(): void {
        console.log("笑顔、衣類、胃腸");
    }

    public mondaiB(): void {
        console.log("持参、勉強、案内");
    }  
}

//================================================
// Question10クラス＝ StateB役（漢字検定10級の問題集）
//================================================
class Question10 implements IState {
    constructor() {} //コンストラクタ

    public mondaiA(): void {
        console.log("みぎ、おと、そら");
    }

    public mondaiB(): void {
        console.log("いぬ、あめ、みみ");    
    }   
}

//======
// 実行
//======
var _student: string = "ICHIRO"; // or "HANAKO"
            
//漢字検定（Context役）
var _kanji: Kanji = new Kanji();

//級別問題集（State役）
var _question7: IState = new Question7(); //漢字検定7級用
var _question10: IState = new Question10(); //漢字検定10級用

//生徒に合った級別問題集にする
if (_student == "ICHIRO") {
    _kanji.state = _question7; //setアクセサメソッドも使えるはずですが…
} else if (_student == "HANAKO") {
    _kanji.state = _question10; //setアクセサメソッドも使えるはずですが…
}

//問題を出す
_kanji.testA(); //みぎ、おと、そら  or  笑顔、衣類、胃腸
_kanji.testB(); //いぬ、あめ、みみ  or  持参、勉強、案内
```

実行環境：Ubuntu 16.04 LTS、Chromium 58、TypeScript 2.3.3  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月31日


<a name="Command"></a>
# <b><ruby>Command<rt>コマンド</rt></ruby></b>

```
//main.ts

//=============================
// Calcクラス＝起動者（Invoker役）
//=============================
class Calc {
    private _view: View; //結果を表示する役
    private _history: any[] = []; //命令の履歴を保存
    private _count: number; //undo()、redo()用
    constructor() { //コンストラクタ
        this._view = new View(); //結果を表示する役（Receiver）
    }

    // 命令（可算）
    public commandPlus(arg: number): void {
        //命令する度にインスタンスを生成
        var _commandPlus: CommandPlus = new CommandPlus(this._view, arg);
        _commandPlus.exec();
        //履歴に記録
        this._history.push(_commandPlus);
        this._count = this._history.length -1;
    }

    // 命令２（減算）
    public commandMinus(arg: number): void {
        //命令する度にインスタンスを生成
        var _commandMinus: CommandMinus = new CommandMinus(this._view, arg);
        _commandMinus.exec();
        //履歴に記録
        this._history.push(_commandMinus);
        this._count = this._history.length -1;
    }

    // アンドゥ
    public undo(): void {
        if (this._count > 0) {
            this._view.update(this._history[this._count --].getBefore()); //アンドゥ結果を表示
        } else {
            console.log("これ以上アンドゥできません");
            this._count = 0;
            this._view.update(this._history[this._count].getBefore()); //アンドゥ結果を表示
        }
    }

    // リドゥ
    public redo(): void {
        if (this._count < this._history.length-1) {
            this._view.update(this._history[++ this._count].getBefore()); //リドゥ結果を表示
        } else {
            console.log("これ以上リドゥできません");
            this._count = this._history.length - 1;
            this._view.update(this._history[this._count].getAfter()); //リドゥ結果を表示
        }
    }

    // 履歴を調べる
    public getHistory(): any[] {
        return this._history;
    }
}

//=================================================
// ICommandクラス＝命令（Command○）のインターフェース
//=================================================
interface ICommand {
     exec(): void; //命令を実際に実行する
}

//=================================
// CommandPlusクラス＝命令１（足し算）
//=================================
class CommandPlus implements ICommand {
    private _view: View; //結果を表示する役
    private _plusNum: number; //可算する値
    private _before: number; //可算する前の値
    private _after: number; //可算後の値

    constructor(arg1: View, arg2: number) { //コンストラクタ
        this._view = arg1;
        this._plusNum = arg2;
    }

    public exec(): void { //命令（可算）を実際に実行する
        this._before = this._view.getValue(); //直前の値を記憶
        this._after = this._before + this._plusNum; //可算後の値を記憶
        this._view.update(this._after);
    }

    public getBefore(): number {
        return this._before;
    }

    public getAfter(): number {
        return this._after;
    }
}

//=================================
// CommandMinusクラス＝命令２（引き算）
//=================================
class CommandMinus implements ICommand {
    private _view: View; //結果を表示する役
    private _minusNum: number; //減算する値
    private _before: number; //減算する前の値
    private _after: number; //減算後の値

    constructor(arg1: View, arg2: number) { //コンストラクタ
        this._view = arg1;
        this._minusNum = arg2;
    }

    public exec(): void { //命令（減算）を実際に実行する
        this._before = this._view.getValue(); //直前の値を記憶
        this._after　= this._before - this._minusNum; //減算後の値を記憶
        this._view.update(this._after);
    }

    public getBefore(): number {
        return this._before;
    }

    public getAfter(): number {
        return this._after;
    }
}

//================================================
// Viewクラス＝受信者（Receiver役）結果を表示する役
//================================================
class View {
    private _value: number = 0; //計算結果

    constructor() {} //コンストラクタ

    public update(arg: number) {
        this._value = arg;
        console.log(this._value); //undo、redoを含め、全ての結果はここで表示
    }

    public getValue(): number { //直前の値を記憶
        return this._value;
    }
}

//======
// 実行
//======
//計算機（起動者の役）
var _calc: Calc = new Calc();

//命令の実行
_calc.commandPlus(50); //50
_calc.commandPlus(50); //100
_calc.commandMinus(1); //99

//アンドゥ
_calc.undo(); //100
_calc.undo(); //50
_calc.undo(); //これ以上アンドゥできません 0

//リドゥ
_calc.redo(); //50
_calc.redo(); //100
_calc.redo(); //これ以上リドゥできません 99
```

実行環境：Ubuntu 16.04 LTS、Chromium 58、TypeScript 2.3.3  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月31日


<a name="Interpreter"></a>
# <b><ruby>Interpreter<rt>インタプリタ</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04 LTS、Chromium 58、TypeScript 2.3.3  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月XX日