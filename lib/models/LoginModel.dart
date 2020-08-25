

class LoginResponse{
  final String access_token;
  final String token_type;
  int expires_in;
  final String refresh_token;
  final String scope;
  final int created_at;

  LoginResponse({this.access_token,this.token_type,this.expires_in,this.refresh_token,this.scope,this.created_at});

  factory LoginResponse.fromJson(Map<String, dynamic> json){
    return LoginResponse(

      access_token: json['access_token'],
      created_at: json['created_at'],
      expires_in: json['expires_in'],
      refresh_token: json['refresh_token'],
      scope: json['scope'],
      token_type: json['token_type'],

    );
  }
}
