package ca.sheridancollege.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import ca.sheridancollege.model.Student;

public class DataAccess {

	/* This class will retrieve the Student Object from the database */

	@SuppressWarnings("finally")

	/* This method will insert a new row into the table */

	public boolean insertRow(Connection conn, Student student) {
		boolean success = false;

		// declare JDBC objects
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			String sql = "INSERT INTO PROG32758(StudentID, LastName, FirstName, Q1, Q2, Q3, Q4, "
					+ "A1, A2, A3, MidtermExam, FinalExam) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";

			// initially set the main student information

			ps = conn.prepareStatement(sql);
			ps.setInt(1, student.getStudentID());
			ps.setString(2, student.getLastName());
			ps.setString(3, student.getFirstName());
			// and then get the Quiz grades

			ps.setInt(4, student.getQ1());
			ps.setInt(5, student.getQ2());
			ps.setInt(6, student.getQ3());
			ps.setInt(7, student.getQ4());
			// get the assignment grades

			ps.setInt(8, student.getA1());
			ps.setInt(9, student.getA2());
			ps.setInt(10, student.getA3());

			// finally get exams
			ps.setInt(11, student.getMidTermExam());
			ps.setInt(12, student.getFinalExam());

			int count = ps.executeUpdate();
			if (count > 0) {
				success = true;
			}
		} catch (SQLException e) {
		} finally {
			DBConnect.closeJDBCObjects(conn, ps, rs);
			return success;
		}
	}

	/*
	 * this method will load a student from the table if they exist and return it as
	 * a student object
	 */

	@SuppressWarnings("finally")
	public Student getRow(Connection conn, int sid) {
		Student student = null;

		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			String sql = "SELECT * FROM PROG32758 WHERE StudentID = ?";

			ps = conn.prepareStatement(sql);

			ps.setInt(1, sid);
			rs = ps.executeQuery();
			while (rs.next()) {
				/*
				 * TODO: In this section I need to convert all of the values in the record to
				 * variables, probably strings or ints
				 */

				int studentId = rs.getInt("StudentID");
				String lastName = rs.getString("LastName");
				String firstName = rs.getString("FirstName");
				int q1 = rs.getInt("Q1");
				int q2 = rs.getInt("Q2");
				int q3 = rs.getInt("Q3");
				int q4 = rs.getInt("Q4");
				int a1 = rs.getInt("A1");
				int a2 = rs.getInt("A2");
				int a3 = rs.getInt("A3");
				int midTermExam = rs.getInt("MidtermExam");
				int finalExam = rs.getInt("FinalExam");

				// And then initialize the return student variable
				student = new Student(studentId, firstName, lastName, q1, q2, q3, q4, a1, a2, a3, midTermExam,
						finalExam);
			}
		} catch (SQLException e) {
			System.err.println("SQLException: " + e.getMessage());
		} finally {
			DBConnect.closeJDBCObjects(conn, ps, rs);
			return student;
		}
	}

	/* This method will update an existing row in the table */

	@SuppressWarnings("finally")
	public boolean modifyRow(Connection conn, Student student) {
		boolean success = false;

		// declare JDBC objects
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {

			String sql = "UPDATE Prog32758 "
					+ "SET LastName = ?, FirstName = ?, Q1=?, Q2=?, Q3=?, Q4=?, A1=?, A2=?, A3=?, MidtermExam=?, FinalExam=? "
					+ "WHERE StudentID = ?";

			// initially set the main student information

			ps = conn.prepareStatement(sql);

			ps.setString(1, student.getLastName());
			ps.setString(2, student.getFirstName());
			// and then get the Quiz grades

			ps.setInt(3, student.getQ1());
			ps.setInt(4, student.getQ2());
			ps.setInt(5, student.getQ3());
			ps.setInt(6, student.getQ4());
			// get the assignment grades

			ps.setInt(7, student.getA1());
			ps.setInt(8, student.getA2());
			ps.setInt(9, student.getA3());

			// finally get exams
			ps.setInt(10, student.getMidTermExam());
			ps.setInt(11, student.getFinalExam());
			ps.setInt(12, student.getStudentID());

			int count = ps.executeUpdate();
			if (count > 0) {
				success = true;
			}
		} catch (SQLException e) {
		} finally {
			DBConnect.closeJDBCObjects(conn, ps, rs);
			return success;
		}
	}
}
