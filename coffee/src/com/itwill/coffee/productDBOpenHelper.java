package com.itwill.coffee;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteDatabase.CursorFactory;
import android.database.sqlite.SQLiteOpenHelper;

//sqlite 생성을 도와주는 productDBOpenHelper(cafe,product 두개의 테이블 생성)
public class productDBOpenHelper extends SQLiteOpenHelper{
	Context context;
	String dbName;
	
	
	
	public productDBOpenHelper(Context context, String dbName, int version) {
		super(context, dbName, null, version);
		this.context=context;
		this.dbName=dbName;
		// TODO Auto-generated constructor stub
	}



	//테이블 생성(product, cafe)
	@Override
	public void onCreate(SQLiteDatabase db) {
		// TODO Auto-generated method stub
		try {
			String table_product=
					"CREATE TABLE product("+
					"_id INTEGER PRIMARY KEY AUTOINCREMENT,"+
					"coffee_name text," +
					"tall text," +
					"grande text," +
					"venti text)";
					db.execSQL(table_product);
					
			String table_cafe=
					"CREATE TABLE cafe("+
				    "_id INTEGER PRIMARY KEY AUTOINCREMENT,"+
					"cafe_name text," +
				    "cafe_location text," +
					"cafe_phone text)";
					db.execSQL(table_cafe);
			
		} catch (Exception e) {
			context.deleteDatabase(dbName);
		}
	}




	@Override
	public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
		// TODO Auto-generated method stub
		
	}

	
	
	
	
}
