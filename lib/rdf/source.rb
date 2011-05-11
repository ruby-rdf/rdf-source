require 'rdf'

module RDF
  module Source
  
    def self.included(klass)
      klass.__send__(:include, RDF::Enumerable)
      klass.__send__(:include, RDF::SourceMethods)
    end
  end

  module SourceMethods

      def statements
        raise NotImplementedError, "#{self.class} must implement #statements before being used as an RDF::Enumerable"
      end
      
      def each_statement
        if block_given?
          statements.each &Proc.new
        else
          statements.each
        end
      end
  end

end
