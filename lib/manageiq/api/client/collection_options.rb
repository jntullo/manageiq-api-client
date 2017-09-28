module ManageIQ
  module API
    class Client
      class CollectionOptions
        attr_reader :attributes
        attr_reader :virtual_attributes
        attr_reader :relationships
        attr_reader :data
        attr_reader :resource_type
        attr_reader :capture_interval
        attr_reader :start_date
        attr_reader :end_date
        attr_reader :resource_ids


        def initialize(options = {})
          @attributes, @virtual_attributes, @relationships, @data, @resource_type, @capture_interval, @start_date, @end_date, @resource_ids =
            options.values_at("attributes", "virtual_attributes", "relationships", "data", "resource_type", "capture_interval", "start_date", "end_date", "resource_ids")
        end
      end
    end
  end
end
