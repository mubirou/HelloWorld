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

実行環境：Ubuntu 16.04 LTS、Chromium 58  
作成者：MUBIROU  
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
_prototype1.set("_firstName","Chikashi");
_prototype1.set("_lastName","Yoshimura");
_prototype1.set("_address","X-X-X XXX-cho, Shinjuku-ku");

//コピーを生成
var _prototype2 = _prototype1.clone();
_prototype2.set("_firstName","Hanako");

//検証
console.log(_prototype1.get("_firstName")); //Chikashi
console.log(_prototype1.get("_lastName")); //Yoshimura
console.log(_prototype1.get("_address")); //X-X-X XXX-cho, Shinjuku-ku

console.log(_prototype2.get("_firstName")); //Hanako
console.log(_prototype2.get("_lastName")); //Yoshimura
console.log(_prototype2.get("_address")); //X-X-X XXX-cho, Shinjuku-ku

</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 58  
作成者：MUBIROU  
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
    console.log("よしむらはなこ"); //フッター用素材
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
よしむらはなこ
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

実行環境：Ubuntu 16.04 LTS、Chromium 58  
作成者：MUBIROU  
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

実行環境：Ubuntu 16.04 LTS、Chromium 58  
作成者：MUBIROU  
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

実行環境：Ubuntu 16.04 LTS、Chromium 58  
作成者：MUBIROU  
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

実行環境：Ubuntu 16.04 LTS、Chromium 58  
作成者：MUBIROU  
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

実行環境：Ubuntu 16.04 LTS、Chromium 58  
作成者：MUBIROU  
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

実行環境：Ubuntu 16.04 LTS、Chromium 58  
作成者：MUBIROU  
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
_macromedia.list(); //=> Macromedia/Flash(Directory)
_dreamweaver.list(); //=> Macromedia/Dreamweaver(File)

</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 58  
作成者：MUBIROU  
作成日：2013年  
更新日：2017年05月26日


<a name="Decorator"></a>
# <b><ruby>Decorator<rt>デコレータ</rt></ruby></b>

```
<script>

//==============
// Displayクラス
//==============
function Display() { //コンストラクタ
    this._content; //サブクラスでアクセス
}
Display.prototype.show = function() {
    return this._content;
}

//===============
// Originalクラス
//===============
function Original(arg) {
    this._content = arg;
}
Original.prototype = new Display(); //Displayクラスを継承

//================
// Decorator1クラス
//================
function Decorator1(arg) {
    this._content = "-" + arg.show() + "-";
}
Decorator1.prototype = new Display(); //Displayクラスを継承

//=================
// Decorator2クラス
//=================
function Decorator2(arg) {
    this._content = "(" + arg.show() + ")"; // "<" ">" はタグと認識されてしまうので注意
}
Decorator2.prototype = new Display(); //Displayクラスを継承

//==========
// 実行
//==========
var _original = new Original("CHIKASHI");
console.log(_original.show()); // CHIKASHI

var _decorator1 = new Decorator1(_original);
console.log(_decorator1.show()); // -CHIKASHI-
        
var _decorator2 = new Decorator2(_original);
console.log(_decorator2.show()); // (CHIKASHI)
        
var _special = new Decorator2(
                    new Decorator1(
                        new Decorator1(
                            new Decorator1(
                                new Original("CHIKASHI")))));
console.log(_special.show()); // (---CHIKASHI---)

</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 58  
作成者：MUBIROU  
作成日：2013年  
更新日：2017年05月26日


<a name="Facade"></a>
# <b><ruby>Facade<rt>ファサード</rt></ruby></b>

```
<script>

//==============
// Displayクラス
//==============
function Display() { //コンストラクタ
    this._content; //サブクラスでアクセス
}
Display.prototype.show = function() {
    return this._content;
}

//===============
// Originalクラス
//===============
function Original(arg) {
    this._content = arg;
}
Original.prototype = new Display(); //Displayクラスを継承

//================
// Decorator1クラス
//================
function Decorator1(arg) {
    this._content = "-" + arg.show() + "-";
}
Decorator1.prototype = new Display(); //Displayクラスを継承

//=================
// Decorator2クラス
//=================
function Decorator2(arg) {
    this._content = "(" + arg.show() + ")"; // "<" ">" はタグと認識されてしまうので注意
}
Decorator2.prototype = new Display(); //Displayクラスを継承

//===================================================
// DecoratorFacadeクラス（Decoratorパターンにこれを追加）
//===================================================
function DecoratorFacade() {
    //Singletonパターン用（オプション）
    if (typeof DecoratorFacade._singleton == "object") { 
        return  DecoratorFacade._singleton;
    }
    DecoratorFacade._singleton = this;
}
//arg1:オリジナルの文字
//arg2:Decorator1クラスを施す回数
//arg3:Decorator2クラスを施す回数
DecoratorFacade.prototype.exec = function(arg1, arg2, arg3) {
    if (arg2 == undefined) arg2 = 0;
    if (arg3 == undefined) arg3 = 0;
    var _result = new Original(arg1);
    for (var _i=0; _i<arg2; _i++) {
        _result = new Decorator1(_result);
    }
    for (var _j=0; _j<arg3; _j++) {
        _result = new Decorator2(_result);
    }
    return _result.show();
}

//================================
// 実行（Decoratorパターンと異なる）
//================================
var _decoratorFacade = new DecoratorFacade();
console.log(_decoratorFacade.exec("CHIKASHI", 5, 2)); // ((-----CHIKASHI-----))
console.log(_decoratorFacade.exec("CHIKASHI")); // CHIKASHI
console.log(_decoratorFacade.exec("CHIKASHI", 0, 1)); // (CHIKASHI)
console.log(_decoratorFacade.exec("CHIKASHI", 1, 0)); // -CHIKASHI-

</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 58  
作成者：MUBIROU  
作成日：2013年  
更新日：2017年05月26日


<a name="Flyweight"></a>
# <b><ruby>Flyweight<rt>フライウエイト</rt></ruby></b>

```
<script>

//========================================================
// FlyweightFactoryクラス＝インスタンスの管理人（Singleton）
//========================================================
function FlyweightFactory() { //constructor
    //_poolに管理されるFlyweightオブジェクトは、ガベージコレクションされません
    // 明示的にdeleteする必要有り
    this._pool = new Object();

    //Singletonパターン用
    if (typeof FlyweightFactory._singleton == "object") {
        return  FlyweightFactory._singleton;
    }

    //クラスの静的プロパティにインスタンスを保存
    //このサンプルは簡易適なSingletonの為、外部からアクセス可能です
    FlyweightFactory._singleton = this;
}

//既存ならそのインスタンスを使い、無い場合は新規作成
FlyweightFactory.prototype.getFlyweight = function(arg) {
    //プールにインスタンスが無ければ、Flyweightインスタンス生成しプール
    if (this._pool[arg] == undefined) {
        this._pool[arg] = new Flyweight(arg);
    } else {
        console.log(arg + "は既存です");
    }
    return this._pool[arg];
}

//============================================
// Flyweightクラス＝無駄に生成したくないアイテム
//============================================
function Flyweight(arg) {
    //console.log(this); //=> Flyweight {}（注目）
    this._request = new XMLHttpRequest(); //XMLが付くクラス名だがXML以外にも対応
    this._request._text = ""; //ロードしたテキストを格納（裏技）
    this._request.onreadystatechange = this.callBack; //イベントハンドラ
    this._request.open("GET", arg + ".txt"); //読み込む外部ファイルの指定
    this._request.send(null);
}
Flyweight.prototype.callBack = function(evt) {
    if (this.readyState == 4) { //リクエストが完了した場合
        if (this.status == 200) { //成功した場合（ローカル実行時は不可）
            //console.log(this); //=> XMLHttpRequest...（注意）
            this._text = this.responseText;
        }
    }
}
Flyweight.prototype.getText = function() {
    return this._request._text;
}

//=======
// 実行
//=======
var _flyweightFactory = new FlyweightFactory();
_a = _flyweightFactory.getFlyweight("a");
_ka = _flyweightFactory.getFlyweight("ka");
_a = _flyweightFactory.getFlyweight("a"); // aは既存です
        
//console.log(_a.getText()); //この時点では、外部テキストデータがロードされていない

setTimeout("timeOut()", 500); //0.5秒後に値を取得
function timeOut() {
    console.log(_a.getText()); //あいうえお
    console.log(_ka.getText()); //かきくけこ
}

</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 58  
作成者：MUBIROU  
作成日：2013年  
更新日：2017年05月26日


<a name="Proxy"></a>
# <b><ruby>Proxy<rt>プロキシー</rt></ruby></b>

```
<script>

//==================================
// ImgLoaderクラス＝代理人（Proxy役）
//==================================
function ImgLoader(url) {
    this._url = url;
}
ImgLoader.prototype.load = function() {
    var _img = new Img(this._url); //実際の本人登場（代理人は実際の本人を知っている）
    _img.load();
}

//=====================
// Imgクラス＝実際の本人
//=====================
function Img(url) {
    this._url = url;
}
Img.prototype.load = function() { //重い処理をここで行う
    //今回のサンプルの中身はあまり重要ではない…
    console.log(this._url); //=> "sample.jpg"
}

//=======
// 実行
//=======
var _imgLoader = new ImgLoader("sample.jpg"); //代理人（Proxy）役
_imgLoader.load(); //通常は必要になった時に実際に画像（実際の本人）をロード

</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 58  
作成者：MUBIROU  
作成日：2013年  
更新日：2017年05月26日


<a name="Iterator"></a>
# <b><ruby>Iterator<rt>イテレータ</rt></ruby></b>

```
<script>

//==========
// Carクラス
//==========
function Car(name, num) { //コンストラクタ関数
    this._name = name;
    this._num = num;
}
Car.prototype.get = function(propName) {
    return this[propName];
}

//==============
// CarParkクラス
//==============
function CarPark() {} //コンストラクタ関数
CarPark.prototype._list = [];
CarPark.prototype.add = function(theElement) {
    this._list.push(theElement);
}
CarPark.prototype.getElementAt = function(index) {
    return this._list[index];
}
CarPark.prototype.getLength = function() {
    return this._list.length;
}
CarPark.prototype.createIterator = function() {
    return new Iterator(this);
}

//===============
// Iteratorクラス
//===============
function Iterator(obj) { //コンストラクタ関数
    this._obj = obj;
}
Iterator.prototype._count = 0;
Iterator.prototype.hasNext = function() {
    return this._obj.getLength() > this._count;
}
Iterator.prototype.next = function() {
    return this._obj.getElementAt(this._count++); //次の車を返します
}

//=======
// 実行
//=======
var _carPark = new CarPark(); 
_carPark.add(new Car("NISSAN GT-R", "品川300 し35-00"));
_carPark.add(new Car("BMW mini", "品川300 ぬ32-32"));
_carPark.add(new Car("TOYOTA 2000GT", "練馬501 の20-00"));
var _carParkIterator = _carPark.createIterator(); //イテレータを生成
while(_carParkIterator.hasNext()) {
    var _nextCar = _carParkIterator.next();
    console.log(_nextCar.get("_name") + ", " + _nextCar.get("_num"));
}

</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 58  
作成者：MUBIROU  
作成日：2013年  
更新日：2017年05月26日


<a name="TemplateMethod"></a>
# <b><ruby>Template Method<rt>テンプレート メソッド</rt></ruby></b>

### 概要
* abstract クラスや abstract メソッド、override キーワードはない
* エラー処理（throw new Error...）の記述は可能
* 必要な機能が用意されていないため雰囲気だけ Template Method パターンに似せるにとどまります

### 例文
```
<script>

//===============
// Abstractクラス
//===============
function Abstract() {} //コンストラクタ
Abstract.prototype.templateMethod = function() {
    this.order1(); //共通の処理
    if (this.isAdult()) { //フックメソッド
        this.order2(); //条件により実行
    }
    this.order3(); //サブクラスでオーバーライドして具体的処理を行う
}
Abstract.prototype.order1 = function() {
    console.log("HAPPY NEW YEAR!");
}
//フックメソッド実際はサブクラスでオーバーライドして定義（オプション）
Abstract.prototype.isAdult = function() {
    return true;
}
Abstract.prototype.order2 = function() { //条件により実行
    console.log("本年も宜しくお願い致します");
}
//必ずサブクラスでオーバーライドして定義しなければなりません
Abstract.prototype.order3 = function() {
    //throw new Error("ERROR…では、問題点を見つけにくいので…
    alert("ERROR:Abstract.order3():サブクラスでオーバーライドして定義して下さい");
}

//=============
// サブクラス１
//=============
function NewYearCard_Ichiro() {} //コンストラクタ
NewYearCard_Ichiro.prototype = new Abstract(); //スーパークラスを継承
//フックメソッドの実際の定義（オプション）
NewYearCard_Ichiro.prototype.isAdult = function() {
    return false;
}
//抽象クラス（Abstract）の抽象メソッドをオーバーライドして具体的に記述（必須）
NewYearCard_Ichiro.prototype.order3 = function() {
    console.log("テニスがんばろうね！");
}

//=============
// サブクラス２
//=============
function NewYearCard_Hanako() {} //コンストラクタ
NewYearCard_Hanako.prototype = new Abstract(); //スーパークラスを継承
//抽象クラス（Abstract）の抽象メソッドをオーバーライドして具体的に記述（必須）
NewYearCard_Hanako.prototype.order3 = function() {
    console.log("今度みんなで集まろう！");
}

//========
// 実行
//========
var _newYearCard_Ichiro = new NewYearCard_Ichiro();
_newYearCard_Ichiro.templateMethod();
/*
HAPPY NEW YEAR!
テニスがんばろうね！
*/

var _newYearCard_Hanako = new NewYearCard_Hanako();
_newYearCard_Hanako.templateMethod();
/*
HAPPY NEW YEAR!
本年も宜しくお願い致します
今度みんなで集まろう！
*/

</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 58  
作成者：MUBIROU  
作成日：2013年  
更新日：2017年05月26日


<a name="Strategy"></a>
# <b><ruby>Strategy<rt>ストラテジー</rt></ruby></b>

```
<script>

//===============================
// Jankenクラス＝Context（文脈）役
//===============================
function Janken(arg) {
    this._strategy = arg;
}
Janken.prototype.exec = function() {
    this._strategy.execute();  //○.exec() だと紛らわしかと思ったので…
}

//==================================
// StrategyAクラス＝具体的な「作戦Ａ」
//==================================
function StrategyA() { } //コンストラクタ
StrategyA.prototype.execute = function() {
    console.log("グー、グー、パー");
}

//==================================
// StrategyBクラス＝具体的な「作戦Ｂ」
//==================================
function StrategyB() { } //コンストラクタ
StrategyB.prototype.execute = function() {
    console.log("パー、グー、チョキ");
}

//=======
// 実行
//=======
var _partner = "HANAKO"; // or "ICHIRO"
var _janken;
        
if (_partner == "HANAKO") { //対戦相手によって作戦を変える
    _janken = new Janken(new StrategyA());
} else if (_partner == "ICHIRO") {
    _janken = new Janken(new StrategyB());
}
//じゃんけんの実行
_janken.exec(); //グー、グー、パー

</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 58  
作成者：MUBIROU  
作成日：2013年  
更新日：2017年05月26日


<a name="Visitor"></a>
# <b><ruby>Visitor<rt>ビジター</rt></ruby></b>

```
<script>

//====================
// 訪問先１＝千葉の親戚
//====================
function Chiba() { //コンストラクタ
    this._otoshidama = 5000; //お年玉
}
Chiba.prototype.accept = function(theVisitor) {
    theVisitor.visit(this._otoshidama);
}

//======================
// 訪問先２＝北海道の親戚
//======================
function Hokkaido() { //コンストラクタ
    this._otoshidama = 10000; //お年玉
}
Hokkaido.prototype.accept = function(theVisitor) {
    theVisitor.visit(this._otoshidama);
}

//===============
// 訪問者１＝一郎
//===============
function Ichiro() { //コンストラクタ
    this._point = 0; //貯金
}
Ichiro.prototype.visit = function(theOtoshidama) {
    this._point += theOtoshidama;
}
Ichiro.prototype.getPoint = function() {
    return this._point;
}

//==============
// 訪問者２＝花子
//==============
function Hanako() { //コンストラクタ
    this._point = 0; //貯金
}
Hanako.prototype.visit = function(theOtoshidama) {
    this._point += theOtoshidama;
}
Hanako.prototype.getPoint = function() {
    return this._point;
}

//=======
// 実行
//=======
//訪問先（Acceptor）の追加
var _acceptorList = [new Chiba(), new Hokkaido()];

//訪問する人（Visitor）
var _ichiro = new Ichiro();
var _hanako = new Hanako();

//訪問する
for (var _propName in _acceptorList) {
    _acceptorList[_propName].accept(_ichiro);
    _acceptorList[_propName].accept(_hanako);
}

console.log(_ichiro.getPoint()); //15000
console.log(_hanako.getPoint()); //15000

</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 58  
作成者：MUBIROU  
作成日：2013年  
更新日：2017年05月26日


<a name="ChainofResponsibility"></a>
# <b><ruby>Chain of Responsibility<rt>チェーン オブ レスポンシビリティ</rt></ruby></b>

```
<script>

//====================================
// SuperPOクラス＝郵便局のスーパークラス
//====================================
function SuperPO() { //コンストラクタ
    var _next; //たらい回し先
}
SuperPO.prototype.setNext = function(arg){
    this._next = arg;
    return this._next;
}
SuperPO.prototype.send = function(arg) {
    console.log("Error: サブクラスでオーバーライドして定義して下さい");
}

//==============================
// ShinjukuPOクラス＝新宿郵便局
//==============================
function ShinjukuPO() { } //コンストラクタ
ShinjukuPO.prototype = new SuperPO(); //スーパークラスを継承
ShinjukuPO.prototype.send = function(arg){
    if (new RegExp("新宿").test(arg)) {
        console.log("本日中に届きます");
    } else {
        this._next.send(arg); //たらい回し先に振る
    } 
}

//=========================
// TokyoPOクラス＝東京郵便局
//=========================
function TokyoPO() { } //コンストラクタ
TokyoPO.prototype = new SuperPO(); //スーパークラスを継承
TokyoPO.prototype.send = function(arg){
    if (new RegExp("東京都").test(arg)) {
        console.log("明日中に届きます");
    } else {
        this._next.send(arg); //たらい回し先に振る
    } 
}

//=========================
// JapanPOクラス＝日本郵便局
//=========================
function JapanPO() { } //コンストラクタ
JapanPO.prototype = new SuperPO(); //スーパークラスを継承
JapanPO.prototype.send = function(arg){
    console.log("明後日以降に届きます");
}

//=======
// 実行
//=======
//郵便局（Post Office）
var _shinjukuPO = new ShinjukuPO();
var _tokyoPO = new TokyoPO();
var _japanPO = new JapanPO();
        
//責任のたらいまわしをセット
_shinjukuPO.setNext(_tokyoPO).setNext(_japanPO);
        
//投函
_shinjukuPO.send("東京都新宿区XXX-X-X-X"); //本日中に届きます
_shinjukuPO.send("東京都日野市XXX町X-X-X"); //明日中に届きます
_shinjukuPO.send("静岡県XXX市XXX町X-X-X"); //明後日以降に届きます

</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 58  
作成者：MUBIROU  
作成日：2013年  
更新日：2017年05月26日


<a name="Mediator"></a>
# <b><ruby>Mediator<rt>メディエイター</rt></ruby></b>

```
<script>

//========================
//（擬似）抽象クラスの定義
//========================
function AbstractMember() {}; //コンストラクタ
AbstractMember.prototype.setMediator = function(_mediator) { //共通のメソッド
    this.__mediator = _mediator;
}
AbstractMember.prototype.advice = function(_string) { //抽象メソッド
    console.log("サブクラスで実装して下さい");
}

//===========================
//メンバー１（YesButtonクラス）
//===========================
function YesButton() {}; //コンストラクタ
YesButton.prototype = new AbstractMember(); //抽象クラスを継承
YesButton.prototype.on = function() { //メソッドの定義
    this.__mediator.report(this, "on"); //相談役に報告
}
YesButton.prototype.advice = function(_string) { //メソッドの定義
    if (_string == "off") {
        console.log("YesButtonをoffにします");
    }
}

//===========================
//メンバー２（NoButtonクラス）
//===========================
function NoButton() {}; //コンストラクタ
NoButton.prototype = new AbstractMember(); //抽象クラスを継承
NoButton.prototype.on = function() { //メソッドの定義
    this.__mediator.report(this, "on"); //相談役に報告
}
NoButton.prototype.advice = function(_string) { //メソッドの定義
    if (_string == "off") {
        console.log("NoButtonをoffにします");
    }
}

//===========================
//メンバー３（TextBoxクラス）
//===========================
function TextBox() {}; //コンストラクタ
TextBox.prototype = new AbstractMember(); //抽象クラスを継承
TextBox.prototype.advice = function(_string) { //メソッドの定義
    if (_string == "enable") {
        console.log("TextBoxを入力可能にします");
    } else if (_string == "disabled") {
        console.log("TextBoxを入力不可にします");
    }
}

//==================================
// 相談役（専門性が高いため使い捨て）
//==================================
function Mediator() { //コンストラクタ
    this.__yesButton = new YesButton(); //YesButtonの生成
    this.__noButton = new NoButton(); //NoButtonの生成
    this.__textBox = new TextBox(); //TextButtonの生成

    this.__yesButton.setMediator(this); //YesButtonに相談役が自分あることを教える
    this.__noButton.setMediator(this); //NoButtonに相談役が自分あることを教える
    this.__textBox.setMediator(this); //TextButtonに相談役が自分あることを教える
}
Mediator.prototype.getYesButton = function() { //アクセサ（getter）
    return this.__yesButton;
};
Mediator.prototype.getNoButton = function() { //アクセサ（getter）
    return this.__noButton;
};
Mediator.prototype.report = function(_member, _string) { //メンバーからの報告を受けて指示を出す
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

//=======
// 実行
//=======
var _mediator = new Mediator();

_mediator.getYesButton().on();
//=> "NoButtonをoffにします"
//=> "TextBoxを入力可能にします"

_mediator.getNoButton().on();
//=> "YesButtonをoffにします"
//=> "TextBoxを入力不可にします"

</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 58  
作成者：MUBIROU  
作成日：2013年  
更新日：2017年05月26日


<a name="Observer"></a>
# <b><ruby>Observer<rt>オブザーバ</rt></ruby></b>

```
<script>

//=======================================
// Appleクラス＝観察される役（Subuject役）
//=======================================
function Apple() { //コンストラクタ
    this._observerArray = [];
    this._version = "10.3.2"; //iOS version
}
Apple.prototype.addObserver = function(arg) { //リスナーの登録
    this._observerArray.push(arg);
}
Apple.prototype.deleteObserver = function(arg) { //リスナーの削除
    var _theNum = this._observerArray.indexOf(arg,0);
    if (_theNum != -1) {
        this._observerArray.splice(_theNum, 1);
    }
}
Apple.prototype.notify = function() { //全リスナーへの通知
    for (var _propName in this._observerArray) {
        this._observerArray[_propName].update(this);
    }
}
Apple.prototype.getVersion = function() {
    return this._version; //最新のiOSのバージョンを返す
}

//===========================================
// IPadProクラス＝リスナー役１（Observer役）
//===========================================
function IPadPro() { } //コンストラクタ
IPadPro.prototype.update = function(arg) {
    console.log("iPad Pro を " + arg.getVersion() + " にアップデートします");
}

//==========================================
// IPadクラス＝リスナー役２（Observer役）
//==========================================
function IPad() { } //コンストラクタ
IPad.prototype.update = function(arg) {
    console.log("iPad を "  + arg.getVersion() +  " にアップデートします");
}

//==========================================
// IPhoneクラス＝リスナー役３（Observer役）
//==========================================
function IPhone() { } //コンストラクタ
IPhone.prototype.update = function(arg) {
    console.log("iPhone を " + arg.getVersion() +  " にアップデートします");
}

//========
// 実行
//========
var _apple = new Apple(); //観察される役（Subject）

//リスナー（Observer）役
var _iPadPro = new IPadPro();
var _iPad = new IPad();
var _iPhone = new IPhone();

//リスナー（Observer）の登録
_apple.addObserver(_iPadPro);
_apple.addObserver(_iPad);
_apple.addObserver(_iPhone);
_apple.notify(); //全リスナー（Observer）への通知

</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 58  
作成者：MUBIROU  
作成日：2013年  
更新日：2017年05月26日


<a name="Memento"></a>
# <b><ruby>Memento<rt>メメント</rt></ruby></b>

```
<script>

//===================
// Gamerクラス＝主人公
//===================
function Gamer() { //コンストラクタ
    this._totalX = 0;
    this._totalY = 0;
}
Gamer.prototype.addX = function(saikoro) {
    this._totalX += saikoro;
}
Gamer.prototype.addY = function(saikoro) {
    this._totalY += saikoro;
}
Gamer.prototype.getMemento = function() {
    return new Memento(this._totalX, this._totalY);
}

//=====================================
// Memoryクラス＝世話人（バックアップ係）
//=====================================
function Memory() { //コンストラクタ
    this._history = []; //状態の履歴を保存
    this._snapshot = undefined; //最後に記録したスナップショット
    this._count = undefined; //undo()、redo()用
}

Memory.prototype.save = function(memento) {
    this._snapshot = memento;
    this._history.push(memento);
    this._count = this._history.length - 1;
}

// アンドゥ（やり直し）
Memory.prototype.undo = function() {
    if (this._count > 0) {
        return this._history[-- this._count];
    } else {
        console.log("これ以上、アンドゥできません");
        this._count = 0;
        return this._history[this._count];
    }
}

// リドゥ（再実行）
Memory.prototype.redo = function() {
    if (this._count < this._history.length-1) {
        return this._history[++ this._count];
    } else {
        console.log("これ以上、リドゥできません");
        this._count = this._history.length - 1;
        return this._history[this._count];
    }
}

// 作業履歴を調べる
Memory.prototype.getHistory = function() {
    return this._history;
}

// スナップショットを調べる（最後に記録したもの）
Memory.prototype.getShapshot = function() {
    return this._snapshot;
}

//================================================================
// Mementoクラス＝その瞬間の状態をオブジェクト（カプセル化）として保存
//================================================================
function Memento(totalX, totalY) {
    this._totalX = totalX;
    this._totalY = totalY;
}

Memento.prototype.getX = function() {
    return this._totalX;
}
Memento.prototype.getY = function() {
    return this._totalY;
}

//=======
// 実行
//=======
//登場人物
var _gamer = new Gamer(); //主人公
var _memory = new Memory(); //世話人（記録係）
        
//サイコロを５回振る => 毎回合計値を記録
for (var _i=0; _i<5; _i++) { //５回繰返す
    //さいころを振る
    _gamer.addX(saikoro());
    _gamer.addY(saikoro());
    //この瞬間の状態をオブジェクトとして保存
    _memory.save(_gamer.getMemento()); 
}
        
// アンドゥ
var _theMemento = _memory.undo();
console.log(_theMemento.getX() +","+ _theMemento.getY());
var _theMemento = _memory.undo();
console.log(_theMemento.getX() +","+ _theMemento.getY());
var _theMemento = _memory.undo();
console.log(_theMemento.getX() +","+ _theMemento.getY());
var _theMemento = _memory.undo();
console.log(_theMemento.getX() +","+ _theMemento.getY());
var _theMemento = _memory.undo(); //=> これ以上、アンドゥできません
        
// リドゥ
_theMemento = _memory.redo();
console.log(_theMemento.getX() +","+ _theMemento.getY());
_theMemento = _memory.redo();
console.log(_theMemento.getX() +","+ _theMemento.getY());
_theMemento = _memory.redo();
console.log(_theMemento.getX() +","+ _theMemento.getY());
_theMemento = _memory.redo();
console.log(_theMemento.getX() +","+ _theMemento.getY());
_theMemento = _memory.redo(); //=> これ以上、リドゥできません

//サイコロ（1〜6の整数が返る）
function saikoro() {
    return Math.floor(Math.random()*6)+1;
}

</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 58  
作成者：MUBIROU  
作成日：2013年  
更新日：2017年05月26日


<a name="State"></a>
# <b><ruby>State<rt>ステート</rt></ruby></b>

```
<script>

//======================================================
// Kanjiクラス＝Context役（漢字検定）複数の状態を管理する役
//======================================================
function Kanji() { //コンストラクタ
    this._state; //級別問題集を格納
}
Kanji.prototype.setState = function(arg) {
    this._state = arg;
}
Kanji.prototype.testA = function() {
    this._state.mondaiA();
}
Kanji.prototype.testB = function() {
    this._state.mondaiB();
}

//==============================================
// Question7クラス＝StateA役（漢字検定７級の問題集）
//==============================================
function Question7() { } //コンストラクタ
Question7.prototype.mondaiA = function(){
    console.log("笑顔、衣類、胃腸");
}
Question7.prototype.mondaiB = function(){
    console.log("持参、勉強、案内");
}

//==============================================
// Question10クラス＝StateB役（漢字検定10級の問題集）
//==============================================
function Question10() { } //コンストラクタ
Question10.prototype.mondaiA = function(){
    console.log("みぎ、おと、そら");
}
Question10.prototype.mondaiB = function(){
    console.log("いぬ、あめ、みみ");
}

//========
// 実行
//========
var _student = "ICHIRO"; // or "HANAKO"
        
//漢字検定（Context役）
var _kanji = new Kanji();
        
//級別問題集（State役）
var _question7 = new Question7(); //漢字検定7級用
var _question10 = new Question10(); //漢字検定10級用
        
//生徒に合った級別問題集にする
if (_student == "ICHIRO") {
    _kanji.setState(_question7);
} else if (_student == "HANAKO") {
    _kanji.setState(_question10);
}
        
//問題を出す
_kanji.testA(); //みぎ、おと、そら  or  笑顔、衣類、胃腸
_kanji.testB(); //いぬ、あめ、みみ  or  持参、勉強、案内

</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 58  
作成者：MUBIROU  
作成日：2013年  
更新日：2017年05月26日


<a name="Command"></a>
# <b><ruby>Command<rt>コマンド</rt></ruby></b>

```
<script>

//==============================
// Calcクラス＝起動者（Invoker役）
//==============================
function Calc() { //コンストラクタ
    this._view = new View(); //結果を表示する役（Receiver）
    this._history = [ ]; //命令の履歴を保存
    this._count = undefined; //undo()、redo()用
}

// 命令１（可算）
Calc.prototype.commandPlus = function(arg) {
    //命令する度にインスタンスを生成
    var _commandPlus = new CommandPlus(this._view, arg);
    _commandPlus.exec();			
    //履歴に記録
    this._history.push(_commandPlus);
    this._count = this._history.length - 1;
}

// 命令２（減算）
Calc.prototype.commandMinus = function(arg) {
    //命令する度にインスタンスを生成
    var _commandMinus = new CommandMinus(this._view, arg);
    _commandMinus.exec();
            
    //履歴に記録
    this._history.push(_commandMinus);
    this._count = this._history.length - 1;
}


// アンドゥ
Calc.prototype.undo = function() {
    if (this._count > 0) {
        this._view.update(this._history[this._count --].getBefore());
    } else {
        console.log("これ以上アンドゥできません");
        this._count = 0;
        this._view.update(this._history[this._count].getBefore());
    }
}


// リドゥ
Calc.prototype.redo = function() {
    if (this._count < this._history.length-1) {
        this._view.update(this._history[++ this._count].getBefore());
    } else {
        console.log("これ以上リドゥできません");
        this._count = this._history.length - 1;
        this._view.update(this._history[this._count].getAfter());
    }
}

// 履歴を調べる
Calc.prototype.getHistory = function() {
    return this._history;
}

//=================================
// CommandPlusクラス＝命令１（足し算）
//=================================
function CommandPlus(arg1, arg2) { //コンストラクタ
    this._view = arg1; //結果を表示する役
    this._plusNum = arg2; //可算する値
    this._before = undefined; //可算する前の値
    this._after = undefined; //可算後の値
}
CommandPlus.prototype.exec = function() { //命令（可算）を実際に実行する
    this._before = this._view.getValue(); //直前の値を記憶
    this._after = this._before + this._plusNum; //可算後の値を記憶
    this._view.update(this._after);
}	
CommandPlus.prototype.getBefore = function() {
    return this._before;
}
CommandPlus.prototype.getAfter = function() {
    return this._after;
}

//===================================
// CommandMinusクラス＝命令２（引き算）
//===================================
function CommandMinus(arg1, arg2) { //コンストラクタ
    this._view = arg1; //結果を表示する役
    this._minusNum = arg2; //減算する値
    this._before = undefined; //減算する前の値
    this._after = undefined; //減算後の値
}
CommandMinus.prototype.exec = function() { //命令（減算）を実際に実行する
    this._before = this._view.getValue(); //直前の値を記憶
    this._after = this._before - this._minusNum; //減算後の値を記憶
    this._view.update(this._after);
}	
CommandMinus.prototype.getBefore = function() {
    return this._before;
}
CommandMinus.prototype.getAfter = function() {
    return this._after;
}

//===============================================
// Viewクラス＝受信者（Receiver役）結果を表示する役
//===============================================
function View() { //コンストラクタ
    this._value = 0; //計算結果
}
View.prototype.update = function(arg) {
    this._value = arg;
    console.log(this._value); //undo、redoを含め、全ての結果はここで表示
}
View.prototype.getValue = function() { //直前の値を記憶
    return this._value;
}

//=======
// 実行
//=======
//計算機（起動者の役）
var _calc = new Calc();
        
//命令の実行
_calc.commandPlus(50); //50
_calc.commandPlus(50); //100
_calc.commandMinus(1); //99

//アンドゥ
_calc.undo(); //100
_calc.undo(); //50
_calc.undo(); //これ以上アンドゥできません => 0
        
//リドゥ
_calc.redo(); //50
_calc.redo(); //100
_calc.redo(); //これ以上リドゥできません => 99

</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 58  
作成者：MUBIROU  
作成日：2013年  
更新日：2017年05月26日


<a name="Interpreter"></a>
# <b><ruby>Interpreter<rt>インタプリタ</rt></ruby></b>
* 例文は ActionScript、SWF、AVM（ActionScript Virtual Machine）を自作ミニ言語と見立てています。

```
<script>

//======================================
// SWFクラス＝Context役（中間コードに変換）
//======================================
function SWF(code) {
    this._codeArray = []; //中間コード（配列）
    this._count = 0;
    this._codeArray = code.split(";"); //中間コード（配列）に変換
}
SWF.prototype.getNextCode = function() {
    if (! this.isEnd()) {
        return this._codeArray[this._count ++];
    } else {
        return this._codeArray[this._codeArray.length - 1];
    }
}
SWF.prototype.isEnd = function() {
    return this._count >= this._codeArray.length;
}

//=====================================
// SuperFlashPlayerクラス＝スーパークラス
//=====================================
function SuperFlashPlayer() { } //コンストラクタ
SuperFlashPlayer.prototype.exec = function(swf) {
    console.log("Error: サブクラスでoverrideして下さい");
}

//======================================================
// FlashPlayerクラス＝非終端となる表現の役（+-*/コマンド用）
//======================================================
function FlashPlayer() { } //コンストラクタ
FlashPlayer.prototype = new SuperFlashPlayer();
//オーバーライドします
FlashPlayer.prototype.exec = function(swf) {
    var _result = 0; //計算結果
    while (! swf.isEnd()) {
        var _nextCode = swf.getNextCode(); //次の命令
        var _theOperator = _nextCode.substr(0,1); //演算子
        var _theNum = Number(_nextCode.substr(1));
        if (_theOperator != "=") {
            switch (_theOperator) {
                case "+": _result += _theNum; break;
                case "-": _result -= _theNum; break;
                case "*": _result *= _theNum; break;
                case "/": _result /= _theNum; break;
                default : console.log("Error:演算子が異なります");
            }
        } else {
            var _END = new FlashPlayer_END(_result);
            _END.exec(swf);
        }
    }
}

//=====================================================
// FlashPlayer_ENDクラス＝終端となる表現の役（コマンド用）
//=====================================================
function FlashPlayer_END(result) { //コンストラクタ
    this._result = result;
}
FlashPlayer_END.prototype = new SuperFlashPlayer();	
FlashPlayer_END.prototype.exec = function(swf) { //オーバーライドします
    if (swf.getNextCode().substr(0).length == 1) { //"="一字なら…
        console.log("計算結果は" + this._result);
    } else {
        console.log("Error: 最後が=で終了していません");
    }
}

//========
// 実行
//========
var _AS = "+10;*50;/2;-4;="; //≒ASファイル
var _SWF = new SWF(_AS); //≒SWFファイル
var _FlashPlayer = new FlashPlayer(); //≒Flash Player
_FlashPlayer.exec(_SWF); //計算結果は246

</script>
```

実行環境：Ubuntu 16.04 LTS、Chromium 58  
作成者：MUBIROU  
作成日：2013年  
更新日：2017年05月26日