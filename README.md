# DB設計

## users table
| column     | type        | options                    |
|:-----------|------------:|:--------------------------:|
| nickname   | string      | index: true, null: false   |
| tel        | string      | null: false, unique: true  |
+ 上記の他にgem deviseによるカラム。

## Association
+ has_many :addresses
+ has_one  :profile
+ has_many :credits
+ has_many :items

## addresses table
| column           | type        | options                        |
|:---------------- |------------:|:------------------------------:|
| user_id          | integer     | null: false, foreign_key: true |
| postal_code      | integer     | null: false                    |
| prefectures      | integer     | null: false                    |
| city             | string      | null: false                    |
| house            | string      | null: false                    |
| building         | string      |                                |
| telephone        | varchar     |                                |

## Association
+ belongs_to :user


## profiles table
| column           | type        | options                        |
|:---------------- |------------:|:------------------------------:|
| user_id          | integer     | null: false, foreign_key: true |
| family_name_zen  | string      | null: false                    |
| first_name_zen   | string      | null: false                    |
| family_name_kana | string      | null: false                    |
| first_name_kana  | string      | null: false                    |
| birthday         | date        | null: false                    |


## Association
+ belongs_to :user


## credits table
| column           | type         | options                        |
|:---------------- |-------------:|:------------------------------:|
| user_id          | integer      | null: false, foreign_key: true |
| card_num         | integer      | null: false, unique: true      |
| expiration_date  | date         | null: false                    |
| security_code    | integer      | null: false                    |

## Association
+ belongs_to :user

## categories table
| column           | type        | options                        |
|:---------------- |------------:|:------------------------------:|
| category         | string      | null: false                    |

## Association
+ has_many :items
+ has_ancestry
+ has_many :brands through: :categories_brands
+ has_many : categories_brands

## brands table
| column           | type        | options                        |
|:---------------- |------------:|:------------------------------:|
| brand            | string      | null: false                    |

## Association
+ has_many :items
+ has_many :categories through: :categories_brands
+ has_many : categories_brands

## categories_brands table
| column           | type        | options                        |
|:---------------- |------------:|:------------------------------:|
| category         | string      | null: false, foreign_key: true |
| brand            | string      | null: false, foreign_key: true |

## Association
+ belongs_to :category
+ belongs_to :brand

## items table
| column     | type        | options                    |
|:-----------|------------:|:--------------------------:|
| name       | string      | index: true, null: false   |
| description| text        | null: false                |
| price      | integer     | index: true, null: false   |
| state      | integer     | null: false                |
| seller_id  | integer     | null: false, foreign_key: true|
| buyer_id   | integer     | foreign_key: true          |
| category_id| integer     | null: false, foreign_key: true|
| brand_id   | integer     | foreign_key: true          |

## Association
+ belongs_to :category
+ belongs_to :brand
+ has_many :images
+ has_one :delivery
+ belongs_to: user

## images table
| column     | type        | options                          |
|:-----------|------------:|:--------------------------------:|
| item_id    | integer     | null: false, foreign_key: true   |
| image      | string      | null: false                      |

## Association
+ belongs_to :item

## deliveries table
| column          | type        | options                        |
|:--------------- |------------:|:------------------------------:|
| item_id         | integer     | null: false, foreign_key: true |
| postage_method  | integer     | null: false                    |
| postage_detail  | integer     | null: false                    |
| region          | string      | null: false                    |
| shipping_date   | integer     | null: false                    |

## Association
+ belongs_to :item

## likes table
| column          | type        | options                        |
|:--------------- |------------:|:------------------------------:|
| item_id         | integer     | null: false, foreign_key: true |
| user_id         | integer     | null: false, foreign_key: true |

## Association
+ belongs_to :item
+ belongs_to :user

## comments table
| column          | type        | options                        |
|:--------------- |------------:|:------------------------------:|
| item_id         | integer     | null: false, foreign_key: true |
| user_id         | integer     | null: false, foreign_key: true |
| comment         | text        | null: false                    |

## Association
+ belongs_to :item
+ belongs_to :user
