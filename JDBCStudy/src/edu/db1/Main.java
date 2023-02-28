package edu.db1;

public class Main {

	public static void main(String[] args) throws Exception {

		Database db1 = new H2("jdbc:h2:tcp://localhost/~/musthave", "sa", "");
		Database db2 = new MySQL("jdbc:mysql://localhost:3306/musthave", "musthave", "tiger");

		System.out.println("<=== StudyStatement1 ===>");
		db1.StudyStatement1();
		System.out.println();

		System.out.println("<=== StudyStatement2 ===>");
		db1.StudyStatement2();
		
		System.out.println();
		
		System.out.println("<=== StudyStatement1 ===>");
		db2.StudyStatement1();
		System.out.println();

		System.out.println("<=== StudyStatement2 ===>");
		db2.StudyStatement2();
	}
}