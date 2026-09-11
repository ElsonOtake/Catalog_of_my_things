require 'fileutils'
require 'spec_helper'
require_relative '../lib/main'

describe Main do
  let(:test_dir) { File.expand_path('../../tmp_main_spec_data', __dir__) }

  before do
    @original_dir = Dir.pwd
    FileUtils.mkdir_p(test_dir)
    Dir.chdir(test_dir)
  end

  after do
    Dir.chdir(@original_dir)
    FileUtils.rm_rf(test_dir)
  end

  describe '#menu_option' do
    it 'returns the entered option when it is valid' do
      main = Main.new
      allow(main).to receive(:puts)
      allow(main).to receive(:gets).and_return("5\n")

      expect(main.menu_option).to eq('5')
    end

    it 're-prompts when given an option outside 0-12' do
      main = Main.new
      allow(main).to receive(:puts)
      allow(main).to receive(:gets).and_return("99\n", "7\n")

      expect(main.menu_option).to eq('7')
    end
  end

  describe '#menu' do
    it 'writes data and exits the loop when 0 is chosen' do
      main = Main.new
      allow(main).to receive(:puts)
      allow(main).to receive(:gets).and_return("0\n")

      expect { main.menu }.not_to raise_error
    end

    it 'dispatches to the matching Ui method for a non-exit option' do
      main = Main.new
      allow(main).to receive(:puts)
      allow(main).to receive(:gets).and_return("5\n", "0\n")

      ui = main.instance_variable_get(:@ui)
      expect(ui).to receive(:list_all_genres)

      main.menu
    end
  end
end
