class DocumentException < Exception 
    attr_reader :document
    
    def initialize(document)
        @document = document
    end
end