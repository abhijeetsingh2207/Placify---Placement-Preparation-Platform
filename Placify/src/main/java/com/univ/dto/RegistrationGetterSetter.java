package com.univ.dto;

public class RegistrationGetterSetter {
int mobileNo,year;
String name,email,enrollmentNo,password,coordinatorId,status;  //confirmPassword,
public String getStatus() {
	return status;
}

public void setStatus(String status) {
	this.status = status;
}

public String getCoordinatorId() {
	return coordinatorId;
}

public void setCoordinatorId(String coordinatorId) {
	this.coordinatorId = coordinatorId;
}
public int getYear() {
	return year;
}

public void setYear(int year) {
	this.year = year;
}
//
//public int getId() {
//	return id;
//}
//
//public void setId(int id) {
//	this.id = id;
//}

public int getMobileNo() {
	return mobileNo;
}

public void setMobileNo(int mobileNo) {
	this.mobileNo = mobileNo;
}

public String getName() {
	return name;
}

public void setName(String name) {
	this.name = name;
}

public String getEmail() {
	return email;
}

public void setEmail(String email) {
	this.email = email;
}

public String getEnrollmentNo() {
	return enrollmentNo;
}

public void setEnrollmentNo(String enrollmentNo) {
	this.enrollmentNo = enrollmentNo;
}

public String getPassword() {
	return password;
}

public void setPassword(String password) {
	this.password = password;
}

//public String getConfirmPassword() {
//	return confirmPassword;
//}
//
//public void setConfirmPassword(String confirmPassword) {
//	this.confirmPassword = confirmPassword;
//}

public RegistrationGetterSetter() {
	super();
}
//
//public RegistrationGetterSetter(String name, String email,String enrollmentNo, int mobileNo,  String password,String confirmPassword) {
//	super();
//	this.name = name;
//	this.email = email;
//	this.enrollmentNo = enrollmentNo;
//	this.mobileNo = mobileNo;
//	this.password = password;
//	this.confirmPassword = confirmPassword;
//}


public RegistrationGetterSetter(String name, String email,String enrollmentNo, int mobileNo, int year,  String password, String status) {
	super();
	this.name = name;
	this.email = email;
	this.enrollmentNo = enrollmentNo;
	this.mobileNo = mobileNo;
	this.year= year;
	this.password = password;
	this.status= status;
	
}
public RegistrationGetterSetter(String name, String email,String enrollmentNo, int mobileNo, int year,  String password) {
	super();
	this.name = name;
	this.email = email;
	this.enrollmentNo = enrollmentNo;
	this.mobileNo = mobileNo;
	this.year= year;
	this.password = password;
	
	
}

public RegistrationGetterSetter(String name,String coordinatorId, int mobileNo, String email, String password, String status) {
	super();
	this.name = name;
	this.coordinatorId = coordinatorId;
	this.mobileNo = mobileNo;
	this.email = email;
	this.password = password;
	this.status= status;
}
public RegistrationGetterSetter(String name,String coordinatorId, int mobileNo, String email, String password) {
	super();
	this.name = name;
	this.coordinatorId = coordinatorId;
	this.mobileNo = mobileNo;
	this.email = email;
	this.password = password;
	
}

}
