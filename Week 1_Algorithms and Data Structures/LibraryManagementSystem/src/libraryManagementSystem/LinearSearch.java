package libraryManagementSystem;
import java.util.List;
public class LinearSearch {
 private List<Book> books;

 public LinearSearch(List<Book> books) {
     this.books = books;
 }

 public Book searchByTitle(String title) {
     for (Book book : books) {
         if (book.getTitle().equalsIgnoreCase(title)) {
             return book;
         }
     }
     return null; 
 }
}

