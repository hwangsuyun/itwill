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

//구글맵 fragment activity로 구현
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
		
		//버튼 클릭시 sqlite의 카페 위치 db의 내용을 불러옴
		button1 = (Button) findViewById(R.id.button1);
		button2 = (Button) findViewById(R.id.button2);
		
		//gps와 network 방식으로 읽어옴
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

		//마커 클릭시 발생하는 리스너
		googleMap.setOnMarkerClickListener(this);
		//마커 클릭시 윈도우 창 띄움(다이얼로그창)
		googleMap.setOnInfoWindowClickListener(this);

		//sqlite 내용이 많기 때문에 쓰레드 사용
		new Thread(){
			
			public void run() {
				//버튼 이벤트(근처카페만 검색)
				button1.setOnClickListener(new View.OnClickListener() {

					@Override
					public void onClick(View v) {
						//핸들러를 통해 db 내용 읽어옴
						handler = ProductTableHandler.open(getApplicationContext());
						Cursor cursor = handler.query();

						double lat=0;
						double lng=0;
						List<Address> addressList=null;
						Location location1 = new Location("");
						
						//db에 커피 insert 된 내용 불러오기(실제 insert 한 내용은 엑셀파일 참조)
						
						while (cursor.moveToNext()) {
							String cafe_name = cursor.getString(1);
							String cafe_location = cursor.getString(2);
							String cafe_phone = cursor.getString(3);
							
							//지오코더를 통해서 주소값을 좌표로 변환 시켜준다.
							try {
								Geocoder geo = new Geocoder(getApplicationContext());
								addressList = geo.getFromLocationName(cafe_location, 3);

								if (addressList != null && addressList.size() > 0) {
									lat = addressList.get(0).getLatitude();
									lng = addressList.get(0).getLongitude();
									
									//현재위치의 위도,경도를 로케이션에 넣어준다.
									//MylocationListener에서 현재 위치를 알아내고 그 값을 불러온 것
									location.setLatitude(latD); 
									location.setLongitude(lngD);
									location.set(location);
									
									//sqlite의 카페들의 위도,경도를 로케이션1에 넣어준다.
									location1.setLatitude(lat);
									location1.setLongitude(lng);
									location1.set(location1);
									
									//현재위치와 sqlite의 카페들의 거리를 하나씩 비교해서 값을 반환
									double distance = location.distanceTo(location1);
									
									//현재 위치를 기준으로 거리가 3000미만인 지역의 카페들만 마커로 찍는다
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
						//핸들러를 통해 db 내용 읽어옴
						handler = ProductTableHandler.open(getApplicationContext());
						Cursor cursor = handler.query();

						double lat=0;
						double lng=0;
						List<Address> addressList=null;
						Location location1 = new Location("");
						
						//db에 커피 insert 된 내용 불러오기(실제 insert 한 내용은 엑셀파일 참조)
						
						while (cursor.moveToNext()) {
							String cafe_name = cursor.getString(1);
							String cafe_location = cursor.getString(2);
							String cafe_phone = cursor.getString(3);
							
							//지오코더를 통해서 주소값을 좌표로 변환 시켜준다.
							try {
								Geocoder geo = new Geocoder(getApplicationContext());
								addressList = geo.getFromLocationName(cafe_location, 3);

								if (addressList != null && addressList.size() > 0) {
									lat = addressList.get(0).getLatitude();
									lng = addressList.get(0).getLongitude();
									
									//db에 저장된 모든 위치의 커피숍을 마커로 찍어서 보여준다.
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
	//이 리스너에서 현재 위치를 알아내고 현재 위치로 이동시킨다.
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

	// 마커 클릭 이벤트 처리
	@Override
	public boolean onMarkerClick(Marker marker) {
		return false;
	}
	// 마커 클릭시 다이얼로그창 띄움
	@Override
	public void onInfoWindowClick(Marker marker) {
		
		AlertDialog.Builder adb = new AlertDialog.Builder(this);
		//마커의 snippet 값을 읽어온다.
		String msg = marker.getSnippet();
		//snippet 값에는 주소와 전화번호가 있는데 전화번호는 앞에 tel이 붙어있어서 tel 문자열을 검색
		int tel = msg.indexOf("tel:");
		//tel을 검색후 tel부터 시작해서 문자를 끝까지 자른다(앞에 주소가 잘려나감)
		final String cafe_phone = msg.substring(tel);

		adb.setTitle("전화걸기");
		adb.setMessage("확인을 누르시면 전화 연결됩니다.");

		adb.setPositiveButton("확인", new DialogInterface.OnClickListener() {

			@Override
			public void onClick(DialogInterface dialog, int which) {
				//확인 버튼 클릭시 전화걸기 창으로 이동함
				Intent intent = new Intent();
				intent.setAction(intent.ACTION_DIAL);
				intent.setData(Uri.parse(cafe_phone));
				startActivity(intent);
			}
		});

		adb.setNegativeButton("취소", new DialogInterface.OnClickListener() {

			@Override
			public void onClick(DialogInterface dialog, int which) {
			
			}
		});
		adb.show();
	}

}
