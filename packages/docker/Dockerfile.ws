FROM oven/bun:1

WORKDIR /usr/src/app

COPY ./packages ./packages
COPY ./bun.lock ./bun.lock

COPY ./packages.json ./package.json
COPY ./turbo.json ./turbo.json

COPY ./apps/websocket ./apps/websocket

RUN bun install
RUN bun run db:generate

EXPOSE 8081

CMD [ "bun", "bun", "start:websocket" ]