#encoding: utf-8

$:.unshift(File.expand_path(File.join(File.dirname(__FILE__), '..','/lib')))

require 'rdf'
require 'rdf/source'

describe RDF::Source do

  it "should not raise errors when including" do
    class ::Hash
      include RDF::Source

      def statements
        statements = []
        self.each do |key, value| 
          statements << RDF::Statement.new(
                          RDF::URI('http://example.org/hash/') / self.object_id,
                          RDF::URI('http://example.org/fields/') / key.to_s,
                          RDF::Literal.new(value))
        end
        statements
      end
    end
    # successful if no exception raised
  end

  it "should register including classes as an RDF::Enumerable" do
    Hash.new.should be_a RDF::Enumerable
  end

  it "should raise a NotImplementedError when not implementing #statements" do
    class ::X
      include ::RDF::Source
      def test
      end
    end
    Proc.new { ::X.new.each_statement.first }.should raise_error NotImplementedError
  end

  it "should allow instances of the given class to be written with RDF::Writer" do
    hash = { :x => 1, :y => 2 }
    id = hash.object_id
    RDF::Writer.for(:ntriples).dump(hash).should == <<-EOS
<http://example.org/hash/#{id}> <http://example.org/fields/x> "1"^^<http://www.w3.org/2001/XMLSchema#integer> .
<http://example.org/hash/#{id}> <http://example.org/fields/y> "2"^^<http://www.w3.org/2001/XMLSchema#integer> .
    EOS
  end

  it "should allow instances of the given class to be inserted into an RDF::Mutable" do
    repo = RDF::Repository.new
    hash = { :x => 1, :y => 2 }
    repo << hash
    repo.size.should == 2
  end

end


