Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v1,09/15] dmaengine: imx-sdma: remove ERR009165 on i.mx6ul
From: Fabio Estevam <festevam@gmail.com>
Message-Id: <CAOMZO5AT2dPJwQefKwFsfp8XqodL4k7bhKcmXQskHbc9aQ6n8A@mail.gmail.com>
Date: Tue, 23 Apr 2019 11:12:58 -0300
To: Robin Gong <yibin.gong@nxp.com>
Cc: "broonie@kernel.org" <broonie@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>, "plyatov@gmail.com" <plyatov@gmail.com>, "sean.nyekjaer@prevas.dk" <sean.nyekjaer@prevas.dk>, dl-linux-imx <linux-imx@nxp.com>, "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>
List-ID: <dmaengine.vger.kernel.org>

T24gVHVlLCBBcHIgMjMsIDIwMTkgYXQgMTA6NTEgQU0gUm9iaW4gR29uZyA8eWliaW4uZ29uZ0Bu
eHAuY29tPiB3cm90ZToKPgo+IEVDU1BJIGlzc3VlIGZpeGVkIGZyb20gaS5teDZ1bCBhdCBoYXJk
d2FyZSBsZXZlbCwgbm8gbmVlZAo+IEVSUjAwOTE2NSBhbnltb3JlIG9uIHRob3NlIGNoaXBzIHN1
Y2ggYXMgaS5teDhtcS4gQWRkIGkubXg2c3gKPiBmcm9tIHdoZXJlIGkubXg2dWwgc291cmNlLgo+
Cj4gU2lnbmVkLW9mZi1ieTogUm9iaW4gR29uZyA8eWliaW4uZ29uZ0BueHAuY29tPgo+IC0tLQo+
ICBkcml2ZXJzL2RtYS9pbXgtc2RtYS5jIHwgNDMgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgNDIgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hL2lteC1zZG1hLmMgYi9kcml2
ZXJzL2RtYS9pbXgtc2RtYS5jCj4gaW5kZXggMWUyMDQ3MC4uOTljNDRhNSAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2RtYS9pbXgtc2RtYS5jCj4gKysrIGIvZHJpdmVycy9kbWEvaW14LXNkbWEuYwo+
IEBAIC00MTksNiArNDE5LDcgQEAgc3RydWN0IHNkbWFfZHJpdmVyX2RhdGEgewo+ICAgICAgICAg
aW50IG51bV9ldmVudHM7Cj4gICAgICAgICBzdHJ1Y3Qgc2RtYV9zY3JpcHRfc3RhcnRfYWRkcnMg
ICpzY3JpcHRfYWRkcnM7Cj4gICAgICAgICBib29sIGNoZWNrX3JhdGlvOwo+ICsgICAgICAgYm9v
bCBlY3NwaV9maXhlZDsKClBsZWFzZSBzdGF0ZSB0aGUgZXJyYXR1bSBudW1iZXIgaW4gdGhlIHZh
cmlhYmxlIG5hbWUsIHN1Y2ggYXMKaGFzX2VycjAwOTE2NV9maXhlZAo=
