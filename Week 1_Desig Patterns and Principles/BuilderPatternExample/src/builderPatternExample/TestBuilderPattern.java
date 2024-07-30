package builderPatternExample;


public class TestBuilderPattern {
 public static void main(String[] args) {
     
     Computer basicComputer = new Computer.Builder("Intel i5", 8).build();
     System.out.println(basicComputer);
     
     Computer advancedComputer = new Computer.Builder("AMD Ryzen 7", 16).build();
     System.out.println(advancedComputer);
 }
}
