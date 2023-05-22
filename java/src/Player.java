public class Player {
	private String name;
	private int number;
	private String position;
	private String[] additional_position;

	public Player (String name, int number, String position, String[] additional_position) {
		this.name = name;
		this.number = number;
		this.position = position;
		this.additional_position = additional_position;
	}

	public Player (String name, int number, String position) {
		this.name = name;
		this.number = number;
		this.position = position;
	}

	public void setName (String name) {
		this.name = name;
	}
	
	public void setNumber (int number) {
		this.number = number;
	}

	public void setPosition (String position) {
		this.position = position;
	}

	public void setAdditionalPosition (String[] additional_position) {
		this.additional_position = additional_position;
	}

	public String getName () {
		return this.name;
	}

	public int getNumber () {
		return this.number;
	}

	public String getPosition () {
		return this.position;
	}

	public String[] setAdditionalPosition () {
		return this.additional_position;
	}
}
