module Bitcodin
	class VttMPD
		attr_accessor :values

		def initialize(jobID, subtitleConfig)
			@values = '{'
			@values += '"job": ' + jobID.to_s + ','
			@values += '"subtitles": ['
			@values += subtitleConfig.map(&:values).join(",")
			@values += ']'
			@values += '}'
		end
	end
end