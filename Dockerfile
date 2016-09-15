# Pull base image
FROM nginx:latest

MAINTAINER vi.nt <vi.nt@geekup.vn>

# Install consul-template
RUN apt-get update && apt-get install -y --no-install-recommends curl
RUN curl -SL https://codeload.github.com/hashicorp/consul-template/tar.gz/v0.15.0 | \
    tar -xvzC /usr/local/bin --strip-components 1 && \
    rm -v /etc/nginx/conf.d/* && \
	curl -SL http://stedolan.github.io/jq/download/linux64/jq > /usr/local/bin/jq && chmod u+x /usr/local/bin/jq

# Add nginx.conf && nginx template
ADD nginx.conf /etc/nginx/nginx.conf
ADD nginx.conf.ctmpl /etc/nginx/nginx.conf.ctmpl

# Add boot script
ADD startup.sh restart.sh consul_config.sh config.json /
RUN chmod u+x /startup.sh && \
    chmod u+x /restart.sh && \
    chmod u+x /consul_config.sh

WORKDIR /

EXPOSE 80 443

# Set statup.sh scripts as default cmd
CMD ["/startup.sh"]
