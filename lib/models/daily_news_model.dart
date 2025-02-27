// Copyright (c) 2024 坚果派. All rights reserved.
// Author:坚果派
// Email: jianguo@nutpi.net

/// 每日新闻数据模型
/// 用于存储和处理每日新闻的相关信息，包括：
/// - 日期
/// - 新闻内容
/// - 微语
/// - 头图
class DailyNews {
  /// 新闻日期
  final String date;

  /// 新闻内容
  final String news;

  /// 每日微语
  final String weiyu;

  /// 头图URL
  final String headImage;

  /// 构造函数
  ///
  /// 参数说明：
  /// - [date]: 新闻日期
  /// - [news]: 新闻内容
  /// - [weiyu]: 每日微语
  /// - [headImage]: 头图URL
  const DailyNews({
    required this.date,
    required this.news,
    required this.weiyu,
    required this.headImage,
  });

  /// 从JSON数据创建DailyNews实例
  ///
  /// [json] 包含新闻数据的JSON对象
  ///
  /// 返回：
  /// - 如果JSON数据有效，返回包含新闻信息的DailyNews实例
  /// - 如果JSON数据无效，返回包含空值的DailyNews实例
  factory DailyNews.fromJson(dynamic json) {
    if (json is Map<String, dynamic>) {
      final newsList = json['news'] is List
          ? (json['news'] as List).map((item) => item.toString()).toList()
          : <String>[];
      return DailyNews(
        date: json['date']?.toString() ?? '',
        news: newsList.join('\n'),
        weiyu: json['weiyu']?.toString() ?? '',
        headImage: json['head_image']?.toString() ?? '',
      );
    }

    return const DailyNews(date: '', news: '', weiyu: '', headImage: '');
  }
}
