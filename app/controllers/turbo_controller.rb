class TurboController < ApplicationController
  def logout
    sign_out(current_employee)
    redirect_to login_index_path, notice: 'You have been signed out.'
  end
end
