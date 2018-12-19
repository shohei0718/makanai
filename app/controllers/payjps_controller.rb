class PayjpsController < ApplicationController

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
      amount: 3500,
      card: params['payjp-token'],
      currency: 'jpy',
    )
  end

end
