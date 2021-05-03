package VinMart.service.Admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import VinMart.dao.CT_DonhangDao;
import VinMart.entities.CT_DonHang;

@Service
@Transactional
public class CT_DonhangService {

	@Autowired
	private CT_DonhangDao ct_dh;
	
	
	public CT_DonHang listCtdh(int donhang_id) {
		List<CT_DonHang> list = ct_dh.listCtdh(donhang_id);
	    return list.get(0);
	  }
}
