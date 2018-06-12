# frozen_string_literal: true

require_relative '../../hangman/hangman_charcheck.rb'

RSpec.describe CharCheck do
  describe '#charactar_check' do
    context 'When a user enters a response' do
      let(:validation) {CharCheck.new} 
      it 'is a letter between a-z' do

       expect(validation.charactar_check?('a')).to be true
       
      end

      it 'is not a letter' do
        expect(validation.charactar_check?(4.to_s)).to be false
      end
    end
  end
end
