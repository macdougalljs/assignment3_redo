package ca.sheridancollege.model;

public class Student {
	int studentID;
	String lastName;
	String firstName;
	int q1, q2, q3, q4;
	int a1, a2, a3;
	int midTermExam, finalExam;

	public Student(int studentID, String lastName, String firstName, int q1, int q2, int q3, int q4, int a1, int a2,
			int a3, int midTermExam, int finalExam) {
		super();
		this.studentID = studentID;
		this.lastName = lastName;
		this.firstName = firstName;
		this.q1 = q1;
		this.q2 = q2;
		this.q3 = q3;
		this.q4 = q4;
		this.a1 = a1;
		this.a2 = a2;
		this.a3 = a3;
		this.midTermExam = midTermExam;
		this.finalExam = finalExam;
	}

	public Student() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getFinalGrade() {

		// calculate the grades
		double finQuiz = (this.q1* 0.025) + (this.q2 * 0.025) + (this.q3 * 0.025) + (this.q4 * 0.025);
		double finAssignments = (this.a1 * 0.10) + (this.a2 * 0.10) + (this.a3 * 0.10);
		double finMidterm = (this.midTermExam * 0.30);
		double finExam = (this.finalExam * 0.30);
		

		int finalGrade = (int) (finQuiz + finAssignments + finMidterm + finExam);
		return finalGrade;
	}

	/**
	 * @return the studentID
	 */
	public int getStudentID() {
		return studentID;
	}

	/**
	 * @param studentID the studentID to set
	 */
	public void setStudentID(int studentID) {
		this.studentID = studentID;
	}

	/**
	 * @return the lastName
	 */
	public String getLastName() {
		return lastName;
	}

	/**
	 * @param lastName the lastName to set
	 */
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	/**
	 * @return the firstName
	 */
	public String getFirstName() {
		return firstName;
	}

	/**
	 * @param firstName the firstName to set
	 */
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	/**
	 * @return the q1
	 */
	public int getQ1() {
		return q1;
	}

	/**
	 * @param q1 the q1 to set
	 */
	public void setQ1(int q1) {
		this.q1 = q1;
	}

	/**
	 * @return the q2
	 */
	public int getQ2() {
		return q2;
	}

	/**
	 * @param q2 the q2 to set
	 */
	public void setQ2(int q2) {
		this.q2 = q2;
	}

	/**
	 * @return the q3
	 */
	public int getQ3() {
		return q3;
	}

	/**
	 * @param q3 the q3 to set
	 */
	public void setQ3(int q3) {
		this.q3 = q3;
	}

	/**
	 * @return the q4
	 */
	public int getQ4() {
		return q4;
	}

	/**
	 * @param q4 the q4 to set
	 */
	public void setQ4(int q4) {
		this.q4 = q4;
	}

	/**
	 * @return the a1
	 */
	public int getA1() {
		return a1;
	}

	/**
	 * @param a1 the a1 to set
	 */
	public void setA1(int a1) {
		this.a1 = a1;
	}

	/**
	 * @return the a2
	 */
	public int getA2() {
		return a2;
	}

	/**
	 * @param a2 the a2 to set
	 */
	public void setA2(int a2) {
		this.a2 = a2;
	}

	/**
	 * @return the a3
	 */
	public int getA3() {
		return a3;
	}

	/**
	 * @param a3 the a3 to set
	 */
	public void setA3(int a3) {
		this.a3 = a3;
	}

	/**
	 * @return the midTermExam
	 */
	public int getMidTermExam() {
		return midTermExam;
	}

	/**
	 * @param midTermExam the midTermExam to set
	 */
	public void setMidTermExam(int midTermExam) {
		this.midTermExam = midTermExam;
	}

	/**
	 * @return the finalExam
	 */
	public int getFinalExam() {
		return finalExam;
	}

	/**
	 * @param finalExam the finalExam to set
	 */
	public void setFinalExam(int finalExam) {
		this.finalExam = finalExam;
	}

	@Override
	public String toString() {
		return "Student [studentID=" + studentID + ", lastName=" + lastName + ", firstName=" + firstName + ", q1=" + q1
				+ ", q2=" + q2 + ", q3=" + q3 + ", q4=" + q4 + ", a1=" + a1 + ", a2=" + a2 + ", a3=" + a3
				+ ", midTermExam=" + midTermExam + ", finalExam=" + finalExam + "]";
	}

}
