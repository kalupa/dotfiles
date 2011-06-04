g
git stash
git checkout -b plugin/contact_form_7
G
g
git branch -m plugin/contact_form_7 plugin/fast_secure_contact_form
g
git add ../si-contact-form/
g
git commit -m "Add Fast Secure Contact Form plugin"
git checkout develop
git merge --no-ff plugin/fast_secure_contact_form 
git push
git branch -m wordpress/slug-config feature/wordpress-slug-config
git stash apply
git stash clear
g
git checkout feature/sidebar_recent_articles 
git merge --no-ff develop
g
git checkout develop 
git merge feature/sidebar_recent_articles 
git reset HEAD^
git merge --no-ff feature/sidebar_recent_articles 
g
git diff
git reset HEAD^
g
git checkout feature/sidebar_recent_articles 
git reset HEAD^
git reset fb8c0bf9a45ab39049e749b85ec1705e28fa0614
git reset --hard 2fefb9d022e31d6b7f01a31fb4a27845b4b088b1
git merge --no-ff feature/sidebar_recent_articles 
g
git push
git checkout -b feature/contact-form
clear
g
vim ~/projects/bdellium/wordpress/.gitignore
pwd
cd ..
ll
cd si-contact-form/
ll
cd captcha-secureimage/
ll
g
git add ~/projects/bdellium/wordpress/.gitignore
g
git checkout plugin/fast_secure_contact_form 
g
git commit -m "ignore generated temp captcha files"
git checkout develop 
git merge --no-ff plugin/fast_secure_contact_form 
gitx
git help merge
git checkout feature/contact-form 
git merge --no-ff develop 
git checkout develop 
git push
git checkout feature/contact-form 
g
pwd
vim ~/projects/bdellium/wordpress/.gitignore 
g
ll captcha-temp/
git co develop 
g
cd
cd projects/bdellium/wordpress/
g
git stat
git blame wp-content/plugins/si-contact-form/captcha-secureimage/captcha-temp/*
git reflog wp-content/plugins/si-contact-form/captcha-secureimage/captcha-temp/*
git log wp-content/plugins/si-contact-form/captcha-secureimage/captcha-temp/*
git rm --cached wp-content/plugins/si-contact-form/captcha-secureimage/captcha-temp/*
ls wp-content/plugins/si-contact-form/captcha-secureimage/captcha-temp/*
ll wp-content/plugins/si-contact-form/captcha-secureimage/captcha-temp/*
g
git rm --cached wp-content/plugins/si-contact-form/captcha-secureimage/captcha-temp/6F4CO0Dn41lt3uxo.php
git rm --cached wp-content/plugins/si-contact-form/captcha-secureimage/captcha-temp/GXAydHs1o8TvmaKU.php
git rm --cached wp-content/plugins/si-contact-form/captcha-secureimage/captcha-temp/SCOMhV6ikXtIJLOA.php
git rm --cached wp-content/plugins/si-contact-form/captcha-secureimage/captcha-temp/SOaTe9437FR78P8X.php
git rm --cached wp-content/plugins/si-contact-form/captcha-secureimage/captcha-temp/TJdWW7Aq2bqObO37.php
git rm --cached wp-content/plugins/si-contact-form/captcha-secureimage/captcha-temp/TMHvg9u7iUmxNdwM.php
git rm --cached wp-content/plugins/si-contact-form/captcha-secureimage/captcha-temp/cleDLELtKxi7Htr8.php
git rm --cached wp-content/plugins/si-contact-form/captcha-secureimage/captcha-temp/fgHhhXTK6viu2dqW.php
git rm --cached wp-content/plugins/si-contact-form/captcha-secureimage/captcha-temp/nOgWUPoFSsgDD3qa.php
git rm --cached wp-content/plugins/si-contact-form/captcha-secureimage/captcha-temp/pAcn6SAz6Kcb2qGp.php
git rm --cached wp-content/plugins/si-contact-form/captcha-secureimage/captcha-temp/qEceh8nlSur9ZRzT.php
git rm --cached wp-content/plugins/si-contact-form/captcha-secureimage/captcha-temp/zffrIgA2wBNTF2ud.php
g
git checkout fix/gitignore_captcha-temp
git checkout -b fix/gitignore_captcha-temp
g
git commit -m "rm cached"
g
git co develop 
g
git merge --no-ff fix/gitignore_captcha-temp 
g
open ~/projects/bdellium/
g
git push
git checkout -b feature/custom_content-case_study
pwd
cd wp-content/themes/bdellium/
vim functions.php 
pwd
g
touch single-case_study.php
touch case_studies.php
cd
cd projects/checklist/
ll
cd public/
ll
cd js
ll
cd ..
vim index.html 
mkdir js/templates
cd 
cd projects/kids_n_cash/kidsncash/
g
git pull
git co aac
git co accounts 
g
gix
gitx
git pull
cd 
cd projects/checklist/
ll
g
git diff
gitx
git checkout -b feature/haml_templates
g
rm -rf public/js/templates/
g
git checkout develop 
git stash
git checkout develop 
git merge feature/haml_templates 
git stash apply
g
git push
git stash clean
git stash drop

git checkout -b feature/Backbone-relational
g
cp ~/projects/forks/Backbone-relational/backbone-relational.js 
cp ~/projects/forks/Backbone-relational/backbone-relational.js ./public/js/
g
git checkout develop
cd 
cd projects/bdellium/wordpress/
gitx
ll
cd wp-content/themes/bdellium/
ll
vim functions.php 
g
git stash
git checkout develop 
git stash apply
git diff
git add functions.php
g
git commit -m "comments in functions to better describe what's going on."
git merge feature/contact-form 
g
git stash drop
git push
git branch -d fix/gitignore_captcha-temp 
git checkout -b plugin/custom_content_type_manager
ll
touch g
gitx
ll
rm g
git checkout develop 
git merge plugin/custom_content_type_manager 
gitx
git reset --hard HEAD^
git merge --no-ff plugin/custom_content_type_manager 
g
git push
cd
cd projects/kids_n_cash/kidsncash/
ll
cd
cd projects/kids_n_cash/kidsncash/
g
git branch
git branch -m pk/feature/checklist_javascript feature/checklist_javascript
g
git checkout feature/checklist_javascript 
git diff
g
git pull
g
bundle
bundle update
g
git diff
gitx
git checkout -b gems/upgrade
ruby
ruby --version
g
rm -rf nokogiri/ 
rm -rf tmp/
ll
g
git checkout dev 
g
git merge gems/upgrade 
g
git add db/seeds.rb
git commit -m "bad seed fix"
g
git commit -a -m "jasmine doesn't need it's own task setup now"
g
git checkout feature/checklist_javascript 
git merge --no-ff dev 
g
bundle upgrade
bundle update
g
gitx
vim Gemfile.lock 
git checkout -b merge_fix
g
git add Gemfile.lock
g
ll nokogiri/
ll nokogiri/ruby/
ll nokogiri/ruby/1.9.1/
ruby -v
l
ll
g
vim public/javascripts/application.js 
g
git add .
cd ..
git clonell
ll
ll other/
git clone git@github.com:kalupa/Kids-n-Cash.git
cd Kids-n-Cash/
ll
cd ..
mv kidsncash/ kidsncash_old
mv Kids-n-Cash/ kidsncash_old/
mv kidsncash_old/Kids-n-Cash/ ./kidsncash
ll
cd kidsncash
gitx
git branch -d wip
git branch -d origin/wip
git branch --help
g
git push
rm ~/.pow/kidsncash
powder
touch tmp/
ll
mkdir tmp
touch tmp/restart.txt
g
git checkout -b feature/checklist_backbone
ll
cd public/
ll
cd javascripts/
ll
git rm Player.js Song.js
ll
ll libs/
git checkout -b merge/from_external_checklist
ll
git merge ~/projects/checklist/
git merge ~/projects/checklist
git pull ~/projects/checklist/
g
cd ..
vim index.html 
git rm index.html
g
git mv js/* javascripts/
git mv js/* javascripts
git cp js/* javascripts
cp -R js/* javascripts/
g
gitx
rm js/*
rm -rf js/*(
rm -rf js/*
g
rm javascripts/ICanHaz.js javascripts/mustache.js 
g
git commit -m "merge from checklist work in progress"
g
cp ~/projects/checklist/public/index.html ./checklist_new.html 
vim checklist.html 
ll
rm -rf js
g
cd javascripts/
ll
open .
g
f
g
git rm app.js
git checkout feature/checklist_backbone 
g
git merge merge/from_external_checklist 
g
git checkout -b javascript/upgrades
ll
cd libs/
ll
g
git add underscore*
git commit -m "upgrade - underscore 1.1.6"
cd ..
cd libs/
ll
g
git checkout dev
g
git rm ../Player.js
git rm ../Song.js
g
git commit -m "unneeded files"
git merge --no-ff javascript/upgrades 
g
git push
git co accounts 
g
git pull
pwd
cd projects/
cd forks/
ll
cd ..
cd src
ll
cd ~/s
cd ~/src/
ll
cd
cd projects/forks/
git clone https://github.com/documentcloud/backbone.git
git clone https://github.com/documentcloud/underscore.git
git clone https://github.com/Modernizr/Modernizr.git
cd underscore/
ll
cp underscore*.js ~/projects/kids_n_cash/kidsncash/public/javascripts/libs/
git co 1.1.6
cp underscore*.js ~/projects/kids_n_cash/kidsncash/public/javascripts/libs/
cd ..
cd backbone/
ll
git branch 
git co 0.4.0
ll
cp backbone.js ~/projects/kids_n_cash/kidsncash/public/javascripts/libs/
cd ..
cd Modernizr/
ll
git branch
git co v1.7
ll
cp modernizr.js ~/projects/kids_n_cash/kidsncash/public/javascripts/libs/
cd projects/forks/
ll
cd haml-js/
ll
git remote
cat .git/config 
cd ..
rm -rf haml-js/
git clone https://github.com/aaronblohowiak/shared-views.git
cd shared-views/example/
node server.js 
npm install shared-views
node server.js 
npm install connect
node server.js 
npm install haml
node server.js 
npm install glob
node server.js 
npm
npm update
node --help
which node
brew update node
node server
your application is broken
pwd
cd
cd projects/kids_n_cash/
cd kidsncash
ll
gitx
git checkout feature/checklist_backbone 
git merge dev
git reset --hard HEAD^
git reset --hard e2daecbc1e1c3492b5f01cd0a58e0f70a124221f
git merge --no-ff dev
cd public/
ll
vim checklist.html 
g
pwd
cd ..
ll
cd app
ll
cd views/
ll
cd checklist
cd checklists
ll
vim _checklist.haml
cd ..
ll
cd ..
rails --help
man rails
rails generate
git checkout dev
g
git checkout feature/checklist_backbone 
g
rake -T
bundle install
rake -T
rails -h
rails -h generate
rails generate -h
rails generate controller templates
vim app/controllers/templates_controller.rb 
cd app/views/
ll
mkdir templates
cp checklists/_checklist.haml templates/
rm checklists/_checklist.haml
mv checklist_items/_checklist_item.haml templates/
cd templates/
ll
mv _checklist.haml checklist.haml
mv _checklist_item.haml checklist_item.haml 
wha?
rails generate -h
rake routes
touch ../../../tmp/restart.txt 
ll
touch show.haml
rm show.haml 
cp checklist.haml show.haml
pwd
ll
rake routes
ll
git pull
g
gitx
git stash
g
git co dev
git pull
git co accounts 
git pull
pwd
cd
cd projects/kids_n_cash/kidsncash
vim public/javascripts/views/account.js 
vim app/views/accounts/index.html.haml 
vim app/views/layouts/application.html.haml 
vim public/javascripts/views/account_summary.js 
git checkout  feature/checklist_backbone 
git checkout accounts 
touch tmp/restart.txt 
g
git checkout feature/checklist_backbone 
touch tmp/restart.txt 
which gtkevemon
g
brew install zsh
cd projects/kids_n_cash/kidsncash/app/controllers/
ll
