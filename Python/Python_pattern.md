### <b>この項目は書きかけの項目です</b>

# <b>Python デザインパターン</b>

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
    ***
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
#test.py

"""
Singletonクラス
"""
class Singleton(object):
    __singleton = None #唯一のインスタンスを格納
    __boolean = False #インスタンスを生成して良いか否か

    def __init__(self): #コンストラクタ関数
        if (not self.__boolean):
            print("ERROR:Singleton.getInstance()でインスタンスを生成して下さい")
            raise NotImplementedError() #外部からSingleton()出来ないようにする

    @classmethod #クラスメソッドの宣言
    def getInstance(self):
        if (self.__singleton == None): #インスタンスがまだ無い場合...
            self.__boolean = True #インスタンスの生成を許可
            self.__singleton = Singleton() #唯一となるインスタンスを生成＆格納
            print("インスタンスが生成されました") #DEBUG
        return self.__singleton #唯一のインスタンスを返す

"""
実行
"""
#singleton_ = Singleton() #外からインスタンスの生成は不可
_singleton1 = Singleton.getInstance() #唯一のインスタンスにアクセスする方法
_singleton2 = Singleton.getInstance() #唯一のインスタンスにアクセスする方法
print(_singleton1) #<__main__.Singleton object at 0x7ff6ed059b00>
print(_singleton2) #<__main__.Singleton object at 0x7ff6ed059b00>
print(_singleton1 == _singleton2) #True ←中身は全く同じインスタンス
```

実行環境：Ubuntu 16.04.2 LTS、Python 2.7.12  
作成者：Takashi Nishimura  
作成日：2016年06月30日  
更新日：2017年05月08日


<a name="Prototype"></a>
# <b><ruby>Prototype<rt>プロトタイプ</rt></ruby></b>

### 概要＆ポイント
1. コピーしてインスタンスを作る。クラス名()でインスタンスを生成せずに、インスタンスを複製（≠参照）して新しいインスタンスを作成。Java には clone() が、PHP には __clone() が、Python には copy.deepcopy() があります。
1. 複製には インスタンス.clone() を使う。

### 例文
```
# test.py

"""
擬似インターフェース（実際はふつうの基本クラス）
"""
class IPrototype(object):
    def clone(self): raise NotImplementedError() #派生クラスで強制的に実装させる為

class Prototype(IPrototype): #擬似インターフェース（基本クラス）を実装（継承）
    __firstName = __lastName = None #プライベート変数の宣言
    def __init__(self, _lastName): #コンストラクタ
        self.__lastName = _lastName
    def clone(self): #基本クラス（擬似インターフェース）の関数をオーバーライド
       import copy #copy.deepcopy()に必要
       return copy.deepcopy(self)

    #以下__firstNameと__lastName（読取り専用）のアクセサ
    def __getFirstName(self):
        return self.__firstName
    def __setFirstName(self, value):
        self.__firstName = value
    firstName = property(__getFirstName, __setFirstName)
    def __getLastName(self):
        return self.__lastName
    lastName = property(__getLastName)

"""
検証
"""
_prototype1 = Prototype("NISHIMURA") #インスタンスを生成
_prototype1.firstName = "ICHIRO"
_prototype2 = _prototype1.clone() #複製する（Prototype()を使わない）
_prototype2.firstName = "HANAKO" #変更しないと複製時の"ICHIRO"のまま
print(_prototype1.firstName, _prototype1.lastName) #ICHIRO NISHIMURA
print(_prototype2.firstName, _prototype2.lastName) #HANAKO NISHIMURA
```

実行環境：Ubuntu 16.04.2 LTS、Python 2.7.12  
作成者：Takashi Nishimura  
作成日：2016年06月30日  
更新日：2017年05月09日


<a name="Builder"></a>
# <b><ruby>Builder<rt>ビルダー</rt></ruby></b>

```
# test.py

#=================================
# Drectorクラス（≒年賀状印刷業者）
#=================================
class Director(object):
    __builder = None #Builder○のインスタンスを格納（委譲）

    def __init__(self, _builder): #コンストラクタ関数
        self.__builder = _builder

    def construct(self): #共通の手順（カスタム関数）
        self.__builder.makeHeader() #手順①
        self.__builder.makeContent() #手順②
        self.__builder.makeFooter() #手順③

#==================================
# BuilderXXXクラスのインターフェース
#==================================
class IBuilder(object): #擬似インターフェース（実際は普通の基本クラス）
    def makeHeader(self): raise NotImplementedError() #派生クラスで強制的に実装させる為...
    def makeContent(self): raise NotImplementedError()
    def makeFooter(self): raise NotImplementedError()

#====================================
# BuilderAクラス（≒年賀状のタイプＡ）
#====================================
class BuilderA(IBuilder): #擬似インターフェースを実装（継承）
    def makeHeader(self): #擬似インターフェースの関数をオーバーライド
        print("あけましておめでとうございます") #今回のサンプルは簡単に...(^^;
    def makeContent(self): #擬似インターフェースの関数をオーバーライド
        print("□□イラ□スト□□")
    def makeFooter(self): #擬似インターフェースの関数をオーバーライド
       print("元旦")

#====================================
# BuilderBクラス（≒年賀状のタイプＢ）
#====================================
class BuilderB(IBuilder): #擬似インターフェースを実装（継承）
    def makeHeader(self): #擬似インターフェースの関数をオーバーライド
        print("HAPPY NEW YEAR!")
    def makeContent(self): #擬似インターフェースの関数をオーバーライド
        print("○イ○ラ○ス○ト○")
    def makeFooter(self): #擬似インターフェースの関数をオーバーライド
        print("2018.1.1")

#======
# 実行
#======
directorA_ = Director(BuilderA())
directorA_.construct()
"""
あけましておめでとうございます
□□イラ□スト□□
元旦
"""

directorB_ = Director(BuilderB())
directorB_.construct()
"""
HAPPY NEW YEAR!
○イ○ラ○ス○ト○
2018.1.1
"""
```

実行環境：Ubuntu 16.04.2 LTS、Python 2.7.12  
作成者：Takashi Nishimura  
作成日：2016年06月30日  
更新日：2017年05月10日


<a name="FactoryMethod"></a>
# <b><ruby>Factory Method<rt>ファクトリー メソッド</rt></ruby></b>

```
#test.py

#========================================
# 擬似抽象クラス ←実際は普通の基本クラス
#========================================
class AbstractCard(object):
    # 擬似抽象関数（派生クラスでオーバーライド）
    def factoryMethod(self, arg):
        raise NotImplementedError() 
        #↑派生クラスで強制的に実装させる為...

    # 派生クラスに継承される関数
    def templateMethod(self, arg):
        #条件分岐をここで行わない＝ここを汚さない
        _message = self.factoryMethod(arg) #派生クラスに定義した関数を呼出す
        _message.exec() #処理①
        self.order1() #処理②
        self.order2() #処理③

    # 共通の処理
    def order1(self):
        print("〒XXX-XXXX 新宿区XX町X-X-X") 
    
    # 擬似抽象関数（派生クラスでオーバーライド）
    def order2(self): 
        raise NotImplementedError() #例外処理（派生クラスで強制的に実装させる為）

#========================
# 派生クラス（CardICHIRO）
#========================
#↓擬似抽象クラスの実装（実際は普通の基本クラス）
class CardICHIRO(AbstractCard):
    #↓抽象クラスの関数をオーバーライド
    def factoryMethod(self, arg):
        if (arg == "先生") :
            return Message1() #ここでインスタンス生成
        elif (arg == "同級生") : 
            return Message2() #ここでインスタンス生成
        else: 
            print("Error:CardICHIRO.factoryMethod()")
            raise NotImplementedError() #例外処理（Errorを発生させる）

    #↓抽象クラスの関数をオーバーライド    
    def order2(self):
        print("西村一郎") #具体的な処理を記述

#========================
# 派生クラス（CardHANAKO）
#========================
#↓擬似抽象クラスの実装（実際は普通の基本クラス）
class CardHANAKO(AbstractCard):
    #↓抽象クラスの関数をオーバーライド
    def factoryMethod(self, arg):
        if (arg == "先生") :
            return Message3() #ここでインスタンス生成
        elif (arg == "同級生") : 
            return Message4() #ここでインスタンス生成
        else: 
            print("Error:CardHANAKO.factoryMethod()")
            raise NotImplementedError() #例外処理（Errorを発生させる）

    #↓抽象クラスの関数をオーバーライド    
    def order2(self):
        print("西村花子") #具体的な処理を記述

#===================
# 生成したいクラス群
#===================
#インターフェース（実際は普通の基本クラス）
class IMessage(object):
    def exec(self): raise NotImplementedError()
    #↑派生クラスでオーバーライドして実装しないと実行時にErrorを発生させる

class Message1(IMessage):
    def exec(self): print("謹賀新年")

class Message2(IMessage):
    def exec(self): print("HAPPY NEW YEAR!")

class Message3(IMessage):
    def exec(self): print("明けましておめでとうございます")

class Message4(IMessage):
    def exec(self): print("あけましておめでとう!")

#======
# 実行
#======
_cardICHIRO = CardICHIRO()
_cardICHIRO.templateMethod("先生")
"""
謹賀新年
〒XXX-XXXX 新宿区XX町X-X-X
西村一郎
"""
_cardICHIRO.templateMethod("同級生")
"""
HAPPY NEW YEAR!
〒XXX-XXXX 新宿区XX町X-X-X
西村一郎
"""

_cardHANAKO = CardHANAKO()
_cardHANAKO.templateMethod("先生")
"""
明けましておめでとうございます
〒XXX-XXXX 新宿区XX町X-X-X
西村花子
"""
_cardHANAKO.templateMethod("同級生")
"""
あけましておめでとう!
〒XXX-XXXX 新宿区XX町X-X-X
西村花子
"""
```

実行環境：Ubuntu 16.04.2 LTS、Python 2.7.12  
作成者：Takashi Nishimura  
作成日：2016年06月30日  
更新日：2017年05月10日


<a name="AbstractFactory"></a>
# <b><ruby>Abstract Factory<rt>アブストラクト ファクトリー</rt></ruby></b>

```
#test.py

#=================================
# （擬似）抽象クラス＝抽象的な工場
#=================================
class AbstractFactory(object):
    #クラスメソッド（≒静的関数）
    @classmethod
    def createFactory(self, _name):
        if (_name == "ICHIRO"):
            return ICHIRO() #具体的な「亨工場」（インスタンス）を生成
        elif (_name == "HANAKO"):
            return HANAKO() #具体的な「幸子工場」（インスタンス）を生成
        else:
            print("Error:AbstractFactory.createFactory()")
    
    #擬似抽象関数（派生クラスでオーバーライド）
    def createNewYear(self):
        raise NotImplementedError() 
        #↑派生クラスで実装しないと実行時にError
    
    #擬似抽象関数（派生クラスでオーバーライド）
    def createSummer(self):
        raise NotImplementedError() 
        #↑派生クラスで実装しないと実行時にError
    
#=========================
# 派生クラス＝実際の工場群
#=========================
class ICHIRO(AbstractFactory):
    #抽象クラスの関数をオーバーライド
    def createNewYear(self):
        print("HAPPY NEW YEAR!\nICHIRO NISHIMURA")
    
    def createSummer(self):
        print("暑中お見舞い申し上げます\n西村一郎")

class HANAKO(AbstractFactory):
    #抽象クラスの関数をオーバーライド
    def createNewYear(self):
        print("明けましておめでとうございます\n西村花子")
    
    def createSummer(self):
        print("暑中おみまいもうしあげます\n西村花子")

#======
# 実行
#======
_factoryICHIRO = AbstractFactory.createFactory("ICHIRO")
_factoryICHIRO.createNewYear()
"""
HAPPY NEW YEAR!
ICHIRO NISHIMURA
"""
_factoryICHIRO.createSummer()
"""
暑中お見舞い申し上げます
西村一郎
"""

_factoryHANAKO = AbstractFactory.createFactory("HANAKO")
_factoryHANAKO.createNewYear()
"""
明けましておめでとうございます
西村花子
"""
_factoryHANAKO.createSummer()
"""
暑中おみまいもうしあげます
西村花子
"""
```

実行環境：Ubuntu 16.04.2 LTS、Python 2.7.12  
作成者：Takashi Nishimura  
作成日：2016年06月30日  
更新日：2017年05月10日


<a name="Adapter（継承）"></a>
# <b><ruby>Adapter<rt>アダプター</rt></ruby>（継承）</b>

```
#test.py

#======================
# 基本クラス（Moneybox）
#======================
class Moneybox(object):
    __yen = None #プライベート変数
    def __init__(self, yen_): self.__yen = yen_ #コンストラクタ
    def add(self, yen_): self.__yen += yen_
    def getYen(self): return self.__yen

#===========
# 派生クラス
#===========
class IExchange(object): #インターフェース（オプション）
    def addYen(self, yen_): raise NotImplementedError() #例外処理
    def getDollar(self): raise NotImplementedError() #例外処理

class Exchange(Moneybox, IExchange): #継承、擬似インターフェースの実装
    __rate = None #プライベート変数
    def __init__(self, firstYen_, rate_): #コンストラクタ
        self.__rate = rate_
        super(Exchange, self).__init__(firstYen_) #基本クラスの呼出し
    def addYen(self, yen_): self.add(yen_) #オーバーライド（add()は基本クラスから継承）
    def getDollar(self): return self.getYen() / self.__rate #オーバーライド

#=======
# 実行
#=======
exchange_ = Exchange(10000, 113.739763)
exchange_.addYen(8000)
print(exchange_.getDollar()) #158.25600058618022（ドル）
```

実行環境：Ubuntu 16.04.2 LTS、Python 2.7.12  
作成者：Takashi Nishimura  
作成日：2016年06月30日  
更新日：2017年05月10日


<a name="Adapter（委譲）"></a>
# <b><ruby>Adapter<rt>アダプター</rt></ruby>（委譲）</b>

```
# test.py

#=========================================
# 基本クラス（Moneybox）←「継承」版と同じ
#=========================================
class Moneybox(object):
    __yen = None #プライベート変数
    def __init__(self, yen_): self.__yen = yen_ #コンストラクタ
    def add(self, yen_): self.__yen += yen_
    def getYen(self): return self.__yen

#===========
# 派生クラス
#===========
class IExchange(object): #インターフェース ←「継承」版と同じ
    def addYen(self, yen_): raise NotImplementedError() #例外処理
    def getDollar(self): raise NotImplementedError() #例外処理

class Exchange(IExchange): #この内容が「継承」版と異なる
    #↓Moneyboxクラスのインスタンスを格納（委譲）
    __moneybox = None #プライベート変数
    __rate = None #プライベート変数
    def __init__(self, firstYen_, rate_): #コンストラクタ
        self.__moneybox = Moneybox(firstYen_) #ここがポイント
        self.__rate = rate_
    def addYen(self, yen_):
        self.__moneybox.add(yen_) #ポイント
    def getDollar(self):
        return self.__moneybox.getYen() / self.__rate #ポイント

#=======
# 実行
#=======
exchange_ = Exchange(10000, 113.739763)
exchange_.addYen(8000)
print(exchange_.getDollar()) #158.25600058618022（ドル）
```

実行環境：Ubuntu 16.04.2 LTS、Python 2.7.12  
作成者：Takashi Nishimura  
作成日：2016年06月30日  
更新日：2017年05月10日


<a name="Bridge"></a>
# <b><ruby>Bridge<rt>ブリッジ</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04.2 LTS、Python 2.7.12  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="Composite"></a>
# <b><ruby>Composite<rt>コンポジット</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04.2 LTS、Python 2.7.12  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="Decorator"></a>
# <b><ruby>Decorator<rt>デコレータ</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04.2 LTS、Python 2.7.12  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="Facade"></a>
# <b><ruby>Facade<rt>ファサード</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04.2 LTS、Python 2.7.12  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="Flyweight"></a>
# <b><ruby>Flyweight<rt>フライウエイト</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04.2 LTS、Python 2.7.12  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="Proxy"></a>
# <b><ruby>Proxy<rt>プロキシー</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04.2 LTS、Python 2.7.12  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="Iterator"></a>
# <b><ruby>Iterator<rt>イテレータ</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04.2 LTS、Python 2.7.12  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="TemplateMethod"></a>
# <b><ruby>Template Method<rt>テンプレート メソッド</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04.2 LTS、Python 2.7.12  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="Strategy"></a>
# <b><ruby>Strategy<rt>ストラテジー</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04.2 LTS、Python 2.7.12  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="Visitor"></a>
# <b><ruby>Visitor<rt>ビジター</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04.2 LTS、Python 2.7.12  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="ChainofResponsibility"></a>
# <b><ruby>Chain of Responsibility<rt>チェーン オブ レスポンシビリティ</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04.2 LTS、Python 2.7.12  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="Mediator"></a>
# <b><ruby>Mediator<rt>メディエイター</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04.2 LTS、Python 2.7.12  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="Observer"></a>
# <b><ruby>Observer<rt>オブザーバ</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04.2 LTS、Python 2.7.12  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="Memento"></a>
# <b><ruby>Memento<rt>メメント</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04.2 LTS、Python 2.7.12  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="State"></a>
# <b><ruby>State<rt>ステート</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04.2 LTS、Python 2.7.12  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="Command"></a>
# <b><ruby>Command<rt>コマンド</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04.2 LTS、Python 2.7.12  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="Interpreter"></a>
# <b><ruby>Interpreter<rt>インタプリタ</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04.2 LTS、Python 2.7.12  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日