gateway の設定ファイルを取得して，変更があった場合，設定されたメールアドレスに変更点を送信する．

## Usage
```
dolly.env
```

dolly.sh内で使用する環境変数を設定するためのファイル．
環境変数ごとの説明は以下．
-----------
SENDTO：
ゲートウェイの設定ファイルに変更があった場合に，変更点の送信先となるメールアドレス
メールアドレス間を","でつなぐことで複数のメールアドレスを指定可能

GW1:
設定ファイルの取得先となるゲートウェイ（一つ目）のホスト名

GW2:
設定ファイルの取得先となるゲートウェイ（二つ目）のホスト名

GW1_CONF:
取得したゲートウェイ（一つ目）の設定ファイルを配置する計算機上のパス

GW2_CONF:
取得したゲートウェイ（二つ目）の設定ファイルを配置する計算機上のパス

-----------


```
% sh dolly.sh
```

ゲートウェイの設定ファイルに変更があった場合は，"dolly.env"ファイル内に記述している`SENDTO`に書かれているメールアドレスに変更点を送信する．
本スクリプトは定期実行するには，cronを用いて設定する必要がある．
自動で回す場合は，GitHub に SSH を用いてアクセスする必要があるため，設定する必要がある．

## TODO

- メールの送信先を直書きしているため，別途設定用のファイルを読み込むようにする．
- 設定ファイルの変更を契機に取得できるようにする．