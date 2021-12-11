class Admin::SessionsController < Admin::Base

  def new
    if current_administrator
      redirect_to :admin_root
    else
      # @form = Staff::LoginForm.new
      @form = Admin::LoginForm.new
      render action: "new"
    end
  end

  def create
    # @form = Staff::LoginForm.new(params[:staff_login_form])
    @form = Admin::LoginForm.new(params[:admin_login_form])
    if @form.email.present?
      # staff_member = StaffMember.find_by(email: @form.email.downcase)
      admin_member = Admin.find_by("(email)=?", @form.email.downcase)#これで通るのか後で試す
    end
    # if Staff::Authenticator.new(staff_member).authenticate(@form.password)
    if Admin::Authenticator.new(admin_member).authenticate(@form.password)
      if administrator.suspended?#trueでアウト
        flash.now.alert = "アカウントが停止されています"
        render action: "new"
      else
        session[:admme_member_id] = admin_member.id
        flash.notice = "ログインしました"
        redirect_to :admin_root
      end
    else
      flash.now.alert = "メールアドレスまたはパスワードが正しくありません"
      render action: "new"
    end
  end

  def destroy
    session.delete(:admin_member_id)
    flash.notice = "ログアウトしました"
    redirect_to :admin_root
  end

end