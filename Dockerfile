FROM ruby:3.2.6-alpine3.20
WORKDIR /app

COPY Gemfile ./
COPY Gemfile.lock ./
RUN apk add --no-cache mysql-client \
mysql-dev \
alpine-sdk
RUN bundle config --local set path 'vendor/bundle'
RUN bundle install

# アプリケーションのソースコードをコピー
COPY . .

# ポートを公開
EXPOSE 8080

# CMD bundle exec ruby app.rb
# アプリケーションを起動
# CMD ["ruby", "app.rb"]
# CMD ["bundle", "exec", "puma", "-p", "8080"]
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]