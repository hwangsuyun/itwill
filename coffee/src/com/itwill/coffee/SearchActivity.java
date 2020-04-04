package com.itwill.coffee;

import java.util.List;
import com.google.android.gms.maps.CameraUpdate;
import com.google.android.gms.maps.CameraUpdateFactory;
import com.google.android.gms.maps.GoogleMap;
import com.google.android.gms.maps.GoogleMap.OnInfoWindowClickListener;
import com.google.android.gms.maps.SupportMapFragment;
import com.google.android.gms.maps.GoogleMap.OnMarkerClickListener;
import com.google.android.gms.maps.model.BitmapDescriptorFactory;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.Marker;
import com.google.android.gms.maps.model.MarkerOptions;
import com.itwill.coffee.R;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.database.Cursor;
import android.location.Address;
import android.location.Geocoder;
import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.net.Uri;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.view.View;
import android.view.Window;
import android.widget.Button;

//���۸� fragment activity�� ����
public class SearchActivity extends FragmentActivity implements
		OnMarkerClickListener, OnInfoWindowClickListener {
	
	GoogleMap googleMap;
	LocationManager locationManager;
	MyLocationListener locationListener;
	Button button1,button2;
	ProductTableHandler handler;
	Location location;
	double latD;
	double lngD;
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		// TODO Auto-generated method stub
		super.onCreate(savedInstanceState);
		requestWindowFeature(Window.FEATURE_NO_TITLE);
		setContentView(R.layout.activity_search);
		
		//��ư Ŭ���� sqlite�� ī�� ��ġ db�� ������ �ҷ���
		button1 = (Button) findViewById(R.id.button1);
		button2 = (Button) findViewById(R.id.button2);
		
		//gps�� network ������� �о��
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

		//sqlite ������ ���� ������ ������ ���
		new Thread(){
			
			public void run() {
				//��ư �̺�Ʈ(��óī�丸 �˻�)
				button1.setOnClickListener(new View.OnClickListener() {

					@Override
					public void onClick(View v) {
						//�ڵ鷯�� ���� db ���� �о��
						handler = ProductTableHandler.open(getApplicationContext());
						Cursor cursor = handler.query();

						double lat=0;
						double lng=0;
						List<Address> addressList=null;
						Location location1 = new Location("");
						
						//db�� Ŀ�� insert �� ���� �ҷ�����(���� insert �� ������ �������� ����)
						
						while (cursor.moveToNext()) {
							String cafe_name = cursor.getString(1);
							String cafe_location = cursor.getString(2);
							String cafe_phone = cursor.getString(3);
							
							//�����ڴ��� ���ؼ� �ּҰ��� ��ǥ�� ��ȯ �����ش�.
							try {
								Geocoder geo = new Geocoder(getApplicationContext());
								addressList = geo.getFromLocationName(cafe_location, 3);

								if (addressList != null && addressList.size() > 0) {
									lat = addressList.get(0).getLatitude();
									lng = addressList.get(0).getLongitude();
									
									//������ġ�� ����,�浵�� �����̼ǿ� �־��ش�.
									//MylocationListener���� ���� ��ġ�� �˾Ƴ��� �� ���� �ҷ��� ��
									location.setLatitude(latD); 
									location.setLongitude(lngD);
									location.set(location);
									
									//sqlite�� ī����� ����,�浵�� �����̼�1�� �־��ش�.
									location1.setLatitude(lat);
									location1.setLongitude(lng);
									location1.set(location1);
									
									//������ġ�� sqlite�� ī����� �Ÿ��� �ϳ��� ���ؼ� ���� ��ȯ
									double distance = location.distanceTo(location1);
									
									//���� ��ġ�� �������� �Ÿ��� 3000�̸��� ������ ī��鸸 ��Ŀ�� ��´�
									if(distance<3000){
									MarkerOptions mo = new MarkerOptions();
									mo.icon(BitmapDescriptorFactory.defaultMarker());
									mo.title(cafe_name);
									mo.snippet(cafe_location + " tel:" + cafe_phone);
									mo.position(new LatLng(lat, lng));
									googleMap.addMarker(mo);
									}else{
										
									}
									
								}
							} catch (Exception e) {
								
							}
						}
						cursor.close();
					}
				});
				
				button2.setOnClickListener(new View.OnClickListener() {
					
					@Override
					public void onClick(View v) {
						//�ڵ鷯�� ���� db ���� �о��
						handler = ProductTableHandler.open(getApplicationContext());
						Cursor cursor = handler.query();

						double lat=0;
						double lng=0;
						List<Address> addressList=null;
						Location location1 = new Location("");
						
						//db�� Ŀ�� insert �� ���� �ҷ�����(���� insert �� ������ �������� ����)
						
						while (cursor.moveToNext()) {
							String cafe_name = cursor.getString(1);
							String cafe_location = cursor.getString(2);
							String cafe_phone = cursor.getString(3);
							
							//�����ڴ��� ���ؼ� �ּҰ��� ��ǥ�� ��ȯ �����ش�.
							try {
								Geocoder geo = new Geocoder(getApplicationContext());
								addressList = geo.getFromLocationName(cafe_location, 3);

								if (addressList != null && addressList.size() > 0) {
									lat = addressList.get(0).getLatitude();
									lng = addressList.get(0).getLongitude();
									
									//db�� ����� ��� ��ġ�� Ŀ�Ǽ��� ��Ŀ�� �� �����ش�.
									MarkerOptions mo = new MarkerOptions();
									mo.icon(BitmapDescriptorFactory.defaultMarker());
									mo.title(cafe_name);
									mo.snippet(cafe_location + " tel:" + cafe_phone);
									mo.position(new LatLng(lat, lng));
									googleMap.addMarker(mo);
															
								}
							} catch (Exception e) {
								
							}
						}
						cursor.close();
						
					}
				});
				
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

}
