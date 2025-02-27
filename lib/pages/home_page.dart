// Copyright (c) 2024 坚果派. All rights reserved.
// Author:坚果派
// Email: jianguo@nutpi.net

/// 首页
/// 应用程序的主页面，负责：
/// - 展示每日新闻列表
/// - 处理新闻数据的加载和刷新
/// - 错误状态的展示和重试
/// - 新闻详情页面的导航

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/news_service.dart';
import '../models/daily_news_model.dart';
import 'news_detail_page.dart';
import 'about_page.dart';

/// 首页组件
/// 使用 StatefulWidget 以管理页面状态
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

/// 首页状态管理类
class _HomePageState extends State<HomePage> {
  /// 新闻服务实例
  final NewsService _newsService = NewsService();

  /// 加载状态标志
  bool _isLoading = true;

  /// 错误信息
  String _errorMessage = '';

  /// 当前显示的新闻数据
  DailyNews? _dailyNews;

  /// 组件初始化
  /// 在组件创建时加载新闻数据
  @override
  void initState() {
    super.initState();
    _loadDailyNews();
  }

  /// 加载每日新闻数据
  ///
  /// 功能：
  /// - 更新加载状态
  /// - 请求新闻数据
  /// - 处理错误情况
  /// - 更新UI显示
  Future<void> _loadDailyNews() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    try {
      final news = await _newsService.fetchDailyNews();
      setState(() {
        _dailyNews = news;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
        _isLoading = false;
      });
    }
  }

  /// 构建首页UI
  ///
  /// 页面结构：
  /// - AppBar：显示应用标题
  /// - RefreshIndicator：支持下拉刷新
  /// - 根据不同状态显示：
  ///   - 加载中：显示加载指示器
  ///   - 错误：显示错误信息和重试按钮
  ///   - 成功：显示新闻内容
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('每日新闻'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () => Get.to(() => const AboutPage()),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _loadDailyNews,
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : _errorMessage.isNotEmpty
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _errorMessage,
                            style: const TextStyle(color: Colors.red),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: _loadDailyNews,
                            child: const Text('重试'),
                          ),
                        ],
                      ),
                    ),
                  )
                : SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (_dailyNews?.headImage?.isNotEmpty == true)
                          AspectRatio(
                            aspectRatio: 16 / 9,
                            child: Image.network(
                              _dailyNews!.headImage,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return const Center(
                                  child: Icon(
                                    Icons.error_outline,
                                    size: 48,
                                    color: Colors.grey,
                                  ),
                                );
                              },
                            ),
                          ),
                        const SizedBox(height: 16),
                        if (_dailyNews?.news.isNotEmpty == true)
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      NewsDetailPage(news: _dailyNews!),
                                ),
                              );
                            },
                            child: Text(
                              _dailyNews!.news,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        const SizedBox(height: 24),
                        if (_dailyNews?.weiyu.isNotEmpty == true)
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
                                  _dailyNews!.weiyu,
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
      ),
    );
  }
}
