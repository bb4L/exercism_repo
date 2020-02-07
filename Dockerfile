# FROM ubuntu:18.04
FROM nimlang/nim:1.0.6

COPY exercism-3.0.13-linux-x86_64.tar.gz .

# RUN apt-get update && apt-get -y install curl

# RUN curl -o filename.tar.gz https://github.com/exercism/cli/releases/download/v3.0.13/exercism-3.0.13-linux-x86_64.tar.gz  
RUN tar -xf exercism-3.0.13-linux-x86_64.tar.gz
RUN mkdir -p ~/bin 
RUN mv exercism ~/bin
RUN echo 'export PATH=~/bin:$PATH' >> ~/.bash_profile
RUN /bin/bash -c "source ~/.bash_profile && exercism configure --token=d168bd85-d69f-411b-9744-eb9d59646511 -w /workspaces/exercism_repo"
# only changed -w