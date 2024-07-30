package employeeManagementSystem;

public class Main {
	public static void main(String args[])
	{
		EmpDetailsOperation details=new EmpDetailsOperation(10);
		details.addEmployee(new Employee(2,"Gopi","Manager",100000));
		details.addEmployee(new Employee(3,"Suri","AsstManager",50000));
		details.addEmployee(new Employee(4,"Ram","Sales",20000));
		details.traverseEmployees();
		System.out.println(" deletion of Employee whose empid is 4 ");
		details.deleteEmployee(4);
		System.out.println("After deletion of Employee whose empid is 4 ");
		details.traverseEmployees();
	}
}
