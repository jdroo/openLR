// Generated by Haxe 3.4.0
#include <hxcpp.h>

#ifndef INCLUDED_lr_line_LineBase
#include <lr/line/LineBase.h>
#endif
#ifndef INCLUDED_lr_line_LineScene
#include <lr/line/LineScene.h>
#endif
#ifndef INCLUDED_openfl_display_DisplayObject
#include <openfl/display/DisplayObject.h>
#endif
#ifndef INCLUDED_openfl_display_DisplayObjectContainer
#include <openfl/display/DisplayObjectContainer.h>
#endif
#ifndef INCLUDED_openfl_display_Graphics
#include <openfl/display/Graphics.h>
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
#ifndef INCLUDED_openfl_display__CapsStyle_CapsStyle_Impl_
#include <openfl/display/_CapsStyle/CapsStyle_Impl_.h>
#endif
#ifndef INCLUDED_openfl_display__LineScaleMode_LineScaleMode_Impl_
#include <openfl/display/_LineScaleMode/LineScaleMode_Impl_.h>
#endif
#ifndef INCLUDED_openfl_events_EventDispatcher
#include <openfl/events/EventDispatcher.h>
#endif
#ifndef INCLUDED_openfl_events_IEventDispatcher
#include <openfl/events/IEventDispatcher.h>
#endif
#ifndef INCLUDED_openfl_geom_Point
#include <openfl/geom/Point.h>
#endif

HX_DEFINE_STACK_FRAME(_hx_pos_c872745660560a05_17_new,"lr.line.LineScene","new",0x5c925078,"lr.line.LineScene.new","lr/line/LineScene.hx",17,0x398fd258)
HX_LOCAL_STACK_FRAME(_hx_pos_c872745660560a05_27_render,"lr.line.LineScene","render",0x0ed80a3e,"lr.line.LineScene.render","lr/line/LineScene.hx",27,0x398fd258)
namespace lr{
namespace line{

void LineScene_obj::__construct( ::openfl::geom::Point _a, ::openfl::geom::Point _b,bool _inv,hx::Null< int >  __o__lim){
int _lim = __o__lim.Default(-1);
            	HX_STACKFRAME(&_hx_pos_c872745660560a05_17_new)
HXLINE(  18)		super::__construct();
HXLINE(  19)		this->type = (int)2;
HXLINE(  20)		this->a = _a;
HXLINE(  21)		this->b = _b;
HXLINE(  22)		this->inv = _inv;
HXLINE(  23)		this->calculateConstants();
HXLINE(  24)		int _hx_tmp;
HXDLIN(  24)		if ((_lim == (int)-1)) {
HXLINE(  24)			_hx_tmp = (int)0;
            		}
            		else {
HXLINE(  24)			_hx_tmp = _lim;
            		}
HXDLIN(  24)		this->set_lim(_hx_tmp);
            	}

Dynamic LineScene_obj::__CreateEmpty() { return new LineScene_obj; }

void *LineScene_obj::_hx_vtable = 0;

Dynamic LineScene_obj::__Create(hx::DynamicArray inArgs)
{
	hx::ObjectPtr< LineScene_obj > _hx_result = new LineScene_obj();
	_hx_result->__construct(inArgs[0],inArgs[1],inArgs[2],inArgs[3]);
	return _hx_result;
}

bool LineScene_obj::_hx_isInstanceOf(int inClassId) {
	if (inClassId<=(int)0x1b123bf8) {
		if (inClassId<=(int)0x17120186) {
			if (inClassId<=(int)0x0ddfced7) {
				return inClassId==(int)0x00000001 || inClassId==(int)0x0ddfced7;
			} else {
				return inClassId==(int)0x17120186;
			}
		} else {
			return inClassId==(int)0x19c29573 || inClassId==(int)0x1b123bf8;
		}
	} else {
		if (inClassId<=(int)0x7d38c33f) {
			if (inClassId<=(int)0x3f2b00af) {
				return inClassId==(int)0x21e31f0e || inClassId==(int)0x3f2b00af;
			} else {
				return inClassId==(int)0x7d38c33f;
			}
		} else {
			return inClassId==(int)0x7f747dae;
		}
	}
}

void LineScene_obj::render(::String con){
            	HX_STACKFRAME(&_hx_pos_c872745660560a05_27_render)
HXLINE(  28)		this->get_graphics()->clear();
HXLINE(  29)		if ((con == HX_("edit",0a,ca,0e,43))) {
HXLINE(  30)			 ::openfl::display::Graphics _hx_tmp = this->get_graphics();
HXDLIN(  30)			 ::Dynamic _hx_tmp1 = ::openfl::display::_LineScaleMode::LineScaleMode_Impl__obj::fromString(HX_("normal",27,72,69,30));
HXDLIN(  30)			_hx_tmp->lineStyle((int)2,(int)52224,(int)1,true,_hx_tmp1,::openfl::display::_CapsStyle::CapsStyle_Impl__obj::fromString(HX_("round",4e,f8,65,ed)),null(),null());
            		}
            		else {
HXLINE(  32)			 ::openfl::display::Graphics _hx_tmp2 = this->get_graphics();
HXDLIN(  32)			 ::Dynamic _hx_tmp3 = ::openfl::display::_LineScaleMode::LineScaleMode_Impl__obj::fromString(HX_("normal",27,72,69,30));
HXDLIN(  32)			_hx_tmp2->lineStyle((int)2,(int)0,(int)1,true,_hx_tmp3,::openfl::display::_CapsStyle::CapsStyle_Impl__obj::fromString(HX_("round",4e,f8,65,ed)),null(),null());
            		}
HXLINE(  34)		this->get_graphics()->moveTo(this->a->x,this->a->y);
HXLINE(  35)		this->get_graphics()->lineTo(this->b->x,this->b->y);
            	}


HX_DEFINE_DYNAMIC_FUNC1(LineScene_obj,render,(void))


hx::ObjectPtr< LineScene_obj > LineScene_obj::__new( ::openfl::geom::Point _a, ::openfl::geom::Point _b,bool _inv,hx::Null< int >  __o__lim) {
	hx::ObjectPtr< LineScene_obj > __this = new LineScene_obj();
	__this->__construct(_a,_b,_inv,__o__lim);
	return __this;
}

hx::ObjectPtr< LineScene_obj > LineScene_obj::__alloc(hx::Ctx *_hx_ctx, ::openfl::geom::Point _a, ::openfl::geom::Point _b,bool _inv,hx::Null< int >  __o__lim) {
	LineScene_obj *__this = (LineScene_obj*)(hx::Ctx::alloc(_hx_ctx, sizeof(LineScene_obj), true, "lr.line.LineScene"));
	*(void **)__this = LineScene_obj::_hx_vtable;
	__this->__construct(_a,_b,_inv,__o__lim);
	return __this;
}

LineScene_obj::LineScene_obj()
{
}

hx::Val LineScene_obj::__Field(const ::String &inName,hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 6:
		if (HX_FIELD_EQ(inName,"render") ) { return hx::Val( render_dyn()); }
	}
	return super::__Field(inName,inCallProp);
}

#if HXCPP_SCRIPTABLE
static hx::StorageInfo *LineScene_obj_sMemberStorageInfo = 0;
static hx::StaticInfo *LineScene_obj_sStaticStorageInfo = 0;
#endif

static ::String LineScene_obj_sMemberFields[] = {
	HX_HCSTRING("render","\x56","\x6b","\x29","\x05"),
	::String(null()) };

static void LineScene_obj_sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(LineScene_obj::__mClass,"__mClass");
};

#ifdef HXCPP_VISIT_ALLOCS
static void LineScene_obj_sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(LineScene_obj::__mClass,"__mClass");
};

#endif

hx::Class LineScene_obj::__mClass;

void LineScene_obj::__register()
{
	hx::Object *dummy = new LineScene_obj;
	LineScene_obj::_hx_vtable = *(void **)dummy;
	hx::Static(__mClass) = new hx::Class_obj();
	__mClass->mName = HX_HCSTRING("lr.line.LineScene","\x86","\xf4","\x9a","\x7b");
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &hx::Class_obj::GetNoStaticField;
	__mClass->mSetStaticField = &hx::Class_obj::SetNoStaticField;
	__mClass->mMarkFunc = LineScene_obj_sMarkStatics;
	__mClass->mStatics = hx::Class_obj::dupFunctions(0 /* sStaticFields */);
	__mClass->mMembers = hx::Class_obj::dupFunctions(LineScene_obj_sMemberFields);
	__mClass->mCanCast = hx::TCanCast< LineScene_obj >;
#ifdef HXCPP_VISIT_ALLOCS
	__mClass->mVisitFunc = LineScene_obj_sVisitStatics;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = LineScene_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = LineScene_obj_sStaticStorageInfo;
#endif
	hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace lr
} // end namespace line
