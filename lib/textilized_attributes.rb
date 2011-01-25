require 'RedCloth'

module TextilizedAttributes
  extend ActiveSupport::Concern

  module ClassMethods
    def textilized_attrs(*args)
      args.each do |attribute|
        define_method "textilized_#{attribute}" do
          textilize(send(attribute)).html_safe
        end
      end
    end
  end
end
