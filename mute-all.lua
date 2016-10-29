-- by @Hi_debye
do
local function pre_process(msg)
 local hash = 'muteall:'..msg.to.id
  if redis:get(hash) and msg.to.type == 'channel' and not is_momod(msg)  then
   delete_msg(msg.id, ok_cb, false)
       end
    return msg
 end
 
local function run(msg, matches)
 if matches[1] == 'on chat' and is_momod(msg) then
       local hash = 'muteall:'..msg.to.id
       if not matches[2] then
              redis:set(hash, true)
             return "تم تفعيل وضع الصامت🔇 في مجموعة👥 "..msg.to.title.."\n"
 else
-- by @Blackwolf_admin 
local hour = string.gsub(matches[2], 'h', '')
 local num1 = tonumber(hour) * 3600
redis:setex(hash, num1, true)
 return "تم تفعيل وضع الصامت🔇 في مجموعة👥 "..msg.to.title.." لمدة"..matches[2].." من الساعات🕞"
 end
 end
if matches[1] == 'off chat' and is_momod(msg) then
               local hash = 'muteall:'..msg.to.id
        redis:del(hash)
          return "تم تعطيل وضع الصامت🔈 في مجموعة👥 "..msg.to.title.."\n"
  end
end
return {
   patterns = {
      '^[/!#](on chat)$',
      '^[/!#](off chat)$',
   '^[/!#](on chat) (.*)$',
 },
run = run,
  pre_process = pre_process
}
end
-- by @Hi_Debye 