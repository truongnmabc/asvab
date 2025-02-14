# ✅ 1️⃣ Sử dụng Alpine để giảm kích thước image
FROM node:22-alpine AS runner
WORKDIR /app/web

# ✅ 2️⃣ Copy các file đã build từ môi trường bên ngoài
COPY .env .env

# ✅ 3️⃣ Thiết lập biến môi trường cho production
ENV NODE_ENV=production

# ✅ 4️⃣ Mở cổng
EXPOSE 3000

# ✅ 5️⃣ Chạy ứng dụng Next.js
CMD ["yarn", "start", "-p", "3000"]
