package com.itwill.pension;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.URL;
import java.util.Enumeration;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.location.Address;
import android.location.Geocoder;
import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.net.Uri;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.text.Editable;
import android.util.Log;
import android.view.View;
import android.view.Window;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.google.android.gms.maps.CameraUpdate;
import com.google.android.gms.maps.CameraUpdateFactory;
import com.google.android.gms.maps.GoogleMap;
import com.google.android.gms.maps.GoogleMap.OnInfoWindowClickListener;
import com.google.android.gms.maps.GoogleMap.OnMarkerClickListener;
import com.google.android.gms.maps.SupportMapFragment;
import com.google.android.gms.maps.model.BitmapDescriptorFactory;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.Marker;
import com.google.android.gms.maps.model.MarkerOptions;

public class MapActivity extends FragmentActivity implements OnMarkerClickListener, OnInfoWindowClickListener {
	GoogleMap googleMap;
	LocationManager locationManager;
	MyLocationListener locationListener;
	Location location;
	double latD;
	double lngD;
    EditText editText;
    Button b1;
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		requestWindowFeature(Window.FEATURE_NO_TITLE);
		setContentView(R.layout.activity_map);
		editText = (EditText)findViewById(R.id.editText1);
		b1 = (Button)findViewById(R.id.button1);
		
		googleMap = ((SupportMapFragment) getSupportFragmentManager()
				.findFragmentById(R.id.map)).getMap();
		googleMap.setMapType(googleMap.MAP_TYPE_NORMAL);

		locationManager = (LocationManager) getSystemService(Context.LOCATION_SERVICE);

		location = locationManager.getLastKnownLocation("gps");
		if (location == null) {
			location = locationManager.getLastKnownLocation("network");
		}
		
		locationListener = new MyLocationListener();

		locationManager.requestLocationUpdates("gps", 0, 0, locationListener);

		locationManager.requestLocationUpdates("network", 0, 0,
				locationListener);

		//��Ŀ Ŭ���� �߻��ϴ� ������
		googleMap.setOnMarkerClickListener(this);
		//��Ŀ Ŭ���� ������ â ���(���̾�α�â)
		googleMap.setOnInfoWindowClickListener(this);
		
		
		new Thread(){
			public void run() {
				showPension();
			};
			
		}.start();		
	}
	
	/********************** LocationListener ****************/
	//�� �����ʿ��� ���� ��ġ�� �˾Ƴ��� ���� ��ġ�� �̵���Ų��.
	public class MyLocationListener implements LocationListener {
		@Override
		public void onLocationChanged(Location location) {
			StringBuffer sb = new StringBuffer();

			latD = location.getLatitude();
			lngD = location.getLongitude();

			LatLng latLng = new LatLng(latD, lngD);
			CameraUpdate cameraUpdate = CameraUpdateFactory.newLatLngZoom(
					latLng, 1000);
			
			googleMap.animateCamera(cameraUpdate);

			googleMap.getUiSettings().setMyLocationButtonEnabled(true);
			googleMap.getUiSettings().setCompassEnabled(true);
			googleMap.getUiSettings().setZoomControlsEnabled(true);
			googleMap.setMyLocationEnabled(true);
		}

		@Override
		public void onProviderDisabled(String provider) {
		}

		@Override
		public void onProviderEnabled(String provider) {
		}

		@Override
		public void onStatusChanged(String provider, int status, Bundle extras) {
		}
	}

	/******************************************************/

	// ��Ŀ Ŭ�� �̺�Ʈ ó��
	@Override
	public boolean onMarkerClick(Marker marker) {
		return false;
	}
	// ��Ŀ Ŭ���� ���̾�α�â ���
	@Override
	public void onInfoWindowClick(Marker marker) {
		
		AlertDialog.Builder adb = new AlertDialog.Builder(this);
		//��Ŀ�� snippet ���� �о�´�.
		String msg = marker.getSnippet();
		//snippet ������ �ּҿ� ��ȭ��ȣ�� �ִµ� ��ȭ��ȣ�� �տ� tel�� �پ��־ tel ���ڿ��� �˻�
		int tel = msg.indexOf("tel:");
		//tel�� �˻��� tel���� �����ؼ� ���ڸ� ������ �ڸ���(�տ� �ּҰ� �߷�����)
		final String cafe_phone = msg.substring(tel);

		adb.setTitle("��ȭ�ɱ�");
		adb.setMessage("Ȯ���� �����ø� ��ȭ ����˴ϴ�.");

		adb.setPositiveButton("Ȯ��", new DialogInterface.OnClickListener() {

			@Override
			public void onClick(DialogInterface dialog, int which) {
				//Ȯ�� ��ư Ŭ���� ��ȭ�ɱ� â���� �̵���
				Intent intent = new Intent();
				intent.setAction(intent.ACTION_DIAL);
				intent.setData(Uri.parse(cafe_phone));
				startActivity(intent);
			}
		});

		adb.setNegativeButton("���", new DialogInterface.OnClickListener() {

			@Override
			public void onClick(DialogInterface dialog, int which) {
			
			}
		});
		adb.show();
	}
	
	private void showPension(){
			//��ư Ŭ�� �̺�Ʈ
			b1.setOnClickListener(new View.OnClickListener() {
				
				@Override
				public void onClick(View v) {
					//editText�� ���� �Է� �Ǹ� ���� et�� ����
					Editable et = editText.getText();
					
					//ip �ּ� �ҷ�����
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
				                            Log.e("�ּ�", y);
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
					
					//server�� data�� json �Ľ��ؼ� �ҷ���
					String jsonUrlStr="";
					if(et.toString().equals("��⵵")){
						jsonUrlStr = "http://192.168.0.7/final/pension/json_gyeonggi.jsp";
						//jsonUrlStr = "http://"+y+"/final/pension/json_gyeonggi.jsp";
					}else if(et.toString().equals("������")){
						jsonUrlStr = "http://192.168.0.7/final/pension/json_gangwon.jsp";
						//jsonUrlStr = "http://"+y+"/final/pension/json_gangwon.jsp";
					}else if(et.toString().equals("��û�ϵ�")){	
						jsonUrlStr = "http://192.168.0.7/final/pension/json_chungbuk.jsp";
						//jsonUrlStr = "http://"+y+"/final/pension/json_chungbuk.jsp";
					}else if(et.toString().equals("��û����")){
						jsonUrlStr = "http://192.168.0.7/final/pension/json_chungnam.jsp";
						//jsonUrlStr = "http://"+y+"/final/pension/json_chungnam.jsp";
					}else if(et.toString().equals("���ϵ�")){
						jsonUrlStr = "http://192.168.0.7/final/pension/json_gyeongbuk.jsp";
						//jsonUrlStr = "http://"+y+"/final/pension/json_gyeongbuk.jsp";
					}else if(et.toString().equals("��󳲵�")){
						jsonUrlStr = "http://192.168.0.7/final/pension/json_gyeongnam.jsp";
						//jsonUrlStr = "http://"+y+"/final/pension/json_gyeongnam.jsp";
					}else if(et.toString().equals("����ϵ�")){
						jsonUrlStr = "http://192.168.0.7/final/pension/json_jeonbuk.jsp";
						//jsonUrlStr = "http://"+y+"/final/pension/json_jeonbuk.jsp";
					}else if(et.toString().equals("���󳲵�")){
						jsonUrlStr = "http://192.168.0.7/final/pension/json_jeonnam.jsp";
						//jsonUrlStr = "http://"+y+"/final/pension/json_jeonnam.jsp";
					}else if(et.toString().equals("���ֵ�")){
						jsonUrlStr = "http://192.168.0.7/final/pension/json_jeju.jsp";
						//jsonUrlStr = "http://"+y+"/final/pension/json_jeju.jsp";
					}else{
						Toast.makeText(getApplicationContext(), "�߸��� ���Դϴ�. ex)��⵵ �Է����ּ���", Toast.LENGTH_LONG).show();
					}
					try{
						
						URL url=new URL(jsonUrlStr);
						InputStream in=url.openStream();
						BufferedReader br=new 
								BufferedReader(new InputStreamReader(in,"euc-kr"));
						final StringBuffer sb=new StringBuffer();
						while(true){
							String readLine=br.readLine();
							if(readLine==null)break;
							sb.append(readLine);
							
						}
						br.close();
						
						String jsonStr=sb.toString();
						JSONObject jsonObject=new JSONObject(jsonStr);
						JSONArray jsonArray=jsonObject.getJSONArray("pension");
						final StringBuffer sb2=new StringBuffer();
						String p_group = "";
						String p_name = "";
						String p_address = "";
						String p_tel = "";
						for(int i=0;i<jsonArray.length();i++){
							JSONObject userJsonObject=jsonArray.getJSONObject(i);
							p_group=userJsonObject.getString("p_group");
							p_name=userJsonObject.getString("p_name");
							p_address=userJsonObject.getString("p_address");
							p_tel=userJsonObject.getString("p_tel");
							Log.e("pension"+i, p_group+","+p_name+","+p_address+","+p_tel);
						
							//geocoder ���
							double lat=0;
							double lng=0;
							List<Address> addressList=null;
							Location location1 = new Location("");
							
							try {
								Geocoder geo = new Geocoder(getApplicationContext());
								addressList = geo.getFromLocationName(p_address, 5); //�Է¹��� ������ �˻�
								if (addressList != null && addressList.size() > 0) {
									lat = addressList.get(0).getLatitude();
									lng = addressList.get(0).getLongitude();
									
									//�Էµ� ������ ��ġ�ϴ� data�� db���� �˻� �� marker ���
									MarkerOptions mo = new MarkerOptions();
									mo.icon(BitmapDescriptorFactory.defaultMarker());
									mo.title(p_name);
									mo.snippet(p_address + " tel:" + p_tel);
									mo.position(new LatLng(lat, lng));
									googleMap.addMarker(mo);
															
								}//end if
							} catch (Exception e) {
								
							}
						
						}//end for
						
				}catch (Exception e) {
					// TODO: handle exception
				}
				
				}
			});
		
	  }//end showPension	
	
	
	}//end class
	