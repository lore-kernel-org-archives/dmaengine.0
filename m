Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [05/14] dmaengine: dma-jz4780: Add support for the JZ4740 SoC
From: Vinod Koul <vkoul@kernel.org>
Message-Id: <20180717153407.GF3219@vkoul-mobl>
Date: Tue, 17 Jul 2018 21:04:07 +0530
To: Rob Herring <robh@kernel.org>
Cc: Paul Cercueil <paul@crapouillou.net>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, Mathieu Malaterre <malat@debian.org>, Daniel Silsby <dansilsby@gmail.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
List-ID: <dmaengine.vger.kernel.org>

T24gMTYtMDctMTgsIDE1OjMzLCBSb2IgSGVycmluZyB3cm90ZToKPiBPbiBNb24sIEp1bCAwOSwg
MjAxOCBhdCAxMDo0MjoyNlBNICswNTMwLCBWaW5vZCB3cm90ZToKPiA+IE9uIDAzLTA3LTE4LCAx
NDozMiwgUGF1bCBDZXJjdWVpbCB3cm90ZToKPiA+IAo+ID4gPiAgZW51bSBqel92ZXJzaW9uIHsK
PiA+ID4gKwlJRF9KWjQ3NDAsCj4gPiA+ICAJSURfSlo0NzcwLAo+ID4gPiAgCUlEX0paNDc4MCwK
PiA+ID4gIH07Cj4gPiA+IEBAIC0yNDcsNiArMjQ4LDcgQEAgc3RhdGljIHZvaWQgano0NzgwX2Rt
YV9kZXNjX2ZyZWUoc3RydWN0IHZpcnRfZG1hX2Rlc2MgKnZkZXNjKQo+ID4gPiAgfQo+ID4gPiAg
Cj4gPiA+ICBzdGF0aWMgY29uc3QgdW5zaWduZWQgaW50IGp6NDc4MF9kbWFfb3JkX21heFtdID0g
ewo+ID4gPiArCVtJRF9KWjQ3NDBdID0gNSwKPiA+ID4gIAlbSURfSlo0NzcwXSA9IDYsCj4gPiA+
ICAJW0lEX0paNDc4MF0gPSA3LAo+ID4gPiAgfTsKPiA+ID4gQEAgLTgwMSwxMSArODAzLDEzIEBA
IHN0YXRpYyBzdHJ1Y3QgZG1hX2NoYW4gKmp6NDc4MF9vZl9kbWFfeGxhdGUoc3RydWN0IG9mX3Bo
YW5kbGVfYXJncyAqZG1hX3NwZWMsCj4gPiA+ICB9Cj4gPiA+ICAKPiA+ID4gIHN0YXRpYyBjb25z
dCB1bnNpZ25lZCBpbnQgano0NzgwX2RtYV9uYl9jaGFubmVsc1tdID0gewo+ID4gPiArCVtJRF9K
WjQ3NDBdID0gNiwKPiA+ID4gIAlbSURfSlo0NzcwXSA9IDYsCj4gPiA+ICAJW0lEX0paNDc4MF0g
PSAzMiwKPiA+ID4gIH07Cj4gPiAKPiA+IEkgZmVlbCB0aGVzZSBzaG91bGQgYmUgZG9uZSBhd2F5
IHdpdGggaWYgd2UgZGVzY3JpYmUgaGFyZHdhcmUgaW4gRFQKPiAKPiBUaGUgY29tcGF0aWJsZSBw
cm9wZXJ0eSBjYW4gaW1wbHkgdGhpbmdzIGxpa2UgdGhpcy4KClNvIHdoYXQgaXMgdGhlIGdlbmVy
YWwgcmVjb21tZW5kYXRpb24sIGxldCBEVCBkZXNjcmliZSBoYXJkd2FyZQppbmNsdWRpbmcgdmVy
c2lvbiBkZWx0YSBvciB1c2UgY29tcGF0aWJsZSB0byBjb2RlIHRoYXQgaW4gZHJpdmVyPwoKSXMg
aXQgZG9jdW1lbnRlZCBhbnl3aGVyZT8K
