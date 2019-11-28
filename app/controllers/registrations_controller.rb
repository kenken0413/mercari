class RegistrationsController < ApplicationController

  before_action :save_n1_to_session, only: :n2
  before_action :save_n2_to_session, only: :n3
  before_action :save_n3_to_session, only: :create

  def index
  end

  def n1
    @user = User.new
  end

  def save_n1_to_session
    session[:nickname] = params[:user][:nickname]
    session[:email] = params[:user][:email]
    session[:password] = params[:user][:password]
    session[:family_name_zen] = params[:user][:profile_attributes][:family_name_zen]
    session[:first_name_zen] = params[:user][:profile_attributes][:first_name_zen]
    session[:family_name_kana] = params[:user][:profile_attributes][:family_name_kana]
    session[:first_name_kana] = params[:user][:profile_attributes][:first_name_kana]
    session[:birthday] = params["user"]["profile_attributes"]["birthday(1i)"] + "-" + params["user"]["profile_attributes"]["birthday(2i)"] + "-" +params["user"]["profile_attributes"]["birthday(3i)"]

    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      tel: '09012345678'
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
      nickname: session[:nickname],
      email: session[:email],
      password: 'mercari123'
      )
    render '/registrations/n2' unless @user.valid?
  end 
 
  def n3
    @user = User.new
    @user.addresses.build
  end

  def save_n3_to_session
    session[:family_name_zen] = params[:user][:profile_attributes][:family_name_zen]
    session[:first_name_zen] = params[:user][:profile_attributes][:first_name_zen]
    session[:family_name_kana] = params[:user][:profile_attributes][:family_name_kana]
    session[:first_name_kana] = params[:user][:profile_attributes][:first_name_kana]
    session[:addresses_attributes] = params[:user][:addresses_attributes]["0"]
    @user = User.new(
      email: 'hoge@hoge',
      password: '12345678popo'
      )
    @profile = Profile.new(
      family_name_zen: session[:family_name_zen],
      first_name_zen: session[:first_name_zen],
      family_name_kana: session[:family_name_kana],
      first_name_kana: session[:first_name_kana],
      birthday: '2000-10-24'
    )
    @address = Address.new(
      postal_code: session[:addresses_attributes][:postal_code],
      prefecture_id: session[:addresses_attributes][:prefecture_id],
      city: session[:addresses_attributes][:city],
      house: session[:addresses_attributes][:house]
    )
    render '/registrations/n3' unless @address.valid? && @profile.valid?
  end 

  def create
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      tel: session[:tel]
    )
    @user.build_profile(
      family_name_zen: session[:family_name_zen],
      first_name_zen: session[:first_name_zen],
      family_name_kana: session[:family_name_kana],
      first_name_kana: session[:first_name_kana],
      birthday:  session[:birthday]
    )
    @user.addresses.build(
      postal_code: session[:addresses_attributes]["postal_code"],
      prefecture_id: session[:addresses_attributes]["prefecture_id"],
      city: session[:addresses_attributes]["city"],
      house: session[:addresses_attributes]["house"],
      building: session[:addresses_attributes]["building"],
      telephone: session[:addresses_attributes]["telephone"]
    )
    if @user.save
      session[:id] = @user.id
      sign_in User.find(session[:id]) unless user_signed_in?
      redirect_to '/credits/new'
    else
      render '/registrations/n1'
    end
  end


  def end
  end


  private
  def user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :password, 
      :tel,
      profile_attributes: [:id, :family_name_zen, :first_name_zen, :family_name_kana, :first_name_kana, :birthday],
      addresses_attributes: [:id, :postal_code, :prefecture_id, :city, :house, :building, :telephone]
    )
  end
end