local timer = require 'timer'

local ok, err = timer.setInterval('test1', function()
	local count = store.get('count') or 0
	count = count + 1
	store.set('count', count)
	ngx.log(ngx.ERR, 'interval 1: ', count, '    ', ngx.now())
	if 5 <= count then
		timer.clearInterval('test1')
	end
end, 1)

if not ok then
	log('err', err)
end

local ok, err = timer.setInterval('test2', function()
	ngx.log(ngx.ERR, 'interval 2: ', ngx.now())
end, 2)
