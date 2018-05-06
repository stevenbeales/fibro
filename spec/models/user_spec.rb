# frozen_string_literal: true

RSpec.describe User, type: :model do
  subject { FactoryBot.create(:test_user) }

  include_examples 'valid object creation', described_class

  describe '#respond_to?' do
    include_context 'shared attributes'
    include_examples 'respond', %i[user_id access_token]
    include_examples 'discard attribute'
    include_examples 'common attributes'
  end

  include_examples 'required attribute', :user_id, 2

  include_examples 'default attribute', :access_token, ''

  describe '.authenticate' do
    it 'creates a user if one does not exist' do
      expect { described_class.authenticate('Strangely') }.to change { described_class.count }.by(1)
    end

    it 'retrieves a user if name and access token exists' do
      timmy = create(:timmy)
      expect { described_class.authenticate(timmy.user_id) }.not_to(change { described_class.count })
      expect(described_class.authenticate(timmy.user_id).user_id).to eq timmy.user_id
      expect(described_class.authenticate(timmy.user_id).access_token).to eq timmy.access_token
    end

    it 'does not create a user without a user_id' do
      expect { described_class.authenticate('') }.to change { described_class.count }.by(0)
    end

    it 'does not create a user with a !' do
      expect { described_class.authenticate('Lisa!') }.to change { described_class.count }.by(0)
    end

    it 'does not create a user with a space' do
      expect { described_class.authenticate('test user') }.to change { described_class.count }.by(0)
    end

    it 'does create a user with a @.' do
      expect { described_class.authenticate('Lisa@.') }.to change { described_class.count }.by(1)
    end

    it 'does create a user with a -_' do
      expect { described_class.authenticate('_-Lisa@.') }.to change { described_class.count }.by(1)
    end

    it 'does create a user with a ,' do
      expect { described_class.authenticate(',Lisa@.') }.to change { described_class.count }.by(1)
    end

    it 'does create a user with a +=' do
      expect { described_class.authenticate('Lisa+=') }.to change { described_class.count }.by(1)
    end
  end

  describe 'Saving to a database' do
    it 'starts out unpersisted' do
      user = described_class.new
      expect(user.id).to be_nil
    end

    it 'can be persisted' do
      user = build(:timmy)
      user.save!

      persisted_user = described_class.authenticate('Timmy')
      expect(persisted_user.id).not_to be_nil
      expect(persisted_user.user_id).to eq 'Timmy'
      expect(persisted_user.access_token).to eq 'AccessToken'
    end

    it 'has unique name' do
      expect { described_class.authenticate('Timmy') }.to change { described_class.count }.by(0)
    end
  end

  describe '#to_s' do
    it 'prints user_id' do
      user = build(:timmy)
      expect(user.to_s).to eq(user.user_id)
    end
  end

  describe '#discard' do
    let!(:user) { build(:timmy) }
    before :each do
      user.discard
    end

    context 'does not delete' do
      it do
        expect(user.discarded?).to eq true
      end

      it do
        discarded = described_class.discarded.first
        expect(discarded.id).to eq user.id
      end

      it do
        expect(described_class.kept.include?(user)).to be_falsey
      end
    end
  end
end
