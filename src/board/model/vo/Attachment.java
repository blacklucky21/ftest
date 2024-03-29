package board.model.vo;

import java.sql.Date;

public class Attachment {
	private int fId;
	private int bId;
	private String originName;
	private String changeName;
	private String filePAth;
	private Date uploadDate;
	private int fileLevel;
	private int downloadCount;
	private String status;

	public Attachment() {
	}

	public Attachment(int bId, String changeName) {
		this.bId = bId;
		this.changeName = changeName;
	}

	public Attachment(int fId, int bId, String originName, String changeName, String filePAth, Date uploadDate,
			int fileLevel, int downloadCount, String status) {
		this.fId = fId;
		this.bId = bId;
		this.originName = originName;
		this.changeName = changeName;
		this.filePAth = filePAth;
		this.uploadDate = uploadDate;
		this.fileLevel = fileLevel;
		this.downloadCount = downloadCount;
		this.status = status;
	}

	public int getfId() {
		return fId;
	}

	public void setfId(int fId) {
		this.fId = fId;
	}

	public int getbId() {
		return bId;
	}

	public void setbId(int bId) {
		this.bId = bId;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getFilePAth() {
		return filePAth;
	}

	public void setFilePAth(String filePAth) {
		this.filePAth = filePAth;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public int getFileLevel() {
		return fileLevel;
	}

	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}

	public int getDownloadCount() {
		return downloadCount;
	}

	public void setDownloadCount(int downloadCount) {
		this.downloadCount = downloadCount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
