
package VinMart.entities;

public class Person {
	private int id;
	private String name;
	private String sdt;
	private String gioitinh;

	public Person(int id, String name, String sdt, String gioitinh) {
		super();
		this.id = id;
		this.name = name;
		this.sdt = sdt;
		this.gioitinh = gioitinh;
	}

	public Person() {
		super();
	}

	public int getId() {
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

	public String getSdt() {
		return sdt;
	}

	public void setSdt(String sdt) {
		this.sdt = sdt;
	}

	public String getGioitinh() {
		return gioitinh;
	}

	public void setGioitinh(String gioitinh) {
		this.gioitinh = gioitinh;
	}

}
