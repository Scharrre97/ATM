require './lib/account'

describe Account do


 it 'is expect ping to be 4 digit number' do
   number_length = Math.log10(subject.pin_code).to_i + 1
   expect(number_length).to eq 4
  end
end
