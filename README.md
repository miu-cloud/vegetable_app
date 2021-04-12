# README
# 廃棄野菜ロス削減アプリ
## 概要
### 廃棄予定の野菜を「ほしいユーザ」と「ゆずるユーザ」の双方のニーズに応えマッチングさせるアプリケーションサービスです。
## コンセプト
### シンプルなアプリケーション
##  バージョン
### Ruby 2.6.5p114 Rails 5.2.5
##  機能一覧

- [ ] トップ画面	

- [ ] ユーザ新規登録機能						
  - [ ] 新規登録後はマイページに遷移させる	

- [ ] ログイン機能（devise）		

- [ ] マイページ機能			

- [ ] ユーザ検索機能（ランサック/gem）						
   - [ ] 検索結果はマイページに。画面遷移させない	

- [ ] ユーザ詳細画面						
   - [ ] ユーザの名前の編集、削除機能、
   - [ ] フォロー/フォロワーユーザを押せばフォロー/フォロワーユーザの詳細へ遷移	

- [ ] フォロー機能(フォロー/フォロワーユーザの詳細)				
- [ ] 検索したユーザの詳細					
- [ ] 投稿しているユーザの詳細						
   - [ ] フォロー/フォロワーユーザを表示、そのユーザが投稿しているものも同様に表示される。
   - [ ] フォローができ、フォローしているユーザに対してフォローを外すこともできる

- [ ] もらう機能						
   - [ ] マイページからもらうを押すと投稿一覧画面へ遷移
   - [ ] ユーザ名・タイトル・内容・譲渡場所・日時・受付状態・画像が表示					
- [ ] 詳細画面（もらう時）						
   - [ ] 譲る側のユーザ名、内容（と備考は一緒で）、画像、譲渡場所、日時の表示						
- [ ] ゆずる機能						
  - [ ] 内容、画像、譲渡場所、日時を投稿できる（画像以外の全てを入力しないと投稿できないようにバリデーション設定）
					
- [ ] ほしい機能						
  - [ ] 投稿のほしいボタンを押すことにより投稿ユーザのマイページに通知がされる（例：○○さんからリクエストが来ました。受付を終了してください）		

- [ ] メール機能						
  - [ ] 投稿ユーザがほしいに応えるという形で終了ボタンを押すと、ほしいを押したユーザに確認メールが送られる。(確認メール内容：タイトル・内容・数量・譲渡場所・日時)
  - [ ] 同時に投稿一覧からその投稿が消えるようにする
					
## カタログ設計
https://docs.google.com/spreadsheets/d/1QG-iEyip5AtO4r4_-pc5z5eWTpMHeHSd1R6WWLoDUmU/edit?usp=sharing
## テーブル定義
https://docs.google.com/spreadsheets/d/1QR59Rpmzu6rvsAnOZz2lODwEFAHd2HkWeZPBwS44rwE/edit?usp=sharing
## 画面遷移図
https://docs.google.com/spreadsheets/d/1wQHKd8Y2dzHQnqw1K1AYLOoGqTe4-fW-B4Qtnt0T1g0/edit?usp=sharing
## 画面ワイヤーフレーム
https://docs.google.com/spreadsheets/d/1fAYPzRMaullK9sRpqk1mtxZaQkcsWsx5oDLfe06baEA/edit?usp=sharing
## ER図
https://docs.google.com/spreadsheets/d/1TGA4cwX0r6gZZpbRg6m0tJ_ZKtAjJ3bQC7LAksg8MTs/edit?usp=sharing
## 使用予定Gem
- ransack