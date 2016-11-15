class ExercisesController < ApplicationController
  before_action :set_exercise, only: [:show, :edit, :update, :destroy]

  def index
    @exercises = Exercise.where('user_id = ? AND workout_date > ?', current_user, 7.days.ago ).order(workout_date: :desc)
  end

  def show
  end

  def new
    @exercise = current_user.exercises.new
  end

  def create
    @exercise = current_user.exercises.new(exercise_params)

    if @exercise.save
      flash[:notice] = "Exercise has been created"
      redirect_to user_exercise_path(current_user, @exercise)
    else
      flash.now[:alert] = "Exercise has not been created"
      render :new
    end
  end

  def edit
  end

  def update
    if @exercise.update(exercise_params)
      flash[:notice] = "Exercise successfully updated"
      redirect_to user_exercise_path(current_user, @exercise)
    else
      flash.now[:alert] = "Exercise has not been updated"
      render :edit
    end
  end

  def destroy
    if @exercise.destroy
      flash[:notice] = "Exercise has been deleted"
      redirect_to user_exercises_path(current_user)
    else
      flash.now[:alert] = "Exercise has not been deleted"
      render :destroy
    end
  end

  private

  def exercise_params
    params.require(:exercise).permit(:duration_in_min, :workout, :workout_date, :user_id)
  end

  def set_exercise
    @exercise = current_user.exercises.find_by(id: params[:id])
  end
end