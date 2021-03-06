package lr.settings;

import openfl.display.Sprite;
import openfl.events.MouseEvent;

import ui.inter.TextButton;
import global.Language;
import global.Common;

enum PanelMode
{
	file;
	track;
	profile;
	engine;
}

/**
 * ...
 * @author Kaelan Evans
 */
class SettingsMenu extends Sprite
{
	var state:PanelMode = file; 
	  
	var tabFileMenu:TextButton;
	var tabTrackSettings:TextButton;
	var tabProfile:TextButton;
	var tabEngine:TextButton;
	
	var fileMenu:FileMenu;
	var trackMenu:TrackSettings;
	var profileMenu:ProfileSettings;
	var engineMenu:EngineSettings;
	
	private var exit:TextButton;
	public function new() 
	{
		super();
		
		this.tabFileMenu = new TextButton(Language.File, this.set_to_file, ButtonSize.b120x30);
		this.tabTrackSettings = new TextButton(Language.Track, this.set_to_track, ButtonSize.b120x30);
		this.tabProfile = new TextButton(Language.Profile, this.set_to_profile, ButtonSize.b120x30);
		this.tabEngine = new TextButton("Global", this.set_to_engine, ButtonSize.b120x30);
		
		this.addChild(this.tabEngine);
		this.tabEngine.x = -140;
		
		this.addChild(this.tabFileMenu);
		this.tabFileMenu.y = 35;
		this.tabFileMenu.x = -140;
		
		this.addChild(this.tabTrackSettings);
		this.tabTrackSettings.x = -140;
		this.tabTrackSettings.y = 70;
		
		//this.addChild(this.tabProfile);
		//this.tabProfile.x = this.tabTrackSettings.x + this.tabTrackSettings.width;
		
		this.exit = new TextButton(Language.Close, Common.gCode.toggleSettings_box, ButtonSize.b120x30);
		this.addChild(exit);
		this.exit.x = -140;
		this.exit.y = 105;
		
		this.fileMenu = new FileMenu();
		this.trackMenu = new TrackSettings();
		this.engineMenu = new EngineSettings();
		//this.profileMenu = new ProfileSettings();
		
		this.addChild(this.fileMenu);
		this.addChild(this.trackMenu);
		this.addChild(this.engineMenu);
		
		this.set_to_track();
	}
	public function update() {
		this.fileMenu.update();
		this.trackMenu.update();
		//this.profileMenu.update();
	}
	function clearMenu() {
		this.fileMenu.visible = false;
		this.trackMenu.visible = false;
		//this.profileMenu.visible = false;
		this.engineMenu.visible = false;
	}
	function set_to_engine() 
	{
		this.clearMenu();
		this.state = engine;
		this.engineMenu.visible = true;
	}
	function set_to_track() {
		this.clearMenu();
		this.state = track;
		this.trackMenu.visible = true;
		this.trackMenu.update();
	}
	function set_to_file() {
		this.clearMenu();
		this.state = file;
		this.fileMenu.visible = true;
	}
	function set_to_profile() {
		this.clearMenu();
		this.state = profile;
		this.profileMenu.visible = true;
	}
}