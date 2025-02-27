// Copyright (c) 2024 坚果派. All rights reserved.
// Author:坚果派
// Email: jianguo@nutpi.net

import 'package:flutter/material.dart';

/// 关于页面
/// 展示应用程序的基本信息，包括：
/// - 应用名称
/// - 版本号
/// - 官网链接
/// - 版权信息
class AboutPage extends StatelessWidget {
  /// 构造函数
  const AboutPage({super.key});

  /// 构建关于页面的UI
  /// 
  /// 页面布局：
  /// - AppBar：显示"关于"标题
  /// - 主体内容：居中显示的垂直布局
  ///   - 应用名称（大号字体）
  ///   - 版本号
  ///   - 可选择的官网链接（蓝色字体）
  ///   - 版权信息（灰色字体）
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('关于'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '每日新闻',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text('版本 1.0.0'),
            const SizedBox(height: 40),
            const SelectableText(
              'www.nutpi.net',
              style: TextStyle(fontSize: 16, color: Colors.blue),
            ),
            const SizedBox(height: 20),
            const Text(
              '© 2024 坚果派',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
