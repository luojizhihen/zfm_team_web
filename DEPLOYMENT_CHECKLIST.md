# 🚀 GitHub Pages 部署检查清单

使用这个清单来跟踪你的部署进度。完成每一步后，将 `[ ]` 改为 `[x]`。

## 准备工作

- [ ] 确认你有 GitHub 账号
- [ ] 确认你有仓库的管理员权限
- [ ] 已克隆仓库到本地（如果需要本地操作）

## 选项 A: 使用自动化脚本（推荐）✨

- [ ] 打开终端/命令行
- [ ] 导航到项目目录：`cd /path/to/zfm_team_web`
- [ ] 运行脚本：`./scripts/deploy.sh`
- [ ] 按照脚本提示操作
- [ ] 完成！跳到"验证部署"部分

## 选项 B: 手动操作

### 步骤 1: 合并 Pull Request

- [ ] 访问 https://github.com/luojizhihen/zfm_team_web/pulls
- [ ] 找到部署相关的 PR（通常标题包含 "deploy" 或 "GitHub Pages"）
- [ ] 查看 "Files changed" 标签页，确认修改正确
- [ ] 点击 "Merge pull request" 按钮
- [ ] 点击 "Confirm merge" 确认合并
- [ ] （可选）删除已合并的分支

#### 或使用 GitHub CLI：
```bash
gh auth login          # 首次使用需要登录
gh pr list             # 查看 PR 列表
gh pr merge --merge    # 合并 PR
```

### 步骤 2: 启用 GitHub Pages

- [ ] 访问 https://github.com/luojizhihen/zfm_team_web/settings/pages
- [ ] 找到 "Build and deployment" 部分
- [ ] 在 "Source" 下拉菜单中选择：**GitHub Actions**
- [ ] ⚠️ 确保不是选择 "Deploy from a branch"
- [ ] 等待页面自动保存
- [ ] 看到确认信息："Your site is live at..."

### 步骤 3: 等待部署完成

- [ ] 访问 https://github.com/luojizhihen/zfm_team_web/actions
- [ ] 找到名为 "Deploy to GitHub Pages" 的工作流
- [ ] 确认工作流正在运行（黄色圆圈图标）
- [ ] 等待工作流完成（绿色勾号图标）
- [ ] 检查两个任务都成功：
  - [ ] build 任务
  - [ ] deploy 任务

#### 或使用 GitHub CLI：
```bash
gh run list            # 查看工作流运行
gh run watch           # 实时监控最新工作流
```

## 验证部署

### 基本验证

- [ ] 访问 https://luojizhihen.github.io/zfm_team_web/
- [ ] 页面正常加载，没有显示 404 错误
- [ ] 页面显示正确的内容和样式

### 功能验证

测试所有页面路由：
- [ ] 主页/发布页面 (`/publish`)
- [ ] 大厅页面 (`/hall`)
- [ ] 我的页面 (`/my`)
- [ ] 管理员页面 (`/admin/users`)
- [ ] 认证页面 (`/auth`)

### 技术验证

- [ ] 按 F12 打开开发者工具
- [ ] 查看 Console 标签页 - 无红色错误
- [ ] 查看 Network 标签页 - 所有资源成功加载（状态码 200）
- [ ] 测试页面导航 - 路由切换正常工作

## 后续使用

### 理解自动部署

- [ ] 阅读并理解：推送到 `main` 分支会自动触发部署
- [ ] 知道如何查看部署历史：https://github.com/luojizhihen/zfm_team_web/deployments
- [ ] 知道如何查看工作流日志来调试问题

### 文档阅读

- [ ] 阅读 [QUICKSTART.md](./QUICKSTART.md) - 快速参考
- [ ] 阅读 [DEPLOYMENT_STEPS.md](./DEPLOYMENT_STEPS.md) - 详细步骤
- [ ] 阅读 [DEPLOYMENT_VISUAL_GUIDE.md](./DEPLOYMENT_VISUAL_GUIDE.md) - 图文教程
- [ ] 阅读 [DEPLOYMENT.md](./DEPLOYMENT.md) - 技术说明

## ✅ 部署完成！

当你完成上面所有的勾选项时，恭喜你！🎉

你的网站现在已经成功部署到 GitHub Pages！

### 下一步

- [ ] 将网站链接分享给团队成员
- [ ] 在 README.md 中添加网站链接（已完成）
- [ ] 设置自定义域名（可选）
- [ ] 配置 Google Analytics（可选）

### 需要帮助？

如果在任何步骤遇到问题：

1. 查看对应的文档文件获取详细信息
2. 运行 `./scripts/deploy.sh` 获取自动化帮助
3. 查看 [常见问题](#常见问题) 部分
4. 在仓库创建 Issue 寻求帮助

---

## 常见问题

### ❌ 问题：网站显示 404

**检查清单**：
- [ ] GitHub Pages 的 Source 是否设置为 "GitHub Actions"？
- [ ] 工作流是否成功完成（绿色勾号）？
- [ ] 是否等待了 2-3 分钟让更改生效？
- [ ] URL 是否正确（包括仓库名称）？

### ❌ 问题：页面空白或样式丢失

**检查清单**：
- [ ] 打开浏览器控制台，查看是否有 404 错误
- [ ] 检查 `vite.config.js` 中的 `base` 配置
- [ ] 检查 `src/router/index.js` 中的路由 base path
- [ ] 确保两者都是 `/zfm_team_web/`

### ❌ 问题：工作流运行失败

**检查清单**：
- [ ] 访问 Actions 页面查看详细错误
- [ ] 检查 `package.json` 中的依赖是否正确
- [ ] 确保 `npm run build` 在本地能成功运行
- [ ] 查看失败步骤的日志输出

### ❌ 问题：无法合并 PR

**可能原因**：
- [ ] 有合并冲突需要解决
- [ ] 没有仓库的写权限
- [ ] PR 审查要求未满足

**解决方案**：
- 解决合并冲突
- 联系仓库管理员获取权限
- 完成必需的审查流程

---

**记住**：部署是一次性设置！完成后，所有未来的更新都会自动部署。🚀
