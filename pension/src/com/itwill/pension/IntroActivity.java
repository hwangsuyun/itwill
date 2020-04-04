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
		//Ÿ��Ʋ�� ����
		requestWindowFeature(Window.FEATURE_NO_TITLE);
		setContentView(R.layout.activity_intro);
		pb = (ProgressBar)findViewById(R.id.progressBar1);
		
		//�ڵ鷯�� ����Ͽ� 4�ʰ� �����̸� �ְ� �ð��� ����ϸ� ����Ʈ�� ���Ͽ� ���� �������� �̵�
		 handler = new Handler();
		handler.postDelayed(r, 4000);
		
		pb.setVisibility(View.VISIBLE);
	
	}
	//runnable�� run �޼��� �������̵�
	Runnable r = new Runnable() {
		//run �޼��忡�� ����Ʈ�� main ������ �̵�
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
