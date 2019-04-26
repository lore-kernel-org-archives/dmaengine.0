Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,07/15] spi: imx: remove ERR009165 workaround on i.mx6ul
From: Robin Gong <yibin.gong@nxp.com>
Message-Id: <1556270773.32214.5.camel@nxp.com>
Date: Fri, 26 Apr 2019 09:32:29 +0000
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "plyatov@gmail.com" <plyatov@gmail.com>, "broonie@kernel.org" <broonie@kernel.org>, "dan.j.williams@intel.com" <dan.j.williams@intel.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
Cc: "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-ID: <dmaengine.vger.kernel.org>

T24gMjAxOS0wNC0yNiBhdCAxMTowOSArMDIwMCwgTHVjYXMgU3RhY2ggd3JvdGU6DQo+wqANCj4g
PiDCoHN0YXRpYyBpbmxpbmUgaW50IGlzX2lteDUzX2Vjc3BpKHN0cnVjdCBzcGlfaW14X2RhdGEg
KmQpDQo+ID4gQEAgLTU4NSw5ICs1ODcsMTYgQEAgc3RhdGljIGludCBteDUxX2Vjc3BpX3ByZXBh
cmVfdHJhbnNmZXIoc3RydWN0DQo+ID4gc3BpX2lteF9kYXRhICpzcGlfaW14LA0KPiA+IMKgwqDC
oMKgwqDCoGN0cmwgfD0gbXg1MV9lY3NwaV9jbGtkaXYoc3BpX2lteCwgdC0+c3BlZWRfaHosICZj
bGspOw0KPiA+IMKgwqDCoMKgwqDCoHNwaV9pbXgtPnNwaV9idXNfY2xrID0gY2xrOw0KPiA+IA0K
PiA+IC3CoMKgwqDCoMKgLyogRVJSMDA5MTY1OiB3b3JrIGluIFhIQyBtb2RlIGFzIFBJTyAqLw0K
PiA+IC3CoMKgwqDCoMKgaWYgKHNwaV9pbXgtPnVzZWRtYSkNCj4gPiAtwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBjdHJsICY9IH5NWDUxX0VDU1BJX0NUUkxfU01DOw0KPiA+ICvCoMKgwqDCoMKg
LyoNCj4gPiArwqDCoMKgwqDCoMKgKiBFUlIwMDkxNjU6IHdvcmsgaW4gWEhDIG1vZGUgaW5zdGVh
ZCBvZiBTTUMgYXMgUElPIG9uIHRoZQ0KPiA+IGNoaXBzDQo+ID4gK8KgwqDCoMKgwqDCoCogYmVm
b3JlIGkubXg2dWwuDQo+ID4gK8KgwqDCoMKgwqDCoCovDQo+ID4gK8KgwqDCoMKgwqBpZiAoc3Bp
X2lteC0+dXNlZG1hKSB7DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKHNwaV9p
bXgtPmRldnR5cGVfZGF0YS0+ZGV2dHlwZSA9PSBJTVg2VUxfRUNTUEkpDQo+ID4gDQo+ID4gPSwg
b3RoZXJ3aXNlIHRoZSB3b3JrYXJvdW5kIG1pZ2h0IGJlIGFwcGxpZWQgdG8gbGF0ZXIgZ2VuZXJh
dGlvbnMNCj4gPiBvZg0KPiB0aGUgY29yZSBpZiBtb3JlIGFyZSBhZGRlZCBsYXRlci4NCj4gDQo+
IFJlZ2FyZHMsDQo+IEx1Y2FzDQpVbmRlcnN0b29kIHlvdXIgcG9pbnQsIGJ1dCBmb3Igbm93IGNo
b29zZSBkaWZmZXJlbnQgY29tcGF0aWJsZSBuYW1lDQpjb3VsZCBhcHBseSB0aGlzIHdvcmthcm91
bmQgb3Igbm90LiBJIHByZWZlciB0byBsZWF2ZSBpdCBmb3IgbmV4dCBlY3NwaQ0KSVAgdXBncmFk
ZSBpZiBpdCByZWFsbHkgY29tZSBpbiB0aGUgZnV0dXJlLCBvdGhlcndpc2UgdGhhdCAnPj0nIGJy
aW5nDQphIGxpdHRsZSBiaXQgY29uZnVzZSBpZiB0aGVyZSBpcyBubyB1cGRhdGUgZm9yIGVjc3Bp
IElQLi4uCg==
