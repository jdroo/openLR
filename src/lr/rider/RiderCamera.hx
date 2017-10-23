package lr.rider;

import openfl.display.Sprite;
import openfl.geom.Point;
import openfl.Lib;

import global.Common;
import lr.rider.phys.frames.anchors.CPoint;

/**
 * ...
 * @author ...
 */
class RiderCamera 
{
	private var left_bound:Float = Common.stage_width * 0.38;
	private var right_bound:Float = Common.stage_width * 0.61;
	private var top_bound:Float = Common.stage_height * 0.38;
	private var bottom_bound:Float = Common.stage_height * 0.61;
	
	private var center_screen:Point;
	private var radius:Float;
	
	var debug:Sprite = new Sprite();
	
	public function new() 
	{
		Common.gCamera = this;
		
		Lib.current.stage.addChild(this.debug);
	}
	public function pan(dot:CPoint) {
		var _locPoint:Point = Common.gTrack.localToGlobal(new Point(dot.x, dot.y));
		var _locXPan:Float = 0;
		var _locYPan:Float = 0;
		/*
		if (_locPoint.x > this.right_bound) {
			_locXPan = this.right_bound - _locPoint.x;
		} else if (_locPoint.x < this.left_bound) {
			_locXPan = this.left_bound - _locPoint.x;
		}
		if (_locPoint.y > this.bottom_bound) {
			_locYPan = this.bottom_bound - _locPoint.y;
		} else if (_locPoint.y < this.top_bound) {
			_locYPan = this.top_bound - _locPoint.y;
		}
		*/
		
		this.center_screen = new Point(Lib.current.stage.stageWidth * 0.5, Lib.current.stage.stageHeight * 0.5);
		if (Lib.current.stage.stageHeight > Lib.current.stage.stageWidth) {
			this.radius = Lib.current.stage.stageWidth * 0.3;
		} else {
			this.radius = Lib.current.stage.stageHeight * 0.3;
		}
		var distance = Math.sqrt(Math.pow(_locPoint.x - this.center_screen.x, 2) + Math.pow(_locPoint.y - this.center_screen.y, 2));
		var theta = Common.get_angle_radians(this.center_screen, _locPoint);
		var mid_point:Point = new Point((radius * Math.cos(theta) + this.center_screen.x), (radius * Math.sin(theta)) + this.center_screen.y);
		var difference:Point = new Point(_locPoint.x - mid_point.x, _locPoint.y - mid_point.y);
		_locXPan = difference.x * -1;
		_locYPan = difference.y * -1;
		trace(theta, mid_point, difference);
		this.debug.graphics.clear();
		this.debug.graphics.lineStyle(2, 0xCC00CC, 1);
		this.debug.graphics.drawCircle(this.center_screen.x, this.center_screen.y, this.radius);
		this.debug.graphics.moveTo(this.center_screen.x, this.center_screen.y);
		this.debug.graphics.lineTo(mid_point.x, mid_point.y);
		this.debug.graphics.lineTo(_locPoint.x, _locPoint.y);
	
		if (distance < radius) {
			return;
		}
		Common.gTrack.x += _locXPan;
		Common.gTrack.y += _locYPan;
		Common.gTrack.check_visibility();
	}
	public function update_pan_bounds() {
		this.left_bound = Common.stage_width * 0.38;
		this.right_bound = Common.stage_width * 0.61;
		this.top_bound = Common.stage_height * 0.38;
		this.bottom_bound = Common.stage_height * 0.61;
	}
}