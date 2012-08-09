#!/usr/bin/env ruby

require 'mongo-hadoop'

MongoHadoop.map do |document|
  { _id: document['source'], count: 1}
end
