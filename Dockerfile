FROM nginx

ADD https://github.com/bitly/google_auth_proxy/releases/download/v1.0/google_auth_proxy-1.0.linux-amd64.go1.3.tar.gz ./

RUN tar xvzf google_auth_proxy-1.0.linux-amd64.go1.3.tar.gz
RUN apt-get update && apt-get install -y curl && apt-get clean && rm -rf /var/lib/apt/lists

ADD nginx.conf /etc/nginx/

CMD	./google_auth_proxy-1.0.linux-amd64.go1.3/google_auth_proxy \
   --redirect-url="http://www.softhouse.se/oauth2/callback"  \
   --google-apps-domain="softhouse.se"  \
   --upstream=http://www.softhouse.se/ \
   --cookie-https-only=false \
   --http-address="0.0.0.0:4180"