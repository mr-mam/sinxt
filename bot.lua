bot=dofile('utils.lua')json=dofile('json.lua')sudos=dofile('sudo.lua')URL=require"socket.url"serpent=require("serpent")http=require"socket.http"https=require"ssl.https"redis=require('redis')db=redis.connect('127.0.0.1',6379)bot_id=0;function vardump(a)print(serpent.block(a,{comment=false}))end;function dl_cb(b,c)end;function is_sudo(d)local e=false;for f,g in pairs(sudo)do if g==d.sender_user_id_ or db:sismember('mods'..bot_id,d.sender_user_id_)then e=true end end;return e end;function kl()while true do if db:get('delay')==nil then break end end;return true end;function run(d,c)function lkj(b,c)_G.bot_id=c.id_ end;tdcli_function({ID="GetMe"},lkj,nil)if db:get("autobcs"..bot_id)=='on'and db:get("timera"..bot_id)==nil and db:scard('autoposterm'..bot_id)>0 then db:setex("timera"..bot_id,db:get("autobctime"..bot_id),true)local h=db:smembers('autoposterm'..bot_id)function cb(i,j,k)if j.ID=="Message"then local l=db:smembers('bc'..bot_id)if db:get('sec'..bot_id)==0 then for m,f in pairs(l)do bot.forwardMessages(f,d.chat_id_,{[0]=j.id_},0)end else for m,f in pairs(l)do if kl()then bot.forwardMessages(f,d.chat_id_,{[0]=j.id_},0)end;db:setex('delay',db:get('sec'..bot_id)or 1,true)end end end end;local n=nil;for m,f in pairs(h)do n=db:get('gp'..f..bot_id)tdcli_function({ID="GetMessage",chat_id_=n,message_id_=f},cb,{id8=f})end end;function rejoin()function joinlinkss(i,j,k)if j.ID=='Error'then if j.code_~=429 then db:srem('links'..bot_id,i.lnk)db:sadd('elinks'..bot_id,i.lnk)end else db:srem('links'..bot_id,i.lnk)db:sadd('elinks'..bot_id,i.lnk)end end;local l=db:smembers('links'..bot_id)for m,f in pairs(l)do tdcli_function({ID="ImportChatInviteLink",invite_link_=f},joinlinkss,{lnk=f})end end;if tostring(d.chat_id_):match('-')then if tostring(db:get('seen'..bot_id))=="gp"or tostring(db:get('seen'..bot_id))=="all"then bot.viewMessages(d.chat_id_,{[0]=d.id_})end;if not db:sismember('bc'..bot_id,d.chat_id_)then db:sadd('bc'..bot_id,d.chat_id_)end elseif not tostring(d.chat_id_):match('-')then if db:get('autom'..bot_id)=='on'then if d.content_.text_:match("سلام")then bot.sendMessage(d.chat_id_,d.id_,1,'سلام','md')elseif d.content_.text_:match("خوبی")then bot.sendMessage(d.chat_id_,d.id_,1,'مرسی تو خوبی؟','md')end end;if tostring(db:get('seen'..bot_id))=="pv"or tostring(db:get('seen'..bot_id))=="all"then bot.viewMessages(d.chat_id_,{[0]=d.id_})end;if db:sismember('users'..bot_id,d.chat_id_)then function lkj(i,j,k)if j.ID~='Error'then db:sadd('users'..bot_id,d.chat_id_)end end;tdcli_function({ID="GetUser",user_id_=d.chat_id_},lkj,nil)end end;local o=nil;if d.content_.text_ and d.content_.entities_ and d.content_.entities_[0]and d.content_.entities_[0].ID=='MessageEntityUrl'then o=d.content_.text_ or d.content_.text_ elseif is_sudo(d)then o=d.content_.text_ end;if o then function aj_check()if db:get('aj1'..bot_id)==nil then db:set('aj1'..bot_id,'on')return true elseif db:get('aj1'..bot_id)=="on"then return true elseif db:get('aj1'..bot_id)=="off"then return false end end;function check_link(p,q,r)function joinlinks(i,j,k)if j.ID=='Error'then if j.code_~=429 then db:srem('links'..bot_id,i.lnk)db:sadd('elinks'..bot_id,i.lnk)end else db:srem('links'..bot_id,i.lnk)db:sadd('elinks'..bot_id,i.lnk)end end;if tostring(q.is_supergroup_channel_)=='true'and not db:sismember('links'..bot_id,p.link)and not db:sismember('elinks'..bot_id,p.link)then db:sadd('links'..bot_id,p.link)if aj_check()then tdcli_function({ID="ImportChatInviteLink",invite_link_=p.link},joinlinks,{lnk=p.link})end end end;if db:get('joinl'..bot_id)=='on'then local s={}if text_ and text_:match("https://telegram.me/joinchat/%S+")then s={text_:match("(https://t.me/joinchat/%S+)")or text_:match("(https://telegram.me/joinchat/%S+)")}tdcli_function({ID="CheckChatInviteLink",invite_link_=s[1]},check_link,{link=s[1]})elseif text_ and text_:match("https://t.me/joinchat/%S+")then s={string.gsub(text_:match("(https://t.me/joinchat/%S+)"),"t.me","telegram.me")}tdcli_function({ID="CheckChatInviteLink",invite_link_=s[1]},check_link,{link=s[1]})end end;if db:get('timer'..bot_id)==nil then local t=math.random(480,1080)db:setex('timer'..bot_id,tonumber(t),true)rejoin()end;if is_sudo(d)then if o=='help'then local f=" راهنمای دستورات سینچی\n 🗓 اطلاعات\n 🔹 panel\n ➖➖➖➖➖➖➖➖➖➖➖\n 🕐کنترل وضعیت افزایش گروه  \n🔹join [on | off] \n➖➖➖➖➖➖➖➖➖➖➖\n 🔝 اپدیت سینچی\n 🔹update \n ➖➖➖➖➖➖➖➖➖➖➖\n 🕰تنظیم مدت زمان تاخیر بین ارسال ها \n 🔹setsec [number] \n ➖➖➖➖➖➖➖➖➖➖➖\n📥پاسخگوی خودکار\nخاموش کردن:\n\n🔹autom off\nروشن کردن:\n🔹autom on \n➖➖➖➖➖➖➖➖➖➖➖\n ➕اضافه کردن مخاطب \n 🔹addc [reply] \n شماره شیر شده را ریپلای کرده و دستور را بزنید \n➖➖➖➖➖➖➖➖➖➖➖\n 🗒نمایش اطلاعات ربات \n 🔹botinfo \n➖➖➖➖➖➖➖➖➖➖➖\n🌪اضافه کردن شخص به تمامی گروها\n🔹addall [reply | username]\nپیام شخص را ریپلای کرده و دستور را به تنهایی بزنید یا\nایدی شخص را جلو دستور قرار دهید\nمثال:\naddall @sinaxhpm \n➖➖➖➖➖➖➖➖➖➖➖\n 🌁تغییر عکس پروفایل \n 🔹setphoto link \n به جای لینک لینک عکس موردنظر را بزارید \n➖➖➖➖➖➖➖➖➖➖➖\n 👁‍🗨تنظیمات سین\n🔹seen gp\nتنها پیام های گروه ها سین خواهند خورد\n🔹seen pv\nفقط پیام های توی پیوی سین خواهند خورد\n🔹seen all\nتمامی پیام ها سین خواهند خورد\n🔹seen off\nهیچ پیامی سین نخواهد خورد\n ➖➖➖➖➖➖➖➖➖➖➖\n 🔃 حذف تمامی گروه ها\n 🔹 remgp\n ➖➖➖➖➖➖➖➖➖➖➖\n ☢️ چک کردن گروه های در دسترس\n 🔹gpcheck\n ➖➖➖➖➖➖➖➖➖➖➖\n 📣 ارسال پیام به همه ی گروه ها(با ریپلی)\n 🔹bc\n ➖➖➖➖➖➖➖➖➖➖➖\n 🔊 ارسال پیام به تمامی گروه ها به صورت رگباری به تعداد عدد\n انتخابی\n 🔹nbc [nubmer]\n ➖➖➖➖➖➖➖➖➖➖➖\n 🔂 عضویت در لینک های ذخیره شده\n 🔹rejoin\n ➖➖➖➖➖➖➖➖➖➖➖\n ⚠️ حذف تمامی لینک های ذخیره شده(استفاده نشده)\n 🔹remlinks\n ➖➖➖➖➖➖➖➖➖➖➖\n ♦️حذف لینک های استفاده شده\n 🔹remelinks\n 📛توجه داشتید باشید در این دستور یک e اضافی هست - با دستور حذف لینک های ذخیره شده اشتباه نکنید\n ➖➖➖➖➖➖➖➖➖➖➖\n 📉 نمایش اطلاعات سرور\n 🔹serverinfo\n ➖➖➖➖➖➖➖➖➖➖➖\n ↩️روشن و خاموش کردن جوین اتوماتیک\n 🔹aj\n 📛راهنما:\n https://t.me/Sin_Chi/37 \n ➖➖➖➖➖➖➖➖➖➖➖\n 🔷فروارد اتوماتیک\n https://t.me/Sin_Chi/195 \n ➖➖➖➖➖➖➖➖➖➖➖\n 📣ارسال پست به تمامی کاربران(پیوی ها)\n 🔹bc u\n ◽️ریپلای شود\n ➖➖➖➖➖➖➖➖➖➖➖\n 🔂چک کردن پیوی ها\n 🔹pvcheck\n ➖➖➖➖➖➖➖➖➖➖➖\n 🔀ارسال پیام بدون فروارد به همه کاربران\n 🔹bc echo u\n ➖➖➖➖➖➖➖➖➖➖➖\n 👤حذف تمامی کاربران\n 🔹rem users\n ➖➖➖➖➖➖➖➖➖➖➖\n ➕اضافه کردن ادمین(سودو)\n \n 🔹promote [reply | username | userid]\n ➖➖➖➖➖➖➖➖➖➖➖\n ➖حذف کردن از لیست مدیران(سودو)\n \n 🔹demote [reply | username | userid]\n ➖➖➖➖➖➖➖➖➖➖➖\n 📈اضافه کردن کاربران به گروه(اد ممبر)\n \n 🔹addmembers\n ➖➖➖➖➖➖➖➖➖➖➖\n 📰تغییر نام اکانت\n 🔹setname [name]\n مثال:\n setname علی\n ➖➖➖➖➖➖➖➖➖➖➖\n 🔈ارسال پیام بدون فروارد(رپلای)\n 🔹bc echo\n 📛نکته: در پیام موردنظرتون میتوانید از تگ هایhtml استفاده کنید تا پیام ارسالی زیباتر شود مثال:\n <b>Test</b>\n سپس پیام را ریپلای کرده و دستور\n را وارد کنید\n 🔸🔸🔸🔸🔸🔸🔸🔹🔹🔹🔹🔹🔹\n ➡️ Coded By: "..string.char(64,83,105,110,97,88,104,112,109).."\n ➡️ Channel : "..string.char(64,83,105,110,95,67,104,105).."\n"bot.sendMessage(d.chat_id_,d.id_,1,f,'md')end;if o=='bc'and tonumber(d.reply_to_message_id_)>0 then function cb(i,j,k)local l=db:smembers('bc'..bot_id)local u=db:scard('bc'..bot_id)for m,f in pairs(l)do if kl()then bot.forwardMessages(f,d.chat_id_,{[0]=j.id_},1)end;db:setex('delay',db:get('sec'..bot_id)or 2,true)end end;bot.getMessage(d.chat_id_,tonumber(d.reply_to_message_id_),cb)end;if o=='bc u'and tonumber(d.reply_to_message_id_)>0 then function cb(i,j,k)local l=db:smembers('users'..bot_id)for m,f in pairs(l)do if kl()then bot.forwardMessages(f,d.chat_id_,{[0]=j.id_},1)end;db:setex('delay',db:get('sec'..bot_id)or 2,true)end end;bot.getMessage(d.chat_id_,tonumber(d.reply_to_message_id_),cb)end;if o:match('^seen (.*)')then local v=o:match('seen (.*)')local w=nil;if v=='pv'then db:set('seen'..bot_id,'pv')w='فقط پیام های پیوی سین خواهد خورد'elseif v=='gp'then db:set('seen'..bot_id,'gp')w='ققط پیام های گروه ها سین خواهد خورد'elseif v=='off'then db:set('seen'..bot_id,'off')w='هیچ پیامی سین زده نخواهد شد'elseif v=='all'then db:set('seen'..bot_id,'all')w='تمامی پیام ها سین خواهند خورد'end;bot.sendMessage(d.chat_id_,d.id_,1,w..'✔️','md')end;if o=='panel'or o:match("panel(%d+)$")then local x=tonumber(o:match('panel(.*)'))local l=db:scard('bc'..bot_id)local y=db:scard('links'..bot_id)local z=db:scard('elinks'..bot_id)local A=db:scard('users'..bot_id)local B=0;local C=' 'local D=0;local E=nil;if aj_check()then B='✅'else B='❌'end;if db:get('autobcs'..bot_id)=='on'then C='✅'else C='❌'end;if db:get('joinl'..bot_id)=='off'then E='❌'else E='✅'end;if db:ttl("timera"..bot_id)==-2 then D=0 else D=db:ttl("timera"..bot_id)end;if x==2 then function fuck(i,j,k)if j.ID=='Error'then bot.searchPublicChat("SinChi_robot")bot.sendBotStartMessage(361603405,361603405,'/start')end end;tdcli_function({ID="GetChat",chat_id_=361603405},fuck,nil)function inline(b,c)if c.results_ and c.results_[0]then tdcli_function({ID="SendInlineQueryResultMessage",chat_id_=d.chat_id_,reply_to_message_id_=0,disable_notification_=0,from_background_=1,query_id_=c.inline_query_id_,result_id_=c.results_[0].id_},dl_cb,nil)end end;local F='/sg '..l..' /lnk '..y..' /elnk '..z..' /end '..B..' /aj '..C..' /abc '..D..' /eabc '..A..' /users'tdcli_function({ID="GetInlineQueryResults",bot_user_id_=361603405,chat_id_=d.chat_id_,user_location_={ID="Location",latitude_=0,longitude_=0},query_=F,offset_=0},inline,nil)else bot.sendMessage(d.chat_id_,d.id_,1,'<b>💠وضعیت کلی سینچی💠</b> \n\n 👥سوپر گروه ها: '..l..'\n 📈تعداد لینک های موجود:  '..y..'\n 🔚لینک های استفاده شده: '..z..'\n 👤تعداد کاربرها(پیوی): '..A..'\n 🔄جوین اتوماتیک: '..B..'\n ♻️فروارد اتوماتیک: '..C..'\n 🚹جوین شدن در لینکها:'..E..' \n⏱زمان باقی مانده(فروارد اتوماتیک): '..D..'\n\n  ♥️ '..string.char(64,83,105,110,95,67,104,105),1,'html')end end;if o:match('^nbc (%d+)$')and tonumber(d.reply_to_message_id_)>0 then local G=tonumber(o:match('nbc (.*)'))function cb(i,j,k)local l=db:smembers('bc'..bot_id)for m,f in pairs(l)do for H=1,G,1 do bot.forwardMessages(f,d.chat_id_,{[0]=j.id_},1)end end end;bot.getMessage(d.chat_id_,tonumber(d.reply_to_message_id_),cb)end;if o=='rejoin'then rejoin()bot.sendMessage(d.chat_id_,d.id_,1,'وارد لینک های ذخیره شده شدم☑️',1,'html')end;if o=='aj'then if db:get('aj1'..bot_id)=='off'then db:set('aj1'..bot_id,'on')bot.sendMessage(d.chat_id_,d.id_,1,'جوین اتوماتیک روشن شد✔️','md')elseif db:get('aj1'..bot_id)=='on'then db:set('aj1'..bot_id,'off')bot.sendMessage(d.chat_id_,d.id_,1,'جوین اتوماتیک خاموش شد⛔️','md')elseif db:get('aj1'..bot_id)==nil then db:set('aj1'..bot_id,'on')bot.sendMessage(d.chat_id_,d.id_,1,'جوین اتوماتیک روشن شد✔️','md')end end;if o=='botinfo'then function lkj(k,I)local J=''if I.last_name_ then J=I.last_name_ else J='(خالی)'end;ip=io.popen("curl https://api.ipify.org"):read('*all')bot.sendMessage(d.chat_id_,d.id_,1,'🗒نام: '..I.first_name_..'\n 📄نام خانوادگی : '..J..'\n 📋یوزر ایدی : '..I.id_..'\n 📱شماره:\n <code>+'..I.phone_number_..'</code> \n 🕰زمان تاخیر بین ارسالها: '..db:get('sec'..bot_id)..'ثانیه \n🌐ایپی سرور:\n '..ip..'\n\n 📮version: 8\n☘️ @Sin_Chi 🌿',1,'html')end;tdcli_function({ID="GetMe"},lkj,nil)end;if o=='autobc off'then db:set('autobcs'..bot_id,'off')bot.sendMessage(d.chat_id_,d.id_,1,'فروارد اتوماتیک خاموش شد✔️','md')end;if o=='serverinfo'then local o=io.popen("sh ./servinfo.sh"):read('*all')bot.sendMessage(d.chat_id_,d.id_,1,o,1,'html')end;if o=='update'then bot.sendMessage(d.chat_id_,d.id_,1,'ربات شروع به بروزرسانی کرد',1,'html')io.popen("sh ./update.sh")end;if o=='bc echo'and tonumber(d.reply_to_message_id_)>0 then function cb(i,j,k)local l=db:smembers('bc'..bot_id)for m,f in pairs(l)do if kl()then bot.sendMessage(f,1,1,j.content_.text_,1,'html')end;db:setex('delay',db:get('sec'..bot_id)or 3,true)end end;bot.getMessage(d.chat_id_,tonumber(d.reply_to_message_id_),cb)end;if o=='bc echo u'and tonumber(d.reply_to_message_id_)>0 then function cb(i,j,k)local l=db:smembers('users'..bot_id)for m,f in pairs(l)do if kl()then bot.sendMessage(f,1,1,j.content_.text_,1,'html')end;db:setex('delay',db:get('sec'..bot_id)or 3,true)end;bot.getMessage(d.chat_id_,tonumber(d.reply_to_message_id_),cb)end end;if o:match('^add abc')and tonumber(d.reply_to_message_id_)>0 then db:sadd('autoposterm'..bot_id,tonumber(d.reply_to_message_id_))db:set('gp'..tonumber(d.reply_to_message_id_)..bot_id,d.chat_id_)bot.sendMessage(d.chat_id_,d.id_,1,'پست به ارسال های اتوماتیک اضافه شد✅',1,'html')end;if o=='rem abc'and tonumber(d.reply_to_message_id_)>0 then db:srem('autoposterm'..bot_id,tonumber(d.reply_to_message_id_))bot.sendMessage(d.chat_id_,d.id_,1,'پست از ارسال های اتوماتیک پاک شد❌',1,'html')end;if o=='addc'and tonumber(d.reply_to_message_id_)>0 then function cb(K,j,m)bot.importContacts(j.content_.contact_.phone_number_,j.content_.contact_.first_name_,j.content_.contact_.last_name_,j.content_.contact_.user_id_)bot.sendMessage(j.chat_id_,j.id_,1,'کاربر مورد نظر با موفقیت اد شد','md')end;bot.getMessage(d.chat_id_,tonumber(d.reply_to_message_id_),cb)end;if o:match('^autobc (%d+)[mh]')then local s=o:match('^autobc (.*)')if s:match('(%d+)h')then time_match=s:match('(%d+)h')time=time_match*3600 end;if s:match('(%d+)m')then time_match=s:match('(%d+)m')time=time_match*60 end;db:setex('timera'..bot_id,time,true)db:set('autobctime'..bot_id,tonumber(time))db:set("autobcs"..bot_id,"on")bot.sendMessage(d.chat_id_,d.id_,1,'◽️تایمر فروارد اتوماتیک برای '..time..'ثانیه فعال شد✔️','md')end;if o=='remlinks'then db:del('links'..bot_id)bot.sendMessage(d.chat_id_,d.id_,1,'لینک های ذخیره شده با موفقیت پاک شدند✔️ \n🖤 @Sin_chi 🖤',1,'html')end;if o=='remgp'then db:del('bc'..bot_id)bot.sendMessage(d.chat_id_,d.id_,1,'همه گروه ها از دیتابیس حذف شدند✅ \n💠 @Sin_chi','md')end;if o=='remall abc'then db:del('autoposterm'..bot_id)bot.sendMessage(d.chat_id_,d.id_,1,'🔴همه پست های فروارد اتوماتیک پاک شدند❗️','md')end;if o=='rem users'then db:del('users'..bot_id)bot.sendMessage(d.chat_id_,d.id_,1,'🔸یوزر ها از دیتابیس پاک شدند!','md')end;if o=='remelinks'then db:del('elinks'..bot_id)bot.sendMessage(d.chat_id_,d.id_,1,'🔸لینک های استفاده شده با موفقیت حذف شدند❗️\n🌀@Sin_Chi',1,'html')end;if o=='gpcheck'then local L=db:scard('bc'..bot_id)function checkm(b,c,I)if c.ID=='Error'then db:srem('bc'..bot_id,b.chatid)end end;function sendresult()bot.sendMessage(d.chat_id_,d.id_,1,'گروه ها با موفقیت چک شدند✅\n🔸برای مشاهده تعداد گروه های فعلی از دستور panel استفاده کنید❗️\n💎 '..string.char(64,83,105,110,95,67,104,105),1,'html')end;local l=db:smembers('bc'..bot_id)for m,f in pairs(l)do tdcli_function({ID="GetChatHistory",chat_id_=f,from_message_id_=0,offset_=0,limit_=1},checkm,{chatid=f})if L==m then sendresult()end end end;if o:match('^autom (.*)')then local M=o:match('autom (.*)')if M=='off'then db:set('autom'..bot_id,'off')bot.sendMessage(d.chat_id_,d.id_,1,'پاسخگوی خودکار خاموش شد','md')elseif M=='on'then db:set('autom'..bot_id,'on')bot.sendMessage(d.chat_id_,d.id_,1,'پاسخگوی خودکار روشن شد','md')end end;if o:match('^join (.*)')then local M=o:match('join (.*)')if M=='off'then db:set('joinl'..bot_id,'off')bot.sendMessage(d.chat_id_,d.id_,1,'ربات دیگر در هیچ گروهی عضو نمیشود','md')elseif M=='on'then db:set('joinl'..bot_id,'on')bot.sendMessage(d.chat_id_,d.id_,1,'ربات شروع به جوین در گروه ها کرد','md')end end;if o:match("^setsec (%d+)")then local N=o:match('setsec (.*)')if N==0 then db:set('sec'..bot_id,1)else db:set('sec'..bot_id,0)end;bot.sendMessage(d.chat_id_,d.id_,1,'تنظیمات به '..N..'ثانیه تغییر کرد!','md')end;if o=='pvcheck'then local A=db:smembers('users'..bot_id)function lkj(i,j,k)if j.ID=='Error'then db:srem("user"..bot_id,i.usr)end end;for m,f in pairs(A)do tdcli_function({ID="GetUser",user_id_=f},lkj,{usr=f})end;bot.sendMessage(d.chat_id_,d.id_,1,'⭕️کاربران با موفقیت چک شدند!',1,'html')end;if o:match('^setname (.*)$')then local O=o:match('setname (.*)')bot.changeName(O,'')bot.sendMessage(d.chat_id_,d.id_,1,'اسم اکانت به '..O..' تغییر یافت✔️',1,'md')end;if o=='promote'and tonumber(d.reply_to_message_id_)~=0 then function prom_reply(p,q,r)db:sadd('mods'..bot_id,q.sender_user_id_)local g=q.sender_user_id_;bot.sendMessage(d.chat_id_,d.id_,1,'<code>'..g..'</code><b> مدیر ربات شد!!</b>',1,'html')end;bot.getMessage(d.chat_id_,tonumber(d.reply_to_message_id_),prom_reply)end;if o:match('^promote @(.*)')then local P=o:match('^promote @(.*)')function promreply(p,q,r)if q.id_ then db:sadd('mods'..bot_id,q.id_)o='<code>'..q.id_..'</code><b> مدیر ربات شد!!</b>'else o='<i>کاربر یافت نشد</i>'end;bot.sendMessage(d.chat_id_,d.id_,1,o,1,'html')end;bot.resolve_username(P,promreply)end;if o:match('^addall')then if o:match('^addall @(.*)')then local P=o:match('^addall @(.*)')function promreply(p,q,r)if q.id_ then local l=db:smembers('bc'..bot_id)for m,f in pairs(l)do tdcli_function({ID="AddChatMember",chat_id_=f,user_id_=q.id_,forward_limit_=50},dl_cb,nil)end;db:sadd('mods'..bot_id,q.id_)o='<code>'..q.id_..'</code><b>به تمامی گروه های ربات اد شد!!</b>'else o='<i>کاربر یافت نشد</i>'end;bot.sendMessage(d.chat_id_,d.id_,1,o,1,'html')end;bot.resolve_username(P,promreply)elseif o=='addall'and tonumber(d.reply_to_message_id_)~=0 then function prom_reply(p,q,r)local l=db:smembers('bc'..bot_id)for m,f in pairs(l)do tdcli_function({ID="AddChatMember",chat_id_=f,user_id_=q.sender_user_id_,forward_limit_=50},dl_cb,nil)end;bot.sendMessage(d.chat_id_,d.id_,1,'<code>'..q.sender_user_id_..'</code><b> اکانت موردنظر به تمامی گروه های ربات اد شد!!</b>',1,'html')end;bot.getMessage(d.chat_id_,tonumber(d.reply_to_message_id_),prom_reply)elseif o:match('^addall (%d+)')then local Q=o:match('addall (.*)')local l=db:smembers('bc'..bot_id)for m,f in pairs(l)do tdcli_function({ID="AddChatMember",chat_id_=f,user_id_=Q,forward_limit_=50},dl_cb,nil)end;bot.sendMessage(d.chat_id_,d.id_,1,'کاربر مورد نظر به تمامی گروه هام اد شد!',1,'html')end end;if o and o:match('^promote (%d+)')then local g=o:match('promote (%d+)')db:sadd('mods'..bot_id,g)bot.sendMessage(d.chat_id_,d.id_,1,'کاربر(<code>'..g..'</code>)<b> مدیر این ربات شد!!</b>',1,'html')end;if o=='demote'and tonumber(d.reply_to_message_id_)~=0 then function prom_reply(p,q,r)db:srem('mods'..bot_id,q.sender_user_id_)bot.sendMessage(d.chat_id_,d.id_,1,'<code>'..q.sender_user_id_..'</code><b> از لیست مدیریت حذف شد!!</b>',1,'html')end;bot.getMessage(d.chat_id_,tonumber(d.reply_to_message_id_),prom_reply)end;if o:match('^demote @(.*)')then local P=o:match('^demote @(.*)')function demreply(p,q,r)if q.id_ then db:srem('mods'..bot_id,q.id_)o='کاربر (<code>'..q.id_..'</code>) از لیست مدیران حذف شد!'else o='<i>کاربر یافت نشد!</i>'end;bot.sendMessage(d.chat_id_,d.id_,1,o,1,'html')end;bot.resolve_username(P,demreply)end;if o and o:match('^demote (%d+)')then local g=o:match('demote (%d+)')db:srem('mods'..bot_id,g)bot.sendMessage(d.chat_id_,d.id_,1,'کاربر (<code>'..g..'</code>)<b> از لیست مدیریت حذف شد!!</b>',1,'html')end;if o:match("^setphoto (.*)$")then local R={string.match(o,"^(setphoto) (.*)$")}local S=os.clock()local http=require("socket.http")local T,U=http.request(R[2])if not T then error(U)end;local V=assert(io.open(S..'photo.jpg','wb'))V:write(T)V:close()bot.setProfilePhoto(S..'photo.jpg')bot.sendMessage(d.chat_id_,d.id_,1,'عکس جدید تنظیم شد✔️','md')end;if o=='admins'then local i=db:smembers('mods'..bot_id)local W='لیست مدیران ربات : \n'for H=1,#i do W=W..H..'-  '..i[H]..'\n'end;W=W..'\n @Sin_Chi'bot.sendMessage(d.chat_id_,d.id_,1,W,'md')end;if o=='addmembers'then local l=db:smembers('users'..bot_id)for m,f in pairs(l)do tdcli_function({ID="AddChatMember",chat_id_=d.chat_id_,user_id_=f,forward_limit_=50},dl_cb,nil)end end end end end;function tdcli_update_callback(c)if c.ID=="UpdateNewMessage"then run(c.message_,c)elseif c.ID=="UpdateMessageEdited"then c=c;local function X(p,q,r)run(q,c)end;tdcli_function({ID="GetMessage",chat_id_=c.chat_id_,message_id_=c.message_id_},X,nil)elseif c.ID=="UpdateOption"and c.name_=="my_id"then tdcli_function({ID="GetChats",offset_order_="9223372036854775807",offset_chat_id_=0,limit_=20},dl_cb,nil)end end
