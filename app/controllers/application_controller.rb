class ApplicationController < ActionController::Base
    before_action :authenticate_user!, except: [:index]
    before_action :configure_permitted_parameters, if: :devise_controller?

    #　新規登録及びログイン後に記事一覧画面に遷移
    def after_sign_in_path_for(resource)
      if current_user
        flash[:notice] = "ログインに成功しました" 
        articles_path#　指定したいパスに変更
      else
        flash[:notice] = "新規登録完了しました。次に名前を入力してください" 
        articles_path  #　指定したいパスに変更
      end
    end

    #　deviseのストロングパラメータ設定
    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :username])
    end
end
