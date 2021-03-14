### 📖なにかの草案...( ..)φ

👇プログラミング入門～オブジェクト指向の導入
|項目|備考|JavaScript|Python|Java|C#|C++|PHP|
|:--|:--|:--:|:--:|:--:|:--:|:--:|:--:|
|[たしざんをしよう](#たしざんをしよう)|出力、演算子、関数、数学Ｂ|〇|〇||||
|[ブラックボックスの作り方](#ブラックボックスの作り方)|関数、戻り値、引数|〇|〇|||||
|[もしも…](#もしも…)|if文|〇|〇|||||
|[繰り返し…](#繰り返し…)|for文|〇|〇|||||
|[にてひなるもの](#にてひなるもの)|数値、文字列、データ型|〇|〇|||||
|[みんなオブジェクト](#みんなオブジェクト)|属性、機能|―|―|―|―|―|―|
|[オブジェクト指向の実践](#オブジェクト指向の実践)|作例（預金口座を管理）|〇|〇|||||

👇より実践的なオブジェクト指向プログラミングのサンプル
|項目|備考|JavaScript|Python|Java|C#|C++|PHP|
|:--|:--|:--:|:--:|:--:|:--:|:--:|:--:|
|[偏差値](#偏差値)|偏差値を調べる|〇|〇|||||
|[カレンダー](#カレンダー)|指定年月のカレンダー表示、日付計算|〇|〇|||||
|[鬼ごっこ](#鬼ごっこ)|オブジェクト間の連携|〇||||||
|[読書記録](#読書記録)|継承|〇||||||
|[組み込みタイマー](#組み込みタイマー)|委譲、オブジェクトの中のオブジェクト|〇||||||

作成者：夢寐郎  
作成日：2020年12月04日  
更新日：2021年03月13日


<a name="たしざんをしよう"></a>

# ◆たしざんをしよう
* 算術演算子（+）
* 代入演算子（=）

## 1+2+3+4+5+6+7+8+9+10 = ?
（1から10までの自然数の和）

◆JavaScript編（詳細は[こちら](https://github.com/mubirou/HelloWorld/blob/master/languages/ECMAScript6/ECMAScript6_reference.md#%E6%BC%94%E7%AE%97%E5%AD%90)）

* window.alert()メソッド
* console.log()メソッド
* ;（セミコロン）

```
alert(1+2+3+4+5+6+7+8+9+10); //=> 55
```

```
console.log(1+2+3+4+5+6+7+8+9+10); //=> 55
```

```
x = 1+2+3+4+5+6+7+8+9+10;
console.log(x); //=> 55
```

◆Python編（詳細は[こちら](https://github.com/mubirou/HelloWorld/blob/master/languages/Python/Python_reference.md#%E6%BC%94%E7%AE%97%E5%AD%90)）

```
print(1+2+3+4+5+6+7+8+9+10) #=> 55
```

```
x = 1+2+3+4+5+6+7+8+9+10
print(x) #=> 55
```


## 1+2+3+4+5+6+7+8+9+10+...+100 = ?
* 算術演算子（/,*）
* 括弧
* 代入演算子（+=）

（1から100までの自然数の和）  
（初項1、交差1、項数100の等差数列の和）  
（処理速度：足し算 > 等差数列の和 >>>（数十倍）>>> for文）  
（可読性、汎用性 vs 処理速度）

◆JavaScript編

* 関数（function）と引数
* 変数宣言（let,var）
* return文
* for文

```
console.log(1/2*100*(100+1)); //=> 5050
```

```
console.log(1+2+3+4+5+6+7+8+9+10+11+12+13+14+15+16+17+18+19+20+21+22+23+24+25+26+27+28+29+30+31+32+33+34+35+36+37+38+39+40+41+42+43+44+45+46+47+48+49+50+51+52+53+54+55+56+57+58+59+60+61+62+63+64+65+66+67+68+69+70+71+72+73+74+75+76+77+78+79+80+81+82+83+84+85+86+87+88+89+90+91+92+93+94+95+96+97+98+99+100); //=> 5050
```

```
function blackbox(end) {
    let x = 0;
    for (let i = 1; i <= end; i++) {
        x += i;
    }
    return x;
}
console.log(blackbox(100)); //=> 5050
```

◆Python編

```
print(1/2*100*(100+1)) #=> 5050.0
```

```
print(1+2+3+4+5+6+7+8+9+10+11+12+13+14+15+16+17+18+19+20+21+22+23+24+25+26+27+28+29+30+31+32+33+34+35+36+37+38+39+40+41+42+43+44+45+46+47+48+49+50+51+52+53+54+55+56+57+58+59+60+61+62+63+64+65+66+67+68+69+70+71+72+73+74+75+76+77+78+79+80+81+82+83+84+85+86+87+88+89+90+91+92+93+94+95+96+97+98+99+100) #=> 5050
```

```
def blackbox(end):
    x = 0 #ローカル変数（関数内でのみ利用可）
    for i in range(1, end+1):
        x += i
    return x

print(blackbox(100)) #=> 5050
```

## 1+2+3+4+5+6+7+8+9+10+...+920918 = ?

◆JavaScript編

```
function blackbox(end) {
    let x = 0;
    for (let i = 1; i <= end; i++) {
        x += i;
    }
    return x;
}
console.log(blackbox(920918)); //=> 424045441821
```

```
function blackbox(end) {
    return 1/2*end*(end+1); //等差数列の和の公式より
}
console.log(blackbox(920918)); //=> 424045441821
```

◆Python編

```
def blackbox(end):
    x = 0
    for i in range(1, end+1):
        x += i
    return x

print(blackbox(920918)) #=> 424045441821
```

```
def blackbox(end):
    return 1/2*end*(end+1)

print(blackbox(920918)) #=> 424045441821.0

```

<a name="ブラックボックスの作り方"></a>

# ◆ブラックボックスの作り方

「処理した結果を後で利用」したい場合は、function内に「return文」を記述します。

◆JavaScript編

```
function blackbox() {
    console.log("Hello,world!");
}
blackbox(); //=> Hello,world!
```

```
function blackbox(name) {
    console.log(name + "さんこんにちは!");
}
blackbox("ICHIRO"); //=> ICHIROさんこんにちは!
```

```
function blackbox() {
    return Math.floor(Math.random() * 10);
}
x = blackbox();
console.log(x); //=> 0～9までの乱数
```

```
function blackbox(min, max) {
    return Math.floor(Math.random() * (max - min + 1)) + min;
}
x = blackbox(1, 100);
console.log(x); //=> 1～100までの乱数
```

◆Python編

```
def blackbox():
    print("Hello,world!")

blackbox() #=> Hello,world!
```

```
def blackbox(name):
    print(name + "さんこんにちは!")

blackbox("ICHIRO") #=> ICHIROさんこんにちは!
```

```
import math
import random

def blackbox():
    return math.floor(random.random() * 10)

x = blackbox()
print(x) #=> 0～9までの乱数
```

```
import math
import random

def blackbox(min, max):
    return math.floor(random.random() * (max - min + 1)) + min

x = blackbox(1, 100)
print(x) #=> 1～100までの乱数
```

<a name="もしも…"></a>

# ◆もしも…

◆JavaScript編（詳細は[こちら](https://github.com/mubirou/HelloWorld/blob/master/languages/ECMAScript6/ECMAScript6_reference.md#if%E6%96%87)）

```
if (new Date().getHours() >= 23) {
    console.log("早く寝ましょう");
}
```

```
function blackbox(num) {
    if (num < 60) {
        return true;
    } else {
        return false;
    }
}
console.log(blackbox(58)); //=> true
console.log(blackbox(60)); //=> false
```

```
function blackbox(num) {
    if (num < 60) {
        return "60未満";
    } else if (num < 65) {
        return "60以上65未満"
    } else {
        return "65以上";
    }
}
console.log(blackbox(58)); //=> 60未満
console.log(blackbox(60)); //=> 60以上65未満
console.log(blackbox(66)); //=> 65以上
```

◆Python編（詳細は[こちら](https://github.com/mubirou/HelloWorld/blob/master/languages/Python/Python_reference.md#if%E6%96%87)）

```
import datetime
if (datetime.datetime.now().hour >= 23):
    print("もう寝ましょう")
```

```
def blackbox(num):
    if (num < 60) : #()は省略可
        return True
    else:
        return False

print(blackbox(58)) #=> True
print(blackbox(60)) #=> False
```

```
def blackbox(num):
    if (num < 60) : #()は省略可
        return "60未満"
    elif (num < 65) : #「else if」でも「elseif」でもない（要注意）
        return "60以上65未満"
    else:
        return "65以上"

print(blackbox(58)) #=> 60未満
print(blackbox(60)) #=> 60以上65未満
print(blackbox(66)) #=> 65以上
```


<a name="繰り返し…"></a>

# 繰り返し…

◆JavaScript編

👇for文（詳細は[こちら](https://github.com/mubirou/HelloWorld/blob/master/languages/ECMAScript6/ECMAScript6_reference.md#for%E6%96%87)）
```
for (let i = 0; i < 10; i++) {
    console.log(i); //=> 0,1,2,...,9
}
```
++（インクリメント）については[こちら](https://github.com/mubirou/HelloWorld/blob/master/languages/ECMAScript6/ECMAScript6_reference.md#%E6%BC%94%E7%AE%97%E5%AD%90)

👇while文（詳細は[こちら](https://github.com/mubirou/HelloWorld/blob/master/languages/ECMAScript6/ECMAScript6_reference.md#while%E6%96%87)）
```
count = 0;
while (count < 10) { //間違えて「=」にすると無限ループ
    console.log(count); //=> 0,1,2,...,9
    count++;
}
```

◆Python編

👇for文（詳細は[こちら](https://github.com/mubirou/HelloWorld/blob/master/languages/Python/Python_reference.md#for%E6%96%87)）
```
for i in range(0,10): #第１引数を省略すると0扱い
    print(i) #=> 0,1,2,3,4,5,6,7,8,9
```

👇while文（詳細は[こちら](https://github.com/mubirou/HelloWorld/blob/master/languages/Python/Python_reference.md#while%E6%96%87)）
```
count = 0
while (count < 10): //()内が「True」だと無限ループ（=にするとError）
    print(count) #=> 0,1,2,3,4,5,6,7,8,9
    count += 1
```


<a name="にてひなるもの"></a>

# ◆にてひなるもの

## 1 + 1 = 11 ?

◆JavaScript編

```
console.log(1); //=> 1
console.log("1"); //=> 1
```

```
x = 1;
y = x + 1;
console.log(y); //=> 2
```

```
x = "1";
y = x + 1;
console.log(y); //=> 11
```

◆Python編

```
print(1) #=> 1
print("1") #=> 1
```

```
x = 1
y = x + 1
print(y) #=> 2
```

```
x = "1"
y = x + 1 #TypeError: can only concatenate str (not "int") to str
```


### 数値 + 文字列 = 文字列

◆JavaScript編

```
x = 100;
y = x + "点です";
console.log(y); //=> 100点です
```

```
x = 100;
y = "トータル" + x + "点です";
console.log(y); //=> トータル100点です
```

◆Python編

```
x = 100
y = str(x) + "点です"
print(y) #=> 100点です
```

```
x = 100
y = "トータル" + str(x) + "点です"
print(y) #=> トータル100点です
```

### データ型を調べる

◆JavaScript編

```
console.log(typeof 1); //=> number
console.log(typeof "1"); //=> string
```

```
console.log(1 == "1"); //=> true
console.log(1 === "1");  //=> false
```

◆Python編

```
print(type(1)) #=> <class 'int'>
print(type("1")) #=> <class 'str'>
```

```
print(1 == "1") #=> False（等号）
print(1 is "1") #=> False（厳密一致）
```


<a name="みんなオブジェクト"></a>

# ◆みんなオブジェクト

### 人間
* 属性（不変）：名前、性別、血液型、出身地…
* 属性（可変）：住所、職業、学歴、年収…
* 機能：話す、読む、書く、歌う、歩く、走る…

### 電卓
* 属性（不変）：モデル名、大きさ、質量…
* 機能：足す、引く、掛ける、割る…

### カメラ
* 属性（不変）：撮像素子、レンズマウント、大きさ、質量…
* 属性（可変）：絞り、シャッター速度、感度、記録画素数…
* 機能：シャッターを押す、ピントを合わせる、露出補正、レンズ交換…

### ドローン
* 機体
    * 属性：大きさ、重量、最大上昇速度、カメラ…
    * 機能：上昇、下降、ホバリング、水平飛行…
* 送信機
    * 属性：大きさ、重量、バッテリー容量…
    * 機能：上昇、下降、ホバリング、水平飛行…

### 図書館データベース
* 属性：管理番号、書籍名、著者名、ISBN…
* 機能：貸出、返却、補修…


<a name="オブジェクト指向の実践"></a>

# ◆オブジェクト指向の実践

ここから以下のような様々な知識が必要になります
* クラス（class）: 詳細は[こちら](https://github.com/mubirou/HelloWorld/blob/master/languages/ECMAScript6/ECMAScript6_reference.md#%E3%82%AF%E3%83%A9%E3%82%B9)）
* ゲッター･セッター（getter/setter）: 詳細は[こちら](https://github.com/mubirou/HelloWorld/blob/master/languages/ECMAScript6/ECMAScript6_reference.md#%E3%82%A2%E3%82%AF%E3%82%BB%E3%82%B5)）
* メソッド（method）: 詳細は[こちら](https://github.com/mubirou/HelloWorld/blob/master/languages/ECMAScript6/ECMAScript6_reference.md#%E3%83%A1%E3%82%BD%E3%83%83%E3%83%89)）
* 疑似プライベート変数（private variables）: 詳細は[こちら](https://github.com/mubirou/HelloWorld/blob/master/languages/ECMAScript6/ECMAScript6_reference.md#%E5%A4%89%E6%95%B0%E3%81%A8%E3%82%B9%E3%82%B3%E3%83%BC%E3%83%97)）

***

1. 作例として、〇〇さんの預金口座を開設します。
1. 開設する際、氏名（ローマ字）、生年月日、預入金額（0円でも可）を入力。
1. 開設されたかどうか以下を確認してみます。
    1. 氏名
    1. 生年月日
    1. 年齢
    1. 口座残高
1. 上記の口座に入金します（同時に口座残高を確認することも可能）
1. 口座残高を確認します。
1. 上記の口座から出金します（同時に口座残高を確認することも可能）
1. 口座残高を確認します。

上記の機能や属性を持った「見えないオブジェクト」を作成します。

◆JavaScript編

```
class Member {
    constructor(_name, _birthday, _money=0) { //"TARO YAMADA", "1958/05/05", 10000
        this._name = _name;
        this._birthday = _birthday;
        this._money = _money;
    }

    get name() {
        return this._name;
    }

    get birthday() {
        return this._birthday;
    }

    get age() {    
        var _y1 = Number(this._birthday.substr(0,4)); //"1958"→1958
        var _m1 = Number(this._birthday.substr(5,2)); //"05"→5
        var _d1 = Number(this._birthday.substr(8,2)); //"05"→5


        var _today = new Date();
        var _y2 = _today.getFullYear();
        var _m2 = _today.getMonth() + 1;
        var _d2 = _today.getDate();

        var _age = _y2 - _y1;

        if (_m2 < _m1) {
            _age -= 1;
        } else if (_m2 == _m1) {
            if (_d2 < _d1) {
                _age -= 1;
            }
        }
        
        return _age;
    }
    
    get money() {
        return this._money;
    }

    addMoney(_money) {
        this._money += _money;
        return this._money;
    }

    useMoney(_money) {
        this._money -= _money;
        return this._money;
    }
}

_0001 = new Member("TARO YAMADA", "1958/05/05", 10000);
console.log(_0001.name); //=> TARO YAMADA
console.log(_0001.birthday); //=> 1958/05/05
console.log(_0001.age); //=> 62
console.log(_0001.money); //=> 10000

_0001.addMoney(18000);
console.log(_0001.money); //=> 28000

_0001.useMoney(2856);
console.log(_0001.money); //=> 25144
```

◆Python編

ここから以下のような様々な知識が必要になります
* クラス（class）: 詳細は[こちら](https://github.com/mubirou/HelloWorld/blob/master/languages/Python/Python_reference.md#%E3%82%AF%E3%83%A9%E3%82%B90)）
* ゲッター･セッター（getter/setter）: 詳細は[こちら](https://github.com/mubirou/HelloWorld/blob/master/languages/Python/Python_reference.md#%E3%82%A2%E3%82%AF%E3%82%BB%E3%82%B5)）
* 関数≒メソッド（method）: 詳細は[こちら](https://github.com/mubirou/HelloWorld/blob/master/languages/Python/Python_reference.md#%E9%96%A2%E6%95%B0)）
* プライベート変数（private variables）: 詳細は[こちら](https://github.com/mubirou/HelloWorld/blob/master/languages/Python/Python_reference.md#%E5%A4%89%E6%95%B0%E3%81%A8%E3%82%B9%E3%82%B3%E3%83%BC%E3%83%97)）

***

```
import datetime

class Member:
    def __init__(self, _name, _birthday, _money=0):
        self.__name = _name
        self.__birthday = _birthday
        self.__money = _money
    
    @property
    def name(self):
        return self.__name

    @property
    def birthday(self):
        return self.__birthday

    @property
    def age(self):
        _y1 = int(self.__birthday[0:4]) #"1958"→1958
        _m1 = int(self.__birthday[5:7]) #"05"→5
        _d1 = int(self.__birthday[8:10]) #05"→5

        _today = datetime.date.today()
        _y2 = _today.year
        _m2 = _today.month
        _d2 = _today.day

        _age = _y2 - _y1

        if (_m2 < _m1):
            _age -= 1
        elif (_m2 == _m1):
            if (_d2 < _d1):
                _age -= 1

        return _age

    @property
    def money(self):
        return self.__money

    def addMoney(self, _money):
        self.__money += _money
        return self.__money
    
    def useMoney(self, _money):
        self.__money -= _money
        return self.__money


_0001 = Member("TARO YAMADA", "1958/05/05", 10000)
print(_0001.name) #=> TARO YAMADA
print(_0001.birthday) #=> 1958/05/05
print(_0001.age) #=> 62
print(_0001.money) #=> 10000

_0001.addMoney(18000)
print(_0001.money) #=> 28000

_0001.useMoney(2856)
print(_0001.money) #=> 25144
```


<a name="偏差値"></a>

# ◆偏差値

例）  
3人の点数が0点、50点、100点の場合…  
0点の偏差値は約37.8。  
100点の偏差値は約62.2。    

◆JavaScript編

new DeviationValue(): コンストラクタ  
DeviationValue.scores: 全員の点数  
DeviationValue.average: 期待値（平均値）  
DeviationValue.standardDeviation(): 標準偏差  
DeviationValue.exec(): 指定点数の偏差値  

```
class DeviationValue {
    constructor(..._scores) {
        if (_scores[0] instanceof Array) {
            this.__list = _scores[0]; //new DeviationValue([0,50,100]) 
        } else {
            this.__list = _scores; //new DeviationValue(0,50,100)
        }

        this.__total = 0;
        this.__average;
        this.__standardDeviation;
    
        for (let tmp in this.__list) {
            this.__total += this.__list[tmp];
        }

        this.__average = this.__total / this.__list.length;
    }

    get scores() {
        return this.__list.toString();
    }

    get average() {
        return this.__average;
    }

    standardDeviation() {
        var _sigma = 0;
        for (let _indexNum in this.__list) {
            var _difference = this.__list[_indexNum] - this.__average;
            _sigma += Math.pow(_difference,2);
        }
        this.__standardDeviation = Math.sqrt(_sigma / this.__list.length); //()内が分散
        return this.__standardDeviation;
    }

    exec(_score) {
        return (_score - this.__average)*10/this.__standardDeviation + 50;
    }
}

//25人が0点で1人だけ100点
/*
var _tmpList = [];
for (let i=1; i<=25; i++) {
    _tmpList.push(0);
}
_tmpList.push(100);
_deviation = new DeviationValue(_tmpList);
*/
_deviation = new DeviationValue(0,50,100);

console.log(_deviation.scores); //=> 55 0,50,100（全員の点数）
console.log(_deviation.average); //=> 50（期待値＝平均値）
console.log(_deviation.standardDeviation()); //=> 40.824829046386306（標準偏差）
console.log(_deviation.exec(100)); //=> 62.24744871391589（100点の偏差値）
console.log(_deviation.exec(0)); //=> 37.75255128608411（0点の偏差値）
```

◆Python版

```
import math

class DeviationValue:
    def __init__(self, *_scores):
        self.__list = _scores
        self.__total = 0
        self.__average = None
        self.__standardDeviation = None

        for _tmp in self.__list:
            self.__total += _tmp
        
        self.__average = self.__total / len(self.__list)

    @property
    def scores(self):
        return self.__list

    @property
    def average(self):
        return self.__average

    def standardDeviation(self):
        _sigma = 0
        for _tmp in self.__list:
            _difference = _tmp - self.__average
            _sigma += math.pow(_difference, 2)
        self.__standardDeviation = math.sqrt(_sigma / len(self.__list)) #()内が分散
        return self.__standardDeviation
    
    def exec(self, _score):
        return (_score - self.__average)*10/self.__standardDeviation + 50

_deviation = DeviationValue(0,50,100)

print(_deviation.scores) #=> (0, 50, 100)（全員の点数）
print(_deviation.average) #=> 50.0（期待値＝平均値）
print(_deviation.standardDeviation()) #=> 40.824829046386306（標準偏差）
print(_deviation.exec(100)) #=> 62.24744871391589（100点の偏差値）
print(_deviation.exec(0)) #=> 37.75255128608411（0点の偏差値）
```


<a name="カレンダー"></a>

# ◆カレンダー

◆JavaScript編

new Calendar(): コンストラクタ  
Calenar.showMonth(): 指定日のカレンダー表示  
Calenar.showDifferenceDate(): 指定日と指定日間の日数を返す  

```
class Calendar {
    constructor() {

    }

    //閏年調査
    __isUruu(_year) {
        if (_year % 400 == 0) {
            return true;
        } else if ((_year % 4 == 0) && (_year % 100 != 0)) {
            return true;
        }
        return false;
    }

    //各月の日数リスト（閏年対応）
    __monthDate(_year) {
        this.__monthDateList = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
        if (this.__isUruu(_year)) {
            this.__monthDateList[1]++;
        }
        return this.__monthDateList;
    }

    //カレンダー表示
    showMonth(_yearAndMonth = new Date().getFullYear() + "/" + (new Date().getMonth() + 1)) {
        var _year = Number(_yearAndMonth.substr(0, 4)); //"2021"→2021
        var _month = Number(_yearAndMonth.substr(5, 2)); //"01"→1            
        var _thisMonthDate = this.__monthDate(_year)[_month - 1]; //指定月の日数

        console.log(_yearAndMonth); //指定年月の表示
        console.log("SU MO TU WE TH FR SA"); //曜日の表示

        var _dates = "";

        //1日目の曜日分ずらす
        var _dateObj = new Date(_year, _month - 1, 1);
        var _startDay = _dateObj.getDay(); //指定月の1日の曜日
        for (let _i = 1; _i <= _startDay; _i++) {
            _dates = "   " + _dates;
        }

        //日にちの文字列（改行付）を作成
        for (let _j = 1; _j <= _thisMonthDate; _j++) {
            var _space = "";

            if (((_j + _startDay) % 7) == 0) {
                _space = "\n";
            } else {
                _space = " ";
            }

            if (_j < 10) {
                _j = " " + _j;
            }

            _dates += (_j + _space);
        }

        console.log(_dates);
    }

    //指定日と指定日間の日数を返す（明日と今日が指定日の場合1が返る）
    showDifferenceDate(_end, _start = new Date().getFullYear() + "/" + (new Date().getMonth() + 1) + "/" +  (new Date().getDate())) {
        //END
        var _endYear = Number(_end.substr(0, 4));
        var _endMonth = parseFloat(_end.substr(5, 2));

        var _count = 0;
        for (let i=0; i<_end.length; i++) {
            if (_end.substr(i,1) == "/") {
                _count ++;
                if (_count == 2) {
                    var _endDay = Number(_end.substr(i+1,2));
                }
            }
        }
        
        //START
        var _startYear = Number(_start.substr(0, 4));
        var _startMonth = parseFloat(_start.substr(5, 2));

        _count = 0;
        for (let i=0; i<_start.length; i++) {
            if (_start.substr(i,1) == "/") {
                _count ++;
                if (_count == 2) {
                    var _startDay = Number(_start.substr(i+1,2));
                }
            }
        }

        var _start = new Date(_startYear, _startMonth - 1, _startDay).getTime(); //1970年からの開始日までの時間（ミリ秒）
        var _end = new Date(_endYear, _endMonth - 1, _endDay).getTime();
        var _differenceMillisecond = _end - _start;

        var _differenceDays = _differenceMillisecond / (1000 * 60 * 60 * 24);
        _differenceDays = Math.ceil(_differenceDays);

        if (_differenceDays >= 0) {
            return _differenceDays;
        } else {
            return _differenceDays *= -1;
        }
    }
}

_calendar = new Calendar(); //カレンダーオブジェクトの生成
_calendar.showMonth("2021/4"); //指定年月のカレンダー表示
_calendar.showMonth(); //今月のカレンダー表示
console.log(_calendar.showDifferenceDate("2021/2/25")); //=> 今日までとの差
console.log(_calendar.showDifferenceDate("2021/02/25")); //=> 今日までとの差
console.log(_calendar.showDifferenceDate("2021/2/25", "2021/1/16")); //=> 40
```

◆Python編

```
import datetime
import re  # 正規表現

class Calendar:
    def __init__(self):
        pass

    # 閏年調査
    def __isUruu(self, _year):
        if (_year % 400 == 0):
            return True
        elif ((_year % 4 == 0) and (_year % 100 != 0)):
            return True
        return False

    # 各月の日数リスト（閏年対応）
    def __monthDate(self, _year):
        self.__monthDateList = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
        if (self.__isUruu(_year)):
            self.__monthDateList[1] += 1
        return self.__monthDateList

    # カレンダー表示
    def showMonth(self, _yearAndMonth=str(datetime.datetime.now().year) + "/" + str(datetime.datetime.now().month)):
        _year = int(_yearAndMonth[0:4])  # "2021"→2021
        _month = int(_yearAndMonth[5:7])  # "01"→1
        _thisMonthDate = self.__monthDate(_year)[_month - 1]  # 指定月の日数

        print(_yearAndMonth)  # 指定年月の表示
        print("SU MO TU WE TH FR SA")  # 曜日の表示

        _dates = ""

        # 1日目の曜日分ずらす
        _dateObj = datetime.datetime(_year, _month, 1)
        _startDay = _dateObj.weekday()  # 指定月の1日の曜日
        for _i in range(0, _startDay + 1):
            _dates = "   " + _dates

        # 日にちの文字列（改行付）を作成
        for _j in range(1, _thisMonthDate + 1):
            _space = ""

            if (((_j + _startDay + 1) % 7) == 0):
                _space = "\n"
            else:
                _space = " "

            if (_j < 10):
                _j = " " + str(_j)

            _dates += (str(_j) + _space)

        print(_dates)

    # 指定日と指定日間の日数を返す（明日と今日が指定日の場合1が返る）
    def showDifferenceDate(self, _end, _start=str(datetime.datetime.now().year) + "/" + str(datetime.datetime.now().month) + "/" + str(datetime.datetime.now().day)):
        # END
        _endYear = int(_end[0:4])
        _endMonth = int(re.sub("\\D", "", _end[5:7]))  # 正規表現（"02","2/"→2）
        _count = 0
        for _i in range(0, len(_end)):
            if (_end[_i:_i+1] == "/"):
                _count += 1
                if (_count == 2):
                    _endDay = int(_end[_i+1:_i+3])

        # START
        _startYear = int(_start[0:4])
        _startMonth = int(re.sub("\\D", "", _start[5:7]))  # 正規表現（"02","2/"→2）
        _count = 0
        for _i in range(0, len(_start)):
            if (_start[_i:_i+1] == "/"):
                _count += 1
                if (_count == 2):
                    _startDay = int(_start[_i+1:_i+3])

        _start = datetime.datetime(_startYear, _startMonth, _startDay)
        _end = datetime.datetime(_endYear, _endMonth, _endDay)
        _differenceDays = _end - _start
        return _differenceDays.days


_calendar = Calendar()
_calendar.showMonth("2002/8")  # 指定年月のカレンダー表示
_calendar.showMonth() # 今月のカレンダー表示
print(_calendar.showDifferenceDate("2021/2/25")) #=> 今日までとの差
print(_calendar.showDifferenceDate("2021/02/25"))  # => 今日までとの差
print(_calendar.showDifferenceDate("2021/2/25", "2021/1/16")) #=> 40
```


<a name="鬼ごっこ"></a>

# ◆鬼ごっこ

スマホ等の位置情報をもとにメンバーとの距離と方向を調べる。

◆JavaScript編

* Cocoyaクラス  
    * new Cocoya(): コンストラクタ  
    * Cocoya.addMember(): メンバーの登録  
    * Cocoya.showMembers(): 登録メンバーの情報の表示  
    * cocoya.check(): 各メンバー間の距離と方向を調べる

* Memberクラス  
    * new Member(): コンストラクタ  
    * Member.isDemon: 鬼か否か  
    * Member.setPosition(): 緯度･経度の設定  

```
//=================
//Cocoyaクラス
//=================
class Cocoya {
    constructor() {
        this.__members = new Array();
    }

    addMember(_member) {
        this.__members.push(_member);
    }

    showMembers() {
        this.__members.forEach(function (arg) {
            console.log(arg.name, arg.northPos, arg.eastPos, arg.isDemon);
        });
    }

    check() {
        //全員の位置情報と感染状況をチェックし〇km以内の場合に警報する
        var _r = 6371; //地球の半径（km）

        //1対1の全組み合わせのチェック
        for (let i = 0; i < this.__members.length; i++) {

            for (let j = i + 1; j < this.__members.length; j++) {
                //Aの北緯（緯度）と東経（経度）
                var _nPosA = this.__members[i].northPos;
                var _ePosA = this.__members[i].eastPos;

                //Bの北緯と東経
                var _nPosB = this.__members[j].northPos;
                var _ePosB = this.__members[j].eastPos;

                //TEST中
                var _direction = this.__geoDirection(_nPosA, _ePosA, _nPosB, _ePosB);

                //弧度法（ラジアン）へ変換
                _nPosA *= Math.PI / 180;
                _ePosA *= Math.PI / 180;
                _nPosB *= Math.PI / 180;
                _ePosB *= Math.PI / 180;

                //AとBとの距離（km）
                var _distance = _r * Math.acos(Math.cos(_nPosA) * Math.cos(_nPosB) * Math.cos(_ePosB - _ePosA) + Math.sin(_nPosA) * Math.sin(_nPosB));

                //DEBUG（オプション）
                _distance = Math.round(_distance * 100) / 100; // * 10; /// 100;
                console.log(this.__members[i].name + "⇒" + this.__members[j].name + ": " + _distance + "km" + " / " + _direction + "°");
            }
        }
    }

    //2点間の角度（北0° 東90° 南180° 西270°）を返す
    __geoDirection(_nPosA, _ePosA, _nPosB, _ePosB) { //Aの北緯, Aの東経, Bの北緯, Bの東経
        var Y = Math.cos(_ePosB * Math.PI / 180) * Math.sin(_nPosB * Math.PI / 180 - _nPosA * Math.PI / 180);
        var X = Math.cos(_ePosA * Math.PI / 180) * Math.sin(_ePosB * Math.PI / 180) - Math.sin(_ePosA * Math.PI / 180) * Math.cos(_ePosB * Math.PI / 180) * Math.cos(_nPosB * Math.PI / 180 - _nPosA * Math.PI / 180);
        var dirE0 = 180 * Math.atan2(Y, X) / Math.PI;
        if (dirE0 < 0) {
            dirE0 = dirE0 + 360;
        }
        var dirN0 = (dirE0 + 90) % 360;
        return Math.round(dirN0);
    }
}


//=================
// Memberクラス
//=================
class Member {
    constructor(_name) {
        this.__name = _name;
        this.__northPos; //北緯
        this.__eastPos; //東経
        this.__isDemon = false; //ウィルス感染状況
    }

    setPosition(_northPos, _eastPos) { //北緯（緯度）, 東経（経度）
        this.__northPos = _northPos;
        this.__eastPos = _eastPos;
    }

    set isDemon(arg) {
        this.__isDemon = arg;
    }

    get name() { return this.__name }
    get northPos() { return this.__northPos } //北緯（緯度）
    get eastPos() { return this.__eastPos } //東経（経度）
    get isDemon() { return this.__isDemon }
}


//メンバー
_member1 = new Member("A");
_member2 = new Member("B");
_member3 = new Member("C");

//登録
_cocoya = new Cocoya();
_cocoya.addMember(_member1);
_cocoya.addMember(_member2);
_cocoya.addMember(_member3);

//鬼
_member2.isDemon = true;

//位置のセット
//_member1.setPosition(35.69249397906168, 139.70106485400788);　//ALTA前
//_member1.setPosition(35.68472052734823, 139.70113392865585);　//鉄緑会本部前
//_member1.setPosition(35.70082425083744, 139.7706831191022);　//九州じゃんがら秋葉本店
_member1.setPosition(35.67411566475787, 139.7168733264519); //神宮球場ホームベース

//_member2.setPosition(35.69190209347951, 139.70275307933625);　//紀伊国屋書店本店前
//_member2.setPosition(35.6810697406674, 139.7112894578003);　//千駄ヶ谷駅改札
//_member2.setPosition(35.690088547140604, 139.72191559301672);　//我楽多屋
_member2.setPosition(35.67512700463573, 139.71734255456653); //神宮球場バックスクリーン

_member3.setPosition(35.69293465316442, 139.70194307270413); //沖縄そば･やんばる
//_member3.setPosition(35.7067699939533, 139.66641660292396); //フジヤカメラ本店
//_member3.setPosition(35.69270736096414, 139.6997132857424); //但馬屋珈琲本店

_cocoya.showMembers(); //メンバー情報の一覧
_cocoya.check(); //各メンバー間の距離と方向を調べる
```


<a name="読書記録"></a>

# ◆読書記録

◆JavaScript編

* Bookクラス（スーパークラス）
    * new Book(): コンストラクタ
    * Book.author: 著者名
    * Book.pageCount: 頁数
    * Book.publishedDate: 発行日
    * Book.publiser: 出版社
    * Book.title: 書籍名
    * Book.description: 説明

* MyBookクラス（サブクラス）
    * new MyBook(): コンストラクタ
    * MyBook.star: 星（評価）
    * MyBook.review: レビュー
    * MyBook.readingDate: 読了日

```
//=================
//Cocoyaクラス
//=================
class Book {
    constructor(_ISBN) {
        this.__isbn = _ISBN; //ISBN
        this.__authors; //著者名
        this.__pageCount; //頁数
        this.__publishedDate; //発行日
        this.__publisher; //出版社
        this.__title; //書籍名

        this.__search1(); //Google Books APIs
        this.__search2(); //OpenDB
        //他にも国立国会図書館のデータを利用する方法もあり（サーバ上で動かす必要あり）
    }

    __search1() { //Google Books APIs
        var _request = new XMLHttpRequest();
        var _url = "https://www.googleapis.com/books/v1/volumes?q=isbn:" + this.__isbn;
        _request.open("GET", _url);
        _request.send(null);
        _request.onload = () => {
            var _json = JSON.parse(_request.responseText);
            this.__author = _json.items[0].volumeInfo.authors[0]; //著者名
            this.__pageCount = _json.items[0].volumeInfo.pageCount; //頁数
            this.__publishedDate = _json.items[0].volumeInfo.publishedDate; //発行日
            this.__title = _json.items[0].volumeInfo.title; //書籍名
            this.__description = _json.items[0].volumeInfo.description; //説明
        }
    }

    __search2() { //OpenDB
        var _request = new XMLHttpRequest();
        var _url = "https://api.openbd.jp/v1/get?isbn=" + this.__isbn;
        _request.open("GET", _url);
        _request.send(null);
        _request.onload = () => {
            var _json = JSON.parse(_request.responseText);
            //this.__authors = _json[0].summary.author; //著者名
            //this.__publishedDate = _json[0].summary.pubdate; //発行日
            this.__publisher = _json[0].summary.publisher; //出版社
            //this.__title = _json[0].summary.title; //書籍名
        }
    }

    get author() { return this.__author } //著者名
    get pageCount() { return this.__pageCount } //頁数
    get publishedDate() { return this.__publishedDate } //発行日
    get publiser() { return this.__publisher } //出版社
    get title() { return this.__title } //書籍名
    get description() { return this.__description } //説明
}


//=================
// MyBookクラス
//=================
class MyBook extends Book {
    constructor(_ISBN) {
        super(_ISBN); //スーパークラスのコンストラクタを呼び出す
        this.__review; //レビュー
        this.__star; //星（評価）
        this.__readingDate; //読了日
    }

    set review(newValue) { this.__review = newValue }
    get review() { return this.__review }

    set star(newValue) { this.__star = newValue }
    get star() { return this.__star }

    set readingDate(newValue) { this.__readingDate = newValue }
    get readingDate() { return this.__readingDate }
}

//=================
// 実行
//=================
//var _book1 = new Book(9784480433008);
var _book1 = new MyBook(9784480433008);

//検索時間を稼ぐ（通常はボタンを押すなどで処理）
callbackFunction = () => {
    console.log(_book1.author); //→ 著者名
    console.log(_book1.pageCount); //→頁数
    console.log(_book1.publishedDate); //→ 発行日
    console.log(_book1.publiser); //→ 出版社（これのみOpenDBより）
    console.log(_book1.title); //→ 書籍名
    console.log(_book1.description); //→説明

    _book1.star = "★★★★★";
    _book1.review = "著者は東大医学部卒、東大名誉教授、解剖学が専門。とても面白い。";
    _book1.readingDate = "2019/07/08";

    console.log(_book1.star); //→星（評価）
    console.log(_book1.review); //→レビュー
    console.log(_book1.readingDate); //→読了日

    clearTimeout(_timerID);
}
_timerID = setTimeout(callbackFunction, 2000); //2秒後実行
```


<a name="組み込みタイマー"></a>

# ◆組み込みタイマー

◆JavaScript編

* Timerクラス
    * new Timer(): コンストラクタ
    * Timer.interval: 実行する間隔（秒）
    * Timer.timerMethod: 実行するメソッド名
    * Timer.start(): タイマーの開始
    * Timer.stop(): タイマーの終了

* Somethingクラス
    * コンストラクタ内に以下を記述
        ```
        this.__timer = new Timer(); //1秒毎に実行したい場合
        //this.__timer = new Timer(2, false); //2秒後に1度だけ実行したい場合
        ```
    * クラス内に以下をコピー
        ```
        set interval(newValue) { return this.__timer.interval = newValue }
        get interval() { return this.__timer.interval }
        timerStart() { this.__timer.start() }
        timerStop() { this.__timer.stop() }
        set timerMethod(newValue) { this.__timer.timerMethod = newValue }
        ```
    * Something.hoge(): 繰り返し（もしくは1度）実行したいメソッド
    * Something.timerMethod: 実行するメソッド名
    * Something.interval: 実行する間隔（ミリ秒）
    * Something.timerStart(): タイマーの開始
    * Something.timerStop(): タイマーの終了

```
//=================
// Timerクラス
//=================
class Timer {
    constructor(_sec = 1, _loop = true) {
        this.__interval = _sec * 1000; //秒をミリ秒に変換
        this.__loop = _loop; //繰り返し実行するか否か
        this.__timerMethod; //callbackFunctionで実行されるメソッド
    }

    set interval(newValue) { this.__interval = newValue }
    get interval() { return this.__interval }

    set timerMethod(newValue) { this.__timerMethod = newValue }

    start() {
        if (this.__loop) {
            this.__timerID = setInterval(this.__callbackFunction, this.__interval);
        } else {
            this.__timerID = setTimeout(this.__callbackFunction, this.__interval);
        }
    }

    stop() {
        if (this.__loop) {
            clearInterval(this.__timerID);
        } else {
            clearTimeout(this.__timerID);
        }
    }

    __callbackFunction = () => {
        //console.log("Timer.__callbackFunction");
        if (this.__loop) {
            this.__timerMethod();
        } else {
            this.__timerMethod();
            clearTimeout(this.__timerID);
        }
        
    }
}


//=================
// Somethingクラス
//=================
class Something {
    constructor() {
        //タイマーの組み込み
        this.__timer = new Timer(); //1秒毎に実行したい場合
        //this.__timer = new Timer(2, false); //2秒後に1度だけ実行したい場合
    }

    hoge() {
        console.log("something.hoge");
    }

    //以下をタイマーを組み込みたいクラスにコピー
    set interval(newValue) { return this.__timer.interval = newValue }
    get interval() { return this.__timer.interval }
    timerStart() { this.__timer.start() }
    timerStop() { this.__timer.stop() }
    set timerMethod(newValue) { this.__timer.timerMethod = newValue }
}

//=================
// 実行
//=================
var _object1 = new Something();
_object1.timerMethod = _object1.hoge;
//console.log(_object1.interval);
//_object1.interval = 500;
//console.log(_object1.interval);
_object1.timerStart();
//_object1.timerStop();
```

© 2020-2021 夢寐郎