// Generated by Haxe 3.4.0
#include <hxcpp.h>

#ifndef INCLUDED_Main
#include <Main.h>
#endif
#ifndef INCLUDED_file_SaveManager
#include <file/SaveManager.h>
#endif
#ifndef INCLUDED_global_Common
#include <global/Common.h>
#endif
#ifndef INCLUDED_haxe_Log
#include <haxe/Log.h>
#endif
#ifndef INCLUDED_init_FileStart
#include <init/FileStart.h>
#endif
#ifndef INCLUDED_lime_app_IModule
#include <lime/app/IModule.h>
#endif
#ifndef INCLUDED_lr_Toolbar
#include <lr/Toolbar.h>
#endif
#ifndef INCLUDED_lr_Track
#include <lr/Track.h>
#endif
#ifndef INCLUDED_openfl_display_DisplayObject
#include <openfl/display/DisplayObject.h>
#endif
#ifndef INCLUDED_openfl_display_DisplayObjectContainer
#include <openfl/display/DisplayObjectContainer.h>
#endif
#ifndef INCLUDED_openfl_display_IBitmapDrawable
#include <openfl/display/IBitmapDrawable.h>
#endif
#ifndef INCLUDED_openfl_display_InteractiveObject
#include <openfl/display/InteractiveObject.h>
#endif
#ifndef INCLUDED_openfl_display_MovieClip
#include <openfl/display/MovieClip.h>
#endif
#ifndef INCLUDED_openfl_display_Sprite
#include <openfl/display/Sprite.h>
#endif
#ifndef INCLUDED_openfl_display_Stage
#include <openfl/display/Stage.h>
#endif
#ifndef INCLUDED_openfl_events_Event
#include <openfl/events/Event.h>
#endif
#ifndef INCLUDED_openfl_events_EventDispatcher
#include <openfl/events/EventDispatcher.h>
#endif
#ifndef INCLUDED_openfl_events_IEventDispatcher
#include <openfl/events/IEventDispatcher.h>
#endif

HX_DEFINE_STACK_FRAME(_hx_pos_e47a9afac0942eb9_49_new,"Main","new",0x6616a5cb,"Main.new","Main.hx",49,0x087e5c05)
HX_LOCAL_STACK_FRAME(_hx_pos_e47a9afac0942eb9_58_init_env,"Main","init_env",0x9ffef2b3,"Main.init_env","Main.hx",58,0x087e5c05)
HX_LOCAL_STACK_FRAME(_hx_pos_e47a9afac0942eb9_69_init_track,"Main","init_track",0x793f3ad1,"Main.init_track","Main.hx",69,0x087e5c05)
HX_LOCAL_STACK_FRAME(_hx_pos_e47a9afac0942eb9_81_resize,"Main","resize",0x39257969,"Main.resize","Main.hx",81,0x087e5c05)

void Main_obj::__construct(){
            	HX_STACKFRAME(&_hx_pos_e47a9afac0942eb9_49_new)
HXLINE(  50)		super::__construct();
HXLINE(  52)		this->init_env();
HXLINE(  53)		this->init_track();
HXLINE(  55)		this->stage->addEventListener(HX_("resize",f4,59,7b,08),this->resize_dyn(),null(),null(),null());
            	}

Dynamic Main_obj::__CreateEmpty() { return new Main_obj; }

void *Main_obj::_hx_vtable = 0;

Dynamic Main_obj::__Create(hx::DynamicArray inArgs)
{
	hx::ObjectPtr< Main_obj > _hx_result = new Main_obj();
	_hx_result->__construct();
	return _hx_result;
}

bool Main_obj::_hx_isInstanceOf(int inClassId) {
	if (inClassId<=(int)0x19c29573) {
		if (inClassId<=(int)0x17120186) {
			if (inClassId<=(int)0x0ddfced7) {
				return inClassId==(int)0x00000001 || inClassId==(int)0x0ddfced7;
			} else {
				return inClassId==(int)0x17120186;
			}
		} else {
			return inClassId==(int)0x19c29573;
		}
	} else {
		if (inClassId<=(int)0x332f6459) {
			return inClassId==(int)0x1b123bf8 || inClassId==(int)0x332f6459;
		} else {
			return inClassId==(int)0x3f2b00af;
		}
	}
}

void Main_obj::init_env(){
            	HX_GC_STACKFRAME(&_hx_pos_e47a9afac0942eb9_58_init_env)
HXLINE(  59)		::global::Common_obj::gCode = hx::ObjectPtr<OBJ_>(this);
HXLINE(  60)		::global::Common_obj::gStage = this->stage;
HXLINE(  62)		::global::Common_obj::stage_height = this->stage->stageHeight;
HXLINE(  63)		::global::Common_obj::stage_width = this->stage->stageWidth;
HXLINE(  65)		this->saveManager =  ::file::SaveManager_obj::__alloc( HX_CTX );
            	}


HX_DEFINE_DYNAMIC_FUNC0(Main_obj,init_env,(void))

void Main_obj::init_track(){
            	HX_GC_STACKFRAME(&_hx_pos_e47a9afac0942eb9_69_init_track)
HXLINE(  70)		this->visContainer =  ::openfl::display::MovieClip_obj::__alloc( HX_CTX );
HXLINE(  71)		this->addChild(this->visContainer);
HXLINE(  72)		::global::Common_obj::gVisContainer = this->visContainer;
HXLINE(  74)		this->track =  ::lr::Track_obj::__alloc( HX_CTX );
HXLINE(  75)		this->visContainer->addChild(this->track);
HXLINE(  77)		this->toolBar =  ::lr::Toolbar_obj::__alloc( HX_CTX );
HXLINE(  78)		this->visContainer->addChild(this->toolBar);
            	}


HX_DEFINE_DYNAMIC_FUNC0(Main_obj,init_track,(void))

void Main_obj::resize( ::openfl::events::Event e){
            	HX_STACKFRAME(&_hx_pos_e47a9afac0942eb9_81_resize)
HXLINE(  82)		::haxe::Log_obj::trace(this->stage->stageWidth, ::Dynamic(hx::Anon_obj::Create(5)
            			->setFixed(0,HX_("className",a3,92,3d,dc),HX_("Main",59,64,2f,33))
            			->setFixed(1,HX_("customParams",d7,51,18,ed),::cpp::VirtualArray_obj::__new(1)->init(0,this->stage->stageHeight))
            			->setFixed(2,HX_("methodName",cc,19,0f,12),HX_("resize",f4,59,7b,08))
            			->setFixed(3,HX_("fileName",e7,5a,43,62),HX_("Main.hx",05,5c,7e,08))
            			->setFixed(4,HX_("lineNumber",dd,81,22,76),(int)82)));
HXLINE(  83)		 ::openfl::display::MovieClip _hx_tmp = this->visContainer;
HXDLIN(  83)		_hx_tmp->set_x(this->visContainer->set_y((int)0));
HXLINE(  84)		 ::lr::Toolbar _hx_tmp1 = this->toolBar;
HXDLIN(  84)		Float _hx_tmp2 = ((Float)this->stage->stageWidth / (Float)(int)2);
HXDLIN(  84)		_hx_tmp1->set_x((_hx_tmp2 - ((Float)this->toolBar->get_width() / (Float)(int)2)));
HXLINE(  86)		::global::Common_obj::stage_height = this->stage->stageHeight;
HXLINE(  87)		::global::Common_obj::stage_width = this->stage->stageWidth;
            	}


HX_DEFINE_DYNAMIC_FUNC1(Main_obj,resize,(void))


hx::ObjectPtr< Main_obj > Main_obj::__new() {
	hx::ObjectPtr< Main_obj > __this = new Main_obj();
	__this->__construct();
	return __this;
}

hx::ObjectPtr< Main_obj > Main_obj::__alloc(hx::Ctx *_hx_ctx) {
	Main_obj *__this = (Main_obj*)(hx::Ctx::alloc(_hx_ctx, sizeof(Main_obj), true, "Main"));
	*(void **)__this = Main_obj::_hx_vtable;
	__this->__construct();
	return __this;
}

Main_obj::Main_obj()
{
}

void Main_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(Main);
	HX_MARK_MEMBER_NAME(mainFileInit,"mainFileInit");
	HX_MARK_MEMBER_NAME(visContainer,"visContainer");
	HX_MARK_MEMBER_NAME(track,"track");
	HX_MARK_MEMBER_NAME(toolBar,"toolBar");
	HX_MARK_MEMBER_NAME(saveManager,"saveManager");
	 ::openfl::display::Sprite_obj::__Mark(HX_MARK_ARG);
	HX_MARK_END_CLASS();
}

void Main_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(mainFileInit,"mainFileInit");
	HX_VISIT_MEMBER_NAME(visContainer,"visContainer");
	HX_VISIT_MEMBER_NAME(track,"track");
	HX_VISIT_MEMBER_NAME(toolBar,"toolBar");
	HX_VISIT_MEMBER_NAME(saveManager,"saveManager");
	 ::openfl::display::Sprite_obj::__Visit(HX_VISIT_ARG);
}

hx::Val Main_obj::__Field(const ::String &inName,hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 5:
		if (HX_FIELD_EQ(inName,"track") ) { return hx::Val( track); }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"resize") ) { return hx::Val( resize_dyn()); }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"toolBar") ) { return hx::Val( toolBar); }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"init_env") ) { return hx::Val( init_env_dyn()); }
		break;
	case 10:
		if (HX_FIELD_EQ(inName,"init_track") ) { return hx::Val( init_track_dyn()); }
		break;
	case 11:
		if (HX_FIELD_EQ(inName,"saveManager") ) { return hx::Val( saveManager); }
		break;
	case 12:
		if (HX_FIELD_EQ(inName,"mainFileInit") ) { return hx::Val( mainFileInit); }
		if (HX_FIELD_EQ(inName,"visContainer") ) { return hx::Val( visContainer); }
	}
	return super::__Field(inName,inCallProp);
}

hx::Val Main_obj::__SetField(const ::String &inName,const hx::Val &inValue,hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 5:
		if (HX_FIELD_EQ(inName,"track") ) { track=inValue.Cast<  ::lr::Track >(); return inValue; }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"toolBar") ) { toolBar=inValue.Cast<  ::lr::Toolbar >(); return inValue; }
		break;
	case 11:
		if (HX_FIELD_EQ(inName,"saveManager") ) { saveManager=inValue.Cast<  ::file::SaveManager >(); return inValue; }
		break;
	case 12:
		if (HX_FIELD_EQ(inName,"mainFileInit") ) { mainFileInit=inValue.Cast<  ::init::FileStart >(); return inValue; }
		if (HX_FIELD_EQ(inName,"visContainer") ) { visContainer=inValue.Cast<  ::openfl::display::MovieClip >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void Main_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_HCSTRING("mainFileInit","\x05","\x79","\xbf","\x8d"));
	outFields->push(HX_HCSTRING("visContainer","\x41","\xb3","\x30","\xec"));
	outFields->push(HX_HCSTRING("track","\x8b","\x8e","\x1f","\x16"));
	outFields->push(HX_HCSTRING("toolBar","\x5b","\xb5","\x66","\x6a"));
	outFields->push(HX_HCSTRING("saveManager","\xb0","\xc0","\x61","\x6d"));
	super::__GetFields(outFields);
};

#if HXCPP_SCRIPTABLE
static hx::StorageInfo Main_obj_sMemberStorageInfo[] = {
	{hx::fsObject /*::init::FileStart*/ ,(int)offsetof(Main_obj,mainFileInit),HX_HCSTRING("mainFileInit","\x05","\x79","\xbf","\x8d")},
	{hx::fsObject /*::openfl::display::MovieClip*/ ,(int)offsetof(Main_obj,visContainer),HX_HCSTRING("visContainer","\x41","\xb3","\x30","\xec")},
	{hx::fsObject /*::lr::Track*/ ,(int)offsetof(Main_obj,track),HX_HCSTRING("track","\x8b","\x8e","\x1f","\x16")},
	{hx::fsObject /*::lr::Toolbar*/ ,(int)offsetof(Main_obj,toolBar),HX_HCSTRING("toolBar","\x5b","\xb5","\x66","\x6a")},
	{hx::fsObject /*::file::SaveManager*/ ,(int)offsetof(Main_obj,saveManager),HX_HCSTRING("saveManager","\xb0","\xc0","\x61","\x6d")},
	{ hx::fsUnknown, 0, null()}
};
static hx::StaticInfo *Main_obj_sStaticStorageInfo = 0;
#endif

static ::String Main_obj_sMemberFields[] = {
	HX_HCSTRING("mainFileInit","\x05","\x79","\xbf","\x8d"),
	HX_HCSTRING("visContainer","\x41","\xb3","\x30","\xec"),
	HX_HCSTRING("track","\x8b","\x8e","\x1f","\x16"),
	HX_HCSTRING("toolBar","\x5b","\xb5","\x66","\x6a"),
	HX_HCSTRING("saveManager","\xb0","\xc0","\x61","\x6d"),
	HX_HCSTRING("init_env","\xfe","\x4b","\xf6","\x58"),
	HX_HCSTRING("init_track","\xdc","\xbc","\xb7","\xe1"),
	HX_HCSTRING("resize","\xf4","\x59","\x7b","\x08"),
	::String(null()) };

static void Main_obj_sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(Main_obj::__mClass,"__mClass");
};

#ifdef HXCPP_VISIT_ALLOCS
static void Main_obj_sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(Main_obj::__mClass,"__mClass");
};

#endif

hx::Class Main_obj::__mClass;

void Main_obj::__register()
{
	hx::Object *dummy = new Main_obj;
	Main_obj::_hx_vtable = *(void **)dummy;
	hx::Static(__mClass) = new hx::Class_obj();
	__mClass->mName = HX_HCSTRING("Main","\x59","\x64","\x2f","\x33");
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &hx::Class_obj::GetNoStaticField;
	__mClass->mSetStaticField = &hx::Class_obj::SetNoStaticField;
	__mClass->mMarkFunc = Main_obj_sMarkStatics;
	__mClass->mStatics = hx::Class_obj::dupFunctions(0 /* sStaticFields */);
	__mClass->mMembers = hx::Class_obj::dupFunctions(Main_obj_sMemberFields);
	__mClass->mCanCast = hx::TCanCast< Main_obj >;
#ifdef HXCPP_VISIT_ALLOCS
	__mClass->mVisitFunc = Main_obj_sVisitStatics;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = Main_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = Main_obj_sStaticStorageInfo;
#endif
	hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

