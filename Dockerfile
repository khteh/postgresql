FROM postgres:latest
ADD docker-entrypoint.sh /usr/local/bin/custom-docker-entrypoint.sh
RUN rm -f /entrypoint.sh
RUN ln -s usr/local/bin/custom-docker-entrypoint.sh / # backwards compat
ENTRYPOINT ["custom-docker-entrypoint.sh"]
STOPSIGNAL SIGINT
EXPOSE 5432
CMD ["postgres"]
