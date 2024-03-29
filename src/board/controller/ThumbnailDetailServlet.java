package board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Attachment;
import board.model.vo.Board;

@WebServlet("/detail.th")
public class ThumbnailDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ThumbnailDetailServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int bid = Integer.parseInt(request.getParameter("bid"));
		
		BoardService service = new BoardService();
		Board board = service.selectBoard(bid);
		ArrayList<Attachment> fileList = service.selectThumbnail(bid);
		
		if(fileList !=null) {
			request.setAttribute("board", board);
			request.setAttribute("fileList", fileList);
			request.getRequestDispatcher("views/thumbnail/thumbnailDetailView.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "사진 게시판 상세보기에 실패하였습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
