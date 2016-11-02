

do 
function is_member(msg)-- Check if user is ADD or not 
members = load_data("members.db") 
 local var = false 
 for k,v in pairs(members) do 
 if msg.from.username == tostring(v) then 
 var = true 
 end 
end 
 return var 
end 

local function run(msg, matches) 
 local r = get_receiver(msg) 
 local x = 2 
 local a = 20 
 local q = 200 
 local s = "انته عضو متفاعل لقد بلغت رسائلك في هذه المجموعه 200 رساله \n\nشكرا لتواجدك معنا ❤\n @kasper_dev 👻" 
if not sg then 
sg = load_data("mg.db") 
end 
if msg then 
sg = load_data("mg.db") 
table.insert(sg,msg.id) 
save_data("mg.db",sg) 
end 

if msg then 
for k,v in pairs(sg) do 
    if k == tonumber(a) then 
msg = load_data("mg.db") 
     sg = {} 
save_data("mg.db",sg) 
       send_large_msg("user#id"..219844437, "bot is on 😼🙏") 
end 
end 
end 
 if msg then 
   msgg = load_data(msg.from.id.."msgg.db") 
          table.insert(msgg, msg.id) 
          save_data(msg.from.id.."msgg.db",msgg) 
end 
 if msg then 
    for k,v in pairs(msgg) do 
        if k == tonumber(q) then 
      msgg = load_data(msg.from.id.."msgg.db") 
           msgg = {} 
          save_data(msg.from.id.."msgg.db",msgg) 
          reply_msg(msg.id, s, ok_cb, true) 
        end 
    end 
 end 
if msg then 
   zi = load_data("zi.db") 
    for a,s in pairs(zi) do 
      if a == tonumber(x) then 
       v = load_data("v.db") 
           v = {} 
           save_data("v.db",v) 
      end 
  end 
end 
  if msg then 
    zi = load_data("zi.db") 
     for k,v in pairs(zi) do 
       if k == tonumber(x) then 
         zi = load_data("zi.db") 
             zi = {} 
             save_data("zi.db",zi) 
  end 
end 
end 

  if not is_member(msg) and msg then 
     members = load_data("members.db") 
               table.insert(members, msg.from.username) 
               save_data("members.db",members) 
  end 

  if matches[1] == "mem" then 
local membe = "your members :\n"
     for k,v in pairs(members) do 
     membe = membe..k.." : @"..v.."\n"
     end 
     send_large_msg(r, membe) 
  end 
end 

return { 
  patterns = { 
     "(.*)" 
  }, 
  run = run, 
} 

end