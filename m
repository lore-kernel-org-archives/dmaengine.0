Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v9,1/2] dmaengine: 8250_mtk_dma: add MediaTek uart DMA support
From: Long Cheng <long.cheng@mediatek.com>
Message-Id: <1547110225.3831.24.camel@mhfsdcap03>
Date: Thu, 10 Jan 2019 16:50:25 +0800
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Nicolas Boichat <drinkcat@chromium.org>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ryder Lee <ryder.lee@mediatek.com>, Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Dan Williams <dan.j.williams@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, Sean Wang <sean.wang@mediatek.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org, lkml <linux-kernel@vger.kernel.org>, linux-serial@vger.kernel.org, srv_heupstream@mediatek.com, Yingjoe Chen <yingjoe.chen@mediatek.com>, YT Shen <yt.shen@mediatek.com>, Zhenbao Liu <zhenbao.liu@mediatek.com>
List-ID: <dmaengine.vger.kernel.org>

T24gV2VkLCAyMDE5LTAxLTAyIGF0IDE4OjAzIC0wODAwLCBSYW5keSBEdW5sYXAgd3JvdGU6Cj4g
SGksCj4gCj4gV2hpbGUgeW91IGFyZSBtYWtpbmcgY2hhbmdlcywgaGVyZSBhcmUgYSBmZXcgbW9y
ZToKPiAKCmhpCgpPSywgdGhhbmtzIGZvciB5b3VyIGNvbW1lbnRzLgoKPiAKPiBPbiAxLzIvMTkg
NTozOSBQTSwgTmljb2xhcyBCb2ljaGF0IHdyb3RlOgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
ZG1hL21lZGlhdGVrL0tjb25maWcgYi9kcml2ZXJzL2RtYS9tZWRpYXRlay9LY29uZmlnCj4gPiBp
bmRleCAyN2JhYzBiLi4xYTUyM2M4NyAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZG1hL21lZGlh
dGVrL0tjb25maWcKPiA+ICsrKyBiL2RyaXZlcnMvZG1hL21lZGlhdGVrL0tjb25maWcKPiA+IEBA
IC0xLDQgKzEsMTUgQEAKPiA+IAo+ID4gK2NvbmZpZyBETUFfTVRLX1VBUlQKPiA+ICsgICAgICAg
dHJpc3RhdGUgIk1lZGlhVGVrIFNvQ3MgQVBETUEgc3VwcG9ydCBmb3IgVUFSVCIKPiA+ICsgICAg
ICAgZGVwZW5kcyBvbiBPRiAmJiBTRVJJQUxfODI1MF9NVDY1NzcKPiA+ICsgICAgICAgc2VsZWN0
IERNQV9FTkdJTkUKPiA+ICsgICAgICAgc2VsZWN0IERNQV9WSVJUVUFMX0NIQU5ORUxTCj4gPiAr
ICAgICAgIGhlbHAKPiA+ICsgICAgICAgICBTdXBwb3J0IGZvciB0aGUgVUFSVCBETUEgZW5naW5l
IGZvdW5kIG9uIE1lZGlhVGVrIE1USyBTb0NzLgo+ID4gKyAgICAgICAgIHdoZW4gU0VSSUFMXzgy
NTBfTVQ2NTc3IGlzIGVuYWJsZWQsIGFuZCBpZiB5b3Ugd2FudCB0byB1c2UgRE1BLAo+IAo+IAkg
ICAgV2hlbgo+IAo+ID4gKyAgICAgICAgIHlvdSBjYW4gZW5hYmxlIHRoZSBjb25maWcuIHRoZSBE
TUEgZW5naW5lIGNhbiBvbmx5IGJlIHVzZWQKPiAKPiAJICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFRoZQo+IAo+ID4gKyAgICAgICAgIHdpdGggTWVkaWFUZWsgU29Dcy4KPiA+ICsKPiAK
CmFib3ZlLCBpIHdpbGwgbW9kaWZ5LgoKPiBBbHNvLCB1c2UgdGFicyB0byBpbmRlbnQgaW5zdGVh
ZCBvZiBzcGFjZXMuCj4gVGhlIGxpbmVzICh0cmlzdGF0ZSwgZGVwZW5kcywgc2VsZWN0LCBhbmQg
aGVscCkgc2hvdWxkIGJlIGluZGVudGVkIHdpdGggb25lIHRhYi4KPiBUaGUgaGVscCB0ZXh0IGxp
bmVzIHNob3VsZCBiZSBpbmRlbnRlZCB3aXRoIG9uZSB0YWIgKyAyIHNwYWNlcy4KPiAKCmluIG15
IHBhdGNoLCBpIGFscmVhZHkgZG8gdGhpcy4gU28gZG9uJ3QgbmVlZCBtb2RpZnkuCgo+ID4gIGNv
bmZpZyBNVEtfSFNETUEKPiA+ICAgICAgICAgdHJpc3RhdGUgIk1lZGlhVGVrIEhpZ2gtU3BlZWQg
RE1BIGNvbnRyb2xsZXIgc3VwcG9ydCIKPiA+ICAgICAgICAgZGVwZW5kcyBvbiBBUkNIX01FRElB
VEVLIHx8IENPTVBJTEVfVEVTVAo+IAo+IAo+IHRoYW5rcywK
