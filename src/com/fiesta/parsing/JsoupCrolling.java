package com.fiesta.parsing;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class JsoupCrolling {

	public static void main(String[] args) {
		String URL = "https://www.google.co.kr/maps/search/%EC%9D%8C%ED%96%A5+%EC%A1%B0%EB%AA%85+%ED%9A%8C%EC%82%AC/@37.3871292,127.0625957,12z/data=!3m1!4b1";
		try {
			Document doc = Jsoup.connect(URL).get();
			Elements elem = doc.select("div[jstcache=\"662\"]"); 
			System.out.println(elem.text());
			for(Element e : elem.select("h3[class=\"section-result-title\"]")) {
				System.out.println(e.text());
			}
			/*
			ArrayList<String> comNameList = new ArrayList<>();
			ArrayList<String> comDescList = new ArrayList<>();
			
			for(Element e : elem.select("h3[class=\"LC20lb DKV0Md\"]")) {
				String comName = e.text()
						.replace("단체티 주문제작 전문 ", "")
						.replace("대학과잠바 | No.1 단체 과점퍼 주문제작 쇼핑몰 - ", "")
						.replace("티파나: No.1 단체티 주문 제작 쇼핑몰", "")
						.replace("단체티 주문제작 쇼핑몰 ", "")
						.replace("단체티 주문제작 ", "")
						.replace("-과잠,돕바,단체티 쇼핑몰", "")
						.replace("단체티ㅣ단체복 티셔츠ㅣ단체조끼ㅣ단체바람막이 주문 제작 ...", "")
						.replace("단체복은 ", "")
						.replace(" - 단체복, 단체맨투맨, 단체옷, 단체복 패딩, 과잠바", "");
				if(!comName.equals("")) {
					comNameList.add(comName);
				}
			}

			for(Element e : elem.select("span[class=\"st\"]")) {
				String comDesc = e.text()
						.replace("단체티 주문제작 전문 탑앤탑입니다. ", "")
						.replace("대학과잠바, 과점퍼제작, 과바람막이, 행사바람막이, 과복, 대학교바람막이, 동호회바람막이, 과잠바, 단체복바람막이, 과바막 주문제작 할인까지 가능한 쇼핑몰 - 티파 ...", "")
						.replace("단체복ㅣ단체티ㅣ단체 티셔츠 주문 제작ㅣ단체조끼ㅣ단체바람막이ㅣ트레이닝복ㅣ작업복ㅣ회사복 주문 제작.", "");
				if(!comDesc.equals("")) {
					comDescList.add(comDesc);
				}
			}
			
			for(int i=0; i<comNameList.size(); i++) {
				System.out.println(comNameList.get(i));
				System.out.println(comDescList.get(i));
			}*/
		} catch (IOException e) {
			System.out.println(e);
		}
	
	}

}
