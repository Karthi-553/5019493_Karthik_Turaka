package taskManagementSystem;

import java.util.Scanner;

public class Task {

    int taskId;
    String taskName;
    String status;
    Task next;
    public Task(int taskId, String taskName, String status,Task next) {
        this.taskId = taskId;
        this.taskName = taskName;
        this.status = status;
        this.next=null;
    }
    void travers(Task task){
        if(task==null)
            return;
        task.display();
        task.travers(task.next);
    }
    Task add(Task task,Task head)
    {   
        if(head==null)
            return task;
        Task pointer=head;
        while(pointer.next!=null)
            pointer=pointer.next;
        pointer.next=task;
        return head;
    }
    Task search(Task head,int id)
    {
        Task pointer=head;
        while(pointer.taskId!=id)
            pointer=pointer.next;
        return pointer;
    }
    Task delete(Task head,int id)
    {
        if(head.taskId==id)
            return head.next;
        Task pointer=head;
        while(pointer.next!=null&&pointer.next.taskId!=id)
            pointer=pointer.next;
        if(pointer.next==null)
            return head;
        pointer.next=pointer.next.next;
        return head;
    }
    void display()
    {
        System.out.println("Task Id     :"+this.taskId);
        System.out.println("Task Name   : "+this.taskName);
        System.out.println("Task status :"+this.status+"\n");
    }
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        Task head = null;
        int op;
        do{
            System.out.println("1.add\n2.search \n3.traverse\n4.delete");
            System.out.print("Enter your choice : ");
            switch (op=sc.nextInt()) {
                case 1: {
                    System.out.print("Enter Task Id :");
                    int id=sc.nextInt();
                    System.out.print("Enter Task Name : ");
                    String name=sc.next();
                    System.out.print("Enter Task status : ");
                    String status=sc.next();
                    Task task = new Task(id, name, status, head);
                    head=task.add(task, head);}
                    break;
                case 2 : {
                    System.out.println("Enter Task Id to search : ");
                    Task task = head.search(head, sc.nextInt());
                    if (task==null) 
                        System.out.println("Task not found");
                    else
                        task.display();}
                    break;
                case 3 : {
                    if(head==null)
                        {
                            System.out.println("Empty list");
                            break;
                        }
                    System.out.println("Task details :");
                    head.travers(head);}
                    break;
                case 4 : {
                    System.out.print("Enter id to delete : ");
                   head= head.delete(head, sc.nextInt());
                }break;
            }
        }while(op<5);
    }
}