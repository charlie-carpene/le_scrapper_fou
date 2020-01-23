require_relative '../lib/dark_trader.rb'

describe "the scrappe_it_all_and_add_it_to_an_hash method" do
  it "should return return an HASH with ARRAY" do
    expect(scrappe_it_all_and_add_it_to_an_hash).not_to be_nil
    expect(scrappe_it_all_and_add_it_to_an_hash.class).to eq(Hash)
  end
end
