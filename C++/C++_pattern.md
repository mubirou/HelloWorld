### <b>この項目は書きかけの項目です</b>

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
    ***
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
    //Singleton* _singleton; //←これはアドレスを確保しただけなのでエラーなし
    //Singleton _singleton; //エラー：外部からインスタンスは生成不可
    //Singleton* _singleton = new Singleton; //エラー：外部からインスタンスは生成不可
    //Singleton _singleton = new Singleton; //エラー：外部からインスタンスは生成不可
    return 0;
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
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
作成者：Takashi Nishimura  
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
作成者：Takashi Nishimura  
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
作成者：Takashi Nishimura  
作成日：2016年06月02日  
更新日：2017年05月XX日


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
作成者：Takashi Nishimura  
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
作成者：Takashi Nishimura  
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
作成者：Takashi Nishimura  
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
    cout << _tablet1 -> Version() << endl; //→"Android 7.1.2"
    _tablet1 -> BigScreen(); //→"おおきな画面で見る"
    
    //タブレット（iOS）
    Tablet* _tablet2 = new Tablet(new IOS); //インスタンスの生成
    cout << _tablet2 -> Version() << endl; //→"Android 7.1.2"
    
    //スマホ（Android）
    SmartPhone* _smartPhone1 = new SmartPhone(new Android); //インスタンスの生成
    cout << _smartPhone1 -> Version() << endl; //→"Android 7.1.2"
    _smartPhone1 -> Phone(); //→"おおきな画面で見る"
    
    //スマホ（iOS）
    SmartPhone* _smartPhone2 = new SmartPhone(new IOS); //インスタンスの生成
    cout << _smartPhone2 -> Version() << endl; //→"Android 7.1.2"
    return 0;
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
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
作成者：Takashi Nishimura  
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
    Display* _original = new Original("TAKASHI");
    _original -> Show(); //"TAKASHI"

    //検証（その２）
    Display* _decorator1 = new Decorator1(new Original("TAKASHI"));
    _decorator1 -> Show(); //"-TAKASHI-"

    //検証（その３）
    Display* _decorator2 = new Decorator2(new Original("TAKASHI"));
    _decorator2 -> Show(); //"<TAKASHI>"

    //検証（その４）
    Display* _special = new Decorator2(
                                new Decorator1(
                                    new Decorator1(
                                        new Decorator1(
                                            new Original("TAKASHI")
                                        )
                                    )
                                )
                            );
    _special -> Show(); //<---TAKASHI--->

    return 0;
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
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
                                            new Original("TAKASHI")))));
    _special -> Show();
    ```
    …としていたものを次の1行で実現可能になります。
    ```
    DecoratorFacade::Exec("TAKASHI", 3, 1)
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
    DecoratorFacade::Exec("TAKASHI"); //"TAKASHI"
    DecoratorFacade::Exec("TAKASHI", 1, 0); //"-TAKASHI-"
    DecoratorFacade::Exec("TAKASHI", 0, 1); //"<TAKASHI>"
    DecoratorFacade::Exec("TAKASHI", 3, 1); //<---TAKASHI--->
    return 0;
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
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
作成者：Takashi Nishimura  
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
作成者：Takashi Nishimura  
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
作成者：Takashi Nishimura  
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
作成者：Takashi Nishimura  
作成日：2016年06月08日  
更新日：2017年05月05日


<a name="Strategy"></a>
# <b><ruby>Strategy<rt>ストラテジー</rt></ruby></b>

### 概要
* アルゴリズムをごっそり切り替える。戦略。Strategy＝作戦。アルゴリズム（手順）。
* Stateパターン（後述）に似ていますが、Stateパターンの場合は...
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
    _strategy -> Execute(); //←Exec()だと紛らわしいので...
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
作成者：Takashi Nishimura  
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
        virtual void Visit(int otoshidama_) = 0; //純粋仮想関数
};

/*******
 * 一郎
*******/
class Ichiro : public IVisitor { //←インターフェースの実装
    private:
        int money_; //メンバ変数の宣言
    public:
        Ichiro(); //コンストラクタの宣言
        int GetMoney(); //メンバ関数の宣言
        void Visit(int otoshidama_);
};
Ichiro::Ichiro() { //コンストラクタの定義
    money_ = 0;
}

int Ichiro::GetMoney() {
    return money_;
}

void Ichiro::Visit(int otoshidama_) {
    money_ += otoshidama_;
}

/*******
 * 花子
*******/
class Hanako : public IVisitor { //←インターフェースの実装
    private:
        int money_; //メンバ変数の宣言
    public:
        Hanako(); //コンストラクタの宣言
        int GetMoney(); //メンバ関数の宣言
        void Visit(int otoshidama_);
};
Hanako::Hanako() { //コンストラクタの定義
    money_ = 0;
}
int Hanako::GetMoney() {
    return money_;
}
void Hanako::Visit(int otoshidama_) {
    money_ += otoshidama_;
}

/*********
 * 訪問先
*********/
class IAcceptor { //訪問先のインターフェース
    public:
        virtual void Accept(IVisitor* visitor_) = 0; //純粋仮想関数（オーバーライド必須）
};

class Hokkaido : public IAcceptor { //←インターフェースの実装
    public:
        void Accept(IVisitor* visitor_); //純粋仮想関数のオーバーライドの宣言
};
void Hokkaido::Accept(IVisitor* visitor_) { //純粋仮想関数のオーバーライドの定義
    visitor_ -> Visit(5000*2); //←誰が訪問してきても同じメソッドを実行
}

class Chiba : public IAcceptor { //←インターフェースの実装
    public:
        void Accept(IVisitor* visitor_); //純粋仮想関数のオーバーライドの宣言
};

void Chiba::Accept(IVisitor* visitor_) { //純粋仮想関数のオーバーライドの定義
    visitor_ -> Visit(5000); //誰が訪問してきても同じメソッドを実行
}

/*************
 * メイン関数
*************/
int main() {
    //訪問先
    Hokkaido* Hokkaido_ = new Hokkaido; //埼玉実家
    Chiba* Chiba_ = new Chiba; //宮島家

    //訪問者
    Ichiro* _ichiro = new Ichiro; //一郎
    Hanako* _hanako = new Hanako; //花子 

    //訪問する（訪問側から見ると「受け入れる」）
    Hokkaido_ -> Accept(_ichiro);
    Hokkaido_ -> Accept(_hanako);
    Chiba_ -> Accept(_ichiro);
    Chiba_ -> Accept(_hanako);

    //結果...
    cout << _ichiro -> GetMoney() << endl; //15000
    cout << _hanako -> GetMoney() << endl; //15000

    return 0;
}
```

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2016年06月08日  
更新日：2017年05月06日


<a name="ChainofResponsibility"></a>
# <b><ruby>Chain of Responsibility<rt>チェーン オブ レスポンシビリティ</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="Mediator"></a>
# <b><ruby>Mediator<rt>メディエイター</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="Observer"></a>
# <b><ruby>Observer<rt>オブザーバ</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="Memento"></a>
# <b><ruby>Memento<rt>メメント</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="State"></a>
# <b><ruby>State<rt>ステート</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="Command"></a>
# <b><ruby>Command<rt>コマンド</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="Interpreter"></a>
# <b><ruby>Interpreter<rt>インタプリタ</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日