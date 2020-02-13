package;

import openfl.display.Sprite;
import openfl.text.Font;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.events.Event;

// 赤い円が右斜め下方に移動しながらフェードアウト
// テキストが画面上方で右に移動しながらフェードアウト
// そんな感じ。

class Main extends Sprite
{
  private var _text:TextField;
  private var _circle:Sprite;

  public function new()
  {
    super();

    _text = new TextField();
		// テキストのフォントの種類、サイズ、字の色を指定しているっぽい
    _text.defaultTextFormat = new TextFormat ("Katamotz Ikasi", 30, 0x202020);
		// おそらく初期位置
    _text.x = 50;
    _text.y = 50;
    _text.width = 350; // 短くすると文字列が切れるので多分文字の表示範囲の横幅
    _text.text = "Hello, Haxe and OpenFL!";
    addChild (_text);

    // class Graphicsのところに詳しく書いてある。
    _circle = new Sprite();
    _circle.graphics.beginFill(0xff0000); // 色は赤で塗りつぶす感じ
    _circle.graphics.drawCircle(0, 0, 50); // (0, 0)中心で半径50かな・・
    _circle.graphics.drawCircle(100, 100, 20); // ?? この円も動くみたいね。
    _circle.graphics.endFill();
		// 中心の初期位置
    _circle.x = 100;
    _circle.y = 100;
    addChild (_circle);

    this.addEventListener(Event.ENTER_FRAME, loop); // ここが謎。
  }

  private function loop(e:Event)
  {
    _text.x += 1; // ここで右移動を表現していて・・

    _circle.x += 2; // 右斜め下に移動はここ？
    _circle.y += 1;
  }
}
