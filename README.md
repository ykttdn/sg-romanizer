# sg-romanizer
株式会社ソニックガーデン主催、[第4回 SG Tech スキルアップ勉強会「あなたもチャレンジ！コードレビューライブ 〜伊藤淳一からの挑戦状〜」](https://sonicgarden.connpass.com/event/332113/)の提出用リポジトリです。

この企画に参加してコードレビューを受けてみたい方はこのリポジトリをフォークし、自分の書いたコードでプルリクエストを作成してください。

## 企画の概要
第4回 SG Tech スキルアップ勉強会ではコードレビューをテーマにした勉強会を開催します。

この勉強会では参加者のみなさんから実際にコードを提出してもらい、勉強会の中でソニックガーデンのプログラマ・伊藤淳一がリアルタイムにコードレビューを実施します。

プロのRubyプログラマからコードレビュー受けてみたい、という方はぜひチャレンジしてください！  
（挑戦者の方はコードを提出するだけで大丈夫です。当日発言してもらう必要はありません。）

なお、時間の都合により、全員のコードレビューが行えない可能性があります。その点はあらかじめご了承ください。

## 参加資格

興味がある方は初心者・上級者を問わず、どなたでもOKです。

イベント当日までにコードを書いてプルリクエストを作成すれば、それで申込み完了です！

（注）プルリクエストの作成は任意です。「プルリクエストを作らないと勉強会に参加できない」というわけではないのでご心配なく。

## 今回のお題「ローマ数字変換プログラム」

この企画ではみなさんに「ローマ数字変換プログラム」を作成してもらいます。

このプログラムはアラビア数字をローマ数字に、ローマ数字をアラビア数字にそれぞれ変換します。  
以下はこのプログラムの実行例です。

```ruby 
romanizer = SgRomanizer.new

# アラビア数字 → ローマ数字
romanizer.romanize(1) #=> "I"
romanizer.romanize(2) #=> "II"
romanizer.romanize(3) #=> "III"
# ...
romanizer.romanize(3999) #=> "MMMCMXCIX"

# ローマ数字 → アラビア数字
romanizer.deromanize("I")   #=> 1
romanizer.deromanize("II")  #=> 2
romanizer.deromanize("III") #=> 3
# ...
romanizer.deromanize("MMMCMXCIX") #=> 3999
```

## ローマ数字の表記法について

（このセクションは[こちらのページ](https://home.hiroshima-u.ac.jp/tasakih/explanation/roman.html)の内容をベースにして説明しています）

アラビア数字とローマ数字の基本的な対応関係は次のようになっています。

- 1 = I
- 2 = II
- 3 = III
- 4 = IV
- 5 = V
- 6 = VI
- 7 = VII
- 8 = VIII
- 9 = IX
- 10 = X

1は"I"、5は"V"、10は"X"です。  

小さい数を大きい数の左に書くと、右から左を減ずることを意味します。  
たとえば "IV" は 5 - 1（つまり4）の意味で、"IX" は 10 - 1（つまり9）の意味です。

反対に小さい数を大きい数の右に書くと、左と右を加算することを意味します。  
たとえば "VI" は 5 + 1（つまり6）の意味です。

10から100までの対応関係は次のようになっています。

- 10 = X
- 20 = XX
- 30 = XXX
- 40 = XL
- 50 = L
- 60 = LX
- 70 = LXX
- 80 = LXXX
- 90 = XC
- 100 = C

10は"X"、5は"L"、100は"C"です。  
1〜10のときと考え方は同じで、"XL" であれば 50 - 10（つまり40）を意味し、"LX" であれば 50 + 10（つまり60）を意味します。

100から1000までの対応関係は次のようになっています。

- 100 = C
- 200 = CC
- 300 = CCC
- 400 = CD
- 500 = D
- 600 = DC
- 700 = DCC
- 800 = DCCC
- 900 = CM
- 1000 = M

100は"C"、5は"D"、1000は"M"です。  
考え方は1〜10の場合や10〜100の場合と同じなので省略します。

1000の位は3000までしか表現できません。なぜなら5000や10000に対応する文字がないからです。

- 1000 = M
- 2000 = MM
- 3000 = MMM

これらを使って、10進法の各位を位の大きい順に左から並べると 1 から 3999 までの数を表すことができます。 

たとえば、493であれば"CDXCIII"になります。これはつまり、

- 400 = CD
- 90 = XC
- 3 = III

を順番に並べた結果です。

同様に、2024であれば "MMXXIV" となります。

## 技術要件

### 実行環境について

- Ruby 3.3以上で動作すること（GitHub ActionsのRubyバージョンは3.3.5です）
- 3rd party gemを使用しないこと（gem installなしで動作すること）
- Bundlerは使用しないこと

### 自分が書くコードについて

- `lib/sg_romanizer.rb`に自分が考えたロジックを書くこと
  - 予めクラス定義と空のメソッド定義が書いてあるので、ここにロジックを書いていく
- テストコードは `test/sg_romanizer_test.rb` にあるので、このテストが全部パスするようにコードを実装する
  - このテストコードは改変不可

### 【重要】参加する上で守ってほしいこと

みなさんが自力で考えたコードをレビューしたいので、以下のルールを守ってください。

- GitHub CopilotのようなAIコード支援機能はオフにしてください
- ネット上に公開されている変換アルゴリズムを見たり、ChatGPTに聞いたりしないようにしてください
- 他の人のプルリクエストを見ないようにしてください

ただし、自分の解答を提出し終わってこれ以上絶対に変更しない、と誓ったらあとは自由です！

### 提出の必須条件

テストコードがすべてパスすること。テストコードは以下のようにして実行できる。

```
$ ruby test/sg_romanizer_test.rb --no-plugins
Run options: --seed 629

# Running:

..

Finished in 0.039555s, 50.5625 runs/s, 202199.4691 assertions/s.

2 runs, 7998 assertions, 0 failures, 0 errors, 0 skips
``` 

対応する入力パターンはテストコード内のパターンだけでOKとする。  
0や不正な文字列を入力するなど、値が変換できないケース（異常系）の考慮は不要。

## コードの提出方法

1. この雛形リポジトリをフォークする
2. コードが書けたらプルリクエストを作る
3. GitHub ActionsのテストがパスすればOK

## プルリクエストのdescriptionに書いてほしいこと

プルリクエストのdescriptionには以下のような内容を含めてください。

- コードのアピールポイント
    - 頑張ったところ
    - 苦労したところ
    - 工夫したところ
    - 自慢したいところ
    - etc
- コードを書くのにかかった時間（ざっくりでよいです。10分、1時間、3日、etc.）
- だいたいのプログラミング歴
- ロジックを詳しく解説したブログ記事（もしあれば）
- 伊藤さんにメッセージ（こちらももしあればw）

## 質問はGitHub issuesへ

何か不明な点があれば、このリポジトリのissuesへ投稿してください。

https://github.com/SonicGarden/sg-romanizer/issues

## まとめ

みなさんからカッコいいコードがたくさん届くのを楽しみにしています！
