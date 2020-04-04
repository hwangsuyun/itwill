package com.itwill.coffee;

import java.io.Serializable;

import android.R.string;

public class Cafe implements Serializable{
	private int _id;
	private String cafe_name;
	private String cafe_location;
	private String cafe_phone;

	public Cafe() {
		// TODO Auto-generated constructor stub
	}

	public Cafe(int _id, String cafe_name, String cafe_location,
			String cafe_phone) {
		super();
		this._id = _id;
		this.cafe_name = cafe_name;
		this.cafe_location = cafe_location;
		this.cafe_phone = cafe_phone;
	}

	public int get_id() {
		return _id;
	}

	public void set_id(int _id) {
		this._id = _id;
	}

	public String getCafe_name() {
		return cafe_name;
	}

	public void setCafe_name(String cafe_name) {
		this.cafe_name = cafe_name;
	}

	public String getCafe_location() {
		return cafe_location;
	}

	public void setCafe_location(String cafe_location) {
		this.cafe_location = cafe_location;
	}

	public String getCafe_phone() {
		return cafe_phone;
	}

	public void setCafe_phone(String cafe_phone) {
		this.cafe_phone = cafe_phone;
	}

	

}
