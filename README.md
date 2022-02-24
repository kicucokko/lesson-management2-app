 

 **アプリケーション名**:                        **Lesson-Management**
 --
 ## アプリケーション概要:
 --                         
 特定ユーザー間の投稿閲覧機能(レッスン記録確認機能)/カレンダー型予約機能/決済機能                                                                
 
 ## URL:                                                                                                                                                                        
 --
 
 ## テスト用アカウント:                                                                                                                                                             
 --

 ## 利用方法:
 --                                  
アカウント登録後マイページにて各機能操作                                                                                                  
 
 ## 目指した課題解決:
 --                          
 出張型の音楽講師が生徒の事務管理をしやすくするため、記録・予定管理・支払い管理の点で課題解決を図る                                                  
 
 ## 洗い出した要件:
 --                            
 アカウント登録/日程調整機能/レッスン料支払い機能/支払い履歴確認機能/レッスン内容共有機能/画像投稿機能 
                                               
 ## 実装した機能についての画像やGIFおよびその説明: 
 --                                      
  [![MyPage](https://i.gyazo.com/8f00a3281e368493d3680e424a3947c2.jpg)](https://gyazo.com/8f00a3281e368493d3680e424a3947c2)           
  [![レッスン記録確認機能](https://i.gyazo.com/d6c3374658bcc606cdf1758c55317b9f.gif)](https://gyazo.com/d6c3374658bcc606cdf1758c55317b9f)
  [![予約機能](https://i.gyazo.com/0aa23f545f5a2f5d3f272adb7d4bbe66.gif)](https://gyazo.com/0aa23f545f5a2f5d3f272adb7d4bbe66)          
  [![支払い機能](https://i.gyazo.com/81618577e0f041c367ab1913f90a5959.gif)](https://gyazo.com/81618577e0f041c367ab1913f90a5959)        
 
 ## 実装予定の機能:
 --                             
 mp3,pdfなどのファイル形式の拡張・掲示板の設置                                                                                             
 
 ## データベース設計:
 --                           
 [![Image from Gyazo](https://i.gyazo.com/3add375a5adc186d948b671619b426c1.jpg)](https://gyazo.com/3add375a5adc186d948b671619b426c1) 
 
 ## ローカルでの操作方法：
 --                                                                                                                                                            



## users テーブル  

| column            | Type      | Options                 |
| ----------------- | --------- | ----------------------- |
| role              | integer   |null: false              |
| nickname          | string    |null: false              |
| email             | string    |null: false,unique: true |
| encrypted_password| string    |null: false              |
| name              | string    |null: false              |
| name_kana         | string    |null: false              |
| birth_date        | string    |null: false              |
| prefecture_id     | integer   |null: false              |
| city_block        | string    |null: false              |
| station           | string    |                         |

- has_many :user_roles
- has_many :roles, through: :user_roles
- has_many :user_rooms
- has_many :lesson_rooms, through: :user_rooms
- has_many :reviews
- has_many :calenders
- has_many :purchases


*Action Hash*
- belongs_to_active_hash :prefecture


## role テーブル（権限管理テーブル）
| column            | Type      | Options                 |
| ----------------- | --------- | ----------------------- |
| room_name         | string    | null: false             |

- has_many :users, through :user_roles

## Ability テーブル(権限設定テーブル)
| column            | 
| ----------------- | 
| admin             |
| customer          | 
| read_only         |


## user_roles (ユーザーと権限管理の中間テーブル)
| column            | Type      | Options                                 |
| ----------------- | --------- | --------------------------------------- |
| user              | references|null: false,foreign_key: true,unique:true|
| role              | references|null: false,foreign_key: true,unique:true||

- belongs_to :user
- belongs_to :role

*gem 'devise'
*gem 'cancancan'
*gem 'active_hash'


## Lesson_rooms (Lesson部屋テーブル）

| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| room_name   | string | null: false |

- has_many :user_rooms, dependent: :destroy
- has_many :users, through: :user_rooms
- has_many :reviews, dependent: :destroy

## user_rooms (ユーザーと部屋の中間テーブル)
| column            | Type      | Options                     |
| ----------------- | --------- | --------------------------- |
| user              | references|null: false,foreign_key: true|
| lesson_room       | references|null: false,foreign_key: true|

- belongs_to :lesson_room
- belongs_to :user


## Reviews テーブル (記録投稿機能)
| column            | Type      | Options                       |
| ----------------- | --------- | ----------------------------- |
| time              | datetime  | null: false                   |
| title             | string    | null: false                   |
| text              | text      | null: false                   |
| home_work         | string    |                               |
| information       | string    |                               |
| user              | references| null: false,foreign_key: true |
| lesson_room       | references| null: false,foreign_key: true |


- belongs_to :user
- belongs_to :lesson_room



## Calenders テーブル (予定設定機能)
| column            | Type      | Options                      |
| ----------------- | --------- | ---------------------------- |
| day               | date      | null: false                  |
| time              | string    | null: false                  |
| user_id           | bigint    | null: false                  |
| start_time        | datetime  | null: false                  |

- belongs_to :user

*gem 'simple_calendar', '~> 2.0'


## Purchases テーブル (購入管理機能)
| column            | Type      | Options                      |
| ----------------- | --------- | ---------------------------- |
| price             | integer   | null: false                  |
| user              | references| null: false,foreign_key: true|

- belongs_to :user

*gem 'payjp'


