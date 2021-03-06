package lr.scene;

import openfl.Lib;
import openfl.Assets;
import openfl.display.GraphicsStroke;
import openfl.display.MovieClip;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;

import global.Common;
import global.CVar;
import global.SVar;

/**
 * ...
 * @author Kaelan Evans
 * 
 * This class controls the text seen on the top right. When sim mode is added, it'll display time. Might switch it to use the color indicators instead of "Floor, Accel, Scene"
 * 
 */
class TextInfo extends MovieClip
{
	var font:TextFormat = new TextFormat(Assets.getFont("fonts/Verdana.ttf").fontName, 12, 0, null, null, null, null, null, TextFormatAlign.RIGHT);
	public var textInfo_A:TextField;
	public var textInfo_B:TextField;
	public var textInfo_C:TextField;
	public var textInfo_D:TextField;
	public var textInfo_E:TextField;
	public var textInfo_F:TextField;
	public var mode:Int = 0; //0 = lines, 1 = playback
	public function new() 
	{
		super();
		Common.gTextInfo = this;
		textInfo_A = new TextField();
		textInfo_B = new TextField();
		textInfo_C = new TextField();
		textInfo_D = new TextField();
		textInfo_E = new TextField();
		textInfo_F = new TextField();
		textInfo_A.selectable = false;
		textInfo_B.selectable = false;
		textInfo_C.selectable = false;
		textInfo_D.selectable = false;
		textInfo_E.selectable = false;
		textInfo_F.selectable = false;
		textInfo_A.setTextFormat(this.font);
		textInfo_B.setTextFormat(this.font);
		textInfo_C.setTextFormat(this.font);
		textInfo_D.setTextFormat(this.font);
		textInfo_E.setTextFormat(this.font);
		textInfo_F.setTextFormat(this.font);
		
		this.addChild(this.textInfo_A);
		this.addChild(this.textInfo_B);
		this.addChild(this.textInfo_C);
		this.addChild(this.textInfo_D);
		this.addChild(this.textInfo_E);
		this.addChild(this.textInfo_F);
		
		this.textInfo_B.y = 15;
		this.textInfo_C.y = 30;
		this.textInfo_D.y = 45;
		this.textInfo_E.y = 60;
		this.textInfo_F.y = 75;
		
		this.update();
	}
	public function update() {
		if (mode == 0)
		{
			textInfo_A.text = SVar.lineCount + " Lines";
			textInfo_B.text = SVar.blueLineCount + " Floor";
			textInfo_C.text = SVar.redLineCount + " Accel";
			textInfo_D.text = SVar.greenLineCount + " Scene";
		}
	}
	public function update_textInfo_E()
	{
		if (SVar.frame_rate > 60) {
			textInfo_E.text = "+60 FPS";
		} else {
			textInfo_E.text = SVar.frame_rate + " FPS";
		}
	}
	public function update_sim() {
		var _locTime:String = Common.time(SVar.frames);
		
		textInfo_A.text = CVar.track_name;
		textInfo_B.text = _locTime;
		textInfo_C.text = SVar.rider_speed + " PPF";
		textInfo_D.text = SVar.rider_speed_top + " Top";
	}
}