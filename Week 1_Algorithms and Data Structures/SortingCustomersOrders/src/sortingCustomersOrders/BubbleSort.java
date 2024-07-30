package sortingCustomersOrders;

public class BubbleSort {
	public static Order[] bubbleSort(Order orders[])
	{
		for(int i=0;i<orders.length;i++)
		{
			for(int j=0;j<orders.length-i-1;j++)
			{
				if(orders[j].getTotalPrice()>orders[j+1].getTotalPrice())
				{
					Order tmp=orders[j];
					orders[j]=orders[j+1];
					orders[j+1]=tmp;
				}
			}
		}
		return orders;
	}
}
