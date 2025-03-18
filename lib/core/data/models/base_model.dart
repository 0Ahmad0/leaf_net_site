
import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'base_model.g.dart';

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class BaseModel<T> {
  BaseModel( {required this.result,this.totalCount,this.targetUrl,this.message,this.unAuthorizedRequest, this.success,this.error});
  final T? result;
  // final MetaList? meta;
  // final LinksList? links;
  final String? message;
  final int? totalCount;
  final ErrorModel? error;
  final String? targetUrl;
  final bool? success;
  final bool? unAuthorizedRequest;
  factory BaseModel.fromJson(Map<String, dynamic> json,T Function(dynamic itemJson) fromJsonT) {

    //
    // if(json['result']=="[]")
    //   json['result']=[];

    if(!(json['result'] is List)){

      json['message']=json['message']??json['error']?['message'];
      // json['message']=json['message']??json['result']?['message']??json['error']?['message'];

      // /// for list
      // if(json['result']?['totalCount']!=null){
      //   json['totalCount']=json['result']?['totalCount'];
      //   json['result']=json['result']?['items'];
      // }
    }

    if(json['result']==null){
      json={'result':json,'message':json['message']};

    }



    return _$BaseModelFromJson(json,fromJsonT);
  }
  Map<String, dynamic> toJson(Object Function(T value) toJsonT) {
    final Map<String, dynamic> json = _$BaseModelToJson(this, toJsonT);
    return json;
  }
}


//@JsonSerializable(explicitToJson: true)
class BaseModels {
  List list;

  factory BaseModels.fromJson( json , Function(dynamic itemJson) fromJsonT) {


    return _$BaseModelsFromJson(json,fromJsonT);
  }


  Map<String, dynamic> toJson() => _$BaseModelsToJson(this);

  BaseModels({required this.list});
}
 _$BaseModelsFromJson(json,fromJsonT) => BaseModels(
  list: (json as List)
      .map((e) {
       return fromJsonT(e as Map<String, dynamic>);})
      .toList(),
);
Map<String, dynamic> _$BaseModelsToJson(BaseModels instance) =>
    <String, dynamic>{
      'list':
      instance.list.map((e) => e.toJson()).toList(),
    };
