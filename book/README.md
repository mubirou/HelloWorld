|項目|備考|
|:--|:--|
|[たしざんをしよう。](#たしざんをしよう。)|出力、演算子、関数、高校数学|
|[ブラックボックスの作り方。](#ブラックボックスの作り方。)|関数、戻り値、引数|
|[もしも…](#もしも…)|if文|
|[にてひなるもの。](#にてひなるもの。)|数値、文字列、データ型|
|[みんなオブジェクト。](#みんなオブジェクト。)|属性、機能|
|[「預金口座」オブジェクト](#「預金口座」オブジェクト)|預金口座を管理するオブジェクト|
|[「偏差値」オブジェクト](#「偏差値」オブジェクト)|偏差値を調べることができるオブジェクト|
|[「カレンダー」オブジェクト](#「カレンダー」オブジェクト)|指定年月のカレンダー表示や日付計算が可能|



<a name="たしざんをしよう。"></a>

# ◆たしざんをしよう。

## 1+2+3+4+5+6+7+8+9+10 = ?
（1から10までの自然数の和）

```
<script>
    alert(1+2+3+4+5+6+7+8+9+10); //=> 55
</script>
```

```
<script>
    console.log(1+2+3+4+5+6+7+8+9+10); //=> 55
</script>
```

```
<script>
    x = 1+2+3+4+5+6+7+8+9+10;
    console.log(x); //=> 55
</script>
```

## 1+2+3+4+5+6+7+8+9+10+...+100 = ?
（1から100までの自然数の和）  
（初項1、交差1、項数100の等差数列の和）  
（処理速度：足し算 > 等差数列の和 >>>（数十倍）>>> for文）  
（可読性、汎用性 vs 処理速度）

```
<script>
    console.log(1/2*100*(100+1)); //=> 5050
</script>
```

```
<script>
    console.log(1+2+3+4+5+6+7+8+9+10+11+12+13+14+15+16+17+18+19+20+21+22+23+24+25+26+27+28+29+30+31+32+33+34+35+36+37+38+39+40+41+42+43+44+45+46+47+48+49+50+51+52+53+54+55+56+57+58+59+60+61+62+63+64+65+66+67+68+69+70+71+72+73+74+75+76+77+78+79+80+81+82+83+84+85+86+87+88+89+90+91+92+93+94+95+96+97+98+99+100); //=> 5050
</script>
```

```
<script>
    function blackbox(end) {
        var x = 0;
        for (var i = 1; i <= end; i++) {
            x += i;
        }
        return x;
    }
    console.log(blackbox(100)); //=> 5050
</script>
```

## 1+2+3+4+5+6+7+8+9+10+...+920918 = ?
```
<script>
    function blackbox(end) {
        var x = 0;
        for (var i = 1; i <= end; i++) {
            x += i;
        }
        return x;
    }
    console.log(blackbox(920918)); //=> 424045441821
</script>
```

```
<script>
    function blackbox(end) {
        return 1/2*end*(end+1); //等差数列の和の公式より
    }
    console.log(blackbox(920918)); //=> 424045441821
</script>
```

<a name="ブラックボックスの作り方。"></a>

# ◆ブラックボックスの作り方。
```
<script>
    function blackbox() {
        console.log("Hello,world!");
    }
    blackbox(); //=> Hello,world!
</script>
```

```
<script>
    function blackbox(name) {
        console.log(name + "さんこんにちは!");
    }
    blackbox("ICHIRO"); //=> ICHIROさんこんにちは!
</script>
```

```
<script>
    function blackbox() {
        return Math.floor(Math.random() * 10);
    }
    x = blackbox();
    console.log(x); //=> 0～9までの乱数
</script>
```

```
<script>
    function blackbox(min, max) {
        return Math.floor(Math.random() * (max - min + 1)) + min;
    }
    x = blackbox(1, 100);
    console.log(x); //=> 1～100までの乱数
</script>
```


<a name="もしも…"></a>

# ◆もしも…
```
<script>
    function blackbox(num) {
        if (num < 60) {
            return true;
        } else {
            return false;
        }
    }
    console.log(blackbox(58)); //=> true
    console.log(blackbox(60)); //=> false
</script>
```

```
<script>
    function blackbox(num) {
        if (num < 60) {
            return "60未満";
        } else if (num < 65) {
            return "60以上65未満"
        } else {
            return "65以上";
        }
    }
    console.log(blackbox(58)); //=> "60未満"
    console.log(blackbox(60)); //=> "60以上65未満"
    console.log(blackbox(66)); //=> "65以上"
</script>
```

```
```


<a name="にてひなるもの。"></a>

# ◆にてひなるもの。

## 1 + 1 = 11 ?
```
<script>
    console.log(1); //=> 1
    console.log("1"); //=> 1
</script>
```

```
<script>
    x = 1;
    y = x + 1;
    console.log(y); //=> 2
</script>
```

```
<script>
    x = "1";
    y = x + 1;
    console.log(y); //=> 11
</script>
```

### 数値 + 文字列 = 文字列
```
<script>
    x = "100";
    y = x + "点です";
    console.log(y); //=> 100点です
</script>
```

```
<script>
    x = "100";
    y = "トータル" + x + "点です";
    console.log(y); //=> トータル100点です
</script>
```

### データ型を調べる
```
<script>
    console.log(typeof 1); //=> number
    console.log(typeof "1"); //=> string
</script>
```

```
<script>
    console.log(1 == "1"); //=> true
    console.log(1 === "1");  //=> false
</script>
```


<a name="みんなオブジェクト。"></a>

# ◆みんなオブジェクト。

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


<a name="「預金口座」オブジェクト"></a>

# ◆「預金口座」オブジェクト

1. 〇〇さんの預金口座を開設します。
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

```
<script>

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
        var _year = this._birthday.substr(0,4); //"1958"
        var _month = this._birthday.substr(5,2); //"05"
        var _date = this._birthday.substr(8,2); //"05"
        var _birthDate = new Date(_year, _month-1, _date);
        var _y2 = _birthDate.getFullYear().toString().padStart(4, '0');
        var _m2 = (_birthDate.getMonth() + 1).toString().padStart(2, '0');
        var _d2 = _birthDate.getDate().toString().padStart(2, '0');
        var _today = new Date();
        var _y1 = _today.getFullYear().toString().padStart(4, '0');
        var _m1 = (_today.getMonth() + 1).toString().padStart(2, '0');
        var _d1 = _today.getDate().toString().padStart(2, '0');
        var _age = Math.floor((Number(_y1 + _m1 + _d1) - Number(_y2 + _m2 + _d2)) / 10000);
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
console.log(_0001.name);
console.log(_0001.birthday);
console.log(_0001.age);
console.log(_0001.money);

_0001.addMoney(18000);
console.log(_0001.money);

_0001.useMoney(2856);
console.log(_0001.money);

</script>
```


<a name="「偏差値」オブジェクト"></a>

# ◆「偏差値」オブジェクト

3人の点数が0点、50点、100点の場合…
0点の偏差値は約37.8。
100点の偏差値は約62.2。

```
<script>
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
    
    console.log(_deviation.scores); //全員の点数
    console.log(_deviation.average); //期待値（平均値）
    console.log(_deviation.standardDeviation()); //標準偏差
    console.log(_deviation.exec(100)); //100点の偏差値
    console.log(_deviation.exec(0)); //0点の偏差値
</script>
```

<a name="「カレンダー」オブジェクト"></a>

# ◆「カレンダー」オブジェクト

XXXXXX

```
<script>
    class Calendar {
        constructor() {

        }

        //閏年調査
        isUruu(_year) {
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
            if (this.isUruu(_year)) {
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
    _calendar.showMonth("2021/9"); //指定年月のカレンダー表示
    _calendar.showMonth(); //指定年月のカレンダー表示
    console.log(_calendar.showDifferenceDate("2021/2/25")); //=> 37
    console.log(_calendar.showDifferenceDate("2021/02/25")); //=> 37
    console.log(_calendar.showDifferenceDate("2021/2/25", "2021/1/16")); //=> 40
</script>
```


© 2020-2021 夢寐郎