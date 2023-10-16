#!/usr/bin/env sh

# 确保脚本抛出遇到的错误
set -e

# 生成静态文件
npm run build

# 进入生成的文件夹
cd docs/.vuepress/dist

# deploy to github pages

if [ -z "$GITHUB_TOKEN" ]; then
  msg='deploy'
  githubUrl=git@github.com:Ethan-zjc/hub-blog.git
else
  msg='github action的自动部署'
  githubUrl=https://Ethan-zjc:${GITHUB_TOKEN}@github.com/hub-blog.git
  git config --global user.name "Ethan"
  git config --global user.email "735112795@qq.com"
fi

git init
git add -A
git commit -m "${msg}"

git branch -m master
git push -f https://${GITHUB_TOKEN}@github.com/Ethan-zjc/hub-blog.git master:gh-pages # 推送到github gh-pages分支

cd -
# rm -rf docs/.vuepress/dist
