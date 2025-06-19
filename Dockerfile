FROM node:18-alpine
WORKDIR /app

# Copy package files (including pnpm-lock.yaml for reproducible builds)
COPY package.json pnpm-lock.yaml ./

RUN npm install -g pnpm
RUN pnpm install --frozen-lockfile

COPY . .
RUN pnpm run build

EXPOSE $PORT

CMD ["pnpm", "run", "serve"]
