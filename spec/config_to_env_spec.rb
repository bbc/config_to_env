JSON_CONFIG = 'spec/example.json'
JSON_CONFIG_NODES =  ['environment', 'configuration', 'secondary_configuration']
require 'config_to_env'

RSpec.describe ConfigToEnv do

  describe 'require' do
    it "loads in a single top-level pair as is" do
      expect( ENV['ENVIRONMENT'] ).to eq 'test'
    end

    it "drops the top level context for a node with children" do
      expect( ENV['AA'] ).to eq 'one'
      expect( ENV['BB'] ).to eq 'two'
      expect( ENV['CC'] ).to eq 'three'
    end

    it "ignores anything not specified" do
      expect( ENV['ignored'] ).to be_nil
    end
  end
  
  describe '.flatten_hash' do
    
    it 'takes a hash, and flattens it into a simple hash of key/value pairs' do
      
      hash = {
        'a' => {
          '1' => 'a1',
          '2' => 'a2',
          '3' => { 'i' => 'a3i'}
        },
        'b' => 'b'
      }
      
      expect( ConfigToEnv.flatten_hash( hash ) ).to eq(
        { 'a_1'   => 'a1',
          'a_2'   => 'a2',
          'a_3_i' => 'a3i',
          'b'     => 'b' } )
    end
    
    
  end

end
