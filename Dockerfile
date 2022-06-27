FROM centos:7

RUN yum update -y && yum upgrade  -y && yum install -y perl gcc vim bzip2 patch make expat-devel mysql-devel httpd openssl
RUN echo "insecure" >> ~/.curlrc && curl -L https://install.perlbrew.pl -o install.perlbrew.pl
ENV PERLBREW_ROOT="/usr/local/perlbrew"
RUN cat install.perlbrew.pl | bash
RUN source /usr/local/perlbrew/etc/bashrc &&  perlbrew install perl-5.24.4 && perlbrew switch perl-5.24.4
ENV PATH=/usr/local/perlbrew/bin:/usr/local/perlbrew/perls/perl-5.24.4/bin:$PATH
# ## Image to be deployed till here

RUN perl -MCPAN -e 'install App::cpanminus'
RUN cpanm Carton XML::Simple DBD::mysql Mozilla::CA CGI LWP::Protocol::https JSON Jcode Email::Valid::Loose 
# RUN cpanm File::Log
WORKDIR /app
COPY conf/httpd.conf /etc/httpd/conf

RUN curl -fsSL https://rpm.nodesource.com/setup_14.x | bash - && yum install -y nodejs

EXPOSE 80
# # RUN carton install
# CMD tail -f /dev/null
CMD ["/usr/sbin/httpd", "-D","FOREGROUND"]