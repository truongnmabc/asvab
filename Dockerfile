# # Sử dụng Node.js phiên bản 20.2.0
FROM node:22.11.0

# # Thiết lập người dùng là root để tránh vấn đề quyền
USER root

# # Tạo thư mục ứng dụng và đặt làm thư mục làm việc
RUN mkdir -p /app
WORKDIR /app

# # Copy toàn bộ mã nguồn vào container
COPY . .

# # Cài đặt Yarn (nếu chưa có)
# # RUN npm install -g yarn

# # Cài đặt dependencies bằng Yarn
# # RUN npm install 
# # --frozen-lockfile
# # Kiểm tra file trong thư mục (debug)
# RUN ls -a

# # Mở cổng 4050
# EXPOSE 4050

# # Lệnh chạy ứng dụng
# CMD ["yarn", "start", "-p", "4050"]



# Copy package.json and package-lock.json (if available)
COPY package*.json ./


# Copy the built application files

COPY ./.next ./.next
COPY ./next.config.js ./next.config.js
COPY ./public ./public
COPY ./.next/static ./_next/static
COPY ./node_modules ./node_modules
# Expose the desired port (e.g., 3000)

EXPOSE 3000

# Start the Node.js server
CMD ["npm", "run", "start"]