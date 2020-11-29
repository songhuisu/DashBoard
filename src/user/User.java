package user;

public class User {
	private String jid;
	private String jpw;
	private String jrepass;
	private String jName;
	private String jEmail;

	public User() {
		super(); // TODO Auto-generated constructor stub }
	}

	public User(String jid, String jpw, String jrepass, String jName, String jEmail) {
		super();
		this.jid = jid;
		this.jpw = jpw;
		this.jrepass = jrepass;
		this.jName = jName;
		this.jEmail = jEmail;
	}

	@Override
	public String toString() {
		return "User [jid=" + jid + ", jpw=" + jpw + ", jrepass=" + jrepass + ", jName=" + jName + ", jEmail=" + jEmail
				+ "]";
	}

	public String getJid() {
		return jid;
	}

	public void setJid(String jid) {
		this.jid = jid;
	}

	public String getJpw() {
		return jpw;
	}

	public void setJpw(String jpw) {
		this.jpw = jpw;
	}

	public String getJrepass() {
		return jrepass;
	}

	public void setJrepass(String jrepass) {
		this.jrepass = jrepass;
	}

	public String getjName() {
		return jName;
	}

	public void setjName(String jName) {
		this.jName = jName;
	}

	public String getjEmail() {
		return jEmail;
	}

	public void setjEmail(String jEmail) {
		this.jEmail = jEmail;
	}

}
