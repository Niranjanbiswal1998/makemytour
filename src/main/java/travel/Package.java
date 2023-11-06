package travel;

public class Package {
	private int pack_id,fk_cat_id,fk_subcat_id;
	public String pack_name,pic1Path,pic2Path,pic3Path,pack_details,cat,subcat;
	private float pack_price;
	 boolean status;
	public int getPack_id() {
		return pack_id;
	}
	public void setPack_id(int pack_id) {
		this.pack_id = pack_id;
	}
	public int getFk_cat_id() {
		return fk_cat_id;
	}
	public void setFk_cat_id(int fk_cat_id) {
		this.fk_cat_id = fk_cat_id;
	}
	public int getFk_subcat_id() {
		return fk_subcat_id;
	}
	public void setFk_subcat_id(int fk_subcat_id) {
		this.fk_subcat_id = fk_subcat_id;
	}
	public String getPack_name() {
		return pack_name;
	}
	public void setPack_name(String pack_name) {
		this.pack_name = pack_name;
	}
	public String getPic1Path() {
		return pic1Path;
	}
	public void setPic1Path(String pic1Path) {
		this.pic1Path = pic1Path;
	}
	public String getPic2Path() {
		return pic2Path;
	}
	public void setPic2Path(String pic2Path) {
		this.pic2Path = pic2Path;
	}
	public String getPic3Path() {
		return pic3Path;
	}
	public void setPic3Path(String pic3Path) {
		this.pic3Path = pic3Path;
	}
	public float getPack_price() {
		return pack_price;
	}
	public void setPack_price(float pack_price) {
		this.pack_price = pack_price;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	public String getPack_details() {
		return pack_details;
	}
	public void setPack_details(String pack_details) {
		this.pack_details = pack_details;
	}
	public String getCat() {
		return cat;
	}
	public void setCat(String cat) {
		this.cat = cat;
	}
	public String getSubcat() {
		return subcat;
	}
	public void setSubcat(String subcat) {
		this.subcat = subcat;
	}
	

}
