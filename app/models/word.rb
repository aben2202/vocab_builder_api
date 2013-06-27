class Word < ActiveRecord::Base
	attr_accessible :the_word, :review_cycle_start, :previous_review, :finished

	belongs_to :user

	validates_presence_of :the_word, :review_cycle_start

	def as_json(options={})
	  	super(only: [:id, :the_word, :review_cycle_start, :previous_review, :finished])
	end
end