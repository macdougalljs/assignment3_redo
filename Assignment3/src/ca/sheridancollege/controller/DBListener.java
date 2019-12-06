package ca.sheridancollege.controller;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextAttributeEvent;
import javax.servlet.ServletContextAttributeListener;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.ServletRequestAttributeEvent;
import javax.servlet.ServletRequestAttributeListener;
import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;
import javax.servlet.annotation.WebListener;

import ca.sheridancollege.model.Student;

/**
 * Application Lifecycle Listener implementation class DBListener
 *
 */
@WebListener
public class DBListener implements ServletContextListener, ServletContextAttributeListener, ServletRequestListener,
		ServletRequestAttributeListener {

	/**
	 * Default constructor.
	 */
	public DBListener() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see ServletContextAttributeListener#attributeAdded(ServletContextAttributeEvent)
	 */
	public void attributeAdded(ServletContextAttributeEvent scae) {

		Student student = new Student();
		System.out.println("Listener AttributeAdded activated!");
		// get the context
		ServletContext context = scae.getServletContext();

		// get the DBconnection info from the context
		DBConnect conn = (DBConnect) context.getAttribute("dbConnection");

		// create new DataAccess object
		DataAccess dao = new DataAccess();

		if (scae.getName().equals("sid")) {
			// look up student in database, if they exist create a studentObj in context
			// otherwise
			// create a null student object in context

			student = dao.getRow(conn.getConnect(), (Integer) scae.getValue());

			// set the studentobj object into the context

			context.setAttribute("studentObj", student);
			System.out.println("Received 'sid',  created the studentid in context!");

		} else

		if (scae.getName().equals("writeStudentObj")) {
			// write into database

			student = (Student) context.getAttribute(scae.getName());

			boolean added = dao.modifyRow(conn.getConnect(), student);
			if (added) {
				System.out.println("Received 'writeStudentObj',Student modified and written to database via listener!");
			}

		} else if (scae.getName().equals("studentObj")) {
			// if it exists in the context, put it into the student object

			student = (Student) context.getAttribute("studentObj"); // is it in the context yet?
			System.out.println("received studentObj, Stored the context of studentObj into student");

		} else if (scae.getName().equals("createStudentObj")) {
			student = (Student) context.getAttribute(scae.getName());

			boolean added = dao.insertRow(conn.getConnect(), student);

			if (added) {
				System.out.println("Received 'createStudentObj', Student created and added to database via listener!");
			} else if (scae.getName().equals("getStudentObj")) {
				student = dao.getRow(conn.getConnect(), (Integer) scae.getValue());
				context.setAttribute("studentObj", student);
				System.out.println("Received getStudentObj,  value: " + scae.getValue());
			}

		}

	}

	/**
	 * @see ServletRequestListener#requestDestroyed(ServletRequestEvent)
	 */
	public void requestDestroyed(ServletRequestEvent sre) {
		// TODO Auto-generated method stub
	}

	/**
	 * @see ServletContextAttributeListener#attributeRemoved(ServletContextAttributeEvent)
	 */
	public void attributeRemoved(ServletContextAttributeEvent scae) {
		// TODO Auto-generated method stub
	}

	/**
	 * @see ServletRequestAttributeListener#attributeRemoved(ServletRequestAttributeEvent)
	 */
	public void attributeRemoved(ServletRequestAttributeEvent srae) {
		// TODO Auto-generated method stub
	}

	/**
	 * @see ServletRequestListener#requestInitialized(ServletRequestEvent)
	 */
	public void requestInitialized(ServletRequestEvent sre) {
		// TODO Auto-generated method stub

	}

	/**
	 * @see ServletContextListener#contextDestroyed(ServletContextEvent)
	 */
	public void contextDestroyed(ServletContextEvent sce) {
		// TODO Auto-generated method stub

	}

	/**
	 * @see ServletRequestAttributeListener#attributeAdded(ServletRequestAttributeEvent)
	 */
	public void attributeAdded(ServletRequestAttributeEvent srae) {
		// TODO Auto-generated method stub
	}

	/**
	 * @see ServletRequestAttributeListener#attributeReplaced(ServletRequestAttributeEvent)
	 */
	public void attributeReplaced(ServletRequestAttributeEvent srae) {
		// TODO Auto-generated method stub
	}

	/**
	 * @see ServletContextAttributeListener#attributeReplaced(ServletContextAttributeEvent)
	 */
	public void attributeReplaced(ServletContextAttributeEvent scae) {
		// TODO Auto-generated method stub
	}

	/**
	 * @see ServletContextListener#contextInitialized(ServletContextEvent)
	 */
	public void contextInitialized(ServletContextEvent sce) {
		// TODO Auto-generated method stub

		// This is where we need to put the stuff, it's run once only

		// gets driver info from context
		String driver = sce.getServletContext().getInitParameter("dbDriver");
		String url = sce.getServletContext().getInitParameter("dbConnect");

		// gets user login info from context
		String username = sce.getServletContext().getInitParameter("dbUsername");
		String password = sce.getServletContext().getInitParameter("dbPassword");

		// creates db connection
		DBConnect d = new DBConnect(driver, url, username, password);
		sce.getServletContext().setAttribute("dbConnection", d);

	}

}
