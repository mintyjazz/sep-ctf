FROM python:3.8-slim
RUN useradd -m ctf
WORKDIR /chal
COPY . .
ENV PORT 8000 
RUN chown -R root:ctf /chal
USER ctf
CMD ["/usr/local/bin/python3", "-m", "http.server", "8000"]
EXPOSE 8000 
