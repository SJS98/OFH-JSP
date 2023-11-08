package orderfromhere.dto;

import java.util.Properties;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

@Entity
public class Branch {
	
	@Id
	@GeneratedValue(generator = "gen_seq" )
	@SequenceGenerator(initialValue = 10, allocationSize = 5, name = "gen_seq")
	private int id;
	
	private String name;
	
	private String address;
	
	@Column(unique = true, nullable = false)
	private long phone;
	
	
	public int getId() {
		Class.forName(name)
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public long getPhone() {
		return phone;
	}

	public void setPhone(long phone) {
		this.phone = phone;
	}
}
