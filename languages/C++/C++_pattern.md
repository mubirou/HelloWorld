# <b>C++ デザインパターン</b>

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
//test.cpp
#include <iostream> //coutに必要
using namespace std;

/*********************
* シングルトンクラス
*********************/
class Singleton {
    private:
        Singleton() {}; //コンストラクタ←外からのインスタンス生成不可
        //↓ "唯一のインスタンス"の「アドレス」を「ポインタ」に格納する
        static Singleton* _singleton; //静的メンバ変数の「宣言」
        
    public:
        //インスタンスを生成＝既存のインスタンス（のアドレス）を呼出す
        static Singleton* Instance(); //静的メンバ関数 の「宣言」
};

//new ○○でメモリ上に「アドレス」を確保
Singleton* Singleton::_singleton = new Singleton; //静的メンバ変数 の「実装」

Singleton* Singleton::Instance() { //静的メンバ関数 の「実装」
    return _singleton; //既存の"唯一のインスタンス"（のアドレス）を呼出す
}

/*************
* メイン関数
*************/
int main() {
    Singleton* _singleton1 = Singleton::Instance();
    Singleton* _singleton2 = Singleton::Instance(); //上と同じ「アドレス」を格納
    cout << (_singleton1 == _singleton2) << endl; //=> 1（同じインスタンス）
    //Singleton* _singleton; //これはアドレスを確保しただけなのでエラーなし
    //Singleton _singleton; //エラー：外部からインスタンスは生成不可
    //Singleton* _singleton = new Singleton; //エラー：外部からインスタンスは生成不可
    //Singleton _singleton = new Singleton; //エラー：外部からインスタンスは生成不可
    return 0;
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：夢寐郎  
作成日：2016年05月31日  
更新日：2017年05月05日


<a name="Prototype"></a>
# <b><ruby>Prototype<rt>プロトタイプ</rt></ruby></b>

### ポイント
1. 複製には、自作の <b>インスタンス.Clone()</b> を使います。
1. Clone() メソッド内では、通常インスタンスを生成するようですが、今回は <b>this ポインタ</b> を使って <b>*this</b> でそのインスタンスの「値」をコピーしています。

### 例文
```
//test.cpp
#include <iostream> //coutに必要
using namespace std;

/*******************
* Prototypeクラス
*******************/
class Prototype; //クラスの「宣言」←先に宣言しないとインターフェース内で使えない為

class IPrototype { //インターフェースクラス（オプション）
    public: virtual Prototype Clone() = 0; //純粋仮想関数
};

class Prototype : public IPrototype { //Prototypeクラス ←コピー元となるクラス
    private:
        string _firstName, _lastName, _address; //メンバ変数の「宣言」

    public:
        //コンストラクタの「宣言」
        Prototype(string _firstName, string _lastName, string _address); 
        Prototype Clone(); //メンバ関数の「宣言」
        
        //アクセサ（getter）の「宣言」
        string FirstName(); 
        string LastName(); 
        string Address();
        //アクセサ（setter）の「宣言」
        void FirstName(string _firstName);
        void LastName(string _lastName);	
        void Address(string _address);
};

//コンストラクタの「実装」
Prototype::Prototype(string _firstName, string _lastName, string _address) { 
    this->_firstName = _firstName;
    this->_lastName = _lastName;
    this->_address = _address;
}

Prototype Prototype::Clone() {
    return *this; //「*XXX」で「ポインタ」から「値」を取得
}

//アクセサ（getter/setter）の「実装」
string Prototype::FirstName() { return _firstName; }
string Prototype::LastName() { return _lastName; }
string Prototype::Address() { return _address; }
void Prototype::FirstName(string _firstName) { this->_firstName = _firstName; }
void Prototype::LastName(string _lastName) { this->_lastName = _lastName; }
void Prototype::Address(string _address) { this->_address = _address; }

/************
* メイン関数
************/
int main() {
    //インスタンス①を生成
    Prototype _prototype1("Takashi", "Nishimura", "X-X-X XX-cho, Shinjuku-ku");

    //インスタンス①のコピーを作成
    Prototype _prototype2 = _prototype1.Clone(); 
    
    //複製したものだけ変数を変更
    _prototype2.FirstName("Hanako");
    
    //検証
    cout << _prototype1.FirstName() << " : " << _prototype2.FirstName() << endl; 
    //"Takashi : Hanako" ←値が異なるので「参照」ではなく「複製」であることが判明
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：夢寐郎  
作成日：2016年05月31日  
更新日：2017年05月05日


<a name="Builder"></a>
# <b><ruby>Builder<rt>ビルダー</rt></ruby></b>

```
//test.cpp
#include <iostream> //coutに必要
using namespace std;

/*****************************
* BuilderXXXのインターフェース
*****************************/
class IBuilder {
    public:
        virtual void MakeHeader() = 0; //純粋仮想関数（オーバーライドが必須）
        virtual void MakeContent() = 0; //純粋仮想関数（オーバーライドが必須）
        virtual void MakeFooter() = 0; //純粋仮想関数（オーバーライドが必須）
};

/*****************************
* BuilderA（タイプＡの年賀状）
*****************************/
class BuilderA : public IBuilder {
    public:
        void MakeHeader(); //純粋仮想関数のオーバーライド（宣言のみ）
        void MakeContent(); //純粋仮想関数のオーバーライド（宣言のみ）
        void MakeFooter(); //純粋仮想関数のオーバーライドの（宣言のみ）
};
//純粋仮想関数のオーバーライド（実装）
void BuilderA::MakeHeader() { cout << "HAPPY NEW YEAR!" << endl; }
void BuilderA::MakeContent() { cout << "○○○○○○○" << endl; }
void BuilderA::MakeFooter() { cout << "2018.1.1" << endl; }

/*****************************
* BuilderB（タイプＢの年賀状）
*****************************/
class BuilderB : public IBuilder {
    public:
        void MakeHeader(); //純粋仮想関数のオーバーライドの「宣言」
        void MakeContent(); //純粋仮想関数のオーバーライドの「宣言」
        void MakeFooter(); //純粋仮想関数のオーバーライドの「宣言」
};
//純粋仮想関数のオーバーライド（実装）
void BuilderB::MakeHeader() { cout << "あけましておめでとうございます" << endl; }
void BuilderB::MakeContent() { cout << "□□□□□□□" << endl; }
void BuilderB::MakeFooter() { cout << "元旦" << endl; }

/*****************************
* Director（年賀状の印刷業者）
*****************************/
class Director {
    private:
        IBuilder* _builder; //Builder○のインスタンスを管理（委譲）←注意
    public:
        Director(IBuilder* _builder); //コンストラクタの「宣言」←注意
        void Construct();
};
Director::Director(IBuilder* _builder) { //コンストラクタの「実装」←注意
    this->_builder = _builder;
}
void Director::Construct() { //メンバ関数の「実装」
    //共通の手順（ポリモーフィズムを利用）
    _builder -> MakeHeader(); //手順① ←ポインタからメンバを呼出す場合「アロー演算子」を使う
    _builder -> MakeContent(); //手順② ←ポインタからメンバを呼出す場合「アロー演算子」を使う
    _builder -> MakeFooter(); //手順③ ←ポインタからメンバを呼出す場合「アロー演算子」を使う
}

/*************
* メイン関数
*************/
int main() {
    Director _director1(new BuilderA);
    _director1.Construct();

    Director _director2(new BuilderB);
    _director2.Construct();

    return 0;
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：夢寐郎  
作成日：2016年06月01日  
更新日：2017年05月05日


<a name="FactoryMethod"></a>
# <b><ruby>Factory Method<rt>ファクトリー メソッド</rt></ruby></b>

### 概要
* インスタンス作成をサブクラスにまかせる。
* Factory とは「工場」、つまり工場メソッド。
* Template Method パターンの典型的な応用。
* インスタンスを生成する工場を Template Method パターンで構成したもの。

### 例文
```
//test.cpp
#include <iostream> //coutに必要
using namespace std;

/*******************
* 生成したいクラス群
*******************/
class IMessage { //インターフェース（オプション）
    public: virtual void Exec() = 0; //純粋仮想関数
};

class Message1 : public IMessage {
    public: void Exec() { cout << "謹賀新年" << endl; }
};

class Message2 : public IMessage {
    public: void Exec() { cout << "HAPPY NEW YEAR!" << endl; }
};

class Message3 : public IMessage {
    public: void Exec() { cout << "明けましておめでとうございます" << endl; }
};

class Message4 : public IMessage {
    public: void Exec() { cout << "あけましておめでとうございます" << endl; }
};

/*******************
* 抽象（基底）クラス
*******************/
class AbstractCard {
    private: void Order1(); //メンバ関数の「宣言」←共通の処理（処理②用）
    protected: virtual void Order2() = 0; //純粋仮想関数の「宣言」←独自の処理（処理③用）
    public:
        void TemplateMethod(string _target); //共通のメンバ関数の「宣言」
        virtual IMessage* FactoryMethod(string _target) = 0; //純粋仮想関数
};
void AbstractCard::TemplateMethod(string _target) { //共通のメンバ関数の「実装」
    //ここでnewを記述しない（条件分岐は派生クラスで行ない、ここを汚さない）
    //↓「純粋仮想関数」なので基底（抽象）クラスから派生クラスの関数を呼出すことが可能
    IMessage* _message = FactoryMethod(_target); //派生クラスのメソッドを呼出す
    _message -> Exec(); //処理① ←アロー演算子（ポインタからメンバ関数にアクセス）
    Order1(); //処理②（共通の処理）
    Order2(); //処理③（独自の処理）
}
void AbstractCard::Order1() { //共通の処理（処理②）
    cout << "〒XXX-XXXX 新宿区XX町X-X-X" << endl;
}

/***********************
* 派生クラス（ICHIRO用）
***********************/
class CardICHIRO : public AbstractCard { //抽象クラスを継承
    protected:
        void Order2(); //純粋仮想関数のオーバーライドの「宣言」
    public:
        IMessage* FactoryMethod(string _target); //純粋仮想関数のオーバーライドの「宣言」
};
IMessage* CardICHIRO::FactoryMethod(string _target) { //純粋仮想関数のオーバーライドの「実装」
    if (_target == "teacher") {
        return new Message1; //ここでnewを記述！
    } else if (_target == "friend") {
        return new Message2; //ここでnewを記述！
    }
}
void CardICHIRO::Order2() { //独自の処理（処理③）
    cout << "西村一郎" << endl;
}

/***********************
* 派生クラス（HANAKO用）
***********************/
class CardHANAKO : public AbstractCard { //抽象クラスを継承
    protected:
        void Order2(); //純粋仮想関数のオーバーライドの「宣言」
    public:
        IMessage* FactoryMethod(string _target); //純粋仮想関数のオーバーライドの「宣言」
};
IMessage* CardHANAKO::FactoryMethod(string _target) { //純粋仮想関数のオーバーライドの「実装」
    if (_target == "teacher") {
        return new Message3; //ここでnewを記述！
    } else if (_target == "friend") {
        return new Message4; //ここでnewを記述！
    }
}
void CardHANAKO::Order2() { //独自の処理（処理③）
    cout << "西村花子" << endl;
}

/*************
* メイン関数
*************/
int main() {
    CardICHIRO _cardICHIRO; //インスタンスの生成

    _cardICHIRO.TemplateMethod("teacher");
    // 謹賀新年
    // 〒XXX-XXXX 新宿区XX町X-X-X
    // 西村一郎

    _cardICHIRO.TemplateMethod("friend");
    // HAPPY NEW YEAR!
    // 〒XXX-XXXX 新宿区XX町X-X-X
    // 西村一郎
    
    CardHANAKO _cardHANAKO; //インスタンスの生成

    _cardHANAKO.TemplateMethod("teacher");
    // 明けましておめでとうございます
    // 〒XXX-XXXX 新宿区XX町X-X-X
    // 西村花子

    _cardHANAKO.TemplateMethod("friend");
    // あけましておめでとうございます
    // 〒XXX-XXXX 新宿区XX町X-X-X
    // 西村花子

    return 0;
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：夢寐郎  
作成日：2016年06月02日  
更新日：2017年05月05日


<a name="AbstractFactory"></a>
# <b><ruby>Abstract Factory<rt>アブストラクト ファクトリー</rt></ruby></b>

### 概要
* 関連する部品を組み合わせて製品を作る。
* Abstract は「抽象的な」、Factory は「工場」の意味。
* Factory Method パターンに類似。クラスを作ってオブジェクトを生成する Factory Method に対し、Abstract Factory はオブジェクトを作ってオブジェクトを作成。
* 生成を行うクラスの規格統一をしておく為に、抽象クラスを作ります。

### 注意
* C++ は、クラスの「前方宣言」が必要です。しかも単に <b>class XXX;</b> とだけ前方に記述した場合、クラスの<b>ポインタ</b>、つまりメモリ上の<b>アドレス</b>の確保だけしかできません。
* <b>new クラス名</b> を使って実際にインスタンスを生成する場合、記述する順序を工夫する必要があります。

### 例文
```
//test.cpp
#include <iostream> //coutに必要
using namespace std;

/****************************************
* 抽象クラス（抽象的な工場）＝「宣言」のみ
****************************************/
class AbstractFactory {
    public:
        //↓静的メンバ関数の「宣言」
        static AbstractFactory* CreateFactory(string _name);
        //↓純粋仮想関数の「宣言」（派生クラスでオーバーライドが必要）
        virtual void CreateNewYear() = 0;
        virtual void CreateSummer() = 0;
};

/********************************
* 派生クラス（実際の工場 ICHIRO）
********************************/
class ICHIRO : public AbstractFactory { //抽象クラスを継承
    public:
        void CreateNewYear(); //純粋仮想関数のオーバーライドの「宣言」
        void CreateSummer(); //純粋仮想関数のオーバーライドの「宣言」
};

void ICHIRO::CreateNewYear() { //オーバーライド
    cout << "HAPPY NEW YEAR!" << endl;
    cout << "ICHIRO NISHIMURA" << endl;
}

void ICHIRO::CreateSummer() { //オーバーライド
    cout << "暑中御見舞申し上げます" << endl;
    cout << "西村一郎" << endl;
}

/********************************
* 派生クラス（実際の工場 HANAKO）
********************************/
class HANAKO : public AbstractFactory { //抽象クラスを継承
    public:
        void CreateNewYear(); //純粋仮想関数のオーバーライドの「宣言」
        void CreateSummer(); //純粋仮想関数のオーバーライドの「宣言」
};

void HANAKO::CreateNewYear() { //オーバーライド
    cout << "明けましておめでとうございます" << endl;
    cout << "西村花子" << endl;
}

void HANAKO::CreateSummer() { //オーバーライド
    cout << "暑中おみまいもうしあげます" << endl;
    cout << "西村花子" << endl;
}

/*************************************
* 抽象クラスの静的メンバ関数の「実装」
*
* ポインタの宣言（アドレスの確保）だけでなくインスタンスを生成する場合、
* クラスの「前方宣言」だけでなく「実装」も必要です
* つまり、ICHIRO / HANAKO クラスの後に記述する必要があるのです
*************************************/
AbstractFactory* AbstractFactory::CreateFactory(string _name) {
    if (_name == "ICHIRO") {
        ICHIRO* _ichiro = new ICHIRO; //アドレスだけでなくインスタンスの生成が必要
        //↓ICHIROクラス→AbstractFactoryクラスへの「ポインタ間の変換」
        AbstractFactory* _result =  reinterpret_cast<AbstractFactory*>(_ichiro);
        return _result;

    } else if (_name == "HANAKO") {
        HANAKO* _hanako = new HANAKO; //アドレスだけでなくインスタンスの生成が必要
        //↓HANAKOクラス→AbstractFactoryクラスへの「ポインタ間の変換」
        AbstractFactory* _result =  reinterpret_cast<AbstractFactory*>(_hanako);
        return _result;	

    } else {
        //↓"ICHIRO" "HANAKO" 以外を指定した場合エラーを発生させます（オプション）
        cout << "ERROR:AbstractFactory::CreateFactory()" << endl;
    }
}

/*************
* メイン関数
*************/
int main() {
AbstractFactory* _factoryICHIRO = AbstractFactory::CreateFactory("ICHIRO");
_factoryICHIRO -> CreateNewYear();
    //↑ポインタが指しているオブジェクト（factoryICHIRO）が指している関数を呼出します
    // HAPPY NEW YEAR!
    // ICHIRO NISHIMURA

    AbstractFactory* _factoryHANAKO = AbstractFactory::CreateFactory("HANAKO");
    _factoryHANAKO -> CreateNewYear();
    //↑ポインタが指しているオブジェクト（factoryHANAKO）が指している関数を呼出します
    // 明けましておめでとうございます
    // 西村花子
    
    return 0;
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：夢寐郎  
作成日：2016年06月03日  
更新日：2017年05月05日


<a name="Adapter（継承）"></a>
# <b><ruby>Adapter<rt>アダプター</rt></ruby>（継承）</b>

### 概要
* 一皮かぶせて再利用。接続装置。
* 別名、Wrapper パターン。
* クラスによるAdapterパターン。継承を使って、オリジナルのクラスを拡張。

### 例文
```
//test.cpp
#include <iostream> //coutに必要
using namespace std;

/*****************************
* 基底クラス（Moneyboxクラス）
*****************************/
class Moneybox {
    private:
        int _yen; //メンバ変数の「宣言」
    public:
        Moneybox(int _yen); //コンストラクタの「宣言」
        void Add(int _yen); //メンバ関数の「宣言」
        int GetYen(); //メンバ関数の「宣言」
};

Moneybox::Moneybox(int _yen) { //コンストラクタの「定義」
    this -> _yen = _yen;
}

void Moneybox::Add(int _yen) { //メン関数の「定義」★
    this -> _yen += _yen;
}

int Moneybox::GetYen() { //メンバ関数の「定義」★
    return _yen;
}

/*******************************
* インターフェース（オプション）
*******************************/
class IExchange { //インターフェースクラス
    public:
        virtual void AddYen(int _yen) = 0; //純粋仮想関数
        virtual double GetDollar() = 0; //純粋仮想関数
};

/*****************************
* 派生クラス（Exchangeクラス）
******************************/
class Exchange : public Moneybox, IExchange { //継承とインターフェースの実装
    private:
        double _rate; //メンバ変数の「宣言」
    public:
        Exchange(int _firstYen, double _rate); //コンストラクタの「宣言」
        void AddYen(int _yen); //純粋仮想関数のオーバーライドの「宣言」
        double GetDollar(); //純粋仮想関数のオーバーライドの「宣言」
};

//コンストラクタの「実装」（基底クラスのコンストラクタを呼出す）
Exchange::Exchange(int _firstYen, double _rate) : Moneybox(_firstYen) {
    this -> _rate = _rate;
}

void Exchange::AddYen(int _yen) { //オーバーライド
    Add(_yen); //基底クラス（Monebox）から継承★
}

double Exchange::GetDollar() { //オーバーライド
    return GetYen() / _rate; //基底クラス（Moneybox）から継承★
} 

/**************
* メインクラス
**************/
int main() {
    Exchange _exchange(10000, 112.258); //最初の貯金10,000円、レート112.258円/ドル
    _exchange.AddYen(8000); //8,000円追加貯金
    cout << _exchange.GetYen() << endl; //残金18,000円
    cout << _exchange.GetDollar() << endl; //残金160.345ドル
    return 0;
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：夢寐郎  
作成日：2016年06月03日  
更新日：2017年05月05日


<a name="Adapter（委譲）"></a>
# <b><ruby>Adapter<rt>アダプター</rt></ruby>（委譲）</b>

```
//test.cpp
#include <iostream> //coutに必要
using namespace std;

/***************************************************
* 基底クラス（Moneyboxクラス） ←「継承」版と全く同じ
***************************************************/
class Moneybox {
    private:
        int _yen; //メンバ変数の「宣言」
    public:
        Moneybox(int _yen); //コンストラクタの「宣言」
        void Add(int _yen); //メンバ関数の「宣言」
        int GetYen(); //メンバ関数の「宣言」
};

Moneybox::Moneybox(int _yen) { //コンストラクタの「定義」
    this -> _yen = _yen;
}

void Moneybox::Add(int _yen) { //メン関数の「定義」★
    this -> _yen += _yen;
}

int Moneybox::GetYen() { //メンバ関数の「定義」★
    return _yen;
}

/*****************************************************
* インターフェース（オプション） ←「継承」版と全く同じ
*****************************************************/
class IExchange { //インターフェースクラス
    public:
        virtual void AddYen(int _yen) = 0; //純粋仮想関数
        virtual double GetDollar() = 0; //純粋仮想関数
};

/*************************************************************
* 派生クラス（Exchangeクラス） ←この内容のみ「継承」版と異なる
*************************************************************/
class Exchange : IExchange {
    private:
        Moneybox* _moneybox; //Moneyboxクラスのインスタンス（ポインタ）を格納（委譲）
        double _rate;
    public:
        Exchange(int _firstYen, double _rate); //コンストラクタ
        void AddYen(int _yen); //純粋仮想関数のオーバーライドの「宣言」
        double GetDollar(); //純粋仮想関数のオーバーライドの「宣言」
        int GetYen(); //Moneyboxを継承していないのでここでも記述
};

Exchange::Exchange(int _firstYen, double _rate) {
    _moneybox = new Moneybox(_firstYen); //ここがポイント
    this -> _rate = _rate;
}

void Exchange::AddYen(int _yen) {
    _moneybox -> Add(_yen); //ポイント
}

double Exchange::GetDollar() {
    return _moneybox -> GetYen() / _rate; //ポイント
}

int Exchange::GetYen() {
    return _moneybox -> GetYen(); //ポイント
}

/************************************
* メインクラス ←「継承」版と全く同じ
************************************/
int main() {
    Exchange _exchange(10000, 112.258); //最初の貯金10,000円、レート112.258円/ドル
    _exchange.AddYen(8000); //8,000円追加貯金
    cout << _exchange.GetYen() << endl; //残金18,000円
    cout << _exchange.GetDollar() << endl; //残金160.345ドル
    return 0;
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：夢寐郎  
作成日：2016年06月06日  
更新日：2017年05月05日


<a name="Bridge"></a>
# <b><ruby>Bridge<rt>ブリッジ</rt></ruby></b>

```
//test.cpp
#include <iostream> //coutに必要
using namespace std;

/***********************************
* 抽象クラス＝「実装」クラスの最上位
***********************************/
class AbstractOS { //抽象クラス
    public: virtual string RawVersion() = 0; //純粋仮想関数
};

/************************************
*「実装」の具体的な実装者① : Android
************************************/
class Android : public AbstractOS {
    private: string _version; //メンバ定数の宣言
    public:
        Android(); //コンストラクタの宣言
        string RawVersion(); //純粋仮想関数のオーバーライドの宣言 
};
Android::Android() { //コンストラクタの定義
    _version = "Android 7.1.2";
}
string Android::RawVersion() { //純粋仮想関数のオーバーライドの定義
    return _version;
}

/**********************************
* 「実装」の具体的な実装者② : iOS
**********************************/
class IOS : public AbstractOS {
    private: string _version; //メンバ定数の宣言
    public:
        IOS(); //コンストラクタの宣言
        string RawVersion(); //純粋仮想関数のオーバーライドの宣言 
};
IOS::IOS() { //コンストラクタの定義
    _version = "iOS 10.3.1";
}
string IOS::RawVersion() { //純粋仮想関数のオーバーライドの定義
    return _version;
}

/*************************************
* 基底クラス＝「機能」のクラスの最上位
*************************************/
class SuperMobile {
private: AbstractOS* _os; //「機能」クラスと「実装」クラスの「橋」（委譲）
    public:
        SuperMobile(AbstractOS* _os); //コンストラクタの宣言
        string Version(); //メンバ関数の宣言（派生クラスに継承）
};
SuperMobile::SuperMobile(AbstractOS* _os) { //コンストラクタの定義
    this -> _os = _os;
}
string SuperMobile::Version() {
    return _os -> RawVersion(); //「橋」を使って「実装」クラスにアクセス
}

/**************************************************
* 「機能」のクラスに機能を追加したクラス① : Tablet
**************************************************/
class Tablet : public SuperMobile {
    public:
        Tablet(AbstractOS* _os); //コンストラクタの宣言
        void BigScreen(); //メンバ関数の宣言
};
//コンストラクタの定義（基底クラスのコンストラクタを呼出します）
Tablet::Tablet(AbstractOS* _os) : SuperMobile(_os) {}
void Tablet::BigScreen() { //メンバ関数の定義（タブレット特有の機能）
    cout << "大きな画面で見る" << endl;
}

/******************************************************
* 「機能」のクラスに機能を追加したクラス② : SmartPhone
******************************************************/
class SmartPhone : public SuperMobile {
    public:
        SmartPhone(AbstractOS* _os); //コンストラクタの宣言
        void Phone(); //メンバ関数の宣言
};
//コンストラクタの定義（基底クラスのコンストラクタを呼出します）
SmartPhone::SmartPhone(AbstractOS* _os) : SuperMobile(_os) {}
void SmartPhone::Phone() { //メンバ関数の定義（スマートフォン特有の機能）
    cout << "電話をかける" << endl;
}

/********
* main
********/
int main() {
    //タブレット（Android）
    Tablet* _tablet1 = new Tablet(new Android); //インスタンスの生成
    cout << _tablet1 -> Version() << endl; //"Android 7.1.2"
    _tablet1 -> BigScreen(); //"おおきな画面で見る"
    
    //タブレット（iOS）
    Tablet* _tablet2 = new Tablet(new IOS); //インスタンスの生成
    cout << _tablet2 -> Version() << endl; //"Android 7.1.2"
    
    //スマホ（Android）
    SmartPhone* _smartPhone1 = new SmartPhone(new Android); //インスタンスの生成
    cout << _smartPhone1 -> Version() << endl; //"Android 7.1.2"
    _smartPhone1 -> Phone(); //"おおきな画面で見る"
    
    //スマホ（iOS）
    SmartPhone* _smartPhone2 = new SmartPhone(new IOS); //インスタンスの生成
    cout << _smartPhone2 -> Version() << endl; //"Android 7.1.2"
    return 0;
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：夢寐郎  
作成日：2016年06月06日  
更新日：2017年05月05日


<a name="Composite"></a>
# <b><ruby>Composite<rt>コンポジット</rt></ruby></b>

### 概要
* 容器と中身の同一視。合成物。
* 代表的な例はファイルシステム。ディレクトリとファイルは異なるものですが、どちらも「ディレクトリの中に入れることができるもの」です。つまり、同じ種類のものであると見なしている＝同一視です。 ディレクトリ（＝容器）とファイル（＝中身）の両方にとって、共通のインターフェースとして機能し「同じメソッド」を呼び出せるようにするのです。
* 以下のサンプルは root に Authoring フォルダを作成し、その中に Unity3D と Unreal Engine ファイルを格納してみます。

### 例文
```
//test.cpp
#include <iostream> //coutに必要
#include <vector> //vectorに必要
using namespace std;

class Folder; //前方宣言

/*********************************
* 抽象クラス（同一視するための役）
*********************************/
class Component {
    protected:
        //共通のメンバ変数の「宣言」
        string _name;
        Folder* _parent; //前方宣言が必須
    public:
        //共通のメンバ関数の「宣言」
        string GetName();
        Folder* Parent(); //getter
        void Parent(Folder* arg); //setter
        //純粋仮想関数（オーバーライド必須）
        virtual void GetList() = 0;
};
//共通のメンバ関数の「定義」
string Component::GetName() {
    return _name;
}
Folder* Component::Parent() { //getter
    return _parent;
}
void Component::Parent(Folder* arg) { //setter
    _parent = arg;
}

/***********
* フォルダ
***********/
class Folder : public Component { //抽象クラスを継承
    private:
        vector<Component*> _childList; //フォルダやファイルを格納する配列
    public:
        Folder(string _name); //コンストラクタの「宣言」
        void Add(Component* arg); //メンバ関数の「宣言」
        void GetList(); //純粋仮想関数のオーバーライドの「宣言」
};
Folder::Folder(string _name) { //コンストラクタの「定義」
    this -> _name = _name; //抽象クラスから継承したメンバ変数
}
void Folder::Add(Component* arg) { //メンバ関数の「定義」（Remove()は今回は省略）
    _childList.push_back(arg);
    arg -> Parent(this);
}
void Folder::GetList() { //純粋仮想関数のオーバーライドの「定義」
    for (auto tmp : _childList) {
        string _result = this -> GetName() + "/" + tmp -> GetName();
        //↓tmpが「Folder」クラスのインスタンスか調べる
        if (dynamic_cast<Folder*>(tmp) == false) { //普通は「!」を使いますが...
            _result += "(File)";
        } else {
            _result += "(Folder)";
        }
        cout << _result << endl;
    }
}

/***********
* ファイル
***********/
class File : public Component { //抽象クラスを継承
    public:
        File(string _name); //コンストラクタの「宣言」
        void GetList(); //純粋仮想関数のオーバーライドの「宣言」
};
File::File(string _name) { //コンストラクタの「定義」
    this -> _name = _name; //抽象クラスから継承したメンバ変数
}
void File::GetList() { //純粋仮想関数のオーバーライドの「定義」
    cout << this->Parent()->GetName() + "/" + this->GetName() + "(File)" << endl;
}

/*************
* メイン関数
*************/
int main() {
    //①フォルダの作成
    Folder _root("root");
    Folder authoring_("Authoring");

    //②ファイルの作成
    File _unity3D("Unity3D");
    File _unrealEngine("Unreal Engine");

    //③関連付け
    _root.Add(&authoring_); //&○○にする（変数のアドレス）
    authoring_.Add(&_unity3D); //&○○にする（変数のアドレス）
    authoring_.Add(&_unrealEngine); //&○○にする（変数のアドレス）
    
    //④検証
    cout << _unrealEngine.GetName() << endl; // Unreal Engine
    _root.GetList(); // root/Authoring(Folder)
    authoring_.GetList();
    // Authoring/Unity3D(File)
    // Authoring/Unreal Engine(File)
    _unity3D.GetList(); //Authoring/Unity3D(File)

    return 0;
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：夢寐郎  
作成日：2016年06月06日  
更新日：2017年05月05日


<a name="Decorator"></a>
# <b><ruby>Decorator<rt>デコレータ</rt></ruby></b>

```
//test.cpp
#include <iostream> //coutに必要
using namespace std;

/*************************************************
* 基本クラス
*「中身」と「飾り」に同じShow()関数を持たせるため
*************************************************/
class Display {
    protected: string _content; //メンバ定数の「宣言」
    public:
        string Content(); //getterの「浅間」
        void Show(); //メンバ関数の「宣言」
};
string Display::Content() { //getterの「定義」
    return _content;
}
void Display::Show() { //メンバ関数の「定義」
    cout << _content << endl;
}

/*************************
* 中身（飾りを施す魔の元）
*************************/
class Original : public Display {
    public: Original(string arg); //コンストラクタの「宣言」
};
Original::Original(string arg) { //コンストラクタの「定義」
    _content = arg;
}

/***********
* 飾り枠①
***********/
class Decorator1 : public Display {
    public: Decorator1(Display* _display); //コンストラクタの「宣言」
};
Decorator1::Decorator1(Display* _display) { //コンストラクタの「定義」
    _content = "-" + (_display -> Content()) + "-"; //飾り①を付ける
}

/***********
* 飾り枠②
***********/
class Decorator2 : public Display {
    public: Decorator2(Display* _display); //コンストラクタの「宣言」
};
Decorator2::Decorator2(Display* _display) { //コンストラクタの「定義」
    _content = "<" + (_display -> Content()) + ">"; //飾り②を付ける
}

/*************
* メイン関数
*************/
int main() {
    //検証（その１）
    Display* _original = new Original("CHIKASHI");
    _original -> Show(); //"CHIKASHI"

    //検証（その２）
    Display* _decorator1 = new Decorator1(new Original("CHIKASHI"));
    _decorator1 -> Show(); //"-CHIKASHI-"

    //検証（その３）
    Display* _decorator2 = new Decorator2(new Original("CHIKASHI"));
    _decorator2 -> Show(); //"<CHIKASHI>"

    //検証（その４）
    Display* _special = new Decorator2(
                                new Decorator1(
                                    new Decorator1(
                                        new Decorator1(
                                            new Original("CHIKASHI")
                                        )
                                    )
                                )
                            );
    _special -> Show(); //<---CHIKASHI--->

    return 0;
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：夢寐郎  
作成日：2016年06月06日  
更新日：2017年05月05日


<a name="Facade"></a>
# <b><ruby>Facade<rt>ファサード</rt></ruby></b>

### 概要
* シンプルな窓口。見かけ。
* ファサード＝「建物の正面」の意味。
* たくさんのクラスやメソッドを、このパターン（窓口）を使うことでシンプルにして迷いを生じさせないようにします。
* 以下の例文では、「Decoratorパターン」を Facade パターンでシンプルにします。
    ```
    Display* _special = new Decorator2(
                                new Decorator1(
                                    new Decorator1(
                                        new Decorator1(
                                            new Original("CHIKASHI")))));
    _special -> Show();
    ```
    …としていたものを次の1行で実現可能になります。
    ```
    DecoratorFacade::Exec("CHIKASHI", 3, 1)
    ```

### 例文
```
//test.cpp
#include <iostream> //coutに必要
using namespace std;

/*************************************************
* 基本クラス
*「中身」と「飾り」に同じShow()関数を持たせるため
*************************************************/
class Display {
    protected: string _content; //メンバ定数の「宣言」
    public:
        string Content(); //getterの「浅間」
        void Show(); //メンバ関数の「宣言」
};
string Display::Content() { //getterの「定義」
    return _content;
}
void Display::Show() { //メンバ関数の「定義」
    cout << _content << endl;
}

/*************************
* 中身（飾りを施す魔の元）
*************************/
class Original : public Display {
    public: Original(string arg); //コンストラクタの「宣言」
};
Original::Original(string arg) { //コンストラクタの「定義」
    _content = arg;
}

/***********
* 飾り枠①
***********/
class Decorator1 : public Display {
    public: Decorator1(Display* _display); //コンストラクタの「宣言」
};
Decorator1::Decorator1(Display* _display) { //コンストラクタの「定義」
    _content = "-" + (_display -> Content()) + "-"; //飾り①を付ける
}

/***********
* 飾り枠②
***********/
class Decorator2 : public Display {
    public: Decorator2(Display* _display); //コンストラクタの「宣言」
};
Decorator2::Decorator2(Display* _display) { //コンストラクタの「定義」
    _content = "<" + (_display -> Content()) + ">"; //飾り②を付ける
}

/*************************************************************
* シンプルな窓口 ←Decoratorパターンにこのクラスを追加するだけ
*************************************************************/
class DecoratorFacade {
    private:
        DecoratorFacade() {}; //コンストラクタ←外部からnewできないようにする
    public:
        static void Exec(string arg1, int arg2, int arg3);
};
void DecoratorFacade::Exec(string arg1, int arg2=0, int arg3=0) {
    Display* _result = new Original(arg1);
    for (int i=0; i<arg2; i++) {
        _result = new Decorator1(_result);
    }
    for (int j=0; j<arg3; j++) {
        _result = new Decorator2(_result);
    }
    _result -> Show();
}

/*************
* メイン関数
*************/
int main() {
    DecoratorFacade::Exec("CHIKASHI"); //"CHIKASHI"
    DecoratorFacade::Exec("CHIKASHI", 1, 0); //"-CHIKASHI-"
    DecoratorFacade::Exec("CHIKASHI", 0, 1); //"<CHIKASHI>"
    DecoratorFacade::Exec("CHIKASHI", 3, 1); //<---CHIKASHI--->
    return 0;
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：夢寐郎  
作成日：2016年06月07日  
更新日：2017年05月05日


<a name="Flyweight"></a>
# <b><ruby>Flyweight<rt>フライウエイト</rt></ruby></b>

```
//test.cpp
#include <iostream> //coutに必要
#include <map> //mapクラスに必須
using namespace std;

/****************************************************************
* フライ級の役（メモリの使用量が多いため無駄に生成したくないもの）
****************************************************************/
class Big {
    private:
        string _type;
    public:
        Big(string arg); //コンストラクタの「宣言」
        void Exec(); //メンバ関数の「宣言」
};
Big::Big(string arg) { //コンストラクタの「実装」
    _type = arg;
}
void Big::Exec() {
    cout << _type <<"に対応した非常に重い処理" << endl;
}

/*******************************************
* インスタンスの管理人（シングルトンクラス）
*******************************************/
class Manager { //シングルトンクラス
    private:
        Manager() {}; //コンストラクタ（private）
        static Manager* _manager; //静的メンバ変数の「宣言」
        map<string, Big*> _map; //連想配列
    public:
        static Manager* Instance(); //静的メンバ関数 の「宣言」
        Big* CreateReader(string arg);
};

Manager* Manager::_manager = new Manager; //静的メンバ変数 の「実装」

Manager* Manager::Instance() { //静的メンバ関数 の「実装」
    return _manager;
}

Big* Manager::CreateReader(string arg) {
    auto _iterator = _map.find(arg); //既存か否か調べる
    if (_iterator == _map.end()) { //存在しない場合...
        _map[arg] = new Big(arg); //ここでやっとnew XXX
    } else { //存在する場合...
        cout << "既存です" << endl;
    }
    return _map[arg];
}

/*************
* メイン関数
*************/
int main() {
    //インスタンスの管理者を作る（シングルトンクラス）
    Manager* _manager = Manager::Instance();

    //無駄に生成したくないオブジェクトを生成（既存の場合は使い回す）
    Big* A_ = _manager -> CreateReader("A");
    Big* B_ = _manager -> CreateReader("B");

    //既存のものを生成しようとすると...
    Big* A2_ = _manager -> CreateReader("A"); //=> "既存です"
    cout << (int)(A_ == A2_) << endl; //1（true）←中身は同じインスタンス

    //処理
    A_ -> Exec(); //=> "Aに対応した非常に重い処理"
    B_ -> Exec(); //=> "Bに対応した非常に重い処理"

    return 0;
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：夢寐郎  
作成日：2016年06月07日  
更新日：2017年05月05日


<a name="Proxy"></a>
# <b><ruby>Proxy<rt>プロキシー</rt></ruby></b>

```
//test.cpp
#include <iostream> //coutに必要
using namespace std;

/*************************
* ①と②のインターフェース
*************************/
class ILoader {
    public: virtual void Load() = 0; //純粋可能関数（オーバーロードが必須）
};

/***************
* ②実際の本人
***************/
class Content : public ILoader { //インターフェースを実装
    private:
        string _path;
    public:
        Content(string _path); //コンストラクタの「宣言」
        void Load(); //純粋可能関数のオーバーロードの「宣言」
};

Content::Content(string _path) { //コンストラクタの「定義」
    this -> _path = _path;
}

void Content::Load() { //純粋可能関数のオーバーロードの「定義」
    //↓重い処理をここで行う（ポイント）
    cout << _path << " から重いファイルをダウンロード" << endl;
}

/********************
* ①代理人（Proxy）役
********************/
class Loader : public ILoader { //インターフェースを実装
    private:
        string _path;
    public:
        Loader(string _path); //コンストラクタの「宣言」
        void Load(); //純粋可能関数のオーバーロードの「宣言」
};

Loader::Loader(string _path) { //コンストラクタの「定義」
    this -> _path = _path;
}

void Loader::Load() { //純粋可能関数のオーバーロードの「定義」
    //②実際の本人が登場←代理人は実際の本人を知っている
    Content* _content = new Content(_path);
    _content -> Load();
}

// メイン関数 ====================================================================
int main() {
    Loader* loader_ = new Loader("http://XXXX"); //代理人（Proxy）役
    //実際には必要になった時にロードしますが...
    loader_ -> Load(); //http://XXXX から重いファイルをダウンロード
    return 0;
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：夢寐郎  
作成日：2016年06月07日  
更新日：2017年05月05日


<a name="Iterator"></a>
# <b><ruby>Iterator<rt>イテレータ</rt></ruby></b>

```
//test.cpp
#include <iostream> //coutに必要
#include <vector> //vectorに必要
using namespace std;

class BikePark; //前方宣言

/*************
* Bikeクラス
*************/
class Bike {
    private:
        string _name, _number;
    public:
        Bike(string _name, string _number); //コンストラクタの宣言
        string Name(); //getter
        string Number(); //getter
};
Bike::Bike(string _name, string _number) { //コンストラクタの定義
    this -> _name = _name;
    this -> _number = _number;
}
string Bike::Name() { return _name; } //getter
string Bike::Number() { return _number; } //getter

/***********************************
* Iteratorクラス（≒駐輪場の管理人）
***********************************/
class IIterator { //インターフェース
    public:
        virtual bool HasNext() = 0; //純粋仮想関数（オーバーライド必須）
        virtual Bike* Next() =0; //純粋仮想関数（オーバーライド必須）
};
class Iterator : public IIterator { //インターフェースの実装
    private:
        BikePark* _bikePark; //メンバ定数の宣言
        int _count;
    public:
        Iterator(BikePark* arg); //コンストラクタの宣言（前方宣言が前提）
        bool HasNext(); //純粋仮想関数のオーバーライドの宣言
        Bike* Next(); //純粋仮想関数のオーバーライドの宣言
};
Iterator::Iterator(BikePark* arg) { //コンストラクタの定義
    _bikePark = arg;
    _count = 0;
}

/****************
* BikeParkクラス
****************/
class IBikePark { //インターフェース
    public:
        //純粋仮想関数（オーバーライド必須）
        virtual void Add(Bike* _bike) = 0;
        virtual Bike* GetBikeAt(int arg) = 0;
        virtual int Length() = 0;
        virtual Iterator* CreateIterator() = 0;
};
class BikePark : public IBikePark { //インターフェースの実装
    private:
        vector<Bike*> _vector; //vector配列の宣言
    public:
        //メンバ関数の宣言
        void Add(Bike* _bike);
        Iterator* CreateIterator(); 
        int Length();
        Bike* GetBikeAt(int arg);
};
void BikePark::Add(Bike* _bike) { //純粋仮想関数のオーバーライドの実装
    _vector.push_back(_bike); //配列に値を追加
}
Bike* BikePark::GetBikeAt(int arg) { //純粋仮想関数のオーバーライドの実装
    return _vector[arg]; //配列の値を取得
}
int BikePark::Length() { //純粋仮想関数のオーバーライドの実装
    return _vector.size(); //配列の要素数を調べる
}
Iterator* BikePark::CreateIterator() { //純粋仮想関数のオーバーライドの実装
    return new Iterator(this); //Iteratorの生成
}

/*************************************************
* Iteratorクラス純粋仮想関数のオーバーライドの実装
*************************************************/
bool Iterator::HasNext() {
    return _bikePark -> Length() > _count; //次のバイクがあるか否か
}
Bike* Iterator::Next() {
    return _bikePark -> GetBikeAt(_count++); //次のバイクを返す
}

/***********
* main関数
***********/
int main() {
    BikePark* _bikePark = new BikePark;
    _bikePark -> Add(new Bike("FLSTC", "岐阜 の 45-03"));
    _bikePark -> Add(new Bike("FXDL", "春日部 し 33-73"));
    _bikePark -> Add(new Bike("XL883N", "秋田 ら 14-28"));

    Iterator* _iterator = _bikePark -> CreateIterator(); //イテレータ（管理人）生成

    while (_iterator -> HasNext()) {
        Bike* next_bike = _iterator -> Next();
        cout << next_bike -> Name() << "/" << next_bike -> Number() << endl;
    }

    return 0;
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：夢寐郎  
作成日：2016年06月08日  
更新日：2017年05月05日


<a name="TemplateMethod"></a>
# <b><ruby>Template Method<rt>テンプレート メソッド</rt></ruby></b>

```
//test.cpp
#include <iostream> //coutに必要
using namespace std;

/*************
* 抽象クラス
*************/
class AbstractCard {
    public:
        void TemplateMethod(); //継承するメンバ関数（＝一連の連続した処理の枠組み）の宣言
    private:
        void Order1(); //メンバ関数（＝共通の処理①）の宣言
        void Order2(); //メンバ関数（＝共通の処理②）の宣言
    protected:
        virtual void Order3() = 0; //純粋仮想関数（オーバーライド必須）
        virtual bool IsChild() = 0; //純粋仮想関数（オーバーライド必須）
};
//継承するメンバ関数（＝一連の連続した処理の枠組み）の定義
void AbstractCard::TemplateMethod() {
    Order1(); //共通の処理①
    if (!IsChild()) { //児童（小学生以下）でなければ...
        Order2(); //条件により実行
    }
    Order3(); //独自の処理（派生クラスでオーバーライド）
}
void AbstractCard::Order1() { //メンバ関数（＝共通の処理①）の定義
    cout << "HAPPY NEY YEAR!" << endl;
};
void AbstractCard::Order2() { //メンバ関数（＝共通の処理②）の定義
    cout << "勉強頑張ろう" << endl;
};

/*********************************
* 派生クラス①（抽象クラスを継承）
*********************************/
class CardHanako : public AbstractCard {
    protected:
        void Order3(); //純粋仮想関数のオーバーライドの宣言
        bool IsChild(); //純粋仮想関数のオーバーライドの宣言
};
void CardHanako::Order3() { //純粋仮想関数のオーバーライドの定義
    cout << "テニスがんばろうね" << endl;
}
bool CardHanako::IsChild() { return true; } //純粋仮想関数のオーバーライドの定義

/*********************************
* 派生クラス②（抽象クラスを継承）
*********************************/
class CardICHIRO : public AbstractCard {
    protected:
        void Order3(); //純粋仮想関数のオーバーライドの宣言
        bool IsChild(); //純粋仮想関数のオーバーライドの宣言
};
void CardICHIRO::Order3() { //純粋仮想関数のオーバーライドの定義
    cout << "テニス頑張ろう" << endl;
}
bool CardICHIRO::IsChild() { return false; } //純粋仮想関数のオーバーライドの定義

/*************
* メイン関数
*************/
int main() {
    CardHanako* cardHanako_ = new CardHanako;
    cardHanako_ -> TemplateMethod();
    //HAPPY NEY YEAR!
    //テニスがんばろうね

    CardICHIRO* _CardIchiro = new CardICHIRO;
    _CardIchiro -> TemplateMethod();
    //HAPPY NEY YEAR!
    //勉強頑張ろう
    //テニス頑張ろう

    return 0;
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：夢寐郎  
作成日：2016年06月08日  
更新日：2017年05月05日


<a name="Strategy"></a>
# <b><ruby>Strategy<rt>ストラテジー</rt></ruby></b>

### 概要
* アルゴリズムをごっそり切り替える。戦略。Strategy ＝作戦。アルゴリズム（手順）。
* State パターン（後述）に似ていますが、State パターンの場合は...
    ```
    new Context()
    ```
    Strategyパターンの場合は次の通りになります。
    ```
    new Context(new Strategy())
    ```

### 例文
```
//test.cpp
#include <iostream> //coutに必要
using namespace std;

/******************************
* StrategyXXXのインターフェース
******************************/
class IStrategy {
    public:
        virtual void Execute() = 0; //純粋仮想関数（オーバーライド必須）
};

/****************
 * StrategyBクラス
****************/
class StrategyA : public IStrategy {
    public:
        void Execute(); //純粋仮想関数のオーバーライドの宣言
};

void StrategyA::Execute() { //純粋仮想関数のオーバーライドの定義
    cout << "グー、グー、パー" << endl;
}

/****************
 * StrategyBクラス
****************/ 
class StrategyB : public IStrategy {
    public:
        void Execute(); //純粋仮想関数のオーバーライドの宣言
};

void StrategyB::Execute() { //純粋仮想関数のオーバーライドの定義
    cout << "パー、グー、チョキ" << endl;
}

/**************
 * Jankenクラス
**************/
class Janken {
    private:
        IStrategy* _strategy; //メンバ変数の宣言 ←Strategy○のインスタンスを格納
    public:
        Janken(IStrategy* _strategy); //コンストラクタの宣言
        void Exec(); //メンバ関数の宣言
};

Janken::Janken(IStrategy* _strategy) { //コンストラクタの定義
    this -> _strategy = _strategy;
}

void Janken::Exec() { //メンバ関数の定義
    _strategy -> Execute(); //Exec()だと紛らわしいので...
}

/*************
 * メイン関数
*************/
int main() {
    Janken* _jankenA = new Janken(new StrategyA);
    Janken* _jankenB = new Janken(new StrategyB);

    _jankenA -> Exec(); //グー、グー、パー
    _jankenB -> Exec(); //パー、グー、チョキ

    return 0;
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：夢寐郎  
作成日：2016年06月08日  
更新日：2017年05月06日


<a name="Visitor"></a>
# <b><ruby>Visitor<rt>ビジター</rt></ruby></b>

```
//test.cpp
#include <iostream> //coutに必要
using namespace std;

/*********
 * 訪問者
*********/
class IVisitor { //訪問者のインターフェース
    public:
        virtual int GetMoney() = 0; //純粋仮想関数
        virtual void Visit(int _otoshidama) = 0; //純粋仮想関数
};

/*******
 * 一郎
*******/
class Ichiro : public IVisitor { //インターフェースの実装
    private:
        int _money; //メンバ変数の宣言
    public:
        Ichiro(); //コンストラクタの宣言
        int GetMoney(); //メンバ関数の宣言
        void Visit(int _otoshidama);
};
Ichiro::Ichiro() { //コンストラクタの定義
    _money = 0;
}

int Ichiro::GetMoney() {
    return _money;
}

void Ichiro::Visit(int _otoshidama) {
    _money += _otoshidama;
}

/*******
 * 花子
*******/
class Hanako : public IVisitor { //インターフェースの実装
    private:
        int _money; //メンバ変数の宣言
    public:
        Hanako(); //コンストラクタの宣言
        int GetMoney(); //メンバ関数の宣言
        void Visit(int _otoshidama);
};
Hanako::Hanako() { //コンストラクタの定義
    _money = 0;
}
int Hanako::GetMoney() {
    return _money;
}
void Hanako::Visit(int _otoshidama) {
    _money += _otoshidama;
}

/*********
 * 訪問先
*********/
class IAcceptor { //訪問先のインターフェース
    public:
        virtual void Accept(IVisitor* _visitor) = 0; //純粋仮想関数（オーバーライド必須）
};

class Hokkaido : public IAcceptor { //インターフェースの実装
    public:
        void Accept(IVisitor* _visitor); //純粋仮想関数のオーバーライドの宣言
};
void Hokkaido::Accept(IVisitor* _visitor) { //純粋仮想関数のオーバーライドの定義
    _visitor -> Visit(5000*2); //誰が訪問してきても同じメソッドを実行
}

class Chiba : public IAcceptor { //インターフェースの実装
    public:
        void Accept(IVisitor* _visitor); //純粋仮想関数のオーバーライドの宣言
};

void Chiba::Accept(IVisitor* _visitor) { //純粋仮想関数のオーバーライドの定義
    _visitor -> Visit(5000); //誰が訪問してきても同じメソッドを実行
}

/*************
 * メイン関数
*************/
int main() {
    //訪問先
    Hokkaido* _Hokkaido = new Hokkaido; //埼玉実家
    Chiba* _Chiba = new Chiba; //宮島家

    //訪問者
    Ichiro* _ichiro = new Ichiro; //一郎
    Hanako* _hanako = new Hanako; //花子 

    //訪問する（訪問側から見ると「受け入れる」）
    _Hokkaido -> Accept(_ichiro);
    _Hokkaido -> Accept(_hanako);
    _Chiba -> Accept(_ichiro);
    _Chiba -> Accept(_hanako);

    //結果...
    cout << _ichiro -> GetMoney() << endl; //15000
    cout << _hanako -> GetMoney() << endl; //15000

    return 0;
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：夢寐郎  
作成日：2016年06月08日  
更新日：2017年05月06日


<a name="ChainofResponsibility"></a>
# <b><ruby>Chain of Responsibility<rt>チェーン オブ レスポンシビリティ</rt></ruby></b>

```
//test.cpp
#include <iostream> //coutに必要
#include <regex> //正規表現に必要
using namespace std;

//=====================
// 各郵便局の抽象クラス
//=====================
class AbstractPO {
    protected: //派生クラスでも利用する為
        AbstractPO* nextPO_; //継承するメンバ変数 ←たらいまわし先（ポイント）
    public:
        AbstractPO* SetNext(AbstractPO* po_); //継承する関数（共通の機能）の宣言
        virtual void Send(string address_) = 0; //純粋仮想関数（オーバーライド必須）
};
AbstractPO* AbstractPO::SetNext(AbstractPO* po_) { //継承する関数（共通の機能）の定義
    nextPO_ = po_;
}

//=====================
// 新宿郵便局
//=====================
class ShinjukuPO : public AbstractPO { //抽象クラスの実装
    public: void Send(string address_); //純粋仮想関数のオーバーライドの宣言
};
void ShinjukuPO::Send(string address_) { //純粋仮想関数のオーバーライドの定義
    regex regex_("新宿");
    if (regex_search(address_, regex_)) { //住所に"新宿"が含まれている場合
        cout << "本日中に届きます" << endl;
    } else { //住所に"新宿"が含まれていない場合...
        nextPO_ -> Send(address_); //たらいまわし先に振る（ポイント）
    }
}

//=====================
// 東京郵便局
//=====================
class TokyoPO : public AbstractPO { //抽象クラスの実装
    public: void Send(string address_); //純粋仮想関数のオーバーライドの宣言
};
void TokyoPO::Send(string address_) { //純粋仮想関数のオーバーライドの定義
    regex regex_("東京");
    if (regex_search(address_, regex_)) { //住所に"東京"が含まれている場合
        cout << "明後日中に届きます" << endl;
    } else { //住所に"東京"が含まれていない場合...
        nextPO_ -> Send(address_); //たらいまわし先に振る（ポイント）
    }
}

//==========================
// 日本郵便局
//==========================
class JapanPO : public AbstractPO { //抽象クラスの実装
    public: void Send(string address_); //純粋仮想関数のオーバーライドの宣言
};
void JapanPO::Send(string address_) { //純粋仮想関数のオーバーライドの定義
    cout << "一週間前後で届きます" << endl;
}

//==========================
// メイン関数
//==========================
int main() {
    //各郵便局の設置
    AbstractPO* _setagayaPO = new ShinjukuPO;
    AbstractPO* _tokyoPO = new TokyoPO;
    AbstractPO* _japanPO = new JapanPO;

    //責任のたらいまわし先のセット（注意：C#等とは異なり別々に設定）
    _setagayaPO -> SetNext(_tokyoPO);
    _tokyoPO -> SetNext(_japanPO);

    //投函（ぜんぶ新宿郵便局に投函する）
    _setagayaPO -> Send("新宿区XX町X-X-X"); //本日中に届きます
    _setagayaPO -> Send("東京都青梅市XXX町X-X-X"); //明後日中に届きます
    _setagayaPO -> Send("北海道XXX市XXX町X-X-X"); //一週間前後で届きます
    return 0;
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：夢寐郎  
作成日：2016年06月08日  
更新日：2017年05月06日


<a name="Mediator"></a>
# <b><ruby>Mediator<rt>メディエイター</rt></ruby></b>

```
//test.cpp
#include <iostream> //coutに必要
#include <vector> //vector配列に必要
using namespace std;

class Mediator; //前方宣言

/**********************
 * メンバXXXの抽象クラス
**********************/
class AbstractMember {
    protected:
        Mediator* mediator_; //継承する変数（共通の変数）の宣言←相談役を格納
    public:
        void SetMediator(Mediator* mediator_); //継承する関数（共通の機能）の宣言
        //↓純粋仮想関数（オーバーライド必須）
        virtual void Request(string arg) = 0; 
        virtual void Advice(string arg) = 0;
};

void AbstractMember::SetMediator(Mediator* mediator_) { //継承する関数（共通の機能）の定義
    this -> mediator_ = mediator_;
}

/****************************
 *  メンバXXX : 関数の「宣言」
****************************/
class MemberA : public AbstractMember { //抽象クラスの実装
    public:
        void Request(string arg); //純粋仮想関数のオーバーライドの宣言
        void Advice(string arg); //純粋仮想関数のオーバーライドの宣言
};

class MemberB : public AbstractMember { //抽象クラスの実装
    public:
        void Request(string arg); //純粋仮想関数のオーバーライドの宣言
        void Advice(string arg); //純粋仮想関数のオーバーライドの宣言
};

class MemberC : public AbstractMember { //抽象クラスの実装
    public:
        void Request(string arg); //純粋仮想関数のオーバーライドの宣言
        void Advice(string arg); //純粋仮想関数のオーバーライドの宣言
};

/***********************************
 * 相談役（専門性が高いため使い捨て）
***********************************/
class Mediator {
    private:
        static vector<AbstractMember*> MEMBER_LIST; //vector配列の宣言
    public:
        Mediator(); //コンストラクタの宣言
        static AbstractMember* MEMBER_A; //静的メンバ変数の宣言
        static AbstractMember* MEMBER_B; //静的メンバ変数の宣言
        static AbstractMember* MEMBER_C; //静的メンバ変数の宣言
        void AddMember(AbstractMember* member_); //メンバ関数の宣言
        void RequestBack(AbstractMember* member_, string _string); //メンバ関数の宣言
};

//静的メンバ変数の定義
vector<AbstractMember*> Mediator::MEMBER_LIST = {}; 
AbstractMember* Mediator::MEMBER_A = new MemberA;
AbstractMember* Mediator::MEMBER_B = new MemberB;
AbstractMember* Mediator::MEMBER_C = new MemberC;

Mediator::Mediator() { //コンストラクタの実装
    //メンバの登録
    AddMember(MEMBER_A);
    AddMember(MEMBER_B);
    AddMember(MEMBER_C);
}

//メンバリストに登録
void Mediator::AddMember(AbstractMember* member_) { //メンバ関数の実装
    MEMBER_LIST.push_back(member_); //vector配列に追加
    member_ -> SetMediator(this); //メンバーに相談役は自分であることを教える
}

//メンバから報告を受けて指示を出す（特に専門性が高い関数）
void Mediator::RequestBack(AbstractMember* member_, string _string) {
    if (member_ == MEMBER_A) {
        if (_string == "西へ行く") {
            //メンバＡから”西へ行く"と報告があった場合の処理...
            member_ -> Advice("（Ａよ）了解、そのまま西へ行け"); //Ａへの指示

            //↓メンバＡ以外への処理
            for (AbstractMember* theMember_ : MEMBER_LIST) {
                if (theMember_ == MEMBER_B) {
                    theMember_ -> Advice("（Ｂよ）東へ行け"); //Ｂへの指示
                } else if (theMember_ == MEMBER_C) {
                    theMember_ -> Advice("（Ｃよ）その場で待機しろ"); //Ｃへの指示
                }
            }
        }
    }
    //以後、各メンバからの報告内容に対する処理を記述......
}

/***************************
 *  メンバXXX : 関数の「実装」
***************************/
//メンバＡ用
void MemberA::Request(string arg) { //純粋仮想関数のオーバーライドの実装
    //ここにメンバＡ独自の処理
    mediator_ -> RequestBack(this, arg); //相談役に報告
}
void MemberA::Advice(string arg) { //純粋仮想関数のオーバーライドの実装
    cout << "MemberA: "  << arg << endl;
}

//メンバＢ用
void MemberB::Request(string arg) { //純粋仮想関数のオーバーライドの実装
    //ここにメンバＢ独自の処理
    mediator_ -> RequestBack(this, arg); //相談役に報告
}
void MemberB::Advice(string arg) { //純粋仮想関数のオーバーライドの実装
    cout << "MemberB: "  << arg << endl;
}

//メンバＣ用
void MemberC::Request(string arg) { //純粋仮想関数のオーバーライドの実装
    //ここにメンバＣ独自の処理
    mediator_ -> RequestBack(this, arg); //相談役に報告
}

void MemberC::Advice(string arg) { //純粋仮想関数のオーバーライドの実装
    cout << "MemberC: "  << arg << endl;
}

/*************
 * メイン関数
*************/
int main() {
    //相談役（コンストラクタを呼び出すだけが目的）
    new Mediator; //今回のサンプルではインスタンスは未使用

    //相談役へ、メンバＡから「西へ行く」と報告があった場合...
    Mediator::MEMBER_A -> Request("西へ行く"); //今回は静的メンバ変数を利用
    //MemberA: （Ａよ）了解、そのまま西へ行け
    //MemberB: （Ｂよ）東へ行け
    //MemberC: （Ｃよ）その場で待機しろ

    return 0;
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：夢寐郎  
作成日：2016年06月09日  
更新日：2017年05月06日


<a name="Observer"></a>
# <b><ruby>Observer<rt>オブザーバ</rt></ruby></b>

```
//test.cpp
#include <iostream> //coutに必要
#include <vector> //vector配列に必要
using namespace std;

class Apple; //前方宣言

//==================
// リスナー役（宣言）
//==================
class IObserver {
    public:
        virtual void Update(Apple* _apple) = 0; //純粋仮想関数（前方宣言必須）
};

// iPhone /////////////////////////
class iPhone : public IObserver {
    public: void Update(Apple* _apple); //純粋仮想関数のオーバーライドの宣言
};

// iPad /////////////////////////
class iPad : public IObserver {
    public: void Update(Apple* _apple); //純粋仮想関数のオーバーライドの宣言
};

// iPadPro /////////////////////////
class iPadPro : public IObserver {
    public: void Update(Apple* _apple); //純粋仮想関数のオーバーライドの宣言
};

//=============
// 観察される役
//=============
class ISubject {
    public:
        virtual void AddObserver(IObserver* _observer) = 0; //純粋仮想関数
        virtual void RemoveObserver(IObserver* _observer) = 0; //純粋仮想関数
        virtual void Notify() = 0; //純粋仮想関数（オーバーライド必須）
};

class Apple : public ISubject {
    private: vector<IObserver*> _observerList; //←リスナーのリスト
    public:
        void AddObserver(IObserver* _observer); //リスナー登録用関数の宣言
        void RemoveObserver(IObserver* _observer); //純粋仮想関数のオーバーライドの宣言
        void Notify(); //純粋仮想関数のオーバーライドの宣言
        string GetVersion(); //メンバ関数
};

void Apple::AddObserver(IObserver* _observer) { //リスナー登録用関数の実装
    _observerList.push_back(_observer); //リスナーの登録
}

void Apple::RemoveObserver(IObserver* _observer) {
    //リスナーの検索＆削除
    for (int i=0; i<_observerList.size(); i++) {
        if (_observerList[i] == _observer) {
            _observerList.erase(_observerList.begin() + i);
        }
    }
}

void Apple::Notify() { //全リスナーへの通知
    for (IObserver* _observer : _observerList) { //foreach文
        _observer -> Update(this);
    }
}

string Apple::GetVersion() {
    return "10.3.1";
}

//===================
// リスナー役（実装）
//===================
void iPhone::Update(Apple* _apple) { //純粋仮想関数のオーバーライドの定義
    cout << "iPhoneは" << _apple -> GetVersion() << "にアップデート可能" << endl;
}
void iPad::Update(Apple* _apple) { //純粋仮想関数のオーバーライドの定義
    cout << "iPadは" << _apple -> GetVersion() << "にアップデート可能" << endl;
}
void iPadPro::Update(Apple* _apple) { //純粋仮想関数のオーバーライドの定義
    cout << "iPadProは" << _apple -> GetVersion() << "にアップデート可能" << endl;
}

//===========
// メイン関数
//===========
int main() {
    //観察される（Subject）役
    ISubject* _apple = new Apple;

    //リスナー（Observer）役
    IObserver* _iPhone = new iPhone;
    IObserver* _iPad = new iPad;
    IObserver* _iPadPro = new iPadPro;

    //リスナー（Observer）の登録
    _apple -> AddObserver(_iPhone);
    _apple -> AddObserver(_iPad);
    _apple -> AddObserver(_iPadPro);

    //全リスナー（Observer）への通知
    _apple -> Notify();

    return 0;
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：夢寐郎  
作成日：2016年06月10日  
更新日：2017年05月06日


<a name="Memento"></a>
# <b><ruby>Memento<rt>メメント</rt></ruby></b>

```
//test.cpp
#include <iostream> //coutに必要
#include <vector> //vector配列に必要
using namespace std;

//===========================================
// Memento役（その瞬間の状態をオブジェクト化）
//===========================================
class SnapShot {
    private:
        //↓今回はシンプルにするため１項目だけですが通常は複数の変数を保存します
        int _point;
    public:
        SnapShot(int _point); //コンストラクタの宣言
        int Point(); //getter
        void Point(int _point); //setter
};

//コンストラクタの定義
SnapShot::SnapShot(int _point) {
    this -> _point = _point;
}

//getter
int SnapShot::Point() {
    return _point;
}

//setter
void SnapShot::Point(int _point) {
    this -> _point = _point;
}

//========================
// 主人公 + バックアップ係
//========================
class Gamer {
    private:
        int _point;
        vector<SnapShot*> _history; //履歴用リスト
        int _count; //Undo、Redo用
    public:
        Gamer(int _point); //コンストラクタの宣言
        SnapShot* Save(); //メンバ関数の宣言
        int Point(); //getter
        void Point(int _point); //setter
        void History(); //メンバ関数の宣言
        SnapShot* Undo(); //メンバ関数の宣言
        SnapShot* Redo(); //メンバ関数の宣言
};

//コンストラクタの定義
Gamer::Gamer(int _point=0) {
    this -> _point = _point;
}

//メンバ関数の実装（状態を保存）
SnapShot* Gamer::Save() {
    SnapShot* _snapShot = new SnapShot(_point);
    _history.push_back(_snapShot); //履歴に追加
    _count = _history.size() - 1;
    return _snapShot;
}

//getter
int Gamer::Point() {
    return _point;
}

//setter
void Gamer::Point(int _point) {
    this -> _point = _point;
}

//メンバ関数の実装（履歴）
void Gamer::History() {
    for (int i=0; i<_history.size(); i++) {
        cout << i << ":" << _history[i] -> Point() << endl;
    }
}

//メンバ関数の実装（アンドゥ）
SnapShot* Gamer::Undo() {
    if (_count > 0) {
        return _history[--_count];
    } else {
        cout << "これ以上、Undoできません" << endl;
        _count = 0;
        return _history[0];
    }
}

//メンバ関数の実装（リドゥ）
SnapShot* Gamer::Redo() {
    if (_count < _history.size() - 1) {
        return _history[++_count];
    } else {
        cout << "これ以上、Redoできません" << endl;
        _count = _history.size() - 1;
        return _history[_count];
    }
}


//===========
// メイン関数
//===========
int main() {
    Gamer* _gamer = new Gamer(100); //ゲームスタート（最初のポイントは100）①
    SnapShot* _snapShot = _gamer -> Save(); //最初の状態を保存

    _gamer -> Point(2000); //いろいろゲームが進行して2000ポイントに...②
    _snapShot = _gamer -> Save(); //この時点での状態を保存

    _gamer -> Point(8000); //更にゲームが進行して8000ポイントに...③
    _snapShot = _gamer -> Save(); //この時点での状態を保存

    _gamer -> History(); //履歴を調べる
    // 0:100 ←①
    // 1:2000 ←②
    // 2:8000 ←③

    cout << "------------------------" << endl;

    //実験（アンドゥ）
    _snapShot = _gamer -> Undo(); //Undo（やり直し）
    cout << _snapShot -> Point() << endl; //2000 ←②
    _snapShot = _gamer -> Undo(); //Undo（やり直し）
    cout << _snapShot -> Point() << endl; //100 ←①
    _snapShot = _gamer -> Undo(); //Undo（やり直し）
    cout << _snapShot -> Point() << endl; //これ以上、Undoできません 100 ←②

    cout << "------------------------" << endl;

    //実験（リドゥ）
    _snapShot = _gamer -> Redo(); //Redo（再実行）
    cout << _snapShot -> Point() << endl; //2000 ←②
    _snapShot = _gamer -> Redo(); //Redo（再実行）
    cout << _snapShot -> Point() << endl; //8000 ←③
    _snapShot = _gamer -> Redo(); //Redo（再実行）
    cout << _snapShot -> Point() << endl; //これ以上、Redoできません 8000 ←③

    return 0;
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：夢寐郎  
作成日：2016年06月10日  
更新日：2017年05月06日


<a name="State"></a>
# <b><ruby>State<rt>ステート</rt></ruby></b>

```
//test.cpp
#include <iostream> //coutに必要
using namespace std;

//================
// State（状態）役
//================
class IState { //State○のインターフェース
    public: virtual void Execute() = 0; //純粋仮想関数（オーバーライド必須）
};

// StateA（状態Ａ）
class StateA : public IState {
    public: virtual void Execute(); //純粋仮想関数のオーバーライドの宣言
};
void StateA::Execute() { //純粋仮想関数のオーバーライドの実装
    cout << "グー、グー、パー" << endl;
}

// StateB（状態Ｂ）
class StateB : public IState {
    public: virtual void Execute(); //純粋仮想関数のオーバーライドの宣言
};
void StateB::Execute() { //純粋仮想関数のオーバーライドの実装
    cout << "パー、グー、チョキ" << endl;
}

//========================
// Context（状態を管理）役
//========================
class Janken {
    private: IState* state_; //メンバ変数の宣言（状態＝State○を格納）
    public:
        void SetState(IState* state_); //メンバ関数の宣言
        void Exec(); //メンバ関数の宣言
};
void Janken::SetState(IState* state_) { //メンバ関数の実装
    this -> state_ = state_;
}
void Janken::Exec() { //メンバ関数の実装
    state_ -> Execute(); //...→State○::Execute()を呼び出す
}

//===========
// メイン関数
//===========
int main() {
    Janken* _janken = new Janken; //Context（状態を管理）役
    
    IState* _stateA = new StateA; //State（状態）役
    IState* _stateB = new StateB; //State（状態）役

    _janken -> SetState(_stateA); //状態の設定
    _janken -> Exec(); //グー、グー、パー

    _janken -> SetState(_stateB); //状態の設定
    _janken -> Exec(); //パー、グー、チョキ

    return 0;
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：夢寐郎  
作成日：2016年06月10日  
更新日：2017年05月06日


<a name="Command"></a>
# <b><ruby>Command<rt>コマンド</rt></ruby></b>

```
//test.cpp
#include <iostream> //coutに必要
#include <vector> //vector配列に必要
using namespace std;

//=========================================
// 結果を表示する役＝Receiver（受信者）の役
//=========================================
class Canvas {
    private:
        vector<string> _history; //履歴（実際の処理を保存）
    public:
        void Update(string _command); //メンバ関数の宣言
};

//メンバ関数の定義
void Canvas::Update(string _command) { //キャンバスの再描画 ←◎
    //履歴に実際の処理を内容を（先に）保存し、それ順々に実行します。
    _history.push_back(_command);
    for (string _string : _history) {
        cout << _string << endl; //描画
    }
    cout << "------------再描画" << endl; //←フレームレート毎の動き
}

//===========
// 命令クラス
//===========
class DrawCommand {
    private:
        Canvas* _canvas; //メンバ変数の宣言
        string _command; //メンバ変数の宣言
    public:
        DrawCommand(Canvas* _canvas, string _command); //コンストラクタの宣言
        void Execute(); //メンバ関数の宣言
};

//コンストラクタの定義
DrawCommand::DrawCommand(Canvas* _canvas, string _command) {
    this -> _canvas = _canvas;
    this -> _command = _command;
}

//メンバ関数の定義
void DrawCommand::Execute() { //←Inkscape::Draw()から呼び出される★
    _canvas -> Update(_command); //◎
}

//===================
// グラフィックソフト
//===================
class Inkscape {
    private:
        Canvas* _canvas; //Receiver（受信者）の役
        vector<DrawCommand*> _history; //履歴（命令クラス）を保存
    public:
        Inkscape(); //コンストラクタの宣言
        void Draw(string _command); //メンバ関数の宣言
        void Batch(int start_, int end_); //メンバ関数の宣言
};

//コンストラクタの定義
Inkscape::Inkscape() {
    _canvas = new Canvas; //Receiver（受信者）の役
}

//メンバ関数の実装（命令の実行）
void Inkscape::Draw(string _command) {
    //↓命令を実行する度にインスタンスを生成（ポイント!!）
    DrawCommand* _drawCommand = new DrawCommand(_canvas, _command);
    _drawCommand -> Execute(); //実行（＝キャンバスの再描画）→★
    _history.push_back(_drawCommand); //履歴に命令クラスを保存
}

//メンバ関数の実装（バッチ処理＝オプション）
void Inkscape::Batch(int start_, int end_) {
    //start_とend_がvector配列の範囲外の場合のエラー処理は今回は省略
    
    //↓C#のList.GetRange(開始,終了)の代りです
    vector<DrawCommand*> batch_;
    for (int i = start_-1; i < end_; i++) {
        batch_.push_back(_history[i]);
    }

    for (DrawCommand* _drawCommand : batch_) {
        _drawCommand -> Execute();
    }
}

//===========
// メイン関数
//===========
int main() {
    //グラフィックソフト
    Inkscape* _inkscape = new Inkscape;

    //命令の実行
    _inkscape -> Draw("線を引く");
    _inkscape -> Draw("縁取る");
    _inkscape -> Draw("影を付ける");

    cout << "------------------------バッチ処理" << endl;

    //バッチ処理（オプション）
    _inkscape -> Batch(1,3); //実行履歴の1〜3個目を再度実行する

    return 0;
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：夢寐郎  
作成日：2016年06月10日  
更新日：2017年05月06日


<a name="Interpreter"></a>
# <b><ruby>Interpreter<rt>インタプリタ</rt></ruby></b>
```
//test.cpp
/*******************************************************************
* ここでは ActionScript、SWF、AVM（ActionScript Virtual Machine）を
* を自作ミニ言語と見立てています。「終端となる表現の役」を省略。
*******************************************************************/
#include <iostream> //coutに必要
#include <vector> //vector配列に必要
#include <string.h> //strtokに必要
using namespace std;

//==============================
// ≒SWFファイルを生成するクラス
//==============================
class SWF {
    private:
        vector<string> _codeArray; //命令を配列化（中間コード）
        int _count; //GetNextCode()で使用
    public:
        SWF(char* _code); //コンストラクタの宣言
        string GetNextCode(); //メンバ関数の宣言
        bool IsEnd(); //メンバ関数の宣言
};

//コンストラクタの定義
SWF::SWF(char* _code) {
    _count = 0;

    //↓右辺がstring（文字列）扱いにして関数にできると良いですが...（要検証）
    char *tp;
    tp = strtok(_code, ";"); //（;）区切りで分割する場合
    _codeArray.push_back(tp); //1個目を配列に格納
    while ( tp != NULL ) {
        tp = strtok(NULL, ";"); //（;）区切りで分割する場合
        if ( tp != NULL ) {
            _codeArray.push_back(tp); //2個目以降を配列に格納
        }
    }
}

//メンバ関数の実装
string SWF::GetNextCode() { //次の命令を返す
    return _codeArray[_count++];
}

//メンバ関数の実装
bool SWF::IsEnd() { //次の命令があるか否か...
    return _count >= _codeArray.size();
}

//=====================================
// ≒AVM（ActionScript Virtual Machine）
//=====================================
class AVM {
    public:
        void Execute(SWF* swf); //メンバ関数の宣言
};

//メンバ関数の実装
void AVM::Execute(SWF* _swf) {
    int _result = 0; //計算結果

    while (! _swf -> IsEnd()) { //次の命令があれば...
        string _nextCode = _swf -> GetNextCode(); //次の命令を取得

        //ここからはサンプルの独自処理
        //--------------------------
        string _operator = _nextCode.substr(0,1); //「+*/-=」の何れか
        if (_operator != "=") { //最終計算（=）でなければ...
            string _str = _nextCode.substr(1); //「+*/-=」以外の値を取得
            int _int = atoi(_str.c_str()); //string型→int型に変換
            
            if (_operator == "+") {
                _result += _int;
            } else if (_operator == "-") {
                _result -= _int;
            } else if (_operator == "*") {
                _result *= _int;
            } else if (_operator == "/") {
                _result /= _int;
            } else {
                cout << "ERROR: 演算子が異なります" << endl;
            }

        } else { //「=」の場合...
            cout << _result << endl;
        }
        //--------------------------
    }
}

//===========
// メイン関数
//===========
int main() {
    //自作言語による記述（≒ActionScript）
    char _code[] = "+10;*50;/2;-4;="; //←C++独特の処理

    //≒SWFファイルに変換
    SWF* _swf = new SWF(_code);

    //≒AVM（ActionScript Virtual Machine）
    AVM* _avm = new AVM;

    //≒SWFファイルをAVM上で実行（計算結果は246）
    _avm -> Execute(_swf);

    return 0;
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：夢寐郎  
作成日：2016年06月10日  
更新日：2017年05月06日