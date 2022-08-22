class Public::HomesController < ApplicationController
  def top
   @items = Item.all.order(created_at: :desc) # 先頭から5つのレコードから８つを取得
  end
end
