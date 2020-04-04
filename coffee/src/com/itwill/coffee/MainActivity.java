package com.itwill.coffee;

import com.itwill.coffee.R;

import android.os.Bundle;
import android.app.Activity;
import android.content.Intent;
import android.view.Menu;
import android.view.View;
import android.view.Window;
import android.widget.ImageButton;

public class MainActivity extends Activity {
	SoundManager sManager;
	ImageButton ib1;
	ImageButton ib2;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		requestWindowFeature(Window.FEATURE_NO_TITLE);
		setContentView(R.layout.activity_main);
		
		//효과음을 주기 위해 사운드 매니저 이용
		sManager = SoundManager.getInstance();
		sManager.init(this);
		sManager.addSound(0, R.raw.sound);
		
		ib1 = (ImageButton)findViewById(R.id.imageButton1);
		ib2 = (ImageButton)findViewById(R.id.imageButton2);
	
		//버튼 클릭 이벤트로 효과음을 주고 인텐트를 통하여 다음 페이지로 이동
		ib1.setOnClickListener(new View.OnClickListener() {
			
			@Override
			public void onClick(View v) {
				sManager.play(0);
				Intent intent = new Intent();
				intent.setClass(getApplicationContext(), SearchActivity.class);
				startActivity(intent);
				
			}
		});
		//버튼 클릭 이벤트로 효과음을 주고 인텐트를 통하여 다음 페이지로 이동
		ib2.setOnClickListener(new View.OnClickListener() {
			
			@Override
			public void onClick(View v) {
				sManager.play(0);
				Intent intent = new Intent();
				intent.setClass(getApplicationContext(), InformationActivity.class);
				startActivity(intent);
			}
		});
	
	
	
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}

}
