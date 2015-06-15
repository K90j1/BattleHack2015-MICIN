module SocialButtons
  class Scripter
    attr_accessor :caller, :options

    def initialize caller, options = {}
      @caller = caller
      @options = options
    end

    def script lang = nil
      raise NotImplementedError, "Must be implemented by subclass"
    end

    protected

    delegate :widgetized!, :widgetized?, to: :caller

    def empty_content
      "".html_safe
    end    
  end
end
