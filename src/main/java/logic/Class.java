package logic;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class Class {
	private int cl_num;
	private int board_type;
	private int cl_type;
	private String cl_category;
	private String cl_title;
	private MultipartFile cl_img;
	private String cl_imgUrl;
	private String teacher;
	private int cl_price;
	private MultipartFile cl_info;
	private String cl_infoUrl;
	private MultipartFile cl_story;
	private String cl_storyUrl;
	private String cl_content;
	private Date cl_date;
	public int getCl_num() {
		return cl_num;
	}
	public void setCl_num(int cl_num) {
		this.cl_num = cl_num;
	}
	public int getBoard_type() {
		return board_type;
	}
	public void setBoard_type(int board_type) {
		this.board_type = board_type;
	}
	public int getCl_type() {
		return cl_type;
	}
	public void setCl_type(int cl_type) {
		this.cl_type = cl_type;
	}
	public String getCl_category() {
		return cl_category;
	}
	public void setCl_category(String cl_category) {
		this.cl_category = cl_category;
	}
	public String getCl_title() {
		return cl_title;
	}
	public void setCl_title(String cl_title) {
		this.cl_title = cl_title;
	}
	public MultipartFile getCl_img() {
		return cl_img;
	}
	public void setCl_img(MultipartFile cl_img) {
		this.cl_img = cl_img;
	}
	public String getCl_imgUrl() {
		return cl_imgUrl;
	}
	public void setCl_imgUrl(String cl_imgUrl) {
		this.cl_imgUrl = cl_imgUrl;
	}
	public String getTeacher() {
		return teacher;
	}
	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}
	public int getCl_price() {
		return cl_price;
	}
	public void setCl_price(int cl_price) {
		this.cl_price = cl_price;
	}
	public MultipartFile getCl_info() {
		return cl_info;
	}
	public void setCl_info(MultipartFile cl_info) {
		this.cl_info = cl_info;
	}
	public String getCl_infoUrl() {
		return cl_infoUrl;
	}
	public void setCl_infoUrl(String cl_infoUrl) {
		this.cl_infoUrl = cl_infoUrl;
	}
	public MultipartFile getCl_story() {
		return cl_story;
	}
	public void setCl_story(MultipartFile cl_story) {
		this.cl_story = cl_story;
	}
	public String getCl_storyUrl() {
		return cl_storyUrl;
	}
	public void setCl_storyUrl(String cl_storyUrl) {
		this.cl_storyUrl = cl_storyUrl;
	}
	public String getCl_content() {
		return cl_content;
	}
	public void setCl_content(String cl_content) {
		this.cl_content = cl_content;
	}
	public Date getCl_date() {
		return cl_date;
	}
	public void setCl_date(Date cl_date) {
		this.cl_date = cl_date;
	}
	
	@Override
	public String toString() {
		return "Class [cl_num=" + cl_num + ", board_type=" + board_type + ", cl_type=" + cl_type + ", cl_category="
				+ cl_category + ", cl_title=" + cl_title + ", cl_img=" + cl_img + ", cl_imgUrl=" + cl_imgUrl
				+ ", teacher=" + teacher + ", cl_price=" + cl_price + ", cl_info=" + cl_info + ", cl_infoUrl="
				+ cl_infoUrl + ", cl_story=" + cl_story + ", cl_storyUrl=" + cl_storyUrl + ", cl_content=" + cl_content
				+ ", cl_date=" + cl_date + "]";
	}
}