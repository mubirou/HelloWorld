|項目|備考|
|:--|:--|
|[たしざんをしよう。](#たしざんをしよう。)|出力、演算子、関数、高校数学|
|[ブラックボックスの作り方。](#ブラックボックスの作り方。)|関数、戻り値、引数|
|[もしも…](#もしも…)|if文|
|[にてひなるもの。](#にてひなるもの。)|数値、文字列、データ型|
|[みんなオブジェクト。](#みんなオブジェクト。)|属性、機能|
|[見えないオブジェクト。](#見えないオブジェクト。)|属性、機能|


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


<a name="見えないオブジェクト。"></a>

# ◆見えないオブジェクト。

### 見えない預金通帳オブジェクト。
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
    }

    useMoney(_money) {
        this._money -= _money;
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

© 2020-2021 夢寐郎