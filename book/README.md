# たしざんをしよう。

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


# にてひなるもの。

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


# みんなオブジェクト。


© 2020 夢寐郎