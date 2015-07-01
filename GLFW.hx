import cpp.*;

@:buildXml('<target id="haxe">
	<flag value="`pkg-config" />
	<flag value="--cflags" />
	<flag value="--libs" />
	<flag value="glfw3`" />
</target>')
@:include("GLFW/glfw3.h")

extern class GLFW
{
	@:native("glfwInit") static public function init():Void;
	@:native("glfwTerminate") static public function terminate():Void;
	@:native("glfwGetTime") static public function getTime():Float;
	@:native("glfwSetTime") static public function setTime(time:Float):Void;
	@:native("glfwGetVersion") static public function getVersion(major:Pointer<Int>, minor:Pointer<Int>, rev:Pointer<Int>):Void;
	@:native("glfwGetVersionString") static public function getVersionString():ConstCharStar;
	@:native("glfwExtensionSupported") static public function extensionSupported(extension:ConstCharStar):Bool;

	@:native("glfwPollEvents") static public function pollEvents():Void;
	@:native("glfwWaitEvents") static public function waitEvents():Void;

	// window functions
	@:native("glfwDefaultWindowHints") static public function defaultWindowHints():Void;
	@:native("glfwWindowHint") static public function windowHint(target:Int, hint:Int):Void;
	@:native("glfwCreateWindow") static public function createWindow(width:Int, height:Int, title:String, monitor:Pointer<Monitor>, source:Pointer<Window>):Pointer<Window>;
	@:native("glfwDestroyWindow") static public function destroyWindow(window:Pointer<Window>):Void;
	@:native("glfwMakeContextCurrent") static public function makeContextCurrent(window:Pointer<Window>):Void;
	@:native("glfwGetCurrentContext") static public function getCurrentContext():Pointer<Window>;
	@:native("glfwWindowShouldClose") static public function windowShouldClose(window:Pointer<Window>):Bool;
	@:native("glfwSetWindowShouldClose") static public function setWindowShouldClose(window:Pointer<Window>, value:Int):Void;
	@:native("glfwSetWindowTitle") static public function setWindowTitle(window:Pointer<Window>, title:ConstCharStar):Void;
	@:native("glfwSwapBuffers") static public function swapBuffers(window:Pointer<Window>):Float;
	@:native("glfwGetWindowPos") static public function getWindowPos(window:Pointer<Window>, x:Pointer<Int>, y:Pointer<Int>):Void;
	@:native("glfwSetWindowPos") static public function setWindowPos(window:Pointer<Window>, x:Int, y:Int):Void;
	@:native("glfwGetWindowSize") static public function getWindowSize(window:Pointer<Window>, width:Pointer<Int>, height:Pointer<Int>):Void;
	@:native("glfwSetWindowSize") static public function setWindowSize(window:Pointer<Window>, width:Int, height:Int):Void;
	@:native("glfwGetWindowMonitor") static public function getWindowMonitor(window:Pointer<Window>):Pointer<Monitor>;
	@:native("glfwGetWindowAttrib") static public function getWindowAttrib(window:Pointer<Window>, attribute:Int):Int;
	@:native("glfwGetFramebufferSize") static public function getFramebufferSize(window:Pointer<Window>, width:Pointer<Int>, height:Pointer<Int>):Float;
	@:native("glfwIconifyWindow") static public function iconifyWindow(window:Pointer<Window>):Float;
	@:native("glfwRestoreWindow") static public function restoreWindow(window:Pointer<Window>):Float;
	@:native("glfwShowWindow") static public function showWindow(window:Pointer<Window>):Float;
	@:native("glfwHideWindow") static public function hideWindow(window:Pointer<Window>):Float;
	@:native("glfwSwapInterval") static public function swapInterval(interval:Int):Float;
	@:native("glfwGetInputMode") static public function getInputMode(window:Pointer<Window>, mode:Int):Int;
	@:native("glfwSetInputMode") static public function setInputMode(window:Pointer<Window>, mode:Int, value:Int):Void;
	@:native("glfwGetKey") static public function getKey(window:Pointer<Window>, key:Int):Int;
	@:native("glfwGetMouseButton") static public function getMouseButton(window:Pointer<Window>, button:Int):Int;
	@:native("glfwGetCursorPos") static public function getCursorPos(window:Pointer<Window>, x:Pointer<Float>, y:Pointer<Float>):Void;
	@:native("glfwSetCursorPos") static public function setCursorPos(window:Pointer<Window>, x:Float, y:Float):Void;

	// monitor functions
	@:native("glfwGetPrimaryMonitor") static public function getPrimaryMonitor():Pointer<Monitor>;
	@:native("glfwGetMonitors") static public function getMonitors(count:Pointer<Int>):Pointer<Pointer<Monitor>>;
	@:native("glfwGetMonitorPos") static public function getMonitorPosition(monitor:Pointer<Monitor>, x:Pointer<Int>, y:Pointer<Int>):Void;
	@:native("glfwGetMonitorName") static public function getMonitorName(monitor:Pointer<Monitor>):ConstCharStar;
	@:native("glfwGetMonitorPhysicalSize") static public function getMonitorPhysicalSize(monitor:Pointer<Monitor>, width:Pointer<Int>, height:Pointer<Int>):Void;
	@:native("glfwGetVideoModes") static public function getVideoModes(monitor:Pointer<Monitor>, count:Pointer<Int>):Pointer<VidMode>;
	@:native("glfwGetVideoMode") static public function getVideoMode(monitor:Pointer<Monitor>):Pointer<VidMode>;
	@:native("glfwSetGamma") static public function setGamma(monitor:Pointer<Monitor>, gamma:Float):Void;

	@:native("glfwSetWindowPosCallback") static public function setWindowPosCallback(window:Pointer<Window>, callback:Callable<Pointer<Window>->Int->Int->Void>):Void;
	@:native("glfwSetWindowRefreshCallback") static public function setWindowRefreshCallback(window:Pointer<Window>, callback:Callable<cpp.RawPointer<Window>->Void>):Void;

	@:native("glfwGetClipboardString") static public function getClipboardString(window:Pointer<Window>):ConstCharStar;
	@:native("glfwSetClipboardString") static public function setClipboardString(window:Pointer<Window>, string:ConstCharStar):Void;

	@:native("glfwJoystickPresent") static public function joystickPresent(joystick:Int):Int;
	@:native("glfwJoystickName") static public function joystickName(joystick:Int):ConstCharStar;
}

@:structAccess
@:native("GLFWvidmode")
extern class VidMode
{
	var width:Int;
	var height:Int;
	var redBits:Int;
	var greenBits:Int;
	var blueBits:Int;
	var refreshRate:Int;
}

@:native("GLFWwindow") extern class Window { }
@:native("GLFWmonitor") extern class Monitor { }
