require_relative '../classes/label'

describe Label do
  before :each do
    @label = Label.new('title 1', 'red')
  end

  it 'creates an instance of Label' do
    expect(@label).to be_a Label
  end
end
