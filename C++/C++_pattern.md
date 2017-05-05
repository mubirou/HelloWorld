### <b>この項目は書きかけの項目です</b>

# <b>C++ デザインパターン</b>

### <b>INDEX</b>

* オブジェクトの「生成」に関するパターン
    * [<ruby>Singleton<rt>シングルトン</rt></ruby>](#Singleton) : たった１つのインスタンス
    * [<ruby>Prototype<rt>プロトタイプ</rt></ruby>](#Prototype) : コピーしてインスタンスを作る
    * [<ruby>Builder<rt>ビルダー</rt></ruby>](#Builder) : 複雑なインスタンスを組み立てる
    * [<ruby>Factory Method<rt>ファクトリー メソッド</rt></ruby>](#FactoryMethod) : インスタンスの作成をサブクラスにまかせる
    ***
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

XXXX

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="Adapter（継承）"></a>
# <b><ruby>Adapter<rt>アダプター</rt></ruby>（継承）</b>

XXXX

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="Adapter（委譲）"></a>
# <b><ruby>Adapter<rt>アダプター</rt></ruby>（委譲）</b>

XXXX

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="Bridge"></a>
# <b><ruby>Bridge<rt>ブリッジ</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="Composite"></a>
# <b><ruby>Composite<rt>コンポジット</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="Decorator"></a>
# <b><ruby>Decorator<rt>デコレータ</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="Facade"></a>
# <b><ruby>Facade<rt>ファサード</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="Flyweight"></a>
# <b><ruby>Flyweight<rt>フライウエイト</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="Proxy"></a>
# <b><ruby>Proxy<rt>プロキシー</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="Iterator"></a>
# <b><ruby>Iterator<rt>イテレータ</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="TemplateMethod"></a>
# <b><ruby>Template Method<rt>テンプレート メソッド</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="Strategy"></a>
# <b><ruby>Strategy<rt>ストラテジー</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="Visitor"></a>
# <b><ruby>Visitor<rt>ビジター</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04.2 LTS、C++14  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


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