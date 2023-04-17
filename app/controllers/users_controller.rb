class UsersController < ApplicationController
  def new
  end

  def show
    puts "Shgiow temlate"
  end

  def upload
    if params[:file].present?
      rows = []
      CSV.foreach(params[:file].path, headers: true) do |row|
        user = User.new(row.to_hash)
        if user.valid?
          rows << user
        else
          flash[:alert] = "Invalid data in row #{row.index + 1}: #{user.errors.full_messages.to_sentence}"
          # redirect_to upload_users_path and return
          render json: @users
        end
      end
      User.import(rows)
      redirect_to users_path, notice: "File uploaded successfully"
    else
      redirect_to upload_users_path, alert: "Please choose a file to upload"
    end
  end
end
