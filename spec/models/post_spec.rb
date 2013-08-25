require 'spec_helper'      
                           
describe Post do        

  let(:tag_list){'tag1,tag2,tag3'}

  context 'should set tag_list' do
    subject { FactoryGirl.create :post, tag_list: tag_list }
    its(:tags) { should have(3).items }
  end                      
end  

