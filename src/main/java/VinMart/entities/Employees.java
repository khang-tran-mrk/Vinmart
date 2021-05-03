
package VinMart.entities;

public class Employees extends Person {
	private float HSL;

	public Employees(int id, String name, String sdt, String gioitinh, float hSL) {
		super();
		HSL = hSL;
	}

	public Employees() {
		super();
	}

	public float getHSL() {
		return HSL;
	}

	public void setHSL(float hSL) {
		HSL = hSL;
	}

}
