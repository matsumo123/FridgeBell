# FridgeBell🔔
<image src="app/assets/images/x_ogp.png" width="500">

## 📖サービス概要
FridgeBellは、**冷蔵庫の食材を登録して”期限切れ”を防ぐためのアプリケーション**です。  
食材ごとに数量・期限・メモを登録でき、1ページで複数食材をまとめて登録できます。  
期限が近づいた食材は**LINE通知**でお知らせします。
さらに、食材を無駄にしなかった日数に応じてキャラクターが変化する仕組みで、楽しく食品ロス削減に取り組めるサービスです。

## 📍サービスURL
#### https://fridgebell.jp/

## 💭このサービスへの思い
冷蔵庫を開けたとき「そういえばこれ買ってた！...もう期限切れだ」と捨ててしまうことが私自身何度もありました。そのたびに無駄にしてしまったことを悔やんでいました。
友人に相談した際も「分かる！私もこの前○○捨てちゃった...」と共感を得ることも多かったです。
**「うっかり忘れによる食材ロス」は多くの人に共通する課題**だと感じました。
この課題を解決するため、**「期限を自動で知らせてくれるアプリ」があれば、食品ロスを防げるのではないか**という思いからFridgeBellを開発しました。

## 📋機能紹介

| 食材の登録 |
| :---: |
| [![食材登録の動画](https://i.gyazo.com/520d3f7008dd7fb5b3ede8dd7236dac6.gif)](https://i.gyazo.com/520d3f7008dd7fb5b3ede8dd7236dac6.mp4) |
| <p align="left">「カテゴリー選択→数量調整→期限・メモ入力」の流れで登録できます。<br>同一ページ内で複数食材をまとめて登録することも可能です。</p> |

| 食材の一覧 |
| :---: |
| [![食材一覧の動画](https://i.gyazo.com/e71bfa76fe7dc78d34381cddbfae78c5.gif)](https://i.gyazo.com/e71bfa76fe7dc78d34381cddbfae78c5.mp4) |
| <p align="left">登録した食材は**期限の近い順**に表示されます。<br>ラベル色（グレー・赤・黄・緑）で、期限間近な食材がひと目でわかります。</p> |

| お気に入り登録 |
| :---: |
| [![お気に入り登録の動画](https://i.gyazo.com/fe042d83ff4f804267ee4ca883c3d82b.gif)](https://i.gyazo.com/fe042d83ff4f804267ee4ca883c3d82b.mp4) |
| <p align="left">よく使う食材を登録しておくことで、次回からカテゴリー選択なしでスムーズに登録できます。</p> |

| 食べた/捨てた食材の履歴機能 |
| :---: |
| [![Image from Gyazo](https://i.gyazo.com/85479ceeeb607d74ed25889e4620e4b9.png)](https://gyazo.com/85479ceeeb607d74ed25889e4620e4b9) |
|[![Image from Gyazo](https://i.gyazo.com/df8d88744b9bda0e24c61b63a253dca2.png)](https://gyazo.com/df8d88744b9bda0e24c61b63a253dca2) |
| <p align="left">食べた・捨てた食材を履歴として記録。円グラフや月間ランキングで食材の使用傾向を可視化できます。<br>冷蔵庫の整理や振り返りに役立ちます。</p> |


## ⚒️使用技術
| カテゴリ | 技術内容 |
| --- | --- |
| フロントエンド |  Stimulus / Turbo(Hotwire) |
| バックエンド | Rails7.2.2 / Ruby3.3.6 |
| CSSフレームワーク | TailwindCSS / daisyUI |
| データベース | PostgreSQL |
| ファイルサーバー | Active Storage + AWS S3 |
| アプリケーションサーバー | Fly.io |
| 開発環境 | Docker |
| Web API | LINE Messaging API / LINE Login |
| 認証 | Devise / omniauth-line |

## 📐ER図
[![Image from Gyazo](https://i.gyazo.com/bed4adbcf730183f5b85dc4869578888.png)](https://gyazo.com/bed4adbcf730183f5b85dc4869578888)

## 🌏画面遷移図
※画面遷移図は設計段階のもので、実際の画面デザインとは異なる箇所があります。
Figma：https://www.figma.com/design/LulO6jUfPxdloTD4mlokQV/%E5%86%B7%E8%94%B5%E5%BA%AB%E3%81%AE%E3%83%AA%E3%83%9E%E3%82%A4%E3%83%B3%E3%83%89%E3%82%A2%E3%83%97%E3%83%AA?node-id=0-1&t=Rl0T7t0XZMJmyW4G-1
