### <b>この項目は書きかけの項目です</b>

# <b>ActionScript 3.0 デザインパターン</b>

### <b>INDEX</b>

* オブジェクトの「生成」に関するパターン
    * [<ruby>Singleton<rt>シングルトン</rt></ruby>](#Singleton) : たった１つのインスタンス
    * [<ruby>Prototype<rt>プロトタイプ</rt></ruby>](#Prototype) : コピーしてインスタンスを作る
    ***
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
作成日：2017年05月16日  


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
            var _prototype1:Prototype = new Prototype();
            _prototype1.firstName = "Takashi";
            _prototype1.lastName = "Nishimura"
            _prototype1.address = "X-XX-XX XXX, Shinjuku-ku";

            //==============
            // コピーを作成
            //==============
            var _prototype2:Prototype = _prototype1.clone();
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
        function clone():*; //実装するクラス名が不明なので「*」とする
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

        public function clone():* {
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
作成日：2017年05月17日  


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
        private var _builder:IBuilder;

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
        function makeHeader():void;
        function makeContent():void;
        function makeFooter():void;
    }
}
```
```
//NewYearCardBuilder.as

package  {
    public class NewYearCardBuilder implements IBuilder {
        public function NewYearCardBuilder() {} //コンストラクタ
        public function makeHeader():void { console.log("明けましておめでとうございます"); }
        public function makeContent():void { console.log("干支のイラスト"); }
        public function makeFooter():void { console.log("元旦"); }
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
        public function makeHeader():void { console.log("暑中お見舞い申し上げます"); }
        public function makeContent():void { console.log("スイカのイラスト"); }
        public function makeFooter():void { console.log("盛夏"); }
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
作成日：2017年05月17日  


<a name="FactoryMethod"></a>
# <b><ruby>Factory Method<rt>ファクトリー メソッド</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04 LTS、Apache Flex SDK 4.16、Chromium 58、Flash Player 25  
作成者：Takashi Nishimura  
作成日：2017年05月XX日  


<a name="AbstractFactory"></a>
# <b><ruby>Abstract Factory<rt>アブストラクト ファクトリー</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04 LTS、Apache Flex SDK 4.16、Chromium 58、Flash Player 25  
作成者：Takashi Nishimura  
作成日：2017年05月XX日  


<a name="Adapter（継承）"></a>
# <b><ruby>Adapter<rt>アダプター</rt></ruby>（継承）</b>

XXXX

実行環境：Ubuntu 16.04 LTS、Apache Flex SDK 4.16、Chromium 58、Flash Player 25  
作成者：Takashi Nishimura  
作成日：2017年05月XX日  


<a name="Adapter（委譲）"></a>
# <b><ruby>Adapter<rt>アダプター</rt></ruby>（委譲）</b>

XXXX

実行環境：Ubuntu 16.04 LTS、Apache Flex SDK 4.16、Chromium 58、Flash Player 25  
作成者：Takashi Nishimura  
作成日：2017年05月XX日  


<a name="Bridge"></a>
# <b><ruby>Bridge<rt>ブリッジ</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04 LTS、Apache Flex SDK 4.16、Chromium 58、Flash Player 25  
作成者：Takashi Nishimura  
作成日：2017年05月XX日  


<a name="Composite"></a>
# <b><ruby>Composite<rt>コンポジット</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04 LTS、Apache Flex SDK 4.16、Chromium 58、Flash Player 25  
作成者：Takashi Nishimura  
作成日：2017年05月XX日  


<a name="Decorator"></a>
# <b><ruby>Decorator<rt>デコレータ</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04 LTS、Apache Flex SDK 4.16、Chromium 58、Flash Player 25  
作成者：Takashi Nishimura  
作成日：2017年05月XX日  


<a name="Facade"></a>
# <b><ruby>Facade<rt>ファサード</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04 LTS、Apache Flex SDK 4.16、Chromium 58、Flash Player 25  
作成者：Takashi Nishimura  
作成日：2017年05月XX日  


<a name="Flyweight"></a>
# <b><ruby>Flyweight<rt>フライウエイト</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04 LTS、Apache Flex SDK 4.16、Chromium 58、Flash Player 25  
作成者：Takashi Nishimura  
作成日：2017年05月XX日  


<a name="Proxy"></a>
# <b><ruby>Proxy<rt>プロキシー</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04 LTS、Apache Flex SDK 4.16、Chromium 58、Flash Player 25  
作成者：Takashi Nishimura  
作成日：2017年05月XX日  


<a name="Iterator"></a>
# <b><ruby>Iterator<rt>イテレータ</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04 LTS、Apache Flex SDK 4.16、Chromium 58、Flash Player 25  
作成者：Takashi Nishimura  
作成日：2017年05月XX日  


<a name="TemplateMethod"></a>
# <b><ruby>Template Method<rt>テンプレート メソッド</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04 LTS、Apache Flex SDK 4.16、Chromium 58、Flash Player 25  
作成者：Takashi Nishimura  
作成日：2017年05月XX日  


<a name="Strategy"></a>
# <b><ruby>Strategy<rt>ストラテジー</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04 LTS、Apache Flex SDK 4.16、Chromium 58、Flash Player 25  
作成者：Takashi Nishimura  
作成日：2017年05月XX日  


<a name="Visitor"></a>
# <b><ruby>Visitor<rt>ビジター</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04 LTS、Apache Flex SDK 4.16、Chromium 58、Flash Player 25  
作成者：Takashi Nishimura  
作成日：2017年05月XX日  


<a name="ChainofResponsibility"></a>
# <b><ruby>Chain of Responsibility<rt>チェーン オブ レスポンシビリティ</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04 LTS、Apache Flex SDK 4.16、Chromium 58、Flash Player 25  
作成者：Takashi Nishimura  
作成日：2017年05月XX日  


<a name="Mediator"></a>
# <b><ruby>Mediator<rt>メディエイター</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04 LTS、Apache Flex SDK 4.16、Chromium 58、Flash Player 25  
作成者：Takashi Nishimura  
作成日：2017年05月XX日  


<a name="Observer"></a>
# <b><ruby>Observer<rt>オブザーバ</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04 LTS、Apache Flex SDK 4.16、Chromium 58、Flash Player 25  
作成者：Takashi Nishimura  
作成日：2017年05月XX日  


<a name="Memento"></a>
# <b><ruby>Memento<rt>メメント</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04 LTS、Apache Flex SDK 4.16、Chromium 58、Flash Player 25  
作成者：Takashi Nishimura  
作成日：2017年05月XX日  


<a name="State"></a>
# <b><ruby>State<rt>ステート</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04 LTS、Apache Flex SDK 4.16、Chromium 58、Flash Player 25  
作成者：Takashi Nishimura  
作成日：2017年05月XX日  


<a name="Command"></a>
# <b><ruby>Command<rt>コマンド</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04 LTS、Apache Flex SDK 4.16、Chromium 58、Flash Player 25  
作成者：Takashi Nishimura  
作成日：2017年05月XX日  


<a name="Interpreter"></a>
# <b><ruby>Interpreter<rt>インタプリタ</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04 LTS、Apache Flex SDK 4.16、Chromium 58、Flash Player 25  
作成者：Takashi Nishimura  
作成日：2017年05月XX日  