package entity;

import java.sql.Date;

public class Order {
	int oid;
	int uid;
	int totalQuantity;
	double totalMoney;
	Date purchaseDate;
	String address;
	String email;
	String phone;
	String status;
	
	public Order() {
		
	}
	
	public Order(int oid, int uid, int totalQuantity, double totalMoney, Date purchaseDate, String address,
			String email, String phone, String status) {
		this.oid = oid;
		this.uid = uid;
		this.totalQuantity = totalQuantity;
		this.totalMoney = totalMoney;
		this.purchaseDate = purchaseDate;
		this.address = address;
		this.email = email;
		this.phone = phone;
		this.status = status;
	}

	public int getOid() {
		return oid;
	}

	public void setOid(int oid) {
		this.oid = oid;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public int getTotalQuantity() {
		return totalQuantity;
	}
	public void setTotalQuantity(int totalQuantity) {
		this.totalQuantity = totalQuantity;
	}
	public double getTotalMoney() {
		return totalMoney;
	}
	public void setTotalMoney(double totalMoney) {
		this.totalMoney = totalMoney;
	}

	public Date getPurchaseDate() {
		return purchaseDate;
	}
	public void setPurchaseDate(Date purchaseDate) {
		this.purchaseDate = purchaseDate;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	@Override
	public String toString() {
		return "Order [uid=" + oid + ", pid=" + uid + ", totalQuantity=" + totalQuantity + ", totalMoney=" + totalMoney
				+ ", purchaseDate=" + purchaseDate + ", address=" + address + ", email=" + email + ", phone=" + phone
				+ ", status=" + status + "]";
	}
	

}
