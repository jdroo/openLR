package ui.tool.icon;

import openfl.display.Bitmap;
import openfl.display.MovieClip;
import openfl.events.MouseEvent;
import openfl.Lib;
import openfl.Assets;
import openfl.net.URLRequest;
import openfl.ui.Mouse;
import openfl.ui.MouseCursor;

#if (cpp)
	import sys.io.File;
	import sys.FileSystem;
#end

import global.Common;
import global.Language;
import ui.tool.Toolbar;
import ui.inter.TextButton;
import file.LoadManager;
import ui.inter.ConfirmDialog;
import ui.inter.InputText;
import file.SaveManager;
import ui.tool.IconBase;

/**
 * ...
 * @author Kaelan Evans
 */
class IconSave extends IconBase
{
	private var open:Bool = false;
	private var menu:MovieClip;
	private var buttonList:Array<TextButton>;
	private var new_track:TextButton;
	private var save_track:TextButton;
	private var load_track:TextButton;
	private var about:TextButton;
	private var loadManager:LoadManager;
	private var safety_dialog:ConfirmDialog;
	private var screen_cap:TextButton;
	public function new() 
	{
		super(Icon.file);
		this.buttonList = new Array();
		this.set_items();
	}
	
	function set_items() 
	{
		this.new_track = new TextButton(Language.New_track, this.make_new_track, ButtonSize.b120x30);
			this.buttonList.push(this.new_track);
			
			#if (cpp)
				this.save_track = new TextButton(Language.Save_track, this.open_save_menu, ButtonSize.b120x30);
				this.buttonList.push(this.save_track);
				
				this.load_track = new TextButton(Language.Load_track, this.show_loader, ButtonSize.b120x30);
				this.buttonList.push(this.load_track);
				
				this.screen_cap = new TextButton(Language.Screencap, this.take_screenshot, ButtonSize.b120x30);
				this.buttonList.push(this.screen_cap);
			#end
			
			this.about = new TextButton("About", this.open_github_page, ButtonSize.b120x30);
			this.buttonList.push(this.about);
	}
	override public function up(e:MouseEvent) {
		if (this.mouseY < 30)
		{
			this.show_menu();
			this.alpha = 1;
		}
	}
	private function show_menu()
	{
		if (open) {
			this.hide_list();
			this.removeChild(this.menu);
			this.open = false;
		} else if (!open) {
			this.loadManager = new LoadManager();
			
			this.menu = new MovieClip();
			this.addChild(menu);
			this.menu.graphics.clear();
			this.menu.graphics.lineStyle(2, 0xFFFFFF, 0);
			this.menu.graphics.beginFill(0xCCCCCC, 1);
			this.menu.graphics.lineTo(0, 0);
			
			this.show_list();
			
			this.open = true;
		}
	}
	
	function open_github_page() 
	{
		Lib.getURL(new URLRequest("https://github.com/kevansevans/openLR"));
	}
	
	function show_list() 
	{
		var b:Int = 0;
		for (a in this.buttonList) {
			this.addChild(a);
			a.x = 5;
			a.y = 35 + (35 * b);
			++b;
		}
	}
	
	function hide_list() 
	{
		for (a in this.buttonList) {
			this.removeChild(a);
		}
	}
	
	function take_screenshot() 
	{
		Common.gCode.take_screencap();
		this.show_menu();
	}
	
	function show_loader() 
	{
		this.show_menu();
		Common.gCode.toggle_Loader();
	}
	function make_new_track() 
	{
		this.show_menu();
		this.safety_dialog = new ConfirmDialog("Are you sure you want to make a new track? All unsaved changes will be lost!", this.confirmed_new, this.negative_new);
		this.addChild(this.safety_dialog);
		this.safety_dialog.x = -320;
		this.safety_dialog.y = 180;
	}
	function open_save_menu() 
	{
		Common.gCode.toggle_save_menu();
	}
	override private function disable_tool(e:MouseEvent):Void 
	{
		Common.gToolBase.disable();
	}
	function confirmed_new() {
		this.removeChild(this.safety_dialog);
		SaveManager.new_track = true;
		Common.gTrack.clear_stage();
		Common.gToolBase.enable();
	}
	function negative_new() {
		this.show_menu();
		this.removeChild(this.safety_dialog);
	}
}