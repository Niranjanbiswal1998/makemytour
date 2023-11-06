package travel;

import javax.servlet.http.Part;

public class Subcategory {
	private int subcat_id,fk_cat_id;
	public String subcat_name , subcat_details,subcat_pic;
	
	//Part filePart = request.getPart("photo");
	public String getSubcat_name() {
		return subcat_name;
	}
	public void setSubcat_name(String subcat_name) {
		this.subcat_name = subcat_name;
	}
	

	public int getSubcat_id() {
		return subcat_id;
	}
	public void setSubcat_id(int subcat_id) {
		this.subcat_id = subcat_id;
	}
	public int getFk_cat_id() {
		return fk_cat_id;
	}
	public void setFk_cat_id(int fk_cat_id) {
		this.fk_cat_id = fk_cat_id;
	}
	public String getSubcat_details() {
		return subcat_details;
	}
	public void setSubcat_details(String subcat_details) {
		this.subcat_details = subcat_details;
	}
	public String getSubcat_pic() {
		return subcat_pic;
	}
	public void setSubcat_pic(String subcat_pic) {
		this.subcat_pic = subcat_pic;
	}
	
}
