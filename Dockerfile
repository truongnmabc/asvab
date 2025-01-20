FROM node:22.11.0 AS runner

WORKDIR /app

# Sao chép dependencies
COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile --production

# Sao chép thư mục build từ môi trường host
COPY --chown=node:node .next ./.next
COPY --chown=node:node public ./public
COPY --chown=node:node .env ./.env 
# Nếu có file .env
COPY --chown=node:node next.config.js ./next.config.js 
# Nếu có file này

EXPOSE 3000
CMD ["yarn", "start"]
