package VinMart.dao;

import java.sql.ResultSet;
import java.util.HashMap;
import java.util.List;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Repository;

import VinMart.entities.ConnectionToDB;
import VinMart.entities.Customers;
import VinMart.entities.Employees;
import VinMart.entities.MapperCustomers;
import VinMart.entities.MapperEmployees;
import VinMart.entities.MapperUsers;
import VinMart.entities.Users;

import java.util.Properties;
import java.util.Random;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
@Repository
public class UserDao extends BaseDao {

//	public int AddAccount(Users user) {
//		String sql = "INSERT INTO Admin (email,password,name,sdt,id_role) VALUES (?,?,?,?,?)";
//		int count = _jdbcTemplate.update(sql,
//				new Object[] { user.getEmail(), user.getPassword(), user.getName(), user.getSdt(), "2" });
//		return count;
//	}
//
//	public Users GetUserByAccount(Users user) {
//		String sql = "SELECT * FROM Admin WHERE email='" + user.getEmail() + "'";
//		Users result = _jdbcTemplate.queryForObject(sql, new MapperUsers());
//		return result;
//	}
//
//	public List<Users> GetAllUser() {
//		String sql = "SELECT * FROM Admin";
//		List<Users> list = _jdbcTemplate.query(sql, new MapperUsers());
//		return list;
//	}
//
//	public Users GetUserById(int id) {
//		String sql = "SELECT * FROM Admin WHERE id = ?";
//		Users result = _jdbcTemplate.queryForObject(sql, new MapperUsers(), id);
//		return result;
//	}
//

//
//	public void save(Users user) {
//		String sql = "INSERT INTO Admin (password,name, sdt) VALUES (?, ?,?)";
//		_jdbcTemplate.update(sql, user.getPassword(), user.getName(), user.getSdt());
//	}
//
	public Users GetUserByAccount(Users user) {
		try {
			String sql = "SELECT * FROM users WHERE users_email='" + user.getUsers_email() + "'";
			Users result = _jdbcTemplate.queryForObject(sql, new MapperUsers());
			return result;
		} catch (EmptyResultDataAccessException e) {
			// Không tồn tại username
			return null;
		}
	}

	public int AddAccount(Users user, Customers customer) {
		try {
			StringBuffer sql = new StringBuffer();
			sql.append("declare @userid int ");
			sql.append(" SET IDENTITY_INSERT KHACHHANG ON ");
			sql.append(" SET IDENTITY_INSERT Users OFF ");
			sql.append("INSERT ");
			sql.append("INTO users ");
			sql.append("( ");
			sql.append("	users_email, ");
			sql.append("	users_password, ");
			sql.append("	role_id ");
			sql.append(") ");
			sql.append("VALUES ");
			sql.append("( ");
			sql.append("	'" + user.getUsers_email() + "', ");
			sql.append("	'" + user.getUsers_password() + "', ");
			sql.append("	" + "3");
			sql.append(") ");
			sql.append("select @userid = SCOPE_IDENTITY() ");
			sql.append("INSERT ");
			sql.append("INTO KHACHHANG ");
			sql.append("( ");
			sql.append("	khachhang_id, ");
			sql.append("	khachhang_name, ");
			sql.append("	khachhang_sdt, ");
			sql.append("	khachhang_gioitinh ");
			sql.append(") ");
			sql.append("VALUES ");
			sql.append("( ");
			sql.append("	" + "@userid" + ", ");
			sql.append("	'" + customer.getName() + "', ");
			sql.append("	'" + customer.getSdt() + "', ");
			sql.append("	'" + customer.isGioitinh());
			sql.append("')");
			int insert = _jdbcTemplate.update(sql.toString());
			return insert;
		} catch (Exception e) {
			return 0;
		}

	}
	public boolean AddEmployee(Users user, Employees employee) {
		try {
			StringBuffer sql = new StringBuffer();
			sql.append("declare @userid int ");
			sql.append("SET IDENTITY_INSERT NHANVIEN ON ");
		
			sql.append("INSERT ");
			sql.append("INTO users ");
			sql.append("( ");
			sql.append("	users_email, ");
			sql.append("	users_password, ");
			sql.append("	role_id ");
			sql.append(") ");
			sql.append("VALUES ");
			sql.append("( ");
			sql.append("	'" + user.getUsers_email() + "', ");
			sql.append("	'" + user.getUsers_password() + "', ");
			sql.append("	" + user.getRole_id());
			sql.append(") ");
			sql.append("select @userid = SCOPE_IDENTITY() ");
			sql.append("INSERT ");
			sql.append("INTO NHANVIEN ");
			sql.append("( ");
			sql.append("	nhanvien_id, ");
			sql.append("	nhanvien_name, ");
			sql.append("	nhanvien_sdt, ");
			sql.append("	status, ");
			sql.append("	nhanvien_gioitinh ");
			sql.append(") ");
			sql.append("VALUES ");
			sql.append("( ");
			sql.append("	" + "@userid" + ", ");
			sql.append("	'" + employee.getName() + "', ");
			sql.append("	'" + employee.getSdt() + "', ");
			sql.append("	'1', ");
			sql.append("	'" + employee.isGioitinh());
			sql.append("')");
			_jdbcTemplate.update(sql.toString());
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public boolean AddCustomer(Users user, Customers customer) {
		try {
			StringBuffer sql = new StringBuffer();
			sql.append("declare @userid int ");
			sql.append("SET IDENTITY_INSERT KHACHHANG ON ");
			
			sql.append("INSERT ");
			sql.append("INTO users ");
			sql.append("( ");
			sql.append("	users_email, ");
			sql.append("	users_password, ");
			sql.append("	role_id ");
			sql.append(") ");
			sql.append("VALUES ");
			sql.append("( ");
			sql.append("	'" + user.getUsers_email() + "', ");
			sql.append("	'" + user.getUsers_password() + "', ");
			sql.append("	" + "3");
			sql.append(") ");
			sql.append("select @userid = SCOPE_IDENTITY() ");
			sql.append("INSERT ");
			sql.append("INTO KHACHHANG ");
			sql.append("( ");
			sql.append("	khachhang_id, ");
			sql.append("	khachhang_name, ");
			sql.append("	khachhang_sdt, ");
			sql.append("	khachhang_gioitinh ");
			sql.append(") ");
			sql.append("VALUES ");
			sql.append("( ");
			sql.append("	" + "@userid" + ", ");
			sql.append("	'" + customer.getName() + "', ");
			sql.append("	'" + customer.getSdt() + "', ");
			sql.append("	'" + customer.isGioitinh());
			sql.append("')");
			_jdbcTemplate.update(sql.toString());
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public List<Users> GetAllUser() {
		String sql = "SELECT * FROM users";

		List<Users> list = _jdbcTemplate.query(sql, new MapperUsers());
		System.out.println("list user  " + list.toString());
		return list;
	}

	public List<Customers> GetAllCustomers() {
		String sql = "SELECT * FROM KHACHHANG";
		List<Customers> list = _jdbcTemplate.query(sql, new MapperCustomers());
		System.out.println("list kh  " + list);
		return list;
	}

	public List<Employees> GetAllEmployees() {
		String sql = "SELECT * FROM NHANVIEN where status !='0'";
		List<Employees> list = _jdbcTemplate.query(sql, new MapperEmployees());
		System.out.println("list nv " + list);
		return list;
	}
	
	public Users GetUserById(int id) {
		String sql = "SELECT * FROM users WHERE users_id = ?";
		Users result = _jdbcTemplate.queryForObject(sql, new MapperUsers(), id);
		return result;
	}

	public Customers GetCustomerById(int id) {
		String sql = "SELECT * FROM KHACHHANG WHERE khachhang_id = ?";
		Customers result = _jdbcTemplate.queryForObject(sql, new MapperCustomers(), id);
		return result;
	}

	public Employees GetEmployeeById(int id) {
		String sql = "SELECT * FROM NHANVIEN WHERE nhanvien_id = ?";
		Employees result = _jdbcTemplate.queryForObject(sql, new MapperEmployees(), id);
		return result;
	}
	
	

	public boolean updateCustomer(Customers customers) {
		try {
			String sql = "UPDATE KHACHHANG SET khachhang_gioitinh ='" + customers.isGioitinh() + "', khachhang_sdt ='"
					+ customers.getSdt() + "', khachhang_name= '" + customers.getName() + "' WHERE khachhang_id = '"
					+ customers.getId() + "'";
			_jdbcTemplate.update(sql);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public boolean updateEmployee(Employees employees) {
		try {
			String sql = "UPDATE NHANVIEN SET nhanvien_gioitinh ='" + employees.isGioitinh() + "', nhanvien_sdt ='"
					+ employees.getSdt() + "', nhanvien_name= '" + employees.getName() + "' WHERE nhanvien_id = '"
					+ employees.getId() + "'";
			_jdbcTemplate.update(sql);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	//xóa nhân viên (chuyển trạng thái từ 1 sang 0
	public boolean deleteEmployee(int  id) {
		try {
			String sql = "UPDATE NHANVIEN SET status ='0' WHERE nhanvien_id = '"
					+ id + "'";
			_jdbcTemplate.update(sql);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	//xóa khách hàng
	public boolean deleteCustomer(int  id) {
		try {
			String sql = "DELETE FROM KHACHHANG WHERE khachhang_id = '"
					+ id + "'";
			_jdbcTemplate.update(sql);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	
	
	
	public boolean update(Users user) {
		try {
			String sql = "UPDATE users SET users_password = '" + user.getUsers_password() 
			+ "',role_id='" +user.getRole_id() +"'  WHERE users_id = '"
					+ user.getUsers_id() + "'";
			_jdbcTemplate.update(sql);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	//xóa user
		public boolean delete(int id) {
			System.out.println("id " + id);
			try {
				String sql = "DELETE FROM Users WHERE users_id = '"
						+ id + "'";
				_jdbcTemplate.update(sql);
				return true;
			} catch (Exception e) {
				return false;
			}
		}
	
	//cap nhap password khi thay doi
	public boolean updatePassword(Users u) {
		try {
			System.out.println("email nhap vao" + u.getUsers_email());
			System.out.println("password moi nhap vao" + u.getUsers_password());
			new  ConnectionToDB().excuteSql("update users set users_password='"+u.getUsers_password()+"' where users_email='"+ u.getUsers_email()+"'");
			
			return true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return false;
	}
	//code very random
    public String getRandom() {
        Random rnd = new Random();
        int number = rnd.nextInt(999999);
        return String.format("%06d", number);
    }

    //gui mail den mail cua user
    public boolean sendEmail(String email, String code) {
        boolean test = false;
        
        String toEmail = email;
        System.out.println("toEmail = " + toEmail );
        try {

        	Properties props = new Properties();
        	props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.socketFactory.port", "587");
            props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            props.put("mail.smtp.port", "587");
            

            Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication("contact.cgv4@gmail.com", "hoangminhtuan");
                }
            });

            //set email message details
            Message mess = new MimeMessage(session);

    		//set from email address
            mess.setFrom(new InternetAddress("contact.cgv4@gmail.com"));
    		//set to email address or destination email address
            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
    		
    		//set email subject
            mess.setSubject("User Email Verification");
            System.out.println(code);
    		//set message text
            mess.setText("VinMart hello,"
            		+ "Click the link to change the password: "  + 
            		" http://localhost:8080/VinMart/do-forgot-password/" +code +"/" +email );
            
            //send the message
            Transport.send(mess);
            
            test=true;
            
        } catch (Exception e) {
            e.printStackTrace();
        }

        return test;
    }
    
    //lay email de check dieu kien
    public static HashMap<String, Users> checkemail(){
		HashMap<String , Users> mapTemp = new HashMap<String, Users>();
		try {
			ResultSet rs = new ConnectionToDB().selectData("select * from users");
			while(rs.next()) {
				
				int users_id =rs.getInt(1);
				String users_email= rs.getString(2);
				String users_password= rs.getString(3);
				int role_id= rs.getInt(4);
			
				Users user = new Users(users_id, users_email,users_password,role_id);
				mapTemp.put(users_email,user);
				
			}
			return mapTemp;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} 
		
	}
	
	public boolean checkEmail(String email)
	{
		Users user = UserDao.checkemail().get(email);
		
		if(user!=null)
		{
				if(user.getUsers_email().equals(email)) {
					
					return true;
				}
				else {
					return false;
					
				}
		}else
		{
			return false;
		}
			
	}
}
