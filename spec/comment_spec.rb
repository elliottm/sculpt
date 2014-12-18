require 'spec_helper'
require 'data_mapper'
require 'comment'

describe Comment do
let(:comment) { Comment.new }

  it 'has an user email' do
    comment.useremail= "ahoy@yourma.com"
    expect(comment.useremail).to eq "ahoy@yourma.com"
  end

  it 'has a body' do 
    comment.body= "This is some comment body"
    expect(comment.body).to eq "This is some comment body"
  end

  it 'has a forum tag' do 
    comment.forum= "madmax"
    expect(comment.forum).to eq "madmax"
  end

end
