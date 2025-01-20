FROM node:22.11.0 AS runner

WORKDIR /app

COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile --production

RUN yarn build

RUN yarn test:unit


EXPOSE 3000
CMD ["yarn", "start"]