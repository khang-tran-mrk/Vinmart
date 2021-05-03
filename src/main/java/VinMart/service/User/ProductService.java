package VinMart.service.User;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import VinMart.dao.ProductDao;
import VinMart.entities.Categorys;
import VinMart.entities.NhaCungCap;
import VinMart.entities.Products;

@Service
@Transactional
public class ProductService {

	@Autowired
	private ProductDao productDao;
	
	public List<Products> listAllkm(int amount) {
	    return productDao.listAllkm(amount);
	  }
	public List<Products> listAll(int amount) {
	    return productDao.listAll(amount);
	  }
	public List<Products> listAll() {
	    return productDao.listAll();
	  }
	public List<Products> listAllkm() {
	    return productDao.listAllkm();
	  }
	public Products GetProductByID(long product_id) {
		List<Products> listProducts = productDao.GetProductByID(product_id);
	
	    return listProducts.get(0);
	  }
	//getcatebyname
	public Categorys GetCateName(int caterogy_id) {
		List<Categorys> listcates = productDao.GetCateName(caterogy_id);
	
	    return listcates.get(0);
	  }
	public List<Products> GetSpBanChay(){
		  return productDao.GetSpBanChay();
	  }
	//-------------------------------------------------------------------
	//ADMIN-PAGE
	public List<Products> listAllPro() {
	    return productDao.listAllPro();
	  }
	//ADD 
	 public  void save(Products pro){
		    // validate business
		 productDao.save(pro);
		  }
	//ADD 
	public  void savencc(NhaCungCap ncc){
	// validate business
	productDao.savencc(ncc);
	}
	//productOLD
	public  void addproductOld(Products product){
		// validate business
		productDao.addproductOld(product);
		}
	
	//Del  
		public  void delete(int product_id){
		// validate business
			productDao.delete(product_id);
		}
		
	
}
