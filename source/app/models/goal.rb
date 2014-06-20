require 'active_record'
require 'sqlite3'

class Goal < ActiveRecord::Base
  has_many :tasks
end