<Query Kind="Program" />

void Main(string[] args)
{
 	var path = args[0];
	var currentLine = int.Parse(args[1]);
	var item = GetExactPathName(path);
	Console.WriteLine($"File path to blame: {item} with line number: {currentLine}");
	Process.Start(@"C:\Program Files\TortoiseGit\bin\TortoiseGitProc.exe",$"/command:blame /path:{item} /line:{currentLine}");
}

public static string GetExactPathName(string pathName)
    {
        if (!(File.Exists(pathName) || Directory.Exists(pathName)))
            return pathName;

        var di = new DirectoryInfo(pathName);

        if (di.Parent != null) {
            return Path.Combine(
                GetExactPathName(di.Parent.FullName), 
                di.Parent.GetFileSystemInfos(di.Name)[0].Name);
        } else {
            return di.Name.ToUpper();
        }
    }