#!/bin/bash

# GitHub Pages 自动化部署辅助脚本
# 此脚本帮助自动化部署过程中可以自动化的步骤

set -e  # 遇到错误立即退出

echo "========================================"
echo "  GitHub Pages 部署辅助脚本"
echo "========================================"
echo ""

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 检查是否在正确的目录
if [ ! -f "package.json" ]; then
    echo -e "${RED}错误：请在项目根目录运行此脚本${NC}"
    exit 1
fi

# 检查 GitHub CLI 是否安装
if ! command -v gh &> /dev/null; then
    echo -e "${YELLOW}警告：GitHub CLI (gh) 未安装${NC}"
    echo "你可以从 https://cli.github.com/ 安装它"
    echo "或者手动完成以下步骤"
    USE_GH=false
else
    echo -e "${GREEN}✓ GitHub CLI 已安装${NC}"
    USE_GH=true
fi

# 检查是否已登录 GitHub
if [ "$USE_GH" = true ]; then
    if ! gh auth status &> /dev/null; then
        echo -e "${YELLOW}你尚未登录 GitHub CLI${NC}"
        echo "是否现在登录？(y/n)"
        read -r response
        if [[ "$response" =~ ^[Yy]$ ]]; then
            gh auth login
        else
            echo -e "${YELLOW}跳过 GitHub CLI 登录${NC}"
            USE_GH=false
        fi
    else
        echo -e "${GREEN}✓ GitHub CLI 已登录${NC}"
    fi
fi

echo ""
echo "========================================"
echo "步骤 1: 检查当前分支和状态"
echo "========================================"

CURRENT_BRANCH=$(git branch --show-current)
echo "当前分支: ${BLUE}${CURRENT_BRANCH}${NC}"

# 检查是否有未提交的更改
if [[ -n $(git status -s) ]]; then
    echo -e "${YELLOW}警告：有未提交的更改${NC}"
    git status -s
    echo ""
fi

# 拉取最新代码
echo "拉取最新代码..."
git fetch origin
echo -e "${GREEN}✓ 已拉取最新代码${NC}"

echo ""
echo "========================================"
echo "步骤 2: 构建测试"
echo "========================================"

echo "检查依赖是否已安装..."
if [ ! -d "node_modules" ]; then
    echo "安装依赖..."
    npm install
fi

echo "运行构建测试..."
npm run build

if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ 构建成功！${NC}"
    echo "构建产物已生成在 dist/ 目录"
else
    echo -e "${RED}✗ 构建失败${NC}"
    exit 1
fi

echo ""
echo "========================================"
echo "步骤 3: Pull Request 操作"
echo "========================================"

if [ "$USE_GH" = true ]; then
    echo "查找相关的 Pull Request..."
    
    # 查找当前分支的 PR
    PR_NUMBER=$(gh pr list --head "$CURRENT_BRANCH" --json number --jq '.[0].number')
    
    if [ -n "$PR_NUMBER" ] && [ "$PR_NUMBER" != "null" ]; then
        echo -e "找到 PR #${BLUE}${PR_NUMBER}${NC}"
        
        # 显示 PR 详情
        gh pr view "$PR_NUMBER"
        
        echo ""
        echo "是否要合并此 PR 到 main 分支？(y/n)"
        read -r response
        
        if [[ "$response" =~ ^[Yy]$ ]]; then
            echo "合并 PR..."
            gh pr merge "$PR_NUMBER" --merge --delete-branch
            
            if [ $? -eq 0 ]; then
                echo -e "${GREEN}✓ PR 已成功合并！${NC}"
                
                # 切换到 main 分支并拉取
                git checkout main
                git pull origin main
                
                echo -e "${GREEN}✓ 已切换到 main 分支并拉取最新代码${NC}"
            else
                echo -e "${RED}✗ PR 合并失败${NC}"
                exit 1
            fi
        else
            echo "跳过 PR 合并"
        fi
    else
        echo -e "${YELLOW}未找到当前分支的 PR${NC}"
        echo "请访问以下链接手动创建或查看 PR："
        echo "https://github.com/luojizhihen/zfm_team_web/pulls"
    fi
else
    echo -e "${YELLOW}GitHub CLI 不可用，请手动操作：${NC}"
    echo "1. 访问 https://github.com/luojizhihen/zfm_team_web/pulls"
    echo "2. 找到你的 PR 并点击 'Merge pull request'"
    echo "3. 确认合并"
fi

echo ""
echo "========================================"
echo "步骤 4: 启用 GitHub Pages"
echo "========================================"

echo -e "${YELLOW}注意：GitHub Pages 必须通过网页界面启用${NC}"
echo ""
echo "请按照以下步骤操作："
echo "1. 访问: ${BLUE}https://github.com/luojizhihen/zfm_team_web/settings/pages${NC}"
echo "2. 在 'Build and deployment' 部分"
echo "3. 'Source' 选择: ${GREEN}GitHub Actions${NC}"
echo "4. 保存设置"
echo ""
echo "按 Enter 键打开浏览器（如果可能）..."
read -r

# 尝试打开浏览器
if command -v xdg-open &> /dev/null; then
    xdg-open "https://github.com/luojizhihen/zfm_team_web/settings/pages"
elif command -v open &> /dev/null; then
    open "https://github.com/luojizhihen/zfm_team_web/settings/pages"
else
    echo "无法自动打开浏览器，请手动访问上述链接"
fi

echo ""
echo "完成 Pages 设置后，按 Enter 继续..."
read -r

echo ""
echo "========================================"
echo "步骤 5: 监控部署"
echo "========================================"

if [ "$USE_GH" = true ]; then
    echo "查看最近的工作流运行..."
    gh run list --limit 5
    
    echo ""
    echo "查看最新工作流的详细状态..."
    LATEST_RUN=$(gh run list --limit 1 --json databaseId --jq '.[0].databaseId')
    
    if [ -n "$LATEST_RUN" ] && [ "$LATEST_RUN" != "null" ]; then
        echo "监控工作流运行 #${LATEST_RUN}..."
        echo "访问: ${BLUE}https://github.com/luojizhihen/zfm_team_web/actions${NC}"
        echo ""
        echo "你也可以运行以下命令查看实时日志："
        echo "${BLUE}gh run watch${NC}"
    fi
else
    echo "请访问以下链接查看部署状态："
    echo "${BLUE}https://github.com/luojizhihen/zfm_team_web/actions${NC}"
fi

echo ""
echo "========================================"
echo "部署完成！"
echo "========================================"
echo ""
echo "你的网站将在几分钟内可用："
echo -e "${GREEN}https://luojizhihen.github.io/zfm_team_web/${NC}"
echo ""
echo "详细的部署步骤和故障排除，请查看："
echo "- DEPLOYMENT_STEPS.md - 详细操作指南"
echo "- DEPLOYMENT.md - 技术配置说明"
echo ""
echo -e "${GREEN}祝部署顺利！🚀${NC}"
