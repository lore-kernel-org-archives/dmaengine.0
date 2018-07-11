Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v1,1/4] dmaengine: imx-sdma: add memcpy interface
From: Vinod Koul <vkoul@kernel.org>
Message-Id: <20180711071206.GM3219@vkoul-mobl>
Date: Wed, 11 Jul 2018 12:42:06 +0530
To: Robin Gong <yibin.gong@nxp.com>
Cc: "dan.j.williams@intel.com" <dan.j.williams@intel.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-ID: <dmaengine.vger.kernel.org>

T24gMTEtMDctMTgsIDA1OjM0LCBSb2JpbiBHb25nIHdyb3RlOgo+ID4gT24gMTEtMDctMTgsIDAw
OjIzLCBSb2JpbiBHb25nIHdyb3RlOgo+ID4gPiBBZGQgTUVNQ1BZIHN1cHBvcnQsIG1lYW53aGls
ZSwgYWRkIFNETUFfQkRfTUFYX0NOVCBpbnN0ZWFkIG9mCj4gPiA+ICcweGZmZmYnLgo+ID4gCj4g
PiBsYXR0ZXIgcGFydCBzaG91bGQgYmUgaXRzIG93biBwYXRjaC4gTmV2ZXIgbWl4IHRoaW5ncwo+
IE9rYXksIEkgd2lsbCBzcGxpdCBpdCBldmVuIGZvciB0aGlzIG1pbm9yIGNoYW5nZS4KClllcywg
YSBwYXRjaCBzaG91bGQgcmVwcmVzZW50IF9vbmVfIHRoaW5nLCBkZXNjcmliZSB0aGF0IG9uZSB0
aGluZyBhbmQKZG8gdGhhdCBvbmUgdGhpbmcuCgpBbnl0aGluZyBlbHNlLCBkb2Vzbid0IG1hdHRl
ciBob3cgc2ltcGxlIG9yIGNvbXBsZXggc2hvdWxkIGJlIGFuCmluZGl2aWR1YWwgcGF0Y2gKCj4g
PiA+ICsJaWYgKCFkZXNjKQo+ID4gPiArCQlnb3RvIGVycl9vdXQ7Cj4gPiA+ICsKPiA+ID4gKwlk
byB7Cj4gPiA+ICsJCWNvdW50ID0gbWluX3Qoc2l6ZV90LCBsZW4sIFNETUFfQkRfTUFYX0NOVCk7
Cj4gPiA+ICsJCWJkID0gJmRlc2MtPmJkW2ldOwo+ID4gPiArCQliZC0+YnVmZmVyX2FkZHIgPSBk
bWFfc3JjOwo+ID4gPiArCQliZC0+ZXh0X2J1ZmZlcl9hZGRyID0gZG1hX2RzdDsKPiA+ID4gKwkJ
YmQtPm1vZGUuY291bnQgPSBjb3VudDsKPiA+ID4gKwkJZGVzYy0+Y2huX2NvdW50ICs9IGNvdW50
Owo+ID4gPiArCj4gPiA+ICsJCXN3aXRjaCAoc2RtYWMtPndvcmRfc2l6ZSkgewo+ID4gPiArCQlj
YXNlIERNQV9TTEFWRV9CVVNXSURUSF80X0JZVEVTOgo+ID4gCj4gPiBUaGlzIGxvb2tzIHdyb25n
LCB3ZSBhcmUgaW4gbWVtY3B5LCB0aGVyZSBpcyBubyBTTEFWRSBzbyBubyBTTEFWRSB3aWR0aHMu
Lgo+ID4gCj4gT2theSwgd2lsbCByZW1vdmUgY2hlY2sgYnVzIHdpZHRoLgoKaXQgaXMgbm90IGFi
b3V0IGJ1c193aWR0aCBidXQgdGhlIGZhY3QgdGhhdCB5b3UgYXJlIHVzaW5nIHNsYXZlCmNvbmNl
cHRzLiBJbiBtZW1jcHkgd2UgaGF2ZSBfbm9fIHNsYXZlLCBoZW5jZSBkbyBub3QgdXNlIGFueXRo
aW5nCnJlbGF0ZWQgdG8gc2xhdmUgaW5jbHVkaW5nIGRtYV9zbGF2ZV9jb25maWcK
