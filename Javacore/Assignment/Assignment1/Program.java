package Assignment1;

import java.time.LocalDate;

public class Program {

	public static void main(String[] args) {
			Department department1=new Department(1,"sale");
			Department department2=new Department(2,"marketing");
			Department department3=new Department(3,"accounting");
			System.out.println("Thong tin phong ban");
			System.out.println("ID"+"  "+"Name");
			System.out.println(department1.id+"  "+department1.name+"\n"+department2.id+"  "+department2.name+"\n"+department3.id+"  "+department3.name);
			System.out.println("\n");
			
			Position position1=new Position(1,"dev");
			Position position2=new Position(2,"Test");
			Position position3=new Position(3,"scrum");
			System.out.println("Thong tin vi tri");
			System.out.println("ID"+"  "+"Name");
			System.out.println(position1.id+"  "+position2.name+"\n"+position2.id+"  "+position2.name+"\n"+position3.id+"  "+position3.name);
			System.out.println("\n");
			
			Group group1 = new Group();
			group1.id = 1;
			group1.name = "hoc tap";
			group1.createdate=LocalDate.now();

			Group group2 = new Group();
			group2.id = 2;
			group2.name = "nghien cuu";
			group2.createdate=LocalDate.now();
			System.out.println("thong tin nhom");
			System.out.println("id"+" "+"name"+" "+"createdate");
			System.out.println(group1.id+" "+group1.name+" "+group1.createdate);
			System.out.println(group2.id+" "+group2.name+" "+group2.createdate);
			System.out.println("\n");
			
			Account account1 = new Account();
     		account1.id = 1;
			account1.email = "lananh@gmail.com";
			account1.username = "lanheo";
			account1.fullname = "Nguyen Lan Anh";
			account1.department = department1;
			account1.position = position1;
			account1.createdate = LocalDate.now();
			account1.group  = new Group[] { group1, group2 };


			Account account2 = new Account();
			account2.id = 2;
     		account2.email = "lehuy@gmail.com";
			account2.username = "huyasd";
			account2.fullname = "Le Anh Huy";
			account2.department = department2;
			account2.position = position2;
			account2.createdate = LocalDate.now();
			account2.group = new Group[] { group1 };

			
			System.out.println("Thong tin tai khoan ");
			System.out.println("id"+"    "+"email"+"        "+"username"+"  "+"fullname"+"     "+"departmentName"+"  "+"positionName"+"  "+"createdate");
            System.out.println(account1.id+"  "+account1.email+"  "+account1.username+"  "+account1.fullname+"   "+account1.department.name+"          "+account1.position.name+"         "+account1.createdate);
            System.out.println(account2.id+"  "+account2.email+"  "+account2.username+"  "+account2.fullname+"     "+account2.department.name+"        "+account2.position.name+"         "+account2.createdate);
	}
}