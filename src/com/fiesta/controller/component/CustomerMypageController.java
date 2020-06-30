package com.fiesta.controller.component;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fiesta.controller.Controller;
import com.fiesta.controller.ModelAndView;
import com.fiesta.model.dao.CustomerDaoImpl;
import com.fiesta.model.dao.QuestionDaoImpl;
import com.fiesta.model.vo.Answer;
import com.fiesta.model.vo.Custorder;
import com.fiesta.model.vo.Custorderdetail;
import com.fiesta.model.vo.Custrequest;
import com.fiesta.model.vo.Custrequestdetail;
import com.fiesta.model.vo.Question;

public class CustomerMypageController implements Controller {

	@Override
	public ModelAndView handle(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
//		HttpSession session = request.getSession();
//		String email = session.getAttribute("customer").
		
//		String email = request.getParameter("custEmail"); 
//		System.out.println(email);
		
		String custEmail = "encore@gmail.com";
		
		String path = "customerMypage.jsp";

		//주문내역
		ArrayList<Custorder> orderList = new ArrayList<>();
		ArrayList<Custorderdetail> orderDetailList = new ArrayList<>();
		
		orderList = CustomerDaoImpl.getInstance().showAllCustOrder(custEmail);
		orderDetailList = CustomerDaoImpl.getInstance().showAllCustOrderDetail(custEmail);
		
		//의뢰내역
/*		ArrayList<Custrequest> requestList = new ArrayList<>();
		ArrayList<Custrequestdetail> requestDetailList = new ArrayList<>();
		
		requestList = CustomerDaoImpl.getInstance().showAllCustRequest(custEmail);
		requestDetailList = CustomerDaoImpl.getInstance().showAllCustRequestDetail(custEmail);*/
		
		//문의답변내역
		ArrayList<Question> questionList = QuestionDaoImpl.getInstance().showAllQuestion(custEmail);
		ArrayList<Question> questionDetail = new ArrayList<>();
		ArrayList<Answer> answerList = new ArrayList<>();
		Answer answer = null;
		Question qDetail = null;
		
		for(Question q : questionList) {
			answer = new Answer();
			qDetail = new Question();
			answer = QuestionDaoImpl.getInstance().showAnswer(q.getqCode());
			qDetail = QuestionDaoImpl.getInstance().showQuestion(q.getqCode());
			
			questionDetail.add(qDetail);

			answerList.add(answer);

		}
				
		//주문의뢰내역 바인딩
		request.setAttribute("orderList", orderList);
		request.setAttribute("orderDetailList", orderDetailList);
/*		request.setAttribute("requestList", requestList);
		request.setAttribute("requestDetailList", requestDetailList);		*/
		
		//문의답변 바인딩
		request.setAttribute("questionList", questionList);
		request.setAttribute("questionDetail", questionDetail);
		request.setAttribute("answerList", answerList);

		return new ModelAndView(path);
	}

}
