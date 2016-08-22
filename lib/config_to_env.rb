require 'json'

module ConfigToEnv

  # Take a hash, and flatten it down to a simple key/value pair hash
  def self.flatten_hash(hash)
    
    if ConfigToEnv.flat_hash?(hash)
      return hash
    else
      # Perform single level flatten
      processed_hash = {}
      hash.each do |k,v|
        if ConfigToEnv.is_value?(v)
          processed_hash[k] = v
        else
          v.each do |l,w|
            processed_hash[k + '_' + l] = w
          end
        end
      end
      return ConfigToEnv.flatten_hash(processed_hash)
    end
  end
  
  def self.is_value?(node)
    !node.respond_to?(:each)
  end
  
  def self.flat_hash?(hash)
    hash.collect do |k,v|
      return false if !ConfigToEnv.is_value?(v)
    end
  end
    
    
  if JSON_CONFIG  
    config = JSON.parse( File.read(JSON_CONFIG) )
    if defined? JSON_CONFIG_NODES
      hash = {}
      JSON_CONFIG_NODES.each do |node|
        if ConfigToEnv.is_value?(config[node])
          hash[node] = config[node]
        else
          hash.merge!(config[node])
        end
      end
      config = hash
    end
    config = ConfigToEnv.flatten_hash(config)
    config.each do |k,v|
      ENV[k.upcase] = v
    end
  end
  
end
