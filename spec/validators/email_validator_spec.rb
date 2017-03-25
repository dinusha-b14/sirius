require 'rails_helper'

describe EmailValidator, type: :validator do
  let(:options) do
    { attributes: record.attributes }
  end

  subject { described_class.new(options) }

  describe '#validate_each' do
    let(:record) { build(:person) }

    before do
      subject.validate_each(record, :email, email_address)
    end

    context 'when email is valid' do
      let(:email_address) { Faker::Internet.email }

      it 'sets no errors against the record' do
        expect(record.errors).to be_empty
      end
    end

    context 'when email is invalid' do
      let(:email_address) { 'some invalid email' }

      it 'sets the errors against the record' do
        expect(record.errors).to_not be_empty
      end

      describe 'error messages' do
        context 'when no message option is passed in' do
          it 'returns the standard message' do
            expect(record.errors.full_messages).to include('Email is not an email')
          end
        end

        context 'when a custom message is passed in' do
          let(:options) do
            { attributes: record.attributes, message: 'is invalid!' }
          end

          it 'returns the custom message' do
            expect(record.errors.full_messages).to include('Email is invalid!')
          end
        end
      end
    end
  end
end
