## Backendの構成（Kubernetes）

[diagram](https://app.diagrams.net/?src=about#G1CuJWLpUqeXx_Qj7RZWCZc-ojCXzTaIJ_)

<img width="1749" alt="image" src="https://user-images.githubusercontent.com/84740493/197341460-494f2352-0da0-406d-ba0a-d1a92476d51e.png">

## 環境構築

`curl http://draft.com/api/`でリスポンスが返ってきたら、成功

cd helm

`helm install ./draft-backend  --generate-name`

helm template x . --debug | kubectl apply --dry-run -f -


