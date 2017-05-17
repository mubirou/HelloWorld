//SummerCardBuilder.as

package  {
    public class SummerCardBuilder implements IBuilder {
        public function SummerCardBuilder() {} //コンストラクタ
        public function makeHeader():void { console.log("暑中お見舞い申し上げます"); }
        public function makeContent():void { console.log("スイカのイラスト"); }
        public function makeFooter():void { console.log("盛夏"); }
    }
}

//========================================
// ブラウザのコンソール出力用（trace()の代替）
//========================================
class console {
    import flash.external.ExternalInterface; //JavaScriptの実行用
    public static function log(...args: Array): void {
        ExternalInterface.call("function(args){ console.log(args);}", args); //JavaScriptを実行
    }
}