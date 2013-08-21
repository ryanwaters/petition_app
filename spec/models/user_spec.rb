require 'spec_helper'

describe User do
  
  it { should have_many :petitions }
  it { should have_many :signatures }
  

end
