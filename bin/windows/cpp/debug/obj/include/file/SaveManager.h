// Generated by Haxe 3.4.0
#ifndef INCLUDED_file_SaveManager
#define INCLUDED_file_SaveManager

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS1(file,SaveManager)
HX_DECLARE_CLASS2(sys,io,File)

namespace file{


class HXCPP_CLASS_ATTRIBUTES SaveManager_obj : public hx::Object
{
	public:
		typedef hx::Object super;
		typedef SaveManager_obj OBJ_;
		SaveManager_obj();

	public:
		enum { _hx_ClassId = 0x1a1b5f28 };

		void __construct();
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="file.SaveManager")
			{ return hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return hx::Object::operator new(inSize+extra,true,"file.SaveManager"); }
		static hx::ObjectPtr< SaveManager_obj > __new();
		static hx::ObjectPtr< SaveManager_obj > __alloc(hx::Ctx *_hx_ctx);
		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		//~SaveManager_obj();

		HX_DO_RTTI_ALL;
		hx::Val __Field(const ::String &inString, hx::PropertyAccess inCallProp);
		hx::Val __SetField(const ::String &inString,const hx::Val &inValue, hx::PropertyAccess inCallProp);
		void __GetFields(Array< ::String> &outFields);
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_HCSTRING("SaveManager","\x90","\x58","\x94","\x51"); }

		 ::sys::io::File directory;
		 ::Dynamic trackData;
		void generateSave();
		::Dynamic generateSave_dyn();

		 ::Dynamic parse();
		::Dynamic parse_dyn();

};

} // end namespace file

#endif /* INCLUDED_file_SaveManager */ 
