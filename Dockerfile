FROM node:22.11.0 AS runner

WORKDIR /app

# Copy package files và cài đặt dependencies (chỉ production dependencies)
COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile --production

# Sao chép thư mục build từ môi trường host vào container
COPY .next ./.next
COPY public ./public
COPY .env ./.env 
# Nếu có file .env cần thiết cho runtime
COPY next.config.js ./next.config.js 
# Nếu Next.js cần file config này

EXPOSE 3000
CMD ["yarn", "start"]
