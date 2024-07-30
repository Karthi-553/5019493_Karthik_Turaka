package inventoryManagementSystem;
import java.util.*;
public class Product {
	int productId;
	String productName;
	int quantity;
	int price;
	Product(int productId,String productName,int quantity,int price){
		this.productId=productId;
		this.productName=productName;
		this.quantity=quantity;
		this.price= price;
	}
	 public int getProductId() {
	        return productId;
	    }

	    public void setProductId(int productId) {
	        this.productId = productId;
	    }

	    public String getProductName() {
	        return productName;
	    }

	    public void setProductName(String productName) {
	        this.productName = productName;
	    }

	    public int getQuantity() {
	        return quantity;
	    }

	    public void setQuantity(int quantity) {
	        this.quantity = quantity;
	    }

	    public double getPrice() {
	        return price;
	    }

	    public void setPrice(int price) {
	        this.price = price;
	    }

	    @Override
	    public String toString() {
	        return "productId=" + productId +"\nproductName=" + productName +"\nquantity=" + quantity +
	        		"\nprice=" + price ;
	    }
}
