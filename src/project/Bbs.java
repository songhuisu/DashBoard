package project;

public class Bbs {
	@Override
	public String toString() {
		return "Bbs [bbsID=" + bbsID + ", bbsTitle=" + bbsTitle + ", bbsContent=" + bbsContent + ", bbsPercent="
				+ bbsPercent + ", bbsStartDate=" + bbsStartDate + ", bbsLastDate=" + bbsLastDate + "]";
	}

	private int bbsID;
	private String bbsTitle;
	private String bbsContent;
	private int bbsPercent;
	private String bbsStartDate;
	private String bbsLastDate;
	private String bbsUser;
	
	public Bbs(String bbsTitle, String bbsContent, int bbsPercent, String bbsStartDate, String bbsLastDate,String bbsUser) {
		super();
		this.bbsTitle = bbsTitle;
		this.bbsContent = bbsContent;
		this.bbsPercent = bbsPercent;
		this.bbsStartDate = bbsStartDate;
		this.bbsLastDate = bbsLastDate;
		this.bbsUser = bbsUser;
	}


	public String getBbsUser() {
		return bbsUser;
	}


	public void setBbsUser(String bbsUser) {
		this.bbsUser = bbsUser;
	}


	public Bbs() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getBbsID() {
		return bbsID;
	}

	public void setBbsID(int bbsID) {
		this.bbsID = bbsID;
	}

	public String getBbsTitle() {
		return bbsTitle;
	}

	public void setBbsTitle(String bbsTitle) {
		this.bbsTitle = bbsTitle;
	}

	public String getBbsContent() {
		return bbsContent;
	}

	public void setBbsContent(String bbsContent) {
		this.bbsContent = bbsContent;
	}

	public int getBbsPercent() {
		return bbsPercent;
	}

	public void setBbsPercent(int bbsPercent) {
		this.bbsPercent = bbsPercent;
	}

	public String getBbsStartDate() {
		return bbsStartDate;
	}

	public void setBbsStartDate(String bbsStartDate) {
		this.bbsStartDate = bbsStartDate;
	}

	public String getBbsLastDate() {
		return bbsLastDate;
	}

	public void setBbsLastDate(String bbsLastDate) {
		this.bbsLastDate = bbsLastDate;
	}

}
