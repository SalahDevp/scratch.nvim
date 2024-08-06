local Config = { languages = {} }

function Config.init(opts)
	for lang, conf in pairs(opts.languages) do
		Config.languages[lang] = conf
	end
end

return Config
