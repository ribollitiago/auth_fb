class Users {
    final int? usrId;
    final String usrEmail;
    final String usrPassword;

    Users({
        this.usrId,
        required this.usrEmail,
        required this.usrPassword,
    });

    factory Users.fromMap(Map<String, dynamic> json) => Users(
        usrId: json["usrID"],
        usrEmail: json["usrEmail"],
        usrPassword: json["usrPassword"],
    );

    Map<String, dynamic> toMap() => {
        "usrID": usrId,
        "usrEmail": usrEmail,
        "usrPassword": usrPassword,
    };
}
