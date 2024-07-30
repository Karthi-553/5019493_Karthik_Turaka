package ecommerceSearch;

public class BinarySearch {
	 public static Product binarySearch(Product[] products, String targetName) {
	        int low = 0;
	        int high = products.length - 1;
	        
	        while (low <= high) {
	            int mid = (low + high) / 2;
	            Product midProduct = products[mid];
	            int comparison = midProduct.getProductName().compareTo(targetName);
	            
	            if (comparison == 0) {
	                return midProduct;
	            } else if (comparison < 0) {
	                low = mid + 1;
	            } else {
	                high = mid - 1;
	            }
	        }
	        return null;
	    }
}
