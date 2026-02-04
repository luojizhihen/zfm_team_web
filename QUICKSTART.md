# 🚀 快速部署指南

这是最简化的部署步骤说明。详细信息请查看 [DEPLOYMENT_STEPS.md](./DEPLOYMENT_STEPS.md)。

## 自动化脚本（推荐）

运行自动化脚本，它会引导你完成整个流程：

```bash
./scripts/deploy.sh
```

脚本会自动完成：
- ✅ 检查项目状态
- ✅ 运行构建测试
- ✅ 辅助合并 PR（如果安装了 GitHub CLI）
- ✅ 提供启用 Pages 的直接链接
- ✅ 监控部署状态

## 手动步骤（3 步完成）

### 1️⃣ 合并 Pull Request

访问：https://github.com/luojizhihen/zfm_team_web/pulls

点击 "Merge pull request" → "Confirm merge"

### 2️⃣ 启用 GitHub Pages

访问：https://github.com/luojizhihen/zfm_team_web/settings/pages

在 "Source" 下拉菜单中选择：**GitHub Actions**

### 3️⃣ 完成！

等待 2-5 分钟，然后访问：

**https://luojizhihen.github.io/zfm_team_web/**

## 查看部署状态

访问：https://github.com/luojizhihen/zfm_team_web/actions

## 使用 GitHub CLI（可选）

如果你已安装 [GitHub CLI](https://cli.github.com/)：

```bash
# 登录（首次使用）
gh auth login

# 合并 PR
gh pr merge --merge --delete-branch

# 查看工作流状态
gh run list
gh run watch
```

## 需要帮助？

- 📖 详细步骤：[DEPLOYMENT_STEPS.md](./DEPLOYMENT_STEPS.md)
- 🔧 技术配置：[DEPLOYMENT.md](./DEPLOYMENT.md)
- 🐛 遇到问题？在仓库创建 Issue

---

**提示**：首次部署只需要手动启用一次 GitHub Pages，之后所有更新都会自动部署！
