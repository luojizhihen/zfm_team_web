# GitHub Pages 部署说明

本项目已配置为自动部署到 GitHub Pages。

## 部署配置

### 1. 项目配置文件

#### vite.config.js
已添加 `base: '/zfm_team_web/'` 配置，确保所有静态资源路径正确。

#### src/router/index.js
路由配置使用 `createWebHistory('/zfm_team_web/')` 以匹配 GitHub Pages 的子路径。

### 2. GitHub Actions 工作流

在 `.github/workflows/deploy.yml` 中配置了自动部署工作流：
- 当代码推送到 `main` 分支时自动触发
- 也可以通过 GitHub 界面手动触发（workflow_dispatch）
- 使用 Node.js 20 构建项目
- 自动将构建产物部署到 GitHub Pages

## 启用 GitHub Pages

要启用 GitHub Pages，请按照以下步骤操作：

1. 进入 GitHub 仓库的 Settings 页面
2. 在左侧菜单中找到并点击 "Pages"
3. 在 "Build and deployment" 部分：
   - Source 选择 "GitHub Actions"
4. 保存设置

## 部署流程

1. 将代码合并到 `main` 分支
2. GitHub Actions 将自动运行部署工作流
3. 构建完成后，网站将自动部署到 GitHub Pages
4. 访问地址：`https://luojizhihen.github.io/zfm_team_web/`

## 本地构建和预览

```bash
# 安装依赖
npm install

# 构建项目
npm run build

# 预览构建结果
npm run preview
```

## 注意事项

- 部署后的访问地址为：`https://luojizhihen.github.io/zfm_team_web/`
- 确保所有 API 调用使用绝对路径或配置正确的代理
- 首次部署需要在 GitHub 仓库设置中启用 Pages 功能并选择 GitHub Actions 作为部署源
