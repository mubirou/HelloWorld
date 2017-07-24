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
            return ICHIRO() #具体的な「一郎工場」（インスタンス）を生成
        elif (_name == "HANAKO"):
            return HANAKO() #具体的な「花子工場」（インスタンス）を生成
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

```
#test.py

#================
#「機能」のクラス
#================
# SuperMobileクラス（基本クラス）
class SuperMobile(object): #「機能」クラスの最上位
    __os = None #「機能」⇔「実装」クラスの「橋」（委譲）
    def __init__(self, _os): #コンストラクタ
        self.__os = _os
    #OSの__versionのアクセサ（getter）
    def __getRawVersion(self):
        return self.__os.rawVersion
    version = property(__getRawVersion) 

# Tabletクラス（派生クラス）
class Tablet(SuperMobile): #「機能」のクラスに機能を追加したクラス
    def __init__(self, _os): #コンストラクタ
        super(Tablet, self).__init__(_os) #基本クラスのコンストラクタの呼出し
    def bigScreen(self): #タブレット特有の機能
        print("大きな画面で見る")

# SmartPhoneクラス（派生クラス）
class SmartPhone(SuperMobile): #「機能」のクラスに機能を追加したクラス
    def __init__(self, _os): #コンストラクタ
        super(SmartPhone, self).__init__(_os) #基本クラスのコンストラクタの呼出し
    def phone(self): #スマートフォン特有の機能
        print("電話をかける")

#===================================
#「実装」のクラス（抽象クラスは省略）
#===================================
# Androidクラス
class Android(object): #「実装」の具体的な実装者
    __version = "Android 7.1.2"
    #__versionのアクセサ（getter）
    def __getVersion(self): 
        return self.__version
    rawVersion = property(__getVersion)

# IOSクラス
class IOS(object): #「実装」の具体的な実装者
    __version = "iOS 10.3.1"
    #__versionのアクセサ（getter）
    def __getVersion(self):
        return self.__version
    rawVersion = property(__getVersion)

#======
# 実行
#======
_tablet1 = Tablet(Android())
print(_tablet1.version) # "Android 7.1.2"
_tablet1.bigScreen() #大きな画面で見る

_tablet2 = Tablet(IOS())
print(_tablet2.version) # "iOS 10.3.1"
_tablet2.bigScreen() #大きな画面で見る

_smartPhone1 = SmartPhone(Android())
print(_smartPhone1.version) # "Android 7.1.2"
_smartPhone1.phone() #電話をかける

_smartPhone2 = SmartPhone(IOS())
print(_smartPhone2.version) # "iOS 10.3.1"
_smartPhone2.phone() #電話をかける
```

実行環境：Ubuntu 16.04.2 LTS、Python 2.7.12  
作成者：Takashi Nishimura  
作成日：2016年07月01日  
更新日：2017年05月11日


<a name="Composite"></a>
# <b><ruby>Composite<rt>コンポジット</rt></ruby></b>
* 以下のサンプルは root に Authoring フォルダを作成し、その中に Unity3D と Unreal Engine ファイルを格納してみます。

```
#test.py

#===============================
# 抽象クラス＝同一視するための役
#===============================
class Component(object):
    # 共通のプロパティ「name」関連
    _name = None #protectedで出来ないためパブリック変数で（プライベートにする?）
    def __getName(self): return self._name
    name = property(__getName) #getter

    # 共通のプロパティ「parent」関連
    parent_ = None #protectedで出来ないためパブリック変数で（プライベートにする?）
    def __getParent(self): return self.parent_
    def __setParent(self, value): self.parent_ = value
    parent = property(__getParent, __setParent)

    def getList(self): # 抽象関数（派生クラスでオーバーライドが必要）
        raise NotImplementedError() #派生クラスで実装しないと実行時にError

#=============================
# 派生クラス（Directoryクラス）
#=============================
class Directory(Component): #Pythonでは"Directory"という名前も可
    __childList = None #ここで初期化[]すると静的変数扱いになる（要注意!!!）

    def __init__(self, _name): #コンストラクタ関数
        self._name = _name
        self.__childList = [] #ここで初期化する（!!!）
    
    def add(self, arg):
        self.__childList.append(arg)
        arg.parent = self
    
    def getList(self): #オーバーライドして実際の処理を記述
        for tmp in self.__childList:
            _result = self.name + "/" + tmp.name
            if isinstance(tmp,Directory): _result = _result + "(Directory)"
            elif isinstance(tmp,File): _result = _result + "(File)"
            print(_result)

#========================
# 派生クラス（Fileクラス）
#========================
class File(Component):
    def __init__(self, _name):
        self._name = _name
    def getList(self): #オーバーライドして実際の処理を記述
        print(self.parent.name + "/" + self.name + "(File)")

#=======
# 実行
#=======
# ①ディレクトリの作成
_root = Directory("root")
authoring_ = Directory("Authoring")

# ②ファイルの作成
_unity3D = File("Unity3D")
_unrealEngine = File("Unreal Engine")

# ③関連付け
_root.add(authoring_) #ディレクトリ内にフォルダを入れる
authoring_.add(_unity3D) #ディレクトリ内にファイルを入れる
authoring_.add(_unrealEngine) #ディレクトリ内にファイルを入れる

# ④検証
print(_unrealEngine.name) # Unreal Engine
_root.getList() # root/Authoring(Directory)
authoring_.getList() #Authoring/Unity3D(File)、Authoring/Unreal Engine(File)
_unity3D.getList() #Authoring/Unity3D(File)
```

実行環境：Ubuntu 16.04.2 LTS、Python 2.7.12  
作成者：Takashi Nishimura  
作成日：2016年07月01日  
更新日：2017年05月11日


<a name="Decorator"></a>
# <b><ruby>Decorator<rt>デコレータ</rt></ruby></b>

```
#test.py

#================================================================
# 基本クラス（「中身」と「飾り枠」に同じshow()関数を持たせるため）
#================================================================
class Display(object):
    __content = None #protectedに出来ないのでアクセサと併用...
    
    def show(self):
        print(self.__content)
    
    #__contentのアクセサ（getter）←派生クラスで利用
    def __getContent(self):
    	return self.__content
    def __setContent(self, value):
    	self.__content = value
    content = property(__getContent, __setContent)

#======================================
# 派生クラス「中身」（飾りを施す前の元）
#======================================
class Original(Display):
    #コンストラクタ
    def __init__(self, _string):
        self.content = _string
    
#======================
# 派生クラス「飾り枠①」
#======================
class Decorator1(Display):
    #コンストラクタ
    def __init__(self, display_):
        self.content = "-" + display_.content + "-" #飾り「--」を付ける

#======================
# 派生クラス「飾り枠②」
#======================
class Decorator2(Display):
    #コンストラクタ
    def __init__(self, display_):
        self.content = "<" + display_.content + ">" #飾り「<>」を付ける

#=======
# 実行
#=======
_original = Original("TAKASHI")
_original.show() # TAKASHI

_decorator1 = Decorator1(Original("TAKASHI"))
_decorator1.show() # -TAKASHI-

_decorator2 = Decorator2(Original("TAKASHI"))
_decorator2.show() # <TAKASHI>

_special = Decorator2(
            Decorator1(
                Decorator1(
                    Decorator1(
                        Original("TAKASHI")
                    )
                )
            )
)
_special.show() # <---TAKASHI--->
```

実行環境：Ubuntu 16.04.2 LTS、Python 2.7.12  
作成者：Takashi Nishimura  
作成日：2016年07月01日  
更新日：2017年05月11日


<a name="Facade"></a>
# <b><ruby>Facade<rt>ファサード</rt></ruby></b>
* 以下の例文では「Decorator パターン」を「Facade パターン」でシンプルにします。
```
_special = Decorator2(
            Decorator1(
                Decorator1(
                    Decorator1(
                        Original("TAKASHI")))));
_special.show();
```
...としていたものを次の1行で実現可能になります。
```
DecoratorFacade.Set("TAKASHI", 3, 1);
```

```
#test.py

#=====================================================
# 以下の４つのクラスはDecoratorパターンの例文と全く同じ
#=====================================================
# 基本クラス（「中身」と「飾り枠」に同じshow()関数を持たせるため）
class Display(object):
    __content = None
    def show(self):
        print(self.__content)
    def __getContent(self):
    	return self.__content
    def __setContent(self, value):
    	self.__content = value
    content = property(__getContent, __setContent)

# 派生クラス「中身」（飾りを施す前の元）
class Original(Display):
    def __init__(self, _string):
        self.content = _string

# 派生クラス「飾り枠①」    
class Decorator1(Display):
    def __init__(self, display_):
        self.content = "-" + display_.content + "-"

# 派生クラス「飾り枠②」
class Decorator2(Display):
    def __init__(self, display_):
        self.content = "<" + display_.content + ">"

#============================================================
# シンプルな窓口 ←Decoratorパターンにこのクラスを追加するだけ
#============================================================
class DecoratorFacade(object): #Singletonパターン的に
    #コンストラクタ関数
    def __init__(self):
        raise NotImplementedError() #外からインスタンスを生成できないようにする
    
    #クラスメソッド
    @classmethod
    def Set(cls, arg1, arg2=0, arg3=0): #第１引数（cls）は必須
        result_ = Original(arg1)
        for i in range(0, arg2):
            result_ = Decorator1(result_)
        for j in range(0, arg3):
            result_ = Decorator2(result_)
        result_.show()

#=======
# 実行
#=======
DecoratorFacade.Set("TAKASHI") # TAKASHI
DecoratorFacade.Set("TAKASHI", 1, 0) # -TAKASHI-
DecoratorFacade.Set("TAKASHI", 0, 1) # <TAKASHI>
DecoratorFacade.Set("TAKASHI", 3, 1) # <---TAKASHI--->
```

実行環境：Ubuntu 16.04.2 LTS、Python 2.7.12  
作成者：Takashi Nishimura  
作成日：2016年07月01日  
更新日：2017年05月11日


<a name="Flyweight"></a>
# <b><ruby>Flyweight<rt>フライウエイト</rt></ruby></b>
* 以下の例文では、外部テキストとして2つのファイルを使用します。
    * A.txt（"あいうえお"）
    * KA.txt（"かきくけこ"）

```
#test.py

#===========================================
# インスンタンスの管理人（Singletonパターン）
#===========================================
class Manager(object):
    #プライベート変数の宣言
    __manager = None #唯一のインスタンスを格納
    __boolean = None #インスタンスを生成して良いか否か
    __dict = None #←インスタンスを格納する辞書

    #↓コンストラクタ関数
    def __init__(self): 
        if (not self.__boolean):
            print("ERROR:Singleton.getInstance()でインスタンスを生成して下さい")
            raise NotImplementedError() #外部からSingleton()出来ないようにする

    #クラスメソッド（Singletonパターン用）
    @classmethod
    def GetInstance(self):
        if (self.__manager == None): #インスタンスがまだ無い場合...
            self.__boolean = True #インスタンスの生成を許可
            self.__manager = Manager() #唯一となるインスタンスを生成＆格納
            print("インスタンスが生成されました") #DEBUG
            self.__dict = {} #辞書の初期化
        return self.__manager #唯一のインスタンスを返す

    # フライ級の生成（既存の場合、既に生成したインスタンスを返す）   
    def createReader(self, arg):
        isKey_ = arg in self.__dict #既存のインスタンスか調べる（ポイント!!）
        if (not isKey_) : #self.__dict[arg]が存在しない場合...
            self.__dict[arg] = Reader(arg) #ここでやっとインスタンス生成
        else: #self.__dict[arg]が存在する場合（オプション）...
            print(arg + "は既存です")
        return self.__dict[arg] #辞書に登録されたReaderクラスのインスタンスを返す

#============================================================
# フライ級（メモリの使用量が多いため無駄に生成したくないもの）
#============================================================
class Reader(object):
    __text = None #外部から読み込んだテキストを格納

    def __init__(self, arg):
        #↓外部テキストの読み込み
        _file = open(arg + ".txt", "r")
        self.__text = _file.read()

    def getText(self):
        print(self.__text)

#=======
# 実行
#=======
# インスタンスの管理人者を作る（Singletonパターン）
_manager = Manager.GetInstance()
_readerA = _manager.createReader("A")
_readerKA = _manager.createReader("KA")

# 既成のものを生成しようとすると...
_readerA2 = _manager.createReader("A") #"Aは既存です"
print(_readerA == _readerA2) #True ←中身は同じインスタンス（参照しているだけ）

# 処理の実行
_readerA.getText() #"あいうえお"
_readerKA.getText() #"かきくけこ"
```

実行環境：Ubuntu 16.04.2 LTS、Python 2.7.12  
作成者：Takashi Nishimura  
作成日：2016年07月01日  
更新日：2017年05月11日


<a name="Proxy"></a>
# <b><ruby>Proxy<rt>プロキシー</rt></ruby></b>

```
#test.py

#============================
# ①と②の擬似インターフェース
#============================
class ILoader(object):
    def load(self): raise NotImplementedError() #オーバーライドしないと実行時にError

#=====================
# ①代理人（Proxy）役
#=====================
class Loader(ILoader): #擬似インターフェースを実装
    __path = None
    def __init__(self, path_): self.__path = path_ #コンストラクタ関数
    def load(self): #オーバーライド
        _content = Content(self.__path) #←実際の本人登場（代理人は実際の本人を知っている）
        _content.load()

#==============
# ②実際の本人
#==============
class Content(ILoader): #擬似インターフェースを実装
    __path = None
    def __init__(self, path_): self.__path = path_ #コンストラクタ関数
    def load(self): #オーバーライド ←重い処理をここで行う（ポイント!!）
        _file = open(self.__path, "r") #今回のサンプルでは外部テキストを読み込む
        print(_file.read())

#======
# 実行
#======
_loader = Loader("sample.txt") #代理人（Proxy）役
_loader.load() #実際は必要になった時にロードしますが...
```

実行環境：Ubuntu 16.04.2 LTS、Python 2.7.12  
作成者：Takashi Nishimura  
作成日：2016年07月02日  
更新日：2017年05月11日


<a name="Iterator"></a>
# <b><ruby>Iterator<rt>イテレータ</rt></ruby></b>

### 概要
* １つ１つ数え上げる。繰り返し。
* interate は「繰り返す」という意味。
* データの集合体に対して、for 文等による操作でデータを取り出すのではなく、hasNext() と Next() メソッドを使って取り出します。

### 例文
```
# test.py

#===========
# Bikeクラス
#===========
class Bike(object):
    __model = __number = None #プライベート変数の宣言

    def __init__(self, model_, number_): #コンストラクタ
        self.__model = model_
        self.__number = number_

    def __getModel(self):
        return self.__model
    model = property(__getModel) #__modelのアクセサ（getter）

    def __getNumber(self):
        return self.__number
    number = property(__getNumber) #__numberのアクセサ（getter）

#==============
# BikeParkクラス
#==============
class IBikePark(object): #擬似インターフェース
    def add(self, bike_): raise NotImplementedError() #オーバーライドしないとError
    def getBikeAt(self, num_): raise NotImplementedError() #オーバーライドしないとError
    def getLength(self): raise NotImplementedError() #オーバーライドしないとError
    def createIterator(self): raise NotImplementedError() #オーバーライドしないとError

class BikePark(IBikePark):
    __list = None #リスト（プライベート変数）の宣言

    def __init__(self): #コンストラクタ
        self.__list = [] #リストの初期化

    def add(self, bike_):
        self.__list.append(bike_)

    def getBikeAt(self, num_):
        return self.__list[num_]

    def getLength(self):
        return len(self.__list)
    
    def createIterator(self):
        return Iterator(self) #イテレータの生成

#==================================
# Iteratorクラス（≒駐輪場の管理人）
#==================================
class Iterator(object):
    __bikePark = __count = None #プライベート変数の宣言

    def __init__(self, _bikePark):
        self.__bikePark = _bikePark
        self.__count = 0
    
    def hasNext(self):
        return self.__bikePark.getLength() > self.__count
    
    def next(self):
        _nextBike = self.__bikePark.getBikeAt(self.__count)
        self.__count += 1
        return _nextBike

#=======
# 実行
#=======
_bikePark = BikePark()
_bikePark.add(Bike("ESTRELLA", "神戸 こ 17-33"))
_bikePark.add(Bike("SRV250S", "豊橋 え 18-53"))
_bikePark.add(Bike("GB250 CLUBMAN", "品川 く 11-56"))

_iterator = _bikePark.createIterator() #イテレータ（管理人）の生成

while _iterator.hasNext():
    _nextBike = _iterator.next()
    print(_nextBike.model, _nextBike.number)
```

実行環境：Ubuntu 16.04.2 LTS、Python 2.7.12  
作成者：Takashi Nishimura  
作成日：2016年07月02日  
更新日：2017年05月11日


<a name="TemplateMethod"></a>
# <b><ruby>Template Method<rt>テンプレート メソッド</rt></ruby></b>

```
#test.py

#======================================
# 抽象クラス（実際はふつうの基本クラス）
#======================================
class AbstractCard(object):
    def templateMethod(self): #一連の連続した処理の枠組みを定義
        self.order1() #①共通の処理 ←selfは必須
        if (not self.isChild()) : #児童（小学生以下）でなければ...
            self.order2() #②条件により実行する処理
        self.order3() #③独自の処理（派生クラスでオーバーライド）
    def isChild(self): #抽象関数の宣言（派生クラスでオーバーライド）
        raise NotImplementedError() #オーバーライドしないと実行時にError
    def order1(self): print("HAPPY NEW YEAR!") #①共通の処理
    def order2(self): print("勉強頑張ろう!!") #②条件により実行する処理
    def order3(self): raise NotImplementedError() #③独自の処理（派生クラスでオーバーライド）

#==============
# 派生クラス①
#==============
class CardHanako(AbstractCard):
    def isChild(self): return True #オーバーライド
    def order3(self): print("卓球がんばろうね") #オーバーライド

#==============
# 派生クラス②
#==============
class CardTaro(AbstractCard):
    def isChild(self): return False #オーバーライド
    def order3(self): print("卓球頑張ろう!!") #オーバーライド

#=======
# 実行
#=======
_cardHanako = CardHanako()
_cardHanako.templateMethod()
# HAPPY NEY YEAR!
# 卓球がんばろうね

_cardTaro = CardTaro()
_cardTaro.templateMethod()
# HAPPY NEY YEAR!
# 勉強頑張ろう!!
# 卓球頑張ろう!!
```

実行環境：Ubuntu 16.04.2 LTS、Python 2.7.12  
作成者：Takashi Nishimura  
作成日：2016年07月03日  
更新日：2017年05月11日


<a name="Strategy"></a>
# <b><ruby>Strategy<rt>ストラテジー</rt></ruby></b>

### 概要
* アルゴリズムをごっそり切り替える。Strategy とは作戦の意。アルゴリズム（手順）。
* State パターンに似ていますが、State パターンの場合は Context() とするところを Strategy パターンの場合は Context(Strategy()) となります。

### 例文
```
# test.py

#=============
# Jankenクラス
#=============
class Janken(object):
    __strategy = None #プライベート変数宣言

    def __init__(self, strategy_): #コンストラクタ
        self.__strategy = strategy_
    
    def exec(self):
        self.__strategy.execute()

#=================
# StrageyXXXクラス
#=================
class IStrategy(object): #擬似インターフェース（実際はふつうの基本クラス）
    def execute(self): #派生クラスでオーバーライド
        raise NotImplementedError() #オーバーライドしないと実行時にError

class StrategyA(IStrategy):
    def execute(self): #オーバーライド
        print("グー、グー、パー")

class StrategyB(IStrategy):
    def execute(self): #オーバーライド
        print("パー、グー、チョキ")

#======
# 実行
#======
_janken = Janken(StrategyA())
_janken.exec() #グー、グー、パー

_janken = Janken(StrategyB()) #アルゴリズムをごっそり切り替える
_janken.exec() #パー、グー、チョキ
```

実行環境：Ubuntu 16.04.2 LTS、Python 2.7.12  
作成者：Takashi Nishimura  
作成日：2016年07月03日  
更新日：2017年05月11日


<a name="Visitor"></a>
# <b><ruby>Visitor<rt>ビジター</rt></ruby></b>

```
#test.py

#========
# 訪問先
#========
class IAcceptor(object): #擬似インターフェース
    def accept(self, visitor_): #派生クラスでオーバーライド
        raise NotImplementedError() #オーバーライドしないと実行時にError

class Hokkaido(IAcceptor):
    __otoshidama = None
    def __init__(self): self.__otoshidama = 5000*2
    def accept(self, visitor_): #オーバーライド
        visitor_.visit(self.__otoshidama) #訪問者が誰でも同じ関数を実行!!

class Chiba(IAcceptor):
    __otoshidama = None
    def __init__(self): self.__otoshidama = 5000
    def accept(self, visitor_): #オーバーライド
        visitor_.visit(self.__otoshidama) #訪問者が誰でも同じ関数を実行!!

#========
# 訪問者
#========
class IVisitor(object): #擬似インターフェース
    def visit(self, _otoshidama): #派生クラスでオーバーライド
        raise NotImplementedError() #オーバーライドしないと実行時にError
    
    def getMoney(self): #派生クラスでオーバーライド
        raise NotImplementedError() #オーバーライドしないと実行時にError

class Tohru(IVisitor):
    __money = None #プライベート変数（貯金）の宣言
    def __init__(self): self.__money = 0 #コンストラクタ
    def visit(self, _otoshidama): #オーバーライド
        self.__money += _otoshidama
    def getMoney(self): return self.__money

class Sachiko(IVisitor):
    __money = None #プライベート変数（貯金）の宣言
    def __init__(self): self.__money = 0 #コンストラクタ
    def visit(self, _otoshidama): #オーバーライド
        self.__money += _otoshidama
    def getMoney(self): return self.__money

#========
# 実行
#========
#訪問先
_hokkaido = Hokkaido()
_chiba = Chiba()

#訪問者
_ichiro = Tohru()
_hanako = Sachiko()

#訪問する（訪問先側から見ると「受け入れる」）
_hokkaido.accept(_ichiro)
_hokkaido.accept(_hanako)
_chiba.accept(_ichiro)
_chiba.accept(_hanako)

#結果...
print(_ichiro.getMoney()) #15000
print(_hanako.getMoney()) #15000
```

実行環境：Ubuntu 16.04.2 LTS、Python 2.7.12  
作成者：Takashi Nishimura  
作成日：2016年07月03日  
更新日：2017年05月11日


<a name="ChainofResponsibility"></a>
# <b><ruby>Chain of Responsibility<rt>チェーン オブ レスポンシビリティ</rt></ruby></b>

```
# test.py

#=====================
# 各郵便局の抽象クラス
#=====================
class AbstractPO(object):
    _nextPO = None #たらいまわし先
    #↑protectedが無いのでパブリック変数にします...

    #共通の関数
    def setNext(self, _po):
        self._nextPO = _po
        return self._nextPO

    #抽象関数（派生クラスでオーバーライド）
    def send(self, _address):
        raise NotImplementedError() #オーバーライドしないと実行時にError

#===========
# 新宿郵便局
#===========
class ShinjukuPO(AbstractPO):
    #抽象関数をオーバーライド
    def send(self, _address):
        #文字列.find("検索したい文字列" [,開始位置,終了位置])...見つからない場合-1
        if (_address.find("新宿") != -1) : #住所に"新宿"が含まれていたら...
            print("本日中に届きます")
        else:
            self._nextPO.send(_address) #たらいまわし先に振る ←ポイント

#===========
# 東京郵便局
#===========
class TokyoPO(AbstractPO):
    #抽象関数をオーバーライド
    def send(self, _address):
        #文字列.find("検索したい文字列" [,開始位置,終了位置])...見つからない場合-1
        if (_address.find("東京") != -1) : #住所に"東京"が含まれていたら...
            print("明後日中に届きます")
        else:
            self._nextPO.send(_address) #たらいまわし先に振る ←ポイント

#===========
# 日本郵便局
#===========
class JapanPO(AbstractPO):
    #抽象関数をオーバーライド
    def send(self, _address):
        print("一週間前後で届きます")

#===========
# 実行
#===========
#郵便局の設置
_shinjukuPO = ShinjukuPO()
_tokyoPO = TokyoPO()
_japanPO = JapanPO()

#責任のたらいまわしのセット
_shinjukuPO.setNext(_tokyoPO).setNext(_japanPO)

#投函（今回は全て新宿郵便局に投函する）
_shinjukuPO.send("新宿区XX町X-X-X") #本日中に届きます
_shinjukuPO.send("東京都品川区XX町X-X-X") #明後日中に届きます
_shinjukuPO.send("千葉県我孫子市XX町X-X-X") #一週間前後で届きます
#新宿以外の郵便局へ投函する場合は更に複雑な処理をする必要があります...
#現状は新宿以外に投函しても一度（一瞬で!）新宿郵便局を経由して配達されます
```

実行環境：Ubuntu 16.04.2 LTS、Python 2.7.12  
作成者：Takashi Nishimura  
作成日：2016年07月03日  
更新日：2017年05月11日


<a name="Mediator"></a>
# <b><ruby>Mediator<rt>メディエイター</rt></ruby></b>

```
# test.py

#==================================
# 相談役（専門性が高いため使い捨て）
#==================================
class Mediator(object):
    __memberList = None #プライベート変数の宣言

    #静的変数（扱い）の宣言
    MEMBER_A = MEMBER_B = MEMBER_C = 1

    #コンストラクタ関数
    def __init__(self):
        self.__memberList = [] #初期化

        #静的変数の初期化
        Mediator.MEMBER_A = MemberA()
        Mediator.MEMBER_B = MemberB()
        Mediator.MEMBER_C = MemberC()

        #メンバーの登録
        self.addMember(Mediator.MEMBER_A)
        self.addMember(Mediator.MEMBER_B)
        self.addMember(Mediator.MEMBER_C)

    #メンバーリストに登録
    def addMember(self, _member):
        self.__memberList.append(_member)
        _member.setMediator(self) #メンバーに相談役は自分であることを教える

    #メンバーからの報告を受け支持を出す（特に専門性が高い関数）
    def request(self, _member, _string):
        if (_member == Mediator.MEMBER_A) :
            #「メンバーＡ」から「西へ行く」と報告があった場合の処理
            _member.advice("（Ａよ）了解、そのまま西へいけ") #Ａへ指示
        for theMember in self.__memberList:
            if (theMember == Mediator.MEMBER_B):
                theMember.advice("（Ｂよ）東へ行け") #Ｂへ指示
            elif (theMember == Mediator.MEMBER_C):
                theMember.advice("（Ｃよ）その場で待機しろ") #Cへ指示
        #以降、各メンバーからの報告内容に対する処理を記述

#============================
# 登録するメンバー達
#============================
#===============
# 擬似抽象クラス
#===============
class AbstractMember(object):
    _mediator = None #protectedに出来ないのとりあえずパブリック...

    #共通の機能
    def setMediator(self, _mediator):
        self._mediator = _mediator

    #抽象関数の宣言（派生クラスでオーバーライド）
    def request(self, _string):
        raise NotImplementedError() #オーバーライドしないと実行時にError
    
    #抽象関数の宣言（派生クラスでオーバーライド）
    def advice(self, _string):
        raise NotImplementedError() #オーバーライドしないと実行時にError

#============
# メンバーＡ
#============
class MemberA(AbstractMember):
    #抽象関数のオーバーライド
    def request(self, _string):
        #ここにメンバーＡ独自の処理など
        self._mediator.request(self, _string) #相談役に報告

    #抽象関数のオーバーライド
    def advice(self, _string):
        print("A: " + _string)

#============
# メンバーＢ
#============
class MemberB(AbstractMember):
    #抽象関数のオーバーライド
    def request(self, _string):
        #ここにメンバーＢ独自の処理など
        self._mediator.request(self, _string) #相談役に報告

    #抽象関数のオーバーライド
    def advice(self, _string):
        print("B: " + _string)

#============
# メンバーＣ
#============
class MemberC(AbstractMember):
    #抽象関数のオーバーライド
    def request(self, _string):
        #ここにメンバーＢ独自の処理など
        self._mediator.request(self, _string) #相談役に報告

    #抽象関数のオーバーライド
    def advice(self, _string):
        print("C: " + _string)

#============
# 実行
#============
Mediator() #今回のサンプルではこのインスタンスは使用しません

Mediator.MEMBER_A.request("西へ行く")
# A: （Ａよ）了解、そのまま西へいけ
# B: （Ｂよ）東へ行け
# C: （Ｃよ）その場で待機しろ
```

実行環境：Ubuntu 16.04.2 LTS、Python 2.7.12  
作成者：Takashi Nishimura  
作成日：2016年07月03日  
更新日：2017年05月11日


<a name="Observer"></a>
# <b><ruby>Observer<rt>オブザーバ</rt></ruby></b>

```
#test.py

#=======================
# Subjec（観察される側）
#=======================
class ISubject(object):
    #派生クラスでオーバーライドしないと実行時にErrorさせる
    def addObserver(self, _observer): raise NotImplementedError()
    def removeObserver(self, _observer): raise NotImplementedError()
    def notify(self): raise NotImplementedError()

class Apple(ISubject):
    __observerList = None #プライベート変数宣言

    def __init__(self):
        self.__observerList = [] #リスナーリストの初期化

    def addObserver(self, _observer): #リスナーの登録
        self.__observerList.append(_observer)
    
    def removeObserver(self, _observer): #リスナーの削除
        self.__observerList.remove(_observer)

    def notify(self): #全リスナーへの通知
        for theObserver in self.__observerList:
            theObserver.update(self)

    def getVersion(self):
        return "10.3.1"

#===================
# Observer（観察者）
#===================
class IObserver(object):
    #派生クラスでオーバーライドしないと実行時にErrorさせる
    def update(self, _apple): raise NotImplementedError()

class iPhone(IObserver):
    def update(self, _apple):
        print("iPhoneは" + _apple.getVersion() + "にアップデート可能")

class iPad(IObserver):
    def update(self, _apple):
        print("iPadは" + _apple.getVersion() + "にアップデート可能")

#=========
# 実行
#=========
#観察される（Subject）役
_apple = Apple()

#リスナー（Object）役
_iPhone = iPhone()
_iPad = iPad()

#リスナー（Object）役の登録
_apple.addObserver(_iPhone)
_apple.addObserver(_iPad)

#全リスナー（Object)への通知
_apple.notify()
"""
iPhoneは10.3.1にアップデート可能
iPadは10.3.1にアップデート可能
"""
```

実行環境：Ubuntu 16.04.2 LTS、Python 2.7.12  
作成者：Takashi Nishimura  
作成日：2016年07月03日  
更新日：2017年05月11日


<a name="Memento"></a>
# <b><ruby>Memento<rt>メメント</rt></ruby></b>

```
# test.py

#===================================================
# 主人公役＋バックアップ係
#===================================================
class Gamer(object):
    __point = __history = None
    _count = None #Undo/Redo用

    def __init__(self, _point=0):
        self.__point = _point
        self.__history = []

    #__pointのアクセサ
    def __getPoint(self): 
        return self.__point
    def __setPoint(self, value): 
        self.__point = value
    point = property(__getPoint, __setPoint)

    #状態を保存
    def save(self):
        _snapShot = SnapShot(self.point)
        self.__history.append(_snapShot) #履歴に記録
        self.__count = len(self.__history) -1
        return _snapShot

    #履歴
    def history(self):
        for i, theSnapShot in enumerate(self.__history):
            print(i, theSnapShot.point)

    #Undo（やり直し）
    def undo(self):
        if self.__count > 0 :
            self.__count -= 1
            return self.__history[self.__count]
        else:
            print("これ以上、Undoできません")
            self.__count = 0
            return self.__history[0]

    #Redo（再実行）
    def redo(self):
        if (self.__count < len(self.__history)-1) :
            self.__count += 1
            return self.__history[self.__count]
        else:
            print("これ以上、Redoできません")
            self.__count = len(self.__history) -1
            return self.__history[self.__count]

#===========================================
# Memento役（その瞬間の状態をオブジェクト化）
#===========================================
class SnapShot(object):
    __point = None #今回はシンプルに１つだけにしておきます
    
    def __init__(self, _point):
        self.__point = _point

    #__pointのアクセサ
    def __getPoint(self):
        return self.__point
    def __setPoint(self, value):
        self.__point = value
    point = property(__getPoint, __setPoint)

#=======
# 実行
#=======
_gamer = Gamer(100)
_gamer.save() #最初の状態を保存

_gamer.point = 2000
_gamer.save() #この時点での状態を保存

_gamer.point = 8000
_gamer.save() #この時点での状態を保存

_gamer.history() #履歴を調べる
# 0 100
# 1 2000
# 2 8000

#Undo（やり直し）
_snapShot = _gamer.undo()
print(_snapShot.point) #2000

_snapShot = _gamer.undo()
print(_snapShot.point) #100

_snapShot = _gamer.undo()
print(_snapShot.point) #これ以上、Undoできません → 100

#Redo（再実行）
_snapShot = _gamer.redo()
print(_snapShot.point) #2000

_snapShot = _gamer.redo()
print(_snapShot.point) #8000

_snapShot = _gamer.redo()
print(_snapShot.point) #これ以上、Redoできません → 8000
```

実行環境：Ubuntu 16.04.2 LTS、Python 2.7.12  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="State"></a>
# <b><ruby>State<rt>ステート</rt></ruby></b>

```
# test.py

#========================
# Context（状態を管理）役
#========================
class Janken(object):
    #プライベート変数
    __state = None #状態（State○）を格納
    
    #状態の設定   
    def setState(self, _state):
        self.__state = _state

    #状態の実行
    def exec(self):
        self.__state.execute() 
        #State○.execute()を呼び出す

#================
# State（状態）役
#================
#擬似インターフェース
class IState(object):
    #↓派生クラスでオーバーライドしないと実行時にErrorさせる
    def execute(self):
        raise NotImplementedError()

#状態Ａ
class StateA(IState):
    #↓Janken.exec()から呼び出される
    def execute(self): 
        print("グー、グー、パー")

#状態Ｂ
class StateB(IState):
    #↓Janken.exec()から呼び出される
    def execute(self):
        print("パー、グー、チョキ")

#=======
# 実行
#=======
#Context（状態を管理）役
_janken = Janken()

#State（状態）役
_stateA = StateA()
_stateB = StateB()

#状態の設定＆実行
_janken.setState(_stateA)
_janken.exec() #グー、グー、パー

#状態の変更＆実行
_janken.setState(_stateB)
_janken.exec() #パー、グー、チョキ
```

実行環境：Ubuntu 16.04.2 LTS、Python 2.7.12  
作成者：Takashi Nishimura  
作成日：2016年07月03日  
更新日：2017年05月11日


<a name="Command"></a>
# <b><ruby>Command<rt>コマンド</rt></ruby></b>

```
#test.py

#=====================================================================
# グラフィックソフト
# ※バッチ処理（batch(_start, _end)を追加することも可能ですが今回は省略
#=====================================================================
class Inkscape(object):
    #プライベート変数の宣言
    __canvas = None #Receiver（結果を表示する）役
    __history = None #履歴（命令クラス）を保存
    
    #コンストラクタ
    def __init__(self):
        self.__canvas = Canvas()
        self.__history = []

    #命令の実行
    def draw(self, command_):
        #↓命令を実行する度にインスタンス生成!!
        drawCommand_ = DrawCommand(self.__canvas, command_)
        drawCommand_.execute() #実行＝キャンバスの再描画
        self.__history.append(drawCommand_) #命令クラスを履歴に保存

#===========
# 命令クラス
#===========
class DrawCommand(object):
    #プライベート変数の宣言
    __canvas = None #Receiver（結果を表示する）役
    __command = None

    #コンストラクタ
    def __init__(self, canvas_, command_):
        self.__canvas = canvas_
        self.__command = command_
    
    #↓Inkscape.draw()から呼び出される
    def execute(self):
        self.__canvas.update(self.__command)

#=========================================
# 結果を表示する役＝Receiver（受信者）の役
#=========================================
class Canvas(object):
    #プライベート変数の宣言
    __history = None #履歴（実際の処理）を保存

    #コンストラクタ
    def __init__(self):
        self.__history = []

    #キャンバスの再描画
    def update(self, command_): #DrawCommand.execute()からの呼出し
        self.__history.append(command_)
        for theCommand in self.__history:
            print(theCommand)
        print("\n")

#===========
# 実行
#===========
#グラフィックソフトの起動
_inkscape = Inkscape()

#命令の実行
_inkscape.draw("線を引く")
_inkscape.draw("縁取る")
_inkscape.draw("影を付ける")
```

実行環境：Ubuntu 16.04.2 LTS、Python 2.7.12  
作成者：Takashi Nishimura  
作成日：2016年07月04日  
更新日：2017年05月11日


<a name="Interpreter"></a>
# <b><ruby>Interpreter<rt>インタプリタ</rt></ruby></b>

```
# test.py

#==============================
# ≒SWFファイルを生成するクラス
#==============================
class SWF(object):
    #プライベート変数
    __codeList = None #命令を配列化（≒中間コード）
    __count = None #getNextCode()で使用

    #コンストラクタ
    def __init__(self, _code):
        self.__codeList = _code.split(';') #「;」区切りで配列化
        self.__count = 0

    #次の命令を返す
    def getNextCode(self):
        self.__count += 1
        return self.__codeList[self.__count -1]
    
    #次の命令があるか否か...
    def isEnd(self):
        return self.__count >= len(self.__codeList)

#===============================
# ≒ActionScript Virtual Machine
#===============================
class AVM(object):
    #≒SWFファイルをAVM上で実行
    def execute(self, _swf):
        _result = 0 #計算結果

        #次の命令があれば...
        while (not _swf.isEnd()) :
            nextCode_ = _swf.getNextCode() #次の命令を調べる

            #ここからは特にサンプルの独自処理
            #................................
            _operator = nextCode_[0] #「+*/-=」の何れか
            if (_operator != "="):
                str_ = nextCode_[1:len(nextCode_)] #「+*/-」を除いた数字
                int_ = int(str_)
                if (_operator == "+"): _result += int_
                elif (_operator == "-"): _result -= int_
                elif (_operator == "*"): _result *= int_
                elif (_operator == "/"): _result /= int_
                else: print("Error: 演算子が異なります")
            else:
                #本来はここで「終端となる表現」のクラスを生成して処理しますが省略
                print(_result)
            #................................

#=======
# 実行
#=======
_code = "+10;*50;/2;-4;=" #自作言語による記述（≒ActionScript）
_swf = SWF(_code) #≒SWFファイルに変換
_avm = AVM() #≒ActionScript Virtual Machine
_avm.execute(_swf) #≒SWFファイルをAVM上で実行
#246.0 ←(0+10)*50/2-4
```

実行環境：Ubuntu 16.04.2 LTS、Python 2.7.12  
作成者：Takashi Nishimura  
作成日：2016年07月04日  
更新日：2017年05月11日