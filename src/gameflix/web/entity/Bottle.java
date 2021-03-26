package gameflix.web.entity;

public class Bottle {
	private String layer1;
	private String layer2;
	private String layer3;
	private String layer4;
	private String layer5 = "img/piece/cap.png";
	
	private String color_Layer1;
	private String color_Layer2;
	private String color_Layer3;
	private String color_Layer4;
	private String color_Layer5 = "white";
	
	public Bottle(String layer1, String layer2, String layer3, String layer4) {
		this.layer1 = layer1;
		this.layer2 = layer2;
		this.layer3 = layer3;
		this.layer4 = layer4;
	}

	public String getLayer1() {
		return layer1;
	}

	public void setLayer1(String layer1) {
		this.layer1 = layer1;
	}

	public String getLayer2() {
		return layer2;
	}

	public void setLayer2(String layer2) {
		this.layer2 = layer2;
	}

	public String getLayer3() {
		return layer3;
	}

	public void setLayer3(String layer3) {
		this.layer3 = layer3;
	}

	public String getLayer4() {
		return layer4;
	}

	public void setLayer4(String layer4) {
		this.layer4 = layer4;
	}

	public String getLayer5() {
		return layer5;
	}

	public void setLayer5(String layer5) {
		this.layer5 = layer5;
	}

	public String getColor_Layer1() {
		return color_Layer1;
	}

	public void setColor_Layer1(String color_Layer1) {
		this.color_Layer1 = color_Layer1;
	}

	public String getColor_Layer2() {
		return color_Layer2;
	}

	public void setColor_Layer2(String color_Layer2) {
		this.color_Layer2 = color_Layer2;
	}

	public String getColor_Layer3() {
		return color_Layer3;
	}

	public void setColor_Layer3(String color_Layer3) {
		this.color_Layer3 = color_Layer3;
	}

	public String getColor_Layer4() {
		return color_Layer4;
	}

	public void setColor_Layer4(String color_Layer4) {
		this.color_Layer4 = color_Layer4;
	}
	
	public String getColor_Layer5() {
		return color_Layer5;
	}

	public void setColor_Layer5(String color_Layer5) {
		this.color_Layer5 = color_Layer5;
	}

	public void setColors(String layer1, String layer2, String layer3, String layer4) {
		this.color_Layer1 = layer1;
		this.color_Layer2 = layer2;
		this.color_Layer3 = layer3;
		this.color_Layer4 = layer4;
	}
}
