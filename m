Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,06/15] spi: imx: fix ERR009165
From: Lucas Stach <l.stach@pengutronix.de>
Message-Id: <1556271442.2584.29.camel@pengutronix.de>
Date: Fri, 26 Apr 2019 11:37:22 +0200
To: Robin Gong <yibin.gong@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "plyatov@gmail.com" <plyatov@gmail.com>, "broonie@kernel.org" <broonie@kernel.org>, "dan.j.williams@intel.com" <dan.j.williams@intel.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
Cc: "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-ID: <dmaengine.vger.kernel.org>

QW0gRnJlaXRhZywgZGVuIDI2LjA0LjIwMTksIDA5OjIyICswMDAwIHNjaHJpZWIgUm9iaW4gR29u
ZzoKPiBPbiAyMDE5LTA0LTI2IGF0IDExOjA3ICswMjAwLCBMdWNhcyBTdGFjaCB3cm90ZToKPiA+
IAo+ID4gQW0gRnJlaXRhZywgZGVuIDI2LjA0LjIwMTksIDA4OjA1ICswMDAwIHNjaHJpZWIgUm9i
aW4gR29uZzoKPiA+ID4gwqBzdGF0aWMgdm9pZCBteDUxX3NldHVwX3dtbChzdHJ1Y3Qgc3BpX2lt
eF9kYXRhICpzcGlfaW14KQo+ID4gPiDCoHsKPiA+ID4gK8KgwqDCoMKgwqB1MzIgdHhfd21sID0g
MDsKPiA+ID4gKwo+ID4gCj4gPiBXaXRoIGEgd21sIG9mIDAgeW91IG1pZ2h0IHNldCB0aGUgbWF4
YnVyc3Qgb2YgdGhlIFRYIGRtYSBjaGFubmVsIHRvCj4gPiBmaWZvc2l6ZSB0byBtaW5pbWl6ZSB0
aGUgcGVyZm9ybWFuY2UgaW1wYWN0IG9mIHRoaXMgd29ya2Fyb3VuZC4KPiA+IAo+ID4gUmVnYXJk
cywKPiA+IEx1Y2FzCj4gCj4gVW5mb3J0dW5hdGVseSwgdGhpcyBpcyBhIE1VU1QgcGFydCBvZiBl
cnJhdGEgd2hpY2ggY2F1c2UgcGVyZm9ybWFuY2UKPiBkcm9wLgoKSSdtIG5vdCB0YWxraW5nIGFi
b3V0IGNoYW5naW5nIHRoZSBXTUwsIGJ1dCB3aGVuIHRoZSBXTUwgbXVzdCBiZSAwIHlvdQpjYW4g
c2FmZWx5IGluY3JlYXNlIHRoZSBETUEgYnVyc3Qgc2l6ZSB3aXRob3V0IG92ZXJmbG93aW5nIHRo
ZSBGSUZPLAp3aGljaCBtaWdodCByZWNvdmVyIHNvbWUgb2Ygb2YgdGhlIHBlcmZvcm1hbmNlIGxv
c3MuCgpSZWdhcmRzLApMdWNhcwo=
