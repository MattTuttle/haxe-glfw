import GLFW;
import GL;
import cpp.Pointer;

@:headerCode("struct GLFWwindow;") // forward reference...
class Engine
{
	public function new()
	{
		GLFW.init();
		var primary = GLFW.getPrimaryMonitor();
		trace(GLFW.getMonitorName(primary));
		var mode = GLFW.getVideoMode(primary).ref;
		// trace(mode.width, mode.height);
		// var monitor = GLFW.getPrimaryMonitor();
		var monitor = null;
		window = GLFW.createWindow(640, 480, "My Window", monitor, window);
		GLFW.makeContextCurrent(window);
		GLFW.setWindowRefreshCallback(window, new cpp.Function(onWindowRefresh));
		GLFW.swapInterval(1);
		GL.clearColor(0.3, 0.3, 0.3, 1);
	}

	private function onWindowRefresh(window:Pointer<Window>):Void
	{
		trace("refresh");
	}

	public function run()
	{
		while (!GLFW.windowShouldClose(window))
		{
			GL.clear(GL.COLOR_BUFFER_BIT);
			GLFW.swapBuffers(window);
			GLFW.pollEvents();
		}
	}

	public function close()
	{
		GLFW.destroyWindow(window);
		GLFW.terminate();
	}

	private var window:Pointer<Window> = null;
	private var width:Int;
	private var height:Int;
}
