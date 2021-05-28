class QuizzesController < ApplicationController
before_action :authenticate_user!, except: [:index, :show]
before_action :set_quiz, only: [:show, :edit, :update, :destroy]

  def index
    @quizzes = Quiz.includes(:user).order("created_at DESC")
  end

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = Quiz.new(quiz_params)

    if @quiz.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @quiz.update(quiz_params)
      redirect_to quiz_path(@quiz.id)
    else
      render :edit
    end
  end

  def destroy
    @quiz.destroy
    redirect_to root_path
  end



  private

  def quiz_params
    params.require(:quiz).permit(:title, :answer, :image).merge(user_id: current_user.id)
  end

  def set_quiz
    @quiz = Quiz.find(params[:id])
  end
end
