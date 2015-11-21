require 'net/http'

class Cms::CmsController < Cms::ApplicationController
  respond_to :html, :js, :json

  before_filter  :prepare_cms

  def index

    respond_with()

  end

  def retrieve
    model= params[:model]
    page_no = params[:page_no] == '' ? 1 : params[:page_no].to_i

    if model == nil || model == ''
      # throw RECORD NOT FOUND EXCEPTION
      logger.error('Model name must be provided.')
    end
    uri = URI("#{@cms_url}/#{model}.json?page=#{page_no}&auth_token=#{APP_CONFIG['locomotive']['auth_token']}")
    result = Net::HTTP.get(uri)

    render :json => result

  end

  private

  def prepare_cms
    @cms_url = "http://#{APP_CONFIG['locomotive']['host']}:#{APP_CONFIG['locomotive']['port']}"
  end

end

