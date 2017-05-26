# <b>PHP デザインパターン</b>

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
    * [<ruby>Interpreter<rt>インタプリタ</rt></ruby>](#Interpreter) : 文法規則を暮らすで表現する


<a name="Singleton"></a>
# <b><ruby>Singleton<rt>シングルトン</rt></ruby></b>

### 概要
* コンストラクタを private にすることが可能（Singleton クラス外から new Singleton() とするとエラーを発生させることが可能）
* 静的変数を定義する際 private static $singleton = new Singleton(); とするとエラーが発生してしまう

### 例文
index.php
```
<?php
require('Singleton.php'); //今回は別ファイルにして読み込む

// クラス::静的メソッド で静的メソッドにアクセス可能
$instance1 = Singleton::getInstance(); //"インスタンスが生成されました"
$instance2 = Singleton::getInstance(); //新たなインスタンスは作られない
echo $instance1 === $instance2; //=> 1（TRUE）中身は全く同じインスタンス
?>
```
Singleton.php
```
<?php
class Singleton {
    private static $singleton; // = new Singleton(); が出来ない

    private function __construct() { //privateにすることが可能
        echo "インスタンスが生成されました。";
    }

    public static function getInstance() {
        // isset() で変数に値が設定されていれば、1（TRUE）
        // self::XXX で同じクラス内のメソッドから静的変数にアクセス可
        if (!isset(self::$singleton)) { //ポイント
            self::$singleton = new Singleton();
        }
        return self::$singleton;
    }
}
?>
```

実行環境：Ubuntu 16.04 LTS、Chromium 58、PHP 7.0.15  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月24日


<a name="Prototype"></a>
# <b><ruby>Prototype<rt>プロトタイプ</rt></ruby></b>

index.php
```
<?php
require('IPrototype.php');
require('Prototype.php');

$prototype1 = new Prototype();
$prototype1->firstName = "Takashi";
$prototype1->lastName = "Nishimura";
$prototype1->address = "X-X-X XXX-cho, Shinjuku-ku";

$prototype2 = clone $prototype1; //特殊メソッド
$prototype2->firstName = "Hanako";

echo $prototype1->firstName."<br>"; //Takashi
echo $prototype1->lastName."<br>"; //Nishimura
echo $prototype1->address."<br><br>"; //X-X-X XXX-cho, Shinjuku-ku

echo $prototype2->firstName."<br>"; //Hanako
echo $prototype2->lastName."<br>"; //Nishimura
echo $prototype2->address."<br>"; //X-X-X XXX-cho, Shinjuku-ku
?>
```
IPrototype.php
```
<?php
interface IPrototype {
    public function __clone(); //特殊メソッド
}
?>
```
Prototype.php
```
<?php
class Prototype implements IPrototype {
    private $firstName, $lastName, $address;

    public function __construct() {} //コンストラクタ

    public function __set($propName, $value) {
        $this->$propName = $value;
    }

    public function __get($propName) {
        return $this->$propName;	
    }

    public function __clone() { //特殊メソッド
        return $this;
    }
}
?>
```

実行環境：Ubuntu 16.04 LTS、Chromium 58、PHP 7.0.15  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月24日


<a name="Builder"></a>
# <b><ruby>Builder<rt>ビルダー</rt></ruby></b>

```
<?php
//=============
//Directorクラス
//=============
class Director {
    public function __construct($arg) {
        $this->builder = $arg;
    }
    public function construct() {
        $this->builder->makeHeader();
        $this->builder->makeContent();
        $this->builder->makeFooter();
    }
}

//================================
//BuilderXXXクラスのインターフェース
//================================
interface IBuilder {
    public function makeHeader();
    public function makeContent();
    public function makeFooter();
}

//===============
//Builder009クラス
//===============
class Builder009 implements IBuilder {
    public function __construct() { }
    public function makeHeader(){
        $header = new Header051(); //ヘッダー用素材の呼び出し
        $header->exec();
    }
    public function makeContent(){
        $content = new Content194(); //ヘッダー用素材の呼び出し
        $content->exec();
    }
    public function makeFooter(){
        $footer = new Footer004(); //ヘッダー用素材の呼び出し
        $footer->exec();
    }
}

//===============
//Builder108クラス
//===============
class Builder108 implements IBuilder {
    public function __construct() { }
    public function makeHeader(){
        $header = new Header040(); //ヘッダー用素材の呼び出し
        $header->exec();
    }
    public function makeContent(){
        $content = new Content023(); //ヘッダー用素材の呼び出し
        $content->exec();
    }
    public function makeFooter(){
        $footer = new Footer011(); //ヘッダー用素材の呼び出し
        $footer->exec();
    }
}

//===============
//Header040クラス
//===============
class Header040 {
    public function __construct() { }

    public function exec() {
        echo "HAPPY NEW YEAR!<br>"; //ヘッダー用素材
    }
}

//===============
//Header051クラス
//===============
class Header051 {
    public function __construct() { }

    public function exec() {
        echo "あけましておめでとうございます<br>"; //ヘッダー用素材
    }
}

//===============
//Content023クラス
//===============
class Content023 {
    public function __construct() { }
    public function exec() {
        echo "（タイプ023のイラスト）<br>"; //コンテンツ用素材
    }
}

//===============
//Content194クラス
//===============
class Content194 {
    public function __construct() { }
    public function exec() {
        echo "（タイプ194のイラスト）<br>"; //コンテンツ用素材
    }
}

//===============
//Footer004クラス
//===============
class Footer004 {
    public function __construct() { }
    public function exec() {
        echo "にしむらはなこ<br>"; //フッター用素材
    }
}

//===============
//Footer011クラス
//===============
class Footer011 {
    public function __construct() { }
    public function exec() {
        echo "西村一郎<br>"; //フッター用素材
    }
}

//===========
// 実行
//===========
$director = new Director(new Builder009());
$director->construct();
/*
あけましておめでとうございます
（タイプ194のイラスト）
にしむらはなこ
*/

$director = new Director(new Builder108());
$director->construct();
/*
HAPPY NEW YEAR!
（タイプ023のイラスト）
西村一郎
*/
?>
```

実行環境：Ubuntu 16.04 LTS、Chromium 58、PHP 7.0.15  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月24日


<a name="FactoryMethod"></a>
# <b><ruby>Factory Method<rt>ファクトリー メソッド</rt></ruby></b>

```
<?php
//=====================
// AbstractClass クラス
//=====================
abstract class AbstractClass { 
    public function __construct() { } //コンストラクタ
    public final function templateMethod($arg) { //finalでサブクラスでのオーバーライド禁止
        //サブクラスでオーバーライドして具体的処理を行う
        $factoryMethod = $this->factoryMethod($arg);
        $factoryMethod->exec();
        $this->order1(); //共通の処理
        $this->order2(); //サブクラスでオーバーライドして具体的処理を行う
    }
    //必ずサブクラスで定義しなければなりません
    protected abstract function factoryMethod($arg);
    private function order1() { //共通の処理
        echo "〒XXX-XXXX 新宿区XXX X-X-X<br>";
    }
    //必ずサブクラスで定義しなければなりません
    protected abstract function order2();
}

//================
// CardIchiroクラス
//================
class CardIchiro extends AbstractClass {
    public function __construct() { } //コンストラクタ
    //インスタンスを生成する工場（オーバーライドして実際にインスタンスを生成）
    protected function factoryMethod($arg) {
        if ($arg == "newYear") {
            return new NewYear_Message();
        } else if ($arg == "summer") {
            return new Summer_Message();
        }
    }
    protected function order2() {
        echo "西村一郎<br><br>";
    }
}

//=================
// CardHanakoクラス
//=================
class CardHanako extends AbstractClass {
    public function __construct() { } //コンストラクタ
    //インスタンスを生成する工場（オーバーライドして実際にインスタンスを生成）
    protected function factoryMethod($arg) {
        if ($arg == "newYear") {
            return new NewYear_Message();
        } else if ($arg == "summer") {
            return new Summer_Message();
        }
    }
    protected function order2() {
        echo "西村花子<br><br>";
    }
}

//=====================
// NewYear_Messageクラス
//=====================
class NewYear_Message {
    public function __construct() { } //コンストラクタ
    public function exec() {
        echo "明けましておめでとうございます<br>";
        echo "（正月用イラスト）<br>";
    }
}

//====================
// Summer_Messageクラス
//====================
class Summer_Message {
    public function __construct() { } //コンストラクタ
    public function exec() {
        echo "暑中お見舞い申し上げます<br>";
        echo "（夏用イラスト）<br>";
    }
}

//===========
// 実行
//===========
// 年賀状（一郎用）
$cardIchiro = new CardIchiro();
$cardIchiro->templateMethod("newYear");
/*
明けましておめでとうございます
（正月用イラスト）
〒XXX-XXXX 新宿区XXX X-X-X
西村一郎
*/

// 暑中見舞い（一郎用）
$cardIchiro = new CardIchiro();
$cardIchiro->templateMethod("summer");
/*
暑中お見舞い申し上げます
（夏用イラスト）
〒XXX-XXXX 新宿区XXX X-X-X
西村一郎
*/

// 年賀状（花子用）
$cardTomoko = new CardHanako();
$cardTomoko->templateMethod("newYear");
/*
明けましておめでとうございます
（正月用イラスト）
〒XXX-XXXX 新宿区XXX X-X-X
西村花子
*/

// 暑中見舞い（花子用）
$cardTomoko = new CardHanako();
$cardTomoko->templateMethod("summer");
/*
暑中お見舞い申し上げます
（夏用イラスト）
〒XXX-XXXX 新宿区XXX X-X-X
西村花子
*/
?>
```

実行環境：Ubuntu 16.04 LTS、Chromium 58、PHP 7.0.15  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月24日


<a name="AbstractFactory"></a>
# <b><ruby>Abstract Factory<rt>アブストラクト ファクトリー</rt></ruby></b>

```
<?php
//=====================
// AbstractFactoryクラス
//=====================
abstract class AbstractFactory {
    public function __counstruct() {} //コンストラクタ
    public static function createFactory($arg) {
        switch ($arg) {
            case "ICHIRO":
                return new ICHIRO(); //具体的な「一郎工場」を生成
            case "HANAKO":
                return new HANAKO(); //具体的な「花子工場」を生成
        }
    }
    //抽象的な機能サブクラスでオーバーライドして、実際の機能を実装
    public abstract function createNewYear();
    public abstract function createSummer();
}

//=============
// ICHIROクラス
//=============
class ICHIRO extends AbstractFactory {
    public function __construct() {} //コンストラクタ
    //実際の処理を行う
    public function createNewYear() {
        echo "HAPPY NEW YEAR!<br>";
        echo "（正月用イラスト）<br>";
        echo "西村一郎<br><br>";
    }
    //実際の処理を行う
    public function createSummer() {
        echo "暑中お見舞い申し上げます<br>";
        echo "（夏用イラスト）<br>";
        echo "西村一郎<br><br>";
    }
}

//=============
// HANAKOクラス
//=============
class HANAKO extends AbstractFactory {
    public function __construct() {} //コンストラクタ
    //実際の処理を行う
    public function createNewYear() {
        echo "あけましておめでとうございます<br>";
        echo "（正月用イラスト）<br>";
        echo "西村花子<br><br>";
    }
    //実際の処理を行う
    public function createSummer() {
        echo "しょちゅうおみまいもうしあげます<br>";
        echo "（夏用イラスト）<br>";
        echo "西村花子<br><br>";
    }
}

//===========
// 実行
//===========
$ICHIRO = AbstractFactory::createFactory("ICHIRO"); //一郎工場を作る（クラス::静的メソッド() を利用）
$ICHIRO->createNewYear(); //製品を生産
/*
HAPPY NEW YEAR!
（正月用イラスト）
西村一郎
*/
$ICHIRO->createSummer();
/*
暑中お見舞い申し上げます
（夏用イラスト）
西村一郎
*/

//=======
// 花子
//======
$HANAKO = AbstractFactory::createFactory("HANAKO"); //花子工場を作る（クラス::静的メソッド() を利用）
$HANAKO->createNewYear(); //製品を生産
/*
あけましておめでとうございます
（正月用イラスト）
西村花子
*/
$HANAKO->createSummer();
/*
しょちゅうおみまいもうしあげます
（夏用イラスト）
西村花子
*/
?>
```

実行環境：Ubuntu 16.04 LTS、Chromium 58、PHP 7.0.15  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月24日


<a name="Adapter（継承）"></a>
# <b><ruby>Adapter<rt>アダプター</rt></ruby>（継承）</b>

```
<?php
//===============================
// Moneyboxクラス＝実際の「貯金箱」
//===============================
class Moneybox {
    private $moneyYen; //この変数に貯金されます
    public function __construct($arg) { //コンストラクタ
        $this->moneyYen = $arg;
    }
    public function add($arg) {
        $this->moneyYen += $arg;
    }
    public function __get($name) {
        return $this->$name;
    }
}

//=======================================
// MoneyboxAdapterクラスのインターフェース
//=======================================
interface IMoneyboxAdapter {
    public function addYen($arg);
    public function getMoneyDollar();
}

//=====================================
//MoneyboxAdapterクラス＝円をドルに変換
//=====================================
//スーパークラスを継承
class MoneyboxAdapter extends Moneybox implements IMoneyboxAdapter {
    private $rate;
    // 引数1＝最初の貯金、引数２＝為替レート
    public function __construct($arg1, $arg2) { //コンストラクタ
        parent::__construct($arg1); //ActionScript の super() 相当
        $this->rate = $arg2;
    }
    public function addYen($arg) {
        $this->add($arg);
    }
    public function getMoneyDollar() { //getMoney$ではエラー
        return $this->moneyYen / $this->rate;
    }
}

//===========
// 実行
//===========
// new MoneyboxAdapter(最初の貯金, 為替レート)
$moneyboxAdapter = new MoneyboxAdapter(100, 111.8193);
$moneyboxAdapter->addYen(1000);
echo $moneyboxAdapter->getMoneyDollar(); //9.8373000009837（ドル）
?>
```

実行環境：Ubuntu 16.04 LTS、Chromium 58、PHP 7.0.15  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月24日


<a name="Adapter（委譲）"></a>
# <b><ruby>Adapter<rt>アダプター</rt></ruby>（委譲）</b>

```
<?php
//================================================
// Moneyboxクラス＝実際の「貯金箱」（継承版と同じ）
//================================================
class Moneybox {
    private $moneyYen; //この変数に貯金されます
    public function __construct($arg) { //コンストラクタ
        $this->moneyYen = $arg;
    }
    public function add($arg) {
        $this->moneyYen += $arg;
    }
    public function __get($name) {
        return $this->$name;
    }
}

//======================================================
// MoneyboxAdapterクラスのインターフェース（継承版と同じ）
//======================================================
interface IMoneyboxAdapter {
    public function addYen($arg);
    public function getMoneyDollar();
}

//===========================================================
//MoneyboxAdapterクラス＝円をドルに変換（ここが継承版と異なる）
//===========================================================
class MoneyboxAdapter implements IMoneyboxAdapter {
    private $moneybox;
    private $rate;
    // 引数1＝最初の貯金、引数２＝為替レート
    public function __construct($arg1, $arg2) { //コンストラクタ
        $this->moneybox = new Moneybox($arg1); //ここがポイント
        $this->rate = $arg2;
    }
    public function addYen($arg) {
        $this->moneybox->add($arg);
    }
    public function getMoneyDollar() { //getMoney$はNG
        return $this->moneybox->moneyYen / $this->rate;
    }
}

//====================
// 実行（継承版と同じ）
//====================
// new MoneyboxAdapter(最初の貯金, 為替レート)
$moneyboxAdapter = new MoneyboxAdapter(100, 111.8193);
$moneyboxAdapter->addYen(1000);
echo $moneyboxAdapter->getMoneyDollar(); //9.8373000009837（ドル）
?>
```

実行環境：Ubuntu 16.04 LTS、Chromium 58、PHP 7.0.15  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月24日


<a name="Bridge"></a>
# <b><ruby>Bridge<rt>ブリッジ</rt></ruby></b>

```
<?php
//==================
// SuperMobileクラス
//==================
class SuperMobile {
    private $os; //橋渡し役
    public function __construct($arg) { //コンストラクタ
        $this->os = $arg; //$this->$os ではない
    }	
    public function getVersion() {
        return $this->os->getVersion(); //$this->$os-> ではない
    }
}

//=============
// Tabletクラス
//=============
class Tablet extends SuperMobile {
    public function __construct($arg) { //コンストラクタ
        parent::__construct($arg); //AS3やJavaのSuper()と同等
    }
    //タブレット特有の機能
    public function bigScreen() {
        return "大きな画面で見る";
    }
}

//================
// SmartPhoneクラス
//================
class SmartPhone extends SuperMobile {
    public function __construct($arg) { //コンストラクタ
        parent::__construct($arg); //AS3やJavaのSuper()と同等
    }
    //スマートフォン特有の機能
    public function phone() {
        return "電話をかける";
    }
}

//=======================
// 各OSのインターフェース
//=======================
interface IOS {
    public function getVersion();
}

//==============
// Androidクラス
//==============
class Android implements IOS {
    public function __construct() { } //コンストラクタ
    public function getVersion() {
        return "Android 7.1.2";
    }
}

//======================================
// iOS6クラス（本来は大文字で開始ですが）
//======================================
class iOS6 implements IOS {
    public function __construct() { } //コンストラクタ
    public function getVersion() {
        return "iOS 10.3.2";
    }
}

//==========
// 実行
//==========
//Androidタブレット
$tablet1 = new Tablet(new Android());
echo $tablet1->getVersion()."<br>"; //Android 7.1.2
echo $tablet1->bigScreen()."<br>"; //大きな画面で見る
        
//iPad
$tablet2 = new Tablet(new iOS6());
echo $tablet2->getVersion()."<br>"; //iOS 10.3.2
echo $tablet2->bigScreen()."<br>"; //大きな画面で見る
        
//Androidスマートフォン
$smartPhone1 = new SmartPhone(new Android());
echo $smartPhone1->getVersion()."<br>"; //Android 7.1.2
echo $smartPhone1->phone()."<br>"; //電話をかける

//iPhone
$smartPhone2 = new SmartPhone(new iOS6());
echo $smartPhone2->getVersion()."<br>"; //iOS 10.3.2
echo $smartPhone2->phone()."<br>"; //電話をかける
?>
```

実行環境：Ubuntu 16.04 LTS、Chromium 58、PHP 7.0.15  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月24日


<a name="Composite"></a>
# <b><ruby>Composite<rt>コンポジット</rt></ruby></b>

```
<?php
//================================================
// Samenessクラス（"同一視"するための役＝Component）
//================================================
class Sameness {
    protected $name; //サブクラスで使います
    protected $parent; //サブクラスで使います

    public function __construct() {} //コンストラクタ

    public function getName() {
        return $this->name;
    }

    public function getChild() {
        echo "入れ子はできません"; //Fileクラス対応
    }

    public function add($arg) {
        echo "追加できません"; //Fileクラス対応
    }

    public function remove($arg) {
        echo "削除できません";
    }

    public function ls() { //Linuxのlsコマンド風（listという名前は不可）
        echo "Error :サブクラスでオーバーライドして下さい";
    }

    public function setParent($directory) {
        $this->parent = $directory;
    }

    public function getParent() {
        return $this->parent;
    }
}

//============================================
// DirectoryClassクラス＝Composit（複合体）の役
//============================================
class DirectoryClass extends Sameness { //Directoryという名は不可
    private $child = array();

    public function __construct($name) { //コンストラクタ
        $this->name = $name;
    }

    //オーバーライド
    public function add($arg) { //引数はDirectory or File
        array_push($this->child, $arg);
        $arg->setParent($this);
    }

    //オーバーライド
    public function remove($arg) { //引数はDirectory or File
        //検索（なければfalse、あれば位置を返す）
        $index = array_search($arg, $this->child,TRUE); 
        if ($index != FALSE) {
            array_splice($this->child, $index, 1);
        }
    }

    //オーバーライド
    public function getChild() {
        return $this->child;
    }

    //オーバーライド
    public function ls() { //Linuxのコマンド風（listという名前は不可）
        foreach ($this->child as $tmp) {
            $result = $this->getName()."/".$tmp->getName();
            
            if ($tmp instanceof DirectoryClass) { //AS3の「is」相当
                $result = $result."(Directory)";
            } else {
                $result = $result."(File)";
            }
            echo $result."<br>";
        }
    }
}

//============
// Fileクラス
//============
class File extends Sameness {
    public function __construct($name) { //コンストラクタ
        $this->name = $name;
    }

    //オーバーライド
    public function ls() { //Linuxのコマンド風（listという名前は不可）
        echo $this->getParent()->getName()."/".$this->getName()."(File)";
    }
}

//=========
// 実行
//=========
// ディレクトリの作成
$root = new DirectoryClass("root");
$adobe = new DirectoryClass("Adobe");
$macromedia = new DirectoryClass("Macromedia");
$flash = new DirectoryClass("Flash");

// ファイルの作成
$illustrator = new File("Illustrator");
$photoshop = new File("Photoshop");
$dreamweaver = new File("Dreamweaver");
$flashProfessional = new File("Flash Professional");
$flashBuilder = new File("Flash Builder");

// 関連付け
$root->add($adobe); //Directoryの追加
$root->add($macromedia); //Directoryの追加
$adobe->add($illustrator); //Fileの追加
$adobe->add($photoshop); //Fileの追加
$macromedia->add($flash); ///Directoryの追加
$macromedia->add($dreamweaver); //Fileの追加
$flash->add($flashProfessional); //Fileの追加
$flash->add($flashBuilder); //Fileの追加
        
// 検証
//DirectoryやFileの「名前」を調べる
echo $flashProfessional->getName()."<br>"; //=> Flash Professional
        
//Directoryの中のDirectoryとFileを調べる
echo count($macromedia->getChild())."<br>"; //=>２
        
//Directoryの中のDirectoryやFileを「削除」する
$macromedia->remove($dreamweaver);
echo count($macromedia->getChild())."<br>"; //=> 1（1つに減っている）
        
//指定した階層のDirectory（ディレクトリ内のDirectory & File）とFileを調べる
$macromedia->ls(); //→Macromedia/Flash(Directory)
$dreamweaver->ls(); //→Macromedia/Dreamweaver(File)
?>
```

実行環境：Ubuntu 16.04 LTS、Chromium 58、PHP 7.0.15  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月24日


<a name="Decorator"></a>
# <b><ruby>Decorator<rt>デコレータ</rt></ruby></b>

```
<?php
//==============
// Displayクラス
//==============
class Display { //クラスではなくinterfaceにする方法もある
    protected $content; //同じクラス or サブクラスでアクセス可能

    //コンストラクタ
    public function __construct() {} 
    
    public final function show() { //finalでサブクラスでのオーバーライドを禁止
        return $this->content;
    }
}

//==============
// Originalクラス
//==============
class Original extends Display { //Displayクラスを継承
    public function Original($arg) {
        $this->content = $arg;
    }
}

//=================
// Decorator1クラス
//=================
class Decorator1 extends Display { //Displayクラスを継承
    public function Decorator1($arg) { //コンストラクタ
        $this->content = "-".$arg->show()."-";
    }
}

//=================
// Decorator2クラス
//=================
class Decorator2 extends Display { //Displayクラスを継承
    public function Decorator2($arg) { //コンストラクタ
        $this->content = "(".$arg->show().")"; // "<" ">" はタグと認識されてしまう
    }
}

//=========
// 実行
//=========
$original = new Original("TAKASHI");
echo $original->show()."<br>"; // TAKASHI
        
$decorator1 = new Decorator1($original);
echo $decorator1->show()."<br>"; // -TAKASHI-
        
$decorator2 = new Decorator2($original);
echo $decorator2->show()."<br>"; // (TAKASHI)
        
$special = new Decorator2(
                new Decorator1(
                    new Decorator1(
                        new Decorator1(
                            new Original("TAKASHI")
                        ))));
echo $special->show(); // (---TAKASHI---)
?>
```

実行環境：Ubuntu 16.04 LTS、Chromium 58、PHP 7.0.15  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月24日


<a name="Facade"></a>
# <b><ruby>Facade<rt>ファサード</rt></ruby></b>

```
<?php
//========================================
// Displayクラス（Decoratorパターンと同じ）
//========================================
class Display { //クラスではなくinterfaceにする方法もある
    protected $content; //同じクラス or サブクラスでアクセス可能

    //コンストラクタ
    public function __construct() {} 
    
    public final function show() { //finalでサブクラスでのオーバーライドを禁止
        return $this->content;
    }
}

//========================================
// Originalクラス（Decoratorパターンと同じ）
//========================================
class Original extends Display { //Displayクラスを継承
    public function Original($arg) {
        $this->content = $arg;
    }
}

//==========================================
// Decorator1クラス（Decoratorパターンと同じ）
//==========================================
class Decorator1 extends Display { //Displayクラスを継承
    public function Decorator1($arg) { //コンストラクタ
        $this->content = "-".$arg->show()."-";
    }
}

//==========================================
// Decorator2クラス（Decoratorパターンと同じ）
//==========================================
class Decorator2 extends Display { //Displayクラスを継承
    public function Decorator2($arg) { //コンストラクタ
        $this->content = "(".$arg->show().")"; // "<" ">" はタグと認識されてしまう
    }
}

//=====================================================
// DecoratorFacadeクラス（Decoratorパターンにこれを追加）
//=====================================================
class DecoratorFacade {
    //Singletonパターン用
    private static $singleton; 

    //コンストラクタ関数
    private function __construct() {}

    //arg1:オリジナルの文字
    //arg2:Decorator1クラスを施す回数
    //arg3:Decorator2クラスを施す回数
    public static function exec($arg1,	$arg2=0, $arg3=0) {
        //Singletonパターン用。
        if (!isset(self::$singleton)) {
            self::$singleton = new DecoratorFacade();
        }
        $result = new Original($arg1);
        for ($i=0; $i<$arg2; $i++) {
            $result = new Decorator1($result);
        }
        for ($j=0; $j<$arg3; $j++) {
            $result = new Decorator2($result);
        }
        return $result->show();
    }
}

//=========
// 実行
//=========
//「クラス::静的メソッド」で静的メソッドにアクセス
echo DecoratorFacade::exec("TAKASHI", 5, 2)."<br>"; // ((-----TAKASHI-----))
echo DecoratorFacade::exec("TAKASHI")."<br>"; // TAKASHI
echo DecoratorFacade::exec("TAKASHI", 0, 1)."<br>"; // (TAKASHI)
echo DecoratorFacade::exec("TAKASHI", 1, 0); // -TAKASHI-
?>
```

実行環境：Ubuntu 16.04 LTS、Chromium 58、PHP 7.0.15  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月24日


<a name="Flyweight"></a>
# <b><ruby>Flyweight<rt>フライウエイト</rt></ruby></b>

```
<?php
//=======================================================
// FlyweightFactoryクラス＝インスタンスの管理人（Singleton）
//=======================================================
class FlyweightFactory {
    private static $flyweightFactory; //Singletonパターン用

    //_poolに管理されるFlyweightオブジェクトはガベージコレクションされません
    // 明示的にdeleteする必要有り
    private $pool = array();

    private function  __construct() { } //コンストラクタ

    //Singletonパターン用
    public static function getInstance() { 
        if ( ! isset(self::$flyweightFactory) ) { //ポイント
            self::$flyweightFactory = new FlyweightFactory();
        }
        return self::$flyweightFactory;
    }

    //既存ならそのインスタンスを使い、無い場合は新規作成
    public function getFlyweight($arg) {
        //プールにインスタンスが無ければ Flyweight インスタンス生成しプール
        if (! array_key_exists($arg, $this->pool)) { //ポイント
            $this->pool[$arg] = new Flyweight($arg);
        } else {
            echo $arg."は既存です<br>";
        }
        return $this->pool[$arg];
    }
}

//=============================================
// Flyweightクラス＝無駄に生成したくないアイテム
//=============================================
class Flyweight {
    private $text; //ロードしたテキストを格納
    public function Flyweight($arg) {
        $filename = $arg.".txt"; //読み込む外部ファイルの指定
        $filePointer = fopen($filename, "r");
        $this->text = fread($filePointer, filesize($filename));
        fclose($filePointer);
    }
    public function getText() {
        return $this->text;
    }
}

//=========
// 実行
//=========
$flyweightFactory = FlyweightFactory::getInstance(); //Singletonパターン
$a = $flyweightFactory->getFlyweight("a");
$ka = $flyweightFactory->getFlyweight("ka");
$a = $flyweightFactory->getFlyweight("a"); // aは既存です

echo $a->getText()."<br>"; //=> "あいうえお"
echo $ka->getText(); //=> "かきくけこ"
?>
```

実行環境：Ubuntu 16.04 LTS、Chromium 58、PHP 7.0.15  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月24日


<a name="Proxy"></a>
# <b><ruby>Proxy<rt>プロキシー</rt></ruby></b>

```
<?php
//======================================
// ImgLoaderとImgクラスのインターフェース
//======================================
interface Iimg {
    public function load();
}

//=================================
// ImgLoaderクラス＝代理人（Proxy役）
//=================================
class ImgLoader implements Iimg {
    private $url;
    public function  __construct($url) {
        $this->url = $url;
    }
    public function load() {
        //実際の本人登場（代理人は実際の本人を知っている）
        $img = new Img($this->url);
        $img->load();
    }
}

//======================
// Imgクラス＝実際の本人
//======================
class Img implements Iimg {
    private $url;
    public function __construct($url) {
        $this->url = $url;
    }
    public function load() { //重い処理をここで行う
        //今回のサンプルの中身はあまり重要ではない…
        header("Content-type: image/jpeg"); //決め打ち
        readfile($this->url);
    }
}

//=========
// 実行
//=========
$imgLoader = new ImgLoader("sample.jpg"); //代理人（Proxy）役
$imgLoader->load(); //通常は必要になった時に実際に画像（実際の本人）をロード
?>
```

実行環境：Ubuntu 16.04 LTS、Chromium 58、PHP 7.0.15  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月24日


<a name="Iterator"></a>
# <b><ruby>Iterator<rt>イテレータ</rt></ruby></b>

```
<?php
//==========
// Carクラス
//==========
class Car {
    private $name,$num;
    public function __construct($name, $num) { //コンストラクト
        $this->name = $name;
        $this->num = $num;
    }
    public function __get($name) { //getter
        return $this->$name; //（注意）$this->nameではない
    }
}

//===============================
// CarParkクラスのインターフェース
//===============================
interface ICarPark {
    public function add($theElement); //$を付け忘れないように…
    public function getElementAt($index);
    public function getLength();
    public function createIterator();	
}

//==============
// CarParkクラス
//==============
class CarPark implements ICarPark {
    private $list = array();

    //コンストラクタ関数
    public function __construct() {}

    public function add($theElement) {
        array_push($this->list, $theElement);
    }

    public function getElementAt($index) {
        return $this->list[$index];
    }

    public function getLength() {
        return count($this->list);
    }

    public function createIterator() {
        return new IteratorCarPark($this);
    }
}

//=======================================
// IteratorCarParkクラスのインターフェース
//=======================================
interface IIteratorCarPark {
    public function hasNext();
    public function next();
}

//=====================
// IteratorCarParkクラス
//=====================
class IteratorCarPark implements IIteratorCarPark { //Class Iterator ではエラー
    private $object, $count = 0;

    public function __construct($object) {
        $this->object = $object;
    }

    public function hasNext() {
        return $this->object->getLength() > $this->count;
    }
    
    public function next() {
        return $this->object->getElementAt($this->count++); //次の車を返す
    }
}

//=========
// 実行
//=========
$carPark = new CarPark();
$carPark->add(new Car("NISSAN GT-R", "品川300 す35-00"));
$carPark->add(new Car("BMW mini", "品川300 し32-32"));
$carPark->add(new Car("TOYOTA 2000GT", "練馬501 の31-79"));
$iteratorCarPark = $carPark->createIterator(); //イテレータを生成
while($iteratorCarPark->hasNext()) {
    $nextCar = $iteratorCarPark->next();
    echo $nextCar->name.", ".$nextCar->num."<br>";
}
?>
```

実行環境：Ubuntu 16.04 LTS、Chromium 58、PHP 7.0.15  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月24日


<a name="TemplateMethod"></a>
# <b><ruby>Template Method<rt>テンプレート メソッド</rt></ruby></b>

### 概要
* abstractクラス、abstractメソッド、finalキーワードをサポート
* overrideキーワードはない（通常の関数定義で上書き）

### 例文
```
<?php
//===============
// Abstractクラス
//===============
abstract class AbstractClass { //Abstractという名前は不可
    //コンストラクタ
    public function __construct() {}

    public final function templateMethod() { //finalでサブクラスでのオーバーライド禁止
        $this->order1(); //共通の処理
        if ($this->isAdult()) { //フックメソッド
            $this->order2(); //条件により実行
        }
        $this->order3();
    }

    //共通の処理
    private function order1() {
        echo "HAPPY NEW YEAR!"."<br>";
    }

    //フックメソッド実際はサブクラスでオーバーライドして定義（オプション）
    protected function isAdult() { //protectedで同じクラスorサブクラスからのみアクセス可
        return true; //今回はabstractにせず初期値を設定
    }

    private function order2() { //条件により実行
        echo "本年も宜しくお願い致します"."<br>";
    }

    //必ずサブクラスで定義しなければなりません
    protected abstract function order3();
}

//============
// サブクラス１
//============
class NewYearCard_Ichiro extends AbstractClass { //スーパークラスを継承
    public function __construct() {} //コンストラクタ

    //フックメソッドの実際の定義（オプション）
    protected function isAdult() {
        return false;
    }

    protected function order3() {
        echo "テニスがんばろうね！"."<br>";
    }
}

//============
// サブクラス２
//============
class newYearCard_Hanako extends AbstractClass { //スーパークラスを継承
    public function __construct() {} //コンストラクタ

    protected function order3() {
        echo "今度みんなで集まろう！"."<br>";
    }
}

//=========
// 実行
//=========
$newYearCard_Ichiro = new NewYearCard_Ichiro();
$newYearCard_Ichiro->templateMethod();
/*
HAPPY NEW YEAR!
テニスがんばろうね！
*/

$newYearCard_Hanako = new newYearCard_Hanako();
$newYearCard_Hanako->templateMethod();
/*
HAPPY NEW YEAR!
本年も宜しくお願い致します
今度みんなで集まろう！
*/
?>
```

実行環境：Ubuntu 16.04 LTS、Chromium 58、PHP 7.0.15  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月24日


<a name="Strategy"></a>
# <b><ruby>Strategy<rt>ストラテジー</rt></ruby></b>

```
<?php
//=============
// Jankenクラス
//=============
class Janken {
    private $strategy;

    public function __construct($arg) { //コンストラクタ
        $this->strategy = $arg; //$this->$strategyではない
    }

    public function exec() {
        $this->strategy->execute();
    }
}

//===================================
// StrategyXXXクラスのインターフェース
//===================================
interface IStrategy {
    public function execute();
}

//===============
// StrategyAクラス
//===============
class StrategyA implements IStrategy {
    public function __construct() {} //コンストラクタ

    public function execute() {
        echo "グー、グー、パー";
    }
}

//===============
// StrategyBクラス
//===============
class StrategyB implements IStrategy {
    public function __construct() {} //コンストラクタ

    public function execute() {
        echo "パー、グー、チョキ";
    }
}

//=========
// 実行
//=========
$partner = "HANAKO"; // or "ICHIRO"

//対戦相手によって作戦を変える
if ($partner == "HANAKO") {
    $janken = new Janken(new StrategyA());
} else if ($partner == "ICHIRO") {
    $janken = new Janken(new StrategyB());
}

//じゃんけんの実行
$janken->exec(); //グー、グー、パー
?>
```

実行環境：Ubuntu 16.04 LTS、Chromium 58、PHP 7.0.15  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月24日


<a name="Visitor"></a>
# <b><ruby>Visitor<rt>ビジター</rt></ruby></b>

```
<?php
//======================================
// 受け入れ者＝Acceptorのインターフェース
//======================================
interface IAccepter {
    public function accept($arg);
}

//=================
// 訪問先１＝北海道
//=================
class Chiba implements IAccepter {
    private $otoshidama = 5000; //お年玉

    public function __construct() { } //コンストラクタ
    
    public function accept($arg) {
        $arg->visit($this->otoshidama);
    }
}

//=================
// 訪問先２＝埼玉実
//=================
class Hokkaido implements IAccepter {
    private $otoshidama = 10000; //お年玉
    public function __construct() { } //コンストラクタ
    public function accept($arg) {
        $arg->visit($this->otoshidama);
    }
}

//========================
// 訪問者のインターフェース
//========================
interface IVisitor {
    public function visit($arg);
    public function getPoint();
}

//=========
// 訪問者１
//=========
class Ichiro implements IVisitor {
    private $point = 0; //貯金

    public function __construct() {} //コンストラクタ

    public function visit($arg) {
        $this->point += $arg;
    }

    public function getPoint() {
        return $this->point;
    }
}

//=========
// 訪問者２
//=========
class Hanako implements IVisitor {
    private $point = 0; //貯金
    
    public function __construct() {} //コンストラクタ

    public function visit($arg) {
        $this->point += $arg;
    }

    public function getPoint() {
        return $this->point;
    }
}


//=========
// 実行
//=========
//訪問先（Acceptor）の追加
$acceptorList = array(new Chiba(), new Hokkaido());

//訪問する人（Visitor）
$ichiro = new Ichiro();
$hanako = new Hanako();

//訪問する
foreach ($acceptorList as $theAcceptor) {
    $theAcceptor->accept($ichiro);
    $theAcceptor->accept($hanako);
}

echo $ichiro->getPoint()."<br>"; //15000
echo $hanako->getPoint(); //15000
?>
```

実行環境：Ubuntu 16.04 LTS、Chromium 58、PHP 7.0.15  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月24日


<a name="ChainofResponsibility"></a>
# <b><ruby>Chain of Responsibility<rt>チェーン オブ レスポンシビリティ</rt></ruby></b>

```
<?php
//=====================================
// SuperPOクラス＝郵便局のスーパークラス
//=====================================
abstract class SuperPO {
    protected $next; //たらい回し先（protectedで同じクラスorサブクラスからのみアクセス可）

    public function __construct() { } //コンストラクタ

    public function setNext($arg) {
        $this->next = $arg;
        return $this->next;
    }

    abstract public function send($arg); //抽象メソッド
}

//============================
// ShinjukuPOクラス＝新宿郵便局
//============================
class ShinjukuPO extends SuperPO {
    public function __construct() {} //コンストラクタ

    public function send($arg) { //具体的な処理
        if (preg_match('/新宿/', $arg)) {
            echo "本日中に届きます<br>";
        } else {
            $this->next->send($arg); //たらい回し先に振る
        } 
    }
}

//==========================
// TokyoPOクラス＝東京郵便局
//==========================
class TokyoPO extends SuperPO {
    public function __construct() {} //コンストラクタ

    public function send($arg) { //具体的な処理
        if (preg_match('/東京都/', $arg)) {
            echo "明日中に届きます<br>";
        } else {
            $this->next->send($arg); //たらい回し先に振る
        } 
    }
}

//=========================
// JapanPOクラス＝日本郵便局
//=========================
class JapanPO extends SuperPO {
    public function __construct() {} //コンストラクタ

    public function send($arg) { //具体的な処理
        echo "明後日以降に届きます";
    }
}

//=========
// 実行
//=========
//郵便局（Post Office）
$setagayaPO = new ShinjukuPO();
$tokyoPO = new TokyoPO();
$japanPO = new JapanPO();
        
//責任のたらいまわしをセット
$setagayaPO->setNext($tokyoPO)->setNext($japanPO);
        
//投函
$setagayaPO->send("東京都新宿区XXX町X-X-X"); //本日中に届きます
$setagayaPO->send("東京都羽村市XXX町X-X-X"); //明日中に届きます
$setagayaPO->send("大阪府大阪市XXX区X-X-X"); //明後日以降に届きます
?>
```

実行環境：Ubuntu 16.04 LTS、Chromium 58、PHP 7.0.15  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月24日


<a name="Mediator"></a>
# <b><ruby>Mediator<rt>メディエイター</rt></ruby></b>

```
<?php
/*****************
 * 各メンバー関連
*****************/
abstract class AbstractMember { //抽象クラス
    protected $mediator; //プライベート変数宣言

    //コンストラクタ
    public function __construct() {}

    //共通の機能（finalでサブクラスでのオーバーライド禁止）
    public final function setMediator($mediator) {
        $this->mediator = $mediator;
    }

    //抽象メソッド（必ずサブクラスで定義しなければなりません）
    protected abstract function advice($string);
}


//メンバー１（YesButtonクラス）
class YesButton extends AbstractMember {
    //コンストラクタ
    public function __construct() {}

    public function on() { //相談役に報告
        $this->mediator->report($this, "on");
    }

    public function advice($string) { //オーバーライド
        if ($string == "off") {
            echo "YesButtonをoffにします<br>";
        }
    }
}

//メンバー２（NoButtonクラス）
class NoButton extends AbstractMember {
    //コンストラクタ
    public function __construct() {}

    public function on() { //相談役に報告
        $this->mediator->report($this, "on");
    }

    public function advice($string) { //オーバーライド
        if ($string == "off") {
            echo "NoButtonをoffにします<br>";
        }
    }
}


//メンバー３（TextBoxクラス）
class TextBox extends AbstractMember {
    //コンストラクタ
    public function __construct() {}

    public function advice($string) { //オーバーライド
        if ($string == "enable") {
            echo "TextBoxを入力可能にします<br>";
        } else if ($string == "disabled") {
            echo "TextBoxを入力不可にします<br>";
        }
    }
}

/***********************************
 * 相談役（専門性が高いため使い捨て）
***********************************/
class Mediator {
    private $yesButton, $noButton, $textBox; //プライベート変数宣言
    //コンストラクタ
    public function __construct() {
        $this->yesButton = new YesButton(); //YesButtonの生成
        $this->noButton = new NoButton(); //NoButtonの生成
        $this->textBox = new TextBox(); //TextButtonの生成

        $this->yesButton->setMediator($this); //YesButtonに相談役が自分あることを教える
        $this->noButton->setMediator($this); //NoButtonに相談役が自分あることを教える
        $this->textBox->setMediator($this); //TextButtonに相談役が自分あることを教える
    }

    //アクセサ
    public function __get($name) {
        return $this->$name;
    }

    public function report($member, $string) { //メンバーからの報告を受けて指示を出す
        if ($member == $this->yesButton) { //YesButtonからの報告の場合...
            if ($string == "on") {
                $this->noButton->advice("off");
                $this->textBox->advice("enable");
            }
        }
        if ($member == $this->noButton) { //NoButtonからの報告の場合...
            if ($string == "on") {
                $this->yesButton->advice("off");
                $this->textBox->advice("disabled");
            }
        }
    }
}

/********
 * 実行
********/
$mediator = new Mediator();
//echo gettype($mediator->yesButton);
$mediator->yesButton->on();
//=> "NoButtonをoffにします"
//=> "TextBoxを入力可能にします"

$mediator->noButton->on();
//=> "YesButtonをoffにします"
//=> "TextBoxを入力不可にします"
?>
```

実行環境：Ubuntu 16.04 LTS、Chromium 58、PHP 7.0.15  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月24日


<a name="Observer"></a>
# <b><ruby>Observer<rt>オブザーバ</rt></ruby></b>

```
<?php
//==============================
// 観察される役のインターフェース
//==============================
interface ISubject {
    //Observerパターン（観察される側）に必須のメソッド
    public function addObserver($arg); //リスナーの登録
    public function deleteObserver($arg); //リスナーの削除
    public function notify(); //全リスナーへの通知
}

//========================================
// Appleクラス＝観察される役（Subuject役）
//========================================
class Apple implements ISubject {
    private $observerArray = array();
    private $version = "10.3.2"; //iOS Version
    public function __construct() { } //constructor

    public function addObserver($arg) { //リスナーの登録
        array_push($this->observerArray, $arg);
    }
    public function deleteObserver($arg) { //リスナーの削除
        $theNum = array_search($arg, $this->observerArray,TRUE);
        if (_theNum !== FALSE) {
            array_splice($this->observerArray,$theNum,1);
        }
    }
    public function notify() { //全リスナーへの通知
        foreach ($this->observerArray as $theObserver) {
            $theObserver->update($this);
        }
    }
    public function __get($propName) {
        return $this->$propName; //実質、最新のiOSのバージョンを返す
    }
}

//=============================
// リスナー役のインターフェース
//=============================
interface IObserver {
    //Observerパターン（リスナー側）に必須のメソッド
    public function update($arg);
}

//============================================
// IPadProクラス＝リスナー役１（Observer役）
//============================================
class IPadPro implements IObserver {
    public function __construct() { } //constructor
    public function update($arg) {
        echo "iPad Pro を ".$arg->version." にアップデートします<br>";
    }
}

//===========================================
// IPadクラス＝リスナー役２（Observer役）
//===========================================
class IPad implements IObserver {
    public function __construct() { } //constructor
    public function update($arg) {
        echo "iPad を ".$arg->version." にアップデートします<br>";
    }
}

//===========================================
// IPhoneクラス＝リスナー役３（Observer役）
//===========================================
    class IPhone implements IObserver {
        public function __construct() { } //constructor
        public function update($arg) {
            echo "iPhone を ".$arg->version." にアップデートします<br>";
        }
    }

//=======
// 実行
//=======
//観察される役（Subject）
$apple = new Apple();

//リスナー（Observer）役
$galaxyNote = new IPadPro();
$galaxyTab = new IPad();
$galaxyS = new IPhone();
        
//リスナー（Observer）の登録
$apple->addObserver($galaxyNote);
$apple->addObserver($galaxyTab);
$apple->addObserver($galaxyS);
        
//全リスナー（Observer）への通知
$apple->notify();
?>
```

実行環境：Ubuntu 16.04 LTS、Chromium 58、PHP 7.0.15  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月24日


<a name="Memento"></a>
# <b><ruby>Memento<rt>メメント</rt></ruby></b>

```
<?php
//====================
// Gamerクラス＝主人公
//====================
class Gamer {
    private $totalX = 0;
    private $totalY = 0;
    public function __construct() {} //コンストラクタ
    public function addX($saikoro) {
        $this->totalX += $saikoro;
    }
    public function addY($saikoro) {
        $this->totalY += $saikoro;
    }
    public function getMemento() {
        return new Memento($this->totalX, $this->totalY);
    }
}

//=====================================
//Memoryクラス＝世話人（バックアップ係）
//=====================================
class Memory {
    private $history = array(); //状態の履歴を保存
    private $snapshot; //最後に記録したスナップショット
    private $count; //undo()、redo()用
    public function __construct() {} //コンストラクタ
    public function save($memento) {
        $this->snapshot = $memento;
        array_push($this->history, $memento);
        $this->count = count($this->history) - 1;
    }
    // アンドゥ（やり直し）
    public function undo() {
        if ($this->count > 0) {
            return $this->history[-- $this->count];
        } else {
            echo "これ以上、アンドゥできません";
            $this->count = 0;
            return $this->history[$this->count];
        }
    }
    // リドゥ（再実行）
    public function redo() {
        if ($this->count < count($this->history)-1) {
            return $this->history[++ $this->count];
        } else {
            echo "これ以上、リドゥできません";
            $this->count = count($this->history)-1;
            return $this->history[$this->count];
        }
    }
    // 作業履歴を調べる
    public function getHistory() {
        return $this->history;
    }
    // スナップショットを調べる（最後に記録したもの）
    public function getShapshot() {
        return $this->snapshot;
    }
}

//===================================================================
// Mementoクラス＝その瞬間の状態をオブジェクト（カプセル化）として保存
//===================================================================
class Memento {
    //状態を表すプロパティ（複数可能）
    private $totalX;
    private $totalY;
    public function Memento($totalX, $totalY) {
        $this->totalX = $totalX;
        $this->totalY = $totalY;
    }
    public function getX() {
        return $this->totalX;
    }
    public function getY() {
        return $this->totalY;
    }
}

//=======
// 実行
//=======
//登場人物
$gamer = new Gamer(); //主人公
$memory = new Memory(); //世話人（記録係）
        
//サイコロを５回振る => 毎回、合計値を記録
for ($i=0; $i<5; $i++) { //５回繰返す
    //さいころを振る
    $gamer->addX(saikoro());
    $gamer->addY(saikoro());
    //この瞬間の状態をオブジェクトとして保存
    $memory->save($gamer->getMemento()); 
}

// アンドゥ
// 何度もアンドゥを繰り返し、最初まで到達した場合その後ずっと最初の状態が返ります
$theMemento = $memory->undo();
echo $theMemento->getX().",".$theMemento->getY()."<br>";
$theMemento = $memory->undo();
echo $theMemento->getX().",".$theMemento->getY()."<br>";
$theMemento = $memory->undo();
echo $theMemento->getX().",".$theMemento->getY()."<br>";
$theMemento = $memory->undo();
echo $theMemento->getX().",".$theMemento->getY()."<br>";
$theMemento = $memory->undo();
echo $theMemento->getX().",".$theMemento->getY()."<br>"; //=> これ以上、アンドゥできません X,X

// リドゥ
// 何度もリドゥを繰り返し、最後まで到達した場合その後はずっと最後の状態が返ります
$theMemento = $memory->redo();
echo $theMemento->getX().",".$theMemento->getY()."<br>";
$theMemento = $memory->redo();
echo $theMemento->getX().",".$theMemento->getY()."<br>";
$theMemento = $memory->redo();
echo $theMemento->getX().",".$theMemento->getY()."<br>";
$theMemento = $memory->redo();
echo $theMemento->getX().",".$theMemento->getY()."<br>";
$theMemento = $memory->redo();
echo $theMemento->getX().",".$theMemento->getY()."<br>"; //=> これ以上、リドゥできません XX,XX
    
//サイコロ（1〜6の整数が返る）
function saikoro() {
    return rand(1,6);
}
?>
```

実行環境：Ubuntu 16.04 LTS、Chromium 58、PHP 7.0.15  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月24日


<a name="State"></a>
# <b><ruby>State<rt>ステート</rt></ruby></b>

```
<?php
//================================================
// Kanjiクラス＝ Context役（複数の状態を管理する役）
//================================================
class Kanji {
    private $state; //級別問題集を格納
    public function __construct() {} //コンストラクタ
    public function setState($arg) {
        $this->state = $arg;
    }
    public function testA() {
        $this->state->mondaiA();
    }
    public function testB() {
        $this->state->mondaiB();
    }
}

//===================================
// QuestionXXXクラスのインターフェース
//===================================
interface IState {
    public function mondaiA();
    public function mondaiB();
}

//=================================================
// Question7クラス＝ StateA役（漢字検定７級の問題集）
//=================================================
class Question7 implements IState {
    public function __construct() {} //コンストラクタ
    public function mondaiA() {
        echo "笑顔、衣類、胃腸";
    }
    public function mondaiB() {
        echo "持参、勉強、案内";
    }
}

//==================================================
// Question10クラス＝ StateB役（漢字検定10級の問題集）
//==================================================
class Question10 implements IState {
    public function __construct() {} //コンストラクタ
    public function mondaiA() {
        echo "みぎ、おと、そら";
    }
    public function mondaiB() {
        echo "いぬ、あめ、みみ";
    }
}

//=======
// 実行
//=======
$student = "ICHIRO"; // or "HANAKO"
        
//漢字検定（Context役）
$kanji = new Kanji();
        
//級別問題集（State役）
$question7 = new Question7(); //漢字検定7級用
$question10 = new Question10(); //漢字検定10級用
        
//生徒に合った級別問題集にする
if ($student == "ICHIRO") {
    $kanji->setState($question7);
} else if ($student == "HANAKO") {
    $kanji->setState($question10);
}
        
//問題を出す
$kanji->testA(); //みぎ、おと、そら  or  笑顔、衣類、胃腸
$kanji->testB(); //いぬ、あめ、みみ  or  持参、勉強、案内
?>
```

実行環境：Ubuntu 16.04 LTS、Chromium 58、PHP 7.0.15  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月24日


<a name="Command"></a>
# <b><ruby>Command<rt>コマンド</rt></ruby></b>

```
<?php
//===============================
// Calcクラス＝起動者（Invoker役）
//===============================
class Calc {
    private $view; //結果を表示する役
    private $history = array(); //命令の履歴を保存
    private $count; //undo()、redo()用
    public function __construct() { //constructor
        $this->view = new View(); //結果を表示する役（Receiver）
    }
    //=============
    // 命令１（可算）
    //=============
    public function commandPlus($arg) {
        //命令する度にインスタンスを生成
        $commandPlus = new CommandPlus($this->view, $arg);
        $commandPlus->exec();
        //履歴に記録
        array_push($this->history, $commandPlus);
        $this->count = count($this->history) - 1;
    }
    //=============
    // 命令２（減算）
    //=============
    public function commandMinus($arg) {
        //命令する度にインスタンスを生成
        $commandMinus = new CommandMinus($this->view, $arg);
        $commandMinus->exec();
        //履歴に記録
        array_push($this->history, $commandMinus);
        $this->count = count($this->history) - 1;
    }
    //=============
    // ３アンドゥ
    //=============
    public function undo() {
        if ($this->count > 0) {
            $this->view->update($this->history[$this->count --]->getBefore());
        } else {
            echo "これ以上アンドゥできません<br>";
            $this->count = 0;
            $this->view->update($this->history[$this->count]->getBefore());
        }
    }
    //=============
    // ４リドゥ
    //=============
    public function redo() {
        if ($this->count < count($this->history)-1) {
            $this->view->update($this->history[++ $this->count]->getBefore());
        } else {
            echo "これ以上リドゥできません<br>";
            $this->count = count($this->history) - 1;
            $this->view->update($this->history[$this->count]->getAfter());
        }
    }
    //=============
    // ５履歴を調べる
    //=============
    public function getHistory() {
        return $this->history;
    }
}

//=============================
// CommandXXXのインターフェース
//=============================
interface ICommand {
    public function exec(); //命令を実際に実行する
}

//===================================
// CommandPlusクラス＝命令１（足し算）
//===================================
class CommandPlus implements ICommand {
    private $view; //結果を表示する役
    private $plusNum; //可算する値
    private $before; //可算する前の値
    private $after; //可算後の値
    public function __construct($arg1, $arg2) { //constructor
        $this->view = $arg1;
        $this->plusNum = $arg2;
    }
    public function exec() { //命令（可算）を実際に実行する
        $this->before = $this->view->getValue(); //直前の値を記憶
        $this->after = $this->before + $this->plusNum; //可算後の値を記憶
        $this->view->update($this->after);
    }
    public function getBefore() {
        return $this->before;
    }
    public function getAfter() {
        return $this->after;
    }
}

//===================================
// CommandMinusクラス＝命令２（引き算）
//===================================
class CommandMinus implements ICommand {
    private $view; //結果を表示する役
    private $minusNum; //減算する値
    private $before; //減算する前の値
    private $after; //減算後の値
    public function CommandMinus($arg1, $arg2) { //constructor
        $this->view = $arg1;
        $this->minusNum = $arg2;
    }
    public function exec() { //命令（減算）を実際に実行する
        $this->before = $this->view->getValue(); //直前の値を記憶
        $this->after = $this->before - $this->minusNum; //減算後の値を記憶
        $this->view->update($this->after);
    }
    public function getBefore() {
        return $this->before;
    }
    public function getAfter() {
        return $this->after;
    }
}

//================================================
// Viewクラス＝受信者（Receiver役）結果を表示する役
//================================================
class View {
    private $value = 0; //計算結果
    public function __construct() { } //constructor
    public function update($arg) {
        $this->value = $arg;
        echo $this->value."<br>"; //undo、redoを含め全ての結果はここで表示
    }
    public function getValue() { //直前の値を記憶
        return $this->value;
    }
}

//=======
// 実行
//=======
//計算機（起動者の役）
$calc = new Calc();

//命令の実行
$calc->commandPlus(50); //=> 50
$calc->commandPlus(50); //=> 100
$calc->commandMinus(1); //=> 99
        
//アンドゥ
$calc->undo(); //=> 100
$calc->undo(); //=> 50
$calc->undo(); //=> これ以上アンドゥできません => 0
        
//リドゥ
$calc->redo(); //=> 50
$calc->redo(); //=> 100
$calc->redo(); //=> これ以上リドゥできません => 99
?>

```

実行環境：Ubuntu 16.04 LTS、Chromium 58、PHP 7.0.15  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月24日


<a name="Interpreter"></a>
# <b><ruby>Interpreter<rt>インタプリタ</rt></ruby></b>
* ここでは ActionScript、SWF、AVM（ActionScript Virtual Machine）を自作ミニ言語と見立てています。

```
<?php
//========================================
// SWFクラス＝Context役（中間コードに変換）
//========================================
class SWF {
    private $codeArray = array(); //中間コード（配列）
    private $count = 0;
    public function __construct($code) {
        $this->codeArray = explode(";", $code); //中間コード（配列）に変換
    }
    public function getNextCode() {
        if (! $this->isEnd()) {
            return $this->codeArray[$this->count ++];
        } else {
            return $this->codeArray[count($this->codeArray) - 1];
        }
    }
    public function isEnd() {
        return $this->count >= count($this->codeArray);
    }
}

//======================================
// SuperFlashPlayerクラス＝スーパークラス
//======================================
abstract class SuperFlashPlayer {
    public function __construct() {} //コンストラクタ
    abstract public function exec($swf);//必ずサブクラスで定義しなければならない
}

//========================================================
// FlashPlayerクラス＝非終端となる表現の役（+-*/コマンド用）
//========================================================
class FlashPlayer extends SuperFlashPlayer {
    public function __construct() {} //コンストラクタ
    public function exec($swf) {
        $result = 0; //計算結果
        while (! $swf->isEnd()) {
            $nextCode = $swf->getNextCode(); //次の命令
            $theOperator = substr($nextCode,0,1); //演算子
            $theNum = substr($nextCode,1);
            if ($theOperator != "=") {
                switch ($theOperator) {
                    case "+": $result += $theNum; break;
                    case "-": $result -= $theNum; break;
                    case "*": $result *= $theNum; break;
                    case "/": $result /= $theNum; break;
                    default : echo "Error: 演算子が異なります";
                }
            } else {
                $END = new FlashPlayer_END($result);
                $END->exec($swf);
            }
        }
    }
}

//======================================================
// FlashPlayer_ENDクラス＝終端となる表現の役（コマンド用）
//======================================================
class FlashPlayer_END extends SuperFlashPlayer {
    private $result;
    public function __construct($result) { //コンストラクタ
        $this->result = $result;
    }
    public function exec($swf) {
        if (count(substr($swf->getNextCode(),0)) == 1) { //"="一字なら…
            echo "計算結果は".$this->result;
        } else {
            echo "Error: 最後が=で終了していません";
        }
    }
}

//=======
// 実行
//=======
$AS = "+10;*50;/2;-4;="; //≒ASファイル
$SWF = new SWF($AS); //≒SWFファイル
$FlashPlayer = new FlashPlayer(); //≒Flash Player
$FlashPlayer->exec($SWF); //計算結果は246
?>
```

実行環境：Ubuntu 16.04 LTS、Chromium 58、PHP 7.0.15  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月24日