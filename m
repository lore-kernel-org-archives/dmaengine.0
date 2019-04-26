Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,07/15] spi: imx: remove ERR009165 workaround on i.mx6ul
From: Lucas Stach <l.stach@pengutronix.de>
Message-Id: <1556269796.2584.25.camel@pengutronix.de>
Date: Fri, 26 Apr 2019 11:09:56 +0200
To: Robin Gong <yibin.gong@nxp.com>, "broonie@kernel.org" <broonie@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>, "plyatov@gmail.com" <plyatov@gmail.com>, "dan.j.williams@intel.com" <dan.j.williams@intel.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-ID: <dmaengine.vger.kernel.org>

QW0gRnJlaXRhZywgZGVuIDI2LjA0LjIwMTksIDA4OjA1ICswMDAwIHNjaHJpZWIgUm9iaW4gR29u
ZzoKPiDCoMKgwqBFUlIwMDkxNjUgZml4IG9uIGkubXg2dWwgYW5kIG5leHQgY2hpcCwgc3VjaCBh
cyBpLm14NnVsbC9pLm14OG1xL2kubXg4bW0uCj4gUmVtb3ZlIHdvcmthcm91bmQgb24gdGhvc2Ug
Y2hpcHMuIEFkZCBuZXcgaS5teDZ1bCB0eXBlIGZvciB0aGF0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6
IFJvYmluIEdvbmcgPHlpYmluLmdvbmdAbnhwLmNvbT4KPiAtLS0KPiDCoGRyaXZlcnMvc3BpL3Nw
aS1pbXguYyB8IDM5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLQo+IMKg
MSBmaWxlIGNoYW5nZWQsIDM1IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvc3BpL3NwaS1pbXguYyBiL2RyaXZlcnMvc3BpL3NwaS1pbXguYwo+
IGluZGV4IGViNTZlYWMuLjJlNWU5NzggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9zcGkvc3BpLWlt
eC5jCj4gKysrIGIvZHJpdmVycy9zcGkvc3BpLWlteC5jCj4gQEAgLTU3LDYgKzU3LDcgQEAgZW51
bSBzcGlfaW14X2RldnR5cGUgewo+IMKgCUlNWDM1X0NTUEksCS8qIENTUEkgb24gYWxsIGkubXgg
ZXhjZXB0IGFib3ZlICovCj4gwqAJSU1YNTFfRUNTUEksCS8qIEVDU1BJIG9uIGkubXg1MSAqLwo+
IMKgCUlNWDUzX0VDU1BJLAkvKiBFQ1NQSSBvbiBpLm14NTMgYW5kIGxhdGVyICovCj4gKwlJTVg2
VUxfRUNTUEksCS8qIEVSUjAwOTE2NSBmaXggZnJvbSBpLm14NnVsICovCj4gwqB9Owo+IMKgCj4g
wqBzdHJ1Y3Qgc3BpX2lteF9kYXRhOwo+IEBAIC0xMjgsNyArMTI5LDggQEAgc3RhdGljIGlubGlu
ZSBpbnQgaXNfaW14MzVfY3NwaShzdHJ1Y3Qgc3BpX2lteF9kYXRhICpkKQo+IMKgCj4gwqBzdGF0
aWMgaW5saW5lIGludCBpc19pbXg1MV9lY3NwaShzdHJ1Y3Qgc3BpX2lteF9kYXRhICpkKQo+IMKg
ewo+IC0JcmV0dXJuIGQtPmRldnR5cGVfZGF0YS0+ZGV2dHlwZSA9PSBJTVg1MV9FQ1NQSTsKPiAr
CXJldHVybiBkLT5kZXZ0eXBlX2RhdGEtPmRldnR5cGUgPT0gSU1YNTFfRUNTUEkgfHwKPiArCcKg
wqDCoMKgwqDCoMKgZC0+ZGV2dHlwZV9kYXRhLT5kZXZ0eXBlID09IElNWDZVTF9FQ1NQSTsKPiDC
oH0KPiDCoAo+IMKgc3RhdGljIGlubGluZSBpbnQgaXNfaW14NTNfZWNzcGkoc3RydWN0IHNwaV9p
bXhfZGF0YSAqZCkKPiBAQCAtNTg1LDkgKzU4NywxNiBAQCBzdGF0aWMgaW50IG14NTFfZWNzcGlf
cHJlcGFyZV90cmFuc2ZlcihzdHJ1Y3Qgc3BpX2lteF9kYXRhICpzcGlfaW14LAo+IMKgCWN0cmwg
fD0gbXg1MV9lY3NwaV9jbGtkaXYoc3BpX2lteCwgdC0+c3BlZWRfaHosICZjbGspOwo+IMKgCXNw
aV9pbXgtPnNwaV9idXNfY2xrID0gY2xrOwo+IMKgCj4gLQkvKiBFUlIwMDkxNjU6IHdvcmsgaW4g
WEhDIG1vZGUgYXMgUElPICovCj4gLQlpZiAoc3BpX2lteC0+dXNlZG1hKQo+IC0JCWN0cmwgJj0g
fk1YNTFfRUNTUElfQ1RSTF9TTUM7Cj4gKwkvKgo+ICsJwqAqIEVSUjAwOTE2NTogd29yayBpbiBY
SEMgbW9kZSBpbnN0ZWFkIG9mIFNNQyBhcyBQSU8gb24gdGhlIGNoaXBzCj4gKwnCoCogYmVmb3Jl
IGkubXg2dWwuCj4gKwnCoCovCj4gKwlpZiAoc3BpX2lteC0+dXNlZG1hKSB7Cj4gKwkJaWYgKHNw
aV9pbXgtPmRldnR5cGVfZGF0YS0+ZGV2dHlwZSA9PSBJTVg2VUxfRUNTUEkpCgo+PSwgb3RoZXJ3
aXNlIHRoZSB3b3JrYXJvdW5kIG1pZ2h0IGJlIGFwcGxpZWQgdG8gbGF0ZXIgZ2VuZXJhdGlvbnMg
b2YKdGhlIGNvcmUgaWYgbW9yZSBhcmUgYWRkZWQgbGF0ZXIuCgpSZWdhcmRzLApMdWNhcwo=
