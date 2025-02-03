class ResponseModel {
  String? status;
  int? userId;
  String? userType;
  String? firstName;
  String? lastName;
  String? username;
  String? email;
  String? country;
  String? userActiveStatus;
  String? message;

  ResponseModel(
      {this.status,
        this.userId,
        this.userType,
        this.firstName,
        this.lastName,
        this.username,
        this.email,
        this.country,
        this.userActiveStatus,
        this.message});

  ResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    userId = json['user_id'];
    userType = json['user_type'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    username = json['username'];
    email = json['email'];
    country = json['country'];
    userActiveStatus = json['user_active_status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['user_id'] = this.userId;
    data['user_type'] = this.userType;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['username'] = this.username;
    data['email'] = this.email;
    data['country'] = this.country;
    data['user_active_status'] = this.userActiveStatus;
    data['message'] = this.message;
    return data;
  }
}
