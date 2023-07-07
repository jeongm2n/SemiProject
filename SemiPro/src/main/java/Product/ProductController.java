package Product;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.io.OutputStream;
import java.lang.Object;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;



@WebServlet("/product/*")
public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	ProductDAO productDAO;
	
	public void init() throws ServletException {
		productDAO = new ProductDAO();
	}
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		String nextPage = null;
		String action = request.getPathInfo();
		HttpSession session = request.getSession();
		String id =	(String)session.getAttribute("id");
		
		if (action.equals("/listProducts.do")) 
		{
			List<ProductVO> ProductList = productDAO.listProducts(id);
			request.setAttribute("ProductList", ProductList);
			nextPage = "../productor/productor.jsp";	
			
			RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
			
			dispatch.forward(request, response);
		}
		
		doPost(request, response);
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doHandle(request, response);
	}
	
	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nextPage = null;
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String encoding = "UTF-8";
		String action = request.getPathInfo();
		HttpSession session = request.getSession();
		String id =	(String)session.getAttribute("id");
	
		if (action.equals("/addProduct.do")) {
			File currentDirPath = new File("/Users/jeongmin/SemiProject/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/SemiPro/img");
			DiskFileItemFactory factory = new DiskFileItemFactory();
			factory.setRepository(currentDirPath);
			factory.setSizeThreshold(1024 * 1024);
			String[] Param = new String[5];
			ServletFileUpload upload = new ServletFileUpload(factory);
			try {
				List items = upload.parseRequest(request);
				for (int i = 0; i < items.size(); i++) {
					FileItem fileItem = (FileItem) items.get(i);
	
					if (fileItem.isFormField()) {
						Param[i] = fileItem.getString(encoding);
					} else {
						Param[i] = fileItem.getName();
						if (fileItem.getSize() > 0) {
							int idx = fileItem.getName().lastIndexOf("\\");
							if (idx == -1) {
								idx = fileItem.getName().lastIndexOf("/"); 
							}
							String fileName = fileItem.getName().substring(idx + 1);
							File uploadFile = new File(currentDirPath + "/" + fileName);
							fileItem.write(uploadFile);
						} // end if
					} // end if
				} // end for
						     
				String name = Param[0];
				String kind = Param[1];
				String many = Param[2];
				String img = Param[3];
				String date = Param[4];
	
				ProductVO productVO = new ProductVO(name, kind, many, id, img, date);
				productDAO.addProduct(productVO);
			} catch (Exception e) {
				e.printStackTrace();
			}
			nextPage = "/product/listProducts.do";
		}else if(action.equals("/showProducts.do")){  //Result.jsp에 제품 종류별로 화면에 띄우기 위한 action
			String kind = request.getParameter("str"); //Main.jsp, Result.jsp에서 넘어온 str을 변수 kind에 저장
			System.out.println("str="+kind);
			List<ProductVO> productList = productDAO.showProducts(kind); 
			//ProductDAO.java의 showProducts 함수에 kind를 매개변수로 보내서 실행한 후 productList에 결과값들을 담음 
			request.setAttribute("productList", productList);
			//productList라는 객체에 productList를 저장
			nextPage = "/food/Result.jsp"; //food 디렉토리의 Result.jsp로 이동
		}else if(action.equals("/Purchase.do")){ //구매를 위한 action
			nextPage = "/food/Purchase.jsp"; //food 디렉토리의 Purchase.jsp로 이동
		}else if(action.equals("/Main.do")) { //Main.jsp를 띄우기 위한 action
			List<ProductVO> allList = productDAO.showAll();
			//ProductDAO의 showAll 함수를 실행시켜 모든 상품에 대한 이미지, 제품명을 allList에 담음
			request.setAttribute("allList", allList); //allList라는 객체에 allList를 저장
			nextPage = "/Main.jsp"; //Main.jsp로 이동
		}
		else {
			List<ProductVO> productorsList = productDAO.listProducts(id);
			request.setAttribute("productorsList", productorsList);
		}
			RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
			
			dispatch.forward(request, response);
	}

}