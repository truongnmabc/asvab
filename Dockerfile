# Stage 1: Chạy ứng dụng, không build lại
FROM node:22.11.0 AS runner

USER root

RUN mkdir -p /app
WORKDIR /app

# Copy package.json và yarn.lock để tận dụng Docker cache
COPY package.json yarn.lock ./

# Cài đặt dependencies nhưng KHÔNG chạy build
RUN yarn install --frozen-lockfile

# Copy build từ GitHub Actions vào Docker image
COPY .next ./.next
COPY public ./public
COPY node_modules ./node_modules

EXPOSE 3000

CMD ["yarn", "start"]
