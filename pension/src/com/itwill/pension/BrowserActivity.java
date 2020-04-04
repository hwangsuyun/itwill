package com.itwill.pension;

import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.UnknownHostException;
import java.util.Enumeration;

import android.os.Bundle;
import android.app.Activity;
import android.util.Log;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.Window;
import android.webkit.WebView;

public class BrowserActivity extends Activity {
	WebView webview;
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		requestWindowFeature(Window.FEATURE_NO_TITLE);
		setContentView(R.layout.activity_browser);
		
		//ip 林家 阂矾坷扁
		String x = null;
		String y = null;
		try {
	            Enumeration<NetworkInterface> nifs = NetworkInterface.getNetworkInterfaces();
	            if (nifs != null){
	                while (nifs.hasMoreElements()){
	                    NetworkInterface nif = nifs.nextElement();
	                    Enumeration<InetAddress> adrs = nif.getInetAddresses();
	                    while (adrs.hasMoreElements())
	                    {
	                        InetAddress adr = adrs.nextElement();
	                        if (adr != null && adr.isSiteLocalAddress() && !adr.isLoopbackAddress() )
	                        {
	                            x = adr.getHostName();
	                            y = adr.getHostAddress();
	                            Log.e("林家", y);
	                            break;
	                        }
	                    }
	                }
	            }
	            if(y == null){
	                InetAddress inetaddr = InetAddress.getLocalHost();
	                x = inetaddr.getHostName();
	                y = inetaddr.getHostAddress();
	            }
	        }catch(Exception ex){
	            ex.printStackTrace();
	        }
		
		webview = (WebView)findViewById(R.id.webView1);
		//webview.loadUrl("http://"+y+"/final/main.jsp");
		  webview.loadUrl("http://192.168.0.8/final/main.jsp");
	}
	@Override
	public boolean onKeyDown(int keyCode, KeyEvent event) {
		if(keyCode==KeyEvent.KEYCODE_BACK){
			if(webview.canGoBack()){
				webview.goBack();
				return false;
			}
		}
		return super.onKeyDown(keyCode, event);
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.browser, menu);
		return true;
	}

}
