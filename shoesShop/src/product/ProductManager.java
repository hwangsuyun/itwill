package product;

import java.util.ArrayList;


public class ProductManager {

	private static ProductManager _productManager;
	private ProductManager(){}
	public static ProductManager getMembermanager(){
		if(_productManager==null)
		{
			_productManager = new ProductManager();
		}
		return _productManager;
}
	//삭제
	public int remove(String p_code) throws Exception{
		return getProductDao().remove(p_code);
	}
	
	//전체 상품목록
	public ArrayList<ProductDTO> findAll() throws Exception{
		return getProductDao().findAll();
	}
	
	//p_code로 상품하나찾기
	public ProductDTO findOne(String p_code) {
		ProductDTO productDto = null;	
		try {
		 productDto = getProductDao().findOne(p_code);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return productDto;
	}
	
	//객체반환
	private ProductDAO getProductDao(){
		return ProductDAO.getProductDAO();
	}
	
}
