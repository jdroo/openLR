package ui.tool;

import openfl.Lib;
import openfl.events.Event;
import openfl.events.MouseEvent;
import openfl.geom.Point;
import openfl.events.KeyboardEvent;
import openfl.ui.Keyboard;
import openfl.text.TextField;

import global.KeyBindings;
import global.Common;
import global.CVar;
import global.SVar;

/**
 * ...
 * @author Kaelan Evans
 * 
 * Base functions for anything mouse related, specifically pertaining to click and drag behavior
 * 
 */
class ToolBase
{

	public var mod_shift:Bool = false;
	public var mod_x:Bool = false;
	public var mod_z:Bool = false;
	public var mod_ctrl:Bool = false;

	public function new(_type:String = "init") 
	{
		if (SVar.current_tool == _type) {
			return;
		} else {
			this.destroy();
		}
		SVar.current_tool = _type;
		Common.gToolBase = this;
	}
	public function set_listeners() {
		Lib.current.stage.addEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
		Lib.current.stage.addEventListener(MouseEvent.MOUSE_UP, mouseUp);
		Lib.current.stage.addEventListener(MouseEvent.MOUSE_MOVE, mouseMove);
		Lib.current.stage.addEventListener(MouseEvent.RIGHT_MOUSE_DOWN, rMouseDown);
		Lib.current.stage.addEventListener(MouseEvent.RIGHT_MOUSE_UP, rMouseUp);
		Lib.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, keyShiftDown);
		Lib.current.stage.addEventListener(KeyboardEvent.KEY_UP, keyShiftUp);
		Lib.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, KeyNumDown);
		Lib.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, KeyModifierDown);
		Lib.current.stage.addEventListener(KeyboardEvent.KEY_UP, KeyModifierUp);
	}
	private function KeyModifierDown(e:KeyboardEvent):Void 
	{
		if (e.keyCode == KeyBindings.angle_snap) {
			mod_x = true;
		}
		if (e.keyCode == Keyboard.Z) {
			this.mod_z = true;
		}
		if (e.keyCode == Keyboard.CONTROL) {
			this.mod_ctrl = true;
		}
	}
	private function KeyModifierUp(e:KeyboardEvent):Void 
	{
		if (e.keyCode == KeyBindings.angle_snap) {
			mod_x = false;
			if (e.shiftKey) {
				if (CVar.angle_snap) {
					CVar.angle_snap = false;
				} else if (!CVar.angle_snap) {
					CVar.angle_snap = true;
				}
			}
		}
		if (e.keyCode == Keyboard.Z) {
			this.mod_z = false;
		}
		if (e.keyCode == Keyboard.CONTROL) {
			this.mod_ctrl = false;
		}
	}
	
	private function KeyNumDown(e:KeyboardEvent):Void //Line type switcher
	{
		if (e.keyCode == KeyBindings.swatch_blue) {
			Common.line_type = 0;
		}
		if (e.keyCode == KeyBindings.swatch_red) {
			Common.line_type = 1;
		}
		if (e.keyCode == KeyBindings.swatch_green) {
			Common.line_type = 2;
		}
	}
	
	private function keyShiftUp(e:KeyboardEvent):Void //Shift modifier
	{
		if (e.keyCode == KeyBindings.mod_action_shift) {
			this.mod_shift = false;
		}
	}
	
	private function keyShiftDown(e:KeyboardEvent):Void 
	{
		if (e.keyCode == KeyBindings.mod_action_shift) {
			this.mod_shift = true;
		}
	}
	public function rMouseUp(e:MouseEvent):Void 
	{
		trace(Lib.current.stage.mouseX, Lib.current.stage.mouseY); //default behavior for any mouse tool that hasn't had an action assigned
	}
	
	public function rMouseDown(e:MouseEvent):Void 
	{
		trace(Lib.current.stage.mouseX, Lib.current.stage.mouseY);
	}
	
	public function mouseUp(e:MouseEvent):Void 
	{
		Common.gToolbar.enable_keys();
	}
	
	public function mouseDown(e:MouseEvent):Void 
	{
		Common.gToolbar.disable_keys();
	}
	private function mouseMove(e:MouseEvent):Void 
	{
		
	}
	public function disable() {
		Lib.current.stage.removeEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
		Lib.current.stage.removeEventListener(MouseEvent.MOUSE_UP, mouseUp);
		Lib.current.stage.removeEventListener(MouseEvent.MOUSE_MOVE, mouseMove);
		Lib.current.stage.removeEventListener(MouseEvent.RIGHT_MOUSE_DOWN, rMouseDown);
		Lib.current.stage.removeEventListener(MouseEvent.RIGHT_MOUSE_UP, rMouseUp);
		Lib.current.stage.removeEventListener(KeyboardEvent.KEY_DOWN, keyShiftDown);
		Lib.current.stage.removeEventListener(KeyboardEvent.KEY_UP, keyShiftUp);
		Lib.current.stage.removeEventListener(KeyboardEvent.KEY_DOWN, KeyModifierDown);
		Lib.current.stage.removeEventListener(KeyboardEvent.KEY_UP, KeyModifierUp);
	}
	public function destroy() {
		Lib.current.stage.removeEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
		Lib.current.stage.removeEventListener(MouseEvent.MOUSE_UP, mouseUp);
		Lib.current.stage.removeEventListener(MouseEvent.MOUSE_MOVE, mouseMove);
		Lib.current.stage.removeEventListener(MouseEvent.RIGHT_MOUSE_DOWN, rMouseDown);
		Lib.current.stage.removeEventListener(MouseEvent.RIGHT_MOUSE_UP, rMouseUp);
		Lib.current.stage.removeEventListener(KeyboardEvent.KEY_DOWN, keyShiftDown);
		Lib.current.stage.removeEventListener(KeyboardEvent.KEY_UP, keyShiftUp);
		Lib.current.stage.removeEventListener(KeyboardEvent.KEY_DOWN, KeyModifierDown);
		Lib.current.stage.removeEventListener(KeyboardEvent.KEY_UP, KeyModifierUp);
	}
	public function enable() {
		if (SVar.game_mode == GameState.edit || SVar.game_mode == GameState.livedraw) {
			Lib.current.stage.addEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
			Lib.current.stage.addEventListener(MouseEvent.MOUSE_UP, mouseUp);
			Lib.current.stage.addEventListener(MouseEvent.MOUSE_MOVE, mouseMove);
			Lib.current.stage.addEventListener(MouseEvent.RIGHT_MOUSE_DOWN, rMouseDown);
			Lib.current.stage.addEventListener(MouseEvent.RIGHT_MOUSE_UP, rMouseUp);
			Lib.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, keyShiftDown);
			Lib.current.stage.addEventListener(KeyboardEvent.KEY_UP, keyShiftUp);
			Lib.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, KeyModifierDown);
			Lib.current.stage.addEventListener(KeyboardEvent.KEY_UP, KeyModifierUp);
		}
	}
	public function angle_snap(_x1:Float, _y1:Float, _x2:Float, _y2:Float):Array<Float> {
		var angle = Common.get_angle_degrees(new Point(_x1, _y1), new Point(_x2, _y2));
		var angles:Array<Int> = [0, 15, 30, 45, 60, 75, 90, 105, 120, 135, 150, 165, 180, 195, 210, 225, 240, 255, 270, 285, 300, 315, 330, 345, 360];
		var angleToSnap:Int = 0;
		var x:Float = _x2;
		var y:Float = _y2;
		if (angle < 0) {
			angle += 360;
		}
		for (i in 0...angles.length) {
			if (angle > angles[i] && angle < angles[i + 1]) {
				if (angle < angles[i] + 7.5) {
					angleToSnap = angles[i];
					break;
				} else if (angle > angles[i] + 7.5) {
					angleToSnap = angles[i + 1];
					break;
				}
			} else {
				continue;
			}
		}
		var _locDis = Common.get_distance(new Point(_x1, _y1), new Point(_x2, _y2));
		x = _x1 + (_locDis * Math.cos(angleToSnap * 0.0174533));
		y = _y1 + (_locDis * Math.sin(angleToSnap * 0.0174533));
		var _locReturn:Array<Float> = new Array();
		_locReturn = [x, y];
		return(_locReturn);
	}
}