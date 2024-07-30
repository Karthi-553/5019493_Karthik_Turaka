package factoryMethodPatternExample;

public class ExcelDocumnet extends Document {
    public void open() {
        System.out.println("Opening Excel document.");
    }
    public void save() {
        System.out.println("Saving Excel document.");
    }
    public void close() {
        System.out.println("Closing Excel document.");
    }
}