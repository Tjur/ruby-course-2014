require './article.rb'

class MockArticle < Article
	def initialize
		super(generate_title, generate_content, generate_author)
		@likes, @dislikes = random_number, random_number
	end

	WORD_LIST = %w{ 
		phototropism prednisone cushion rhapsodise
		leukorrhoeal blanket unconsecrative brassica figwort chiengmai allergy
		equilibrating saithe eudemonistically laird ileitis
		noncruciform fields generalissimo lawn
		surliness tortuously costliness marcia carbarn unconstricted topeka
		nondeclaration resuscitator crackers nonpunctual netty chapelling ceto carbonylation morosely unintended
		dishabituate mucin lucency
		unsegmental revolutionizer metathesis logarithmically uncriticized pneumonokoniosis prelegend bicolor wonder
		reverable piend unconvenable scapolite
		umbellar outshamed ludhiana monumentally advancing nongovernance lully universalize
		gangland focalizing patronage unelectrified ommiads goc pyrenocarpic accreted
		prologuist merciless albuminuric galati etzel perigon nondiffusing jacquelynne preissuance
		orobanchaceous newhouse intercomparing marbelized unparenthesized unnymphlike isographically phytocidal
		tumidity prokopyevsk biacetyl entomostracan agaricin spectrality ivar
		unhuddle antifeminist mizoguchi eclosion glazed sarcocarcinomas foreboder
	}

	def random_number
	  rand(0..100)
	end

	def generate_author
		WORD_LIST.sample.capitalize + " " + WORD_LIST.sample.capitalize
	end

	def generate_title
		s = ""
		(random_number % 5 + 1).times do
			s << WORD_LIST.sample << " "
		end
		s.capitalize!.rstrip!
	end

	def generate_sentence
		s = ""
		(random_number % 6 + 5).times do
			s << WORD_LIST.sample << " "
		end
		s.capitalize!.rstrip! << "."
	end

	def generate_content
		s = ""
		(random_number % 5 + 1).times do
			s << generate_sentence << " "
		end
		s.rstrip!
	end

end
