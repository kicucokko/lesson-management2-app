## users テーブル  

| column            | Type      | Options                 |
| ----------------- | --------- | ----------------------- |
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

*Action Hash*
- belongs_to_active_hash :prefecture


## role テーブル（権限管理テーブル）
| column            | Type      | Options                 |
| ----------------- | --------- | ----------------------- |
| room_name              | string    | null: false             |

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
| title             | string    |                               |
| text              | text      | null: false                   |
| home_work         | string    | null: false                   |
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


## Settings テーブル (購入金額設定機能)
| column            | Type      | Options                      |
| ----------------- | --------- | ---------------------------- |
| level_id          | string    | null: false                  |
| price             | integer   | null: false                  |
| admin             | references| null: false,foreign_key: true|
| purchase          | references| null: false,foreign_key: true|

- belongs_to :admin
- belongs_to :purchase

*Action Hash*
- belongs_to_active_hash :level

## Purchases テーブル (購入管理機能)
| column            | Type      | Options                      |
| ----------------- | --------- | ---------------------------- |
| price             | integer   | null: false                  |
| customer          | references| null: false,foreign_key: true|
| admin             | references| null: false,foreign_key: true|

- belongs_to :admin
- belongs_to :customer
- has_many :setting