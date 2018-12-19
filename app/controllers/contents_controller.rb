class ContentsController < ApplicationController

  def index
    @contents = Content.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end

  def show
    @content = Content.find(params[:id])
  end

  def new
    @content = Content.new
  end

  def create
    Content.create(content_params)
    redirect_to action: :index
  end

  def destroy
    content = Content.find(params[:id])
    content.destroy if content.user_id == current_user.id
    redirect_to action: :index
  end

  def edit
    @content = Content.find(params[:id])
  end

  def update
    content = Content.find(params[:id])
    # binding.pry
    if content.user_id == current_user.id
      content.update(content_params)
    end
    redirect_to action: :index
  end

  Payjp::api_key ='sk_test_c5be69e2d1ccf9815f894a2d'

  def self.create_token(number, cvc, exp_year, exp_month)
    token = Payjp::Token.create(
      card: {
        number:    number,
        cvc:       cvc,
        exp_year:  exp_year,
        exp_month: exp_month,
      }
    )
    return token.id
  end


  def pay

    Payjp.api_key = 'sk_test_c5be69e2d1ccf9815f894a2d'

    charge = Payjp::Charge.create(
      amount: 3000,
      card: params['payjp-token'],
      currency: 'jpy',
    )
  end

  private
  def content_params
    params.require(:content).permit(:image,:heading, :shop, :prefecture, :city, :detail, :genre, :description, :qualification, :workTime, :salary, :experience, :present, :jobTime).merge(user_id: current_user.id)
  end

end
