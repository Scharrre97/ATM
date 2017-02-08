require './lib/account'

describe Account do

  let(:person) {instance_double('person', name: 'Johan')}

  subject { described_class.new({owner: person}) }


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

 it 'is expect to have :active status on initialize' do
   expect(subject.account_status).to eq :active
 end

 it 'deactivates account using Instance method' do
   subject.deactivate
   expect(subject.account_status).to eq :deactivated
 end

 it 'is expect to have an owner' do
   expect(subject.owner).to eq person
 end
end
