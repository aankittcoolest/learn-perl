
```bash
# inscure curl
echo "insecure" >> ~/.curlrc

# install perlbrew
curl -L https://install.perlbrew.pl | bash

# configure perlbrew
echo "source ~/perl5/perlbrew/etc/bashrc" >> ~/.zshenv
source ~/.zshenv

# get list of available perl versions
perlbrew available

# install perl via perlbrew
perlbrew install 5.32.1

# track installation
tail -f ~/perl5/perlbrew/build.perl-5.32.1.log





```