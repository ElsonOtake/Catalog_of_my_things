require 'spec_helper'

class CheckInputTester
  include CheckInput
end

describe CheckInput do
  before do
    @tester = CheckInputTester.new
    allow($stdout).to receive(:print)
  end

  it 'returns the input once the block validates it as true' do
    allow(@tester).to receive(:gets).and_return("hello\n")

    result = @tester.check_input('') { |input| input == 'hello' }

    expect(result).to eq('hello')
  end

  it 're-prompts until a valid input is given' do
    allow(@tester).to receive(:gets).and_return("invalid\n", "valid\n")

    result = @tester.check_input('') { |input| input == 'valid' }

    expect(result).to eq('valid')
  end

  it 'strips surrounding whitespace and the trailing newline from the input' do
    allow(@tester).to receive(:gets).and_return("  spaced input  \n")

    result = @tester.check_input('') { |input| input == 'spaced input' }

    expect(result).to eq('spaced input')
  end

  it 'passes the entered value into the validation block' do
    allow(@tester).to receive(:gets).and_return("42\n")
    received = nil

    @tester.check_input('') do |input|
      received = input
      true
    end

    expect(received).to eq('42')
  end
end
