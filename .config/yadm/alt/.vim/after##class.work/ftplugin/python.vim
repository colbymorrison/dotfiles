if getcwd() =~ 'configerator'
	let prefix = 'source/'

	if getcwd() =~ 'source\/\?$'
		let prefix = ''
	endif

	setlocal includeexpr=prefix.substitute(substitute(v:fname,'\\.','/','g'),'\\(.*\\)\\/','\\1.','')
endif
