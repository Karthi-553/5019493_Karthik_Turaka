package inventoryManagementSystem;

public class Main {
	public static void main(String args[])
	{
		Inventory inventory = new Inventory();
	    inventory.addProduct(new Product(1, "Laptop", 10, 800));
	    inventory.addProduct(new Product(2, "Smartphone", 20, 500));
	    System.out.println("The products in the inventory are: ");
	    inventory.displayProducts();
	    inventory.updateProduct(new Product(1, "Laptop", 8, 780));
	    System.out.println("After Updating  products in the inventory are: ");
	    inventory.displayProducts();
	    inventory.deleteProduct(2);
	    System.out.println("After deleting  products in the inventory are: ");
	    inventory.displayProducts();
	}
}
