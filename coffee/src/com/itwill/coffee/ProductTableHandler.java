package com.itwill.coffee;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;

//Helper�� �ڵ��ϴ� Ŭ����
public class ProductTableHandler {

	private Context ctx;
	private productDBOpenHelper helper;
	private SQLiteDatabase db;//(Connection)
	private static ProductTableHandler _instance;
	
	//�����ڿ��� coffee��� db ����
	private ProductTableHandler(Context ctx) {
		this.ctx=ctx;
		this.helper=new productDBOpenHelper(ctx,"coffee.db",1);
		this.db=helper.getWritableDatabase();
	}
	public static ProductTableHandler open(Context ctx)
	throws SQLException{
		if(_instance==null){
			_instance=new ProductTableHandler(ctx);
		}
		return _instance;
	}
	public void close(){
		helper.close();
	}
	
	//product insert
	public long insert(String coffee_name,String tall,String grande,String venti){
		ContentValues values = new ContentValues();
		values.put("coffee_name", coffee_name);
		values.put("tall", tall);
		values.put("grande", grande);
		values.put("venti", venti);
		
		long result = db.insert("product", null, values);
		return result;
	}
	
	
	//query �̸����� ã��
	public Cursor queryByNameLike(String coffee_name) {
		
		Cursor cursor=db.rawQuery("select _id,coffee_name,tall,grande,venti from product " +
								  "where coffee_name like ?",
				new String[]{coffee_name+"%"});
		return cursor;
	}

	//cafe insert 
		public long CafeInsert(String cafe_name, String cafe_location, String cafe_phone){
			ContentValues values = new ContentValues();
			values.put("cafe_name", cafe_name);
			values.put("cafe_location", cafe_location);
			values.put("cafe_phone", cafe_phone);
			long result = db.insert("cafe", null, values);
			return result;
		}

		
		//query ī�� ��ü ã��
		public Cursor query(){
			Cursor cursor = db.query(true, "cafe", null, null, null, null, null, null, null);
			return cursor;
		}
}
