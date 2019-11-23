class RegistrationsController < ApplicationController

  before_action :save_n1_to_session, only: :n2
  before_action :save_n2_to_session, only: :n3
  before_action :save_n3_to_session, only: :n4
  before_action :save_n4_to_session, only: :end

  def index
  end

  def n1
    @user = User.new
  end

  def save_n1_to_session
    session[:nickname] = params[:user][:nickname]
    session[:email] = params[:user][:email]
    session[:password] = params[:user][:password]
    # session[:password_confirmation] = user_params[:password_confirmation]
    session[:family_name_zen] = params[:user][:profile_attributes][:family_name_zen]
    session[:first_name_zen] = params[:user][:profile_attributes][:first_name_zen]
    session[:family_name_kana] = params[:user][:profile_attributes][:family_name_kana]
    session[:first_name_kana] = params[:user][:profile_attributes][:first_name_kana]
    session[:birthday] = params["user"]["profile_attributes"]["birthday(1i)"] + "-" + params["user"]["profile_attributes"]["birthday(2i)"] + "-" +params["user"]["profile_attributes"]["birthday(3i)"]

    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password]
      # password_confirmation: session[:password_confirmation]
    )
    @profile = Profile.new(
      family_name_zen: session[:family_name_zen],
      first_name_zen: session[:first_name_zen],
      family_name_kana: session[:family_name_kana],
      first_name_kana: session[:first_name_kana],
      birthday:  session[:birthday]
    )
    render '/registrations/n1' unless @user.valid? && @profile.valid?
  end 

  def n2
    @user = User.new
  end

  def save_n2_to_session
    session[:tel] = params[:user][:tel]
    @user = User.new(
      tel: session[:tel],
      email: 'hoge@hoge',
      password: '12345678popo'
      )
    render '/registrations/n2' unless @user.valid?
  end 
 
  def n3
    @user = User.new
    @user.addresses.build
  end

  def save_n3_to_session
      # session[:postal_code] = params[:user][:addresses_attributes][:postal_code]
      # session[:prefectures] = params[:user][:addresses_attributes][:prefectures]
      # session[:city] = params[:user][:addresses_attributes][:city]
      # session[:house] = params[:user][:addresses_attributes][:house]
      # session[:building] = params[:user][:addresses_attributes][:building]
      # session[:telephone] = params[:user][:addresses_attributes][:telephone]
    session[:addresses_attributes] = params[:user][:addresses_attributes]

      @address = Address.new(
        postal_code: session[:addresses_attributes][:postal_code],
        prefectures: session[:addresses_attributes][:prefectures],
        city: session[:addresses_attributes][:city],
        house: session[:addresses_attributes][:house]
      )
      render '/registrations/n3' unless @address.valid?
  end 

  def n4
    @user = User.new
    @user.credits.build
  end

  def save_n4_to_session
      session[:card_num] = params[:user][:credits_attributes][:card_num]
      session[:expiration_date] = params[:user][:credits_attributes][:expiration_date]
      session[:security_code] = params[:user][:credits_attributes][:security_code]
  end 

  def end
    sign_in User.find(session[:id]) unless user_signed_in?
  end

  def create
    @user = User.new(
      # tel: session[:tel],
      family_name_zen: session[:family_name_zen],
      first_name_zen: session[:first_name_zen],
      family_name_kana: session[:family_name_kana],
      first_name_kana: session[:first_name_kana],
      birthday: session[:birthday],
      postal_code: session[:postal_code],
      prefectures: session[:prefectures]
    )
    if @user.save
      session[:id] = @user.id
      redirect_to end_registrations_path
    else
      render '/registrations/n1'
    end
  end

  private
  def user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :password, 
      :tel,
      profile_attributes: [:id, :family_name_zen, :first_name_zen, :family_name_kana, :first_name_kana, :birthday],
      addresses_attributes: [:id, :postal_code, :prefectures, :city, :house, :building, :telephone],
      credits_attributes: [:id, :card_num, :expiration_date, :security_code]
    )
  end
end