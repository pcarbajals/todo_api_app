# frozen_string_literal: true

module Api
  module V1
    class TasksController < ApplicationController
      around_action :transactions_filter, only: %i[create update destroy]

      rescue_from ActiveRecord::RecordInvalid, with: :render_validation_failed
      rescue_from ArgumentError, with: :render_bad_request
      rescue_from NoMethodError, with: :render_bad_request

      # GET /tasks
      def index
        @tasks = Task.all.includes(:tags)

        render json: @tasks, include: 'tags'
      end

      # GET /tasks/1
      def show
        render json: task
      end

      # POST /tasks
      def create
        @task = Task.new(task_params)

        if @task.save
          render json: @task, status: :created
        else
          render json: @task.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /tasks/1
      def update
        # TODO if @task.transaction { @task.update(task_params) }

        if task.update(task_params)
          render json: task, include: 'tags'
        else
          render json: task.errors, status: :unprocessable_entity
        end
      end

      # DELETE /tasks/1
      def destroy
        task.destroy
      end

      private

      def render_bad_request(error)
        error =
          {
            'status': :unprocessable_entity,
            'title': 'Bad request',
            'detail': error
          }

        render json: { 'errors': [error] }, status: :unprocessable_entity
      end

      def render_validation_failed(exception)
        errors = exception.record.errors.map do |_|
          {
            'status': :unprocessable_entity,
            'title': 'Validation failed',
            'detail': exception.message
          }
        end

        render json: { 'errors': errors }, status: :unprocessable_entity
      end

      # Use callbacks to share common setup or constraints between actions.
      def task
        @task ||= Task.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def task_params
        params.require(:data).permit(:attributes).tap do |whitelisted|
          whitelisted[:title] = params.dig(:data, :attributes, :title)
          whitelisted[:tags]  = params.dig(:data, :attributes, :tags) unless params.dig(:data, :attributes, :tags).nil?
        end
      end

      def transactions_filter
        ActiveRecord::Base.transaction do
          yield
        end
      end
    end
  end
end
