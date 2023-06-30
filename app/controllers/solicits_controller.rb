class SolicitsController < ApplicationController
  def index
    @solicit = Solicit.all
  end

  def new
    @solicit = Solicit.new
  end

  def create
    @post = Post.find(params[:post_id])
    @solicit = @post.solicits.new(post_id: @post.id, aceptado: 'pendiente', fecha: solicit_params[:fecha],
                                  mensaje: solicit_params[:mensaje])
    @solicit.user = current_user

    if @solicit.save

      redirect_to posts_index_path

    else
      flash[:notice] = @solicit.errors.full_messages.to_sentence
    end
  end

  def aceptar
    @solicit = Solicit.find(params[:solicit_id])
    @solicit.update(aceptado: 'aceptado')
    redirect_to post_show_path(@solicit.post.id)
  end

  def rechazar
    @solicit = Solicit.find(params[:solicit_id])
    @solicit.update(aceptado: 'rechazado')
    redirect_to post_show_path(@solicit.post.id)
  end

  def delete
    @solicit = Solicit.find(params[:solicit_id])
    @solicit.destroy
    redirect_to solicits_path
  end

  # def show
  # @solicit = Solicit.find(params[:solicit_id])
  # @solicit.destroy
  # redirect_to solicits_path
  # end

  def destroy
    @solicit = Solicit.find(params[:solicit_id])
    @solicit.destroy
    redirect_to solicits_path
  end

  private

  def solicit_params
    params.require(:solicit).permit(:fecha, :mensaje) # Ver si poner el aceptado
  end
end
