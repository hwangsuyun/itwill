/*********************************************
��    ��   �� : JDU.java                     *
��         �� : ��ƿŬ����                   *
���� ���α׷� : jsp                          *
��         �� :                              *
*********************************************/

package board.common;

import java.io.*;

public class JDU{
	
	public static String get8859_1(String ko)
	{
		if (ko == null) {
			return null;
		}
		
		try {
			return new String(ko.getBytes("EUC_KR"),"8859_1");
		} catch(Exception e) {
			return ko;
		}
	}

	
	public static String getEUC_KR(String en)
	{
		if (en == null) {
			return null;
		}
		try {
   			return new String (en.getBytes("8859_1"), "EUC_KR");
		} catch(Exception e) {
			return en;
		}
   	}

	
	// str ���ڿ����� rep�� �ش��ϴ� ���ڿ��� tok�� ��ȯ��Ű�� �޼ҵ�..
	public static String getReplace(String str, String rep, String tok)
	{
		String retStr = "";
		if (str==null) return "";
		if (str.equals("")) return "";
		for(int i = 0, j = 0; (j = str.indexOf(rep,i)) > -1 ; i = j+rep.length())
		{
			retStr += (str.substring(i,j) + tok);
		}
		return (str.indexOf(rep) == -1) ? str : retStr + str.substring(str.lastIndexOf(rep)+rep.length(),str.length());
	}

	//���ϴ� ���ڼ���ŭ�� ¥���� �޼ҵ�...
	public static String getStringLen(String inString, int len)
	{
		String outString = "";
		if(inString.length() > len)
			outString = inString.substring(0,len-1)+"...";
		else
			outString = inString;
		return outString;
	}
}
