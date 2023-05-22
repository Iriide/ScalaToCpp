import java.io.*;

public class ParserRunner {

    public static void main(String[] args) {
        try {
            ProcessBuilder builder = new ProcessBuilder("out/production/ScalaToCpp/parser/myprogram");
            builder.redirectInput(new File("input.scala"));
            Process process = builder.start();

            BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
            String line;

            while ((line = reader.readLine()) != null) {
                System.out.println(line);
            }

            int exitCode = process.waitFor();
            System.out.println("\nExited with error code: " + exitCode);
        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
        }
    }
}
