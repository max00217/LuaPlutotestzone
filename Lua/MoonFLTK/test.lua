fl = require("moonfltk")

win = fl.window(1280, 960, arg[0])
box = fl.box(490, 430, 300, 100, "한국어를 지원하는 나");
box:box('up box')
box:labelfont(--[[fl.BOLD + fl.ITALIC]])
box:labelsize(36)
box:labeltype('shadow')
button = fl.button(540, 600, 200, 40, "클릭이 가능한 버튼")
button:callback(function()
  fl.message("뭉탱이로 클릭되다")
end)
win:done() -- 'end' is a keyword in Lua
win:show(arg[0], arg)

return fl.run()
