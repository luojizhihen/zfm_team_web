# GitHub Pages 设置图文教程

本文档提供图文并茂的 GitHub Pages 设置教程。

## 🎯 目标

将你的 Vue 项目部署到 GitHub Pages，让它在互联网上可访问。

---

## 步骤 1: 合并 Pull Request

### 1.1 访问 Pull Requests 页面

在浏览器中打开：
```
https://github.com/luojizhihen/zfm_team_web/pulls
```

### 1.2 找到并打开 PR

查找标题类似以下的 PR：
- "Configure GitHub Pages deployment"
- "Deploy to GitHub Pages"
- "copilot/deploy-to-git-pages"

点击 PR 标题打开详情页面。

### 1.3 审查变更

点击 **"Files changed"** 标签查看修改的文件：

```
✓ .github/workflows/deploy.yml   (新文件)
✓ vite.config.js                  (已修改)
✓ src/router/index.js             (已修改)
✓ index.html                       (已修改)
✓ README.md                        (已修改)
✓ DEPLOYMENT.md                    (新文件)
```

### 1.4 合并 PR

回到 **"Conversation"** 标签，找到页面底部的合并按钮。

你会看到三个选项：

1. **Create a merge commit** ⭐ 推荐
   - 保留所有提交历史
   - 适合团队协作

2. **Squash and merge**
   - 将所有提交合并为一个
   - 保持历史简洁

3. **Rebase and merge**
   - 线性历史记录
   - 适合干净的提交

**操作步骤**：
1. 点击绿色的 **"Merge pull request"** 按钮
2. 点击 **"Confirm merge"** 确认
3. （可选）点击 **"Delete branch"** 删除功能分支

✅ **完成！** PR 已合并到 `main` 分支

---

## 步骤 2: 启用 GitHub Pages

### 2.1 进入仓库设置

**方式 1 - 直接链接（推荐）**：
```
https://github.com/luojizhihen/zfm_team_web/settings/pages
```

**方式 2 - 手动导航**：
1. 在仓库页面点击 **"Settings"** 标签（右上角）
2. 在左侧菜单向下滚动
3. 找到并点击 **"Pages"**

### 2.2 配置 Build and Deployment

你会看到 "Build and deployment" 部分：

```
┌─────────────────────────────────────────┐
│ Build and deployment                    │
├─────────────────────────────────────────┤
│ Source                                  │
│ ┌─────────────────────────────────────┐ │
│ │ Deploy from a branch            ▼   │ │  ← 默认选项（不要选这个）
│ └─────────────────────────────────────┘ │
│                                         │
│ ┌─────────────────────────────────────┐ │
│ │ GitHub Actions                  ⭐  │ │  ← 选择这个！
│ └─────────────────────────────────────┘ │
└─────────────────────────────────────────┘
```

### 2.3 选择 GitHub Actions

**重要**：点击下拉菜单，选择 **"GitHub Actions"**

⚠️ **不要选择** "Deploy from a branch"

### 2.4 确认设置

选择后，你会看到：

```
┌─────────────────────────────────────────┐
│ ✅ Your site is live at                │
│                                         │
│ https://luojizhihen.github.io/          │
│ zfm_team_web/                          │
│                                         │
│ Source: GitHub Actions                  │
└─────────────────────────────────────────┘
```

✅ **完成！** GitHub Pages 已启用

---

## 步骤 3: 查看部署进度

### 3.1 访问 Actions 页面

打开以下链接：
```
https://github.com/luojizhihen/zfm_team_web/actions
```

或在仓库页面点击 **"Actions"** 标签。

### 3.2 查看工作流

你会看到名为 **"Deploy to GitHub Pages"** 的工作流正在运行：

```
┌─────────────────────────────────────────────────────────┐
│ Deploy to GitHub Pages                                  │
│                                                         │
│ ● 正在运行...    main    #1                            │
│                                                         │
│ ├─ build          ⏳ 运行中                            │
│ │  ├─ Checkout    ✓ 完成                               │
│ │  ├─ Setup Node  ✓ 完成                               │
│ │  ├─ Install     ⏳ 运行中                            │
│ │  └─ Build       ⏸️ 等待中                             │
│ │                                                       │
│ └─ deploy         ⏸️ 等待中                             │
└─────────────────────────────────────────────────────────┘
```

### 3.3 等待完成

部署通常需要 **2-5 分钟**。完成后你会看到：

```
┌─────────────────────────────────────────────────────────┐
│ Deploy to GitHub Pages                                  │
│                                                         │
│ ✅ 成功    main    #1    2m 34s                         │
│                                                         │
│ ├─ build          ✓ 完成 (2m 10s)                      │
│ │  ├─ Checkout    ✓ 完成                               │
│ │  ├─ Setup Node  ✓ 完成                               │
│ │  ├─ Install     ✓ 完成                               │
│ │  ├─ Build       ✓ 完成                               │
│ │  └─ Upload      ✓ 完成                               │
│ │                                                       │
│ └─ deploy         ✓ 完成 (24s)                         │
│    └─ Deploy      ✓ 完成                               │
└─────────────────────────────────────────────────────────┘
```

✅ **部署成功！**

---

## 步骤 4: 访问你的网站

### 4.1 打开网站

在浏览器中访问：
```
https://luojizhihen.github.io/zfm_team_web/
```

### 4.2 验证功能

测试以下页面是否正常工作：
- ✓ 主页（/publish）
- ✓ 大厅（/hall）
- ✓ 我的（/my）
- ✓ 管理员（/admin/users）

### 4.3 检查开发者工具

按 **F12** 打开开发者工具：

**Console 标签页**：
- 应该没有红色错误信息
- 黄色警告可以忽略

**Network 标签页**：
- 刷新页面 (F5)
- 所有资源应该显示 200 状态码
- 没有 404 错误

✅ **恭喜！网站部署成功！** 🎉

---

## 🔄 后续使用

### 自动部署

现在开始，每次你推送代码到 `main` 分支：

```bash
git add .
git commit -m "更新内容"
git push origin main
```

GitHub Actions 会自动：
1. 检测到代码变更
2. 运行构建
3. 部署到 GitHub Pages
4. 2-5 分钟后网站更新

### 查看部署历史

访问：https://github.com/luojizhihen/zfm_team_web/deployments

你可以看到所有的部署记录。

---

## ❓ 常见问题

### Q: 网站显示 404

**可能原因**：
1. Pages 设置中 Source 没有选择 "GitHub Actions"
2. 工作流还在运行中，需要等待
3. URL 错误，确保是 `https://luojizhihen.github.io/zfm_team_web/`

**解决方案**：
1. 回到步骤 2 检查设置
2. 访问 Actions 页面查看状态
3. 等待 2-3 分钟再试

### Q: 样式丢失或页面空白

**可能原因**：
- Base path 配置不正确

**解决方案**：
检查以下文件：
- `vite.config.js` → `base: '/zfm_team_web/'`
- `src/router/index.js` → `createWebHistory('/zfm_team_web/')`

### Q: 工作流失败

**解决方案**：
1. 访问 Actions 页面
2. 点击失败的工作流
3. 查看错误日志
4. 根据错误信息修复代码
5. 重新推送

---

## 📞 获取帮助

如果遇到问题：

1. **查看文档**：
   - [DEPLOYMENT_STEPS.md](./DEPLOYMENT_STEPS.md)
   - [DEPLOYMENT.md](./DEPLOYMENT.md)

2. **使用自动化脚本**：
   ```bash
   ./scripts/deploy.sh
   ```

3. **创建 Issue**：
   https://github.com/luojizhihen/zfm_team_web/issues/new

4. **参考官方文档**：
   - [GitHub Pages 文档](https://docs.github.com/en/pages)
   - [Vite 部署指南](https://vitejs.dev/guide/static-deploy.html)

---

**祝你部署顺利！** 🚀
