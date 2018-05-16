package lecture;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Action;
import model.ActionData;

public class InsertForm implements Action {

	@Override
	public ActionData execute(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("main", "lecture/insertForm.jsp");
		System.out.println("InsertForm에 왔지?");
		return new ActionData();
	}
}
