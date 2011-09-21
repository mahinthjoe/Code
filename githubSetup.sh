#generate ssh public key for github
  ssh-keygen -t rsa -C "mahinthjoe@gmail.com"
#github install
  sudo yum -y install git-core git-gui git-doc //git install
#Github.com Configuration
  git config --global user.name "Mahinth Christensen"
  git config --global user.email "mahinthjoe@gmail.com"
  git config --global github.user mahinthjoe
  git config --global github.token 08ea2faac8bfb116f9e98a6cd7d895f5
