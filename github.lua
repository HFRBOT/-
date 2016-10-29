-- [[بذمتك اذا تغير حقوق ملف ]]
local function run(msg, matches)
 if matches[1]:lower() == "github>" then
  local dat = https.request("https://api.github.com/repos/"..matches[2])
  local jdat = JSON.decode(dat)
  if jdat.message then
   return "لا يصح إدخال العنوان التالي: ex 👇🏻 \n 1- github wounds2/markzaza \n 2- github> wounds2/markzaza"
  end
  local base = "curl 'https://codeload.github.com/"..matches[2].."/zip/master'"
  local data = io.popen(base):read('*all')
  f = io.open("file/github.zip", "w+")
  f:write(data)
  f:close()
  return send_document("chat#id"..msg.to.id, "file/github.zip", ok_cb, false)
 else
  local dat = https.request("https://api.github.com/repos/"..matches[2])
  local jdat = JSON.decode(dat)
  if jdat.message then
   return "لا يصح إدخال العنوان التالي: ex 👇🏻 \n 1- github wounds2/markzaza \n 2- github> wounds2/markzaza"
  end
  local res = https.request(jdat.owner.url)
  local jres = JSON.decode(res)
  send_photo_from_url("chat#id"..msg.to.id, jdat.owner.avatar_url)
  return "حساب (github) 😴👌 \n"
   .."🍷: اسم الحساب :"..(jres.name or "-----").."\n"
   .."🆔 : اليوزرنيم :"..jdat.owner.login.."\n"
   .."🚭 : اسم الشركة :"..(jres.company or "-----").."\n"
   .."🌐 : الموقع :"..(jres.blog or "-----").."\n"
   .."Ⓜ️ : البريد الاكتروني :"..(jres.email or "-----").."\n"
   .."🃏 : المكان : "..(jres.location or "-----").."\n"
   .."💬 : رقم المشروع : "..jres.public_repos.."\n"
   .."☣ : عدد القراء : "..jres.followers.."\n"
   .."🏧 : عدد المتابعين : "..jres.following.."\n"
   .."📚 : تاريخ انشاء الحساب : "..jres.created_at.."\n"
   .."📬 : وصف الحساب : "..(jres.bio or "-----").."\n\n"
   .."🛢_نبذة عن هذا السورس_🛢 \n"
   .."🎫 : اسم السورس : "..jdat.name.."\n"
   .."🀄️ : رابط الصفحة : "..jdat.html_url.."\n"
   .."📕 : رابط تنصيب السورس : "..jdat.clone_url.."\n"
   .."🗂 : ما هو المشروع : "..(jdat.homepage or "-----").."\n"
   .."📅 : تاريخ تأسيس السورس : "..jdat.created_at.."\n"
   .."🗓 : اخر تحديث للسورس : "..(jdat.updated_at or "-----").."\n"
   .."🗄 : لغة التنصيب : "..(jdat.language or "-----").."\n"
   .."🀄️ : حجم الملفات : "..jdat.size.."\n"
   .."⭐️ : النجوم :"..jdat.stargazers_count.."\n"
   .."👁‍🗨 : المشاهدات :"..jdat.watchers_count.."\n"
   .."🔗 : الاقسام : "..jdat.forks_count.."\n"
   .."🎩 :مشتركين في الحساب :"..jdat.subscribers_count.."\n"
   .."🆚 : نبذة عن الحساب :"..(jdat.description or "-----").."\n #chanal : @C9_pro \n #by @wounds1"
   
 end
end

return {
 description = "Github Informations",

 patterns = {
  "^([Gg]ithub>) (.*)",
  "^([Gg]ithub) (.*)",
  },
 run = run
}

-- by @wounds1
-- chanel @C9_pro