FROM rust:1.49.0-slim
WORKDIR /app
# COPY . .
RUN apt update \
    && apt install -y git pkg-config nodejs npm \
    && git clone --recursive https://github.com/LiveSplit/LiveSplitOne \
    && cd LiveSplitOne \
    && rustup target add wasm32-unknown-unknown \
    && cargo install wasm-bindgen-cli \
    && npm install \
    && npm run build:core

WORKDIR /app/LiveSplitOne

CMD ["npm", "run", "serve"]

EXPOSE 8080
