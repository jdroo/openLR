package;

import openfl.display.Loader;
import openfl.display.MovieClip;
import openfl.display.Sprite;
import openfl.Lib;
import openfl.events.Event;
import openfl.net.URLRequest;
import openfl.Assets.AssetLibrary;
import haxe.Timer;
import ui.inter.AlertBox;

import file.FileStart;
import file.LoadManager;
import global.Common;
import ui.inter.SingleButton;
import file.SaveManager;
import global.FrameRate;
import global.SimManager;
import lr.TextInfo;
import ui.tool.Toolbar;
import lr.Track;

/**
 * ...
 * @author Kaelan Evans
 * 
 * /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 * //OpenLR Project Release Alpha 0.0.4
 * /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 * 
 * This program was built using HaxeDevelop IDE, with haxe and openFL. Other libraries if used can be found in project.xml
 * 
 * /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 * //Known issues to work around
 * /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 * 
 *  --None ATM
 * 
 * /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 * //Notes
 * /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 * 
 * --Need to clean up some of the "rabbit hole" functions. Starting to get lost in my own code.
 * --Need to make some UI classes. Check boxes, radio buttons, lists.
 * --Need to work on defaults for settings. Alpha 0.0.4 will probably be that
 * 
 * /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 * //To do
 * /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 * 
 * -- Arbitrary save parser. Will allow for saves to be incomplete and future proof //maybe? Just use my own JSON format probably. Maybe use a similar format to LRA
 * -- LZ-String port, this is needed if compatibility with .com must happen
 * -- UI system. Menus, checkboxes, radio buttons, arbitrarily sized buttons, fonts, blah blah blah
 * -- Better file management. Save with name support, save as (arbitrary location), load from saves folder, and browse.
 * 
 */
class Main extends Sprite 
{
	private var mainFileInit:FileStart; //this class controls settings
	private var visContainer:MovieClip; //simple display container. This will make it easier to take screenshots and record video without having to move a matrix all around
	private var track:Track;
	private var toolBar:Toolbar;
	private var textInfo:TextInfo;
	private var FPS:FrameRate;
	private var welcome_alert:AlertBox;
	
	private var loadManager:LoadManager;
	
	public function new() 
	{
		super(); //In Haxe, a super must be called when classes inherit
		this.init_env();
		this.init_track();
		this.mainFileInit = new FileStart();
		this.welcome_alert = new AlertBox("Welcome to OpenLR " + Common.version + "! This is an early build, however I hope you find this version useful as it is intended to be. You can report bugs to:" + "\n \n" + "https://github.com/kevansevans/openLR/issues" + "\n \n" + "Happy riding!", this.start, "Continue");
		this.addChild(this.welcome_alert);
		this.welcome_alert.x = (this.stage.stageWidth * 0.5) - (this.welcome_alert.width * 0.5);
		this.welcome_alert.y = (this.stage.stageHeight * 0.5) - (this.welcome_alert.height * 0.5);
	}
	function start() {
		this.removeChild(this.welcome_alert);
	}
	public function init_env() //Initialize enviornment
	{
		Common.gCode = this; //This class
		Common.gStage = this.stage; //The stage, not to be comfused with main.hx
		
		Common.stage_height = this.stage.stageHeight;
		Common.stage_width = this.stage.stageWidth;
		
		this.stage.addEventListener(Event.RESIZE, resize);
		
		this.FPS = new FrameRate();
	}
	
	public function init_track() //display minimum items
	{
		this.visContainer = new MovieClip();
		this.addChild(visContainer);
		Common.gVisContainer = this.visContainer;
		
		this.track = new Track();
		this.visContainer.addChild(this.track);
		this.track.x = this.stage.stageWidth * 0.5;
		this.track.y = this.stage.stageHeight * 0.5;
		this.track.scaleX = this.track.scaleY = 2;
		
		this.toolBar = new Toolbar();
		this.visContainer.addChild(this.toolBar);
		
		this.textInfo = new TextInfo();
		this.visContainer.addChild(this.textInfo);
	}
	private function resize(e:Event):Void
	{
		this.visContainer.x = this.visContainer.y = 0;
		this.toolBar.x = (this.stage.stageWidth / 2) - (this.toolBar.width / 2); 
		
		Common.stage_height = this.stage.stageHeight;
		Common.stage_width = this.stage.stageWidth;
		
		this.textInfo.x = (this.stage.stageWidth - this.textInfo.width) - 5;
		this.textInfo.y = 5;
		
		if (Common.gCamera != null) {
			Common.gCamera.update_pan_bounds();
		}
	}
	public function return_to_origin(_x:Float = 0, _y:Float = 0) {
		this.track.x = this.stage.stageWidth * 0.5 - _x;
		this.track.y = this.stage.stageHeight * 0.5 - _y;
		this.track.scaleX = this.track.scaleY = 2;
	}
	public function return_to_origin_sim() {
		this.track.x = this.stage.stageWidth * 0.5;
		this.track.y = this.stage.stageHeight * 0.5;
	}
	public function init_Loader() {
		Common.svar_game_mode = "loader";
		this.loadManager = new LoadManager();
		this.loadManager.displayTrackListVis();
		this.visContainer.visible = false;
	}
	public function cancel_load() {
		Common.svar_game_mode = "edit";
		this.loadManager.destroy_self();
		this.visContainer.visible = true;
		Common.gToolBase.enable();
		this.stage.mouseEnabled = true;
		Toolbar.tool.enable();
	}
}
