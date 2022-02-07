import 'package:cinephile/domain/tralier/model/user_model.dart';
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int id;
  final String name, url;
  const UserEntity(this.id, this.name, this.url);

  @override
  List<Object> get props => [id, name, url];

  Map<String, dynamic> toMap(User user){
    return {'id': user.id, 'name': user.name,'url': user.url};
  }

  factory UserEntity.fromJson(Map<String, dynamic> json){
    return UserEntity(json['id'], json['name']?? '', json['url']??'');
  }

  User toModel(){
    return User(id,name,url);
  }
}