# rust-node-deno-wasm-pack

参考:
https://qiita.com/zembutsu/items/1effae6c39ceae3c3d0a

## imageを焼く
```shell
docker build . -t ghcr.io/<Github Username>/rust-node-deno-wasm-pack:latest
```

## loginする

```shell
cat ./ghcr.txt | docker login ghcr.io -u <Github Username> --password-stdin
```

## ghcrにpushする

```shell
docker push ghcr.io/<Github Username>/rust-node-deno-wasm-pack:latest
```

