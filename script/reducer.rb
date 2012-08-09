#!/usr/bin/env ruby

require 'mongo-hadoop'

MongoHadoop.reduce do |key, values|
  count = 0
  sum = 0

  values.each do |value|
    count += 1
    sum += value['num']
  end

  { _id: key, average: sum/count }
end
