package factoryMethodPatternExample;
public class ExcelDocumentFactory extends DocumentFactory {
    public Document createDocument() {
        return new ExcelDocumnet();
    }
}