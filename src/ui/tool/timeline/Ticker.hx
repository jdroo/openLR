package ui.tool.timeline;

import haxe.ds.Vector;
import openfl.display.Sprite;
import openfl.text.TextField;

import global.Common;
import global.SVar;

/**
 * ...
 * @author Kaelan Evans
 * 
 * permits frame by frame scrubbing on the fly
 */
class Ticker extends Sprite
{
	var tickArray:Vector<Tick>;
	var timeStamp:TextField;
	public function new() 
	{
		super();
		
		this.tickArray = new Vector(320);
		for (i in 0...320) {
			this.tickArray[i] = new Tick(i);
			this.addChild(this.tickArray[i]);
			this.tickArray[i].x = i * 4;
		}
	}
	public function update() {
		for (i in 0...320) {
			this.tickArray[i].update(SVar.frames + i);
		}
	}
}