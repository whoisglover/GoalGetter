require 'active_record'
require 'sqlite3'

class Task < ActiveRecord::Base
  belongs_to :goal
end

