class WebHooksController < ApplicationController
  skip_before_action :verify_authenticity_token



  def create
    hook = Hook.new(hook_params)
    if hook.save
      render json: { message: 'Data created successfully' }, status: :created
    else
      render json: { errors: hook.errors.full_messages }
    end
  end


  def update
    hook = Hook.find(params[:id])
    if hook.update(hook_params)
      render json: { message: 'Data updated successfully' }
    else
      render json: { errors: hook.errors.full_messages }
    end
  end

  private

  def hook_params
    params.require(:hook).permit(:name, :data)
  end



end
