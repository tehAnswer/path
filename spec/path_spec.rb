RSpec.describe Path do
  let(:instance) { described_class.new }
  subject { instance.current_path }

  context 'root path is /' do
    it { is_expected.to eq('/') }
  end

  context 'absolute paths w/o aliases' do
    before { instance.cd('/FBI/Secrets/Kennedy') }

    it { is_expected.to eq('/FBI/Secrets/Kennedy') }
  end

  context 'relative paths w/o aliases' do
    before { instance.cd('FBI/Secrets/MoonLanding/') }
    it { is_expected.to eq('/FBI/Secrets/MoonLanding') }
  end

  context 'absolute paths with aliases' do
    before { instance.cd('/FBI/../FBI/Secrets/../Secrets/WWII') }
    it { is_expected.to eq('/FBI/Secrets/WWII') }
  end

  context 'relative paths with aliases' do
    let(:instance) { described_class.new('/Users/Don') }
    before { instance.cd('../../FBI/Secrets/../Secrets/A51') }

    it { is_expected.to eq('/Users/FBI/Secrets/A51') }
  end

  context 'too much parent visiting' do
    let(:instance) { described_class.new('/Users/Don') }
    before { instance.cd('../../../../../../../../../../../../../../..') }

    it { is_expected.to eq('/Users/FBI/Secrets/A51') }
  end
end
