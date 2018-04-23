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
作成者：MUBIROU  
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
作成者：MUBIROU  
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
    private IBuilder _builder; //Builder○クラスのインスタンスを格納（委譲）
    public Director(IBuilder _builder) { //コンストラクタ
        this._builder = _builder;
    }
    public void construct() { //共通の手順
        _builder.makeHeader(); //手順①
        _builder.makeContent(); //手順②
        _builder.makeFooter(); //手順③
    }
}

// BuilderXXXのインターフェース
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
作成者：MUBIROU  
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
作成者：MUBIROU  
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
//===========================
//抽象クラス（抽象的な工場）
//===========================
abstract class AbstractFactory {
    public static AbstractFactory createFactory(String _name) {
        if (_name == "ICHIRO") {
            return new ICHIRO(); //具体的な「一郎工場」を生成
        } else if (_name == "HANAKO") {
            return new HANAKO(); //具体的な「花子工場」を生成
        } else {
            return null; //必須
        }
    }
    abstract public void createNewYear(); //抽象メソッド宣言（サブクラスでオーバーライド）
    abstract public void createSummer(); //抽象メソッド宣言（サブクラスでオーバーライド）
}

//===========================
//サブクラス群（実際の工場）
//===========================
class ICHIRO extends AbstractFactory { //抽象クラスを継承
    public void createNewYear(){ //オーバーライドして具体的処理を記述
        System.out.println("HAPPY NEW YEAR!");
        System.out.println("ICHIRO NISHIMURA");
    }
    public void createSummer() { //オーバーライドして具体的処理を記述
        System.out.println("暑中お見舞い申し上げます");
        System.out.println("西村一郎");
    }
}

class HANAKO extends AbstractFactory { //抽象クラスを継承
    public void createNewYear() { //オーバーライドして具体的処理を記述
        System.out.println("明けましておめでとうございます");
        System.out.println("西村花子");
    }
    public void createSummer() { //オーバーライドして具体的処理を記述
        System.out.println("暑中おみまいもうしあげます");
        System.out.println("西村一郎");
    }
}
```

実行環境：Ubuntu 16.04.2 LTS、Java Standard Edition 8 Update 121  
作成者：MUBIROU  
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

//インターフェース
interface IExchange {
    void addYen(int _yen);
    double getDollar();
}

//継承+インターフェースの実装
class Exchange extends Moneybox implements IExchange {
    private double _rate;
    public Exchange(int _firstYen, double _rate) { //コンストラクタ
        //Javaの仕様で明示的にスーパークラスのコンストラクタを呼び出さないと
        //自動的に引数なしのコンストラクタ「super()」を実行してしまうの注意
        super(_firstYen);
        this._rate = _rate;
    }
    public void addYen(int _yen) { add(_yen); } //add()は継承したメソッド
    public double getDollar() { return getYen() / _rate; } //getYen()は継承したメソッド
}
```

実行環境：Ubuntu 16.04.2 LTS、Java Standard Edition 8 Update 121  
作成者：MUBIROU  
作成日：2016年07月21日  
更新日：2017年05月13日


<a name="Adapter（委譲）"></a>
# <b><ruby>Adapter<rt>アダプター</rt></ruby>（委譲）</b>

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

//インターフェース
interface IExchange {
    void addYen(int _yen);
    double getDollar();
}

//サブクラス+インターフェースの実装 ←この内容のみ「継承」版と異なる
class Exchange implements IExchange {
    private Moneybox _moneybox; //Moneyboxクラスのインスタンスを格納（委譲）
    private double _rate;
    public Exchange(int _firstYen, double _rate) { //コンストラクタ
        _moneybox = new Moneybox(_firstYen); //ここがポイント
        this._rate = _rate;
    }
    public void addYen(int _yen) {
        _moneybox.add(_yen); //ポイント
    }
    public double getDollar() {
        return _moneybox.getYen() / _rate; //ポイント
    }
}
```

実行環境：Ubuntu 16.04.2 LTS、Java Standard Edition 8 Update 121  
作成者：MUBIROU  
作成日：2016年07月21日  
更新日：2017年05月13日


<a name="Bridge"></a>
# <b><ruby>Bridge<rt>ブリッジ</rt></ruby></b>

```
//Main.java

//============
//メインクラス
//============
public class Main {
    public static void main(String[] args) {
        Tablet _tablet1 = new Tablet(new Android());
        System.out.println(_tablet1.getVersion()); //=> "Android 7.1.2"
        _tablet1.bigScreen(); //=> "大きな画面で見る"
        
        Tablet _tablet2 = new Tablet(new IOS());
        System.out.println(_tablet2.getVersion()); //=> "iOS 10.3.1"
        
        SmartPhone _smartPhone1 = new SmartPhone(new Android());
        System.out.println(_smartPhone1.getVersion()); //=> "Android 7.1.2"
        _smartPhone1.phone(); //=> "電話をかける"
        
        SmartPhone _smartPhone2 = new SmartPhone(new IOS());
        System.out.println(_smartPhone2.getVersion()); //=> "iOS 10.3.1"
    }
}

//====================
//「機能」のクラス関連
//====================
class SuperMobile {
    private AbstractOS _os; //「機能」クラスと「実装」クラスの「橋」（委譲）
    public SuperMobile(AbstractOS _os) { //コンストラクタ
        this._os = _os;
    }
    //↓「橋」を使って「実装」クラスにアクセス
    public String getVersion() { return _os.getRawVersion(); } //読取専用
}

class Tablet extends SuperMobile { 
    public Tablet(AbstractOS _os) { //コンストラクタ
        super(_os); //親クラスのコンストラクタ呼出し
    }
    public void bigScreen() { //タブレット特有の機能
        System.out.println("大きな画面で見る");
    }
}

class SmartPhone extends SuperMobile {
    public SmartPhone(AbstractOS _os) { //コンストラクタ
        super(_os); //親クラスのコンストラクタ呼出し
    }
    public void phone() { //スマートフォン特有の機能
        System.out.println("電話をかける");
    }
}

//====================
//「実装」のクラス関連
//====================
abstract class AbstractOS { //抽象クラス＝「実装」クラスの最上位
    abstract public String getRawVersion(); //読取専用
}

class Android extends AbstractOS { //「実装」の具体的な実装者
    private String _version = "Android 7.1.2";
    public String getRawVersion() { return _version; } //読取専用
}

class IOS extends AbstractOS { //「実装」の具体的な実装者
    private String _version = "iOS 10.3.1";
    public String getRawVersion() { return _version; } //読取専用
}
```

実行環境：Ubuntu 16.04.2 LTS、Java Standard Edition 8 Update 121  
作成者：MUBIROU  
作成日：2016年07月21日  
更新日：2017年05月13日


<a name="Composite"></a>
# <b><ruby>Composite<rt>コンポジット</rt></ruby></b>

* 以下のサンプルは root に Authoring フォルダを作成し、その中に Unity3D と Unreal Engine ファイルを格納してみます。

```
//Main.java

import java.util.*; //LinkedListに必要

public class Main {
    public static void main(String[] args) {
        //①フォルダの作成
        Folder _root = new Folder("root");
        Folder _authoring = new Folder("Authoring");

        //②ファイルの作成
        File _unity3d = new File("Unity3D");
        File _unrealEngine = new File("Unreal Engine");

        //③関連付け
        _root.add(_authoring); 
        _authoring.add(_unity3d);
        _authoring.add(_unrealEngine);

        //④検証
        System.out.println(_unrealEngine.getName()); //=> "Unreal Engine"
        _root.getList(); //=> "root/Authoring(Folder)"
        _authoring.getList();
        //=> "Authoring/Unity3D(File)"
        //=> "Authoring/Unreal Engine(File)"
        _unity3d.getList(); //=> "Authoring/Unity3D(File)"
    }
}

//抽象クラス（同一視するための役）
abstract class Component {
    //↓共通の機能
    protected String _name;
    protected Folder parent_;
    public String getName() { return _name; }
    public Folder getParent() { return parent_; } //getter
    public void setParent(Folder parent_) { this.parent_ = parent_; } //setter

    //↓抽象メソッドの宣言（処理は派生クラスに記述）
    abstract public void getList();
}

class Folder extends Component {
    private LinkedList<Component> _childList = new LinkedList<>(); //空のリストを作成

    public Folder(String _name) { //コンストラクタ
        this._name = _name; 
    }

    public void add(Component arg) { //Remove()は今回は省略
        _childList.add(arg); //←LinkedList.add()
        arg.setParent(this);
    }

    public void getList() { //オーバーライドして実際の処理を記述
        for (Component tmp : _childList) {
            String _result = this.getName() + "/" + tmp.getName();
            if (tmp instanceof Folder) {
                _result += "(Folder)"; 
            } else if (tmp instanceof File) {
                _result += "(File)";
            }
            System.out.println(_result);
        }
    }
}

class File extends Component {
    public File(String _name) { //コンストラクタ
        this._name = _name;
    }

    public void getList() { //オーバーライドして実際の処理を記述
        System.out.println(this.getParent().getName()+"/"+this.getName()+"(File)");
    }
}
```

実行環境：Ubuntu 16.04.2 LTS、Java Standard Edition 8 Update 121  
作成者：MUBIROU  
作成日：2016年07月21日  
更新日：2017年05月13日


<a name="Decorator"></a>
# <b><ruby>Decorator<rt>デコレータ</rt></ruby></b>

```
//Main.java

public class Main {
    public static void main(String[] args) {
        Display _original = new Original("TAKASHI");
        _original.show(); //=> TAKASHI
        
        Display _decorator1 = new Decorator1(new Original("TAKASHI"));
        _decorator1.show(); //=> -TAKASHI-
        
        Display decorator2_ = new Decorator2(new Original("TAKASHI"));
        decorator2_.show(); //=> <TAKASHI>
        
        Display _special = new Decorator2(
                                    new Decorator1(
                                        new Decorator1(
                                            new Decorator1(
                                                new Original("TAKASHI")
                                            )
                                        )
                                    )
                                );
        _special.show(); //=> <---TAKASHI--->
    }
}

//=====================================================================
//「中身」と「飾り枠」に同じshow()メソッドを持たせるためのスーパークラス
//=====================================================================
class Display {
    protected String _content;
    public String getContent() {
        return _content;
    }
    public void show() {
        System.out.println(_content);
    }
}

//=======================
//中身（飾りを施す前の元）
//=======================
class Original extends Display {
    public Original(String arg) { //コンストラクタ
        _content = arg; //_conentは基本クラスからの継承
    }
}

//=========
//飾り枠①
//=========
class Decorator1 extends Display {
    public Decorator1(Display _display) { //コンストラクタ
        _content = "-" + _display.getContent() + "-"; //飾り①を付ける
    }
}

//=========
//飾り枠②
//=========
class Decorator2 extends Display {
    public Decorator2(Display _display) { //コンストラクタ
        _content = "<" + _display.getContent() + ">"; //飾り②を付ける
    }
}
```

実行環境：Ubuntu 16.04.2 LTS、Java Standard Edition 8 Update 121  
作成者：MUBIROU  
作成日：2016年07月21日  
更新日：2017年05月13日


<a name="Facade"></a>
# <b><ruby>Facade<rt>ファサード</rt></ruby></b>

以下の例文では、「Decoratorパターン」を Facade パターンでシンプルにします。
```
Display _special = new Decorator2(
                            new Decorator1(
                                new Decorator1(
                                    new Decorator1(
                                        new Original("TAKASHI")))));
_special.show();
```
...としていたものを次の1行で実現可能になります。
```
DecoratorFacade.exec("TAKASHI", 3, 1);
```

```
//Main.java

public class Main {
    public static void main(String[] args) {
        //メイン内がシンプルになります
        DecoratorFacade.exec("TAKASHI", 0, 0); //=> TAKASHI
        DecoratorFacade.exec("TAKASHI", 1, 0); //=> -TAKASHI-
        DecoratorFacade.exec("TAKASHI", 0, 1); //=> <TAKASHI>
        DecoratorFacade.exec("TAKASHI", 3, 1); //=> <---TAKASHI--->
    }
}

//============================================================
// シンプルな窓口 ←Decoratorパターンにこのクラスを追加するだけ
//============================================================
class DecoratorFacade { //Singletonパターン
    private DecoratorFacade() {} //privateにして外部からnewできないようにする
    public static void exec(String arg1, int arg2, int arg3) {
        Display _result = new Original(arg1);
        for (int i=0; i<arg2; i++) {
            _result = new Decorator1(_result);
        }
        for (int j=0; j<arg3; j++) {
            _result = new Decorator2(_result);
        }
        _result.show();
    }
}

//以下の4つのクラスはDecoratorパターンの例文と全く同じ
//=====================================================================
//「中身」と「飾り枠」に同じshow()メソッドを持たせるためのスーパークラス
//=====================================================================
class Display {
    protected String _content;
    public String getContent() {
        return _content;
    }
    public void show() {
        System.out.println(_content);
    }
}

//=======================
//中身（飾りを施す前の元）
//=======================
class Original extends Display {
    public Original(String arg) { //コンストラクタ
        _content = arg; //_conentは基本クラスからの継承
    }
}

//=========
//飾り枠①
//=========
class Decorator1 extends Display {
    public Decorator1(Display _display) { //コンストラクタ
        _content = "-" + _display.getContent() + "-"; //飾り①を付ける
    }
}

//=========
//飾り枠②
//=========
class Decorator2 extends Display {
    public Decorator2(Display _display) { //コンストラクタ
        _content = "<" + _display.getContent() + ">"; //飾り②を付ける
    }
}
```

実行環境：Ubuntu 16.04.2 LTS、Java Standard Edition 8 Update 121  
作成者：MUBIROU  
作成日：2016年07月21日  
更新日：2017年05月13日


<a name="Flyweight"></a>
# <b><ruby>Flyweight<rt>フライウエイト</rt></ruby></b>

* 以下の例文では、外部テキストとして2つのファイルを使用します。
    * A.txt（"あいうえお"＝あ行）
    * KA.txt（"かきくけこ"＝か行）

### 例文
```
//Main.java

import java.util.*; //HashMapに必要
//↓テキストの読込み用
import java.io.File;
import java.io.FileReader;
import java.io.FileNotFoundException;
import java.io.IOException;

public class Main {
    public static void main(String[] args) {
        //インスタンスの管理者を作る（Singletonクラス）
        Manager _manager = Manager.getInstance();

        //無駄に生成したくないオブジェクトを生成（既存の場合使い回す）
        Reader _A = _manager.createReader("A");
        Reader _KA = _manager.createReader("KA");

        //既存のものを生成しようとすると...
        Reader _A2 = _manager.createReader("A");
        System.out.println(_A == _A2); //=> true ←中身は同じインスタンス

            //実行
        System.out.println(_A.getText()); //=> "あいうえお"
        System.out.println(_KA.getText()); //=> "かきくけこ"
    }
}
class Manager { //インスタンスの管理人（Singletonクラス）
    private static Manager _manager = new Manager(); //Singleton用
    private Map<String,Reader> _map = new HashMap<>();

    private Manager() {} //外部からnewできないようにする

    public static Manager getInstance() { //外部から唯一のインスタンスを呼出す
        return _manager; //唯一のインスタンス（静的変数）を返す
    }

    public Reader createReader(String arg) {
        boolean bool_ = _map.containsKey(arg); //←参照「#172 マップ（HashMap）」
        if (! bool_) { //_map.get(arg)が存在しない場合...
            _map.put(arg, new Reader(arg)); //←ここでやっとnew!!
        } else { //既存の場合...（確認用）
            System.out.println(arg + "は既存です");
        }
        return _map.get(arg); //←Map.get()
    }
}

class Reader { //フライ級の役（メモリの使用量が多いため無駄に生成したくないもの等）
    private String _text = ""; //外部から読み込んだテキストを格納

    public Reader(String arg) { //コンストラクタ
        try { //FileReaderクラスを扱う場合、例外処理が必要
            File file_ = new File(arg + ".txt"); //①Fileクラスのオブジェクトの生成
            FileReader _filereader = new FileReader(file_); //②オブジェクトの生成
            int int_;
            while((int_ = _filereader.read()) != -1){ //③１文字ずつ読み込んでいきます
                //④文字コードを文字に変換
                _text += (char)int_; //=>"あ"=>"い"=>"う"=>...
            }
            //⑤ファイルを閉じる
            _filereader.close();
        } catch(FileNotFoundException e) {
            System.out.println(e);
        } catch(IOException e) {
            System.out.println(e);
        }
    }

    public String getText() {
        return _text;
    }
}
```

実行環境：Ubuntu 16.04.2 LTS、Java Standard Edition 8 Update 121  
作成者：MUBIROU  
作成日：2016年07月21日  
更新日：2017年05月13日


<a name="Proxy"></a>
# <b><ruby>Proxy<rt>プロキシー</rt></ruby></b>

* 以下の例文では、"あいうえお" を入力した外部ファイル（sample.txt） を用意しておきます。

```
//Main.java

import java.io.File; //テキストの読込み用
import java.io.FileReader; //テキストの読込み用
import java.io.FileNotFoundException; //テキストの読込み用
import java.io.IOException; //テキストの読込み用

//=============
// メインクラス
//=============
public class Main {
    public static void main(String[] args) {
        String _path = "sample.txt";
        Loader _loader = new Loader(_path); //代理人（Proxy）役
        //↓通常は、必要になった時に実際にロード
        _loader.load(); //=> あいうえお かきくけこ
    }
}

//=====================================
// ①Loaderと②Contentのインターフェース
//=====================================
interface ILoader {
    void load(); //暗黙的にpublicになる
}

//===================
// ①代理人（Proxy）役
//===================
class Loader implements ILoader {
    private String _path;
    public Loader(String _path) { //コンストラクタ
        this._path = _path;
    }
    public void load() {
        //実際の本人が登場（代理人は実際の本人を知っている）
        Content _content = new Content(_path);
        _content.load();
    }
}

//=============
// ②実際の本人
//=============
class Content implements ILoader {
    private String _path;
    public Content(String _path) { //コンストラクタ
        this._path = _path;
    }
    public void load() { //重い処理をここで行う←ポイント
        //今回のサンプルの中身はあまり重要ではない...
        String _text = ""; //外部から読み込んだテキストを格納
        try { //FileReaderクラスを扱う場合、例外処理が必要
            File _file = new File(_path); //①Fileクラスのオブジェクトの生成
            FileReader _filereader = new FileReader(_file); //②オブジェクトの生成
            int _int;
            while((_int = _filereader.read()) != -1){ //③１文字ずつ読み込んでいきます
                //④文字コードを文字に変換
                _text += (char)_int; //=>"あ"=>"い"=>"う"=>...
            }
            //⑤ファイルを閉じる
            _filereader.close();
        } catch(FileNotFoundException e) {
            System.out.println(e);
        } catch(IOException e) {
            System.out.println(e);
        }
        System.out.println(_text);
    }
}
```

実行環境：Ubuntu 16.04.2 LTS、Java Standard Edition 8 Update 121  
作成者：MUBIROU  
作成日：2016年07月21日  
更新日：2017年05月13日


<a name="Iterator"></a>
# <b><ruby>Iterator<rt>イテレータ</rt></ruby></b>

```
//Main.java

import java.util.*; //LinkedListに必要

//=============
// メインクラス
//=============
public class Main {
    public static void main(String[] args) {
        BikePark _bikePark = new BikePark();

        _bikePark.add(new Bike("ESTRELLA", "神戸 こ 19-63"));
        _bikePark.add(new Bike("SRV250S", "豊橋 え 19-63"));
        _bikePark.add(new Bike("GB250 CLUBMAN", "品川 く 14-56"));

        Iterator _iterator = _bikePark.createIterator(); //イテレータ（管理人）生成
        
        while(_iterator.hasNext()) {
            Bike _nextBike = _iterator.next();
            System.out.println(_nextBike.getName() + "," + _nextBike.getNum());
            //=> ESTRELLA,神戸 さ 19-03
            //=> SRV250S,豊橋 あ 13-63
            //=> GB250 CLUBMAN,品川 け 12-16
        }
    }
}

//===========
// Bikeクラス
//===========
class Bike {
    private String _name, _num;
    public Bike(String _name, String _num) { //コンストラクタ
        this._name = _name;
        this._num = _num;
    }
    public String getName() { return _name; }
    public String getNum() { return _num; }
}

//===============
// BikeParkクラス
//===============
interface IBikePark {
    void add(Bike arg); //暗黙的にpublicになる
    Bike getBikeAt(int arg);
    int getLength();
    Iterator createIterator();
}
class BikePark implements IBikePark {
    LinkedList<Bike> _list = new LinkedList<>();  //空のLinkedListを作成 
    public void add(Bike arg) { _list.add(arg); }
    public Bike getBikeAt(int arg) { return _list.get(arg); }
    public int getLength() { return _list.size(); }
    public Iterator createIterator() { 
        return new Iterator(this); //イテレータ生成（管理人）生成
    }
}

//==================================
// Iteratorクラス（≒駐輪場の管理人）
//==================================
interface IIterator {
    boolean hasNext(); //暗黙的にpublicになる
    Bike next();
}
class Iterator implements IIterator {
    BikePark _bikePark;
    int _count = 0;
    public Iterator(BikePark arg) { //コンストラクタ
        this._bikePark = arg;
    }
    public boolean hasNext() { 
        return _bikePark.getLength() > _count;
    }
    public Bike next() { 
        return _bikePark.getBikeAt(_count++); //次のバイクを返す
    }
}
```

実行環境：Ubuntu 16.04.2 LTS、Java Standard Edition 8 Update 121  
作成者：MUBIROU  
作成日：2016年07月21日  
更新日：2017年05月13日


<a name="TemplateMethod"></a>
# <b><ruby>Template Method<rt>テンプレート メソッド</rt></ruby></b>

```
//Main.java

//============
//メインクラス
//============
public class Main {
    public static void main(String[] args) {
        CardIchiro _cardIchiro = new CardIchiro();
        _cardIchiro.templateMethod();
        /*
        HAPPY NEW YEAR!
        勉強頑張ろう
        テニス頑張ろう
        */

        CardHanako _cardHanako = new CardHanako();
        _cardHanako.templateMethod();
        /*
        HAPPY NEW YEAR!
        テニスがんばろうね
        */
    }
}

//===================================
//抽象クラス
//===================================
abstract class AbstractCard {
    //↓一連の連続した処理の枠組みを定義
    public void templateMethod() {
        order1(); //共通の処理
        if (isChild()) { //フックメソッド（サブクラスでオーバーライド）
            order2(); //←条件により実行
        }
        order3(); //サブクラスでオーバーライド
    }
    private void order1() { //共通の処理
        System.out.println("HAPPY NEW YEAR!");
    }
    abstract protected boolean isChild(); //抽象メソッドの宣言
    //↓条件により実行
    private void order2() {
        System.out.println("勉強頑張ろう");
    }
    abstract protected void order3(); //抽象メソッドの宣言
}

//===================================
//サブクラス①（抽象クラスを継承）
//===================================
class CardIchiro extends AbstractCard {
    //フックメソッドをオーバーライドして具体的処理を記述
    protected boolean isChild() {
        return true;
    }
    //抽象メソッドをオーバーライドして具体的処理を記述
    protected void order3() {
        System.out.println("テニス頑張ろう");
    }
}

//===================================
//サブクラス②（抽象クラスを継承）
//===================================
class CardHanako extends AbstractCard {
    //フックメソッドをオーバーライドして具体的処理を記述
    protected boolean isChild() {
        return false;
    }
    //抽象メソッドをオーバーライドして具体的処理を記述
    protected void order3() {
        System.out.println("テニスがんばろうね");
    }
}
```

実行環境：Ubuntu 16.04.2 LTS、Java Standard Edition 8 Update 121  
作成者：MUBIROU  
作成日：2016年07月21日  
更新日：2017年05月13日


<a name="Strategy"></a>
# <b><ruby>Strategy<rt>ストラテジー</rt></ruby></b>

```
//Main.java

//==============
// メインクラス
//==============
public class Main {
    public static void main(String[] args) {
        Janken _jankenA = new Janken(new StrategyA());
        Janken _jankenB = new Janken(new StrategyB());
        _jankenA.exec(); //=> グー、グー、パー
        _jankenB.exec(); //=> パー、グー、チョキ
    }
}

//=================
// StrategyXXXクラス
//=================
interface IStrategy {
    void execute(); //暗黙的にpublicになる
}
class StrategyA implements IStrategy {
    public void execute() { System.out.println("グー、グー、パー");	}
}
class StrategyB implements IStrategy {
    public void execute() { System.out.println("パー、グー、チョキ"); 	}
}

//=============
// Jankenクラス
//=============
class Janken {
    private IStrategy _strategy;
    public Janken(IStrategy _strategy) { this._strategy = _strategy; }
    public void exec() { _strategy.execute(); } //exec()だと紛らわしいので...
}
```

実行環境：Ubuntu 16.04.2 LTS、Java Standard Edition 8 Update 121  
作成者：MUBIROU  
作成日：2016年07月21日  
更新日：2017年05月13日


<a name="Visitor"></a>
# <b><ruby>Visitor<rt>ビジター</rt></ruby></b>

```
//Main.java

//=============
// メインクラス
//=============
public class Main {
    public static void main(String[] args) {
        //訪問先
        Hokkaido _hokkaido = new Hokkaido(); //北海道実家
        Chiba _chiba = new Chiba(); //千葉親戚
        
        //訪問者
        Ichiro _ichiro = new Ichiro(); //一郎
        Hanako _hanako = new Hanako(); //花子
        
        //訪問する（訪問側から見ると「受け入れる」）
        _hokkaido.accept(_ichiro);
        _hokkaido.accept(_hanako);
        _chiba.accept(_ichiro);
        _chiba.accept(_hanako);
        
        //結果
        System.out.println(_ichiro.getMoney()); //=> 15000
        System.out.println(_hanako.getMoney()); //=> 15000
    }
}

//========
// 訪問先
//========
interface IAcceptor {
    void accept(IVisitor _visitor); //暗黙的にpublicになる
}

class Hokkaido implements IAcceptor {
    private int _otoshidama = 5000*2; //お年玉
    public void accept(IVisitor _visitor) { //Accept＝受け入れる
        _visitor.visit(_otoshidama); //誰が訪問してきても同じメソッドを実行
    }
}

class Chiba implements IAcceptor {
    private int _otoshidama = 5000; //お年玉
    public void accept(IVisitor _visitor) { //Accept＝受け入れる
        _visitor.visit(_otoshidama); //誰が訪問してきても同じメソッドを実行
    }
}

//========
// 訪問者
//========
interface IVisitor {
    void visit(int _otoshidama); //暗黙的にpublicになる
    int getMoney(); //暗黙的にpublicになる
}

class Ichiro implements IVisitor { //一郎
    private int _money = 0; //貯金
    public void visit(int _otoshidama) { _money += _otoshidama; }
    public int getMoney() { return _money; }
}

class Hanako implements IVisitor { //花子
    private int _money = 0; //貯金
    public void visit(int _otoshidama) { _money += _otoshidama; }
    public int getMoney() { return _money; }
}
```

実行環境：Ubuntu 16.04.2 LTS、Java Standard Edition 8 Update 121  
作成者：MUBIROU  
作成日：2016年07月21日  
更新日：2017年05月13日


<a name="ChainofResponsibility"></a>
# <b><ruby>Chain of Responsibility<rt>チェーン オブ レスポンシビリティ</rt></ruby></b>

```
//Main.java

//=============
// メインクラス
//=============
public class Main {
    public static void main(String[] args) {
        //郵便局の設置
        AbstractPO _shinjukuPO = new ShinjukuPO();
        AbstractPO _tokyoPO = new TokyoPO();
        AbstractPO _japanPO = new JapanPO();
        
        //責任のたらいまわしのセット
        _shinjukuPO.setNext(_tokyoPO).setNext(_japanPO);
        
        //投函（全て新宿郵便局に投函する）
        _shinjukuPO.send("新宿区XX町X-X-X"); //=> 本日中に届きます
        _shinjukuPO.send("東京都杉並区XX町X-X"); //=> 明後日中に届きます
        _shinjukuPO.send("北海道函館市XX町X-X-X"); //=> 一週間前後で届きます
    }
}

//=====================
// 各郵便局の抽象クラス
//=====================
abstract class AbstractPO {
    //共通の機能
    protected AbstractPO _nextPO; //←たらいまわし先
    public AbstractPO setNext(AbstractPO _po) {
        _nextPO = _po;
        return _nextPO;
    }
    //抽象メソッド（子クラスでオーバーライド）	
    abstract public void send(String _address);
}

//===========
// 新宿郵便局
//===========
class ShinjukuPO extends AbstractPO {
    public void send(String _address) { //抽象メソッドの実際の処理
        if (_address.indexOf("新宿",0) != -1) {
            System.out.println("本日中に届きます");
        } else {
            _nextPO.send(_address); //たらいまわし先に振る ←ポイント
        }
    }
}

//===========
// 東京郵便局
//===========
class TokyoPO extends AbstractPO {
    public void send(String _address) { //抽象メソッドの実際の処理
        if (_address.indexOf("東京",0) != -1) {
            System.out.println("明後日中に届きます");
        } else {
            _nextPO.send(_address); //たらいまわし先に振る ←ポイント
        }
    }	
}

//===========
// 日本郵便局
//===========
class JapanPO extends AbstractPO {
    public void send(String _address) { //抽象メソッドの実際の処理
        System.out.println("一週間前後で届きます");
    }
}
```

実行環境：Ubuntu 16.04.2 LTS、Java Standard Edition 8 Update 121  
作成者：MUBIROU  
作成日：2016年07月21日  
更新日：2017年05月13日


<a name="Mediator"></a>
# <b><ruby>Mediator<rt>メディエイター</rt></ruby></b>

```
//Main.java

import java.util.*; //LinkedListに必要

//=============
// メインクラス
//=============
public class Main {
    public static void main(String[] args) {
        //相談役
        new Mediator(); //今回のサンプルではこのインスタンスは使用しない
        
        //検証（今回は静的変数を使いました）
        Mediator.MemberA.request("西へ行く"); //メンバーAから報告
        /*
        MemberA: （Aよ）了解、そのまま西へ行け
        MemberB: （Bよ）東へ行け
        MemberC: （Cよ）その場で待機しろ
        */
    }
}

//==================================
// 相談役（専門性が高いため使い捨て）
//==================================
class Mediator {
    LinkedList<AbstractMember> _memberList = new LinkedList<>(); //メンバーリスト
    public static AbstractMember MemberA = new MemberA(); //静的変数
    public static AbstractMember MemberB = new MemberB(); //静的変数
    public static AbstractMember MemberC = new MemberC(); //静的変数
    
    //コンストラクタ
    public Mediator() {
        //メンバーの登録
        addMember(MemberA); //★
        addMember(MemberB); //★
        addMember(MemberC); //★
    }
    
    //メンバーリストに登録
    private void addMember(AbstractMember _member) { //←★
        _memberList.add(_member); //LinkedList.add()
        _member.setMediator(this); //メンバーに相談役は自分であることを教える
    }
    
    //メンバーからの報告を受け指示を出す（特に専門性が高いメソッド）←⦿
    public void request(AbstractMember _member, String _string) {
        if (_member == MemberA) {
            if (_string == "西へ行く") {
                //「メンバーA」から「西へ行く」と報告があった場合の処理
                _member.advice("（Aよ）了解、そのまま西へ行け"); //Aへ指示
                for (AbstractMember theMember : _memberList) {
                    if (theMember == MemberB) {
                        theMember.advice("（Bよ）東へ行け"); //Bへ指示
                    } else if (theMember == MemberC) {
                        theMember.advice("（Cよ）その場で待機しろ"); //Cへ指示
                    }
                }
            }
        }
        //以降、各メンバーからの報告内容に対する処理を記述
    }
}

//===================
// 登録するメンバー達
//===================
abstract class AbstractMember {
    //共通の機能
    protected Mediator _mediator;
    public void setMediator(Mediator _mediator) {
        this._mediator = _mediator;
    }	
    //抽象メソッドの宣言（派生クラスでオーバーライド）
    abstract public void request(String _string);
    abstract public void advice(String _string);
}

//==========
//メンバーA
//==========
class MemberA extends AbstractMember {
    public void request(String _string) { //抽象メソッドをオーバーライド
        //ここにメンバーＡ独自の処理など
        _mediator.request(this, _string); //相談役に報告→⦿
    }
    public void advice(String _string) { //相談役からの指示を受ける
        System.out.println("MemberA: " + _string);
    }
}

//==========
//メンバーB
//==========
class MemberB extends AbstractMember {
    public void request(String _string) { //抽象メソッドをオーバーライド
        //ここにメンバーB独自の処理など
        _mediator.request(this, _string); //相談役に報告→⦿
    }
    public void advice(String _string) { //相談役からの指示を受ける
        System.out.println("MemberA: " + _string);
    }
}

//==========
//メンバーC
//==========
class MemberC extends AbstractMember {
    public void request(String _string) { //抽象メソッドをオーバーライド
        //ここにメンバーC独自の処理など
        _mediator.request(this, _string); //相談役に報告→⦿
    }
    public void advice(String _string) { //相談役からの指示を受ける
        System.out.println("MemberA: " + _string);
    }
}
```

実行環境：Ubuntu 16.04.2 LTS、Java Standard Edition 8 Update 121  
作成者：MUBIROU  
作成日：2016年07月21日  
更新日：2017年05月13日


<a name="Observer"></a>
# <b><ruby>Observer<rt>オブザーバ</rt></ruby></b>

```
//Main.java

import java.util.*; //LinkedListに必要

public class Main {
    public static void main(String[] args) {
        ISubject _apple = new Apple(); //観察される（Subject）役
        
        //リスナー（Observer）役
        IObserver _iPhone = new iPhone();
        IObserver _iPad = new iPad();
        IObserver _iPadPro = new iPadPro();
        
        //リスナー（Observer）の登録
        _apple.addObserver(_iPhone);
        _apple.addObserver(_iPad);
        _apple.addObserver(_iPadPro);
        
        _apple.notice(); //全リスナー（Observer）への通知 ←notify()は不可
    }
}

interface ISubject {
    void addObserver(IObserver _observer); //暗黙的にpublic扱い
    void removeObserver(IObserver _observer);
    void notice(); //←notify()は不可
}

class Apple implements ISubject {
    LinkedList<IObserver> _observerList = new LinkedList<>(); //リスナーリスト
    public void addObserver(IObserver _observer) { //リスナーの登録
        _observerList.add(_observer); //←LinkedList.add()
    }
    public void removeObserver(IObserver _observer) { //リスナーの削除
        _observerList.remove(_observer);
    }
    public void notice() { //全リスナーへの通知 ←notify()は不可
        for (IObserver _observer : _observerList) {
            _observer.update(this);
        }
    }
    public String getVersion() { return "10.3.1"; }
}

interface IObserver {
    void update(Apple _apple); //暗黙的にpublic扱い
}

class iPhone implements IObserver { //本来は大文字で始まるべきですが...
    public void update(Apple _apple) {
        System.out.println("iPhoneは" + _apple.getVersion() + "にアップデート可能");
    }
}

class iPad implements IObserver { //本来は大文字で始まるべきですが...
    public void update(Apple _apple) {
        System.out.println("iPadは" + _apple.getVersion() + "にアップデート可能");
    }
}

class iPadPro implements IObserver { //本来は大文字で始まるべきですが...
    public void update(Apple _apple) {
        System.out.println("iPad Proは" + _apple.getVersion() + "にアップデート可能");
    }
}
```

実行環境：Ubuntu 16.04.2 LTS、Java Standard Edition 8 Update 121  
作成者：MUBIROU  
作成日：2016年07月22日  
更新日：2017年05月13日


<a name="Memento"></a>
# <b><ruby>Memento<rt>メメント</rt></ruby></b>

```
//Main.java

import java.util.*; //LinkedListに必要

//=============
// メインクラス
//=============
public class Main {
    public static void main(String[] args) {
        Gamer _gamer = new Gamer(100); //ゲームスタート（最初のポイントは100）
        SnapShot _snapShot = _gamer.save(); //最初の状態を保存
        
        _gamer.setPoint(2000); //いろいろゲームが進行して2000ポイントに...
        _snapShot = _gamer.save(); //この時点での状態を保存
        
        _gamer.setPoint(8000); //更にゲームが進行して8000ポイントに...
        _snapShot = _gamer.save(); //この時点での状態を保存
        
        _gamer.history(); //履歴を調べる
        //=>  0:100
        //=> 1:2000
        //=> 2:8000
        
        _snapShot = _gamer.undo(); //Undo（やり直し）
        System.out.println(_snapShot.getPoint()); //=> 2000
        _snapShot = _gamer.undo();
        System.out.println(_snapShot.getPoint()); //=> 100
        _snapShot = _gamer.undo();
        System.out.println(_snapShot.getPoint()); //=> これ以上、Undoできません 100
        
        _snapShot = _gamer.redo(); //Redo（再実行）
        System.out.println(_snapShot.getPoint()); //=> 2000
        _snapShot = _gamer.redo();
        System.out.println(_snapShot.getPoint()); //=> 8000
        _snapShot = _gamer.redo();
        System.out.println(_snapShot.getPoint()); //=> これ以上、Redoできません 8000
    }
}

//=========================
// 主人公役 + バックアップ係
//=========================
class Gamer {
    int _point;
    LinkedList<SnapShot> _history = new LinkedList<>(); //履歴用リスト
    int _count; //Undo、Redo用
    
    public Gamer(int _point) { //コンストラクタ
        this._point = _point;
    }
    
    public int getPoint() {
        return _point;
    }
    public void setPoint(int _point) {
        this._point = _point;
    }

    //状態を保存	
    public SnapShot save() {
        SnapShot _snapShot = new SnapShot(_point);
        _history.add(_snapShot); //←LinkedList.add()
        _count = _history.size() - 1; //←LinkedList.size()
        return _snapShot;
    }
    
    //履歴	
    public void history() {
        for (int i=0; i < _history.size(); i++) {
            System.out.println(i + ":" + _history.get(i).getPoint());
        }
    }
    
    //Undo（やり直し）
    public SnapShot undo() {
        if (_count > 0) {
            return _history.get(--_count);
        } else {
            System.out.println("これ以上、Undoできません");
            _count = 0;
            return _history.get(0);
        }
    }
    
    //Redo（再実行）
    public SnapShot redo() {
        if (_count < _history.size()-1) {
            return _history.get(++_count);
        } else {
            System.out.println("これ以上、Redoできません");
            _count = _history.size() - 1;
            return _history.get(_count);
        }
    }
}

//===========================================
// Memento役（その瞬間の状態をオブジェクト化）
//===========================================
class SnapShot {
    private int _point; //今回はシンプルに1つだけにしておきます
    public SnapShot(int _point) {
        this._point = _point;
    }
    public int getPoint() { 
        return _point; 
    }
    public void setPoint(int _point) {
        this._point = _point;
    }
}
```

実行環境：Ubuntu 16.04.2 LTS、Java Standard Edition 8 Update 121  
作成者：MUBIROU  
作成日：2016年07月22日  
更新日：2017年05月13日


<a name="State"></a>
# <b><ruby>State<rt>ステート</rt></ruby></b>

```
//Main.java

//=============
// メインクラス
//=============
public class Main {
    public static void main(String[] args) {
        //Context役
        Janken _janken = new Janken();
        
        //State（状態）役
        IState _stateA = new StateA();
        IState _stateB = new StateB();
        
        //状態の設定＆実行
        _janken.setState(_stateA);
        _janken.exec(); //=> グー、グー、パー
        
        //状態の変更＆実行
        _janken.setState(_stateB);
        _janken.exec(); //=>パー、グー、チョキ
    }
}

//=======================
// Context（状態を管理）役
//=======================
class Janken {
    private IState _state; //状態（State○）を格納
    
    public void setState(IState _state) {
        this._state = _state;
    }
    
    public void exec() {
        _state.execute(); //State○.execute()メソッドを呼出す
    }
}

//================
// State（状態）役
//================
interface IState {
    void execute(); //暗黙的にpublic扱い
}

//状態A
class StateA implements IState {
    public void execute() { //←Janken.exec()から呼び出される
        System.out.println("グー、グー、パー");
    }
}

//状態B
class StateB implements IState {
    public void execute() { //←Janken.exec()から呼び出される
        System.out.println("パー、グー、チョキ");
    }
}
```

実行環境：Ubuntu 16.04.2 LTS、Java Standard Edition 8 Update 121  
作成者：MUBIROU  
作成日：2016年07月22日  
更新日：2017年05月13日


<a name="Command"></a>
# <b><ruby>Command<rt>コマンド</rt></ruby></b>

```
//Main.java

import java.util.*; //LinkedListに必要

//===========
//メインクラス
//============
public class Main {
    public static void main(String[] args) {
        Inkscape _inkscape = new Inkscape(); //グラフィックソフト
        _inkscape.draw("線を引く"); //命令の実行
        _inkscape.draw("縁取る"); //命令の実行
        _inkscape.draw("影を付ける"); //命令の実行
    }
}

//==========================================
//グラフィックソフト（バッチ処理は今回は省略）
//==========================================
class Inkscape {
    Canvas _canvas = new Canvas(); //Receiver（結果を表示する）役
    LinkedList<DrawCommand> _history = new LinkedList<>(); //履歴（命令クラス）を保存
    public void draw(String _command) { //命令の実行
        //↓命令を実行する度にインスタンス生成
        DrawCommand _drawCommand = new DrawCommand(_canvas, _command); 
        _drawCommand.execute(); //実行（＝キャンバスの再描画）→★
        _history.add(_drawCommand); //命令クラスを履歴に保存
    }
}

//==========
//命令クラス
//==========
class DrawCommand {
    private Canvas _canvas;
    private String _command;
    public DrawCommand(Canvas _canvas, String _command) { //コンストラクタ
        this._canvas = _canvas;
        this._command = _command;
    }
    public void execute() { //←★Inkscape.draw()から呼び出される
        _canvas.update(_command); //⦿
    }
}

//========================================
// 結果を表示する役＝Receiver（受信者）の役
//========================================
class Canvas {
    LinkedList<String> _history = new LinkedList<>(); //履歴（実際の処理）を保存
    public void update(String _command) { //キャンバスの再描画←⦿
        _history.add(_command);
        for (String _string : _history) {
            System.out.println(_string);
        }
    }
}
```

実行環境：Ubuntu 16.04.2 LTS、Java Standard Edition 8 Update 121  
作成者：MUBIROU  
作成日：2016年07月22日  
更新日：2017年05月13日


<a name="Interpreter"></a>
# <b><ruby>Interpreter<rt>インタプリタ</rt></ruby></b>

* 例文は ActionScript、SWF、AVM（ActionScript Virtual Machine）を自作ミニ言語と見立てています。
* 例文は「終端となる表現の役」を省略しています。

```
//Main.java

//============
//メインクラス
//============
public class Main {
    public static void main(String[] args) {
        String _code = "+10;*50;/2;-4;="; //自作言語による記述（≒ActionScript）
        SWF _swf = new SWF(_code); //≒SWFファイルに変換
        AVM _avm = new AVM(); //≒ActionScript Virtual Machine
        _avm.execute(_swf); //≒SWFファイルをAVM上で実行（計算結果は246）
    }
}

//============================
//≒SWFファイルを生成するクラス
//============================
class SWF {
    private String[] _codeArray; //命令を配列化（中間コード）
    private int _count = 0; //getNextCode()で使用
    
    //コンストラクタ
    public SWF(String _code) {
        _codeArray = _code.split(";"); //「;」区切りで分割し配列化（中間コードに変換）
    }

    //次の命令を返す
    public String getNextCode() { 
        return _codeArray[_count++];
    }
    
    //次の命令があるかどうか...
    public boolean isEnd() {
        return _count >= _codeArray.length;
    }
}

//==============================
//≒ActionScript Virtual Machine
//==============================
class AVM {
    public void execute(SWF _swf) {
        int _result = 0; //計算結果
        
        while (! _swf.isEnd()) { //次の命令があれば...
            String nextCode_ = _swf.getNextCode(); //次の命令を調べる

            //ここからはサンプルの独自処理
            String _operator = nextCode_.substring(0,1); //「+*/-=」の何れか
            if (_operator.indexOf("=",0) == -1) { //←「=」以外の場合（力技）
            //if (_operator != "=") { //←=が"="と認識せず？
                int int_ = Integer.parseInt(nextCode_.substring(1,nextCode_.length()));
                switch (_operator) {
                    case "+" : _result += int_; break;
                    case "-" : _result -= int_; break;
                    case "*" : _result *= int_; break;
                    case "/" : _result /= int_; break;
                    default :
                        System.out.println("Error:演算子が異なります");
                        break;
                }
            } else { //「=」の場合...
                //本来はここで「終端となる表現」のクラスを生成して処理をしますが省略
                System.out.println(_result);
            }
        }
    }
}
```

実行環境：Ubuntu 16.04.2 LTS、Java Standard Edition 8 Update 121  
作成者：MUBIROU  
作成日：2016年07月22日  
更新日：2017年05月13日
