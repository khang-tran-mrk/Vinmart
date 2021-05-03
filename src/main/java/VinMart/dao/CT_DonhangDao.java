package VinMart.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import VinMart.entities.CT_DonHang;
import VinMart.entities.MapperCTDonHang;

@Repository
@Transactional
public class CT_DonhangDao extends BaseDao {
	
	//list
	 public List<CT_DonHang> listCtdh(int donhang_id) {
		    String sqlByID = "select * from CT_DonHang where donhang_id=" + donhang_id;
		    List<CT_DonHang> listDHByID = _jdbcTemplate.query(sqlByID, new MapperCTDonHang());
		    List<CT_DonHang> ListDh = new ArrayList<CT_DonHang>();
		    System.out.println("LISTDHBYID " + listDHByID.size() );
		    System.out.println("ListDh " + ListDh	.size() );
		    if(listDHByID.size()>0) { 
		    	 String sql = "select * from CT_DonHang where donhang_id=" + donhang_id;
		    	 ListDh = _jdbcTemplate.query(sql, new MapperCTDonHang());
			 }
			   
			    return ListDh;
			  }

	
}
