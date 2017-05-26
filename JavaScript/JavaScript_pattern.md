### <b>この項目は書きかけの項目です</b>

# <b>JavaScript デザインパターン</b>

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
    ***
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

```
<script>

function Singleton() { //前方宣言である必要はない
    var _singleton; //ローカル変数なので外部からアクセスできません

    //コンストラクタを書き換える
    Singleton = function Singleton() {
        return _singleton;
    }

    //prototypeプロパティを引き継ぐ
    Singleton.prototype = this;

    //インスタンスを保存
    _singleton = new Singleton();
    console.log("インスタンスが生成されました");

    //コンストラクタのポインタを再設定
    _singleton.constructor = Singleton;

    return _singleton;
}

var _instance1 = new Singleton(); //=> "インスタンスが生成されました"
var _instance2 = new Singleton(); //新たなインスタンスは作られません
console.log(_instance1 === _instance2); //=> true（中身は全く同じインスタンス）

</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月25日


<a name="Prototype"></a>
# <b><ruby>Prototype<rt>プロトタイプ</rt></ruby></b>

```
<script>

//=========================================================================
// Prototypeクラス（コンストラクタのprototypeプロパティと混同しやすいですが...）
//=========================================================================
function Prototype() { //コンストラクタ
    this._firstName = undefined;
    this._lastName = undefined;
    this._address = undefined;
}

Prototype.prototype.set = function(propName, value) { //セッターの定義
    this[propName] = value;
}

Prototype.prototype.get = function(propName) { //ゲッターの定義
    return this[propName];
}

Prototype.prototype.clone = function() {
    var _prototype = new Prototype();
    _prototype.set("_firstName",this._firstName);
    _prototype.set("_lastName",this._lastName);
    _prototype.set("_address",this._address);
    return _prototype;
}

//======
// 実行
//======
//インスタンスを生成
var _prototype1 = new Prototype();
_prototype1.set("_firstName","Takashi");
_prototype1.set("_lastName","Nishimura");
_prototype1.set("_address","X-X-X XXX-cho, Shinjuku-ku");

//コピーを生成
var _prototype2 = _prototype1.clone();
_prototype2.set("_firstName","Hanako");

//検証
console.log(_prototype1.get("_firstName")); //Takashi
console.log(_prototype1.get("_lastName")); //Nishimura
console.log(_prototype1.get("_address")); //X-X-X XXX-cho, Shinjuku-ku

console.log(_prototype2.get("_firstName")); //Hanako
console.log(_prototype2.get("_lastName")); //Nishimura
console.log(_prototype2.get("_address")); //X-X-X XXX-cho, Shinjuku-ku

</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月25日


<a name="Builder"></a>
# <b><ruby>Builder<rt>ビルダー</rt></ruby></b>

```
<script>

//===============
// Directorクラス
//===============
function Director(arg) { //コンストラクタ
    this._builder = arg;
}
Director.prototype.construct = function() {
    //同じ手順
    this._builder.makeHeader();
    this._builder.makeContent();
    this._builder.makeFooter();
}

//=================
// Builder009クラス
//=================
function Builder009() {} //コンストラクタ
Builder009.prototype.makeHeader = function() {
    var _header = new Header051(); //ヘッダー用素材の呼び出し
    _header.exec();
}
Builder009.prototype.makeContent = function() {
    var _content = new Content194(); //コンテンツ用素材の呼び出し
    _content.exec();
}
Builder009.prototype.makeFooter = function() {
    var _footer = new Footer004(); //フッター用素材の呼び出し
    _footer.exec();
}

//=================
// Builder108クラス
//=================
function Builder108() {} //コンストラクタ
Builder108.prototype.makeHeader = function() {
    var _header = new Header040();
    _header.exec();
}
Builder108.prototype.makeContent = function() {
    var _content = new Content023();
    _content.exec();
}
Builder108.prototype.makeFooter = function() {
    var _footer = new Footer011();
    _footer.exec();
}

//================
// Header040クラス
//================
function Header040() {} //コンストラクタ
Header040.prototype.exec = function() {
    console.log("HAPPY NEW YEAR!"); //ヘッダー用素材
}

//================
// Header051クラス
//================
function Header051() {} //コンストラクタ
Header051.prototype.exec = function() {
    console.log("あけましておめでとうございます"); //ヘッダー用素材
}

//=================
// Content023クラス
//=================
function Content023() {} //コンストラクタ
Content023.prototype.exec = function() {
    console.log("（タイプ023のイラスト）"); //コンテンツ用素材
}

//=================
// Content194クラス
//=================
function Content194() {} //コンストラクタ
Content194.prototype.exec = function() {
    console.log("（タイプ194のイラスト）"); //コンテンツ用素材
}

//================
// Footer004クラス
//================
function Footer004() {} //コンストラクタ
Footer004.prototype.exec = function() {
    console.log("にしむらはなこ"); //フッター用素材
}

//================
// Footer011クラス
//================
function Footer011() {} //コンストラクタ
Footer011.prototype.exec = function() {
    console.log("西村一郎"); //フッター用素材
}

//=========
// 実行
//=========
var _director = new Director(new Builder009());
_director.construct();
/*
あけましておめでとうございます
（タイプ194のイラスト）
にしむらはなこ
*/

_director = new Director(new Builder108());
_director.construct();
/*
HAPPY NEW YEAR!
（タイプ023のイラスト）
西村一郎
*/

</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月25日


<a name="FactoryMethod"></a>
# <b><ruby>Factory Method<rt>ファクトリー メソッド</rt></ruby></b>

```
<script>

//===============
// Abstractクラス
//===============
function Abstract() {} //コンストラクタ
Abstract.prototype.templateMethod = function(arg) {
    //サブクラスでオーバーライドして具体的処理を行う
    var _factoryMethod = this.factoryMethod(arg); //ここでnewしない
    _factoryMethod.exec();
    this.order1(); //共通の処理
    this.order2(); //サブクラスでオーバーライドして具体的処理を行う
}
Abstract.prototype.factoryMethod = function(arg) { //オーバーライド
    console.log("Error: サブクラスでオーバーライドして定義して下さい");
}
Abstract.prototype.order1 = function() { //共通の処理
    console.log("〒XXX-XXXX 新宿区XXX-X-X");
}
Abstract.prototype.order2 = function() { //オーバーライド
    console.log("Error: サブクラスでオーバーライドして定義して下さい");
}

//=================
// CardIchiroクラス
//=================
function CardIchiro() {} //コンストラクタ
CardIchiro.prototype = new Abstract();
CardIchiro.prototype.factoryMethod = function(arg) {
    if (arg == "newYear") {
        return new NewYear_Message();
    } else if (arg == "summer") {
        return new Summer_Message();
    }	
}
CardIchiro.prototype.order2 = function() {
    console.log("西村一郎");
}

//==================
// CardHanakoクラス
//==================
function CardHanako() {} //コンストラクタ
CardHanako.prototype = new Abstract();
CardHanako.prototype.factoryMethod = function(arg) {
    if (arg == "newYear") {
        return new NewYear_Message();
    } else if (arg == "summer") {
        return new Summer_Message();
    }
}
CardHanako.prototype.order2 = function() {
    console.log("西村花子");
}

//======================
// NewYear_Messageクラス
//======================
function NewYear_Message() {} //コンストラクタ
NewYear_Message.prototype.exec = function() {
    console.log("明けましておめでとうございます");
    console.log("（正月用イラスト）");
}

//=====================
// Summer_Messageクラス
//=====================
function Summer_Message() {} //コンストラクタ
Summer_Message.prototype.exec = function() {
    console.log("暑中お見舞い申し上げます");
    console.log("（夏用イラスト）");
}

//=================
// 実行
//=================
//年賀状（一郎用）
var _cardIchiro = new CardIchiro();
_cardIchiro.templateMethod("newYear");
/*
明けましておめでとうございます
（正月用イラスト）
〒XXX-XXXX 新宿区XXX-X-X
西村一郎
*/

//暑中見舞い（一郎用）
_cardIchiro = new CardIchiro();
_cardIchiro.templateMethod("summer");
/*
暑中お見舞い申し上げます
（夏用イラスト）
〒XXX-XXXX 新宿区XXX-X-X
西村一郎
*/

//年賀状（花子用）
var _cardHanako = new CardHanako();
_cardHanako.templateMethod("newYear");
/*
明けましておめでとうございます
（正月用イラスト）
〒XXX-XXXX 新宿区XXX-X-X
西村花子
*/

//暑中見舞い（花子用）
_cardHanako = new CardHanako();
_cardHanako.templateMethod("summer");
/*
暑中お見舞い申し上げます
（夏用イラスト）
〒XXX-XXXX 新宿区XXX-X-X
西村花子
*/

</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月25日


<a name="AbstractFactory"></a>
# <b><ruby>Abstract Factory<rt>アブストラクト ファクトリー</rt></ruby></b>

### 概要
* クラスベースではないため、Abstractor.createFactory("ICHIRO") といった記述ができない
* ほとんど Abstract Factory パターンらしい記述はできないと言っても良いでしょう

### 例文
```
<script>

//===================================
// AbstractFactoryクラス＝抽象的な工場
//===================================
function AbstractFactory() {} //コンストラクタ
//抽象的な機能サブクラスでオーバーライドして実際の機能を実装します
AbstractFactory.prototype.createNewYear = function() {
    console.log("Error 01:サブクラスでオーバーライドして下さい");
}
//抽象的な機能サブクラスでオーバーライドして、実際の機能を実装します
AbstractFactory.prototype.createSummer = function() {
    console.log("Error 02:サブクラスでオーバーライドして下さい");
}

//=================================
// ICHIROクラス＝実際の工場（一郎工場）
//=================================
function ICHIRO() {} //コンストラクタ
ICHIRO.prototype = new AbstractFactory();
ICHIRO.prototype.createNewYear = function() { //オーバーライド
    console.log("HAPPY NEW YEAR!");
    console.log("（正月用イラスト）");
    console.log("西村一郎");
}
ICHIRO.prototype.createSummer = function() { //オーバーライド
    console.log("暑中お見舞い申し上げます");
    console.log("（夏用イラスト）");
    console.log("西村一郎");
}

//===================================
// SACHKOクラス＝実際の工場（花子工場）
//===================================
function HANAKO() {} //コンストラクタ
HANAKO.prototype = new AbstractFactory();
HANAKO.prototype.createNewYear = function() { //オーバーライド
    console.log("あけましておめでとうございます");
    console.log("（正月用イラスト）");
    console.log("西村花子");
}

//オーバーライドして実際の処理を行います
HANAKO.prototype.createSummer = function() {
    console.log("しょちゅうおみまいもうしあげます");
    console.log("（夏用イラスト）");
    console.log("西村花子");
}

//========
// 実行
//========
var _ichiro = new ICHIRO(); //一郎工場を作る
_ichiro.createNewYear(); //製品を生産
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

var _hanako = new HANAKO(); //花子工場を作る
_hanako.createNewYear(); //製品を生産
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

</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月25日


<a name="Adapter（継承）"></a>
# <b><ruby>Adapter<rt>アダプター</rt></ruby>（継承）</b>

### 概要
* サブクラスのコンストラクタからスーパークラスのコンストラクタを呼び出す方法に、Java、AS3 等にある super() ステートメントが使えない
* super() の代わりに constructor() を利用する

### 例文

```
<script>

//===============================
// Moneyboxクラス＝実際の「貯金箱」
//===============================
function Moneybox(arg) { //コンストラクタ
    this._moneyYen = arg; //この変数に貯金されます
}
Moneybox.prototype.add = function(arg) {
    this._moneyYen += arg;
}
Moneybox.prototype.getMoneyYen = function() {
    return this._moneyYen;
}

//=====================================
// MoneyboxAdapterクラス＝ 円をドルに変換
//=====================================
function MoneyboxAdapter (arg1, arg2) { //コンストラクタ
    this.constructor(arg1); //Java、AS3 の super() 相当
    this._rate = arg2;	
}
MoneyboxAdapter.prototype = new Moneybox(); //スーパークラスを継承
MoneyboxAdapter.prototype.addYen = function(arg) {
    this.add(arg);
}
MoneyboxAdapter.prototype.getMoney$ = function() {
    return this.getMoneyYen() / this._rate;
}

//==========
// 実行
//==========
var _moneyboxAdapter = new MoneyboxAdapter(100, 111.607143); //(最初の貯金, 為替レート)
_moneyboxAdapter.addYen(1000);
console.log(_moneyboxAdapter.getMoney$()); //9.85599998738432（ドル）

</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月25日


<a name="Adapter（委譲）"></a>
# <b><ruby>Adapter<rt>アダプター</rt></ruby>（委譲）</b>

```
<script>

//===============================================
// Moneyboxクラス＝実際の「貯金箱」（継承版と同じ）
//===============================================
function Moneybox(arg) { //コンストラクタ
    this._moneyYen = arg; //この変数に貯金されます
}
Moneybox.prototype.add = function(arg) {
    this._moneyYen += arg;
}
Moneybox.prototype.getMoneyYen = function() {
    return this._moneyYen;
}

//===================================================
// MoneyboxAdapterクラス（このクラスのみ継承版と異なる）
//===================================================
function MoneyboxAdapter (arg1, arg2) { //コンストラクタ
    this._moneybox = new Moneybox(arg1); //ここがポイント
    this._rate = arg2;
}
MoneyboxAdapter.prototype.addYen = function(arg) {
    this._moneybox.add(arg);
}
MoneyboxAdapter.prototype.getMoney$ = function() {
    return this._moneybox.getMoneyYen() / this._rate;
}

//===================
// 実行（継承版と同じ）
//===================
var _moneyboxAdapter = new MoneyboxAdapter(100, 111.607143); //(最初の貯金, 為替レート)
_moneyboxAdapter.addYen(1000);
console.log(_moneyboxAdapter.getMoney$()); //9.85599998738432（ドル）

</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月25日


<a name="Bridge"></a>
# <b><ruby>Bridge<rt>ブリッジ</rt></ruby></b>

### 概要
* インターフェース（interface、implements）をサポートしていない
* 他の多くの言語と同じような Bridge パターン は実現できない

### 例文
```
<script>

//==================
// SuperMobileクラス
//==================
function SuperMobile(arg) { //コンストラクタ
    this._os = arg;
}
SuperMobile.prototype.getVersion = function() {
    return this._os.getVersion();
}

//=============
// Tabletクラス
//=============
function Tablet(arg) { //コンストラクタ
    this.constructor(arg); //AS3やJavaのSuper()と同等
}
Tablet.prototype = new SuperMobile(); //スーパークラスを継承（引数はいらない）
Tablet.prototype.bigScreen = function() { //タブレット特有の機能
    return "大きな画面で見る";
}

//=================
// SmartPhoneクラス
//=================
function SmartPhone(arg) { //コンストラクタ
    this.constructor(arg); //AS3やJavaのSuper()と同等
}
SmartPhone.prototype = new SuperMobile(); //スーパークラスを継承（引数はいらない）
SmartPhone.prototype.phone = function() { //スマートフォン特有の機能
    return "電話をかける";
}

//==============
// Androidクラス
//==============
function Android() {} //コンストラクタ
Android.prototype.getVersion = function() {
    return "Android 7.1.2";
}

//==========
// iOSクラス
//==========
function iOS() {} //コンストラクタ
iOS.prototype.getVersion = function() {
    return "iOS 10.3.2";
}

//=========
// 実行
//=========
//Androidタブレット
var _tablet1 = new Tablet(new Android());
console.log(_tablet1.getVersion()); //Android 7.1.2
console.log(_tablet1.bigScreen()); //大きな画面で見る

//iPad
var _tablet2 = new Tablet(new iOS());
console.log(_tablet2.getVersion()); //iOS 10.3.2
console.log(_tablet2.bigScreen()); //大きな画面で見る
        
//Androidスマートフォン
var _smartPhone1 = new SmartPhone(new Android());
console.log(_smartPhone1.getVersion()); //Android 7.1.2
console.log(_smartPhone1.phone()); //電話をかける

//iPhone
var _smartPhone2 = new SmartPhone(new iOS());
console.log(_smartPhone2.getVersion()); //iOS 10.3.2
console.log(_smartPhone2.phone()); //電話をかける

</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月25日


<a name="Composite"></a>
# <b><ruby>Composite<rt>コンポジット</rt></ruby></b>

```
<script>

//================================================
// Samenessクラス＝同一視（Component）するための役
//================================================
function Sameness() { //コンストラクタ
    this._name = undefined; //サブクラスで使います（String型）
    this._parent = undefined; //サブクラスで使います（Directory）
} 
Sameness.prototype.getName = function() {
    return this._name;
}
Sameness.prototype.getChild = function() {
    alert("ERROR:入れ子はできません"); //Fileクラス対応
}
Sameness.prototype.add = function(arg) {
    alert("ERROR:追加できません"); //Fileクラス対応
}
Sameness.prototype.remove = function(arg) {
    alert("削除できません");
}
Sameness.prototype.list = function() { //Linuxのlsコマンド風
    alert("ERROR:サブクラスでオーバーライドして下さい");
}
Sameness.prototype.setParent = function(directory) {
    this._parent = directory;
}
Sameness.prototype.getParent = function() {
    return this._parent;
}

//=====================================
// Directoryクラ＝複合体（Composit）の役
//=====================================
function Directory(name) { //コンストラクタ
    this._child = new Array();
    this._name = name;
}
Directory.prototype = new Sameness();
Directory.prototype.add = function(arg) { //引数はDirectory or File
    this._child.push(arg);
    arg.setParent(this);
}
Directory.prototype.remove = function(arg) { //引数はDirectory or File
    var _index = this._child.indexOf(arg);   //検索（なければ-1、あれば位置を返す）
    if (_index != -1) {
        this._child.splice(_index,1);
    }
}
Directory.prototype.getChild = function() {
    return this._child;
}
Directory.prototype.list = function() { //Linuxのコマンド風
    //for each…はChrome等で動作しないため…
    for (var _propName in this._child) {
        var _result = this.getName() +"/"+ this._child[_propName].getName();
        if (this._child[_propName] instanceof Directory) { //AS3の「is」相当
            _result = _result + "(Directory)";
        } else {
            _result = _result + "(File)";
        }
        console.log(_result);
    }
}

//============
// Fileクラス
//============
function File(name) { //コンストラクタ
    this._name = name;
}
File.prototype = new Sameness();
File.prototype.list = function() { //Linuxのコマンド風
    console.log(this.getParent().getName() +"/"+ this.getName() + "(File)");
}

//============
// 実行
//============
// ディレクトリの作成
var _root = new Directory("root");
var _adobe = new Directory("Adobe");
var _macromedia = new Directory("Macromedia");
var _flash = new Directory("Flash");

// ファイルの作成
var _illustrator = new File("Illustrator");
var _photoshop = new File("Photoshop");
var _dreamweaver = new File("Dreamweaver");
var _flashProfessional = new File("Flash Professional");
var _flashBuilder = new File("Flash Builder");

// 関連付け
_root.add(_adobe); //Directoryの追加
_root.add(_macromedia); //Directoryの追加
_adobe.add(_illustrator); //Fileの追加
_adobe.add(_photoshop); //Fileの追加
_macromedia.add(_flash); //Directoryの追加
_macromedia.add(_dreamweaver); //Fileの追加
_flash.add(_flashProfessional); //Fileの追加
_flash.add(_flashBuilder); //Fileの追加

// 以下検証
//DirectoryやFileの「名前」を調べる
console.log(_flashProfessional.getName()); //=> Flash Professional

//Directoryの中のDirectoryとFileを調べる
console.log(_macromedia.getChild()); //=> [Directory, File] => [Directory, File]
        
// Directoryの中のDirectoryとFileを調べる
_macromedia.remove(_dreamweaver);
console.log(_macromedia.getChild()); //=> [Directory]
        
//指定した階層のDirectory（ディレクトリ内のDirectory & File）とFileを調べる
_macromedia.list();
//=> Macromedia/Flash(Directory)
_dreamweaver.list(); //=> Macromedia/Dreamweaver(File)

</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月26日


<a name="Decorator"></a>
# <b><ruby>Decorator<rt>デコレータ</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月XX日


<a name="Facade"></a>
# <b><ruby>Facade<rt>ファサード</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月XX日


<a name="Flyweight"></a>
# <b><ruby>Flyweight<rt>フライウエイト</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月XX日


<a name="Proxy"></a>
# <b><ruby>Proxy<rt>プロキシー</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月XX日


<a name="Iterator"></a>
# <b><ruby>Iterator<rt>イテレータ</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月XX日


<a name="TemplateMethod"></a>
# <b><ruby>Template Method<rt>テンプレート メソッド</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月XX日


<a name="Strategy"></a>
# <b><ruby>Strategy<rt>ストラテジー</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月XX日


<a name="Visitor"></a>
# <b><ruby>Visitor<rt>ビジター</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月XX日


<a name="ChainofResponsibility"></a>
# <b><ruby>Chain of Responsibility<rt>チェーン オブ レスポンシビリティ</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月XX日


<a name="Mediator"></a>
# <b><ruby>Mediator<rt>メディエイター</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月XX日


<a name="Observer"></a>
# <b><ruby>Observer<rt>オブザーバ</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月XX日


<a name="Memento"></a>
# <b><ruby>Memento<rt>メメント</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月XX日


<a name="State"></a>
# <b><ruby>State<rt>ステート</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月XX日


<a name="Command"></a>
# <b><ruby>Command<rt>コマンド</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月XX日


<a name="Interpreter"></a>
# <b><ruby>Interpreter<rt>インタプリタ</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04 LTS、Chromium 56  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月XX日