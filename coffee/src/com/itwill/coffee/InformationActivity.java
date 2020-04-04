package com.itwill.coffee;

import java.util.ArrayList;

import com.itwill.coffee.R;

import android.app.Activity;
import android.content.Intent;
import android.database.Cursor;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.AdapterView;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.TextView;

public class InformationActivity extends Activity {

	ListView listView;
	ArrayList<Coffee> coffeelist;
	
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		requestWindowFeature(Window.FEATURE_NO_TITLE);
		setContentView(R.layout.activity_information);
		
		//����Ʈ �� ���
		listView = (ListView)findViewById(R.id.listView1);
		coffeelist = new ArrayList<Coffee>();		
		
		coffeelist.add(new Coffee(R.drawable.americano, "�Ƹ޸�ī��"));
		coffeelist.add(new Coffee(R.drawable.moca, "ī���ī"));
		coffeelist.add(new Coffee(R.drawable.latte, "ī���"));
		coffeelist.add(new Coffee(R.drawable.espreso, "����������"));
		coffeelist.add(new Coffee(R.drawable.capuchino, "īǪġ��"));
		coffeelist.add(new Coffee(R.drawable.caramel, "ī��Ḷ���߶�"));
		coffeelist.add(new Coffee(R.drawable.banila, "�ٴҶ��"));
		coffeelist.add(new Coffee(R.drawable.coffeeprapchino, "����Ǫġ��"));
		coffeelist.add(new Coffee(R.drawable.icetee, "���̽�Ƽ"));
		coffeelist.add(new Coffee(R.drawable.greentea, "�׸�Ƽ"));
		
		
	
		//����� �����ϰ� ����Ʈ ����Ͽ� ������ Ŭ���� �������������� �̵���Ŵ
		listView.setAdapter(new CoffeeListAdapter());
		listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {

			@Override
			public void onItemClick(AdapterView<?> arg0, View arg1, int pos,
					long arg3) {
				Coffee coffee = (Coffee)listView.getItemAtPosition(pos);
				int image = coffee.getImage_resid();
				String name = coffee.getName();
				
				Intent intent = new Intent();
				intent.putExtra("image", image);
				intent.putExtra("name", name);
				intent.setClass(getApplicationContext(), DetailActivity.class);
				startActivity(intent);
			}
		
		});
		
		
	
	}

	/************ CarList Adapter inner class ****************/
	public class CoffeeListAdapter extends BaseAdapter{
		
		// 1. BaseAdapter�� ��ӹ޴´�.
		
		//A. DataSource �� ������ �������ش�.
		public int getCount() {
			// TODO Auto-generated method stub
			return coffeelist.size();
		}
		
		//B. AdapterView�� �ڽĺ並 �������ش�.
		@Override
		public View getView(int pos, View arg1, ViewGroup arg2) {
			LayoutInflater inflater = getLayoutInflater();
			View view = inflater.inflate(R.layout.coffee_list, null);
		
			ImageView coffee_imageIV = (ImageView)view.findViewById(R.id.coffeeimageView);
			
			TextView coffee_titleTV = (TextView)view.findViewById(R.id.coffeetextView);
			
			Coffee tempCoffe  = coffeelist.get(pos);
			
			coffee_imageIV.setImageResource(tempCoffe.getImage_resid());
			coffee_titleTV.setText(tempCoffe.getName());
			
			return view;
		
		}
		
		/*
		 	event ó���ñ����ʿ�
		 */
		@Override
		public Object getItem(int pos) {
			// TODO Auto-generated method stub
			return coffeelist.get(pos);
		}

		@Override
		public long getItemId(int arg0) {
			// TODO Auto-generated method stub
			return 0;
		}

		
		
	}
	/********************************************************/ 
	
	
	
	
	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.information, menu);
		return true;
	}

}
