package sortingCustomersOrders;

public class Order {
	int orderId;
	String customerName;
	int totalPrice;
	Order(int orderId,String customerName,int totalPrice){
		this.orderId=orderId;
		this.customerName=customerName;
		this.totalPrice=totalPrice;
	}
	public int getOrderId()
	{
		return orderId;
	}
	public String getCustomerName()
	{
		return customerName;
	}
	public int getTotalPrice()
	{
		return totalPrice;
	}
	public String toString() {
        return "orderId=" + orderId +"\ncustomerName=" + customerName +"\ntotalPrice=" + totalPrice ;
    }
}
