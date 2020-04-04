package  com.itwill.member;
/********************************************************
파    일   명 : MemberApp.java
기         능 : XXX 관리 프로그램(어플리케이션 2-TIER) 
관련 프로그램 : 
작         성 :
작    성   일 : 
변    경   일 :
 *********************************************************/
import java.awt.*;
import java.awt.event.*;
import java.sql.*;
import java.util.ArrayList;

import javax.swing.*;
import javax.swing.border.*;

public class MemberUIMain extends Frame implements ActionListener
{
	public static final int NONE = 0;
	public static final int ADD = 1;
	public static final int DELETE = 2;
	public static final int SEARCH = 3;
	public static final int TOTAL = 4;
	public static final int UPDATE_1 = 5;
	public static final int UPDATE_2 = 6;

	TextArea display;
	TextField numTF, nameTF, phoneTF, ageTF, addressTF;
	Label lname, lnum, lphone, lcompany, laddress;
	Button addB, deleteB, searchB, totalB, cancelB, updateB;
	
	int cmd;
	
	MemberDAO memberDAO;

	/********************************************
	 * 생성자 정의
	 *********************************************/
	public MemberUIMain() throws Exception
	{
		// memberDAO 객체 생성 
		memberDAO = new MemberDAO("m2.dat");
			
		setTitle("◆◆◆ Member 관리 프로그램 ◆◆◆");
		setSize(600, 400);

		Dimension dim = getToolkit().getScreenSize();
		setLocation(dim.width / 2 - getWidth() / 2, dim.height / 2
				- getHeight() / 2);

		display = new TextArea();
		display.setEditable(false);

		Panel left = new Panel();
		left.setLayout(new GridLayout(5, 1));

		Panel pnum = new Panel();
		pnum.add(new Label("번  호"));
		pnum.add(numTF = new TextField(10));

		Panel pname = new Panel();
		pname.add(new Label("이  름"));
		pname.add(nameTF = new TextField(10));
		
		Panel page = new Panel();
		page.add(new Label("나  이"));
		page.add(ageTF = new TextField(10));
		
		Panel pphone = new Panel();
		pphone.add(new Label("전  화"));
		pphone.add(phoneTF = new TextField(10));

		Panel paddress = new Panel();
		paddress.add(new Label("주  소"));
		paddress.add(addressTF = new TextField(10));

		left.add(pnum);
		left.add(pname);
		left.add(pphone);
		left.add(page);
		left.add(paddress);
		
		Panel bottom = new Panel();
		bottom.setLayout(new GridLayout(1, 5));

		bottom.add(totalB = new Button("전  체"));
		totalB.addActionListener(this);

		bottom.add(searchB = new Button("검  색"));
		searchB.addActionListener(this);

		bottom.add(addB = new Button("추  가"));
		addB.addActionListener(this);

		bottom.add(updateB = new Button("수  정"));
		updateB.addActionListener(this);
		
		bottom.add(deleteB = new Button("삭  제"));
		deleteB.addActionListener(this);	

		bottom.add(cancelB = new Button("취  소"));
		cancelB.addActionListener(this);

		add(display, "Center");
		add(left, "West");
		add(bottom, "South");
		cmd = NONE;
		initialize();

		addWindowListener(new WindowAdapter()
		{
			@Override
			public void windowClosing(WindowEvent e)
			{
				System.exit(0);
			}
		});
		
		setVisible(true);
	}

	

	public void initialize() {
		numTF.setEditable(false);
		nameTF.setEditable(false);
		phoneTF.setEditable(false);
		ageTF.setEditable(false);
		addressTF.setEditable(false);
	}

	public void setEditable(int n) {
		switch (n) {
		case ADD:
			numTF.setEditable(true);
			nameTF.setEditable(true);
			phoneTF.setEditable(true);
			ageTF.setEditable(true);
			addressTF.setEditable(true);
		break;
		case DELETE:
			numTF.setEditable(true);
		break;
		case SEARCH:
			nameTF.setEditable(true);
		break;
		case NONE:
		case TOTAL:
			numTF.setEditable(false);
			nameTF.setEditable(false);
			phoneTF.setEditable(false);
			ageTF.setEditable(false);
			addressTF.setEditable(false);
		break;
		
		case UPDATE_1:
			numTF.setEditable(true);
			nameTF.setEditable(false);
			phoneTF.setEditable(false);
			ageTF.setEditable(false);
			addressTF.setEditable(false);
		break;
		case UPDATE_2:
			numTF.setEditable(false);
			nameTF.setEditable(true);
			phoneTF.setEditable(true);
			ageTF.setEditable(true);
			addressTF.setEditable(true);
		break;
		
		}
	}

	public void setEnable(int n)
	{
		addB.setEnabled(false);
		deleteB.setEnabled(false);
		searchB.setEnabled(false);
		totalB.setEnabled(false);
		
		updateB.setEnabled(false);

		switch (n)
		{
			case ADD:
				addB.setEnabled(true);
				setEditable(ADD);
				cmd = ADD;
			break;
			case DELETE:
				deleteB.setEnabled(true);
				setEditable(DELETE);
				cmd = DELETE;
			break;
			case SEARCH:
				searchB.setEnabled(true);
				setEditable(SEARCH);
				cmd = SEARCH;
			break;
			case TOTAL:
				totalB.setEnabled(true);
				cmd = TOTAL;
			break;
			case NONE:
				addB.setEnabled(true);
				deleteB.setEnabled(true);
				searchB.setEnabled(true);
				totalB.setEnabled(true);
				
				updateB.setEnabled(true);
			break;
			
			case UPDATE_1:
				updateB.setEnabled(true);
				setEditable(UPDATE_1);
				cmd = UPDATE_1;
			break;
			case UPDATE_2:
				updateB.setEnabled(true);
				setEditable(UPDATE_2);
				cmd = UPDATE_2;
			break;
			
		}
	}

	public void clear() {
		numTF.setText("");
		nameTF.setText("");
		phoneTF.setText("");
		ageTF.setText("");
		addressTF.setText("");
	}

	public void actionPerformed(ActionEvent ev)
	{		
		Component c = (Component) ev.getSource();

		try 
		{
			// 추가 
			if (c == addB) 
			{
				if (cmd != ADD) 
				{
					setEnable(ADD);
				} 
				else
				{
					// 텍스트필드의 넘버값 가져옴
					String vnum = numTF.getText().trim();
					// 처음 입력한 문자가 숫자인지 문자인지 판단. 
					for(int i = 0; i < vnum.length(); i++)
					{
						char cc = vnum.charAt(i);
						if((int)cc < 48 || (int)cc > 57)
						{
							JOptionPane.showMessageDialog(getParent(), "번호는 숫자만 입력가능!!!");
							numTF.requestFocus();
							return;
						}						
					}										
					
					String vname = nameTF.getText().trim();
					if (vnum == null || vname == null || vnum.length() == 0 || vname.length() == 0)
						return;
					String vage = ageTF.getText().trim();
					// 처음 입력한 문자가 숫자인지 문자인지 판단. 
					for(int i = 0; i < vage.length(); i++)
					{
						char cc = vage.charAt(i);
						if((int)cc < 48 || (int)cc > 57)
						{
							JOptionPane.showMessageDialog(getParent(), "나이는 숫자만 입력가능!!");
							ageTF.requestFocus();
							return;
						}						
					}
					String vphone = phoneTF.getText().trim();					
					String vaddress = addressTF.getText().trim();
					//savefile
					// Member 추가		
			//		memberDAO.addMember(new Member(1, "김경호", 43, "011-4563-5656", "경기도민"));					
					Member member = new Member(Integer.parseInt(vnum), vname, Integer.parseInt(vage), vphone, vaddress);
					memberDAO.addMember(member);
					
					
					setEnable(NONE);
					clear();
					cmd = NONE;
					initialize();
				}
			}
			else if (c == updateB) 
			{
				if (cmd != UPDATE_1 && cmd != UPDATE_2) 
				{
					setEnable(UPDATE_1);
				}
				else if (cmd != UPDATE_2) 
				{

					display.setText("");
					display.append("====================================================================\n");
					display.append("번 호\t이 름\t나 이\t\t전 화\t\t\t주 소\t\r\n");
					display.append("====================================================================\n");
					
					// 텍스트필드의 넘버값 가져옴
					String vnum = numTF.getText().trim();
					// 처음 입력한 문자가 숫자인지 문자인지 판단. 
					for(int i = 0; i < vnum.length(); i++)
					{
						char cc = vnum.charAt(i);
						if((int)cc < 48 || (int)cc > 57)
						{
							JOptionPane.showMessageDialog(getParent(), "번호는 숫자만 입력가능!!!");
							numTF.requestFocus();
							return;
						}						
					}					
					if (vnum == null || vnum.length() == 0) return;
					
					//savefile
					// Member 추가							
			//		Member member = new Member(Integer.parseInt(vnum), vname, Integer.parseInt(vage), vphone, vaddress);
					Member member = memberDAO.findByNo(Integer.parseInt(vnum));
					
				//	System.out.println("member : "+member);								
				//	System.out.println("num : "+member.getNo());
				//	System.out.println("name : "+member.getName());
					// 만약 번호로 검색된 정보가 없다면 리턴 
					if(member == null)
					{	
						JOptionPane.showMessageDialog(getParent(), "검색된 번호가 존재하지 않습니다.");
						numTF.requestFocus();
						return;
					}
										
			//		numTF, nameTF, phoneTF, ageTF, addressTF;
					numTF.setText(member.getNo()+"");
					nameTF.setText(member.getName()+"");
					phoneTF.setText(member.getTel()+"");
					ageTF.setText(member.getAge()+"");
					addressTF.setText(member.getAddress()+"");
					
					// 프레임에 붙여주기 
					String memberStr = 
							member.getNo()+"\t"+
							member.getName()+"\t"+
							member.getAge()+"\t\t"+
							member.getTel()+"\t\t\t"+
							member.getAddress()+"\t\r\n";
					
					display.append(memberStr);					
					
					setEnable(UPDATE_2);
				//	clear();
					cmd = UPDATE_2;
				//	initialize();				
					
				}
				else
				{
					// 텍스트필드의 넘버값 가져옴
					String vnum = numTF.getText().trim();					
					String vname = nameTF.getText().trim();
					if (vnum == null || vname == null || vnum.length() == 0 || vname.length() == 0)
						return;
					String vage = ageTF.getText().trim();
					// 처음 입력한 문자가 숫자인지 문자인지 판단. 
					for(int i = 0; i < vage.length(); i++)
					{
						char cc = vage.charAt(i);
						if((int)cc < 48 || (int)cc > 57)
						{
							JOptionPane.showMessageDialog(getParent(), "나이는 숫자만 입력가능!!");
							ageTF.requestFocus();
							return;
						}						
					}
					String vphone = phoneTF.getText().trim();					
					String vaddress = addressTF.getText().trim();
					//savefile
					// Member 추가							
					Member member = new Member(Integer.parseInt(vnum), vname, Integer.parseInt(vage), vphone, vaddress);
					memberDAO.updateMember(member);
					
					setEnable(NONE);
					clear();
					cmd = NONE;
					initialize();
				}
			}
			// 삭제 
			else if (c == deleteB) 
			{
				if (cmd != DELETE) 
				{
					setEnable(DELETE);
				} 
				else
				{
					String vnum = numTF.getText().trim();
					if (vnum == null || vnum.length() == 0)	return;
				
					//Member 삭제
					memberDAO.deleteMember(Integer.parseInt(vnum));

					setEnable(NONE);
					clear();
					cmd = NONE;
					initialize();
				}
			} 
			// 검색
			else if (c == searchB) 
			{
				if (cmd != SEARCH)
				{
					setEnable(SEARCH);
				} 
				else 
				{
					String vname = nameTF.getText().trim();
					if (vname == null || vname.length() == 0) return;
					
					display.setText("");
					display.append("====================================================================\n");
					display.append("번 호\t이 름\t나 이\t\t전 화\t\t\t주 소\t\r\n");
					display.append("====================================================================\n");

					// Member 여러명찾기
					ArrayList findMemberList = memberDAO.findByName(vname);					
					for(int i = 0; i < findMemberList.size(); i++)
					{
						Member member = (Member)findMemberList.get(i);						
						String total = 
								member.getNo()+"\t"+
								member.getName()+"\t"+
								member.getAge()+"\t\t"+
								member.getTel()+"\t\t\t"+
								member.getAddress()+"\t\r\n";
						
						display.append(total);								
					}
					
					setEnable(NONE);
					clear();
					cmd = NONE;
					initialize();
				}
			}
			// 전체 
			else if (c == totalB) {
				
					
				display.setText("");
				display.append("전체인원 : "+memberDAO.getRecordCount()+"\n");
				display.append("====================================================================\n");
				display.append("번 호\t이 름\t나 이\t\t전 화\t\t\t주 소\t\r\n");
				display.append("====================================================================\n");

				// Member 전체리스트
				ArrayList allMemberList = memberDAO.getMemberList();
				for(int i = 0; i < allMemberList.size(); i++)
				{
					Member member = (Member)allMemberList.get(i);					
					String total = 
							member.getNo()+"\t"+
							member.getName()+"\t"+
							member.getAge()+"\t\t"+
							member.getTel()+"\t\t\t"+
							member.getAddress()+"\t\r\n";
					
					display.append(total);						
				}
			}
			// 취소 
			else if (c == cancelB) {
				setEnable(NONE);
				initialize();
				clear();
				cmd = NONE;
			}
		} catch (Exception e) {
			System.out.println("예외 발생 : " + e);
		}
		return;
	}

	public static void main(String args[]) throws Exception {
		MemberUIMain xxxApp = new MemberUIMain();
	}
}
