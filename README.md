# アプリケーション名

かんきつ🍊共和国

# アプリケーション概要

種類豊富な柑橘類の味・食べやすさ・感想について、口コミと評価が可能。自分だけのお気に入りリストが作れる「お気に入り！」機能、自由に感想を記載できるレビュー機能、甘味や酸味、食べやすさなどユーザー目線の５段階評価＆チャート機能を実装。

# 利用方法

①ユーザー登録（ユーザーID・パスワードなど） 
②トップページに全種類の柑橘類データが一覧表示されているので、食べたい（調べたい）柑橘類をクリック（ワード検索・一覧表示から探すことも可能）。
③フォームに感想をコメント＋５段階評価を行う。５段階評価の平均点がチャートと連動して表示される。

評価は自由に感想を記載できる「レビュー（コメント）」のほか、総合評価・甘味・酸味・水分・食べやすさの計５項目をユーザー目線で５段階評価。
全４０品種登録してあるのでページネーションによって１ページ10個をリミットとする。 
また、好きな柑橘類には、いいね！をおすことができ、マイページからお気に入りリストを閲覧することが可能。

総合星評価（不味い〜美味しい）　１〜５ 
星評価（甘い〜とても甘い）　１〜５
星評価（酸っぱい〜とても酸っぱい）　１〜５
星評価（水分が少ない〜多い）　１〜５
星評価（皮が固い〜柔らかい）　１〜５

# アプリケーションを作成した背景

自分はかんきつ類は結構好きな方だが、たくさんある品種がどう違うのかよくわかっていないことに気づいた。 また、いざ食べてみると思っていた味と違っていたり、スーパーにたくさん並んでいて挑戦したいものの調べるのが後回しになったりする。 そのように思ったことがある方はたくさんいるのではないかと思い、日本が誇る美味を「生の声」で評価する仕組みを作ろうと思った。 似たような名前が多いため、どれを食べて気に入ったのかも忘れてしまうため、備忘録代わりにも使える。

また、ブログや農協のサイトで、比較記事は多数存在するが、記載されているのは投稿者の感じた味と美味しい季節くらいだけで「食べやすさ」「口コミ」というユーザー観点の項目はほぼ無いことにも気づき、その点にフォーカスして作ろうと思った。

# 洗い出した要件
[要件定義シート](https://docs.google.com/spreadsheets/d/1ZCJzbP8E-JMhBnML81W99TWb8m7_5vvOsB21fUtznfY/edit?usp=sharing)

# データベース設計

[![Image from Gyazo](https://i.gyazo.com/9808982ad5e5296655a1b627fe728eae.png)](https://gyazo.com/9808982ad5e5296655a1b627fe728eae)

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
| item_id            | integer | null: false              |
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
| user_id            | references | null: false, foreign_key: true |  #integerに変更
| item_id            | references | null: false, foreign_key: true |  #integerに変更

### Association

belongs_to :user
belongs_to :item


# 参照元サイト
果物ナビ
旬の食材百科事典
マイナビ農業
「みかんな図鑑」伊藤農園