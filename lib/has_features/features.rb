module HasFeatures
	module Features
		extend ActiveSupport::Concern
	
		class_methods do

			def has_features
				define_singleton_method "add_feature_to_all_#{self.model_name.collection}" do |feature|
	        feature_id = 2**FEATURES[feature]
	        where("(features & ?)=0", feature_id).update_all("features = (features^#{feature_id})")
				end

	      define_singleton_method "remove_feature_from_all_#{self.model_name.collection}" do |feature|
	        feature_id = 2**FEATURES[feature]
	        where("(features & ?)<>0", feature_id).update_all("features = (features^#{feature_id})")
	      end

	      define_singleton_method "add_features_to_all_#{self.model_name.collection}" do |features|
	        features = Array.wrap(features)
	        features.map!{|x| 2**FEATURES[x] }
	        update_all("features = (features|#{features.sum})")
	      end

	      to_include = Module.new do
					def has_feature?(feature)
	    	  	return true unless (self.features.to_i & (2**FEATURES[feature])).zero?
	  	    	false
		    	end

					def has_features?(*features)
			      feature = features.collect{|f| (2**FEATURES[f]) }.sum
			      return true if (self.features.to_i & feature) == feature
			      false
			    end
				
					def add_feature(feature)
			      update_feature(feature) unless has_feature?(feature)
			    end
			    
			    def remove_feature(feature)
			      update_feature(feature) if has_feature?(feature)
			    end
			    
			    def update_feature(feature)
			      update_columns(:features => (self.features.to_i ^ (2**FEATURES[feature])))
			    end
	      end

	      include to_include

			end
		end
	end
end