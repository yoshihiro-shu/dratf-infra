## Backendの構成

[diagram](https://app.diagrams.net/?src=about#G1CuJWLpUqeXx_Qj7RZWCZc-ojCXzTaIJ_)

<img width="824" alt="image" src="https://user-images.githubusercontent.com/84740493/196251652-5623473f-f8c0-496f-b308-37a7f4141a34.png">

## 環境構築

psql -h localhost -p 5432 -U postgres -d postgres

`curl http://draft.com/api/`でリスポンスが返ってきたら、成功

cd helm

`helm install ./draft-backend  --generate-name`

helm template x . --debug | kubectl apply --dry-run -f -


