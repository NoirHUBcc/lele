--// NoirHUB™ - one script, two builds. PREMIUM=false -> FREE | PREMIUM=true -> PREMIUM
local PREMIUM=true
local P,U,R,H,W,T=game:GetService("Players"),game:GetService("UserInputService"),game:GetService("RunService"),game:GetService("HttpService"),workspace,game:GetService("TweenService")
local LP,Cam,C3,Cd=P.LocalPlayer,W.CurrentCamera,Color3.fromRGB,Enum.Font.Code
local XL,XC,XR=Enum.TextXAlignment.Left,Enum.TextXAlignment.Center,Enum.TextXAlignment.Right
local MB,TC,MM=Enum.UserInputType.MouseButton1,Enum.UserInputType.Touch,Enum.UserInputType.MouseMovement
local Mob=U.TouchEnabled and not U.KeyboardEnabled
local WW,WH,DW=430,300,150
local LK=false -- lock flag: controls built while true are premium-locked in FREE
-- HELPERS
local function N(c,p,r)local o=Instance.new(c)for k,v in pairs(p)do o[k]=v end o.Parent=r return o end
local function Rd(p)return N("UICorner",{CornerRadius=UDim.new(.5,0)},p)end
local function isP(i)return i.UserInputType==MB or i.UserInputType==TC end
local function isM(i)return i.UserInputType==MM or i.UserInputType==TC end
local function Drag(f,h)local d,s,p;h=h or f
h.InputBegan:Connect(function(i)if isP(i)then d=true;s=i.Position;p=f.Position
i.Changed:Connect(function()if i.UserInputState==Enum.UserInputState.End then d=false end end)end end)
U.InputChanged:Connect(function(i)if d and isM(i)then local e=i.Position-s
f.Position=UDim2.new(p.X.Scale,p.X.Offset+e.X,p.Y.Scale,p.Y.Offset+e.Y)end end)end
local function DA(b,f)local a=false
b.InputBegan:Connect(function(i)if isP(i)then a=true;f(i.Position)end end)
U.InputChanged:Connect(function(i)if a and isM(i)then f(i.Position)end end)
U.InputEnded:Connect(function(i)if isP(i)then a=false end end)end
local S,F,Up,A={}, {}, {}, C3(190,190,190)
local function Ct(c)return(c.R*.299+c.G*.587+c.B*.114)>.55 and Color3.new()or Color3.new(1,1,1)end
local function OT(f)table.insert(Up,f)f()end
local function AT()for _,f in ipairs(Up)do f()end end
local function O(p)local n=(p:GetAttribute("n")or 0)+1;p:SetAttribute("n",n)return n end
local function Rg(k,g,s,t)if k then F[k]={g,s,t}end end
local PG=LP:WaitForChild("PlayerGui")
local G=N("ScreenGui",{Name="NoirHub",ResetOnSpawn=false,DisplayOrder=10},PG)
local Ov=N("ScreenGui",{Name="NoirOverlay",ResetOnSpawn=false,IgnoreGuiInset=true,DisplayOrder=1},PG)
local function L(r,t,sz,pos,col,al)return N("TextLabel",{Size=sz,Position=pos,BackgroundTransparency=1,Text=t,TextColor3=col or C3(225,225,225),TextSize=12,Font=Cd,TextXAlignment=al or XL,TextTruncate=Enum.TextTruncate.AtEnd},r)end
local function Bt(r,t,sz,pos,bg)return N("TextButton",{Size=sz,Position=pos,BackgroundColor3=bg or C3(35,35,35),BorderSizePixel=0,Text=t,TextColor3=C3(230,230,230),TextSize=12,Font=Cd,AutoButtonColor=false},r)end
local function Rw(p,h,au)return N("Frame",{Size=UDim2.new(1,0,0,h),BackgroundColor3=C3(20,20,20),BorderSizePixel=0,LayoutOrder=O(p),AutomaticSize=au and Enum.AutomaticSize.Y or Enum.AutomaticSize.None},p)end
local function LO(par)local b=N("TextButton",{Size=UDim2.fromScale(1,1),BackgroundColor3=C3(0,0,0),BackgroundTransparency=.4,BorderSizePixel=0,Text="[PREMIUM]",TextColor3=C3(140,140,140),TextSize=10,Font=Cd,AutoButtonColor=false,ZIndex=20,TextXAlignment=XR},par)N("UIPadding",{PaddingRight=UDim.new(0,8)},b)end
-- WINDOW
local M=N("Frame",{Size=UDim2.fromOffset(WW,WH),AnchorPoint=Vector2.new(.5,.5),Position=UDim2.fromScale(.5,.5),BackgroundColor3=C3(0,0,0),BackgroundTransparency=.2,BorderSizePixel=0,Active=true},G)
N("UIStroke",{Color=C3(65,65,65),Transparency=.25},M)
local US=N("UIScale",{},M)
local function LS(g)return g.AbsoluteSize/US.Scale end
local TB=N("Frame",{Size=UDim2.new(1,-44,0,38),BackgroundTransparency=1,Active=true},M)Drag(M,TB)
N("TextLabel",{Size=UDim2.fromScale(1,1),Position=UDim2.fromOffset(10,0),BackgroundTransparency=1,Text=PREMIUM and"NoirHUB™ PREMIUM"or"NoirHUB™ FREE",TextColor3=C3(255,255,255),TextSize=17,Font=Cd,TextXAlignment=XL},TB)
local X=Bt(M,"X",UDim2.fromOffset(28,26),UDim2.new(1,-34,0,6),C3(25,25,25))
local Tb=N("Frame",{Size=UDim2.new(1,-20,0,28),Position=UDim2.fromOffset(10,40),BackgroundTransparency=1},M)
N("UIListLayout",{FillDirection=Enum.FillDirection.Horizontal,Padding=UDim.new(0,5),SortOrder=Enum.SortOrder.LayoutOrder},Tb)
local Bd=N("Frame",{Size=UDim2.new(1,-20,1,-78),Position=UDim2.fromOffset(10,72),BackgroundColor3=C3(8,8,8),BackgroundTransparency=.15,BorderSizePixel=0,ClipsDescendants=true},M)
-- PREVIEW DOCKS (right + left)
local function MkDock(pos)local d=N("ScrollingFrame",{Size=UDim2.new(0,DW,1,0),Position=pos,BackgroundTransparency=1,BorderSizePixel=0,ScrollBarThickness=3,CanvasSize=UDim2.new(),AutomaticCanvasSize=Enum.AutomaticSize.Y,Visible=false},M)
N("UIListLayout",{Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder},d)
N("UIPadding",{PaddingRight=UDim.new(0,6)},d)return d end
local DockR=MkDock(UDim2.new(1,6,0,0))
local DockL=MkDock(UDim2.new(0,-DW-6,0,0))
local PV_,PA,PU={}, {}, {}
local cur="Main"
local function Docks()local r,l=false,false
if S.UiPrev==true then for _,e in ipairs(PV_[cur]or{})do if e[2]=="L"then l=true else r=true end end end
return r,l end
local function Rs()local vp=Cam and Cam.ViewportSize or Vector2.new(800,600)
local r,l=Docks()local w=WW+(r and DW+6 or 0)+(l and DW+6 or 0)
US.Scale=math.min(1,vp.X*.96/w,vp.Y*.94/WH)*(S.UiScale or 1)end
local cofs=0
local function PV()
local on=S.UiPrev==true
local r,l=Docks()
DockR.Visible=r DockL.Visible=l
for tb,list in pairs(PV_)do for _,e in ipairs(list)do e[1].Visible=on and tb==cur end end
DockR.CanvasPosition=Vector2.new()DockL.CanvasPosition=Vector2.new()
Rs()
local no=((l and DW+6 or 0)-(r and DW+6 or 0))/2*US.Scale
if math.abs(no-cofs)>.5 then T:Create(M,TweenInfo.new(.2,Enum.EasingStyle.Quad),{Position=M.Position+UDim2.fromOffset(no-cofs,0)}):Play()cofs=no end end
local function Pn(tb,side,h,t)
local par=side=="L"and DockL or DockR
local f=N("Frame",{Size=UDim2.new(1,0,0,h),BackgroundColor3=M.BackgroundColor3,BackgroundTransparency=M.BackgroundTransparency,BorderSizePixel=0,Visible=false,LayoutOrder=O(par)},par)
N("UIStroke",{Color=C3(65,65,65),Transparency=.25},f)
L(f,t,UDim2.new(1,-12,0,20),UDim2.fromOffset(6,0),C3(150,150,150)).TextSize=10
N("Frame",{Size=UDim2.new(1,-10,0,1),Position=UDim2.fromOffset(5,20),BackgroundColor3=C3(65,65,65),BackgroundTransparency=.4,BorderSizePixel=0},f)
PV_[tb]=PV_[tb]or{}table.insert(PV_[tb],{f,side})table.insert(PA,f)return f end
local function Gr(a)
for i=1,5 do N("Frame",{Size=UDim2.new(0,1,1,0),Position=UDim2.fromScale(i/6,0),BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=.94,BorderSizePixel=0},a)end
for i=1,3 do N("Frame",{Size=UDim2.new(1,0,0,1),Position=UDim2.fromScale(0,i/4),BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=.94,BorderSizePixel=0},a)end end
local function Ar(p,y,h,ng)local f=N("Frame",{Size=UDim2.new(1,-10,0,h),Position=UDim2.fromOffset(5,y),BackgroundColor3=C3(12,12,12),BorderSizePixel=0,ClipsDescendants=true},p)
N("UIStroke",{Color=C3(40,40,40)},f)if not ng then Gr(f)end return f end
-- TABS (two columns + divider)
local Pg,TBt={}, {}
local function Sel(n)cur=n
for k,p in pairs(Pg)do p.Visible=k==n end
for k,b in pairs(TBt)do local o=k==n b.BackgroundColor3=o and A or C3(24,24,24)b.TextColor3=o and Ct(A)or C3(230,230,230)end
PV()end
local function Tab(n,o)local b=Bt(Tb,n,UDim2.new(1/3,-4,1,0),nil,C3(24,24,24))b.LayoutOrder=o
local p=N("ScrollingFrame",{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,BorderSizePixel=0,ScrollBarThickness=3,CanvasSize=UDim2.new(),AutomaticCanvasSize=Enum.AutomaticSize.Y,Visible=false},Bd)
N("UIListLayout",{Padding=UDim.new(0,5),SortOrder=Enum.SortOrder.LayoutOrder},p)
N("UIPadding",{PaddingTop=UDim.new(0,6),PaddingLeft=UDim.new(0,6),PaddingRight=UDim.new(0,10),PaddingBottom=UDim.new(0,6)},p)
local ho=N("Frame",{Size=UDim2.new(1,0,0,10),BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=1},p)
local function col(x,ox)local c=N("Frame",{Size=UDim2.new(.5,-5,0,0),Position=UDim2.new(x,ox,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,BorderSizePixel=0},ho)
N("UIListLayout",{Padding=UDim.new(0,5),SortOrder=Enum.SortOrder.LayoutOrder},c)return c end
local l,r=col(0,0),col(.5,5)
N("Frame",{Size=UDim2.new(0,1,1,0),Position=UDim2.new(.5,0,0,0),BackgroundColor3=C3(65,65,65),BackgroundTransparency=.2,BorderSizePixel=0},ho)
local function fit()local sc=math.max(US.Scale,.01)ho.Size=UDim2.new(1,0,0,math.max(l.AbsoluteSize.Y,r.AbsoluteSize.Y)/sc)end
l:GetPropertyChangedSignal("AbsoluteSize"):Connect(fit)r:GetPropertyChangedSignal("AbsoluteSize"):Connect(fit)US:GetPropertyChangedSignal("Scale"):Connect(fit)
task.defer(fit)
Pg[n]=p TBt[n]=b b.MouseButton1Click:Connect(function()Sel(n)end)return l,r end
local MPL,MPR=Tab("Main",1)
local VPL,VPR=Tab("Visuals",2)
local SPL,SPR=Tab("Settings",3)
OT(function()Sel(cur)end)
-- ELEMENTS (all lock-aware)
local function Sec(p,t)local l=L(p,t,UDim2.new(1,0,0,22),nil,C3(150,150,150))l.LayoutOrder=O(p)end
local function Ctn(p)local f=N("Frame",{Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=O(p)},p)
N("UIListLayout",{Padding=UDim.new(0,5),SortOrder=Enum.SortOrder.LayoutOrder},f)return f end
local function Tg(p,t,k,d,cb)local v,lk,ini=false,LK,false local r=Rw(p,30)L(r,t,UDim2.new(1,-52,1,0),UDim2.fromOffset(9,0))
local tr=N("Frame",{Size=UDim2.fromOffset(28,14),Position=UDim2.new(1,-38,.5,-7),BorderSizePixel=0},r)
local kn=N("Frame",{Size=UDim2.fromOffset(10,10),BackgroundColor3=C3(235,235,235),BorderSizePixel=0},tr)
local h=N("TextButton",{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,Text=""},r)
local function rd()tr.BackgroundColor3=v and A or C3(55,55,55)kn.Position=UDim2.fromOffset(v and 16 or 2,2)end
local function st(x)if lk and ini then return end v=x and true or false S[k]=v rd()if cb then cb(v)end end
h.MouseButton1Click:Connect(function()st(not v)end)OT(rd)Rg(k,function()return v end,st,"b")st(d)ini=true if lk then LO(r)end end
local function Sl(p,t,k,mn,mx,d,dc,cb)dc=dc or 0 local st=10^-dc local v,lk,ini=d,LK,false local r=Rw(p,42)
L(r,t,UDim2.new(.66,0,0,18),UDim2.fromOffset(9,2),C3(220,220,220))
local vl=L(r,"",UDim2.new(.34,-9,0,18),UDim2.new(.66,0,0,2),C3(170,170,170),XR)
local b=N("Frame",{Size=UDim2.new(1,-18,0,4),Position=UDim2.fromOffset(9,30),BackgroundColor3=C3(55,55,55),BorderSizePixel=0},r)
local f=N("Frame",{BorderSizePixel=0},b)
local h=N("TextButton",{Size=UDim2.new(1,0,0,26),Position=UDim2.fromOffset(0,16),BackgroundTransparency=1,Text=""},r)
local function rd()f.Size=UDim2.new((v-mn)/(mx-mn),0,1,0)f.BackgroundColor3=A vl.Text=string.format("%."..dc.."f",v)end
local function set(x)if lk and ini then return end x=math.clamp(tonumber(x)or d,mn,mx)v=math.floor(x/st+.5)*st S[k]=v rd()if cb then cb(v)end end
DA(h,function(q)set(mn+(mx-mn)*math.clamp((q.X-b.AbsolutePosition.X)/b.AbsoluteSize.X,0,1))end)
OT(rd)Rg(k,function()return v end,set,"n")set(d)ini=true if lk then LO(r)end end
local function Dd(p,t,k,o,d,m,cb)local v local lk,ini=LK,false
if m then v={}for _,n in ipairs(d or{})do v[n]=true end else v=d or o[1]or""end
local c=Rw(p,34,true)c.ClipsDescendants=true N("UIListLayout",{SortOrder=Enum.SortOrder.LayoutOrder},c)
local hd=N("Frame",{Size=UDim2.new(1,0,0,34),BackgroundTransparency=1,LayoutOrder=1},c)
L(hd,t,UDim2.new(.42,0,1,0),UDim2.fromOffset(9,0))
local vb=Bt(hd,"",UDim2.new(.56,-6,1,-8),UDim2.new(.44,0,0,4))vb.TextColor3=C3(200,200,200)vb.TextSize=11 vb.TextTruncate=Enum.TextTruncate.AtEnd
local ls=N("Frame",{Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,Visible=false,LayoutOrder=2},c)
N("UIListLayout",{Padding=UDim.new(0,3),SortOrder=Enum.SortOrder.LayoutOrder,HorizontalAlignment=Enum.HorizontalAlignment.Center},ls)
N("UIPadding",{PaddingBottom=UDim.new(0,6)},ls)
local bs={}
local function rd()
for n,b in pairs(bs)do local on=(m and v[n]==true)or(not m and v==n)b.BackgroundColor3=on and A or C3(35,35,35)b.TextColor3=on and Ct(A)or C3(200,200,200)end
if m then local ns={}for _,x in ipairs(o)do if v[x]then table.insert(ns,x)end end vb.Text=(#ns>0 and table.concat(ns,", ")or"None").."  v"
else vb.Text=(v~=""and v or"None").."  v"end end
local function cm()if k then S[k]=v end rd()if cb then cb(v)end end
local function bd()for _,b in pairs(bs)do b:Destroy()end bs={}
for i,n in ipairs(o)do local b=Bt(ls,n,UDim2.new(1,-12,0,24))b.LayoutOrder=i b.TextSize=11
b.MouseButton1Click:Connect(function()if m then v[n]=(not v[n])or nil else v=n ls.Visible=false end cm()end)bs[n]=b end end
vb.MouseButton1Click:Connect(function()ls.Visible=not ls.Visible end)
local function set(x)if lk and ini then return end if m then local nw={}if type(x)=="table"then for q,y in pairs(x)do if y==true and table.find(o,q)then nw[q]=true end end end v=nw elseif table.find(o,x)then v=x end cm()end
OT(rd)bd()Rg(k,function()return v end,set,m and"m"or"s")cm()ini=true if lk then LO(hd)end
return{Get=function()return v end,Set=set,SetOptions=function(n)o=n if not m and not table.find(o,v)then v=o[1]or""end bd()cm()end}end
-- COLOR PICKER (FREE = basic; PREMIUM = HEX/RGB/old-new/recent/presets)
local Rec,RU={}, {}
local PRE={C3(255,60,60),C3(255,150,40),C3(255,220,50),C3(90,255,120),C3(60,220,255),C3(80,130,255),C3(170,90,255),C3(255,90,200),C3(255,255,255),C3(150,150,150),C3(60,60,60),C3(0,0,0)}
local function Hx(c)return string.format("#%02X%02X%02X",math.floor(c.R*255+.5),math.floor(c.G*255+.5),math.floor(c.B*255+.5))end
local function PHx(s)s=s:gsub("[#%s]","")if #s==6 then local n=tonumber(s,16)if n then return C3(math.floor(n/65536),math.floor(n/256)%256,n%256)end end end
local function PushRec(c)local h=Hx(c)for i,x in ipairs(Rec)do if Hx(x)==h then table.remove(Rec,i)break end end
table.insert(Rec,1,c)while #Rec>8 do table.remove(Rec)end for _,f in ipairs(RU)do f()end end
local function Cp(p,t,k,d,cb)local c0,old,lk,ini=d,d,LK,false local h,s,v=d:ToHSV()
local PH=PREMIUM and 270 or 124
local c=Rw(p,34,true)N("UIListLayout",{SortOrder=Enum.SortOrder.LayoutOrder},c)
local hd=N("Frame",{Size=UDim2.new(1,0,0,34),BackgroundTransparency=1,LayoutOrder=1},c)
L(hd,t,UDim2.new(1,-98,1,0),UDim2.fromOffset(9,0))
local sw=N("TextButton",{Size=UDim2.fromOffset(84,22),Position=UDim2.new(1,-92,.5,-11),BorderSizePixel=0,Text="",AutoButtonColor=false},hd)
N("UIStroke",{Color=Color3.new(1,1,1),Transparency=.75},sw)
local sl=N("TextLabel",{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,Font=Cd,TextSize=11,Text=""},sw)
local pn=N("Frame",{Size=UDim2.new(1,0,0,0),BackgroundTransparency=1,Visible=false,LayoutOrder=2,ClipsDescendants=true},c)
local ib=N("Frame",{Size=UDim2.new(1,0,0,PH),BackgroundTransparency=1},pn)
local sv=N("Frame",{Size=UDim2.new(1,-16,0,90),Position=UDim2.fromOffset(8,6),BorderSizePixel=0},ib)
N("UIStroke",{Color=C3(70,70,70),Transparency=.3},sv)
local function ov(col,rot,a,b)local f=N("Frame",{Size=UDim2.fromScale(1,1),BackgroundColor3=col,BorderSizePixel=0},sv)
N("UIGradient",{Rotation=rot,Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0,a),NumberSequenceKeypoint.new(1,b)})},f)end
ov(Color3.new(1,1,1),0,0,1)ov(Color3.new(),90,1,0)
local scur=N("Frame",{Size=UDim2.fromOffset(12,12),AnchorPoint=Vector2.new(.5,.5),BorderSizePixel=0},sv)N("UIStroke",{Color=Color3.new(1,1,1),Thickness=2},scur)
local sh=N("TextButton",{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,Text="",ZIndex=5},sv)
local hu=N("Frame",{Size=UDim2.new(1,-16,0,10),Position=UDim2.fromOffset(8,104),BackgroundColor3=Color3.new(1,1,1),BorderSizePixel=0},ib)
local sq={}for i=0,6 do sq[i+1]=ColorSequenceKeypoint.new(i/6,Color3.fromHSV(math.min(i/6,.999),1,1))end
N("UIGradient",{Rotation=0,Color=ColorSequence.new(sq)},hu)
local hk=N("Frame",{Size=UDim2.fromOffset(6,18),AnchorPoint=Vector2.new(.5,.5),BorderSizePixel=0},hu)N("UIStroke",{Color=Color3.new(1,1,1),Thickness=2},hk)
local hh=N("TextButton",{Size=UDim2.new(1,0,0,22),Position=UDim2.fromOffset(0,-6),BackgroundTransparency=1,Text="",ZIndex=5},hu)
local od,nw,hb,rb,gb,bb
local function rd()c0=Color3.fromHSV(h,s,v)sw.BackgroundColor3=c0 sl.Text=Hx(c0)sl.TextColor3=Ct(c0)
sv.BackgroundColor3=Color3.fromHSV(h,1,1)scur.Position=UDim2.fromScale(s,1-v)scur.BackgroundColor3=c0
hk.Position=UDim2.fromScale(h,.5)hk.BackgroundColor3=Color3.fromHSV(h,1,1)
if PREMIUM then nw.BackgroundColor3=c0 od.BackgroundColor3=old
if not hb:IsFocused()then hb.Text=Hx(c0)end
if not rb:IsFocused()then rb.Text=tostring(math.floor(c0.R*255+.5))end
if not gb:IsFocused()then gb.Text=tostring(math.floor(c0.G*255+.5))end
if not bb:IsFocused()then bb.Text=tostring(math.floor(c0.B*255+.5))end end end
local function cm()rd()S[k]=c0 if cb then cb(c0)end end
local tmr=0
local function Pr()if not PREMIUM then return end tmr=tmr+1 local m=tmr task.delay(.8,function()if m==tmr then PushRec(c0)end end)end
local function SetC(x)h,s,v=x:ToHSV()cm()end
DA(sh,function(q)s=math.clamp((q.X-sv.AbsolutePosition.X)/sv.AbsoluteSize.X,0,1)v=1-math.clamp((q.Y-sv.AbsolutePosition.Y)/sv.AbsoluteSize.Y,0,1)cm()Pr()end)
DA(hh,function(q)h=math.clamp((q.X-hu.AbsolutePosition.X)/hu.AbsoluteSize.X,0,.999)cm()Pr()end)
if PREMIUM then
local sp=N("Frame",{Size=UDim2.fromOffset(40,24),Position=UDim2.fromOffset(8,122),BorderSizePixel=0,ClipsDescendants=true},ib)N("UIStroke",{Color=C3(70,70,70),Transparency=.3},sp)
od=N("TextButton",{Size=UDim2.fromScale(.5,1),BorderSizePixel=0,Text="",AutoButtonColor=false},sp)
nw=N("Frame",{Size=UDim2.fromScale(.5,1),Position=UDim2.fromScale(.5,0),BorderSizePixel=0},sp)
local function bx(par,col)local b=N("TextBox",{BackgroundColor3=C3(30,30,30),BorderSizePixel=0,Text="",TextColor3=C3(225,225,225),TextSize=11,Font=Cd,ClearTextOnFocus=false},par)N("UIStroke",{Color=col,Transparency=.55},b)return b end
hb=bx(ib,C3(120,120,120))hb.Position=UDim2.fromOffset(54,122)hb.Size=UDim2.new(1,-62,0,24)
local rgr=N("Frame",{Size=UDim2.new(1,-16,0,24),Position=UDim2.fromOffset(8,152),BackgroundTransparency=1},ib)N("UIListLayout",{FillDirection=Enum.FillDirection.Horizontal,Padding=UDim.new(0,4)},rgr)
rb,gb,bb=bx(rgr,C3(255,90,90)),bx(rgr,C3(90,255,120)),bx(rgr,C3(90,150,255))
for _,b in ipairs{rb,gb,bb}do b.Size=UDim2.new(1/3,-3,1,0)end
local function lab(tx,y)L(ib,tx,UDim2.new(1,-16,0,10),UDim2.fromOffset(8,y),C3(120,120,120)).TextSize=9 end
lab("RECENT",182)lab("PRESETS",215)
local rrow=N("Frame",{Size=UDim2.new(1,-16,0,18),Position=UDim2.fromOffset(8,193),BackgroundTransparency=1},ib)N("UIListLayout",{FillDirection=Enum.FillDirection.Horizontal,Padding=UDim.new(0,3)},rrow)
local prow=N("Frame",{Size=UDim2.new(1,-16,0,40),Position=UDim2.fromOffset(8,226),BackgroundTransparency=1},ib)N("UIListLayout",{FillDirection=Enum.FillDirection.Horizontal,Wraps=true,Padding=UDim.new(0,3)},prow)
hb.FocusLost:Connect(function()local x=PHx(hb.Text)if x then SetC(x)Pr()else rd()end end)
local function rgbc()local function g(b,df)return math.clamp(math.floor(tonumber(b.Text)or df),0,255)end
SetC(C3(g(rb,c0.R*255),g(gb,c0.G*255),g(bb,c0.B*255)))Pr()end
rb.FocusLost:Connect(rgbc)gb.FocusLost:Connect(rgbc)bb.FocusLost:Connect(rgbc)
od.MouseButton1Click:Connect(function()SetC(old)end)
local rch={}
for i=1,8 do local b=N("TextButton",{Size=UDim2.fromOffset(19,18),BackgroundColor3=C3(30,30,30),BorderSizePixel=0,Text="",AutoButtonColor=false},rrow)N("UIStroke",{Color=C3(70,70,70),Transparency=.4},b)
b.MouseButton1Click:Connect(function()if Rec[i]then SetC(Rec[i])end end)rch[i]=b end
local function rr()for i,b in ipairs(rch)do b.BackgroundColor3=Rec[i]or C3(30,30,30)end end
table.insert(RU,rr)rr()
for _,pc in ipairs(PRE)do local b=N("TextButton",{Size=UDim2.fromOffset(19,18),BackgroundColor3=pc,BorderSizePixel=0,Text="",AutoButtonColor=false},prow)N("UIStroke",{Color=C3(70,70,70),Transparency=.4},b)
b.MouseButton1Click:Connect(function()SetC(pc)Pr()end)end
end
local open=false
sw.MouseButton1Click:Connect(function()open=not open
if open then old=c0 rd()pn.Visible=true T:Create(pn,TweenInfo.new(.2,Enum.EasingStyle.Quad),{Size=UDim2.new(1,0,0,PH)}):Play()
else PushRec(c0)local tw=T:Create(pn,TweenInfo.new(.15),{Size=UDim2.new(1,0,0,0)})tw:Play()tw.Completed:Once(function()if not open then pn.Visible=false end end)end end)
Rg(k,function()return c0 end,function(x)if lk and ini then return end if typeof(x)=="Color3"then SetC(x)end end,"c")cm()ini=true if lk then LO(hd)end end
local function Bn(p,t,f)local b=Bt(p,t,UDim2.new(1,0,0,30),nil,C3(30,30,30))b.LayoutOrder=O(p)b.MouseButton1Click:Connect(f)return b end
local function Tx(p,ph)local r=Rw(p,32)return N("TextBox",{Size=UDim2.new(1,-12,1,-10),Position=UDim2.fromOffset(6,5),BackgroundColor3=C3(35,35,35),BorderSizePixel=0,Text="",PlaceholderText=ph,PlaceholderColor3=C3(120,120,120),TextColor3=C3(225,225,225),TextSize=11,Font=Cd,ClearTextOnFocus=false,TextXAlignment=XL,TextTruncate=Enum.TextTruncate.AtEnd},r)end
-- ===== TAB CONTENT =====
local MODES=PREMIUM and{"Smooth","Snap","Legit","Predictive","Closest"}or{"Smooth","Snap"}
local DESC={Smooth="Glides onto the target. Low Smoothness = strong lock, high = light pull.",Snap="Instant hard lock on the target nearest your cursor.",Legit="Slow ramp-up plus a tiny human wobble.",Predictive="Leads moving targets using their velocity.",Closest="Locks the physically closest target (ignores FOV)."}
do -- MAIN
Sec(MPL,"AIMBOT")Tg(MPL,"Aimbot","AimEnabled",false)
local DS
Dd(MPL,"Mode","AimMode",MODES,"Smooth",false,function(v)if DS then DS.Text=DESC[v]or""end end)
DS=L(MPL,DESC.Smooth,UDim2.new(1,0,0,0),nil,C3(150,150,150))DS.AutomaticSize=Enum.AutomaticSize.Y DS.TextWrapped=true DS.TextTruncate=Enum.TextTruncate.None DS.TextSize=10 DS.LayoutOrder=O(MPL)
Sec(MPL,"TARGETING")
Dd(MPL,"Aim Key","AimKey",{"Right Mouse","Left Mouse","Always On","Screen Button"},Mob and"Screen Button"or"Right Mouse",false)
Dd(MPL,"Aim Part","AimPart",PREMIUM and{"Head","Torso","Auto"}or{"Head","Torso"},"Head",false)
Tg(MPL,"Target Players","AimPlayers",true)
Tg(MPL,"Target Bots (NPCs)","AimNPC",true)
Tg(MPL,"Team Check","AimTeamCheck",true)Tg(MPL,"Wall Check","AimWallCheck",true)
Sec(MPR,"TUNING")
Sl(MPR,"Smoothness (0=lock)","AimSmooth",0,100,20)
Sl(MPR,"Max Distance","AimDistance",50,5000,2000)
LK=not PREMIUM
Sl(MPR,"Prediction (s)","AimPredict",0,.5,.1,2)
Sl(MPR,"Humanize (Legit)","AimHumanize",0,100,30)
Tg(MPR,"Sticky Target","AimSticky",true)
LK=false
end
do -- VISUALS
Sec(VPL,"ESP")Tg(VPL,"ESP","EspEnabled",false)
LK=not PREMIUM
Dd(VPL,"ESP Type","EspTypes",{"Box ESP","Head ESP","Circle ESP"},{"Box ESP"},true)
LK=false
Tg(VPL,"Team Check","EspTeamCheck",true)Tg(VPL,"ESP Players","EspPlayers",true)Tg(VPL,"Scale With Distance","EspScale",true)
LK=not PREMIUM
Tg(VPL,"ESP Bots (NPCs)","EspNPC",true)
LK=false
Cp(VPL,"ESP Color","EspColor",C3(255,60,60))
Sl(VPL,"Max Distance","EspDistance",100,5000,1500)
Sl(VPL,"Line Thickness","EspThickness",1,5,1)
Sl(VPL,"Transparency","EspTransparency",0,.9,0,2)
Sl(VPL,"Box Scale","EspBoxScale",.5,1.5,1,2)
LK=not PREMIUM
Sl(VPL,"Head Size","EspHeadSize",5,25,10)
Sl(VPL,"Circle Scale","EspCircleScale",.5,2,1,2)
LK=false
Sec(VPL,"FOV CIRCLE")Tg(VPL,"Show FOV","FovEnabled",false)
Tg(VPL,"Fix FOV To Center","FovCenter",Mob)
LK=not PREMIUM
Dd(VPL,"Shape","FovShape",{"Circle Fov","Square Fov"},"Circle Fov",false)
Dd(VPL,"Animation","FovAnim",{"None","Pulse","Fade","Spin","Rainbow"},"None",false)
LK=false
Cp(VPL,"FOV Color","FovColor",C3(255,255,255))
LK=not PREMIUM
Cp(VPL,"Locked Color","FovLockedColor",C3(80,255,120))
LK=false
Sl(VPL,"Radius","FovRadius",30,600,150)
Sl(VPL,"Thickness","FovThickness",1,6,1)
LK=not PREMIUM
Sl(VPL,"Fade (transp.)","FovFade",0,.95,.1,2)
Sl(VPL,"Animation Speed","FovAnimSpeed",.2,5,1,1)
Sl(VPL,"Pulse Amount","FovPulseAmount",0,60,15)
Tg(VPL,"Filled","FovFilled",false)
Sl(VPL,"Fill Transparency","FovFillTransparency",.5,.98,.9,2)
LK=false
Sec(VPR,"HEALTH BAR")Tg(VPR,"Health Bar","EspHealth",true)
Dd(VPR,"Position","EspHealthPos",PREMIUM and{"Left","Right","Top","Bottom"}or{"Left","Right"},"Left",false)
LK=not PREMIUM
Sl(VPR,"Bar Width","EspHealthWidth",2,10,3)
Sl(VPR,"Gap From Box","EspHPGap",0,12,3)
Cp(VPR,"Bar Background","EspHPBack",C3(20,20,20))
Sl(VPR,"Background Transp.","EspHPBackT",0,1,.35,2)
Sec(VPR,"HEALTH COLORS")
Dd(VPR,"Color Mode","EspHPMode",{"Gradient","Steps","Solid"},"Gradient",false)
Cp(VPR,"Low Health","EspHPLow",C3(255,60,60))
Cp(VPR,"Mid Health","EspHPMid",C3(255,200,50))
Cp(VPR,"High Health","EspHPHigh",C3(80,255,120))
Sec(VPR,"BAR OUTLINE")Tg(VPR,"Outline","EspHPOutline",true)
Cp(VPR,"Outline Color","EspHPOutlineColor",C3(0,0,0))
Sl(VPR,"Outline Thickness","EspHPOutlineThick",.5,4,1,1)
Sec(VPR,"HEALTH TEXT")Tg(VPR,"Show Text","EspHPText",false)
Dd(VPR,"Format","EspHPTextFmt",{"Number","Percent","Current/Max"},"Number",false)
Dd(VPR,"Text Position","EspHPTextPos",{"Beside Bar","On Fill","Above Box","Below Box"},"Beside Bar",false)
Dd(VPR,"Font","EspHPTextFont",{"Code","Gotham","Arial","Source Sans"},"Code",false)
Sl(VPR,"Text Size","EspHPTextSize",8,20,11)
Sl(VPR,"Text Transparency","EspHPTextTransp",0,.9,0,2)
Tg(VPR,"Match Health Color","EspHPTextMatch",false)
Cp(VPR,"Text Color","EspHPTextColor",C3(255,255,255))
Sec(VPR,"TEXT OUTLINE")Tg(VPR,"Text Outline","EspHPTextOutline",true)
Cp(VPR,"Outline Color ","EspHPTextOutlineColor",C3(0,0,0))
Sl(VPR,"Outline Thickness ","EspHPTextOutlineThick",.5,3,1,1)
LK=false
end
local TMk
do -- SETTINGS + CONFIGS (unlimited + sharing in both builds)
Sec(SPL,"UI")
Tg(SPL,"Show Previews","UiPrev",true,function()PV()end)
Sl(SPL,"UI Scale","UiScale",.4,1.3,Mob and .8 or 1,2,function()PV()end)
Sl(SPL,"UI Transparency","UiT",0,.9,.2,2,function(v)M.BackgroundTransparency=v Bd.BackgroundTransparency=.15+v*.85 for _,p in ipairs(PA)do p.BackgroundTransparency=v end end)
Cp(SPL,"UI Background","UiBg",C3(0,0,0),function(c)M.BackgroundColor3=c for _,p in ipairs(PA)do p.BackgroundColor3=c end if TMk then TMk.BackgroundColor3=c end end)
Cp(SPL,"UI Accent","UiAcc",A,function(c)A=c AT()end)
Sec(SPR,"CONFIGS")
local Cf,CD,St={}
local function Nt(t)if St then St.Text=t end end
local function Trim(s)return(s:gsub("^%s+",""):gsub("%s+$",""))end
local function Snap()local d={}for k,f in pairs(F)do local v=f[1]()
if f[3]=="c"then d[k]={math.floor(v.R*255+.5),math.floor(v.G*255+.5),math.floor(v.B*255+.5)}
elseif f[3]=="m"then local c={}for a,b in pairs(v)do c[a]=b end d[k]=c else d[k]=v end end return d end
local function Ap(d)for k,v in pairs(d)do local f=F[k]if f then pcall(function()if f[3]=="c"then f[2](Color3.fromRGB(v[1],v[2],v[3]))else f[2](v)end end)end end end
local PF="NOIR1:"
local function Dec(t)t=Trim(t)if t:sub(1,#PF)==PF then t=t:sub(#PF+1)end
local ok,d=pcall(function()return H:JSONDecode(t)end)if ok and type(d)=="table"then return d end end
local function Rf()local n={}for k in pairs(Cf)do table.insert(n,k)end table.sort(n)CD.SetOptions(n)end
local NB=Tx(SPR,"Config name...")
Bn(SPR,"Create Config",function()local n=Trim(NB.Text)if n==""then Nt("Type a config name first.")return end Cf[n]=Snap()Rf()CD.Set(n)Nt("Created '"..n.."'.")end)
CD=Dd(SPR,"Saved",nil,{},"",false)
Bn(SPR,"Load Selected",function()local s=CD.Get()if Cf[s]then Ap(Cf[s])Nt("Loaded '"..s.."'.")else Nt("No config selected.")end end)
Bn(SPR,"Save (overwrite)",function()local s=CD.Get()if Cf[s]then Cf[s]=Snap()Nt("Saved '"..s.."'.")else Nt("No config selected.")end end)
Bn(SPR,"Delete Selected",function()local s=CD.Get()if Cf[s]then Cf[s]=nil Rf()Nt("Deleted '"..s.."'.")else Nt("No config selected.")end end)
St=L(SPR,"",UDim2.new(1,0,0,28),nil,C3(150,150,150))St.TextSize=10 St.TextWrapped=true St.TextTruncate=Enum.TextTruncate.None St.LayoutOrder=O(SPR)
Sec(SPL,"SHARE")
local EB=Tx(SPL,"Exported config appears here")
Bn(SPL,"Copy Config (selected/current)",function()local c=PF..H:JSONEncode(Cf[CD.Get()]or Snap())EB.Text=c
local ok,cl=pcall(function()return setclipboard end)local cp=false if ok and type(cl)=="function"then cp=pcall(cl,c)end
pcall(function()EB:CaptureFocus()EB.CursorPosition=#c+1 EB.SelectionStart=1 end)
Nt(cp and"Copied to clipboard."or"Config is in the box on the left - press Ctrl+C.")end)
local IB=Tx(SPL,"Paste a friend's config here")
Bn(SPL,"Import Config",function()local d=Dec(IB.Text)if not d then Nt("That config code isn't valid.")return end Ap(d)
local n=Trim(NB.Text)if n~=""then Cf[n]=Snap()Rf()CD.Set(n)Nt("Imported and saved as '"..n.."'.")else Nt("Imported! (type a name on the right to also save it)")end end)
end
-- OPEN / CLOSE
local Fl=Bt(G,"NoirHUB",UDim2.fromOffset(90,28),UDim2.new(0,20,.5,0),C3(0,0,0))Fl.BackgroundTransparency=.15 Fl.Visible=false Fl.Active=true Drag(Fl)
local function Op(o)M.Visible=o Fl.Visible=not o end
X.MouseButton1Click:Connect(function()Op(false)end)Fl.MouseButton1Click:Connect(function()Op(true)end)
U.InputBegan:Connect(function(i,g)if not g and i.KeyCode==Enum.KeyCode.RightShift then Op(not M.Visible)end end)
-- SHARED HELPERS
local function Rt(ch)return ch:FindFirstChild("HumanoidRootPart")or ch.PrimaryPart or ch:FindFirstChild("Torso")or ch:FindFirstChild("UpperTorso")or ch:FindFirstChildWhichIsA("BasePart")end
local function Tor(ch)return ch:FindFirstChild("UpperTorso")or ch:FindFirstChild("Torso")or Rt(ch)end
local function Hm(ch)local hm=ch and ch:FindFirstChildOfClass("Humanoid")
if hm and hm.Health>0 and hm:GetState()~=Enum.HumanoidStateType.Dead and ch.Parent and Rt(ch)then return hm end end
local function Tm(p)return LP.Team~=nil and p.Team==LP.Team end
local function Ct2()if S.FovCenter then local v=Cam.ViewportSize return Vector2.new(v.X/2,v.Y/2)end return U:GetMouseLocation()end
local function WP(p)return Cam:WorldToViewportPoint(p)end
-- NPC / bot cache + entity list (players and NPCs, refreshed every 0.4s)
local NPC={}
local function addN(i)if i:IsA("Humanoid")then local m=i.Parent if m and m:IsA("Model")and not P:GetPlayerFromCharacter(m)then NPC[m]=i end end end
for _,d in ipairs(W:GetDescendants())do addN(d)end
W.DescendantAdded:Connect(function(i)if i:IsA("Humanoid")then task.defer(addN,i)end end)
W.DescendantRemoving:Connect(function(i)if i:IsA("Humanoid")and i.Parent then NPC[i.Parent]=nil end end)
local EC={t=0,l={}}
local function Alive(e)local h=e.hum return h.Parent==e.ch and h.Health>0 and e.ch.Parent~=nil end
local function RF()local l={}
for _,pl in ipairs(P:GetPlayers())do if pl~=LP then local hm=Hm(pl.Character)if hm then l[#l+1]={ch=pl.Character,hum=hm,key=pl,pl=pl}end end end
for m in pairs(NPC)do if not m.Parent then NPC[m]=nil elseif m~=LP.Character and not P:GetPlayerFromCharacter(m)then local hm=Hm(m)if hm then l[#l+1]={ch=m,hum=hm,key=m}end end end
EC.l=l end
local function Ents(pl,np)local t=os.clock()if t-EC.t>.4 then EC.t=t RF()end
local o={}for _,e in ipairs(EC.l)do local want=e.pl and pl or(not e.pl and np)if want and Alive(e)then o[#o+1]=e end end return o end
-- FOV
local FF=N("Frame",{AnchorPoint=Vector2.new(.5,.5),BackgroundTransparency=1,BorderSizePixel=0,Visible=false},Ov)
local FC=N("UICorner",{CornerRadius=UDim.new(.5,0)},FF)
local FS=N("UIStroke",{ApplyStrokeMode=Enum.ApplyStrokeMode.Border},FF)
local function FA(sc,lk)local t=os.clock()*S.FovAnimSpeed local r=S.FovRadius*sc local col=lk and S.FovLockedColor or S.FovColor local fd=S.FovFade local ro=0 local a=S.FovAnim
if a=="Pulse"then r=r+math.sin(t*3)*S.FovPulseAmount*sc elseif a=="Fade"then fd=fd+(.95-fd)*(math.sin(t*3)+1)/2 elseif a=="Spin"then ro=t*90%360 elseif a=="Rainbow"then col=Color3.fromHSV(t*.2%1,1,1)end
return r,col,fd,ro end
local function SF(f,c,s,x,y,r,col,fd,ro)local sq=S.FovShape=="Square Fov"
f.Position=UDim2.fromOffset(x,y)f.Size=UDim2.fromOffset(r*2,r*2)f.Rotation=sq and ro or 0 c.CornerRadius=UDim.new(sq and 0 or .5,0)
s.Color=col s.Thickness=S.FovThickness s.Transparency=math.clamp(fd,0,1)
if S.FovFilled then f.BackgroundColor3=col f.BackgroundTransparency=S.FovFillTransparency else f.BackgroundTransparency=1 end end
-- ESP
local FNT={Code=Enum.Font.Code,Gotham=Enum.Font.GothamBold,Arial=Enum.Font.ArialBold,["Source Sans"]=Enum.Font.SourceSansBold}
local function HC(f)local m=S.EspHPMode
if m=="Solid"then return S.EspHPHigh elseif m=="Steps"then return f<.34 and S.EspHPLow or(f<.67 and S.EspHPMid or S.EspHPHigh)end
if f<.5 then return S.EspHPLow:Lerp(S.EspHPMid,f*2)end return S.EspHPMid:Lerp(S.EspHPHigh,(f-.5)*2)end
local E={}
local function NE(par)local d={}
local function mk(r)local f=N("Frame",{AnchorPoint=Vector2.new(.5,.5),BackgroundTransparency=1,BorderSizePixel=0,Visible=false},par)if r then Rd(f)end return f,N("UIStroke",{ApplyStrokeMode=Enum.ApplyStrokeMode.Border},f)end
d.B,d.BS=mk()d.H,d.HS=mk(1)d.C,d.CS=mk(1)
d.HB=N("Frame",{BorderSizePixel=0,Visible=false},par)d.HBS=N("UIStroke",{ApplyStrokeMode=Enum.ApplyStrokeMode.Border},d.HB)
d.HF=N("Frame",{BorderSizePixel=0,Visible=false},par)
d.HT=N("TextLabel",{AnchorPoint=Vector2.new(.5,.5),BackgroundTransparency=1,Visible=false,Text="",TextColor3=Color3.new(1,1,1)},par)d.HTS=N("UIStroke",{},d.HT)
return d end
local function Hd(d)d.B.Visible=false d.H.Visible=false d.C.Visible=false d.HB.Visible=false d.HF.Visible=false d.HT.Visible=false end
local function HBr(d,f,bx,by,bw,bh,hv,mh,k)k=k or 1
if not S.EspHealth then d.HB.Visible=false d.HF.Visible=false d.HT.Visible=false return end
f=math.clamp(f,0,1)local t,g,pos=math.max(1,math.floor(S.EspHealthWidth*k+.5)),math.floor(S.EspHPGap*k+.5),S.EspHealthPos local x,y,w,h
if pos=="Left"then x,y,w,h=bx-g-t,by,t,bh elseif pos=="Right"then x,y,w,h=bx+bw+g,by,t,bh elseif pos=="Top"then x,y,w,h=bx,by-g-t,bw,t else x,y,w,h=bx,by+bh+g,bw,t end
d.HB.BackgroundColor3=S.EspHPBack d.HB.BackgroundTransparency=S.EspHPBackT
d.HBS.Enabled=S.EspHPOutline d.HBS.Color=S.EspHPOutlineColor d.HBS.Thickness=math.max(.5,S.EspHPOutlineThick*k)
d.HB.Position=UDim2.fromOffset(x,y)d.HB.Size=UDim2.fromOffset(w,h)
local vert=pos=="Left"or pos=="Right"
if vert then d.HF.Position=UDim2.fromOffset(x,y+h*(1-f))d.HF.Size=UDim2.fromOffset(w,h*f)else d.HF.Position=UDim2.fromOffset(x,y)d.HF.Size=UDim2.fromOffset(w*f,h)end
local col=HC(f)d.HF.BackgroundColor3=col d.HB.Visible=true d.HF.Visible=true
if S.EspHPText and(bh>=60 or k==1)then
local fm=S.EspHPTextFmt local tx=fm=="Percent"and(math.floor(f*100+.5).."%")or(fm=="Current/Max"and(math.floor(hv).."/"..math.floor(mh))or tostring(math.floor(hv)))
local sz=math.max(8,math.floor(S.EspHPTextSize*math.clamp(k,.7,1)+.5))
d.HT.Text=tx d.HT.TextSize=sz d.HT.Font=FNT[S.EspHPTextFont]or Cd d.HT.TextTransparency=S.EspHPTextTransp
d.HT.TextColor3=S.EspHPTextMatch and col or S.EspHPTextColor
d.HTS.Enabled=S.EspHPTextOutline d.HTS.Color=S.EspHPTextOutlineColor d.HTS.Thickness=S.EspHPTextOutlineThick
local tw=d.HT.TextBounds.X d.HT.Size=UDim2.fromOffset(tw+4,sz+2)
local pp,tx_,ty_=S.EspHPTextPos
if pp=="Beside Bar"then
if pos=="Left"then tx_=x-3-tw/2 ty_=math.clamp(y+h*(1-f),y,y+h)
elseif pos=="Right"then tx_=x+w+3+tw/2 ty_=math.clamp(y+h*(1-f),y,y+h)
elseif pos=="Top"then tx_=x+w*f ty_=y-3-sz/2 else tx_=x+w*f ty_=y+h+3+sz/2 end
elseif pp=="On Fill"then if vert then tx_=x+w/2 ty_=y+h*(1-f/2)else tx_=x+w*f/2 ty_=y+h/2 end
elseif pp=="Above Box"then tx_=bx+bw/2 ty_=by-sz/2-3-(pos=="Top"and t+g or 0)
else tx_=bx+bw/2 ty_=by+bh+sz/2+3+(pos=="Bottom"and t+g or 0)end
d.HT.Position=UDim2.fromOffset(tx_,ty_)d.HT.Visible=true
else d.HT.Visible=false end end
local function BPt(ch)local hd,rt,hm=ch:FindFirstChild("Head"),Rt(ch),ch:FindFirstChildOfClass("Humanoid")
if not rt then return end
if not(hd and hd:IsA("BasePart"))then hd={Position=rt.Position+Vector3.new(0,rt.Size.Y/2,0),Size=Vector3.new(1,1,1)}end
local ft=(hm and hm.RigType==Enum.HumanoidRigType.R6)and 3 or(rt.Size.Y/2+(hm and hm.HipHeight or 2))
return hd.Position+Vector3.new(0,hd.Size.Y/2,0),rt.Position-Vector3.new(0,ft,0),rt.Position,hd.Position end
local function Dw(d,pr,tp,ft,ct,hp,ty,f,hv,mh,vs)local a,b,c=pr(tp),pr(ft),pr(ct)
if a.Z<=0 or b.Z<=0 then return false end
local h=math.abs(b.Y-a.Y)if not(h>=4)then return false end
local w=h*.5 local cx,cy=math.floor(c.X+.5),math.floor((a.Y+b.Y)/2+.5)
local k=S.EspScale and math.clamp(h/150,.4,1)or 1
local sc=S.EspBoxScale local bw,bh=math.floor(w*sc/2+.5)*2,math.floor(h*sc/2+.5)*2
if vs and(cx+bw<0 or cx-bw>vs.X or cy+bh<0 or cy-bh>vs.Y)then return false end
local th=S.EspThickness*math.clamp(k,.6,1)
d.BS.Color=S.EspColor d.BS.Thickness=th d.BS.Transparency=S.EspTransparency
d.HS.Color=S.EspColor d.HS.Thickness=th d.HS.Transparency=S.EspTransparency
d.CS.Color=S.EspColor d.CS.Thickness=th d.CS.Transparency=S.EspTransparency
d.B.Size=UDim2.fromOffset(bw,bh)d.B.Position=UDim2.fromOffset(cx,cy)d.B.Visible=ty["Box ESP"]==true
local p=pr(hp)
if ty["Head ESP"]and p.Z>0 then local z=math.max(math.floor(h*.13*S.EspHeadSize/10+.5),3)d.H.Size=UDim2.fromOffset(z,z)d.H.Position=UDim2.fromOffset(math.floor(p.X+.5),math.floor(p.Y+.5))d.H.Visible=true else d.H.Visible=false end
local dm=math.floor(math.max(w,h)*S.EspCircleScale+.5)d.C.Size=UDim2.fromOffset(dm,dm)d.C.Position=UDim2.fromOffset(cx,cy)d.C.Visible=ty["Circle ESP"]==true
HBr(d,f,cx-bw/2,cy-bh/2,bw,bh,hv,mh,k)
return true end
local function Kill(d)for _,o in ipairs{d.B,d.H,d.C,d.HB,d.HF,d.HT}do o:Destroy()end end
P.PlayerRemoving:Connect(function(p)local d=E[p]if d then Kill(d)E[p]=nil end end)
local EOn,FR=false,0
local function UE()
if not S.EspEnabled then if EOn then EOn=false for _,d in pairs(E)do Hd(d)end end return end
EOn=true FR=FR+1 local ty=S.EspTypes or{}local vs=Cam.ViewportSize local cp=Cam.CFrame.Position
for _,e in ipairs(Ents(S.EspPlayers,S.EspNPC))do
local d=E[e.key]local ok=false
if not(e.pl and S.EspTeamCheck and Tm(e.pl))then
local tp,ft,ct,hp=BPt(e.ch)
if tp and(cp-ct).Magnitude<=S.EspDistance then
if not d then d=NE(Ov)E[e.key]=d end
local hm=e.hum local mh=hm.MaxHealth if mh~=mh or mh<1 or mh>1e6 then mh=100 end
local hv=hm.Health if hv~=hv or hv>1e6 then hv=mh end
ok=Dw(d,WP,tp,ft,ct,hp,ty,math.clamp(hv/mh,0,1),hv,mh,vs)end end
if d then d.fr=FR if not ok then Hd(d)end end end
for k,d in pairs(E)do if d.fr~=FR then if typeof(k)=="Instance"and k.Parent==P then Hd(d)else Kill(d)E[k]=nil end end end end
-- AIMBOT (works on players and NPCs)
local MC={Smooth={},Snap={sn=1},Legit={lg=1},Predictive={pr=1},Closest={nr=1}}
local Lk,Lp,sT,gT,lT,sp=nil,nil,1,0,0,nil
local RPm=RaycastParams.new()RPm.FilterType=Enum.RaycastFilterType.Exclude RPm.RespectCanCollide=true
-- pull per frame from Smoothness: 0 = hard lock, 100 = light pull. Time based, so it feels the same at any FPS.
local function PL(cf,dt)local sm=S.AimSmooth if cf.sn or sm<=1 then return 1 end return 1-math.exp(-dt/((sm/100)^2*2))end
-- on-screen hold button (mobile): Aim Key = Screen Button
local AX={i=nil}
AX.b=Bt(G,"AIM",UDim2.fromOffset(64,64),UDim2.new(1,-100,.45,0),C3(0,0,0))AX.b.BackgroundTransparency=.25 AX.b.Visible=false AX.b.TextSize=14 N("UIStroke",{Color=C3(65,65,65)},AX.b)
AX.b.InputBegan:Connect(function(i)if isP(i)then AX.i=i end end)
U.InputEnded:Connect(function(i)if i==AX.i then AX.i=nil end end)
local function KD()local k=S.AimKey if k=="Always On"then return true end if k=="Screen Button"then return AX.i~=nil end return U:IsMouseButtonPressed(k=="Left Mouse"and MB or Enum.UserInputType.MouseButton2)end
local function Pts(ch)local ap=S.AimPart local hd,to=ch:FindFirstChild("Head"),Tor(ch)local l={}
if hd and not hd:IsA("BasePart")then hd=nil end
if ap=="Head"then l[1]=hd or to elseif ap=="Torso"then l[1]=to or hd else if hd then l[#l+1]=hd end if to then l[#l+1]=to end end
if not l[1]then l[1]=Rt(ch)end return l end
local function Vs(pt,ch)local o=Cam.CFrame.Position local r=W:Raycast(o,pt.Position-o,RPm)return r==nil or r.Instance:IsDescendantOf(ch)end
local function Pick(e,parts)for _,p in ipairs(parts)do if p.Parent then local v=WP(p.Position)if v.Z>0 and(not S.AimWallCheck or Vs(p,e.ch))then return p end end end end
local function Eval(e,cf,c,sl)
if e.pl and S.AimTeamCheck and Tm(e.pl)then return end
local parts=Pts(e.ch)local p1=parts[1]if not p1 then return end
local wd=(Cam.CFrame.Position-p1.Position).Magnitude
if wd>S.AimDistance then return end
local v=WP(p1.Position)if v.Z<=0 then return end
local sd=(Vector2.new(v.X,v.Y)-c).Magnitude
if not cf.nr and sd>S.FovRadius*sl then return end
return sd,wd,parts end
local function FT(cf,c)RPm.FilterDescendantsInstances={LP.Character}
local list={}
for _,e in ipairs(Ents(S.AimPlayers,S.AimNPC))do local sd,wd,parts=Eval(e,cf,c,1)
if sd then local sc=cf.nr and wd or sd if e==Lk then sc=sc*.75 end list[#list+1]={e,sc,parts}end end
table.sort(list,function(a,b)return a[2]<b[2]end)
for i=1,math.min(#list,4)do local x=list[i]local p=Pick(x[1],x[3])if p then return x[1],p end end end
local function UA(dt)dt=math.min(dt,.1)
local hc=LP.Character local mh=hc and hc:FindFirstChildOfClass("Humanoid")
if not S.AimEnabled or not KD()or not(mh and mh.Health>0)then Lk,Lp,sp=nil,nil,nil sT=1 gT=0 lT=0 return end
local cf=MC[S.AimMode]or MC.Smooth local c=Ct2()
sT=sT+dt
if Lk and not(Alive(Lk)and Lp and Lp.Parent)then Lk,Lp,sp=nil,nil,nil end
if Lk and S.AimSticky and not cf.nr then
if sT>.2 then sT=0 RPm.FilterDescendantsInstances={hc}
local sd,_,parts=Eval(Lk,cf,c,1.5)local p=sd and Pick(Lk,parts)
if p then Lp=p gT=0 else gT=gT+.2 if gT>.5 then Lk,Lp,sp=nil,nil,nil gT=0 end end end
elseif sT>.15 then sT=0 local e,p=FT(cf,c)
if e~=Lk then lT=0 sp=nil end Lk,Lp=e,p end
if not Lk then lT=0 return end
lT=lT+dt
-- low-pass the target position so network steps (NPCs/players) don't jitter the camera
sp=sp and sp:Lerp(Lp.Position,1-math.exp(-dt*40))or Lp.Position
local ap=sp local cp=Cam.CFrame.Position
if cf.pr then local v=Lp.AssemblyLinearVelocity if v.Magnitude>80 then v=v.Unit*80 end ap=ap+v*((cp-ap).Magnitude/700+S.AimPredict)end
if cf.lg then local a,t=S.AimHumanize/100*.4,os.clock()ap=ap+Cam.CFrame.RightVector*math.sin(t*3.1)*a+Cam.CFrame.UpVector*math.cos(t*2.3)*a end
local dir=ap-cp if dir.Magnitude<.5 then return end
local d=dir.Unit local hz=Vector3.new(d.X,0,d.Z)if hz.Magnitude<.02 then return end
local y=math.clamp(d.Y,-.97,.97)d=hz.Unit*math.sqrt(1-y*y)+Vector3.new(0,y,0)
local ang=math.acos(math.clamp(Cam.CFrame.LookVector:Dot(d),-1,1))
if ang<.0009 then return end
local tt=PL(cf,dt)if cf.lg then tt=tt*math.clamp(lT/.35,.2,1)end
Cam.CFrame=Cam.CFrame:Lerp(CFrame.lookAt(cp,cp+d),tt)end
local function UF()if not S.FovEnabled then FF.Visible=false return end
local c=Ct2()local r,col,fd,ro=FA(1,Lk~=nil)FF.Visible=true SF(FF,FC,FS,c.X,c.Y,r,col,fd,ro)end
-- ===== PREVIEWS =====
local function AA(cf)return PL(cf,1/60)end
local uc=function()end
do -- AIM PREVIEW (FREE + PREMIUM)
local ap=Pn("Main","R",150,"AIM PREVIEW")local as=Ar(ap,24,100)
local ring=N("Frame",{AnchorPoint=Vector2.new(.5,.5),BackgroundTransparency=1,BorderSizePixel=0},as)Rd(ring)N("UIStroke",{Color=C3(255,255,255),Transparency=.6},ring)
local trail={}for i=1,8 do trail[i]=N("Frame",{Size=UDim2.fromOffset(3,3),AnchorPoint=Vector2.new(.5,.5),BorderSizePixel=0,BackgroundColor3=Color3.new(1,1,1)},as)end
local dot=N("Frame",{Size=UDim2.fromOffset(9,9),AnchorPoint=Vector2.new(.5,.5),BorderSizePixel=0},as)
local cr=N("Frame",{Size=UDim2.fromOffset(13,13),AnchorPoint=Vector2.new(.5,.5),BackgroundTransparency=1},as)
local c1=N("Frame",{Size=UDim2.new(1,0,0,1),Position=UDim2.fromScale(0,.5),BorderSizePixel=0},cr)
local c2=N("Frame",{Size=UDim2.new(0,1,1,0),Position=UDim2.fromScale(.5,0),BorderSizePixel=0},cr)
local lb=L(ap,"",UDim2.new(1,-12,0,18),UDim2.fromOffset(6,128),C3(150,150,150))lb.TextSize=10
local cp,lk,fk,hist=Vector2.new(60,60),false,0,{}
local function ua(dt)local sz=LS(as)local t=os.clock()local k=sz.X/600
local tp=Vector2.new(sz.X/2+math.cos(t*.9)*sz.X*.34,sz.Y/2+math.sin(t*1.4)*sz.Y*.3)
local mp=Vector2.new(sz.X/2+math.cos(t*.5+2)*sz.X*.3,sz.Y/2+math.sin(t*.7+1)*sz.Y*.3)
local cf=MC[S.AimMode]or MC.Smooth
local inr=cf.nr or(tp-cp).Magnitude<=S.FovRadius*k
if inr and not lk then fk=.14 end lk=inr
local act=inr
local a=AA(cf)if cf.lg then a=a*.6 end
local tg=mp
if act then tg=tp if cf.pr then tg=tg+Vector2.new(-math.sin(t*.9)*.9*sz.X*.34,math.cos(t*1.4)*1.4*sz.Y*.3)*.25 end end
cp=cp:Lerp(tg,act and 1-(1-a)^(math.min(dt,.1)*60)or .25)
table.insert(hist,1,cp)if #hist>8 then table.remove(hist)end
for i,tr in ipairs(trail)do local hp=hist[i]if hp then tr.Position=UDim2.fromOffset(hp.X,hp.Y)tr.BackgroundTransparency=.3+i*.08 tr.Visible=true else tr.Visible=false end end
local gc=act and C3(80,255,120)or C3(255,70,70)
local jz=cf.lg and S.AimHumanize/100*5 or 0
dot.Position=UDim2.fromOffset(tp.X,tp.Y)dot.BackgroundColor3=gc
cr.Position=UDim2.fromOffset(cp.X+math.sin(t*6.1)*jz,cp.Y+math.cos(t*4.7)*jz)c1.BackgroundColor3=act and gc or Color3.new(1,1,1)c2.BackgroundColor3=c1.BackgroundColor3
ring.Visible=not cf.nr ring.Position=UDim2.fromOffset(cp.X,cp.Y)ring.Size=UDim2.fromOffset(S.FovRadius*k*2,S.FovRadius*k*2)
lb.Text=string.format("%s  %s  pull %d%%",S.AimMode,act and"LOCKED"or"SEARCHING",math.floor(a*100))end
if PREMIUM then -- RESPONSE CURVE (PREMIUM)
local cpn=Pn("Main","R",100,"RESPONSE CURVE")local ca=Ar(cpn,24,50)
local bars={}for i=1,24 do bars[i]=N("Frame",{AnchorPoint=Vector2.new(0,1),Position=UDim2.new((i-1)/24,1,1,0),Size=UDim2.new(1/24,-2,.02,0),BorderSizePixel=0},ca)end
local cl=L(cpn,"",UDim2.new(1,-12,0,18),UDim2.fromOffset(6,78),C3(150,150,150))cl.TextSize=10
uc=function()local cf=MC[S.AimMode]or MC.Smooth local a=AA(cf)
for i,b in ipairs(bars)do local n=i*3
b.Size=UDim2.new(1/24,-2,math.max(1-(1-a)^n,.02),0)b.BackgroundColor3=A end
cl.Text=a>=1 and"instant lock"or string.format("90%% lock in ~%d ms",math.floor(math.log(.1)/math.log(1-a)/60*1000))end
end
PU.Main=function(dt)ua(dt)uc()end
end
-- ESP PREVIEW (FREE + PREMIUM)
local EP=Pn("Visuals","R",172,"ESP PREVIEW")local ea=Ar(EP,24,120)
local vf=N("ViewportFrame",{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,BorderSizePixel=0,Ambient=C3(170,170,170),LightColor=C3(210,210,210)},ea)
local vc=N("Camera",{FieldOfView=40},vf)vf.CurrentCamera=vc
local PD=NE(vf)local PM
local php=nil
local crow=N("Frame",{Size=UDim2.new(1,-10,0,20),Position=UDim2.fromOffset(5,148),BackgroundTransparency=1},EP)
N("UIListLayout",{FillDirection=Enum.FillDirection.Horizontal,Padding=UDim.new(0,3)},crow)
local chips={}
local function cr_()for _,c in ipairs(chips)do local on=php==c[2]c[1].BackgroundColor3=on and A or C3(30,30,30)c[1].TextColor3=on and Ct(A)or C3(200,200,200)end end
for _,x in ipairs{{"100",1},{"60",.6},{"25",.25},{"AUTO",nil}}do local b=Bt(crow,x[1],UDim2.new(.25,-3,1,0),nil,C3(30,30,30))b.TextSize=9
b.MouseButton1Click:Connect(function()php=x[2]cr_()end)table.insert(chips,{b,x[2]})end
OT(cr_)
local function PP(p)local o=vc.CFrame:PointToObjectSpace(p)local dp=-o.Z local sz=LS(vf)local t=math.tan(math.rad(20))
return Vector3.new((.5+o.X/(dp*t*sz.X/sz.Y)/2)*sz.X,(.5-o.Y/(dp*t)/2)*sz.Y,dp)end
local function BP()pcall(function()
if PM then PM:Destroy()PM=nil end
local m local ch=LP.Character
if ch then local ok,c=pcall(function()ch.Archivable=true return ch:Clone()end)if ok and c and c:FindFirstChild("Head")and c:FindFirstChild("HumanoidRootPart")then m=c end end
if m then
for _,d in ipairs(m:GetDescendants())do if d:IsA("BaseScript")or d:IsA("Tool")or d:IsA("Sound")then d:Destroy()end end
for _,d in ipairs(m:GetDescendants())do if d:IsA("BasePart")then d.Anchored=true end end
m.Parent=vf m:PivotTo(CFrame.new())
else
m=Instance.new("Model")
local function pt(n,sz,x,y,tr)N("Part",{Name=n,Size=sz,CFrame=CFrame.new(x,y,0),Anchored=true,CanCollide=false,Transparency=tr or 0,Color=C3(165,170,185),Material=Enum.Material.SmoothPlastic},m)end
pt("HumanoidRootPart",Vector3.new(2,2,1),0,3,1)pt("Torso",Vector3.new(2,2,1),0,3)pt("Head",Vector3.new(2,1,1),0,4.5)
pt("Left Arm",Vector3.new(1,2,1),-1.5,3)pt("Right Arm",Vector3.new(1,2,1),1.5,3)pt("Left Leg",Vector3.new(1,2,1),-.5,1)pt("Right Leg",Vector3.new(1,2,1),.5,1)
N("Humanoid",{RigType=Enum.HumanoidRigType.R6},m)m.Parent=vf end
PM=m
local tp,ft=BPt(m)local cy=(tp.Y+ft.Y)/2 local h=tp.Y-ft.Y
vc.CFrame=CFrame.lookAt(Vector3.new(0,cy,-h*2.2),Vector3.new(0,cy,0))end)end
task.spawn(function()if not LP.Character then LP.CharacterAdded:Wait()end task.wait(1.5)BP()end)
LP.CharacterAdded:Connect(function()task.wait(1.5)BP()end)
local function UPE()if not PM then return end
local tp,ft,ct,hp=BPt(PM)local f=php or(.55+.45*math.sin(os.clock()*1.2))
if not tp or not Dw(PD,PP,tp,ft,ct,hp,S.EspTypes or{},f,f*100,100)then Hd(PD)end end
local UPH,UPF=function()end,function()end
if PREMIUM then
-- HEALTH BAR PREVIEW (PREMIUM, right dock)
local HPn=Pn("Visuals","R",156,"HEALTH BAR")local ha=Ar(HPn,24,84)
local hd=NE(ha)
local ramp=N("Frame",{Size=UDim2.new(1,-10,0,10),Position=UDim2.fromOffset(5,112),BackgroundTransparency=1,BorderSizePixel=0,ClipsDescendants=true},HPn)
local rseg={}for i=1,24 do rseg[i]=N("Frame",{Size=UDim2.new(1/24,0,1,0),Position=UDim2.fromScale((i-1)/24,0),BorderSizePixel=0},ramp)end
local rl={}for i,nm in ipairs{"LOW","MID","HIGH"}do local l=L(HPn,nm,UDim2.new(1/3,-4,0,12),UDim2.new((i-1)/3,5,0,124),Color3.new(1,1,1),i==1 and XL or(i==2 and XC or XR))l.TextSize=9 rl[i]=l end
local hml=L(HPn,"",UDim2.new(1,-12,0,14),UDim2.fromOffset(6,138),C3(150,150,150))hml.TextSize=9
UPH=function()local sz=LS(ha)local f=.05+.95*(.5+.5*math.sin(os.clock()*.9))
local cx,cy=sz.X/2,sz.Y/2 local bw,bh=26,50
hd.B.Size=UDim2.fromOffset(bw,bh)hd.B.Position=UDim2.fromOffset(cx,cy)hd.B.Visible=true
hd.BS.Color=S.EspColor hd.BS.Thickness=S.EspThickness hd.BS.Transparency=S.EspTransparency
HBr(hd,f,cx-bw/2,cy-bh/2,bw,bh,f*100,100)
for i,sg in ipairs(rseg)do sg.BackgroundColor3=HC((i-.5)/24)end
rl[1].TextColor3=S.EspHPLow rl[2].TextColor3=S.EspHPMid rl[3].TextColor3=S.EspHPHigh
hml.Text=S.EspHPMode.."  bar "..S.EspHealthPos end
-- FOV PREVIEW (PREMIUM, LEFT dock)
local FP=Pn("Visuals","L",146,"FOV PREVIEW")local fs=Ar(FP,24,100)
local pf=N("Frame",{AnchorPoint=Vector2.new(.5,.5),BackgroundTransparency=1,BorderSizePixel=0},fs)
local pc=N("UICorner",{},pf)local ps=N("UIStroke",{ApplyStrokeMode=Enum.ApplyStrokeMode.Border},pf)
local dots={}
for i,q in ipairs{{.2,.3},{.7,.25},{.5,.7},{.85,.65},{.3,.82}}do local d=N("Frame",{Size=UDim2.fromOffset(7,7),AnchorPoint=Vector2.new(.5,.5),Position=UDim2.fromScale(q[1],q[2]),BackgroundColor3=C3(255,70,70),BorderSizePixel=0},fs)dots[i]={d,q}end
local cu=N("Frame",{Size=UDim2.fromOffset(5,5),AnchorPoint=Vector2.new(.5,.5),BackgroundColor3=Color3.new(1,1,1),BorderSizePixel=0},fs)
local fl_=L(FP,"",UDim2.new(1,-12,0,16),UDim2.fromOffset(6,128),C3(150,150,150))fl_.TextSize=9
UPF=function()local sz=LS(fs)local k=sz.X/600 local cx,cy=sz.X/2,sz.Y/2 local mx,my=cx,cy
if not S.FovCenter then local t=os.clock()mx=cx+math.cos(t*.8)*sz.X*.3 my=cy+math.sin(t*1.3)*sz.Y*.25 end
local br=S.FovRadius*k local lk,n=false,0
for _,d in ipairs(dots)do local dx,dy=d[2][1]*sz.X-mx,d[2][2]*sz.Y-my local ins=math.sqrt(dx*dx+dy*dy)<=br d[1].BackgroundColor3=ins and C3(80,255,120)or C3(255,70,70)if ins then lk=true n=n+1 end end
cu.Position=UDim2.fromOffset(mx,my)
local r,col,fd,ro=FA(k,lk)SF(pf,pc,ps,mx,my,r,col,fd,ro)
fl_.Text=string.format("%s  %s  in FOV %d",S.FovShape,S.FovAnim,n)end
-- THEME PREVIEW (PREMIUM)
local TPn=Pn("Settings","R",176,"THEME PREVIEW")local ta=Ar(TPn,24,146,true)
TMk=ta ta.BackgroundColor3=M.BackgroundColor3
local function mk(cl,pos,sz,txt,tc)return N("TextLabel",{Size=sz,Position=pos,BackgroundColor3=cl,BorderSizePixel=0,Text=txt or"",TextColor3=tc or C3(230,230,230),TextSize=10,Font=Cd},ta)end
local t1=mk(A,UDim2.fromOffset(6,6),UDim2.new(.5,-9,0,20),"Main")
mk(C3(24,24,24),UDim2.new(.5,3,0,6),UDim2.new(.5,-9,0,20),"Visuals")
local r1=mk(C3(20,20,20),UDim2.fromOffset(6,32),UDim2.new(1,-12,0,22),"  Toggle",C3(225,225,225))r1.TextXAlignment=XL
local tr=N("Frame",{Size=UDim2.fromOffset(24,12),Position=UDim2.new(1,-30,.5,-6),BorderSizePixel=0},r1)
N("Frame",{Size=UDim2.fromOffset(8,8),Position=UDim2.fromOffset(14,2),BackgroundColor3=C3(235,235,235),BorderSizePixel=0},tr)
local r2=mk(C3(20,20,20),UDim2.fromOffset(6,58),UDim2.new(1,-12,0,28),"  Slider",C3(220,220,220))r2.TextXAlignment=XL r2.TextYAlignment=Enum.TextYAlignment.Top
local bar=N("Frame",{Size=UDim2.new(1,-12,0,4),Position=UDim2.fromOffset(6,20),BackgroundColor3=C3(55,55,55),BorderSizePixel=0},r2)
local fl=N("Frame",{Size=UDim2.fromScale(.65,1),BorderSizePixel=0},bar)
local r3=mk(C3(20,20,20),UDim2.fromOffset(6,92),UDim2.new(1,-12,0,22),"  Dropdown",C3(225,225,225))r3.TextXAlignment=XL
local op=mk(C3(35,35,35),UDim2.new(.5,0,0,3),UDim2.new(.5,-4,1,-6),"Option  v",C3(200,200,200))op.Parent=r3
mk(C3(30,30,30),UDim2.fromOffset(6,120),UDim2.new(1,-12,0,22),"Button")
OT(function()t1.BackgroundColor3=A t1.TextColor3=Ct(A)tr.BackgroundColor3=A fl.BackgroundColor3=A end)
end
PU.Visuals=function()UPE()UPH()UPF()end
-- LOOP
R:BindToRenderStep("NoirHub",Enum.RenderPriority.Camera.Value+1,function(dt)
Cam=W.CurrentCamera if not Cam then return end
UA(dt)UE()UF()AX.b.Visible=S.AimEnabled==true and S.AimKey=="Screen Button"
if M.Visible and S.UiPrev then local f=PU[cur]if f then f(dt)end end end)
if Cam then Cam:GetPropertyChangedSignal("ViewportSize"):Connect(PV)end
PV()Op(true)
