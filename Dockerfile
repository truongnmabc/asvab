# Sử dụng Node.js phiên bản mới nhất (hoặc cố định theo yêu cầu)
FROM node:22.11.0 AS builder

# Thiết lập thư mục làm việc
WORKDIR /app

# Copy package.json và yarn.lock để tận dụng Docker cache
COPY package.json yarn.lock ./

# Cài đặt Yarn
RUN yarn install --frozen-lockfile

# Copy toàn bộ mã nguồn vào container
COPY . .

# Build ứng dụng Next.js
RUN yarn build

# ===========================
# Stage 2: Chạy ứng dụng
# ===========================


WORKDIR /app

# Copy file build từ `builder` sang `runner`
COPY --from=builder /app/.next ./.next
COPY --from=builder /app/public ./public
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/next.config.js ./next.config.js


# Expose cổng cho Next.js (thường là 3000)
EXPOSE 3000

# Chạy ứng dụng Next.js
CMD ["yarn", "start"]
