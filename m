Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v11,1/7] dmaengine: fsldma: Replace DMA_IN/OUT by FSL_DMA_IN/OUT
From: Peng Ma <peng.ma@nxp.com>
Message-Id: <VI1PR04MB44316BBB8821ACD7F9A348EEEDA90@VI1PR04MB4431.eurprd04.prod.outlook.com>
Date: Thu, 6 Dec 2018 11:24:29 +0000
To: Vinod Koul <vkoul@kernel.org>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Leo Li <leoyang.li@nxp.com>, "dan.j.williams@intel.com" <dan.j.williams@intel.com>, "zw@zh-kernel.org" <zw@zh-kernel.org>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Wen He <wen.he_1@nxp.com>
List-ID: <dmaengine.vger.kernel.org>

SGkgVmlub2QsDQoJDQoJVGhhbmtzIGZvciB5b3VyIGFwcGx5LCBJIGhhdmUgZmluaXNoZWQgdXBk
YXRlIERUUyBwYXRjaCwgcGxlYXNlIHJldmlldy4NCg0KQmVzdCBSZWdhcmRzLA0KCVBlbmcNCg0K
Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogVmlub2QgS291bCA8dmtvdWxAa2Vy
bmVsLm9yZz4NCj5TZW50OiAyMDE45bm0MTLmnIg25pelIDE6NDkNCj5UbzogUGVuZyBNYSA8cGVu
Zy5tYUBueHAuY29tPg0KPkNjOiByb2JoK2R0QGtlcm5lbC5vcmc7IG1hcmsucnV0bGFuZEBhcm0u
Y29tOyBzaGF3bmd1b0BrZXJuZWwub3JnOyBMZW8NCj5MaSA8bGVveWFuZy5saUBueHAuY29tPjsg
ZGFuLmoud2lsbGlhbXNAaW50ZWwuY29tOyB6d0B6aC1rZXJuZWwub3JnOw0KPmRtYWVuZ2luZUB2
Z2VyLmtlcm5lbC5vcmc7IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOw0KPmxpbnV4LWtlcm5l
bEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsN
Cj5saW51eHBwYy1kZXZAbGlzdHMub3psYWJzLm9yZzsgV2VuIEhlIDx3ZW4uaGVfMUBueHAuY29t
Pg0KPlN1YmplY3Q6IFJlOiBbdjExIDEvN10gZG1hZW5naW5lOiBmc2xkbWE6IFJlcGxhY2UgRE1B
X0lOL09VVCBieQ0KPkZTTF9ETUFfSU4vT1VUDQo+DQo+T24gMzAtMTAtMTgsIDEwOjM1LCBQZW5n
IE1hIHdyb3RlOg0KPj4gRnJvbTogV2VuIEhlIDx3ZW4uaGVfMUBueHAuY29tPg0KPj4NCj4+IFRo
aXMgcGF0Y2ggaW1wbGVtZW50IGEgc3RhbmRhcmQgbWFjcm8gY2FsbCBmdW5jdGlvbnMgaXMgdXNl
ZCB0byBOWFANCj4+IGRtYSBkcml2ZXJzLg0KPg0KPkFwcGxpZWQgYWxsIGV4Y2VwdCBEVFMgcGF0
Y2hlcywgdGhhbmtzDQo+LS0NCj5+Vmlub2QK
