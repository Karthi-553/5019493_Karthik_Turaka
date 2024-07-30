package builderPatternExample;


public class Computer {
 
 private String CPU;
 private int RAM;

 private Computer(Builder builder) {
     this.CPU = builder.CPU;
     this.RAM = builder.RAM;
 }


 public String toString() {
     return "Computer [CPU=" + CPU + ", RAM=" + RAM + "GB]";
 }

 public static class Builder {
    
     private String CPU;
     private int RAM;

     public Builder(String CPU, int RAM) {
         this.CPU = CPU;
         this.RAM = RAM;
     }

     public Computer build() {
         return new Computer(this);
     }
 }
}

