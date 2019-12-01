class CreditsController < ApplicationController
  require "payjp"
  before_action :set_card
  before_action :create, only: :redirect_registrations_end
  before_action :create, only: :redirect_users_card_index
  def new # カードの登録画面。送信ボタンを押すとcreateアクションへ。
    credit = Credit.where(user_id: current_user.id).first
  end
  # indexアクションはここでは省略
  def create #PayjpとCardのデータベースを作成
    Payjp.api_key = 'sk_test_9581dc90803e604af65e7f4c'
    # トークンが正常に発行されていたら、顧客情報をPAY.JPに登録します。
    customer = Payjp::Customer.create(
      description: current_user.nickname, # 無くてもOK。PAY.JPの顧客情報に表示する概要です。
      email: current_user.email,
      card: params['payjp-token'], # 直前のnewアクションで発行され、送られてくるトークンをここで顧客に紐付けて永久保存します。
      metadata: {user_id: current_user.id} # 無くてもOK。
    )
    @credit = Credit.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
    if @credit.save
    else
      redirect_to action: "create"
    end
  end

  def redirect_registrations_end
    redirect_to '/registrations/end'
  end

  def redirect_users_card_index
    redirect_to '/users/card_index'
  end
  private
  def set_card
    @credit = Credit.where(user_id: current_user.id).first if Credit.where(user_id: current_user.id).present?
  end
end
