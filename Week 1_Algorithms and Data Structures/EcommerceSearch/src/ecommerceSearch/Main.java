package ecommerceSearch;
import java.util.*;
public class Main {
	public static void main(String[] args) {
        Product[] products = {
                new Product(1, "Laptop", "Electronics"),
                new Product(2, "Phone", "Electronics"),
                new Product(3, "Shirt", "Clothing"),
                new Product(4, "Shoes", "Footwear")
            };
            Product findUsingLinearSearch = LinearSearch.linearSearch(products,5);
            if(findUsingLinearSearch==null)
            {
            	System.out.println("Product not found.");
            }
            else
            {
            	System.out.println("Product found: " + findUsingLinearSearch.productName);
            }
            Arrays.sort(products, Comparator.comparing(Product::getProductName));

            Product foundProduct = BinarySearch.binarySearch(products, "Phone");
            if (foundProduct != null) {
                System.out.println("Product found: " + foundProduct.productName);
            } else {
                System.out.println("Product not found.");
            }
        }
}
