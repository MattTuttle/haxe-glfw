import Engine;

class Host
{
	static public function main()
	{
		cpp.cppia.Host.run(sys.io.File.getContent("main.cppia"));
	}
}
