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
    ***
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
// new MoneyboxAdapter(最初の貯金, 為替レート)
var _moneyboxAdapter = new MoneyboxAdapter(100, 110.975474);
_moneyboxAdapter.addYen(1000);
console.log(_moneyboxAdapter.moneyDollar);
//9.91210003752721（ドル）
```

実行環境：Ubuntu 16.04 LTS、Chromium 58、TypeScript 2.3.3  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月30日


<a name="Adapter（委譲）"></a>
# <b><ruby>Adapter<rt>アダプター</rt></ruby>（委譲）</b>

XXXX

実行環境：Ubuntu 16.04 LTS、Chromium 58、TypeScript 2.3.3  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月XX日


<a name="Bridge"></a>
# <b><ruby>Bridge<rt>ブリッジ</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04 LTS、Chromium 58、TypeScript 2.3.3  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月XX日


<a name="Composite"></a>
# <b><ruby>Composite<rt>コンポジット</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04 LTS、Chromium 58、TypeScript 2.3.3  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月XX日


<a name="Decorator"></a>
# <b><ruby>Decorator<rt>デコレータ</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04 LTS、Chromium 58、TypeScript 2.3.3  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月XX日


<a name="Facade"></a>
# <b><ruby>Facade<rt>ファサード</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04 LTS、Chromium 58、TypeScript 2.3.3  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月XX日


<a name="Flyweight"></a>
# <b><ruby>Flyweight<rt>フライウエイト</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04 LTS、Chromium 58、TypeScript 2.3.3  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月XX日


<a name="Proxy"></a>
# <b><ruby>Proxy<rt>プロキシー</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04 LTS、Chromium 58、TypeScript 2.3.3  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月XX日


<a name="Iterator"></a>
# <b><ruby>Iterator<rt>イテレータ</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04 LTS、Chromium 58、TypeScript 2.3.3  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月XX日


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