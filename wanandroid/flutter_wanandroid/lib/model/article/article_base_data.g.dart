// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_base_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleBaseData _$ArticleBaseDataFromJson(Map<String, dynamic> json) {
  return ArticleBaseData(
    json['data'],
    json['errorCode'] as int,
    json['errorMsg'] as String,
  );
}

Map<String, dynamic> _$ArticleBaseDataToJson(ArticleBaseData instance) =>
    <String, dynamic>{
      'data': instance.data,
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
    };
