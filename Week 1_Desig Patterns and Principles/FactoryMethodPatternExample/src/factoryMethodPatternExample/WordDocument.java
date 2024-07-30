package factoryMethodPatternExample;
public class WordDocument extends Document {
    public void open() {
        System.out.println("Opening Word document.");
    }

    public void save() {
        System.out.println("Saving Word document.");
    }

    public void close() {
        System.out.println("Closing Word document.");
    }
}