require 'spec_helper'

describe 'Player' do
  let(:player){Player.new('jack')}


  it 'has a name' do
    expect(player.name).to eq('jack')
  end
  

end
