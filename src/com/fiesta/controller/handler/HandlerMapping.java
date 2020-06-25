package com.fiesta.controller.handler;

import com.fiesta.controller.Controller;
import com.fiesta.controller.component.*;

public class HandlerMapping {
	private static HandlerMapping handler = new HandlerMapping();
	private HandlerMapping() {}
	public static HandlerMapping getInstance() {
		return handler;
	}

	public Controller createController(String command) {
		Controller controller = null;
		
		// 작업 영역
		if(command.equals("serviceRegister.do")) {
			controller = new ServiceRegisterController();
			System.out.println("ServiceRegisterController 생성됨");
			
		}else if(command.equals("ServiceAllShow.do")) {
			controller = new ServiceAllShowController();
			System.out.println("ServiceAllShowController 생성됨");
			
		}else if(command.equals("ServiceDelete.do")) {
			controller = new ServiceDeleteController();
			System.out.println("ServiceDeleteController 생성됨");
			
		}else if(command.equals("ShowAllCompany.do")) {
			controller = new ShowAllComanyController();
			System.out.println("ShowAllComanyController 생성됨");
			
		}else if(command.equals("ShowAllCompanyByCategory.do")) {
			controller = new ShowAllCompanyByCategoryController();
			System.out.println("ShowAllCompanyListByCategoryController 생성됨");
			
		}else if(command.equals("questionRegister.do")) {
			controller = new QuestionRegisterController();
			System.out.println("QuestionRegisterController 생성됨");
			
		}else if(command.equals("questionAllShow.do")) {
			controller = new QuestionAllShowController();
			System.out.println("QuestionAllShowController 생성됨");
			
		}else if(command.equals("questionView.do")) {
			controller = new QuestionViewController();
			System.out.println("QuestionViewController 생성됨");
			
		}else if(command.equals("lookupCompany.do")) {
			controller = new lookupCompanyController();
			System.out.println("lookupCompanyController 생성됨");
			
		}else if(command.equals("SortCompany.do")) {
			controller = new SortCompanyController();
			System.out.println("SortCompanyController 생성됨");
		}else if(command.equals("InsertReview.do")) {
			controller = new InsertReviewController();
			System.out.println("InsertReviewController 생성됨");
		}

		return controller;
	}
}