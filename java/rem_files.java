import java.io.File;

class FileIO
{
    public static void main(String[] args) 
    {
		if (args.length < 1) {
			System.err.println("Usage java FileIO <dir>");
			System.exit(1);
		}
		
        File file = new File(args[0]);

        // Reading directory contents
        File[] files = file.listFiles();
		long fileSize;
        for (int i = 0; i < files.length; i++) {
			fileSize = files[i].length();
			if (fileSize < 12000 || fileSize > 1000000) {
				System.out.println("REMOVING FILE: " + files[i]);
				files[i].delete();
			}
        }

    }
}