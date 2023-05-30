// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:convite/app/features/convites/models/convite_model.dart';

class AllConvitesModel {
  final int idUSer;
  final String docUser;
  final List<ConviteModel> convites;
  AllConvitesModel({
    required this.idUSer,
    required this.docUser,
    required this.convites,
  });
  static AllConvitesModel fromJson(Map<String, dynamic> map){
    return AllConvitesModel(
      idUSer: map['usuario_id'],
      docUser: map['documento'],
      convites: map['convites']);
  }
  
}
