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
作成者：vvestvillage  
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
作成者：vvestvillage  
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
作成者：vvestvillage  
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
作成者：vvestvillage  
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
作成者：vvestvillage  
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
作成者：vvestvillage  
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
作成者：vvestvillage  
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
作成者：vvestvillage  
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
作成者：vvestvillage  
作成日：2016年07月12日  
更新日：2017年05月12日


<a name="Decorator"></a>
# <b><ruby>Decorator<rt>デコレータ</rt></ruby></b>

```
#test.rb

#===============================================================
# 基本クラス（「中身」と「飾り枠」に同じshow()関数を持たせるため）
#===============================================================
class Display
    attr_reader :content #@contentのアクセサ（getter/setter）←派生クラスで利用
    @content #省略可

    def show()
        puts(@content)
    end
end

#======================================
# 派生クラス「中身」（飾りを施す前の元）
#======================================
class Original < Display
    def initialize(_string) #コンストラクタ
    @content = _string
    end
end


#======================
# 派生クラス「飾り枠①」
#======================
class Decorator1 < Display
    def initialize(_display) #コンストラクタ
    @content = "-" + _display.content + "-" #飾り「--」を付ける
    end
end

#======================
# 派生クラス「飾り枠②」
#======================
class Decorator2 < Display
    def initialize(_display) #コンストラクタ
    @content = "<" + _display.content + ">" #飾り「<>」を付ける
    end
end

#==========
# 実行
#==========
_original = Original.new("CHIKASHI")
_original.show() #=> CHIKASHI

_decorator1 = Decorator1.new(Original.new("CHIKASHI"))
_decorator1.show() #=> -CHIKASHI-

_decorator2 = Decorator2.new(Original.new("CHIKASHI"))
_decorator2.show() #=> <CHIKASHI>

_special = Decorator2.new(
            Decorator1.new(
                Decorator1.new(
                    Decorator1.new(
                        Original.new("CHIKASHI")
                    )
                )
            )
)
_special.show() #=> <---CHIKASHI--->
```

実行環境：Ubuntu 16.04.2 LTS、Ruby 2.3.1  
作成者：vvestvillage  
作成日：2016年07月12日  
更新日：2017年05月13日


<a name="Facade"></a>
# <b><ruby>Facade<rt>ファサード</rt></ruby></b>

* 以下の例文では「Decoratorパターン」を Facade パターンでシンプルにします。
```
_special = Decorator2.new(
                Decorator1.new(
                    Decorator1.new(
                        Decorator1.new(
                            Original.new("CHIKASHI")))))
_special.show()
```
...としていたものを次の1行で実現可能になります。
```
DecoratorFacade.set("CHIKASHI", 3, 1)
```

### 例文
```
#test.rb

#=====================================================
# 以下の４つのクラスはDecoratorパターンの例文と全く同じ
#=====================================================
class Display # 基本クラス（「中身」と「飾り枠」に同じshow()関数を持たせるため）
    attr_reader :content #@contentのアクセサ（getter/setter）←派生クラスで利用
    @content #省略可

    def show()
        puts(@content)
    end
end

class Original < Display # 派生クラス「中身」（飾りを施す前の元）
    def initialize(_string) #コンストラクタ
    @content = _string
    end
end

class Decorator1 < Display # 派生クラス「飾り枠①」
    def initialize(_display) #コンストラクタ
    @content = "-" + _display.content + "-" #飾り「--」を付ける
    end
end

class Decorator2 < Display # 派生クラス「飾り枠②」
    def initialize(_display) #コンストラクタ
    @content = "<" + _display.content + ">" #飾り「<>」を付ける
    end
end

#============================================================
# シンプルな窓口 ←Decoratorパターンにこのクラスを追加するだけ
#============================================================
require "singleton" #Singletonモジュールをインストール（必須）
class DecoratorFacade #Singletonパターン
    include Singleton #Singletonパターン化（ポイント）
    class << self #クラスメソッド（静的メソッド）宣言
        def set(arg1, arg2=0, arg3=0)
            _result = Original.new(arg1)
            for i in 1..arg2 do
                _result = Decorator1.new(_result)
            end
            for j in 1..arg3 do
                _result = Decorator2.new(_result)
            end
            _result.show()
        end
    end
end

#========
# 実行
#========
DecoratorFacade.set("CHIKASHI") #=> CHIKASHI
DecoratorFacade.set("CHIKASHI", 1, 0) #=> -CHIKASHI-
DecoratorFacade.set("CHIKASHI", 0, 1) #=> <CHIKASHI>
DecoratorFacade.set("CHIKASHI", 3, 1) #=> <---CHIKASHI--->
```

実行環境：Ubuntu 16.04.2 LTS、Ruby 2.3.1  
作成者：vvestvillage  
作成日：2016年07月12日  
更新日：2017年05月13日


<a name="Flyweight"></a>
# <b><ruby>Flyweight<rt>フライウエイト</rt></ruby></b>

* 事前に①A.txt（"あいうえお"）②KA.txt（"かきくけこ"）を作成しておきます

```
# test.rb

require "singleton" #Singletonに必須

#===========================================
# インスンタンスの管理人（Singletonパターン）
#===========================================
class Manager
    include Singleton #Singletonパターン化（ポイント）
    def initialize() #コンストラクタ
        @hash = Hash.new #←インスタンスを格納する空のハッシュを作成
    end
    def createReader(arg) # フライ級の生成（既存の場合、そのインスタンスを返す）   
        _isKey = @hash.key?(arg)  #キーが既存か調べる（ポイント!!）
        if (! _isKey) then #@hash[arg]が存在しない場合...
            @hash[arg] = Reader.new(arg) #ここでやっとインスタンス生成
        end #@hash[arg]が存在する場合はインスタンスの生成はしない
        return @hash[arg] #ハッシュに登録されたReaderクラスのインスタンスを返す
    end
end

#==========================================================
#フライ級（メモリの使用量が多いため無駄に生成したくないもの）
#==========================================================
class Reader
    def initialize(arg)
        @text = File.read(arg + ".txt") #外部テキストの読み込み
    end
    def getText()
        puts(@text)
    end
end

#=======
# 実行
#=======
_manager = Manager.instance #唯一のインスタンス（インスタンス管理人者）にアクセス（Singleton）
_readerA = _manager.createReader("A")
_readerKA = _manager.createReader("KA")
# 既成のものを生成しようとすると...
_readerA2 = _manager.createReader("A")
puts(_readerA == _readerA2) #true ←中身は同じインスタンス（参照しているだけ）
# 実行
_readerA.getText() #"あいうえお"
_readerKA.getText() #"かきくけこ"
```

実行環境：Ubuntu 16.04.2 LTS、Ruby 2.3.1  
作成者：vvestvillage  
作成日：2016年07月12日  
更新日：2017年05月13日


<a name="Proxy"></a>
# <b><ruby>Proxy<rt>プロキシー</rt></ruby></b>

```
# test.rb

#============================
# ①と②の擬似インターフェース
#============================
class ILoader
    def load() 
        raise "派生クラスで実装して下さい"
    end
end

#====================
# ①代理人（Proxy）役
#====================
class Loader < ILoader #擬似インターフェースを実装
    def initialize(_path) #コンストラクタ関数
        @path = _path
    end

    def load() #オーバーライド
        _content = Content.new(@path) #←実際の本人登場（代理人は実際の本人を知っている）
        _content.load()
    end
end

#==============
# ②実際の本人
#==============
class Content < ILoader #擬似インターフェースを実装
    @path
    def initialize(_path) #コンストラクタ関数
        @path = _path
    end
    def load() #オーバーライド ←重〜い処理をここで行う（ポイント!!）
        puts(File.read(@path)) #今回のサンプルでは外部テキストを読み込む
    end
end

#=======
# 実行
#=======
loader_ = Loader.new("sample.txt") #代理人（Proxy）役
loader_.load() #実際は必要になった時にロードしますが...
```

実行環境：Ubuntu 16.04.2 LTS、Ruby 2.3.1  
作成者：vvestvillage  
作成日：2016年07月12日  
更新日：2017年05月13日


<a name="Iterator"></a>
# <b><ruby>Iterator<rt>イテレータ</rt></ruby></b>

```
#test.rb

#============
# Bikeクラス
#============
class Bike
    attr_reader :model #@modelのアクセサ（getter）
    attr_reader :number #@numberのアクセサ（getter）

    def initialize(_model, _number) #コンストラクタ
        @model = _model
        @number = _number
    end
end

#===============
# BikeParkクラス
#===============
class IBikePark #擬似インターフェース
    def add(_bike)
        raise "派生クラスで実装して下さい"
    end
    def getBikeAt(_num)
        raise "派生クラスで実装して下さい"
    end
    def getLength()
        raise "派生クラスで実装して下さい"
    end
    def createIterator()
        raise "派生クラスで実装して下さい"
    end
end

class BikePark < IBikePark
    def initialize() #コンストラクタ
        @list = [] #リストの初期化
    end
    def add(_bike)
        @list.push(_bike)
    end
    def getBikeAt(_num)
        return @list[_num]
    end
    def getLength()
        return @list.size
    end
    def createIterator()
        return Iterator.new(self) #イテレータの生成
    end
end

#==================================
# Iteratorクラス（≒駐輪場の管理人）
#==================================
class Iterator
def initialize(_bikePark)
        @bikePark = _bikePark
        @count = 0
    end
    def hasNext()
        return @bikePark.getLength() > @count
    end    
    def next()
        _nextBike = @bikePark.getBikeAt(@count)
        @count += 1
        return _nextBike
    end
end

#=======
# 実行
#=======
_bikePark = BikePark.new()
_bikePark.add(Bike.new("ESTRELLA", "神戸 け 12-63"))
_bikePark.add(Bike.new("SRV250S", "豊橋 う 19-43"))
_bikePark.add(Bike.new("GB250 CLUBMAN", "品川 け 13-66"))
_iterator = _bikePark.createIterator() #イテレータ（管理人）の生成
while _iterator.hasNext() do
    _nextBike = _iterator.next()
    puts(_nextBike.model, _nextBike.number)
end
```

実行環境：Ubuntu 16.04.2 LTS、Ruby 2.3.1  
作成者：vvestvillage  
作成日：2016年07月12日  
更新日：2017年05月13日


<a name="TemplateMethod"></a>
# <b><ruby>Template Method<rt>テンプレート メソッド</rt></ruby></b>

```
#test.rb

#======================================
# 抽象クラス（実際はふつうの基本クラス）
#======================================
class AbstractCard
    def templateMethod() #一連の連続した処理の枠組みを定義
        order1() #①共通の処理
        if ! isChild() then #児童（小学生以下）でなければ...
            order2() #②条件により実行する処理
        end
        order3() #③独自の処理（派生クラスでオーバーライド）
    end
    def isChild(); raise "派生クラスで実装して下さい"; end
    def order1(); puts("HAPPY NEW YEAR!"); end #①共通の処理
    def order2(); puts("勉強頑張ろう!!"); end #②条件により実行する処理
    def order3(); raise "派生クラスで実装して下さい"; end #③独自の処理
end

#=============
# 派生クラス①
#=============
class CardHanako < AbstractCard
    def isChild(); return true; end #オーバーライド
    def order3(); puts("テニスがんばろうね"); end #オーバーライド
end

#=============
# 派生クラス②
#=============
class CardIchiro < AbstractCard
    def isChild(); return false; end #オーバーライド
    def order3(); puts("テニス頑張ろう!!"); end #オーバーライド
end

#=======
# 実行
#=======
_cardHanako = CardHanako.new()
_cardHanako.templateMethod()
# HAPPY NEY YEAR!
# テニスがんばろうね

_cardIchiro = CardIchiro.new()
_cardIchiro.templateMethod()
# HAPPY NEY YEAR!
# 勉強頑張ろう!!
# テニス頑張ろう!!
```

実行環境：Ubuntu 16.04.2 LTS、Ruby 2.3.1  
作成者：vvestvillage  
作成日：2016年07月12日  
更新日：2017年05月13日


<a name="Strategy"></a>
# <b><ruby>Strategy<rt>ストラテジー</rt></ruby></b>

```
# test.rb

=begin
「アルゴリズムをごっそり切り替える」
State パターンに似ています
State パターンの場合は Context() とするところを Strategy パターンの場合は Context(Strategy()) とする
=end

#=============
# Jankenクラス
#=============
class Janken
    def initialize(_strategy) #コンストラクタ
        @strategy = _strategy
    end
    def exec()
        @strategy.execute()
    end
end

#================
# StrageyXXXクラス
#================
class IStrategy #擬似インターフェース（実際はふつうの基本クラス）
    def execute()
        raise "派生クラスで実装して下さい"
    end
end
class StrategyA < IStrategy
    def execute() #オーバーライド
        puts("グー、グー、パー")
    end
end
class StrategyB < IStrategy
    def execute() #オーバーライド
        puts("パー、グー、チョキ")
    end
end

#=======
# 実行
#=======
janken_ = Janken.new(StrategyA.new())
janken_.exec() #グー、グー、パー
janken_ = Janken.new(StrategyB.new()) #アルゴリズムをごっそり切り替える
janken_.exec() #パー、グー、チョキ
```

実行環境：Ubuntu 16.04.2 LTS、Ruby 2.3.1  
作成者：vvestvillage  
作成日：2016年07月12日  
更新日：2017年05月13日


<a name="Visitor"></a>
# <b><ruby>Visitor<rt>ビジター</rt></ruby></b>

```
#test.rb

#=======
# 訪問先
#=======
class IAcceptor #擬似インターフェース
    def accept(_visitor) #1行でも記述可能
        raise "派生クラスで実装して下さい"
    end
end

class Hokkaido < IAcceptor
    def initialize(); @otoshidama = 5000*2; end
    def accept(_visitor); _visitor.visit(@otoshidama); end
    #↑訪問者が誰でも同じ関数を実行!!
end

class Chiba < IAcceptor
    def initialize(); @otoshidama = 5000; end
    def accept(_visitor); _visitor.visit(@otoshidama); end
    #↑訪問者が誰でも同じ関数を実行!!
end

#=======
# 訪問者
#=======
class IVisitor #擬似インターフェース
    def visit(_otoshidama); raise "派生クラスで実装して下さい"; end
    def getMoney(); raise "派生クラスで実装して下さい"; end
end

class Ichiro < IVisitor
    def initialize(); @money = 0; end #コンストラクタ
    def visit(_otoshidama); @money += _otoshidama; end #オーバーライド
    def getMoney(); return @money; end
end

class Hanako < IVisitor
    def initialize(); @money = 0; end #コンストラクタ
    def visit(_otoshidama); @money += _otoshidama; end #オーバーライド
    def getMoney(); return @money; end
end

#=======
# 実行
#=======
#訪問先
_hokkaido = Hokkaido.new()
_chiba = Chiba.new()

#訪問者
_ichiro = Ichiro.new()
_hanako = Hanako.new()

#訪問する（訪問先側から見ると「受け入れる」）
_hokkaido.accept(_ichiro)
_hokkaido.accept(_hanako)
_chiba.accept(_ichiro)
_chiba.accept(_hanako)

#結果...
puts(_ichiro.getMoney()) #15000
puts(_hanako.getMoney()) #15000
```

実行環境：Ubuntu 16.04.2 LTS、Ruby 2.3.1  
作成者：vvestvillage  
作成日：2016年07月12日  
更新日：2017年05月13日


<a name="ChainofResponsibility"></a>
# <b><ruby>Chain of Responsibility<rt>チェーン オブ レスポンシビリティ</rt></ruby></b>

```
# test.rb

#=====================
# 各郵便局の抽象クラス
#=====================
class AbstractPO
    def setNext(_po) #共通の関数
        @nextPO = _po
        return @nextPO
    end
    def send(_address) #抽象関数（派生クラスでオーバーライド）
        raise "派生クラスで実装して下さい"
    end
end

#==============
# 新宿郵便局
#==============
class ShinjukuPO < AbstractPO
    def send(_address) #抽象メソッドをオーバーライド
        #文字列.include?("検索したい文字列")......見つからない場合false
        if _address.include?("新宿") then #住所に"新宿"が含まれていたら...
            puts("本日中に届きます")
        else
            @nextPO.send(_address) #たらいまわし先に振る ←ポイント
        end
    end
end

#============
# 東京郵便局
#============
class TokyoPO < AbstractPO
    def send(_address) #抽象メソッドをオーバーライド
        #文字列.include?("検索したい文字列")......見つからない場合false
        if _address.include?("東京") then #住所に"東京"が含まれていたら...
            puts("明後日中に届きます")
        else
            @nextPO.send(_address) #たらいまわし先に振る ←ポイント
        end
    end
end

#============
# 日本郵便局
#============
class JapanPO < AbstractPO
    def send(_address) #抽象メソッドをオーバーライド
        puts("一週間前後で届きます")
    end
end

#========
# 実行
#========
#郵便局の設置
_shinjukuPO = ShinjukuPO.new()
_tokyoPO = TokyoPO.new()
_japanPO = JapanPO.new()

#責任のたらいまわしのセット
_shinjukuPO.setNext(_tokyoPO).setNext(_japanPO)

#投函（今回は全て新宿郵便局に投函する）
_shinjukuPO.send("新宿区XX町X-X-X") #本日中に届きます
_shinjukuPO.send("東京都日野市XX町X-X-X") #明後日中に届きます
_shinjukuPO.send("千葉県市川市XX町X-X-X") #一週間前後で届きます
#新宿以外の郵便局へ投函する場合は更に複雑な処理をする必要があります...
#現状は新宿以外に投函しても一度（一瞬で）新宿郵便局を経由して配達されます
```

実行環境：Ubuntu 16.04.2 LTS、Ruby 2.3.1  
作成者：vvestvillage  
作成日：2016年07月12日  
更新日：2017年05月13日


<a name="Mediator"></a>
# <b><ruby>Mediator<rt>メディエイター</rt></ruby></b>

```
# test.rb

#==================================
# 相談役（専門性が高いため使い捨て）
#==================================
class Mediator
    def initialize() #コンストラクタ関数
        @memberList = [] #初期化
        #静的変数（クラス変数）の初期化
        @@MEMBER_A = MemberA.new()
        @@MEMBER_B = MemberB.new()
        @@MEMBER_C = MemberC.new()
        #メンバーの登録
        addMember(@@MEMBER_A)
        addMember(@@MEMBER_B)
        addMember(@@MEMBER_C)
    end

    #クラス変数（静的変数）のアクセサ
    def Mediator.MEMBER_A; @@MEMBER_A; end # @@MEMBER_Aのアクセサ
    def Mediator.MEMBER_B; @@MEMBER_B; end # @@MEMBER_Bのアクセサ
    def Mediator.MEMBER_C; @@MEMBER_C; end # @@MEMBER_Cのアクセサ

    def addMember(_member) #メンバーリストに登録
        @memberList.push(_member)
        _member.setMediator(self) #メンバーに相談役は自分であることを教える
    end

    #メンバーからの報告を受け支持を出す（特に専門性が高い関数）
    def houkoku(_member, _string)
        if (_member == @@MEMBER_A) then
            #「メンバーＡ」から「西へ行く」と報告があった場合の処理
            _member.advice("（Ａよ）了解、そのまま西へいけ") #Ａへ指示
            for theMember in @memberList do
                if (theMember == @@MEMBER_B) then
                    theMember.advice("（Ｂよ）東へ行け") #Ｂへ指示
                elsif (theMember == @@MEMBER_C) then
                    theMember.advice("（Ｃよ）その場で待機しろ") #Cへ指示
                end
            end
        end
        #以降、各メンバーからの報告内容に対する処理を記述
    end
end

#===================
# 登録するメンバー達
#===================
#---------------
# 擬似抽象クラス
#---------------
class AbstractMember
   #共通の機能
    def setMediator(_mediator)
        @mediator = _mediator #インスタンス変数に格納
    end

    #抽象関数の宣言（派生クラスでオーバーライド）
    def request(_string)
        raise "派生クラスで実装して下さい"
    end
    
    #抽象関数の宣言（派生クラスでオーバーライド）
    def advice(_string)
        raise "派生クラスで実装して下さい"
    end
end

#-----------
# メンバーＡ
#-----------
class MemberA < AbstractMember
    #抽象関数のオーバーライド
    def request(_string)
        #ここにメンバーＡ独自の処理など
        @mediator.houkoku(self, _string) #相談役に報告
    end

    #抽象関数のオーバーライド
    def advice(_string)
        puts("A: " + _string)
    end
end

#-----------
# メンバーＢ
#-----------
class MemberB < AbstractMember
    #抽象関数のオーバーライド
    def request(_string)
        #ここにメンバーＢ独自の処理など
        @mediator.houkoku(self, _string) #相談役に報告
    end

    #抽象関数のオーバーライド
    def advice(_string)
        puts("B: " + _string)
    end
end

#-----------
# メンバーＣ
#-----------
class MemberC < AbstractMember
    #抽象関数のオーバーライド
    def request(_string)
        #ここにメンバーＢ独自の処理など
        @mediator.houkoku(self, _string) #相談役に報告
    end

    #抽象関数のオーバーライド
    def advice(_string)
        puts("C: " + _string)
    end
end

#=======
# 実行
#=======
Mediator.new() #今回のサンプルではこのインスタンスは使用しません
Mediator.MEMBER_A.request("西へ行く") #静的変数（クラス変数）にアクセス
# A: （Ａよ）了解、そのまま西へいけ
# B: （Ｂよ）東へ行け
# C: （Ｃよ）その場で待機しろ
```

実行環境：Ubuntu 16.04.2 LTS、Ruby 2.3.1  
作成者：vvestvillage  
作成日：2016年07月12日  
更新日：2017年05月13日


<a name="Observer"></a>
# <b><ruby>Observer<rt>オブザーバ</rt></ruby></b>

```
#test.rb

#======================
# Subjec（観察される側）
#======================
class ISubject
    def addObserver(_observer); raise "派生クラスで実装して下さい"; end
    def removeObserver(_observer); raise "派生クラスで実装して下さい"; end
    def notify(); raise "派生クラスで実装して下さい"; end
end
class Apple < ISubject
    def initialize()
        @observerList = [] #リスナーリストの初期化
    end
    def addObserver(_observer) #リスナーの登録
        @observerList.push(_observer)
    end
    def removeObserver(_observer) #リスナーの削除
        @observerList.delete(_observer)
    end
    def notify() #全リスナーへの通知
        for theObserver in @observerList do
            theObserver.update(self)
        end
    end
    def getVersion()
        return "10.3.1"
    end
end

#==================
# Observer（観察者）
#==================
class IObserver
    #派生クラスでオーバーライドしないと実行時にErrorさせる
    def update(_apple); raise "派生クラスで実装して下さい"; end
end
class IPhone < IObserver #クラス名は必ず大文字で始めなければならない!!
    def update(_apple)
        puts("iPhoneは" + _apple.getVersion() + "にアップデート可能")
    end
end
class IPad < IObserver #クラス名は必ず大文字で始めなければならない!!
    def update(_apple)
        puts("iPadは" + _apple.getVersion() + "にアップデート可能")
    end
end

#=======
# 実行
#=======
#観察される（Subject）役
_apple = Apple.new()

#リスナー（Object）役
_iPhone = IPhone.new()
_iPad = IPad.new()

#リスナー（Object）役の登録
_apple.addObserver(_iPhone)
_apple.addObserver(_iPad)

#全リスナー（Object)への通知
_apple.notify()
#=> IPhoneは10.3.1にアップデート可能
#=> IPadは10.3.1にアップデート可能
```

実行環境：Ubuntu 16.04.2 LTS、Ruby 2.3.1  
作成者：vvestvillage  
作成日：2016年07月12日  
更新日：2017年05月13日


<a name="Memento"></a>
# <b><ruby>Memento<rt>メメント</rt></ruby></b>

```
#test.rb

#=========================
# 主人公役＋バックアップ係
#=========================
class Gamer
    #@pointのアクセサ（getter/setter）
    attr_accessor :point

    #コンストラクタ
    def initialize(_point=0)
        @point = _point
        @history = [] #履歴用配列（Array）
        #@count = 0
    end

    #状態を保存
    def save()
        _snapShot = SnapShot.new(@point)
        @history.push(_snapShot) #履歴に記録
        @count = @history.size - 1 #Undo/Redo用
        return _snapShot
    end

    #履歴
    def history()
        for theSnapShot in @history do
            puts theSnapShot.point
        end
    end

    #Undo（やり直し）
    def undo()
        if @count > 0 then
            @count -= 1
            return @history[@count]
        else
            puts("これ以上、Undoできません")
            @count = 0
            return @history[0]
        end
    end

    #Redo（再実行）
    def redo()
        if (@count < @history.size-1) then
            @count += 1
            return @history[@count]
        else
            puts("これ以上、Redoできません")
            @count = @history.size - 1
            return @history[@count]
        end
    end
end

#===================================================
# Memento役（その瞬間の状態をオブジェクト化）
#===================================================
class SnapShot
    #@pointのアクセサ（getter/setter）
    attr_accessor :point
    
    def initialize(_point)
        #↓今回はシンプルに１つだけにしておきます
        @point = _point
    end
end

#===================================================
# 実行
#===================================================
_gamer = Gamer.new(100)
_gamer.save() #最初の状態を保存

_gamer.point = 2000
_gamer.save() #この時点での状態を保存

_gamer.point = 8000
_gamer.save() #この時点での状態を保存

_gamer.history() #履歴を調べる
#=> 100
#=> 2000
#=> 8000

#Undo（やり直し）
_snapShot = _gamer.undo()
puts(_snapShot.point) #=> 2000

_snapShot = _gamer.undo()
puts(_snapShot.point) #=> 100

_snapShot = _gamer.undo()
puts(_snapShot.point) #=> これ以上、Undoできません => 100

#Redo（再実行）
_snapShot = _gamer.redo()
puts(_snapShot.point) #=> 2000

_snapShot = _gamer.redo()
puts(_snapShot.point) #=> 8000

_snapShot = _gamer.redo()
puts(_snapShot.point) #=> これ以上、Redoできません => 8000
```

実行環境：Ubuntu 16.04.2 LTS、Ruby 2.3.1  
作成者：vvestvillage  
作成日：2016年07月13日  
更新日：2017年05月13日


<a name="State"></a>
# <b><ruby>State<rt>ステート</rt></ruby></b>

```
# test.rb

#========================
# Context（状態を管理）役
#========================
class Janken
    #状態の設定   
    def setState(_state)
        #状態（State○）を格納（インスタンス変数）
        @state = _state
    end

    #状態の実行
    def exec()
        @state.execute() #State○.execute()を呼び出す
    end
end

#================
# State（状態）役
#================
#擬似インターフェース
class IState
    def execute()
        raise "派生クラスで実装して下さい"
    end
end

#状態Ａ
class StateA < IState
    def execute() #Janken.exec()から呼び出される
        puts("グー、グー、パー")
    end
end

#状態Ｂ
class StateB < IState
    def execute() #Janken.exec()から呼び出される
        puts("パー、グー、チョキ")
    end
end

#========
# 実行
#========
#Context（状態を管理）役
_janken = Janken.new()

#State（状態）役
_stateA = StateA.new()
_stateB = StateB.new()

#状態の設定＆実行
_janken.setState(_stateA)
_janken.exec() #グー、グー、パー

#状態の変更＆実行
_janken.setState(_stateB)
_janken.exec() #パー、グー、チョキ
```

実行環境：Ubuntu 16.04.2 LTS、Ruby 2.3.1  
作成者：vvestvillage  
作成日：2016年07月13日  
更新日：2017年05月13日


<a name="Command"></a>
# <b><ruby>Command<rt>コマンド</rt></ruby></b>

```
#test.rb

#============================================================
# グラフィックソフト
# バッチ処理（batch(_start, _end)を追加することも可能ですが省略
#============================================================
class Inkscape
    #コンストラクタ
    def initialize()
        #インスタンス変数の定義
        @canvas = Canvas.new() #Receiver（結果を表示する）役
        @history = [] #履歴（命令クラス）を保存（Batch処理等で利用したり...）
    end

    #命令の実行
    def draw(_command)
        #↓命令を実行する度にインスタンス生成!!
        _drawCommand = DrawCommand.new(@canvas, _command)
        _drawCommand.execute() #実行＝キャンバスの再描画
        @history.push(_drawCommand) #命令クラスを履歴に保存
    end
end

#===========
# 命令クラス
#===========
class DrawCommand
    #コンストラクタ
    def initialize(_canvas, _command)
        @canvas = _canvas  #Receiver（結果を表示する）役
        @command = _command
    end

    #↓Inkscape.draw()から呼び出される
    def execute()
        @canvas.update(@command)
    end
end

#=========================================
# 結果を表示する役＝Receiver（受信者）の役
#=========================================
class Canvas
    #コンストラクタ
    def initialize()
        @history = [] #履歴（実際の処理）を保存
    end

    #キャンバスの再描画
    def update(_command) #DrawCommand.execute()からの呼出し
        @history.push(_command)
        for theCommand in @history do
            puts(theCommand)
        end
        puts("\n")
    end
end

#=======
# 実行
#=======
#グラフィックソフトの起動
inkscape_ = Inkscape.new()

#命令の実行
inkscape_.draw("線を引く")
inkscape_.draw("縁取る")
inkscape_.draw("影を付ける")
```

実行環境：Ubuntu 16.04.2 LTS、Ruby 2.3.1  
作成者：vvestvillage  
作成日：2016年07月13日  
更新日：2017年05月13日


<a name="Interpreter"></a>
# <b><ruby>Interpreter<rt>インタプリタ</rt></ruby></b>

* 例文は ActionScript、SWF、AVM（ActionScript Virtual Machine）を自作ミニ言語と見立てています。
* 例文は「終端となる表現の役」を省略しています。

### 例文
```
#test.rb

#==============================
# ≒SWFファイルを生成するクラス
#==============================
class SWF
    def initialize(_code) #コンストラクタ
        #インスタンス変数の定義
        @codeList = _code.split(';') #命令を配列化（≒中間コード）
        @count = 0 #getNextCode()で使用
    end

    def getNextCode() #次の命令を返す
        @count += 1
        return @codeList[@count -1]
    end
    
    def isEnd() #次の命令があるか否か...
        return @count >= @codeList.size
    end
end

#===============================
# ≒ActionScript Virtual Machine
#===============================
class AVM
    def execute(_swf)
        _result = 0 #計算結果

        while (! _swf.isEnd()) do #次の命令があれば...
            _nextCode = _swf.getNextCode() #次の命令を調べる
            
            # ここからは特にサンプルの独自処理 .........
            _operator = _nextCode[0] #「+*/-=」の何れか
            if (_operator != "=")
                _str = _nextCode[1.._nextCode.size] #「+*/-」を除いた数字
                _int = _str.to_i
                if (_operator == "+") then
                    _result += _int
                elsif (_operator == "-") then
                    _result -= _int
                elsif (_operator == "*") then
                    _result *= _int
                elsif (_operator == "/") then
                    _result /= _int
                else
                    puts("Error: 演算子が異なります")
                end
            else
                #本来はここで「終端となる表現」のクラスを生成して処理しますが省略
                puts(_result)
            end
            #............................................
        end
    end
end

#======
# 実行
#======
_code = "+10;*50;/2;-4;=" #自作言語による記述（≒ActionScript）
_swf = SWF.new(_code) #≒SWFファイルに変換
_avm = AVM.new() #≒ActionScript Virtual Machine
_avm.execute(_swf) #≒SWFファイルをAVM上で実行
#246 ←(0+10)*50/2-4
```

実行環境：Ubuntu 16.04.2 LTS、Ruby 2.3.1  
作成者：vvestvillage  
作成日：2016年07月13日  
更新日：2017年05月13日