FROM centos:7

RUN yum update -y && yum upgrade  -y && yum install -y perl gcc vim bzip2 patch make expat-devel mysql-devel
RUN echo "insecure" >> ~/.curlrc
RUN curl -L https://install.perlbrew.pl | bash 
RUN ~/perl5/perlbrew/bin/perlbrew self-install
RUN echo "source ~/perl5/perlbrew/etc/bashrc" >> ~/.bashrc
# SHELL ["/bin/bash", "-c"] 
RUN /root/perl5/perlbrew/bin/perlbrew install perl-5.24.4
ENV PATH=/root/perl5/perlbrew/bin:$PATH
RUN perlbrew use perl-5.24.4
RUN ln -s /root/perl5/perlbrew/perls/perl-5.24.4/bin/perl /usr/local/bin/perl
ENV PATH=/root/perl5/perlbrew/perls/perl-5.24.4/bin/:$PATH
## Image to be deployed till here


RUN perl -MCPAN -e 'install App::cpanminus'
RUN cpanm Carton XML::Simple DBD::mysql Mozilla::CA
WORKDIR /app
RUN yum install -y httpd
COPY conf/httpd.conf /etc/httpd/conf
EXPOSE 80
# RUN carton install
# CMD tail -f /dev/null
CMD ["/usr/sbin/httpd", "-D","FOREGROUND"]
