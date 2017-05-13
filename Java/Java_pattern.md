### <b>この項目は書きかけの項目です</b>

# <b>Java デザインパターン</b>

### <b>INDEX</b>

* オブジェクトの「生成」に関するパターン
    * [<ruby>Singleton<rt>シングルトン</rt></ruby>](#Singleton) : たった１つのインスタンス
    * [<ruby>Prototype<rt>プロトタイプ</rt></ruby>](#Prototype) : コピーしてインスタンスを作
    * [<ruby>Builder<rt>ビルダー</rt></ruby>](#Builder) : 複雑なインスタンスを組み立てる
    ***
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

XXXX

実行環境：Ubuntu 16.04.2 LTS、Java Standard Edition 8 Update 121  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="AbstractFactory"></a>
# <b><ruby>Abstract Factory<rt>アブストラクト ファクトリー</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04.2 LTS、Java Standard Edition 8 Update 121  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="Adapter（継承）"></a>
# <b><ruby>Adapter<rt>アダプター</rt></ruby>（継承）</b>

XXXX

実行環境：Ubuntu 16.04.2 LTS、Java Standard Edition 8 Update 121  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


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