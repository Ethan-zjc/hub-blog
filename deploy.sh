#!/usr/bin/env sh

# 确保脚本抛出遇到的错误
set -e

# 生成静态文件
npm run build

# 进入生成的文件夹
cd docs/.vuepress/dist

# deploy to github pages

git init
git add -A
git commit -m "github actions的自动部署"

git branch -m master
git push -f git@github.com:Ethan-zjc/hub-blog.git master:gh-pages # 推送到github gh-pages分支

cd -
rm -rf docs/.vuepress/dist
