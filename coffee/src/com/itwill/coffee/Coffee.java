package com.itwill.coffee;

import java.io.Serializable;

import android.R.string;

public class Coffee implements Serializable{
	private int _id;
	private String coffee_name;
	private String tall;
	private String grande;
	private String venti;
	private int image_resid;
	private String name;
	
	public Coffee() {
		// TODO Auto-generated constructor stub
	}
	public Coffee(int _id, String coffee_name, String tall, String grande, String venti){
		super();
		this._id=_id;
		this.coffee_name=coffee_name;
		this.tall=tall;
		this.grande=grande;
		this.venti=venti;
	}
	
	public Coffee(int image_resid, String name) {
		super();
		this.image_resid = image_resid;
		this.name = name;
	}



	public int get_id() {
		return _id;
	}
	public void set_id(int _id) {
		this._id = _id;
	}
	public String getCoffee_name() {
		return coffee_name;
	}
	public void setCoffee_name(String coffee_name) {
		this.coffee_name = coffee_name;
	}
	public String getTall() {
		return tall;
	}
	public void setTall(String tall) {
		this.tall = tall;
	}
	public String getGrande() {
		return grande;
	}
	public void setGrande(String grande) {
		this.grande = grande;
	}
	public String getVenti() {
		return venti;
	}
	public void setVenti(String venti) {
		this.venti = venti;
	}
	public int getImage_resid() {
		return image_resid;
	}

	public void setImage_resid(int image_resid) {
		this.image_resid = image_resid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
	
}
