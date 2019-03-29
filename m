Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [1/4] arm64: dts: imx8mq: Fix the fsl,imx8mq-sdma compatible string
From: Angus Ainslie <angus@akkea.ca>
Message-Id: <bc7d4617cf7f29fa05f823f48b8ba4d6@www.akkea.ca>
Date: Fri, 29 Mar 2019 07:09:26 -0700
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: Aisheng Dong <aisheng.dong@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vkoul@kernel.org>, Lucas Stach <l.stach@pengutronix.de>, Carlo Caione <ccaione@baylibre.com>, Daniel Baluta <daniel.baluta@nxp.com>, =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org
List-ID: <dmaengine.vger.kernel.org>

T24gMjAxOS0wMy0yOSAwNDoyMCwgRGFuaWVsIEJhbHV0YSB3cm90ZToKPiBPbiBGcmksIE1hciAy
OSwgMjAxOSBhdCAxMToxMSBBTSBBaXNoZW5nIERvbmcgPGFpc2hlbmcuZG9uZ0BueHAuY29tPiAK
PiB3cm90ZToKPj4gCj4+ID4gRnJvbTogQW5ndXMgQWluc2xpZSAoUHVyaXNtKSBbbWFpbHRvOmFu
Z3VzQGFra2VhLmNhXQo+PiA+IFNlbnQ6IFRodXJzZGF5LCBNYXJjaCAyOCwgMjAxOSA5OjM4IFBN
Cj4+ID4KPj4gPiBGaXggYSB0eXBvIGluIHRoZSBjb21wYXRpYmxlIHN0cmluZwo+PiA+Cj4+ID4g
U2lnbmVkLW9mZi1ieTogQW5ndXMgQWluc2xpZSAoUHVyaXNtKSA8YW5ndXNAYWtrZWEuY2E+Cj4+
ID4gLS0tCj4+ID4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhtcS5kdHNpIHwg
MiArLQo+PiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
Pj4gPgo+PiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4
bXEuZHRzaQo+PiA+IGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OG1xLmR0c2kK
Pj4gPiBpbmRleCA4MWQ1Y2UxYjFlYzEuLjA3MDk5ZjgyOTY1ZSAxMDA2NDQKPj4gPiAtLS0gYS9h
cmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4bXEuZHRzaQo+PiA+ICsrKyBiL2FyY2gv
YXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhtcS5kdHNpCj4+ID4gQEAgLTcyMCw3ICs3MjAs
NyBAQAo+PiA+ICAgICAgICAgICAgICAgICAgICAgICB9Owo+PiA+Cj4+ID4gICAgICAgICAgICAg
ICAgICAgICAgIHNkbWExOiBzZG1hQDMwYmQwMDAwIHsKPj4gPiAtICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBjb21wYXRpYmxlID0gImZzbCwgaW14OG1xLXNkbWEiLCJmc2wsaW14N2Qtc2Rt
YSI7Cj4+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJmc2ws
bXg4bXEtc2RtYSIsImZzbCxpbXg3ZC1zZG1hIjsKPj4gCj4+IFRoaXMgaXMgYSBiaXQgc3RyYW5n
ZS4KPj4gSWYgYmluZGluZyBkb2Mgc2F5cyBsaWtlIHRoYXQsIHByb2JhYmx5IHdlJ2QgYmV0dGVy
IGZpeCB0aGUgdHlwbyBpbiAKPj4gYmluZGluZyBkb2MKPj4gdG8gdXNlIHRoZSBzYW1lIHN0eWxl
Lgo+IAo+IE9oLCBpbmRlZWQuCj4gCj4gQW5ndXMsIHNob3VsZG4ndCB0aGlzIGJlIGZzbCxpbXg4
bXEtc2RtYSBpbnN0ZWFkIG9mIGZzbCxteDhtcS1zZG1hLiBJCj4gd2FzIGp1c3QgcGF5aW5nCj4g
YXR0ZW50aW9uIHRvIHRoZSBleHRyYSBzcGFjZSBpbiBteSBwYXRjaC4KCkNvcnJlY3QgSSB0b29r
IHRvbyBtYW55IGNoYXJhY3RlcnMgd2hlbiBJIGRyb3BwZWQgdGhlIHNwYWNlLiBJJ2xsIGZpeCBp
dCAKZm9yIHYyLgoKQW5ndXMK
