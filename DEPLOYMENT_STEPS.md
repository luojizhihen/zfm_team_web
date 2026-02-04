# GitHub Pages 部署详细操作指南

本文档提供了将项目部署到 GitHub Pages 的详细步骤说明。

## 📋 前提条件

- 你已经有一个 GitHub 账号
- 你有此仓库的管理员权限
- 当前的 PR 已经创建（`copilot/deploy-to-git-pages` 分支）

## 🚀 自动化部署步骤

### 步骤 1: 合并 Pull Request

#### 方式一：通过 GitHub 网页界面（推荐）

1. **访问 Pull Request 页面**
   - 打开浏览器，访问：https://github.com/luojizhihen/zfm_team_web/pulls
   - 找到标题为 "Configure GitHub Pages deployment" 或类似的 PR
   
2. **审查变更**
   - 点击 "Files changed" 标签页，查看所有修改的文件
   - 确认以下文件的修改正确：
     - `.github/workflows/deploy.yml` - 部署工作流
     - `vite.config.js` - Vite 配置
     - `src/router/index.js` - 路由配置
     - `README.md` 和 `DEPLOYMENT.md` - 文档

3. **合并 PR**
   - 点击绿色的 "Merge pull request" 按钮
   - 选择合并方式：
     - **Create a merge commit**（推荐）- 保留完整的提交历史
     - **Squash and merge** - 将所有提交合并为一个
     - **Rebase and merge** - 重新应用提交
   - 点击 "Confirm merge" 确认合并
   - 合并后可以选择删除 `copilot/deploy-to-git-pages` 分支

#### 方式二：通过 GitHub CLI（命令行）

如果你已经安装了 GitHub CLI (`gh`)，可以使用以下命令：

```bash
# 登录 GitHub（如果还没登录）
gh auth login

# 查看 PR 列表
gh pr list

# 合并 PR（替换 <PR编号> 为实际的 PR 编号）
gh pr merge <PR编号> --merge --delete-branch

# 或者自动检测并合并当前分支的 PR
gh pr merge --merge --delete-branch
```

### 步骤 2: 启用 GitHub Pages

#### 方式一：通过 GitHub 网页界面（必需）

1. **进入仓库设置**
   - 访问：https://github.com/luojizhihen/zfm_team_web/settings
   - 或者：在仓库页面点击 "Settings" 标签

2. **找到 Pages 设置**
   - 在左侧菜单中，向下滚动找到 "Pages" 选项
   - 点击 "Pages"

3. **配置部署源**
   - 在 "Build and deployment" 部分
   - "Source" 下拉菜单中选择：**GitHub Actions**
   - ⚠️ 重要：不要选择 "Deploy from a branch"，必须选择 "GitHub Actions"
   
4. **保存设置**
   - GitHub 会自动保存你的选择
   - 你会看到一个提示说明 GitHub Pages 已启用

#### 方式二：通过 GitHub API（可选，需要 Personal Access Token）

如果你有 Personal Access Token (PAT)，可以使用以下脚本：

```bash
# 设置你的 GitHub Token（需要 repo 和 pages 权限）
export GITHUB_TOKEN="your_personal_access_token_here"

# 启用 GitHub Pages
curl -X POST \
  -H "Authorization: token $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github.v3+json" \
  https://api.github.com/repos/luojizhihen/zfm_team_web/pages \
  -d '{
    "source": {
      "branch": "gh-pages",
      "path": "/"
    },
    "build_type": "workflow"
  }'
```

⚠️ 注意：大多数情况下，通过网页界面操作更简单、更安全。

### 步骤 3: 等待自动部署

1. **查看工作流运行状态**
   - 访问：https://github.com/luojizhihen/zfm_team_web/actions
   - 你会看到 "Deploy to GitHub Pages" 工作流正在运行
   - 通常需要 2-5 分钟完成

2. **监控部署过程**
   - 点击最新的工作流运行
   - 你可以看到两个任务：
     - **build** - 构建项目（约 2-3 分钟）
     - **deploy** - 部署到 Pages（约 30 秒）
   - 等待所有步骤显示绿色的 ✓

3. **访问你的网站**
   - 部署完成后，访问：https://luojizhihen.github.io/zfm_team_web/
   - 🎉 你的网站现在已经在线了！

### 步骤 4: 验证部署

1. **检查页面功能**
   - 访问主页：https://luojizhihen.github.io/zfm_team_web/
   - 测试导航：/publish, /hall, /my 等路由
   - 确认所有页面都能正常加载

2. **检查控制台**
   - 按 F12 打开浏览器开发者工具
   - 查看 Console 标签页，确保没有错误
   - 查看 Network 标签页，确保所有资源都正确加载

## 🔄 后续更新

每次你推送代码到 `main` 分支时，GitHub Actions 会自动：
1. 构建最新版本
2. 部署到 GitHub Pages
3. 更新在线网站

无需任何手动操作！

## ❓ 常见问题

### Q1: PR 合并后，工作流没有运行？
**A:** 确保你合并到的是 `main` 分支。工作流配置为只在 `main` 分支触发。

### Q2: 部署成功，但网站显示 404？
**A:** 
- 等待 2-3 分钟，GitHub Pages 需要时间传播
- 确认你访问的 URL 是：https://luojizhihen.github.io/zfm_team_web/（注意结尾的斜杠）
- 检查 Settings → Pages 中 "Build and deployment" 的 Source 是否设置为 "GitHub Actions"

### Q3: 页面加载但样式丢失或路由不工作？
**A:** 这通常是 base path 配置问题。确认：
- `vite.config.js` 中 `base: '/zfm_team_web/'`
- `src/router/index.js` 中 `createWebHistory('/zfm_team_web/')`
- 两者必须完全一致

### Q4: 如何查看部署日志？
**A:** 访问 https://github.com/luojizhihen/zfm_team_web/actions，点击最新的工作流运行，查看详细日志。

### Q5: 可以自定义域名吗？
**A:** 可以！在 Settings → Pages → Custom domain 中输入你的域名，并在域名提供商处添加 CNAME 记录。

## 📞 需要帮助？

如果遇到问题：
1. 查看 [GitHub Pages 官方文档](https://docs.github.com/en/pages)
2. 查看 [Vite 部署文档](https://vitejs.dev/guide/static-deploy.html)
3. 在仓库中创建 Issue 描述问题

---

**祝部署顺利！** 🚀
