// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleData _$ArticleDataFromJson(Map<String, dynamic> json) {
  return ArticleData()
    ..apkLink = json['apkLink'] as String
    ..author = json['author'] as String
    ..chapterId = json['chapterId'] as int
    ..chapterName = json['chapterName'] as String
    ..collect = json['collect'] as bool
    ..courseId = json['courseId'] as int
    ..desc = json['desc'] as String
    ..envelopePic = json['envelopePic'] as String
    ..fresh = json['fresh'] as bool
    ..id = json['id'] as int
    ..link = json['link'] as String
    ..niceDate = json['niceDate'] as String
    ..origin = json['origin'] as String
    ..prefix = json['prefix'] as String
    ..projectLink = json['projectLink'] as String
    ..publishTime = json['publishTime'] as int
    ..superChapterId = json['superChapterId'] as int
    ..superChapterName = json['superChapterName'] as String
    ..title = json['title'] as String
    ..type = json['type'] as int
    ..userId = json['userId'] as int
    ..visible = json['visible'] as int
    ..zan = json['zan'] as int
    ..audit = json['audit'] as int
    ..tags = json['tags']
    ..niceShareDate = json['niceShareDate'] as String
    ..selfVisible = json['selfVisible'] as int
    ..shareDate = json['shareDate'] as int
    ..shareUser = json['shareUser'] as String;
}

Map<String, dynamic> _$ArticleDataToJson(ArticleData instance) =>
    <String, dynamic>{
      'apkLink': instance.apkLink,
      'author': instance.author,
      'chapterId': instance.chapterId,
      'chapterName': instance.chapterName,
      'collect': instance.collect,
      'courseId': instance.courseId,
      'desc': instance.desc,
      'envelopePic': instance.envelopePic,
      'fresh': instance.fresh,
      'id': instance.id,
      'link': instance.link,
      'niceDate': instance.niceDate,
      'origin': instance.origin,
      'prefix': instance.prefix,
      'projectLink': instance.projectLink,
      'publishTime': instance.publishTime,
      'superChapterId': instance.superChapterId,
      'superChapterName': instance.superChapterName,
      'title': instance.title,
      'type': instance.type,
      'userId': instance.userId,
      'visible': instance.visible,
      'zan': instance.zan,
      'audit': instance.audit,
      'tags': instance.tags,
      'niceShareDate': instance.niceShareDate,
      'selfVisible': instance.selfVisible,
      'shareDate': instance.shareDate,
      'shareUser': instance.shareUser,
    };
