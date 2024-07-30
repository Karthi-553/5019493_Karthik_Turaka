package ecommerceSearch;

public class Product {
	int productId;
	String productName;
	String category;
	Product(int productId,String productName,String category){
		this.productId=productId;
		this.productName=productName;
		this.category=category; 
	}
	public int getProductId() {
		return this.productId;
	}
	public String getProductName() {
		return this.productName;
	}
}
