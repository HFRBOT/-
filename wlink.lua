--[[
 _____     _       _____      _    
|__  /    / \     |__  /     / \   
  / /    / _ \      / /     / _ \  
 / /_   / ___ \    / /_    / ___ \ 
/____| /_/   \_\  /____|  /_/   \_\
   
DEV_ @wounds1                                
]]


do

local function wounds(msg, matches)
if matches[1] == "تحذير الروابط" then
   local onn = 'onnk:'..msg.to.id
   redis:set(onn, true)
   return "🆔تم تفعيل تحذير الروابط🚀"
   end
   local onn = 'onnk:'..msg.to.id
   if not is_momod(msg) then
if redis:get(onn) and matches[1] == "https" then
local text = "🚫ممنوع نشر الروابط هنا 🌐 يا : "..msg.from.print_name.. "\n 🆔معرفك : @"..(msg.from.username or "لا يوجد🚀").."  !"  
 reply_msg(msg.id, text, ok_cb, false)
end
end

if matches[1] == "الغاء تحذير الروابط" then
local onn = 'onnk:'..msg.to.id
redis:del(onn)
return "🆔تم الغاء تحذير الروابط🚀"
end
end

return {  
  patterns = {
               "https",
 "^[!/](تحذير الروابط)$",
 "^[!/](الغاء تحذير الروابط)$"

  },
  run = wounds,
}

end

-- [[الملف تعبت علي وسويته وطبعا غير حقوق براحتك بس شحتستفاد بس كلي ///// جروح بلادي]]


