@:buildXml('<target id="haxe">
	<vflag name="-framework" value="OpenGL" />
</target>')
@:include(#if osx "OpenGL/gl.h" #else "GL/gl.h" #end)
extern class GL
{
	public static inline var DEPTH_BUFFER_BIT:Int = 0x00000100;
	public static inline var STENCIL_BUFFER_BIT:Int = 0x00000400;
	public static inline var COLOR_BUFFER_BIT:Int = 0x00004000;

	@:native("glClear") static public function clear(mode:Int):Void;
	@:native("glClearColor") static public function clearColor(r:Float, g:Float, b:Float, a:Float):Void;
}
