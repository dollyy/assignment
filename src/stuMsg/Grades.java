package stuMsg;

public class Grades {
	private String gid;
	private String gyear;
	private String gname;
	private int gchi;
	private String chiName;
	private int gmath;
	private String mathName;
	private int geng;
	private String engName;
	private int gsci;
	private String sciName;
	
	private int gart;
	private String artName;
	public String getChiName() {
		return chiName;
	}
	public void setChiName(String chiName) {
		this.chiName = chiName;
	}
	public String getMathName() {
		return mathName;
	}
	public void setMathName(String mathName) {
		this.mathName = mathName;
	}
	public String getEngName() {
		return engName;
	}
	public void setEngName(String engName) {
		this.engName = engName;
	}
	public String getSciName() {
		return sciName;
	}
	public void setSciName(String sciName) {
		this.sciName = sciName;
	}
	public String getArtName() {
		return artName;
	}
	public void setArtName(String artName) {
		this.artName = artName;
	}
	public String getGid() {
		return gid;
	}
	public void setGid(String gid) {
		this.gid = gid;
	}
	public String getGyear() {
		return gyear;
	}
	public void setGyear(String gyear) {
		this.gyear = gyear;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	public int getGchi() {
		return gchi;
	}
	public void setGchi(int gchi) {
		this.gchi = gchi;
	}
	public int getGmath() {
		return gmath;
	}
	public void setGmath(int gmath) {
		this.gmath = gmath;
	}
	public int getGeng() {
		return geng;
	}
	public void setGeng(int geng) {
		this.geng = geng;
	}
	public int getGsci() {
		return gsci;
	}
	public void setGsci(int gsci) {
		this.gsci = gsci;
	}
	public int getGart() {
		return gart;
	}
	public void setGart(int gart) {
		this.gart = gart;
	}
	@Override
	public String toString() {
		return "Grades [gid=" + gid + ", gyear=" + gyear + ", gname=" + gname
				+ ", gchi=" + gchi + ", gmath=" + gmath + ", geng=" + geng
				+ ", gsci=" + gsci + ", gart=" + gart + "]";
	}
	

}
