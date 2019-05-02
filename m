Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,08/15] dt-bindings: spi: imx: add i.mx6ul to state errata fixed
From: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Message-Id: <20190502065939.nyejomrsowhy6xox@pengutronix.de>
Date: Thu, 2 May 2019 08:59:39 +0200
To: Robin Gong <yibin.gong@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>
Cc: "broonie@kernel.org" <broonie@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "plyatov@gmail.com" <plyatov@gmail.com>, "dan.j.williams@intel.com" <dan.j.williams@intel.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, dl-linux-imx <linux-imx@nxp.com>, "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>
List-ID: <dmaengine.vger.kernel.org>

T24gRnJpLCBBcHIgMjYsIDIwMTkgYXQgMDg6MDU6NTFBTSArMDAwMCwgUm9iaW4gR29uZyB3cm90
ZToKPiBFUlIwMDkxNjUgZml4ZWQgZnJvbSBpLm14NnVsLCBhZGQgaXQgdG8gc2hvdyB0aGUgZXJy
YXRhIGZpeGVkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJvYmluIEdvbmcgPHlpYmluLmdvbmdAbnhw
LmNvbT4KPiAtLS0KPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NwaS9mc2wt
aW14LWNzcGkudHh0IHwgMiArKwo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4g
Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkvZnNs
LWlteC1jc3BpLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkvZnNs
LWlteC1jc3BpLnR4dAo+IGluZGV4IDJkMzI2NDEuLjMyYzQyNjNkIDEwMDY0NAo+IC0tLSBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkvZnNsLWlteC1jc3BpLnR4dAo+ICsr
KyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkvZnNsLWlteC1jc3BpLnR4
dAo+IEBAIC0xMCw2ICsxMCw4IEBAIFJlcXVpcmVkIHByb3BlcnRpZXM6Cj4gICAgLSAiZnNsLGlt
eDM1LWNzcGkiIGZvciBTUEkgY29tcGF0aWJsZSB3aXRoIHRoZSBvbmUgaW50ZWdyYXRlZCBvbiBp
Lk1YMzUKPiAgICAtICJmc2wsaW14NTEtZWNzcGkiIGZvciBTUEkgY29tcGF0aWJsZSB3aXRoIHRo
ZSBvbmUgaW50ZWdyYXRlZCBvbiBpLk1YNTEKPiAgICAtICJmc2wsaW14NTMtZWNzcGkiIGZvciBT
UEkgY29tcGF0aWJsZSB3aXRoIHRoZSBvbmUgaW50ZWdyYXRlZCBvbiBpLk1YNTMgYW5kIGxhdGVy
IFNvYwo+ICsgIC0gImZzbCxpbXg2dWwtZWNzcGkiIEVSUjAwOTE2NSBmaXhlZCBvbiBpLk1YNlVM
IGFuZCBsYXRlciBTb2MKPiArICAgIChodHRwczovL3d3dy5ueHAuY29tL2RvY3MvZW4vZXJyYXRh
L0lNWDZEUUNFLnBkZikKCkkgd291bGRuJ3QgbWVudGlvbiB0aGlzIGVycmF0YSBpbiB0aGUgYmlu
ZGluZyBkb2N1bWVudGF0aW9uLiBKdXN0IHN0YXRlCnRoYXQgZnNsLGlteDZ1bC1lY3NwaSBpcyBk
ZXNpZ25lZCB0byBiZSB1c2VkIG9uIGkuTVg2VUwuIEFuZCB0aGF0IGl0Cm1pZ2h0IGFsc28gYmUg
dXNlZCBvbiBsYXRlciBTb0NzIGFzIGEgImZhbGxiYWNrIGNvbXBhdGlibGUiIGlzIGEgZGV0YWls
CnRoYXQgaXMgc28gY29tbW9uIHRoYXQgSSB3b3VsZCBleHBlY3QgaXQgbm90IGJlaW5nIHdvcnRo
IG1lbnRpb25pbmcuIFNvCmZvciBtZSBpdCB3b3VsZCBhbHNvIGJlIE9LIHRvIGRyb3AgImZzbCxp
bXg1My1lY3NwaSIgZnJvbSB0aGUgbGlzdCBhcwp0aGlzIGlzIG9ubHkgdXNlZCBsaWtlOgoKCWNv
bXBhdGlibGUgPSAiZnNsLGlteDUzLWVjc3BpIiwgImZzbCxpbXg1MS1lY3NwaSI7CgooQnV0IG5v
dGUgdGhhdCBJIGhhdmUgbm8gYXV0aG9yaXR5IGhlcmUuKQoKQmVzdCByZWdhcmRzClV3ZQo=
