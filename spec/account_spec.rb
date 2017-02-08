require './lib/account'

describe Account do


 it 'is expect ping to be 4 digit number' do
   number_length = Math.log10(subject.pin_code).to_i + 1
   expect(number_length).to eq 4
  end
 it 'is expect an expiry date on initialize' do
   expected_date = Date.today.next_year(5).strftime("%m/%y")
   expect(subject.set_expire_date).to eq expected_date
  end
 it 'is expect to have a balance of 0 on initialize' do
   expect(subject.balance).to eq 0
 end
end
