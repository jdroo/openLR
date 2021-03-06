package;

import openfl.display.Sprite;

import base.CoreBase;

#if android
    import base.cores.AndroidCore;        
#elseif (windows || linux || osx)
    import base.cores.CppCore;
#elseif flash
    import base.cores.FlashCore;
#elseif js
    import base.cores.JavaScriptCore;
#end

import global.Common;

/**
 * ...
 * @author Kaelan Evans
 * 
 * /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 * //OpenLR Project Release Alpha 0.0.5
 * /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 * 
 * This program was built using HaxeDevelop IDE, with haxe and openFL. Other libraries if used can be found in project.xml
 * 
 */

class Main extends Sprite 
{
    private var core:CoreBase;
    public function new() {
        
        super();
        
        #if android
            this.core = new AndroidCore();
        #elseif (windows || linux || osx)
            this.core = new CppCore();
        #elseif (flash || air)
			this.core = new FlashCore();
        #elseif js
            this.core = new JavaScriptCore();
        #else
            trace("Deployment target not supported");
        #end
    }
}