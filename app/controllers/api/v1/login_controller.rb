class Api::V1::LoginController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token

  URL = "https://api.weixin.qq.com/sns/jscode2session".freeze

  def wechat_params
    {
      appid: ENV["APP_ID"],
      secret: ENV["APP_SECRET"],
      js_code: params[:code],
      grant_type: "authorization_code"
    }
  end

  def wechat_user
    @wechat_response ||= RestClient.post(URL, wechat_params)
    @wechat_user ||= JSON.parse(@wechat_response.body)
  end

  def login
    @user = User.find_or_create_by(wx_id: wechat_user.fetch("wx_id"))
    render json: {
      userId: @user.id,
    }
  end
end
