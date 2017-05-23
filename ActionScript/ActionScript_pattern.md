### <b>この項目は書きかけの項目です</b>

# <b>ActionScript 3.0 デザインパターン</b>

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
    ***
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
//Main.as

package  {
    import flash.display.Sprite;

    //============
    // Main クラス
    //============
    public class Main extends Sprite {
        public function Main() {
            var _instance1: Singleton = Singleton.getInstance(); //=> ["インスタンスが生成されました"]
            var _instance2: Singleton = Singleton.getInstance(); //新たなインスタンスは作られません
            console.log(_instance1 === _instance2);//=> [true]（中身は全く同じインスタンス）
            //new Singleton(); //エラー
            //new Singleton(new Lock()); //エラー
        }
    }
}

//========================================
// ブラウザのコンソール出力用（trace()の代替）
//========================================
class console {
    import flash.external.ExternalInterface; //JavaScriptの実行用
    public static function log(...args: Array): void {
        ExternalInterface.call("function(args){ console.log(args);}", args); //JavaScriptを実行
    }
}
```
```
//Singleton.as

package  {
    //=================
    // Singleton クラス
    //=================
    public class Singleton {
        private static var _singleton: Singleton; 

        //コンストラクタ関数
        public function Singleton(arg: Lock) {}

        public static function getInstance(): Singleton {
            if (_singleton == null) {
                _singleton = new Singleton(new Lock()); 
                console.log("インスタンスが生成されました");
            }
            return _singleton;
        }
    }
}

//==========================
// Lock クラス（Singleton 用）
//==========================
internal class Lock {} //internalは同じパッケージ内からしか呼び出せない

//========================================
// ブラウザのコンソール出力用（trace()の代替）
//========================================
class console {
    import flash.external.ExternalInterface; //JavaScriptの実行用
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args); //JavaScriptを実行
    }
}
```

実行環境：Ubuntu 16.04 LTS、Apache Flex SDK 4.16、Chromium 58、Flash Player 25  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月16日


<a name="Prototype"></a>
# <b><ruby>Prototype<rt>プロトタイプ</rt></ruby></b>

```
//Main.as

package  {
    import flash.display.Sprite;

    //============
    // Main クラス
    //============
    public class Main extends Sprite {
        public function Main() {
            //==================
            // インスタンスを生成
            //==================
            var _prototype1: Prototype = new Prototype();
            _prototype1.firstName = "Takashi";
            _prototype1.lastName = "Nishimura"
            _prototype1.address = "X-XX-XX XXX, Shinjuku-ku";

            //==============
            // コピーを作成
            //==============
            var _prototype2: Prototype = _prototype1.clone();
            _prototype2.firstName = "Hanako";

            //======
            // 検証
            //======
            console.log(_prototype1.firstName, _prototype1.lastName, _prototype1.address);
            //=> ["Takashi", "Nishimura", "X-XX-XX XXX, Shinjuku-ku"]
            console.log(_prototype2.firstName, _prototype2.lastName, _prototype2.address);
            //=> ["Hanako", "Nishimura", "X-XX-XX XXX, Shinjuku-ku"]
        }
    }
}

//========================================
// ブラウザのコンソール出力用（trace()の代替）
//========================================
class console {
    import flash.external.ExternalInterface; //JavaScriptの実行用
    public static function log(...args: Array): void {
        ExternalInterface.call("function(args){ console.log(args);}", args); //JavaScriptを実行
    }
}
```
```
//IPrototype.as

package  {
    public interface IPrototype {
        function clone(): *; //実装するクラス名が不明なので「*」とする
    }
}
```
```
//Prototype.as

package  {
    public class Prototype implements IPrototype {
        private var _firstName: String, _lastName: String, _address: String;

        //コンストラクタ
        public function Prototype() {}

        //ゲッターの定義
        public function get firstName(): String { return _firstName; }
        public function get lastName(): String { return _lastName; }
        public function get address(): String { return _address; }

        //セッターの定義
        public function set firstName(arg: String): void { _firstName = arg; }
        public function set lastName(arg: String): void { _lastName = arg; }
        public function set address(arg: String): void { _address = arg; }

        public function clone(): * {
            var _prototype: Prototype = new Prototype();
            _prototype.firstName = _firstName; //セッターを利用
            _prototype.lastName = _lastName;
            _prototype.address = _address;
            return _prototype;
        }
    }
}
```

実行環境：Ubuntu 16.04 LTS、Apache Flex SDK 4.16、Chromium 58、Flash Player 25  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月17日


<a name="Builder"></a>
# <b><ruby>Builder<rt>ビルダー</rt></ruby></b>

```
//Main.as

package  {
    import flash.display.Sprite;

    //============
    // Main クラス
    //============
    public class Main extends Sprite {
        public function Main() {
            var _newYearCard: Director = new Director(new NewYearCardBuilder());
            _newYearCard.construct(); //作成過程の実行
            //=> ["明けましておめでとうございます"]
            //=> ["干支のイラスト"]
            //=> ["元旦"]

            var _summerCard: Director = new Director(new SummerCardBuilder());
            _summerCard.construct(); //作成過程の実行
            //=> ["暑中お見舞い申し上げます"]
            //=> ["スイカのイラスト"]
            //=> ["盛夏"]
        }
    }
}
```
```
//Director.as

//==========================================
// Director役＝監督（作成手順を決め実行する）
//==========================================
package  {
    public class Director {
        private var _builder: IBuilder;

        public function Director(_builder: IBuilder) { //コンストラクタ
            this._builder = _builder;
        }

        //作成過程（ConcreteBuilder役特有のメソッドは使わないこと）
        public function construct(): void {
            _builder.makeHeader();
            _builder.makeContent();
            _builder.makeFooter();
        }
    }
}
```
```
//IBuilder.as

//=================================
// XXXBuilderクラスのインターフェース
//=================================
package  {
    public interface IBuilder {
        function makeHeader(): void;
        function makeContent(): void;
        function makeFooter(): void;
    }
}
```
```
//NewYearCardBuilder.as

package  {
    public class NewYearCardBuilder implements IBuilder {
        public function NewYearCardBuilder() {} //コンストラクタ
        public function makeHeader(): void { console.log("明けましておめでとうございます"); }
        public function makeContent(): void { console.log("干支のイラスト"); }
        public function makeFooter(): void { console.log("元旦"); }
    }
}

//========================================
// ブラウザのコンソール出力用（trace()の代替）
//========================================
class console {
    import flash.external.ExternalInterface; //JavaScriptの実行用
    public static function log(...args: Array): void {
        ExternalInterface.call("function(args){ console.log(args);}", args); //JavaScriptを実行
    }
}
```
```
//SummerCardBuilder.as

package  {
    public class SummerCardBuilder implements IBuilder {
        public function SummerCardBuilder() {} //コンストラクタ
        public function makeHeader(): void { console.log("暑中お見舞い申し上げます"); }
        public function makeContent(): void { console.log("スイカのイラスト"); }
        public function makeFooter(): void { console.log("盛夏"); }
    }
}

//========================================
// ブラウザのコンソール出力用（trace()の代替）
//========================================
class console {
    import flash.external.ExternalInterface; //JavaScriptの実行用
    public static function log(...args: Array): void {
        ExternalInterface.call("function(args){ console.log(args);}", args); //JavaScriptを実行
    }
}
```

実行環境：Ubuntu 16.04 LTS、Apache Flex SDK 4.16、Chromium 58、Flash Player 25  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月17日


<a name="FactoryMethod"></a>
# <b><ruby>Factory Method<rt>ファクトリー メソッド</rt></ruby></b>

```
//Main.as

package  {
    import flash.display.Sprite;
    public class Main extends Sprite {
        public function Main() {
            // 年賀状（一郎用）
            var _cardIchiro: CardIchiro = new CardIchiro();
            _cardIchiro.templateMethod("newYear");
            /*
            明けましておめでとうございます。
            （正月用イラスト）
            〒XXX-XXXX 新宿区XXX町X-X-X
            西村一郎
            */

            // 暑中見舞い（一郎用）
            _cardIchiro = new CardIchiro();
            _cardIchiro.templateMethod("summer");
            /*
            暑中お見舞い申し上げます。
            （夏用イラスト）
            〒XXX-XXXX 新宿区XXX町X-X-X
            西村一郎
            */

            // 年賀状（花子用）
            var _cardHanako: CardHanako = new CardHanako();
            _cardHanako.templateMethod("newYear");
            /*
            明けましておめでとうございます。
            （正月用イラスト）
            〒XXX-XXXX 新宿区XXX町X-X-X
            西村花子
            */

            // 暑中見舞い（花子用）
            _cardHanako = new CardHanako();
            _cardHanako.templateMethod("summer");
            /*
            暑中お見舞い申し上げます。
            （夏用イラスト）
            〒XXX-XXXX 新宿区XXX町X-X-X
            西村花子
            */
        }
    }
}
```
```
//Abstract.as

package  {
    public class Abstract {
        public function Abstract() {} //コンストラクタ

        //final でサブクラスでのオーバーライド禁止
        public final function templateMethod(arg: String): void {
            //サブクラスでオーバーライドして具体的処理を行う
            var _factoryMethod: * = factoryMethod(arg); //ここで new しない
            _factoryMethod.exec();
            order1(); //共通の処理
            order2(); //サブクラスでオーバーライドして具体的処理を行う
        }

        //サブクラスでオーバーライドして具体的処理を行う
        protected function factoryMethod(arg: String): * {
            console.log("ERROR 01: サブクラスでオーバーライドして定義して下さい");
        }
        private function order1(): void { //共通の処理。
            console.log("〒XXX-XXXX 新宿区XXX町X-X-X");
        }
        //サブクラスでオーバーライドして具体的処理を行う
        protected function order2(): void {
            console.log("ERROR 02: サブクラスでオーバーライドして定義して下さい");
        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```
```
//CardIchiro.as

package  {
    public class CardIchiro extends Abstract {
        public function CardIchiro() { } //コンストラクタ
        //オーバーライドして実際にインスタンスを生成
        protected override function factoryMethod(arg: String): * {
            if (arg == "newYear") {
                return new NewYear_Message();
            } else if (arg == "summer") {
                return new Summer_Message();
            }
        }
        //オーバーライドして実際に具体的処理を定義
        protected override function order2(): void {
            console.log("西村一郎\n");
        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```
```
//CardHanako.as

package  {
    public class CardHanako extends Abstract {
        //コンストラクタ
        public function CardHanako() {}

        //インスタンスを生成する工場（オーバーライドして実際にインスタンスを生成）
        protected override function factoryMethod(arg: String): * {
            if (arg == "newYear") {
                return new NewYear_Message();
            } else if (arg == "summer") {
                return new Summer_Message();
            }
        }

        //オーバーライドして実際に具体的処理を定義
        protected override function order2(): void {
            console.log("西村花子\n");
        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```
```
//NewYear_Message.as

package  {
    public class NewYear_Message {
        //コンストラクタ
        public function NewYear_Message() {}

        public function exec(): void {
            console.log("明けましておめでとうございます");
            console.log("（正月用イラスト）");
        }
    }	
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```
```
//Summer_Message.as

package  {
    public class Summer_Message {
        //コンストラクタ
        public function Summer_Message() {}
        
        public function exec(): void {
            console.log("暑中お見舞い申し上げます");
            console.log("（夏用イラスト）");
        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

実行環境：Ubuntu 16.04 LTS、Apache Flex SDK 4.16、Chromium 58、Flash Player 25  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月18日


<a name="AbstractFactory"></a>
# <b><ruby>Abstract Factory<rt>アブストラクト ファクトリー</rt></ruby></b>

```
//Main.as

package  {
    import flash.display.Sprite;
    public class Main extends Sprite {
        public function Main() {
            //=======
            // 一郎
            //=======
            //一郎工場を作る
            var _ichiro: * = AbstractFactory.createFactory("ICHIRO");

            //②製品を生産
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

            //======
            // 花子
            //======
            //花子工場を作る
            var _hanako: * = AbstractFactory.createFactory("HANAKO");

            //製品を生産
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
        }
    }
}
```
```
//AbstractFactory.as

package  {
    public class AbstractFactory {
        //コンストラクタ
        public function AbstractFactory() {}

        public static function createFactory(arg: String): * {
            switch (arg) {
                case "ICHIRO": 
                    return new ICHIRO(); //具体的な「一郎工場」を生成
                case "HANAKO": 
                    return new HANAKO(); //具体的な「花子工場」を生成
            }
        }

        //抽象的な機能（サブクラスでオーバーライドして実際の機能を実装する）
        public function createNewYear(): void {
            console.log("Error: サブクラスでオーバーライドして定義して下さい");
        }

        //抽象的な機能サブクラスでオーバーライドして、実際の機能を実装します
        public function createSummer(): void {
            console.log("Error: サブクラスでオーバーライドして定義して下さい");
        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```
```
//ICHIRO.as

package  {
    public class ICHIRO extends AbstractFactory {
        //コンストラクタ
        public function ICHIRO() {}

        //オーバーライドして実際の処理を行う
        public override function createNewYear(): void {
            console.log("HAPPY NEW YEAR!");
            console.log("（正月用イラスト）");
            console.log("西村一郎");
        }

        //オーバーライドして実際の処理を行う
        public override function createSummer(): void {
            console.log("暑中お見舞い申し上げます");
            console.log("（夏用イラスト）");
            console.log("西村一郎");
        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```
```
//HANAKO.as

package  {
    public class HANAKO extends AbstractFactory {
        //コンストラクタ
        public function HANAKO() {}

        //オーバーライドして実際の処理を行う
        public override function createNewYear(): void {
            console.log("あけましておめでとうございます");
            console.log("（正月用イラスト）");
            console.log("西村花子");
        }

        //オーバーライドして実際の処理を行う
        public override function createSummer(): void {
            console.log("しょちゅうおみまいもうしあげます");
            console.log("（夏用イラスト）");
            console.log("西村花子");
        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

実行環境：Ubuntu 16.04 LTS、Apache Flex SDK 4.16、Chromium 58、Flash Player 25  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月18日


<a name="Adapter（継承）"></a>
# <b><ruby>Adapter<rt>アダプター</rt></ruby>（継承）</b>

```
//Main.as

package  {
    import flash.display.Sprite;
    public class Main extends Sprite {
        public function Main() {
            // new MoneyboxAdapter(最初の貯金, 為替レート)	
            var _moneyboxAdapter: MoneyboxAdapter = new MoneyboxAdapter(100, 111.333779);
            _moneyboxAdapter.addYen(1000);
            console.log(_moneyboxAdapter.getMoney$()); //9.880199970576763（ドル）
        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```
```
//Moneybox.as

package  {
    public class Moneybox {
        private var _moneyYen: uint; //この変数に貯金される

        public function Moneybox(arg: uint) {
            _moneyYen = arg;
        }

        public function add(arg: uint): void {
            _moneyYen += arg;
        }

        public function get moneyYen(): uint {
            return _moneyYen;
        }
    }
}
```
```
//IMoneyboxAdapter.as

package  {
    public interface IMoneyboxAdapter {
        function addYen(arg: uint): void;
        function getMoney$(): Number;
    }
}
```
```
//MoneyboxAdapter.as

package  {
    //スーパークラスを継承
    public class MoneyboxAdapter extends Moneybox implements IMoneyboxAdapter {
        private var _rate: Number;

        // コンストラクタ（引数1＝最初の貯金、引数２＝為替レート）
        public function MoneyboxAdapter(arg1: uint, arg2: Number): void {
            super(arg1);
            _rate = arg2;
        }

        public function addYen(arg: uint): void {
            this.add(arg);
        }

        public function getMoney$(): Number {
            return this.moneyYen / _rate;
        }
    }
}
```

実行環境：Ubuntu 16.04 LTS、Apache Flex SDK 4.16、Chromium 58、Flash Player 25  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月19日


<a name="Adapter（委譲）"></a>
# <b><ruby>Adapter<rt>アダプター</rt></ruby>（委譲）</b>

```
//Main.as（継承版と同じ）

package  {
    import flash.display.Sprite;
    public class Main extends Sprite {
        public function Main() {
            // new MoneyboxAdapter(最初の貯金, 為替レート)	
            var _moneyboxAdapter: MoneyboxAdapter = new MoneyboxAdapter(100, 111.333779);
            _moneyboxAdapter.addYen(1000);
            console.log(_moneyboxAdapter.getMoney$()); //9.880199970576763（ドル）
        }
    }
}

class console { //ブラウザのコンソール出力用（trace()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```
```
//Moneybox.as（継承版と同じ）

package  {
    public class Moneybox {
        private var _moneyYen: uint; //この変数に貯金される

        public function Moneybox(arg: uint) {
            _moneyYen = arg;
        }

        public function add(arg: uint): void {
            _moneyYen += arg;
        }

        public function get moneyYen(): uint {
            return _moneyYen;
        }
    }
}
```
```
//IMoneyboxAdapter.as（継承版と同じ）

package  {
    public interface IMoneyboxAdapter {
        function addYen(arg: uint): void;
        function getMoney$(): Number;
    }
}
```
```
//MoneyboxAdapter.as（このクラスのみ継承版と異なる）

package  {
    public class MoneyboxAdapter implements IMoneyboxAdapter {
        private var _moneybox: Moneybox;
        private var _rate: Number;

        // コンストラクタ（引数1＝最初の貯金、引数２＝為替レート）
        public function MoneyboxAdapter(arg1: uint, arg2: Number): void {
            _moneybox = new Moneybox(arg1); //ここがポイント
            _rate = arg2;
        }
        public function addYen(arg: uint): void {
            _moneybox.add(arg);
        }
        public function getMoney$(): Number {
            return _moneybox.moneyYen / _rate;
        }
    }
}
```

実行環境：Ubuntu 16.04 LTS、Apache Flex SDK 4.16、Chromium 58、Flash Player 25  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月21日


<a name="Bridge"></a>
# <b><ruby>Bridge<rt>ブリッジ</rt></ruby></b>

```
//Main.as

package  {
    import flash.display.MovieClip;
    public class Main extends MovieClip {
        public function Main() {
            //Androidタブレット
            var _tablet1: Tablet = new Tablet(new Android());
            console.log(_tablet1.version); //Android 7.1.2
            _tablet1.bigScreen(); //大きな画面で見る
            
            //iPad
            var _tablet2: Tablet = new Tablet(new iOS10());
            console.log(_tablet2.version); //iOS 10.3.2
            _tablet2.bigScreen(); //大きな画面で見る
            
            //Androidスマートフォン
            var _smartPhone1: SmartPhone = new SmartPhone(new Android());
            console.log(_smartPhone1.version); //Android 7.1.2
            _smartPhone1.phone(); //電話をかける
            
            //iPhone
            var _smartPhone2: SmartPhone = new SmartPhone(new iOS10());
            console.log(_smartPhone2.version); //iOS 10.3.2
            _smartPhone2.phone(); //電話をかける
        }
    }
}

class console { //ブラウザのコンソール出力用（console.log()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```
```
//SuperMobile.as

package  {
    public class SuperMobile {
        private var _os: IOS; //橋渡し役
        
        //コンストラクタ
        public function SuperMobile(arg: IOS) {
            _os = arg;
        }
        
        public function get version(): String {
            return _os.version;
        }
    }
}
```
```
//Tablet.as

package  {
    public class Tablet extends SuperMobile {
        //コンストラクタ
        public function Tablet(arg: IOS) {
            super(arg);
        }

        //タブレット特有の機能
        public function bigScreen(): void {
            console.log("大きな画面で見る");
        }
    }
}

class console { //ブラウザのコンソール出力用（console.log()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```
```
//SmartPhone.as

package  {
    public class SmartPhone extends SuperMobile {

        //コンストラクタ
        public function SmartPhone(arg: IOS) {
            super(arg);
        }

        //スマートフォン特有の機能
        public function phone(): void {
            console.log("電話をかける");
        }
    }
}

class console { //ブラウザのコンソール出力用（console.log()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void   {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```
```
//IOS.as

package  {
    public interface IOS {
        function get version(): String;
    }
}
```
```
//Android.as

package  {
    public class Android implements IOS {

        //コンストラクタ
        public function Android() {}

        public function get version(): String {
            return "Android 7.1.2";
        }
    }
}
```
```
//iOS10.as

//クラス名なので本来は大文字から開始すべきですが、インターフェースのだぶるため…
package  {
    public class iOS10 implements IOS { //iOS implements IOS は不可

        //コンストラクタ
        public function iOS10() {}

        public function get version(): String {
            return "iOS 10.3.2";
        }
    }
}
```

実行環境：Ubuntu 16.04 LTS、Apache Flex SDK 4.16、Chromium 58、Flash Player 25  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月22日


<a name="Composite"></a>
# <b><ruby>Composite<rt>コンポジット</rt></ruby></b>

```
//Main.as

package  {
    import flash.display.Sprite;
    public class Main extends Sprite {
        public function Main() {
            //==================
            // ディレクトリの作成
            //==================
            var _root: Sameness = new Directory("root");
            var _adobe: Sameness = new Directory("Adobe");
            var _macromedia: Sameness = new Directory("Macromedia");
            var _flash: Sameness = new Directory("Flash");
            //==================
            // ファイルの作成
            //==================
            var _illustrator: Sameness = new File("Illustrator");
            var _photoshop: Sameness = new File("Photoshop");
            var _dreamweaver: Sameness = new File("Dreamweaver");
            var _flashProfessional: Sameness = new File("Flash Professional");
            var _flashBuilder: Sameness = new File("Flash Builder");
            //==================
            // 関連付け
            //==================
            _root.add(_adobe); //Directoryの追加
            _root.add(_macromedia); //Directoryの追加
            _adobe.add(_illustrator); //Fileの追加
            _adobe.add(_photoshop); //Fileの追加
            _macromedia.add(_flash); //Directoryの追加
            _macromedia.add(_dreamweaver); //Fileの追加
            _flash.add(_flashProfessional); //Fileの追加
            _flash.add(_flashBuilder); //Fileの追加
            
            //==================
            // 検証
            //==================
            //DirectoryやFileの「名前」を調べる
            console.log(_flashProfessional.name); //=> ["Flash Professional"]
            
            //Directoryの中のDirectoryやFileを「削除」する
            _macromedia.remove(_dreamweaver);
            
            //指定した階層のDirectory（ディレクトリ内のDirectory & File）とFileを調べる
            _macromedia.list(); //=> ["Macromedia/Flash(Directory)"] 
            _dreamweaver.list(); //=> ["Macromedia/Dreamweaver(File)"]
        }
    }
}

class console { //ブラウザのコンソール出力用（console.log()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```
```
//Sameness.as

//"同一視"するための役（スーパークラス＝Component）
package  {
    public class Sameness {
        protected var _name: String; //サブクラスで使います
        protected var _parent: Directory; //サブクラスで使います

        //コンストラクタ
        public function Sameness() {}

        public function get name(): String {
            return _name;
        }

        public function add(arg: *): void {
            console.log("追加できません"); //Fileクラス対応
        }

        public function remove(arg: *): void {
            console.log("削除できません");
        }

        public function list(): void { //Linuxのlsコマンド風
            console.log("Error: サブクラスでオーバーライドして下さい");
        }

        public function set parent(directory: Directory): void {
            _parent = directory;
        }

        public function get parent(): Directory {
            return _parent;
        }
    }
}

class console { //ブラウザのコンソール出力用（console.log()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```
```
//Directory.as

//Composit（複合体）の役
package  {
    public class Directory extends Sameness {
        private var _child: Array = new Array();

        //コンストラクタ
        public function Directory(name: String) {
            _name = name;
        }

        override public function add(arg: *): void { //引数はDirectory or File
            _child.push(arg);
            arg.parent = this;
        }

        override public function remove(arg: *): void { //引数はDirectory or File
            var _index: int = _child.indexOf(arg); //検索（なければ-1、あれば位置を返す）
            if (_index != -1) {
                _child.splice(_index,1);
            }
        }

        override public function list(): void { //Linuxのコマンド風
            for each (var _tmp: * in _child) {
                var _result: String = this.name + "/" + _tmp.name;
                if (_tmp is Directory) {
                    _result = _result + "(Directory)";
                } else {
                    _result = _result + "(File)";
                }
                console.log(_result);
            }
        }
    }
}

class console { //ブラウザのコンソール出力用（console.log()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```
```
//File.as

package  {
    public class File extends Sameness {

        //コンストラクタ
        public function File(name: String) {
            _name = name;
        }
        
        override public function list(): void { //Linuxのコマンド風
            console.log(parent.name + "/" + this.name + "(File)");
        }
    }
}

class console { //ブラウザのコンソール出力用（console.log()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

実行環境：Ubuntu 16.04 LTS、Apache Flex SDK 4.16、Chromium 58、Flash Player 25  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月22日


<a name="Decorator"></a>
# <b><ruby>Decorator<rt>デコレータ</rt></ruby></b>

```
//Main.as

package  {
    import flash.display.Sprite; 	
    public class Main extends Sprite {
        public function Main() {
            var _original: Display = new Original("TAKASHI");
            console.log(_original.show()); // TAKASHI
            
            var _decorator1: Display = new Decorator1(_original);
            console.log(_decorator1.show()); // -TAKASHI-
            
            var _decorator2: Display = new Decorator2(_original);
            console.log(_decorator2.show()); // <TAKASHI>
        
            var _special: Display = new Decorator2(
                                        new Decorator1(
                                            new Decorator1(
                                                new Decorator1(
                                                    new Original("TAKASHI")))));
            console.log(_special.show()); // <---TAKASHI--->
        }
    }
}

class console { //ブラウザのコンソール出力用（console.log()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```
```
//Display.as

package  {
    public class Display {
        protected var _content: String; //同じクラス or サブクラスでアクセス可能

        //コンストラクタ
        public function Display() {}

        //finalでサブクラスでのオーバーライドを禁止
        public final function show(): String {
            return _content;
        }
    }
}
```
```
//Original.as

package  {
    public class Original extends Display { //Displayクラスを継承
        public function Original(arg: String) {
            _content = arg;
        }
    }
}
```
```
//Decorator1.as

package  {
    public class Decorator1 extends Display { //Displayクラスを継承
        public function Decorator1(arg:Display) { //コンストラクタ
            _content = "-" + arg.show() + "-";
        }
    }
}
```
```
//Decorator2.as

package  {
    public class Decorator2 extends Display { //Displayクラスを継承
        public function Decorator2(arg:Display) { //コンストラクタ
            _content = "<" + arg.show() + ">";
        }
    }	
}
```

実行環境：Ubuntu 16.04 LTS、Apache Flex SDK 4.16、Chromium 58、Flash Player 25  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月23日


<a name="Facade"></a>
# <b><ruby>Facade<rt>ファサード</rt></ruby></b>

```
//Main.as（Decoratorパターンと異なる）

package  {
    import flash.display.Sprite;
    public class Main extends Sprite {
        public function Main() {
            console.log(DecoratorFacade.exec("TAKASHI", 5, 2)); // <<-----TAKASHI----->>
            console.log(DecoratorFacade.exec("TAKASHI")); // TAKASHI
            console.log(DecoratorFacade.exec("TAKASHI", 0, 1)); // <TAKASHI>
            console.log(DecoratorFacade.exec("TAKASHI", 1, 0)); // -TAKASHI-
        }
    }
}

class console { //ブラウザのコンソール出力用（console.log()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```
```
//DecoratorFacade.as（Decoratorパターンに追加）

package  {
    public class DecoratorFacade { //窓口（Facade）役
        //Singletonパターン用
        private static var _decoratorFacade:DecoratorFacade;

        //コンストラクタ
        public function DecoratorFacade(arg:Lock) {}

        //arg1:オリジナルの文字
        //arg2:Decorator1クラスを施す回数
        //arg3:Decorator2クラスを施す回数
        public static function exec(arg1: String, 
                                    arg2: uint=0, 
                                    arg3: uint=0):String {
            //Singletonパターン用
            if (_decoratorFacade == null) { 
                _decoratorFacade = new DecoratorFacade(new Lock()); 
            }
            var _result:Display = new Original(arg1);
            for (var _i:uint=0; _i<arg2; _i++) {
                _result = new Decorator1(_result);
            }
            for (var _j:uint=0; _j<arg3; _j++) {
                _result = new Decorator2(_result);
            }
            
            return _result.show();
        }
    }
}

internal class Lock {} //Singletonパターン用
```
```
//Display.as（Decoratorパターンと全く同じ）

package  {
    public class Display {
        protected var _content: String; //同じクラス or サブクラスでアクセス可能

        //コンストラクタ
        public function Display() {}

        //finalでサブクラスでのオーバーライドを禁止
        public final function show(): String {
            return _content;
        }
    }
}
```
```
//Original.as（Decoratorパターンと全く同じ）

package  {
    public class Original extends Display { //Displayクラスを継承
        public function Original(arg: String) {
            _content = arg;
        }
    }
}
```
```
//Decorator1.as（Decoratorパターンと全く同じ）

package  {
    public class Decorator1 extends Display { //Displayクラスを継承
        public function Decorator1(arg:Display) { //コンストラクタ
            _content = "-" + arg.show() + "-";
        }
    }
}
```
```
//Decorator2.as（Decoratorパターンと全く同じ）

package  {
    public class Decorator2 extends Display { //Displayクラスを継承
        public function Decorator2(arg:Display) { //コンストラクタ
            _content = "<" + arg.show() + ">";
        }
    }	
}
```

実行環境：Ubuntu 16.04 LTS、Apache Flex SDK 4.16、Chromium 58、Flash Player 25  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月23日


<a name="Flyweight"></a>
# <b><ruby>Flyweight<rt>フライウエイト</rt></ruby></b>

```
//Main.as

package  {
    import flash.display.Sprite;
    import flash.utils.Timer;
    import flash.events.TimerEvent;

    public class Main extends Sprite {
        private var _a: Flyweight, _ka: Flyweight;

        public function Main() {
            var _flyweightFactory: FlyweightFactory = FlyweightFactory.getInstance();
            _a = _flyweightFactory.getFlyweight("a");
            _ka = _flyweightFactory.getFlyweight("ka");
            _a = _flyweightFactory.getFlyweight("a"); // aは既存です
            
            //console.log(_a.text); //このタイミングでは、外部テキストデータがロードされていない
            
            //while文 + getTimer() では、処理を奪われてしまいダウンロードできず
            var _timer: Timer = new Timer(500,1); //0.5秒後に値を取得
            _timer.addEventListener(TimerEvent.TIMER, timer_timer);
            _timer.start();
        }
        
        private function timer_timer(e: TimerEvent): void {
            console.log(_a.text); //あいうえお
            console.log(_ka.text); //かきくけこ
        }
    }
}

class console { //ブラウザのコンソール出力用（console.log()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```
```
//FlyweightFactory.as

package  {
    public class FlyweightFactory {
        //Singletonパターン用
        private static var _flyweightFactory:FlyweightFactory;

        //_poolに管理されるFlyweightオブジェクトは、ガベージコレクションされません
        //明示的にdeleteする必要有り
        private var _pool:Object = new Object();

        //コンストラクタ
        public function FlyweightFactory(arg:Lock) {}

        //Singletonパターン用
        public static function getInstance():FlyweightFactory { 
            if (_flyweightFactory == null) {
                _flyweightFactory = new FlyweightFactory(new Lock());
            }
            return _flyweightFactory;
        }

        //既存ならそのインスタンスを使い、無い場合は新規作成
        public function getFlyweight(arg:String):Flyweight {
            //プールにインスタンスが無ければ、Flyweightインスタンス生成しプール
            if (_pool[arg] == undefined) {
                _pool[arg] = new Flyweight(arg);
            } else {
                console.log(arg + "は既存です");
            }
            return _pool[arg];
        }
    }
}

internal class Lock { } //Singletonパターン用

class console { //ブラウザのコンソール出力用（console.log()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```
```
//Flyweight.as

package  {
    import flash.net.URLLoader;
    import flash.net.URLRequest;
    import flash.events.Event;

    public class Flyweight {
        private var _text:String;

        public function Flyweight(arg:String) {
            var _urlLoader:URLLoader = new URLLoader();
            _urlLoader.addEventListener(Event.COMPLETE, complete_urlLoader);
            _urlLoader.load(new URLRequest(arg + ".txt")); //読み込む外部ファイルの指定
        }

        private function complete_urlLoader(e:Event):void {
            _text = e.target.data;
        }

        public function get text():String {
            return _text;
        }
    }
}
```

実行環境：Ubuntu 16.04 LTS、Apache Flex SDK 4.16、Chromium 58、Flash Player 25  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月23日


<a name="Proxy"></a>
# <b><ruby>Proxy<rt>プロキシー</rt></ruby></b>

```
//Main.as

package  {
    import flash.display.MovieClip;
    public class Main extends MovieClip {
        public function Main() {
            var _loader: Loader = new Loader("http://sample.mp4");
            //通常は必要になった時、実際に画像（実際の本人）をロード
            _loader.load(); //=> "重い処理を実行中"
        }
    }
}
```
```
//Loader.as（代理人＝Proxy役）

package  {
    public class Loader {
        private var _url: String;
        public function Loader(_url: String) {
            this._url = _url;
        }
        public function load(): void {
            //実際の本人登場（代理人は実際の本人を知っている）
            var _content: Content = new Content(_url);
            _content.load();
        }
    }
}
```
```
//Content.as（実際の本人＝Real Subject役）

package  {
    public class Content {
        private var _url: String;

        public function Content(_url: String) {
            this._url = _url;
        }
        public function load():void { //重い処理をここで行う
            // 今回のサンプルの中身はあまり重要ではない...
            console.log("重い処理を実行中");
        }
    }
}

class console { //ブラウザのコンソール出力用（console.log()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

実行環境：Ubuntu 16.04 LTS、Apache Flex SDK 4.16、Chromium 58、Flash Player 25  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月23日


<a name="Iterator"></a>
# <b><ruby>Iterator<rt>イテレータ</rt></ruby></b>

```
//Main.as

package  {
    import flash.display.Sprite;
    public class Main extends Sprite {
        public function Main() {
            var _carPark:CarPark = new CarPark();
            _carPark.add(new Car("NISSAN GT-R", "品川300 し 35-00"));
            _carPark.add(new Car("BMW mini", "品川300 ぬ 32-32"));
            _carPark.add(new Car("TOYOTA 2000GT", "練馬501 の 50-34"));
            var _carParkIterator: IIterator = _carPark.createIterator(); //イテレータを生成
            
            while(_carParkIterator.hasNext()) {
                var _nextCar: Car = _carParkIterator.next();
                console.log(_nextCar.name, _nextCar.num);
            }
        }
    }
}

class console { //ブラウザのコンソール出力用（console.log()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```
```
//Car.as

package  {
    public class Car {
        private var _name: String, _num: String;

        //コンストラクタ
        public function Car(_name: String, _num: String) {
            this._name = _name;
            this._num = _num;
        }

        public function get name(): String {
            return _name;
        }

        public function get num(): String {
            return _num;
        }
    }
}
```
```
//ICarPark.as

package  {
    public interface ICarPark {
        function add(theElement: Object): void;
        function getElementAt(index: uint): Object;
        function getLength(): uint;
        function createIterator(): IIterator;
    }
}
```
```
//CarPark.as

package  {
    public class CarPark implements ICarPark {
        private var _list: Array = [];

        public function CarPark() {}

        public function add(theElement: Object): void {
            _list.push(theElement);
        }

        public function getElementAt(index: uint): Object {
            return _list[index];
        }

        public function getLength(): uint {
            return _list.length;
        }

        public function createIterator(): IIterator {
            return new Iterator(this);
        }
    }
}
```
```
//IIterator.as

package  {
    public interface IIterator {
        function hasNext(): Boolean;
        function next(): Car;
    }
}
```
```
//Iterator.as

package  {
    public class Iterator implements IIterator {
        private var _object: Object, _count: uint = 0;
        
        public function Iterator(_object: Object) { 
            this._object = _object;
        }

        public function hasNext(): Boolean {
            return _object.getLength() > _count;
        }

        public function next(): Car {
            return _object.getElementAt(_count++); //次の車を返します
        }
    }
}
```

実行環境：Ubuntu 16.04 LTS、Apache Flex SDK 4.16、Chromium 58、Flash Player 25  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月23日


<a name="TemplateMethod"></a>
# <b><ruby>Template Method<rt>テンプレート メソッド</rt></ruby></b>

### 概要
* abstract 修飾子が存在せず、抽象メソッドを確実に実装する方法がない
* 次の３つの方法を使って擬似的に実装する
    1. エラー処理（throw new Error...）の記述（ここでは console.log()）
    1. 抽象クラスを継承したサブクラスで、抽象メソッドをオーバーライドして具体的処理を記述
    1. サブクラスによってオーバーライドさせたなくないメソッドは final キーワードを使用

### 例文
```
//Main.as

package  {
    import flash.display.Sprite;
    public class Main extends Sprite {
        public function Main() {
            var _newYearCard_Ichiro: NewYearCard_Ichiro = new NewYearCard_Ichiro();
            _newYearCard_Ichiro.templateMethod();
            /*
            HAPPY NEW YEAR!
            野球がんばろうね！
            */
            
            var _newYearCard_Hanako: NewYearCard_Hanako = new NewYearCard_Hanako();
            _newYearCard_Hanako.templateMethod();
            /*
            HAPPY NEW YEAR!
            本年も宜しくお願い致します。
            今度みんなで集まろう！
            */
        }
    }
}

class console { //ブラウザのコンソール出力用（console.log()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```
```
//Abstract.as

package  {
    public class Abstract {
        public function Abstract() {} //コンストラクタ

        public final function templateMethod():void { //finalでサブクラスでのオーバーライド禁止
            order1(); //共通の処理
            if (isAdult()) { //フックメソッド
                order2(); //条件により実行
            }
            order3(); //サブクラスでオーバーライドして具体的処理を行う
        }

        //共通の処理
        private function order1():void {
            console.log("HAPPY NEW YEAR!");
        }

        //フックメソッド実際はサブクラスでオーバーライドして定義（オプション）
        protected function isAdult():Boolean { //protectedで同じクラスorサブクラスからのみアクセス可
            return true; //今回は初期値を設定
        }

        private function order2():void { //条件により実行
            console.log("本年も宜しくお願い致します");
        }

        //必ずサブクラスでオーバーライドして定義しなければなりません
        protected function order3():void {
            console.log("Error: サブクラスでオーバーライドして定義して下さい");
        }
    }
}

class console { //ブラウザのコンソール出力用（console.log()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```
```
//NewYearCard_Ichiro.as

package  {
    public class NewYearCard_Ichiro extends Abstract { //スーパークラスを継承

        //コンストラクタ
        public function NewYearCard_Ichiro() {}

        //フックメソッドの実際の定義（オプション）
        protected override function isAdult(): Boolean {
            return false;
        }

        //抽象クラス（Abstract）の抽象メソッドをオーバーライドして具体的に記述（必須）
        protected override function order3(): void {
            console.log("野球がんばろうね！");
        }
    }
}

class console { //ブラウザのコンソール出力用（console.log()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```
```
//NewYearCard_Hanako.as

package  {
    public class NewYearCard_Hanako extends Abstract { //スーパークラスを継承

        //コンストラクタ
        public function NewYearCard_Hanako() {}

        //抽象クラス（Abstract）の抽象メソッドをオーバーライドして具体的に記述（必須）
        protected override function order3():void {
            console.log("今度みんなで集まろう！");
        }
    }
}

class console { //ブラウザのコンソール出力用（console.log()の代替）
    import flash.external.ExternalInterface;
    public static function log(...args: Array): void {
        ExternalInterface.call("function(args){ console.log(args);}", args);
    }
}
```

実行環境：Ubuntu 16.04 LTS、Apache Flex SDK 4.16、Chromium 58、Flash Player 25  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月23日


<a name="Strategy"></a>
# <b><ruby>Strategy<rt>ストラテジー</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04 LTS、Apache Flex SDK 4.16、Chromium 58、Flash Player 25  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月XX日


<a name="Visitor"></a>
# <b><ruby>Visitor<rt>ビジター</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04 LTS、Apache Flex SDK 4.16、Chromium 58、Flash Player 25  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月XX日


<a name="ChainofResponsibility"></a>
# <b><ruby>Chain of Responsibility<rt>チェーン オブ レスポンシビリティ</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04 LTS、Apache Flex SDK 4.16、Chromium 58、Flash Player 25  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月XX日


<a name="Mediator"></a>
# <b><ruby>Mediator<rt>メディエイター</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04 LTS、Apache Flex SDK 4.16、Chromium 58、Flash Player 25  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月XX日


<a name="Observer"></a>
# <b><ruby>Observer<rt>オブザーバ</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04 LTS、Apache Flex SDK 4.16、Chromium 58、Flash Player 25  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月XX日


<a name="Memento"></a>
# <b><ruby>Memento<rt>メメント</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04 LTS、Apache Flex SDK 4.16、Chromium 58、Flash Player 25  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月XX日


<a name="State"></a>
# <b><ruby>State<rt>ステート</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04 LTS、Apache Flex SDK 4.16、Chromium 58、Flash Player 25  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月XX日


<a name="Command"></a>
# <b><ruby>Command<rt>コマンド</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04 LTS、Apache Flex SDK 4.16、Chromium 58、Flash Player 25  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月XX日


<a name="Interpreter"></a>
# <b><ruby>Interpreter<rt>インタプリタ</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04 LTS、Apache Flex SDK 4.16、Chromium 58、Flash Player 25  
作成者：Takashi Nishimura  
作成日：2013年  
更新日：2017年05月XX日
