package spring.test.bit;

public class TestDto {
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getHp() {
		return hp;
	}

	public void setHp(String hp) {
		this.hp = hp;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	private String name;
	private String hp;
	private String addr;

	public TestDto() {
		
	}

	public TestDto(String name, String hp, String addr) {
		super();
		this.name = name;
		this.hp = hp;
		this.addr = addr;
	}
	
}
