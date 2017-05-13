### <b>この項目は書きかけの項目です</b>

# <b>Java デザインパターン</b>

### <b>INDEX</b>

* オブジェクトの「生成」に関するパターン
    * [<ruby>Singleton<rt>シングルトン</rt></ruby>](#Singleton) : たった１つのインスタンス
    * [<ruby>Prototype<rt>プロトタイプ</rt></ruby>](#Prototype) : コピーしてインスタンスを作
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

```
//Main.java

public class Main {
    public static void main(String[] args) {
        Singleton _singleton1 = Singleton.getInstance(); //唯一のインスタンスを呼出す
        Singleton _singleton2 = Singleton.getInstance(); //唯一のインスタンスを呼出す
        System.out.println(_singleton1 == _singleton2); //true ←同じインスタンス
    }
}

class Singleton {
    private static Singleton _singleton = new Singleton(); //唯一のインスタンスの生成
    private Singleton() { //コンストラクタ
        System.out.println("インスタンスを生成しました");
    }
    public static Singleton getInstance() {
        return _singleton;
    }
}
```

実行環境：Ubuntu 16.04.2 LTS、Java Standard Edition 8 Update 121  
作成者：Takashi Nishimura  
作成日：2016年07月20日  
更新日：2017年05月13日


<a name="Prototype"></a>
# <b><ruby>Prototype<rt>プロトタイプ</rt></ruby></b>

```
//Main.java

public class Main {
    public static void main(String[] args) {
        Prototype _prototype = new Prototype("Nishimura");
        _prototype.setFirstName("Ichiro");
        _prototype.setAge(5);

        Prototype _prototype2 = _prototype.clone();
        _prototype2.setFirstName("Hanako");
        _prototype2.setAge(1);

        //検証（コピー元）
        System.out.println(_prototype.getFirstName()); //=> "Ichiro"
        System.out.println(_prototype.getLastName()); //=> "Nishimura"
        System.out.println(_prototype.getAge()); //=> 5

        //検証（複製したもの）
        System.out.println(_prototype2.getFirstName()); //=> "Hanako"
        System.out.println(_prototype2.getLastName()); //=> "Nishimura"
        System.out.println(_prototype2.getAge()); //=> 1
    }
}

interface IPrototype { //インターフェースの宣言
    Prototype clone();
    String getLastName();
    void setFirstName(String _firstName);
    String getFirstName();
    void setAge(int _age);
    int getAge();
}

class Prototype implements IPrototype {
    //メンバ変数（private）
    private String _firstName, _lastName;
    private int _age; 

    //コンストラクタ
    public Prototype(String _lastName) {
        this._lastName = _lastName;
    }

    public Prototype clone() {
        Prototype _copy = new Prototype(_lastName); //自分自身を生成
        _copy.setFirstName(_firstName); //メンバ変数を複製
        _copy.setAge(_age); //メンバ変数を複製
        return _copy; //ポインタが使えるC++なら「*this」が使えますが...
        //↑全てのメンバ変数を複製したインスタンスを返す
    }

    //_lastNameのアクセサ（読取専用）
    public String getLastName() {
        return _lastName;
    }

    //_firstNameのアクセサ
    public void setFirstName(String _firstName) {
        this._firstName = _firstName;
    }
    public String getFirstName() {
        return _firstName;
    }

    //age_のアセクサ
    public void setAge(int _age) {
        this._age = _age;
    }
    public int getAge() {
        return _age;
    }
}
```

実行環境：Ubuntu 16.04.2 LTS、Java Standard Edition 8 Update 121  
作成者：Takashi Nishimura  
作成日：2016年07月20日  
更新日：2017年05月13日


<a name="Builder"></a>
# <b><ruby>Builder<rt>ビルダー</rt></ruby></b>

```
//Main.java

public class Main {
    public static void main(String[] args) {
        Director _directorA = new Director(new BuilderA());
        _directorA.construct(); //共通の手順を実行
        //=> HAPPY NEW YEAR!
        //=> ○○○○○○○
        //=> 2018.1.1

        Director _directorB = new Director(new BuilderB());
        _directorB.construct(); //共通の手順を実行
        //=> あけましておめでとうございます
        //=> □□□□□□□
        //=> 元旦
    }
}

// Director(年賀状の印刷業者)
class Director {
    private IBuilder _builder; //←Builder○クラスのインスタンスを格納（委譲）
    public Director(IBuilder _builder) { //←コンストラクタ
        this._builder = _builder;
    }
    public void construct() { //共通の手順
        _builder.makeHeader(); //手順①
        _builder.makeContent(); //手順②
        _builder.makeFooter(); //手順③
    }
}

// Builder○のインターフェース
interface IBuilder {
    void makeHeader(); //暗黙的にpublicになる
    void makeContent();
    void makeFooter();
}

// BuilderA(タイプＡの年賀状)
class BuilderA implements IBuilder {
    public void makeHeader() {
        System.out.println("HAPPY NEW YEAR!");
    }
    public void makeContent() {
        System.out.println("○○○○○○○");
    }
    public void makeFooter() {
        System.out.println("2018.1.1");
    }
}

// BuilderB(タイプＢの年賀状)
class BuilderB implements IBuilder {
    public void makeHeader() {
        System.out.println("あけましておめでとうございます");
    }
    public void makeContent() {
        System.out.println("□□□□□□□");
    }
    public void makeFooter() {
        System.out.println("元旦");
    }
}
```

実行環境：Ubuntu 16.04.2 LTS、Java Standard Edition 8 Update 121  
作成者：Takashi Nishimura  
作成日：2016年07月20日  
更新日：2017年05月13日


<a name="FactoryMethod"></a>
# <b><ruby>Factory Method<rt>ファクトリー メソッド</rt></ruby></b>

```
//Main.java

//============
//メインクラス
//============
public class Main {
    public static void main(String[] args) {
        CardIchiro _cardIchiro = new CardIchiro();
        _cardIchiro.templateMethod("teacher");
        /*
        謹賀新年
        〒XXX-XXXX 品川区XX町X-XX-XX
        西村一郎
        */
        _cardIchiro.templateMethod("friend");
        /*
        HAPPY NEW YEAR!
        〒XXX-XXXX 品川区XX町X-XX-XX
        西村一郎
        */
        CardHanako _cardHanako = new CardHanako();
        _cardHanako.templateMethod("teacher");
        /*
        明けましておめでとうございます
        〒XXX-XXXX 品川区XX町X-XX-XX
        西村花子
        */
        _cardHanako.templateMethod("friend");
        /*
        あけましておめでとう
        〒XXX-XXXX 品川区XX町X-XX-XX
        西村花子
        */
    }
}

//============
//抽象クラス
//============
abstract class AbstractCard {
    public void templateMethod(String _arg) { //このメソッドはオーバーライドしない
        //↓ここでnewと記述しない!（条件分岐は派生クラスで行う＝ここを汚さない)
        IMessage _factoryMethod = factoryMethod(_arg);
        _factoryMethod.exec(); //処理①
        order1(); //処理②
        order2(); //処理③
    }
    abstract protected IMessage factoryMethod(String _arg); //サブクラスでオーバーライド
    public void order1() { //共通の処理
        System.out.println("〒XXX-XXXX 品川区XX町X-XX-XX");
    }
    abstract protected void order2(); //サブクラスでオーバーライド
}

//===============================
//サブクラス群（抽象クラスを継承）
//===============================
class CardIchiro extends AbstractCard {
    protected IMessage factoryMethod(String _arg) { //具体的処理を記述
        if (_arg == "teacher") {
            return new Message1(); //ここでnewを記述!
        } else if (_arg == "friend") {
            return new Message2(); //ここでnewを記述!
        } else {
            System.out.println("Error: CardIchiro.factoryMethod()");
            return null; //必須
        }
    }
    protected void order2() {
        System.out.println("西村一郎");
    }
}

class CardHanako extends AbstractCard {
    protected IMessage factoryMethod(String _arg) { //具体的処理を記述
        if (_arg == "teacher") {
            return new Message3(); //ここでnewを記述!
        } else if (_arg == "friend") {
            return new Message4(); //ここでnewを記述!
        } else {
            System.out.println("Error: CardHanako.factoryMethod()");
            return null; //必須
        }
    }
    protected void order2() {
        System.out.println("西村花子");
    }
}

//==================
//生成したいクラス群
//==================
interface IMessage { //インターフェース宣言
    void exec(); //共通のメソッド
}
class Message1 implements IMessage {
    public void exec() { 
        System.out.println("謹賀新年"); 
    }
}
class Message2 implements IMessage {
    public void exec() { 
        System.out.println("HAPPY NEW YEAR!");
    }
}
class Message3 implements IMessage {
    public void exec() {
        System.out.println("明けましておめでとうございます"); 
    }
}
class Message4 implements IMessage {
    public void exec() { 
        System.out.println("あけましておめでとう"); 
    }
}
```

実行環境：Ubuntu 16.04.2 LTS、Java Standard Edition 8 Update 121  
作成者：Takashi Nishimura  
作成日：2016年07月20日  
更新日：2017年05月13日


<a name="AbstractFactory"></a>
# <b><ruby>Abstract Factory<rt>アブストラクト ファクトリー</rt></ruby></b>

```
//Main.java

public class Main {
    public static void main(String[] args) {
        AbstractFactory _factoryICHIRO = AbstractFactory.createFactory("ICHIRO");
        _factoryICHIRO.createNewYear();
        /*
        HAPPY NEW YEAR!
        ICHIRO NISHIMURA
        */
        _factoryICHIRO.createSummer();
        /*
        暑中お見舞い申し上げます
        西村一郎
        */

        AbstractFactory _factoryHANAKO = AbstractFactory.createFactory("HANAKO");
        _factoryHANAKO.createNewYear();
        /*
        明けましておめでとうございます
        西村花子
        */
        _factoryHANAKO.createSummer();
        /*
        暑中おみまいもうしあげます
        西村一郎
        */
    }
}
//=====================================
//抽象クラス（抽象的な工場）
//=====================================
abstract class AbstractFactory {
    public static AbstractFactory createFactory(String _name) {
        if (_name == "ICHIRO") {
            return new ICHIRO(); //←具体的な「亨工場」を生成
        } else if (_name == "HANAKO") {
            return new HANAKO(); //←具体的な「幸子工場」を生成
        } else {
            return null; //必須
        }
    }
    abstract public void createNewYear(); //抽象メソッド宣言（サブクラスでオーバーライド）
    abstract public void createSummer(); //抽象メソッド宣言（サブクラスでオーバーライド）
}

//=====================================
//サブクラス群（実際の工場）
//=====================================
class ICHIRO extends AbstractFactory { //←抽象クラスを継承
    public void createNewYear(){ //←オーバーライドして具体的処理を記述
        System.out.println("HAPPY NEW YEAR!");
        System.out.println("ICHIRO NISHIMURA");
    }
    public void createSummer() { //←オーバーライドして具体的処理を記述
        System.out.println("暑中お見舞い申し上げます");
        System.out.println("西村一郎");
    }
}

class HANAKO extends AbstractFactory { //←抽象クラスを継承
    public void createNewYear() { //←オーバーライドして具体的処理を記述
        System.out.println("明けましておめでとうございます");
        System.out.println("西村花子");
    }
    public void createSummer() { //←オーバーライドして具体的処理を記述
        System.out.println("暑中おみまいもうしあげます");
        System.out.println("西村一郎");
    }
}
```

実行環境：Ubuntu 16.04.2 LTS、Java Standard Edition 8 Update 121  
作成者：Takashi Nishimura  
作成日：2016年07月20日  
更新日：2017年05月13日


<a name="Adapter（継承）"></a>
# <b><ruby>Adapter<rt>アダプター</rt></ruby>（継承）</b>

```
//Main.java

//メインクラス
public class Main {
    public static void main(String[] args) {
        Exchange _exchange = new Exchange(10000, 113.378685);
        _exchange.addYen(8000);
        System.out.println(_exchange.getDollar()); //158.759999730108（ドル）
    }
}

//スーパークラス
class Moneybox {
    private int _yen;
    public Moneybox(int _yen) { //コンストラクタ
        this._yen = _yen;
    }
    public void add(int _yen) {
        this._yen += _yen;
    }
    public int getYen() {
        return _yen;
    }
}

interface IExchange { //インターフェース
    void addYen(int _yen);
    double getDollar();
}

//継承+インターフェースの実装
class Exchange extends Moneybox implements IExchange {
    private double _rate;
    public Exchange(int firstYen_, double _rate) { //コンストラクタ
        //Javaの仕様で明示的にスーパークラスのコンストラクタを呼び出さないと
        //自動的に引数なしのコンストラクタ「super()」を実行してしまうの注意!!
        super(firstYen_);
        this._rate = _rate;
    }
    public void addYen(int _yen) { add(_yen); } //←add()は継承したメソッド
    public double getDollar() { return getYen() / _rate; } //←getYen()は継承したメソッド
}
```

実行環境：Ubuntu 16.04.2 LTS、Java Standard Edition 8 Update 121  
作成者：Takashi Nishimura  
作成日：2016年07月21日  
更新日：2017年05月13日


<a name="Adapter（委譲）"></a>
# <b><ruby>Adapter<rt>アダプター</rt></ruby>（委譲）</b>

XXXX

実行環境：Ubuntu 16.04.2 LTS、Java Standard Edition 8 Update 121  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="Bridge"></a>
# <b><ruby>Bridge<rt>ブリッジ</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04.2 LTS、Java Standard Edition 8 Update 121  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="Composite"></a>
# <b><ruby>Composite<rt>コンポジット</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04.2 LTS、Java Standard Edition 8 Update 121  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="Decorator"></a>
# <b><ruby>Decorator<rt>デコレータ</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04.2 LTS、Java Standard Edition 8 Update 121  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="Facade"></a>
# <b><ruby>Facade<rt>ファサード</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04.2 LTS、Java Standard Edition 8 Update 121  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="Flyweight"></a>
# <b><ruby>Flyweight<rt>フライウエイト</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04.2 LTS、Java Standard Edition 8 Update 121  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="Proxy"></a>
# <b><ruby>Proxy<rt>プロキシー</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04.2 LTS、Java Standard Edition 8 Update 121  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="Iterator"></a>
# <b><ruby>Iterator<rt>イテレータ</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04.2 LTS、Java Standard Edition 8 Update 121  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="TemplateMethod"></a>
# <b><ruby>Template Method<rt>テンプレート メソッド</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04.2 LTS、Java Standard Edition 8 Update 121  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="Strategy"></a>
# <b><ruby>Strategy<rt>ストラテジー</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04.2 LTS、Java Standard Edition 8 Update 121  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="Visitor"></a>
# <b><ruby>Visitor<rt>ビジター</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04.2 LTS、Java Standard Edition 8 Update 121  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="ChainofResponsibility"></a>
# <b><ruby>Chain of Responsibility<rt>チェーン オブ レスポンシビリティ</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04.2 LTS、Java Standard Edition 8 Update 121  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="Mediator"></a>
# <b><ruby>Mediator<rt>メディエイター</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04.2 LTS、Java Standard Edition 8 Update 121  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="Observer"></a>
# <b><ruby>Observer<rt>オブザーバ</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04.2 LTS、Java Standard Edition 8 Update 121  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="Memento"></a>
# <b><ruby>Memento<rt>メメント</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04.2 LTS、Java Standard Edition 8 Update 121  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="State"></a>
# <b><ruby>State<rt>ステート</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04.2 LTS、Java Standard Edition 8 Update 121  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="Command"></a>
# <b><ruby>Command<rt>コマンド</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04.2 LTS、Java Standard Edition 8 Update 121  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="Interpreter"></a>
# <b><ruby>Interpreter<rt>インタプリタ</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04.2 LTS、Java Standard Edition 8 Update 121  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日