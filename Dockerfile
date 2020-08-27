FROM docker.hypernode.com/byteinternet/hypernode-buster-docker-php73-mysql56:latest

RUN touch /data/web/nginx/magento2.flag
RUN chown app:app /data/web/nginx/magento2.flag

ARG ACTIVE_REPO
RUN rm -rf /data/web/public
RUN cd /data/web
RUN ln -fs repos/$ACTIVE_REPO/pub /data/web/public

RUN echo "su app" > /root/.bashrc
RUN echo "cd ~" >> /data/web/.bashrc