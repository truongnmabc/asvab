# Sử dụng node 22.11.0 làm base image
FROM node:22.11.0 AS builder

WORKDIR /app

# Sao chép và cài đặt dependencies
COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile

# Sao chép toàn bộ source code vào container
COPY . .

# Build Next.js
RUN yarn build

# Chạy unit tests (tùy chọn)
RUN yarn test:unit


# Tạo một lightweight image cho runtime
FROM node:22.11.0 AS runner

WORKDIR /app

# Sao chép dependencies từ builder (chỉ copy dependencies production để giảm dung lượng image)
COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile --production

# Sao chép build output từ builder
COPY --from=builder /app/.next ./.next
COPY --from=builder /app/public ./public
COPY --from=builder /app/next.config.js ./next.config.js
COPY --from=builder /app/.env ./.env
# Nếu có file .env cần thiết

# Expose port 3000 để chạy ứng dụng
EXPOSE 3000

# Start ứng dụng
CMD ["yarn", "start"]
