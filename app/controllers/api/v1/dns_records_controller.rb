module Api
  module V1
    class DnsRecordsController < ApplicationController
      # GET /dns_records
      def index

        if params[:page].present?
          service = GetDnsRecordsWithHostnamesService.new(
            page: params[:page],
            included: get_array(params[:included]),
            excluded: get_array(params[:excluded])
          )
          response = service.call

          render json: response, status: :ok
        else
          render json: { error: 'page is required' }, status: :unprocessable_entity
        end
      end

      # POST /dns_records
      def create
        dns_record = DnsRecord.create(dns_records_params)
        if dns_record.errors.any?
          render json: dns_record.errors.full_messages, status: :unprocessable_entity
        else
          render json: dns_record.id, status: :created
        end
      end

      private

      def dns_records_params
        params.require(:dns_records).permit(:ip, hostnames_attributes: [:hostname])
      end

      def get_array(param)
        param&.split(",") || []
      end

    end
  end
end
