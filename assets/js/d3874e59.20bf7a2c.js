"use strict";(self.webpackChunkdocs=self.webpackChunkdocs||[]).push([[1796],{88938:(e,n,t)=>{t.r(n),t.d(n,{HomepageFeatures:()=>m,default:()=>j});var r=t(74848),i=t(28453);function s(e){const n={a:"a",code:"code",h1:"h1",h3:"h3",h4:"h4",header:"header",li:"li",ol:"ol",p:"p",ul:"ul",...(0,i.R)(),...e.components};return(0,r.jsxs)(r.Fragment,{children:[(0,r.jsx)(n.header,{children:(0,r.jsx)(n.h1,{id:"rsunc",children:"rSUNC"})}),"\n",(0,r.jsx)(n.p,{children:"rSUNC is an effort to modernize the now old Unified Naming Convention, built by Script-Ware for their Script-Ware V2 script executor years ago. This convention is partially retro-compatible with UNC, however it is not guaranteed that all UNC scripts will run on rSUNC compliant environments."}),"\n",(0,r.jsxs)(n.p,{children:["Once rSUNC completes its first initial full spec release, functions will be marked as either ",(0,r.jsx)(n.code,{children:"@deprecated"}),", ",(0,r.jsx)(n.code,{children:"@since"})," and with the ",(0,r.jsx)(n.code,{children:"@unrelased"})," tags in order to signify the version at which they were added into the rSUNC spec."]}),"\n",(0,r.jsx)(n.h3,{id:"how-to-build",children:"How to build"}),"\n",(0,r.jsxs)(n.p,{children:["This project uses ",(0,r.jsx)(n.a,{href:"https://eryn.io/moonwave/",children:"Moonwave"})," a documentation generator for Lua(u) projects. From which we generate the webpage for the documents present at ",(0,r.jsx)(n.code,{children:"/impl"}),"."]}),"\n",(0,r.jsxs)(n.ol,{children:["\n",(0,r.jsxs)(n.li,{children:["Get NodeJS from ",(0,r.jsx)(n.a,{href:"https://nodejs.org/en",children:"here"}),"."]}),"\n",(0,r.jsxs)(n.li,{children:["Once installed, run ",(0,r.jsx)(n.code,{children:"npm i -g moonwave@latest"})]}),"\n",(0,r.jsxs)(n.li,{children:["After all is installed, you may do a local preview by running ",(0,r.jsx)(n.code,{children:"dev.bat"})," on your local windows install."]}),"\n",(0,r.jsx)(n.li,{children:"Profit!"}),"\n"]}),"\n",(0,r.jsx)(n.h4,{id:"contributors",children:"Contributors"}),"\n",(0,r.jsx)(n.p,{children:"Updated as new contributors come in"}),"\n",(0,r.jsxs)(n.ul,{children:["\n",(0,r.jsx)(n.li,{children:"Dottik (SecondNewtonLaw)"}),"\n",(0,r.jsx)(n.li,{children:"Pixeluted"}),"\n",(0,r.jsx)(n.li,{children:"senS"}),"\n",(0,r.jsx)(n.li,{children:"GRH"}),"\n",(0,r.jsx)(n.li,{children:"Master Oogway"}),"\n"]})]})}function o(e={}){const{wrapper:n}={...(0,i.R)(),...e.components};return n?(0,r.jsx)(n,{...e,children:(0,r.jsx)(s,{...e})}):s(e)}var a=t(56289),c=t(40797),l=t(11695),d=t(34164);t(96540);const h={heroBanner:"heroBanner_e1Bh",buttons:"buttons_VwD3",features:"features_WS6B",featureSvg:"featureSvg_tqLR",titleOnBannerImage:"titleOnBannerImage_r7kd",taglineOnBannerImage:"taglineOnBannerImage_dLPr"},u=[{title:"Simple",description:"rSUNC promises to be a simple, yet useful standard for new executors."},{title:"Innovative",description:"rSUNC takes a new approach at creating functions, thinking of everything a user may need or want!"},{title:"Constantly Developed",description:"rSUNC is being constantly developed and improved. Any suggestions and new functions are accepted on our discord server!"}];function x(e){let{image:n,title:t,description:i}=e;return(0,r.jsxs)("div",{className:(0,d.A)("col col--4"),children:[n&&(0,r.jsx)("div",{className:"text--center",children:(0,r.jsx)("img",{className:h.featureSvg,alt:t,src:n})}),(0,r.jsxs)("div",{className:"text--center padding-horiz--md",children:[(0,r.jsx)("h3",{children:t}),(0,r.jsx)("p",{children:i})]})]})}function m(){return u?(0,r.jsx)("section",{className:h.features,children:(0,r.jsx)("div",{className:"container",children:(0,r.jsx)("div",{className:"row",children:u.map(((e,n)=>(0,r.jsx)(x,{...e},n)))})})}):null}function p(){const{siteConfig:e}=(0,c.A)(),n=e.customFields.bannerImage,t=!!n,i=t?{backgroundImage:`url("${n}")`}:null,s=(0,d.A)("hero__title",{[h.titleOnBannerImage]:t}),o=(0,d.A)("hero__subtitle",{[h.taglineOnBannerImage]:t});return(0,r.jsx)("header",{className:(0,d.A)("hero",h.heroBanner),style:i,children:(0,r.jsxs)("div",{className:"container",children:[(0,r.jsx)("h1",{className:s,children:e.title}),(0,r.jsx)("p",{className:o,children:e.tagline}),(0,r.jsx)("div",{className:h.buttons,children:(0,r.jsx)(a.A,{className:"button button--secondary button--lg",to:"/docs/intro",children:"Get Started \u2192"})})]})})}function j(){const{siteConfig:e,tagline:n}=(0,c.A)();return(0,r.jsxs)(l.A,{title:e.title,description:n,children:[(0,r.jsx)(p,{}),(0,r.jsxs)("main",{children:[(0,r.jsx)(m,{}),(0,r.jsx)("div",{className:"container",children:(0,r.jsx)(o,{})})]})]})}},28453:(e,n,t)=>{t.d(n,{R:()=>o,x:()=>a});var r=t(96540);const i={},s=r.createContext(i);function o(e){const n=r.useContext(s);return r.useMemo((function(){return"function"==typeof e?e(n):{...n,...e}}),[n,e])}function a(e){let n;return n=e.disableParentContext?"function"==typeof e.components?e.components(i):e.components||i:o(e.components),r.createElement(s.Provider,{value:n},e.children)}}}]);