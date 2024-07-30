package sortingCustomersOrders;

public class Main {
	public static void main(String args[])
	{
		Order orders[]={new Order(3,"sumit",8000),
				new Order(4,"geeta",10000),
				new Order(1,"ram",11000),
				new Order(2,"raju",4000)};
		System.out.println("After BubbleSort:");
		orders=BubbleSort.bubbleSort(orders);
		for(int i=0;i<orders.length;i++)
		{
			System.out.println(orders[i]);
		}
		Order orders1[]={new Order(3,"Vinod",8000),
				new Order(4,"Danush",10000),
				new Order(1,"Surya",11000),
				new Order(2,"Siva",4000)};
		QuickSort.sort(orders1, 0, orders1.length-1);
		System.out.println("After QuickSort:");
		for(int i=0;i<orders1.length;i++)
		{
			System.out.println(orders1[i]);
		}
	}
}
