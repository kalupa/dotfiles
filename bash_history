ll
cd student_photos/
ll
for file in *; do mv "$file" "${file}".html; done
cd ..
cd student_videos/
ll
for file in *; do mv "$file" "${file}".html; done
ll
cd ..
ll
cd ..
ll
cd node/
ll
for file in *\?page=1; do mv "$file" "${file}".html\?page=1;done
ll
for file in *\?page=1\.html\?page=1; do mv "$file" "${file\?page=1}".html\?page=1;done
for file in *\?page=1\.html\?page=1; do mv "$file" "${file/?page=1}".html\?page=1;done
ll
for file in *\?page=1\.html\?page=1; do mv "$file" "${file/?page=1}";done
ll
for file in *.html.html\?page=1; do mv "$file" "${file.html}".html?page=1;done
for file in *.html.html\?page=1; do mv "$file" "${file/.html}".html?page=1;done
ll
for file in *\?page=1\.html\?page=1; do mv "$file" "${file/?page=1}";done
ll
for file in *.html.html\?page=1; do mv "$file" "${file/.html}"?page=1;done
ll
for file in *.html.?page=1?page=1; do mv "$file" "${file/?page=1}"?page=1;done
for file in *.html?page=1?page=1; do mv "$file" "${file/?page=1}"?page=1;done
ll
for file in *.html?page=1?page=1; do mv "$file" "${file/?page=1}";done
ll
for file in *\D\W\S; do mv "$file" "${file}".html; done
for file in (*\D\W\S); do mv "$file" "${file}".html; done
for file in *; do mv "$file" "${file}".html; done
ll
for file in *.html?page=1.html; do mv "$file" "${file/.html}";done
ll
for file in *.page=1.html; do mv "$file" "${file/?page=1.html}".html;done
for file in *?page=1.html; do mv "$file" "${file/?page=1.html}".html;done
ll
cd ..
ll
cd what-we-offer
ll
for file in *; do mv "$file" "${file}".html;done
ll
ssh 184.106.81.224
ssh njc.ch@njc.ch
cd ..
cd
cd projects/neuchatel/www.njc.ch/sites/all/themes/neuchatel/
cd css
ll
cat * > all.css
ll
rm all.css
ll
cat block-editing.css blocks.css comments.css drupal6-reference.css fields.css forms.css html-reset.css layout-fixed.css messages.css navigation.css nodes.css page-backgrounds.css pages.css  panels-styles.css tabs.css views-styles.css wireframes.css | all.css
cat block-editing.css blocks.css comments.css drupal6-reference.css fields.css forms.css html-reset.css layout-fixed.css messages.css navigation.css nodes.css page-backgrounds.css pages.css  panels-styles.css tabs.css views-styles.css wireframes.css > all.css
cd ..
cd js/
ll
cd ..
ll
cd zen/
ll
cd ..
ll
cd ..
cd
ssh njc.ch@njc.ch
ssh 184.106.81.224
ssh karrupa@184.106.81.224
ssh root@184.106.81.224
ssh njc.ch@njc.ch
ssh 184.106.81.224
ssh root@184.106.81.21
ssh 184.106.81.21
bind -P
ssh njc.ch@njc.ch
ssh 184.106.81.21
cd projects/neuchatel/njc.ch/
ll
cd html/
ll
scp sites njc.ch@njc.ch: ~/domains/njc.ch/html/sites
ll
cd sites
ll
cd ..
scp -R site/s njc.ch@njc.ch: ~/domains/njc.ch/html/sites/
scp -R site/s njc.ch@njc.ch: ~/domains/njc.ch/html/sites
scp -R sites/ njc.ch@njc.ch: ~/domains/njc.ch/html/sites
scp -R sites njc.ch@njc.ch: ~/domains/njc.ch/html/sites
scp -r sites njc.ch@njc.ch: ~/domains/njc.ch/html/sites
scp -r sites/ njc.ch@njc.ch: ~/domains/njc.ch/html/sites
what the hell?
cd sites
ls -la
scp -r * njc.ch@njc.ch:
cat ~/.ssh/id_rsa.pub 
ssh 184.106.81.224
cat ~/.ssh/id_rsa.pub 
ssh 184.106.81.224
cd ..
cd njc.ch/html/sites/default/
less settings.php 
cd ..
ll
cd ..
ll
cd ..
tar -czvf * ../njc.tgz
ll
cd html/
tar -czvf * ../njc-new.tgz
ll
tar -czvf * njc.tgz
tar -czvf * ./njc.tar.gz
tar
tar -c
man tar
tar -czv * ../njc.tar.gz
ssh njc.ch4Mns02JcE
184.106.81.21
ssh 184.106.81.21
cd projects/neuchatel/njc.ch
ll
mv njc.tgz njc.tgz.bak
tar cvfz njc.tgz html
tar -cvfz njc.tgz html/*
ll
rm njc.tgz z
cd html/
tar -czvf ../njc.tgz *
cd ..
ll
scp njc.tgz 184.106.81.21:
scp 84.106.81.21
ssh 84.106.81.21
ssh 184.106.81.21
ssh njc.ch@njc.ch
ssh 184.106.81.21
cd lib
ll
cd qunit/
ll
cd test/
ll
mate .
cd ..
ll
open .
mate .
cd
cd projects/kids_n_cash/
ll
cd ap
cd app
mate .
bundle update
rvm 1.9.2
bundle update
rvm
rvm use 1.9.2 --default
bundle update
rails g jasmine:install
rails g
gem install jasmine
rails g
rails g jasmine:install
cd spec/
ll
cd ..
ll
echo "rvm 1.9.2" > .rvmrc
jasmine
rails g jasmine:install
jasmine init
ll
rm -rf +26
ll
cd autotest/
ll
cd ..
ll
cd public/
ll
cd javascripts/
ll
rake jasmine:ci
ll
cd ..
ll
cd ..
ll
cd config
ll
cd ..
ll
cd test
ll
cd ..
cd spec/
ll
cd javascripts/
ll
cd support/
ll
less jasmine.yml 
g
gitx
bundle update
g
bundle update
cd ..
g
ruby -v
ll
gem install autotest-growl
autotest
mate .
rails server
g
git add .
git commit -m "foo"
g
git rm public/javascripts/views/checklistApp.js
git commit --amend -m "bar"
git co -b pk
ll
g
git co master
gg
g
gg
ll
script/server
rails server
ruby -v
bundle install
rails server
bundle update
gem install jasmine
rails g jasmine:install
bundle exec rails g jasmine:install
bundle lock
rails g jasmine:install
bundle exec rails g jasmine:install
jasmine init
rake jasmine
ssh 184.106.81.21
ssh 184.106.81.21
siege
man siege
siege -b
siege -i -d30
sudo vi /etc/apache2/httpd.conf 
vi .siegerc 
man siege
siege -i -d30 -c5
cd lib
ll
cd ICanHaz.js/
ll
git pull
cp ICanHaz.js ~/projects/kids_n_cash/app/public/javascripts/libs/
cp ICanHaz*.js ~/projects/kids_n_cash/app/public/javascripts/libs/
cd ..
git clone https://github.com/janl/mustache.js.git
cd mustache.js/
ll
cd mustache-jquery/
ll
cd ..
ll
rake
rake --trace
ll
cp mustache.js ~/projects/kids_n_cash/app/public/javascripts/libs/
cd ~/Library/Application\ Support/TextMate/Bundles/
gem install textmate
textmate install Jasmine
ha ha
cd ~/Library/Application\ Support/TextMate/Bundles/
git clone git://github.com/pivotal/jasmine-tmbundle.git Jasmine.tmbundle
sascript -e 'tell app "TextMate" to reload bundles'
osascript -e 'tell app "TextMate" to reload bundles'
cd
cd src/
ll
cd ..
ll
cd lib
ll
git clone https://github.com/pivotal/jasmine.git
cd jasmine/
ll
cd pages/
ll
cd ..
ll
rake
git submodule update --init
git co fancy-html
g
git co lib/jasmine.js
g
mkdir pages
git co fancy-html
g
ll
rake
you suck balls
cd example/
ll
less example_runner.html 
cd
cd projects/kids_n_cash/app/
ssh http://184.106.81.21/
ssh 184.106.81.21
port
port selfupdate
sudo port selfupdate
sudo port install siege
siege
siege.config
siege -C
vim ~/.siegerc 
siege -C
vim ~/urls.txt
siege
vim ~/.siegerc 
vim ~/urls.txt
siege
rails server
cd projects/kids_n_cash/
g
cd app/
g
git co pk
git stash
git co pk
g
git -b co pk
git branch pk
git co pk
git stash apply
git branch rm pk
git co -b pk
git branch
git branch --help
git branch -D pk
git branch -D rm
git co -b pkl
ll
g
git add Gemfile*
g
git add lib/tasks/jasmine.rake
g
git add public/javascripts/models/
git add public/javascripts/views
g
git commit -m "stub"
g
rake jasmine
ps
kill -9 93105
rake jasmine
ps
kill -9 4031
rake jasmine:ci
autotest
rake jasmine:ci
rake jasmine
ps
kill -9 88798
g
gitx
open -n /Applications/EVE\ Online.app/
ll
mate public/ spec/javascripts/
g
rails server
cd lib
ll
cd ICanHaz.js/
ll
make
make test
less Makefile 
cd test/
ll
open test.html
open .
mate .
vim
mvim
echo $EDITOR
cd ~/src/
git clone git://github.com/b4winckler/macvim.git
ssh 184.106.81.21
vi
port
sudo port selfupdate
why?
ports --help
port --help
port help
man port
sudo port -v selfupdate
tee
man tee
cd /opt/local/var/macports/sources/rsync.macports.org/release/base
./configure --prefix=/opt/local --with-tclpackage=/Library/Tcl --with-install-user=root --with-install-group=admin --with-directory-mode=0755 --enable-readline
sudo ./configure --prefix=/opt/local --with-tclpackage=/Library/Tcl --with-install-user=root --with-install-group=admin --with-directory-mode=0755 --enable-readline
sudo make
cd
ll
cd .vim
ll
git init
g
git add .
g
git commit -m "initial"
cat .vimrc
cat ~/.vimrc
ll
cd ..
ll
vim .vimrc 
cd .vim
ll
rm -rf .git
ll
cd
ll
cd bin
mkdir dotfiles
ll
mv .vim dotfiles/vim
mv .vimrc dotfiles/vimrc
ln -nfs dotfiles/vim/ .vim
ln -nfs dotfiles/vimrc .vimrc
rm .gvimrc 
cd vim
rm .vimtags
ln -nfs dotfiles/vim/tags .vimtags
ll
less .viminfo
mv .viminfo dotfiles/viminfo
ln -nfs dotfiles/viminfo .viminfo
ll
rm .vimfuzzyfinder 
ll
ls bash*
ls .bash*
mv .bash dotfiles/bash
ln -nfs dotfiles/bash .bash
ll
mv .bash_history dotfiles/bash_history
mv .bash_profile dotfiles/bash_profile
ln -nfs dotfiles/bash_history .bash_history
ln -nfs dotfiles/bash_profile .bash_profile
less .heroku/credentials 
ll
vim
cd dotfiles/
ll
git init
git add .
git remote add origin git@github.com:kalupa/dotfiles.git
git commit -m "init"
git push -u origin master
touch README.markdown
bim README.markdown 
vim README.markdown 
mate README.markdown 
g
git commit -a -m "markdowned"
git push
ll vim
ll vim/ftplugin/
ll vim/colors/
g
gf
gd
git add .
git commit -m "lets turn off those lazy save commands"
git push
gf
g
gd
git commit -a -m "change scrolloff"
git push
