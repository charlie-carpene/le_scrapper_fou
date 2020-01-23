require_relative '../lib/marie_christmas.rb'

describe "the get_url_to_every_mairie_MTFCK method" do
  it "should return an ARRAY with urls" do
    expect(get_url_to_every_mairie_MTFCK).not_to be_nil
    expect(get_url_to_every_mairie_MTFCK.class).to eq(Array)
  end
end

describe "the search_each_pages method" do
  it "should return an ARRAY with name and emails folded in HASHes" do
    expect(search_each_pages(get_url_to_every_mairie_MTFCK)).not_to be_nil
    expect(search_each_pages(get_url_to_every_mairie_MTFCK).class).to eq(Array)
    #expect(search_each_pages(array[0]="http://annuaire-des-mairies.com/95/ableiges.html")).to eq(?)
  end
end
