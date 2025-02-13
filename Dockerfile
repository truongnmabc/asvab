# ✅ Sử dụng Alpine Linux để giảm dung lượng image
FROM node:22-alpine
USER root

# ✅ Tạo thư mục làm việc trong container
RUN mkdir -p /app/web
WORKDIR /app/web

# ✅ Copy build đã tạo từ GitHub Actions vào container
COPY .next .next
COPY public public
COPY package.json yarn.lock ./
 # Nếu cần copy file env vào container

# ✅ Cài đặt chỉ dependencies cần thiết cho runtime (bỏ qua devDependencies)
RUN yarn install --production --frozen-lockfile

# ✅ Thiết lập biến môi trường để chạy ở production mode
ENV NODE_ENV=production

# ✅ Mở cổng cho ứng dụng
EXPOSE 4050

# ✅ Khởi động ứng dụng Next.js
CMD ["yarn", "start", "-p", "4050"]
