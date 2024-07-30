package employeeManagementSystem;

public class Employee {
	int empId;
	String empName;
	String position;
	int salary;
	Employee(int empId,String empName,String position,int salary){
		this.empId=empId;
		this.empName=empName;
		this.position=position;
		this.salary=salary;
	}
	public String toString()
	{
		return "empId = "+empId+"\nempName = "+empName+"\nposition = "+position+"\nsalary = "+salary;
	}
	public int getEmpId()
	{
		return this.empId;
	}
}
