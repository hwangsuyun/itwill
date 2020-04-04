package com.itwill.pension;

import com.itwill.pension.R;

import android.os.Bundle;
import android.os.Handler;
import android.app.Activity;
import android.content.Intent;
import android.view.Menu;
import android.view.View;
import android.view.Window;
import android.widget.ProgressBar;

public class IntroActivity extends Activity {
	Handler handler;
	ProgressBar pb;
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		//타이틀바 제거
		requestWindowFeature(Window.FEATURE_NO_TITLE);
		setContentView(R.layout.activity_intro);
		pb = (ProgressBar)findViewById(R.id.progressBar1);
		
		//핸들러를 사용하여 4초간 딜레이를 주고 시간이 경과하면 인텐트를 통하여 메인 페이지로 이동
		 handler = new Handler();
		handler.postDelayed(r, 4000);
		
		pb.setVisibility(View.VISIBLE);
	
	}
	//runnable의 run 메서드 오버라이딩
	Runnable r = new Runnable() {
		//run 메서드에서 인텐트로 main 페이지 이동
		@Override
		public void run() {
			Intent i = new Intent();
			i.setClass(getApplicationContext(), MainActivity.class);
			startActivity(i);
			finish();
			
			overridePendingTransition(android.R.anim.fade_in, android.R.anim.fade_out);
			
		}
	};

	public void onBackPressed() {
		handler.removeCallbacks(r);
	};
	
	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.intro, menu);
		return true;
	}

}
