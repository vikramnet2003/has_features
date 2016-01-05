module HasFeatures
  class Engine < ::Rails::Engine
    isolate_namespace HasFeatures
		root = HasFeatures::Engine.root

    config.after_initialize do
    	require root+'lib/has_features/features.rb'
			ActiveRecord::Base.send(:include, HasFeatures::Features)
    end  
  end
end
