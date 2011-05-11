RDF-Source
==========

`rdf-source` simplifies the creation of RDF as understood by RDF.rb from other
Ruby objects. The RDF.rb framework allows for simple enumerables to be passed
around the framework transparently, but for many use cases, a simple array is
more sensible. This module allows you to simply define a #statements method on
any object and dump it into any RDF.rb-compatible library.


Example
=======

    require 'rdf/source'

    CDs = RDF::Vocabulary.new('http://example.org/')

    class CD
      include RDF::Source

      attr_accessor :name
      attr_accessor :artist

      def statements
        [
          RDF::Statement.new(to_uri, CDs[:name], name.to_s),
          RDF::Statement.new(to_uri, CDs[:artist], artist.to_s)
        ]
      end
      
      def to_uri
        @uri ||= CDs[:cds] / name
      end
    end


    cd = CD.new
    cd.name = "Nevermind"
    cd.artist = "Nirvana"

    RDF::Writer.for(:ntriples).dump(cd)
    # => <http://example.org/cds/Nevermind> <http://example.org/name> "Nevermind" .
    # => <http://example.org/cds/Nevermind> <http://example.org/artist> "Nirvana" .

Using our sweet RDF cloud service, [Dydra](http://dydra.com)? Try this:
    
    Dydra::Repository.create!('test') << cd


AUTHORS
=======

 * Ben Lavender <ben@dydra.com>

UNLICENSE
=========

This is unrestricted software released into the public domain. See the accompanying UNLICENSE file.



