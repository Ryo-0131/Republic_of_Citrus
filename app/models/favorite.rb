# frozen_string_literal: true

class Favorite < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' }, { id: 2, name: 'アスミ（あすみ）' }, { id: 3, name: 'アマクサ（天草）' },
    { id: 4, name: 'アマナツ（甘夏）' }, { id: 5, name: 'イヨカン（伊予柑）' }, { id: 6, name: 'ウンシュウミカン（温州蜜柑）' },
    { id: 7, name: 'オウゴンカン（黄金柑）' }, { id: 8, name: 'オバラベニワセ（小原紅早生）' }, { id: 9, name: 'カクテルフルーツ' },
    { id: 10, name: 'カラマンダリン' }, { id: 11, name: 'クレメンティン' }, { id: 12, name: 'カンペイ（甘平）' },
    { id: 13, name: 'キヨミ（清見）' }, { id: 14, name: 'ジューシーオレンジ' }, { id: 15, name: 'ショウナンゴールド（湘南ゴールド）' },
    { id: 16, name: 'シラヌイ（不知火）' }, { id: 17, name: 'スイートスプリング' }, { id: 18, name: 'スイショウブンタン（水晶文旦）' },
    { id: 19, name: 'セトカ（せとか）' }, { id: 20, name: 'セトミ（せとみ）' }, { id: 21, name: 'タロッコオレンジ' },
    { id: 22, name: 'ツノカカガヤ（津之輝）' }, { id: 23, name: 'トサブンタン（土佐文旦）' }, { id: 24, name: 'ナツミ（南津海）' },
    { id: 25, name: '夏みかん' }, { id: 26, name: 'ネーブル' }, { id: 27, name: 'ハッサク（八朔）' },
    { id: 28, name: 'ハルカ（はるか）' }, { id: 29, name: 'ハルミ（はるみ）' }, { id: 30, name: 'バレンシアオレンジ' },
    { id: 31, name: 'バンペイユ（晩白柚）' }, { id: 32, name: 'ヒメコハル（媛小春）' }, { id: 33, name: 'ヒュウガナツ（日向夏）' },
    { id: 34, name: '仏手柑（ブッシュカン）' }, { id: 35, name: 'ベニマドカ（紅まどか）' }, { id: 36, name: 'ベニマドンナ（紅まどんな）' },
    { id: 37, name: 'ポンカン' }, { id: 38, name: 'ミハヤ（みはや）' }, { id: 39, name: 'モロオレンジ' },
    { id: 40, name: 'ユゲヒョウカン（弓削瓢柑）' }, { id: 41, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :items
end
