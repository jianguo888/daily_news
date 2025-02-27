// Copyright (c) 2024 坚果派. All rights reserved.
// Author:坚果派
// Email: jianguo@nutpi.net

/// 新闻服务类
/// 负责与后端API通信，获取每日新闻数据
/// 主要功能：
/// - 发送HTTP请求获取新闻数据
/// - 处理API响应
/// - 错误处理和异常管理

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/daily_news_model.dart';

/// 新闻服务类
/// 提供获取每日新闻数据的方法
class NewsService {
  /// API基础URL
  static const String baseUrl = 'https://v3.alapi.cn/api/zaobao';

  /// API访问令牌
  /// 从环境变量获取token，避免将敏感信息提交到代码仓库
  static String get token =>
      const String.fromEnvironment('API_TOKEN', defaultValue: '');

  /// 获取每日新闻
  ///
  /// 发送GET请求到API获取最新的新闻数据
  ///
  /// 返回：
  /// - 成功时返回[DailyNews]实例
  /// - 失败时抛出带有错误信息的异常
  ///
  /// 异常处理：
  /// - 网络超时
  /// - API返回错误
  /// - 服务器错误
  /// - 网络连接问题
  /// - SSL证书验证失败
  Future<DailyNews> fetchDailyNews() async {
    try {
      final response = await http
          .get(
        Uri.parse('$baseUrl?token=$token&format=string'),
      )
          .timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw Exception('网络请求超时，请检查网络连接');
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        if (data['code'] == 200) {
          return DailyNews.fromJson(data['data']);
        } else {
          throw Exception('API返回错误：${data['msg'] ?? '未知错误'}');
        }
      } else {
        throw Exception('服务器错误：HTTP ${response.statusCode}');
      }
    } on FormatException {
      throw Exception('数据格式错误，请稍后重试');
    } catch (e) {
      if (e is Exception) {
        rethrow;
      }
      throw Exception('发生未知错误：$e');
    }
  }
}
