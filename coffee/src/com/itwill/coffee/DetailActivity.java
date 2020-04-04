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
		
		//����Ʈ�� �� �̹����� �̸��� �޾ƿ´�.
		Intent intent = getIntent();
		Bundle bundle = intent.getExtras();
		int image = (Integer) bundle.get("image");
		String name = (String) bundle.get("name");
		
		
		
		//�ȵ���̵� ��ü db(sqlite)�� ����� �����͸� �о�´�.
		ProductTableHandler handler=ProductTableHandler.open(this);
		Cursor cursor = handler.queryByNameLike(name);
		
		
		/* db�� insert�� ����
		long result = handler.insert("�Ƹ޸�ī��", "3900", "4400", "5000");
		long result1 = handler.insert("ī���ī", "4600", "5100", "5500");
		long result2 = handler.insert("ī���", "4100", "4600", "5000");
		long result3 = handler.insert("����������", "4600", "5100", "5500");
		long result4 = handler.insert("īǪġ��", "4100", "4600", "5000");
		long result5 = handler.insert("ī��Ḷ���߶�", "5100", "5600", "6000");
		long result6 = handler.insert("�ٴҶ��", "4600", "5100", "5500");
		long result7 = handler.insert("����Ǫġ��", "5300", "5800", "6500");
		long result8 = handler.insert("���̽�Ƽ", "3900", "4400", "5000");
		long result9 = handler.insert("�׸�Ƽ", "5600", "6100", "6500");
		*/
		
		//select (db�� ����� ���� �̾ƿ���)
		String data = "";
		if(cursor!=null){
			if(cursor.moveToNext()){
				String coffee_name = cursor.getString(1); 
				String tall = cursor.getString(2); 
				String grande = cursor.getString(3); 
				String venti = cursor.getString(4);
				data = "\n"+"   Menu             "+coffee_name+"\n\n"+
					   "   Tall                  "+tall+"��"+"\n\n"+
					   "   Grande           "+grande+"��"+"\n\n"+
					   "   Venti               "+venti+"��"+"\n";
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
