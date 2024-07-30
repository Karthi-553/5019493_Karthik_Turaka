package libraryManagementSystem;

import java.util.Arrays;
import java.util.List;

public class Main {
 public static void main(String[] args) {
     List<Book> books = Arrays.asList(
         new Book(1, "The Great Gatsby", "F. Scott Fitzgerald"),
         new Book(2, "To Kill a Mockingbird", "Harper Lee"),
         new Book(3, "1984", "George Orwell"),
         new Book(4, "Pride and Prejudice", "Jane Austen"),
         new Book(5, "Moby Dick", "Herman Melville")
     );

     LinearSearch linearSearch = new LinearSearch(books);
     Book foundBookLinear = linearSearch.searchByTitle("1984");
     System.out.println("Linear Search Result: " + (foundBookLinear != null ? foundBookLinear : "Book not found"));
     BinarySearch binarySearch = new BinarySearch(books);
     Book foundBookBinary = binarySearch.searchByTitle("1984");
     System.out.println("Binary Search Result: " + (foundBookBinary != null ? foundBookBinary : "Book not found"));
 }
}

