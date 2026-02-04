# zfm_team_web
芝麻分组队web端

## 🌐 在线访问

本项目已部署到 GitHub Pages：[https://luojizhihen.github.io/zfm_team_web/](https://luojizhihen.github.io/zfm_team_web/)

## 🚀 快速部署

### 一键部署（推荐）✨
```bash
./scripts/deploy.sh
```

脚本会自动引导你完成所有步骤！预计 5 分钟完成。

### 手动部署（3 步）
1. 合并 PR → [查看 PRs](https://github.com/luojizhihen/zfm_team_web/pulls)
2. 启用 Pages → [设置页面](https://github.com/luojizhihen/zfm_team_web/settings/pages)（选择 "GitHub Actions"）
3. 等待部署 → [查看状态](https://github.com/luojizhihen/zfm_team_web/actions)

### 📚 完整文档
**[→ 查看完整部署文档导航](./DOCS_INDEX.md)**

快速链接：
- [快速开始](./QUICKSTART.md) - 3 步完成
- [自动化说明](./AUTOMATION_SUMMARY.md) - 了解工具能做什么
- [详细步骤](./DEPLOYMENT_STEPS.md) - 完整指南
- [检查清单](./DEPLOYMENT_CHECKLIST.md) - 跟踪进度

## 🛠️ 开发

```bash
# 安装依赖
npm install

# 启动开发服务器
npm run dev

# 构建生产版本
npm run build

# 预览构建结果
npm run preview
```

## 🔧 技术栈

- Vue 3 - 渐进式 JavaScript 框架
- Vite - 下一代前端构建工具
- Vue Router - 官方路由管理器
- Ant Design Vue - 企业级 UI 组件库

## 📖 项目结构

```
zfm_team_web/
├── src/                  # 源代码
│   ├── views/           # 页面组件
│   ├── router/          # 路由配置
│   ├── api/             # API 接口
│   └── main.js          # 入口文件
├── .github/workflows/   # GitHub Actions 工作流
├── scripts/             # 辅助脚本
└── dist/                # 构建输出（自动生成）
```

## 🤝 贡献

欢迎提交 Issue 和 Pull Request！

## 📄 许可证

[MIT License](LICENSE)


