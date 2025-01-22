# ✅ Sử dụng Alpine Linux để giảm dung lượng image
FROM node:22-alpine

# ✅ Thiết lập thư mục làm việc
WORKDIR /app

# ✅ Copy build đã tạo từ GitHub Actions vào container
COPY build_output/.next ./.next
COPY build_output/public ./public
COPY package.json yarn.lock ./

# ✅ Chỉ cài đặt dependencies cần thiết cho runtime (bỏ qua devDependencies)
RUN yarn install --production --frozen-lockfile

# ✅ Thiết lập biến môi trường để chạy ở production mode
ENV NODE_ENV=production

# ✅ Mở cổng 3000
EXPOSE 3000

# ✅ Khởi chạy ứng dụng Next.js
CMD ["yarn", "start"]
