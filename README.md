## アプリケーション名
### coedo
![image](https://user-images.githubusercontent.com/73771836/102970014-1654ad80-453a-11eb-9a0a-fe76bdcbc488.png)


## アプリケーション概要
埼玉県川越市の観光スポット、ショップ、イベントを共有するアプリケーションです。

## URL
https://coedo-31996.herokuapp.com/

## テスト用アカウント
+ メールアドレス sample@a.com
+ パスワード a12345
+ Basic認証
+ ID admin
+ パスワード 2222

## 利用方法
+ 投稿一覧にて川越市の観光スポット、ショップ情報、イベントを確認することができます。
+ ユーザー詳細画面にてユーザーが投稿したニュースを確認することができます。
+ ログインしたユーザーは情報を投稿し、周知を広げることができます。

## 目指した課題解決

+ 観光に行った際に観光地はどこか、どんなお店があるのか分からず観光時間を無駄にしてしまった
+ 地元の方にもあのお店気になるけどどんなお店なのか詳細が知りたい

## 洗い出した要件
| 実装機能 | 目的 | 詳細 | ストーリー(ユースケース) |
|:-------|:-|:-|:-|
| ユーザー管理機能     | どのユーザーが投稿を行ったか管理する | メールアドレス、パスワードを用いた登録機能の実装  |投稿者はログイン機能を使用し、情報を投稿する|
|Google maps API機能| ユーザー（店舗）の場所の表示わかりやすくする  |  ユーザー詳細画面にてGoogle mapの表示がされる機能実装 | 新規登録画面で住所を入力するとユーザー詳細画面にて地図が表示される| 
| 投稿機能| ユーザーが情報提供ができるようにする  | 投稿記事を書き、投稿するボタンを押したら投稿できるようにする  |新規登録またはログインしていることが前提 画像付きの投稿も可能,投稿したら、投稿一覧画面で見ることが可能| 
| ページネーション      | ページネーションで一覧を見やすくする  | 複数の投稿・ユーザー一覧を複数のページ分けて表示できるようにする  | 投稿、ユーザーはいくつか登録されていることが前提.次のページ、前のページが表示されることが可能|


## 実装した機能についてのGIFと説明
### Google map API機能
https://user-images.githubusercontent.com/73771836/102983599-ab15d600-454f-11eb-803a-2b36f6e41a0d.mp4

### ページネーション 
https://user-images.githubusercontent.com/73771836/102981456-4f961900-454c-11eb-8d68-14367dca4a67.mp4


## 実装予定の機能
| 実装機能 | 目的 | 詳細 | ストーリー(ユースケース) |
|:-------|:-|:-|:-|
|検索機能 |目的の店舗の検索を行うため|ユーザー詳細画面ににてキーワードを入力し、検索結果が表示される|「店舗一覧画面」に進み<br>検索窓にキーワードを入力し検索を実行する|

## データベース設計

![coedo](https://user-images.githubusercontent.com/73771836/103068745-2e433480-4601-11eb-8253-f3dba43f2c74.png)
# テーブル設計

## usersテーブル

|Column|Type|Options|
|------|----|-------|
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| category_id        | integer| null: false |
| introduction       | text   |
| url                | text   | 
| business_hour      | text   | null: false |
| address            | string | null: false |
| latitude           | float  |
| longitude          | float  | 
| phone_number       | string | null: false |

### Association

- has_many :posts
- has_one_attached :image
- belongs_to :category


## postsテーブル

|Column |Type |Options|
|------ |---- |-------|
| title       | string  | null: false |
| category_id | integer | null: false |
| text        | integer | null: false |

### Association

- belongs_to:user
- belongs_to :category
- has_one_attached :image

## ローカルでの動作方法
+ 必要コマンド:git clone https://github.com/mr0216/coedo.git
+ バージョン:Ruby on Rails 6.0.0
