// Copyright (c) 2024 坚果派. All rights reserved.
// Author:坚果派
// Email: jianguo@nutpi.net

/// 每日简讯应用程序
/// 这是一个使用 Flutter 开发的新闻阅读应用，主要功能包括：
/// - 展示每日新闻
/// - 支持下拉刷新
/// - 新闻详情页面
/// - 美观的 Material Design 界面

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pages/home_page.dart';

/// 应用程序入口函数
void main() {
  runApp(const MyApp());
}

/// 应用程序根组件
/// 配置应用程序的主题、路由和初始页面
class MyApp extends StatelessWidget {
  /// 构造函数
  const MyApp({super.key});

  /// 构建应用程序的根视图
  /// 
  /// 配置说明：
  /// - 使用 GetMaterialApp 支持路由管理
  /// - 设置应用名称为"每日简讯"
  /// - 配置 Material Design 3 主题
  /// - 将 HomePage 设置为初始页面
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: '每日简讯',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: const HomePage());
  }
}
