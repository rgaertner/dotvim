### Installation

	git clone git://github.com/rgaertner/dotvim.git ~/.vim

### Create symlinks

	ln -s ~/.vim/vimrc ~/.vimrc

### Add plugins to repo

	cd ~/.vim
	git submodule add <url to plugin git repo> bundle/<plugin>
	git add .
	git commit -m "commit comment"


### Obtain plugins

	git submodule init
	git submodule update

### Update plugins

	cd ~/.vim/bundle/<plugin>
	git pull origin master
