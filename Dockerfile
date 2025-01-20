FROM node:22.11.0 AS runner

USER root

RUN mkdir -p /app
WORKDIR /app

COPY package.json yarn.lock ./

RUN yarn install --frozen-lockfile

COPY .next ./.next

EXPOSE 3000

CMD ["yarn", "start"]
