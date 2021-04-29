# frozen_string_literal: true

class ReportsController < ApplicationController
  def index
    @results = Log.attendance(date)
  end

  def show
    case params[:report]
    when 'attendance', 'average_check', 'absence'
      @results = Log.send(params[:report], date)
    else
      return render file: %(#{Rails.root}/public/404.html), layout: false, status: 404
    end
    render :index
  end

  private

  def date
    @date ||= params[:date] ? Date.parse(params[:date]) : Date.yesterday
  end
end
