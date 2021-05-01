# frozen_string_literal: true

class ReportsController < ApplicationController
  def index
    @results = Log.attendance(date)
    flash[:alert] = 'No results for this report' if @results.empty?
  end

  def show
    case params[:report]
    when 'attendance', 'average_check', 'absence'
      @results = Log.send(params[:report], date)
      if @results.empty?
        flash[:alert] = 'No results for this report'
        return render :index
      end

      respond_to do |format|
        format.xlsx
        format.html { render :index }
      end
    else
      return render file: %(#{Rails.root}/public/404.html), layout: false, status: 404

    end
  end

  private

  def date
    @date ||= params[:date] ? Date.parse(params[:date]) : Date.yesterday
  end
end
