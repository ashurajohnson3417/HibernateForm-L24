
package cust.data.users;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class User {
	private int id;
	private String name;
	private String pass;
	private String email;
	private String fullname;
	
	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getPass() {
		return pass;
	}

	public String getEmail() {
		return email;
	}
	
	public String getFullname() {
		return fullname;
	}
	
	public void setId(int id) {
		this.id = id;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setPass(String pass) throws NoSuchAlgorithmException {
		MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(pass.getBytes());
        
        byte byteData[] = md.digest();
 
        //convert the byte to hex format method 1
        StringBuffer sb = new StringBuffer();
        
        for (int i = 0; i < byteData.length; i++) 
        {
            sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
        }
        
        this.pass = sb.toString();
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
}
