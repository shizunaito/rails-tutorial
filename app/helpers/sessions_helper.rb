module SessionsHelper

  # 渡されたユーザーでログインする
  def log_in(user)
    session[:uesr_id] = user.id
  end

  # 現在ログイン中のユーザーを返す（いる場合）
  def current_user
    @current_user ||= User.find_by(id: session[:uesr_id])
  end

  # ユーザーがログインしていればtrue、その他ならfalseを返す
  def logged_in?
    !current_user.nil?
  end
end
