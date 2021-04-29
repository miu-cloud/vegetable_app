# README
# 野菜ロス削減アプリ「Vegetabel」
## 概要
### 農家が出荷前に廃棄した規格外野菜は生産量の20％前後になるというデータがあります。このアプリケーションユーザ間のメッセージを通し「貰う」「譲る」というユーザのニーズに応え野菜の廃棄ロス削減に効果的です。
## コンセプト
### 廃棄予定の野菜を譲ったり貰ったりしてロス削減を目指し、メッセージでコミュニケーションを図りながら「貰うユーザ」と「譲るユーザ」双方のニーズに応えるアプリケーションです。
##  バージョン
### Ruby 2.6.5p114 Rails 5.2.5
##  機能一覧
	
- [ ] ユーザ新規登録機能						
  - [ ] 新規登録後はマイページに遷移させる	

- [ ] ログイン機能

- [ ] マイページ機能			

- [ ] やさい検索機能					
   - [ ] 投稿一覧画面にて野菜の検索をする。画面遷移させない	

- [ ] ユーザ詳細画面						
   - [ ] ユーザの名前の編集
								
- [ ] 投稿しているユーザの詳細						
   - [ ] そのユーザが投稿したものの一覧が表示される

- [ ] 投稿一覧表示機能						
   - [ ] マイページからもらうを押すと投稿一覧画面へ遷移
   - [ ] ユーザ名・タイトル・内容・譲渡場所・日時・受付状態・画像が表示	
					
- [ ] 新規投稿機能		
  - [ ] 内容、画像、譲渡場所、日時を投稿できる（全てを入力しないと投稿できないようにバリデーション設定）

- [ ] 投稿編集機能		
  - [ ] 投稿を編集できる

- [ ] メッセージ機能		
  - [ ] メッセージを開始するをクリックするとメッセージ画面に遷移
  - [ ] ヘッダーリンクのメッセージ一覧より、過去に会話があればそのユーザを表示

- [ ] ユーザ一覧機能	
  - [ ] 登録しているユーザの一覧が表示
					
- [ ] 通知機能（メッセージ）						
  - [ ] メッセージが送られてくるとマイページに通知が来る

- [ ] 受付終了機能	
  - [ ] 投稿編集画面にてステータスを終了にすると投稿一覧からこのユーザにメッセージを送るリンクが表示されない
	

					
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
- devise
- letter_opener
## その他
### 就業Tarmからはdevise、メッセージ機能を実装をする
### カリキュラム外からはransackを用いて検索機能を実装をする