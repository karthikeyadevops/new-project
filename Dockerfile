FROM ubuntu:22.04
LABLE version:latest
RUN sudo apt update
RUN sudo apt install nginx
CMD ["/usr/sbin/nginx", "-D", "FOREGROUND"]
EXPOSE 80
