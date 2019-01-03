Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v9,1/2] dmaengine: 8250_mtk_dma: add MediaTek uart DMA support
From: Randy Dunlap <rdunlap@infradead.org>
Message-Id: <d60c25c2-efe4-9294-dc7e-98f0333bff76@infradead.org>
Date: Wed, 2 Jan 2019 18:03:32 -0800
To: Nicolas Boichat <drinkcat@chromium.org>, Long Cheng <long.cheng@mediatek.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ryder Lee <ryder.lee@mediatek.com>, Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Dan Williams <dan.j.williams@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, Sean Wang <sean.wang@mediatek.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org, lkml <linux-kernel@vger.kernel.org>, linux-serial@vger.kernel.org, srv_heupstream@mediatek.com, Yingjoe Chen <yingjoe.chen@mediatek.com>, YT Shen <yt.shen@mediatek.com>, Zhenbao Liu <zhenbao.liu@mediatek.com>
List-ID: <dmaengine.vger.kernel.org>

SGksCgpXaGlsZSB5b3UgYXJlIG1ha2luZyBjaGFuZ2VzLCBoZXJlIGFyZSBhIGZldyBtb3JlOgoK
Ck9uIDEvMi8xOSA1OjM5IFBNLCBOaWNvbGFzIEJvaWNoYXQgd3JvdGU6Cj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZG1hL21lZGlhdGVrL0tjb25maWcgYi9kcml2ZXJzL2RtYS9tZWRpYXRlay9LY29u
ZmlnCj4gaW5kZXggMjdiYWMwYi4uMWE1MjNjODcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9kbWEv
bWVkaWF0ZWsvS2NvbmZpZwo+ICsrKyBiL2RyaXZlcnMvZG1hL21lZGlhdGVrL0tjb25maWcKPiBA
QCAtMSw0ICsxLDE1IEBACj4gCj4gK2NvbmZpZyBETUFfTVRLX1VBUlQKPiArICAgICAgIHRyaXN0
YXRlICJNZWRpYVRlayBTb0NzIEFQRE1BIHN1cHBvcnQgZm9yIFVBUlQiCj4gKyAgICAgICBkZXBl
bmRzIG9uIE9GICYmIFNFUklBTF84MjUwX01UNjU3Nwo+ICsgICAgICAgc2VsZWN0IERNQV9FTkdJ
TkUKPiArICAgICAgIHNlbGVjdCBETUFfVklSVFVBTF9DSEFOTkVMUwo+ICsgICAgICAgaGVscAo+
ICsgICAgICAgICBTdXBwb3J0IGZvciB0aGUgVUFSVCBETUEgZW5naW5lIGZvdW5kIG9uIE1lZGlh
VGVrIE1USyBTb0NzLgo+ICsgICAgICAgICB3aGVuIFNFUklBTF84MjUwX01UNjU3NyBpcyBlbmFi
bGVkLCBhbmQgaWYgeW91IHdhbnQgdG8gdXNlIERNQSwKCgkgICAgV2hlbgoKPiArICAgICAgICAg
eW91IGNhbiBlbmFibGUgdGhlIGNvbmZpZy4gdGhlIERNQSBlbmdpbmUgY2FuIG9ubHkgYmUgdXNl
ZAoKCSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBUaGUKCj4gKyAgICAgICAgIHdpdGgg
TWVkaWFUZWsgU29Dcy4KPiArCgpBbHNvLCB1c2UgdGFicyB0byBpbmRlbnQgaW5zdGVhZCBvZiBz
cGFjZXMuClRoZSBsaW5lcyAodHJpc3RhdGUsIGRlcGVuZHMsIHNlbGVjdCwgYW5kIGhlbHApIHNo
b3VsZCBiZSBpbmRlbnRlZCB3aXRoIG9uZSB0YWIuClRoZSBoZWxwIHRleHQgbGluZXMgc2hvdWxk
IGJlIGluZGVudGVkIHdpdGggb25lIHRhYiArIDIgc3BhY2VzLgoKPiAgY29uZmlnIE1US19IU0RN
QQo+ICAgICAgICAgdHJpc3RhdGUgIk1lZGlhVGVrIEhpZ2gtU3BlZWQgRE1BIGNvbnRyb2xsZXIg
c3VwcG9ydCIKPiAgICAgICAgIGRlcGVuZHMgb24gQVJDSF9NRURJQVRFSyB8fCBDT01QSUxFX1RF
U1QKCgp0aGFua3MsCg==
