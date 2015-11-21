# howaboutyou
勤勉な人のツイッターアカウントを指定して、自分を煽ります。
## usage
target：勤勉な人のツイッターアカウントid（デフォルトはteramonagiさんです）
from：送信元のメールアドレス（GMail限定）
to：送信先のメールアドレス
twitter_consumer_key：あなたのTwitter CONSUMER KEYを指定してください。CONSUMER KEYの取得は[こちら](http://hello-apis.blogspot.jp/2013/03/twitterapi.html)などを参照のこと。
twitter_consumer_secret：あなたのTwitter CONSUMER SECRETを指定してください。
gmailr_json_path：gmail API jsonファイルのパスを指定してください。認証の手順は[こちら](http://qiita.com/soundTricker/items/e09351ab2c82760ac5b1)などを参照のこと。。認証したらjson形式でダウンロードしてそのパスを指定します。

## example

```r
library("howaboutyou")
HAY(target="teramonagi",
    from = "tokorosawayoshio@gmail.com",
    to = "yosshioyosshio99999999@i.softbank.jp",
    twitter_consumer_key="あなたのTwitter CONSUMER KEY",
    twitter_consumer_secret="あなたのTwitter CONSUMER SECRET",
    gmailr_json_path="あなたのgmail API jsonファイルのパス"
)

```
