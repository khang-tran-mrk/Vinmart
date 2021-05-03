package VinMart.dao;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import VinMart.entities.Categorys;
import VinMart.entities.MapperCategorys;

@Repository
@Transactional

public class CategoryDao extends BaseDao {

	// add
	public void save(Categorys cate) {
		String sql = "INSERT INTO category (category_name, p_id) VALUES (?, ?)";
		_jdbcTemplate.update(sql, cate.getCategory_name(), cate.getP_id());
	}

	// xoa
	public void delete(int category_id) {
		String sql = "DELETE FROM category WHERE category_id = " + category_id;
		_jdbcTemplate.update(sql);
	}

	// chinh sua
	public void update(Categorys cate) {
		String sql = "UPDATE category SET category_name = ?, p_id = ? WHERE category_id = ? ";
		_jdbcTemplate.update(sql, cate.getCategory_name(), cate.getP_id(), cate.getCategory_id());

	}

	// tim kim theo id
	public List<Categorys> findById(long category_id) {
		String sql = "SELECT * FROM category WHERE category_id =" + category_id;
		return _jdbcTemplate.query(sql, new MapperCategorys());
	}

	// hien thi tat ca danh muc ra ngoai view
	public List<Categorys> listAll() {
		String sql = "SELECT * FROM category";
		return _jdbcTemplate.query(sql, new MapperCategorys());
	}

	// hien thi ́ san pham dau tien cua dnah muc ra ngoai view
	public List<Categorys> listtop8() {
		String sql = "SELECT top 8 * FROM category";
		return _jdbcTemplate.query(sql, new MapperCategorys());
	}

}
