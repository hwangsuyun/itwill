package com.itwill.coffee;

import com.itwill.coffee.R;

import android.app.Activity;
import android.content.Intent;
import android.database.Cursor;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.Window;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.SimpleCursorAdapter;
import android.widget.TextView;

public class DetailActivity extends Activity {
	ImageView imageview;
	TextView textview;
	ListView listView;
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		requestWindowFeature(Window.FEATURE_NO_TITLE);
		setContentView(R.layout.activity_detail);
		
		imageview = (ImageView)findViewById(R.id.detailImage);
		textview = (TextView)findViewById(R.id.detailText);
		
		//인텐트를 얻어서 이미지와 이름을 받아온다.
		Intent intent = getIntent();
		Bundle bundle = intent.getExtras();
		int image = (Integer) bundle.get("image");
		String name = (String) bundle.get("name");
		
		
		
		//안드로이드 자체 db(sqlite)에 저장된 데이터를 읽어온다.
		ProductTableHandler handler=ProductTableHandler.open(this);
		Cursor cursor = handler.queryByNameLike(name);
		
		
		/* db에 insert한 내용
		long result = handler.insert("아메리카노", "3900", "4400", "5000");
		long result1 = handler.insert("카페모카", "4600", "5100", "5500");
		long result2 = handler.insert("카페라떼", "4100", "4600", "5000");
		long result3 = handler.insert("에스프레소", "4600", "5100", "5500");
		long result4 = handler.insert("카푸치노", "4100", "4600", "5000");
		long result5 = handler.insert("카라멜마끼야또", "5100", "5600", "6000");
		long result6 = handler.insert("바닐라라떼", "4600", "5100", "5500");
		long result7 = handler.insert("프라푸치노", "5300", "5800", "6500");
		long result8 = handler.insert("아이스티", "3900", "4400", "5000");
		long result9 = handler.insert("그린티", "5600", "6100", "6500");
		*/
		
		//select (db에 저장된 내용 뽑아오기)
		String data = "";
		if(cursor!=null){
			if(cursor.moveToNext()){
				String coffee_name = cursor.getString(1); 
				String tall = cursor.getString(2); 
				String grande = cursor.getString(3); 
				String venti = cursor.getString(4);
				data = "\n"+"   Menu             "+coffee_name+"\n\n"+
					   "   Tall                  "+tall+"원"+"\n\n"+
					   "   Grande           "+grande+"원"+"\n\n"+
					   "   Venti               "+venti+"원"+"\n";
			}else{
				data = "NO DATA";
			}
			cursor.close();
		}
		
		imageview.setImageResource(image);
		textview.setText(data);
		
		
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.detail, menu);
		return true;
	}

}
