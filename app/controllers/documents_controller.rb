class DocumentsController < ApplicationController
      def create
        @document = Document.new(params[:document])
        if @document.save
        redirect_to @document
        else
        render :action => 'new'
        end
    end
end
