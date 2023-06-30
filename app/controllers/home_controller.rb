class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:perfil]
  def index; end

  def perfil
    @user = current_user
    @posts = @user.posts
    # Renderizar la vista de perfil
    render 'perfil'
  end
end
