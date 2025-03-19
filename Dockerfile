FROM postgres:latest
ADD docker-entrypoint.sh /usr/local/bin/custom-docker-entrypoint.sh
ENTRYPOINT ["custom-docker-entrypoint.sh"]
STOPSIGNAL SIGINT
EXPOSE 5432
CMD ["postgres"]
