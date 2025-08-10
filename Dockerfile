# ベースイメージは軽量なnodeのAlpine
FROM node:18-alpine

WORKDIR /app

# package.jsonとpackage-lock.jsonを先にコピーし依存をインストール（キャッシュ用）
COPY package.json package-lock.json* ./
RUN npm install

# ソースコードをコピー
COPY . .

# Next.jsをビルド
RUN npm run build

# 3000ポートを公開
EXPOSE 3000

# 本番起動コマンド
CMD ["npm", "start"]
