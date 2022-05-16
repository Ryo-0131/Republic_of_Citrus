# アプリケーション名

かんきつ🍊共和国

# アプリケーション概要

種類豊富な柑橘（かんきつ）類の味・食べやすさ・感想についてユーザーの口コミと評価が可能。 

評価は自由に感想を記載できる「レビュー（コメント）」と「いいね！」のほか、「甘味〜苦味」、「水分が多い〜少ない」、「皮が固い〜柔らかい」、合計３つのユーザー目線の項目を５段階評価でレーティング。
トップページの柑橘類は、総合評価の平均値順で変わる（３０品種以上あるのでページネーションによって１ページ10個をリミットとする）。

# 利用方法

①ユーザー登録（ユーザーID・パスワードなど） 
②トップページに全種類の柑橘類データが一覧表示されているので、食べた柑橘類をクリック（検索して探すことも可能）。
③フォームに感想をコメント＋５段階評価を行う。５段階評価の平均順でトップページの柑橘類の順番が変動する。

評価は自由に感想を記載できる「レビュー（コメント）」のほか、総合評価や皮の固さなどの計３つのユーザー目線の項目を５段階評価でレーティング。 
トップページの柑橘類は、総合評価の平均値順で変わる（３０品種以上あるのでページネーションによって１ページ10個をリミットとする）。 
また、好きな柑橘類には、いいね！をおすことができる。

総合星評価（不味い〜美味しい）　１〜５
星評価（甘い〜とても甘い）　１〜５
星評価（酸っぱい〜とても酸っぱい）　１〜５
星評価（水分が少ない〜多い）　１〜５
星評価（皮が固い〜柔らかい）　１〜５

# 利用方法

<br>①ユーザー登録（ユーザーID・パスワードなど）</br>
<br>②トップページに全種類の柑橘類データが一覧表示されているので、食べた柑橘類をクリック（検索して探すことも可能）。</br>
<br>③フォームに感想をコメント＋５段階評価を行う。５段階評価の平均順でトップページの柑橘類の順番が変動する。</br>

# アプリケーションを作成した背景

自分はかんきつ類は結構好きな方だが、たくさんある品種がどう違うのかよくわかっていないことに気づいた。 また、いざ食べてみると思っていた味と違っていたり、スーパーにたくさん並んでいて挑戦したいものの調べるのが後回しになったりする。 そのように思ったことがある方はたくさんいるのではないかと思い、日本が誇る美味を「生の声」で評価する仕組みを作ろうと思った。 

また、ブログや農協のサイトで、比較記事は多数存在するが、記載されているのは投稿者の感じた味と美味しい季節くらいだけで「食べやすさ」「口コミ」というユーザー目線の項目はほぼ無いことにも気づき、その点にフォーカスして作ろうと思った。

<br>また、ブログや農協のサイトで、比較記事は多数存在するが、記載されているのは投稿者の感じた味と美味しい季節くらいだけで「食べやすさ」「口コミ」というユーザー目線の項目はほぼ無いことにも気づき、その点にフォーカスして作ろうと思った。</br>

# 洗い出した要件
[要件定義シート](https://docs.google.com/spreadsheets/d/1ZCJzbP8E-JMhBnML81W99TWb8m7_5vvOsB21fUtznfY/edit?usp=sharing)


# データベース設計

[![Image from Gyazo](https://i.gyazo.com/bf386d87e5bb0e76f2cb89dd1d70e5df.png)](https://gyazo.com/bf386d87e5bb0e76f2cb89dd1d70e5df)

# 画面遷移図

[![Image from Gyazo](https://i.gyazo.com/a289a803ae6245b5435eb1c06ed63d03.png)](https://gyazo.com/a289a803ae6245b5435eb1c06ed63d03)

# テーブル設計

## users テーブル

| Column             | Type    | Options                  |
| ------------------ | ------- | ------------------------ |
| email              | string  | null: false, unique: true|
| encrypted_password | string  | null: false              |
| nickname           | string  | null: false              |
| prefecture_id      | integer | null: false              |
| favorite_id        | integer | null: false              |
| introduction       | text    | null: false              |

### Association

- has_many :reviews, dependent: :destroy
- has_many :likes, dependent: :destroy


## items テーブル

| Column             | Type    | Options                  |
| ------------------ | ------- | ------------------------ |
| item_name          | string  | null: false              |
| description        | text    | null: false              |
| image_url          | string  | null: false              |
| star               | float   | null: false              |

### Association

- has_many :reviews, dependent: :destroy
- has_many :likes, dependent: :destroy


## reviews テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------  | ------------------------------ |
| comment            | text       | null: false                    |
| all_rating         | integer    | null: false                    |
| rating1            | integer    | null: false                    |
| rating2            | integer    | null: false                    |
| rating3            | integer    | null: false                    |
| rating4            | integer    | null: false                    |
| user_id            | references | null: false, foreign_key: true |
| item_id            | references | null: false, foreign_key: true |

### Association

belongs_to :user
belongs_to :item


## likes テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------  | ------------------------------ |
| user_id            | references | null: false, foreign_key: true |　#integerに変更
| item_id            | references | null: false, foreign_key: true |　#integerに変更

### Association

belongs_to :user
belongs_to :item
