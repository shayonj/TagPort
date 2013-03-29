class CustomFailure < Devise::FailureApp
  def redirect_url
    home_come_aboard_path
  end

  # override the response call
  def respond
    if http_auth?
      http_auth
    else
      redirect
    end
  end
end