FROM python
RUN pip install feediverse
VOLUME /data
WORKDIR /data
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]