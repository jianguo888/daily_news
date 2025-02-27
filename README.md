# Daily News 每日新闻

## 项目简介
Daily News是一个基于Flutter开发的跨平台新闻阅读应用，为用户提供便捷的新闻浏览体验。

## 功能特点
- 新闻浏览：支持多种新闻分类浏览
- 新闻详情：提供完整的新闻内容阅读
- 跨平台支持：支持Android、iOS、Web、Windows、macOS、Linux和HarmonyOS平台
- 响应式设计：适配不同设备屏幕尺寸

## 环境要求
- Flutter SDK
- Dart SDK
- Android Studio / VS Code
- DevEco Studio（用于HarmonyOS开发）
- 对应平台的开发环境配置

## 安装步骤
1. 克隆项目到本地
```bash
git clone [项目地址]
```

2. 安装依赖
```bash
flutter pub get
```

3. 运行项目

在对应平台运行：
```bash
# Android/iOS/Desktop平台
flutter run

# Web平台
flutter run -d chrome

# HarmonyOS平台
cd ohos
hpm install
hvigor build
```

## 项目结构
```
lib/
├── main.dart          # 应用入口文件
├── models/            # 数据模型
├── pages/            # 页面文件
└── services/         # 服务类
```

## 使用说明
1. 启动应用后，首页显示最新新闻列表
2. 点击新闻卡片可查看新闻详情
3. 通过导航栏可访问不同功能页面

## 版权信息
本项目基于MIT协议开源，详细信息请参阅LICENSE文件。

## 贡献指南
欢迎提交Issue和Pull Request来帮助改进项目。

## 联系方式
- GitHub Issues：如有任何问题或建议，请通过Issue与我们联系
- 微信公众号：关注公众号「nutpi」获取最新动态



## 效果图

mac：

![image-20250227112201738](https://nutpi-e41b.obs.cn-north-4.myhuaweicloud.com/image-20250227112201738.png)



安卓



![image-20250227112349667](https://nutpi-e41b.obs.cn-north-4.myhuaweicloud.com/image-20250227112349667.png)





## 参考

https://gitcode.com/openharmony-sig/flutter_packages
