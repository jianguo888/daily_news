// Copyright (c) 2024 坚果派. All rights reserved.
// Author:坚果派
// Email: jianguo@nutpi.net

/// 新闻详情页面
/// 该页面用于展示每日新闻的详细内容，包括：
/// - 日期标题
/// - 头图（如果有）
/// - 新闻正文
/// - 微语（如果有）

import 'package:flutter/material.dart';
import '../models/daily_news_model.dart';

/// 新闻详情页面组件
/// 接收一个 [DailyNews] 对象作为参数，用于展示新闻的详细信息
class NewsDetailPage extends StatelessWidget {
  /// 新闻数据模型
  final DailyNews news;

  /// 构造函数
  /// [news] 包含要显示的新闻详细信息
  const NewsDetailPage({Key? key, required this.news}) : super(key: key);

  /// 构建新闻详情页面的UI
  ///
  /// 页面布局包括：
  /// 1. AppBar：显示新闻日期
  /// 2. 可滚动的内容区域，包含：
  ///    - 头图（如果存在）
  ///    - 新闻正文
  ///    - 微语板块（如果存在）
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(news.date),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (news.headImage.isNotEmpty)
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(
                  news.headImage,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Icon(
                        Icons.error_outline,
                        size: 40,
                        color: Colors.red,
                      ),
                    );
                  },
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (news.news.isNotEmpty)
                    Text(
                      news.news,
                      style: const TextStyle(fontSize: 16),
                    ),
                  const SizedBox(height: 24),
                  if (news.weiyu.isNotEmpty)
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '微语',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            news.weiyu,
                            style: const TextStyle(
                              fontSize: 14,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
