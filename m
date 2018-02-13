Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v4,5/5] dmaengine: mediatek: fix zalloc-simple.cocci warnings
From: Vinod Koul <vinod.koul@intel.com>
Message-Id: <20180213064659.GD3666@localhost>
Date: Tue, 13 Feb 2018 12:16:59 +0530
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: sean.wang@mediatek.com, dan.j.williams@intel.com, robh+dt@kernel.org, mark.rutland@arm.com, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Fengguang Wu <fengguang.wu@intel.com>
List-ID: <dmaengine.vger.kernel.org>

T24gRnJpLCBGZWIgMDksIDIwMTggYXQgMDM6NTU6NThQTSArMDEwMCwgSnVsaWEgTGF3YWxsIHdy
b3RlOgo+IAo+ID4gPiAtCXJpbmctPnR4ZCA9IGRtYV9hbGxvY19jb2hlcmVudChoc2RtYTJkZXYo
aHNkbWEpLAo+ID4gPiAtCQkJCSAgICAgICBwYy0+c3pfcmluZywgJnJpbmctPnRwaHlzLAo+ID4g
PiAtCQkJCSAgICAgICBHRlBfQVRPTUlDIHwgX19HRlBfWkVSTyk7Cj4gPiA+ICsJcmluZy0+dHhk
ID0gZG1hX3phbGxvY19jb2hlcmVudChoc2RtYTJkZXYoaHNkbWEpLCBwYy0+c3pfcmluZywKPiA+
ID4gKwkJCQkJJnJpbmctPnRwaHlzLCBHRlBfQVRPTUlDKTsKPiA+ID4gIAlpZiAoIXJpbmctPnR4
ZCkKPiA+ID4gIAkJcmV0dXJuIC1FTk9NRU07Cj4gPiA+Cj4gPiA+IC0JbWVtc2V0KHJpbmctPnR4
ZCwgMCwgcGMtPnN6X3JpbmcpOwo+ID4KPiA+IFRoaXMgc2hvdWxkIGJlIGZvbGRlZCBiYWNrLi4K
PiAKPiBTb3JyeSwgSSdtIG5vdCBzdXJlIHdoYXQgeW91IG1lYW4gYnkgImZvbGRlZCBiYWNrIi4K
ClNpbmNlIHRoZSBvcmlnaW5hbCBwYXRjaCBpcyBhbHNvIHVwIGZvciByZXZpZXcgaW4gdGhpcyBz
ZXJpZXMsIGl0IGRvZXNuJ3QKaGVscCBtdWNoIHRvIGFkZCBhIGNoYW5nZSBhbmQgZml4IG9uIHRv
cCBpbiBhIHNlcmllcy4gVGhlIGZpeCBzaG91bGQgYmUKZm9sZGVkIGJhY2sgaW50byB0aGUgb3Jp
Z2luYWwgY29tbWl0LiBJSVJDIEZlbmdndWFuZydzIGJvdCBhbHNvIHJlY29tbWVuZHMKc28uLgo=
