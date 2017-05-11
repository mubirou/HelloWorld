### <b>この項目は書きかけの項目です</b>

# <b>Ruby デザインパターン</b>

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
    ***
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
#test.rb
require "singleton" #Singletonモジュールをインストール（必須）

class SingletonClass
    include Singleton #Singletonパターン化（ポイント）
end

#SingletonClass.new() #クラス.new()でインスタンスを生成しようとするとError
_singletonClass1 = SingletonClass.instance #唯一のインスタンスにアクセスする方法
_singletonClass2 = SingletonClass.instance #唯一のインスタンスにアクセスする方法
puts(_singletonClass1) #=> #<SingletonClass:0x000000012db328>
puts(_singletonClass2) #=> #<SingletonClass:0x000000012db328>
p _singletonClass1.eql?(_singletonClass2) #=> true ←中身は全く同じインスタンス
```

実行環境：Ubuntu 16.04.2 LTS、Ruby 2.3.1  
作成者：Takashi Nishimura  
作成日：2016年07月11日  
更新日：2017年05月11日


<a name="Prototype"></a>
# <b><ruby>Prototype<rt>プロトタイプ</rt></ruby></b>

```
#test.rb

=begin
「コピーしてインスタンスを作る」
ポイント① : 2つ目はクラス .new() を使って生成しない
ポイント② : 複製にはインスタンス.clone() を使う
=end

#インターフェース（実際はふつうのスーパークラス）
class IPrototype
    def clone() #抽象メソッド
        raise "派生クラスで実装して下さい" #派生クラスで強制的に実装させる為...
    end
end

#インターフェースの実装（継承）
class Prototype < IPrototype
    @firstName; @lastName; #インスタンス変数＝プライベート変数宣言（省略可）

    #コンストラクタ
    def initialize(_lastName)
        @lastName = _lastName
    end

    # @firstNameのアクセサ（getter）
    def firstName
        @firstName
    end

    # @firstNameのアクセサ（setter）
    def firstName=(value)
        @firstName = value
    end

    # @firstNameのアクセサ（getter）
    def lastName
        @lastName
    end

     #スーパークラス（擬似インターフェース）のメソッドをオーバーライド
    def clone()
        return self.dup #参考:配列（Array）
    end
end

# 実行
_prototype1 = Prototype.new("NISHIMURA") #インスタンスを生成
_prototype1.firstName = "ICHIRO"
_prototype2 = _prototype1.clone() #複製する（Prototype.new()を使わない）
_prototype2.firstName = "HANAKO" #変更しないと複製時の"ICHIRO"のまま
puts(_prototype1.firstName, _prototype1.lastName) #=> "ICHIRO" → "NISHIMURA"
puts(_prototype2.firstName, _prototype2.lastName) #=> "HANAKO" → "NISHIMURA"
```

実行環境：Ubuntu 16.04.2 LTS、Ruby 2.3.1  
作成者：Takashi Nishimura  
作成日：2016年07月11日  
更新日：2017年05月11日


<a name="Builder"></a>
# <b><ruby>Builder<rt>ビルダー</rt></ruby></b>

```
#test.rb

#==================================
# Directorクラス（≒年賀状印刷業者）
#==================================
class Director
    @builder #Builder○のインスタンスを格納（委譲）
    def initialize(_builder)
        @builder = _builder
    end
    def construct() #共通の手順（カスタムメソッド）
        @builder.makeHeader() #手順①
        @builder.makeContent() #手順②
        @builder.makeFooter() #手順③
    end
end

#==================================
# BuilderXXXクラスのインターフェース
#==================================
class IBuilder
    def makeHeader()
        raise "派生クラスで実装して下さい"
    end
    def makeContent()
        raise "派生クラスで実装して下さい"
    end
    def makeFooter()
        raise "派生クラスで実装して下さい"
    end
end

#====================================
# BuilderAクラス（≒年賀状のタイプＡ）
#====================================
class BuilderA < IBuilder
    def makeHeader() #擬似インターフェースの関数をオーバーライド
        puts("あけましておめでとうございます")
    end
    def makeContent() #擬似インターフェースの関数をオーバーライド
        puts("□□イラ□スト□□")
    end
    def makeFooter() #擬似インターフェースの関数をオーバーライド
        puts("元旦")
    end
end

#====================================
# BuilderBクラス（≒年賀状のタイプＢ）
#====================================
class BuilderB < IBuilder
    def makeHeader() #擬似インターフェースの関数をオーバーライド
        puts("HAPPY NEW YEAR!")
    end
    def makeContent() #擬似インターフェースの関数をオーバーライド
        puts("○イ○ラ○ス○ト○")
    end
    def makeFooter() #擬似インターフェースの関数をオーバーライド
        puts("2018.1.1")
    end
end

#========
# 実行
#========
_directorA = Director.new(BuilderA.new())
_directorA.construct()
#=> あけましておめでとうございます
#=> □□イラ□スト□□
#=> 元旦

_directorB = Director.new(BuilderB.new())
_directorB.construct()
#=> HAPPY NEW YEAR!
#=> ○イ○ラ○ス○ト○
#=> 2018.1.1
```

実行環境：Ubuntu 16.04.2 LTS、Ruby 2.3.1  
作成者：Takashi Nishimura  
作成日：2016年07月11日  
更新日：2017年05月11日


<a name="FactoryMethod"></a>
# <b><ruby>Factory Method<rt>ファクトリー メソッド</rt></ruby></b>

```
#test.rb

#==================
#（擬似）抽象クラス
#==================
class AbstractCard
    def factoryMethod(arg) #抽象メソッド
        raise "派生クラスで実装して下さい"
    end
   
    def templateMethod(arg) #継承するメソッド
        #条件分岐をここで行わない＝ここを汚さない
        _message = self.factoryMethod(arg) #派生クラスのメソッドを呼出す
        _message.exec() #処理①
        order1() #処理②
        order2() #処理③
    end

    def order1() #共通の処理
        puts("〒XXX-XXXX 新宿区XX町X-X-X") 
    end
    
    def order2() #（擬似）抽象メソッド（派生クラスでオーバーライド）
        raise "派生クラスで実装して下さい"
    end
end

#========================
# 派生クラス（CardICHIRO）
#========================
class CardICHIRO < AbstractCard  #（擬似）抽象クラスの実装
    def factoryMethod(arg) #抽象メソッドをオーバーライド
        if (arg == "先生") then
            return Message1.new() #ここでインスタンス生成
        elsif (arg == "同級生") then
            return Message2.new() #ここでインスタンス生成
        else 
            raise "Error:CardICHIRO.factoryMethod()" #Errorを発生させる
        end
    end
  
    def order2()  #抽象メソッドをオーバーライド  
        puts("西村一郎") #具体的な処理を記述
    end
end

#========================
# 派生クラス（CardHANAKO）
#========================
class CardHANAKO < AbstractCard #（擬似）抽象クラスの実装
    def factoryMethod(arg) #抽象メソッドをオーバーライド
        if (arg == "先生") then
            return Message3.new() #ここでインスタンス生成
        elsif (arg == "同級生") then
            return Message4.new() #ここでインスタンス生成
        else
            raise "Error:CardICHIRO.factoryMethod()" #Errorを発生させる
        end
    end

    def order2()  #抽象メソッドをオーバーライド  
        puts("西村花子") #具体的な処理を記述
    end
end

#===================
# 生成したいクラス群
#===================
class IMessage #インターフェース（実際は普通の基本クラス）
    def exec()
        raise "派生クラスで実装して下さい"
    end
end

class Message1 < IMessage
    def exec()
        puts("謹賀新年")
    end
end

class Message2 < IMessage
    def exec()
        puts("HAPPY NEW YEAR!")
    end
end

class Message3 < IMessage
    def exec()
        puts("明けましておめでとうございます")
    end
end

class Message4 < IMessage
    def exec()
        puts("あけましておめでとう!")
    end
end

#=======
# 実行
#=======
#CardICHIROインスタンスの生成
_cardTOHRU = CardICHIRO.new()
_cardTOHRU.templateMethod("先生")
#=> 謹賀新年
#=> 〒XXX-XXXX 新宿区XX町X-X-X
#=> 西村一郎
_cardTOHRU.templateMethod("同級生")
#=> HAPPY NEW YEAR!
#=> 〒XXX-XXXX 新宿区XX町X-X-X
#=> 西村一郎

#CardHANAKOインスタンスの生成
_cardSACHIKO = CardHANAKO.new()
_cardSACHIKO.templateMethod("先生")
#=> 明けましておめでとうございます
#=> 〒XXX-XXXX 新宿区XX町X-X-X
#=> 西村花子
_cardSACHIKO.templateMethod("同級生")
#=> あけましておめでとう!
#=> 〒XXX-XXXX 新宿区XX町X-X-X
#=> 西村花子
```

実行環境：Ubuntu 16.04.2 LTS、Ruby 2.3.1  
作成者：Takashi Nishimura  
作成日：2016年07月11日  
更新日：2017年05月11日


<a name="AbstractFactory"></a>
# <b><ruby>Abstract Factory<rt>アブストラクト ファクトリー</rt></ruby></b>

```
#test.rb

#================================
# （擬似）抽象クラス＝抽象的な工場
#================================
class AbstractFactory
    class << self #静的メソッド（決め打ち）
        def createFactory(_name)
            if (_name == "ICHIRO") then
                return ICHIRO.new() #具体的な「一郎工場」（インスタンス）を生成
            elsif (_name == "HANAKO") then
                return HANAKO.new() #具体的な「花子工場」（インスタンス）を生成
            else
                raise "Error: AbstractFactory.createFactory()"
            end
        end
    end

    def createNewYear() #擬似抽象メソッド
        raise "派生クラスで実装して下さい"
    end
    
    def createSummer() #擬似抽象メソッド
        raise "派生クラスで実装して下さい"
    end
end


#=========================
# 派生クラス＝実際の工場群
#=========================
class ICHIRO
    def createNewYear() #抽象メソッドをオーバーライド
        puts("HAPPY NEW YEAR!\nICHIRO NISHIMURA")
    end

    def createSummer() #擬似抽象メソッド
        puts("暑中お見舞い申し上げます\n西村一郎")
    end
end

class HANAKO
    def createNewYear() #抽象メソッドをオーバーライド
        puts("明けましておめでとうございます\n西村花子")
    end

    def createSummer() #擬似抽象メソッド
        puts("暑中おみまいもうしあげます\n西村花子")
    end
end

#======
# 実行
#======
_factoryICHIRO = AbstractFactory.createFactory("ICHIRO") #new()を使わない
_factoryICHIRO.createNewYear()
#=> HAPPY NEW YEAR!
#=> ICHIRO NISHIMURA
_factoryICHIRO.createSummer()
#=> 暑中お見舞い申し上げます
#=> 西村一郎

_factoryHANAKO = AbstractFactory.createFactory("HANAKO") #new()を使わない
_factoryHANAKO.createNewYear()
#=> 明けましておめでとうございます
#=> 西村花子
_factoryHANAKO.createSummer()
#=> 暑中おみまいもうしあげます
#=> 西村花子
```

実行環境：Ubuntu 16.04.2 LTS、Ruby 2.3.1  
作成者：Takashi Nishimura  
作成日：2016年07月11日  
更新日：2017年05月11日


<a name="Adapter（継承）"></a>
# <b><ruby>Adapter<rt>アダプター</rt></ruby>（継承）</b>

```
#test.rb

=begin
「一皮かぶせて再利用」
別名Wrapper（ラッパー）パターン
=end

# 基本クラス（Moneybox）
class Moneybox
    @yen #プライベート変数宣言
    def initialize(_yen) #コンストラクタ
       @yen = _yen
    end
    def add(_yen)
        @yen += _yen
    end
    def getYen()
        return @yen
    end
end

# 派生クラス（Exchange）
class Exchange < Moneybox #多重継承は出来ないので（擬似）インターフェースは省略
    @rate #インスタンス変数
    def initialize(_firstYen, _rate) #コンストラクタ
        @rate = _rate
        super(_firstYen) #スーパークラスのコンストラクタの呼出し
    end
    def addYen(_yen)
        add(_yen) #add()はスーパークラスから継承
    end
    def getDollar()
        return getYen() / @rate #getYen()はスーパークラスから継承
    end
end

# 実行
_exchange = Exchange.new(10000, 114.207401)
_exchange.addYen(8000)
puts _exchange.getDollar() #157.60799950258914（ドル）
```

実行環境：Ubuntu 16.04.2 LTS、Ruby 2.3.1  
作成者：Takashi Nishimura  
作成日：2016年07月11日  
更新日：2017年05月11日


<a name="Adapter（委譲）"></a>
# <b><ruby>Adapter<rt>アダプター</rt></ruby>（委譲）</b>

```
#test.rb

# 基本クラス（「継承」版と同じ）
class Moneybox
    @yen #プライベート変数宣言
    def initialize(_yen) #コンストラクタ
       @yen = _yen
    end
    def add(_yen)
        @yen += _yen
    end
    def getYen()
        return @yen
    end
end

# 派生クラス（この内容が「継承」版と異なる）
class Exchange
    @moneybox; @rate; #インスタンス変数宣言

    def initialize(_firstYen, _rate) #コンストラクタ
        @moneybox = Moneybox.new(_firstYen) #ここがポイント(委譲）
        @rate = _rate
    end

    def addYen(_yen)
        @moneybox.add(_yen) #ポイント
    end

    def getDollar()
        return @moneybox.getYen() / @rate #ポイント
    end
end

# 実行
_exchange = Exchange.new(10000, 114.207401)
_exchange.addYen(8000)
puts _exchange.getDollar() #157.60799950258914（ドル）
```

実行環境：Ubuntu 16.04.2 LTS、Ruby 2.3.1  
作成者：Takashi Nishimura  
作成日：2016年07月11日  
更新日：2017年05月11日


<a name="Bridge"></a>
# <b><ruby>Bridge<rt>ブリッジ</rt></ruby></b>

```
# test.rb

#================
#「機能」のクラス
#================
class SuperMobile #「機能」クラスの最上位
    @os #「機能」⇔「実装」クラスの「橋」（委譲）
    
    def initialize(_os) #コンストラクタ
        @os = _os
    end
    
    def version #OSの@versionのアクセサ（getter）
        @os.rawVersion
    end
end

class Tablet < SuperMobile #「機能」のクラスに機能を追加したクラス
    def initialize(_os) #コンストラクタ
        super(_os) #スーパークラスのコンストラクタの呼出し
    end

    def bigScreen() #タブレット特有の機能
        puts("大きな画面で見る")
    end
end

class SmartPhone < SuperMobile #「機能」のクラスに機能を追加したクラス
    def initialize(_os) #コンストラクタ
        super(_os) #スーパークラスのコンストラクタの呼出し
    end

    def phone() #スマートフォン特有の機能
        puts("電話をかける")
    end
end


#===================================
#「実装」のクラス（抽象クラスは省略）
#===================================
class Android #「実装」の具体的な実装者
    @version #インスタンス変数の宣言
    def initialize() #コンストラクタ
        @version = "Android 7.1.2"
    end

    def rawVersion #@versionのアクセサ（getter）
        return @version
    end
end

class IOS #「実装」の具体的な実装者
    @version #インスタンス変数の宣言
    def initialize() #コンストラクタ
        @version = "iOS 10.3.1"
    end
    def rawVersion #@versionのアクセサ（getter）
        return @version
    end
end

#========
# 実行
#========
_tablet1 = Tablet.new(Android.new())
puts(_tablet1.version) # "Android 7.1.2"
_tablet1.bigScreen() #大きな画面で見る

_tablet2 = Tablet.new(IOS.new())
puts(_tablet2.version) # "iOS 10.3.1"
_tablet2.bigScreen() #大きな画面で見る

_smartPhone1 = SmartPhone.new(Android.new())
puts(_smartPhone1.version) # "Android 7.1.2"
_smartPhone1.phone() #電話をかける

_smartPhone2 = SmartPhone.new(IOS.new())
puts(_smartPhone2.version) # "iOS 10.3.1"
_smartPhone2.phone() #電話をかける
```

実行環境：Ubuntu 16.04.2 LTS、Ruby 2.3.1  
作成者：Takashi Nishimura  
作成日：2016年07月11日  
更新日：2017年05月12日


<a name="Composite"></a>
# <b><ruby>Composite<rt>コンポジット</rt></ruby></b>
* 以下のサンプルは root に Authoring フォルダを作成し、その中に Unity3D と Unreal Engine ファイルを格納してみます。

```
# test.rb

#===============================
# 抽象クラス＝同一視するための役
#===============================
class Component
    attr_reader :name #@nameのgetter
    attr_accessor :parent #@parentのgetter/setter

    def initialize()
        #共通のプロパティ（インスタンス変数）
        @name = nil
        @parent = nil
    end

    def getList() # 抽象メソッド（派生クラスでオーバーライドが必要）
        raise "派生クラスで実装して下さい"
    end
end

#=============================
# 派生クラス（Directoryクラス）
#=============================
class Directory < Component #Rubyでは"Directory"という名前も可
    @childList #インスタンス変数宣言（省略可）

    def initialize(_name) #コンストラクタ関数
        super() #必須
        @name = _name
        @childList = []
    end

    def add(arg)
        @childList.push(arg)
        arg.parent = self
    end
    
    def getList() #オーバーライドして実際の処理を記述
        for tmp in @childList do
            _result = @name + "/" + tmp.name
            if tmp.instance_of?(Directory) then
                _result += "(Directory)"
            elsif tmp.instance_of?(FileName) then
                _result += "(FileName)"
            end
            puts(_result)
        end
    end
end

#=============================
# 派生クラス（FileNameクラス）
#=============================
class FileName < Component #Rubyでは"FileName"という名前は不可
    def initialize(_name)
        @name = _name
    end

    def getList() #オーバーライドして実際の処理を記述
        puts(@parent.name + "/" + name + "(FileName)")
    end
end

#=======
# 実行
#=======
# ①ディレクトリの作成
_root = Directory.new("root")
_authoring = Directory.new("Authoring")

# ②ファイルの作成
_unity3D = FileName.new("Unity3D")
unrealEngine_ = FileName.new("Unreal Engine")

# ③関連付け
_root.add(_authoring) #ディレクトリ内にフォルダを入れる
_authoring.add(_unity3D) #ディレクトリ内にファイルを入れる
_authoring.add(unrealEngine_) #ディレクトリ内にファイルを入れる

# ④検証
puts(unrealEngine_.name) #=> Unreal Engine
_root.getList() #=> root/Authoring(Directory)
_authoring.getList() #=> Authoring/Unity3D(FileName)、Authoring/Unreal Engine(FileName)
_unity3D.getList() #=> Authoring/Unity3D(FileName)
```

実行環境：Ubuntu 16.04.2 LTS、Ruby 2.3.1  
作成者：Takashi Nishimura  
作成日：2016年07月12日  
更新日：2017年05月12日


<a name="Decorator"></a>
# <b><ruby>Decorator<rt>デコレータ</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04.2 LTS、Ruby 2.3.1  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="Facade"></a>
# <b><ruby>Facade<rt>ファサード</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04.2 LTS、Ruby 2.3.1  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="Flyweight"></a>
# <b><ruby>Flyweight<rt>フライウエイト</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04.2 LTS、Ruby 2.3.1  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="Proxy"></a>
# <b><ruby>Proxy<rt>プロキシー</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04.2 LTS、Ruby 2.3.1  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="Iterator"></a>
# <b><ruby>Iterator<rt>イテレータ</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04.2 LTS、Ruby 2.3.1  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="TemplateMethod"></a>
# <b><ruby>Template Method<rt>テンプレート メソッド</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04.2 LTS、Ruby 2.3.1  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="Strategy"></a>
# <b><ruby>Strategy<rt>ストラテジー</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04.2 LTS、Ruby 2.3.1  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="Visitor"></a>
# <b><ruby>Visitor<rt>ビジター</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04.2 LTS、Ruby 2.3.1  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="ChainofResponsibility"></a>
# <b><ruby>Chain of Responsibility<rt>チェーン オブ レスポンシビリティ</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04.2 LTS、Ruby 2.3.1  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="Mediator"></a>
# <b><ruby>Mediator<rt>メディエイター</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04.2 LTS、Ruby 2.3.1  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="Observer"></a>
# <b><ruby>Observer<rt>オブザーバ</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04.2 LTS、Ruby 2.3.1  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="Memento"></a>
# <b><ruby>Memento<rt>メメント</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04.2 LTS、Ruby 2.3.1  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="State"></a>
# <b><ruby>State<rt>ステート</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04.2 LTS、Ruby 2.3.1  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="Command"></a>
# <b><ruby>Command<rt>コマンド</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04.2 LTS、Ruby 2.3.1  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日


<a name="Interpreter"></a>
# <b><ruby>Interpreter<rt>インタプリタ</rt></ruby></b>

XXXX

実行環境：Ubuntu 16.04.2 LTS、Ruby 2.3.1  
作成者：Takashi Nishimura  
作成日：2016年XX月XX日  
更新日：2017年05月XX日