Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [04/14] dmaengine: dma-jz4780: Add support for the JZ4770 SoC
From: Vinod Koul <vkoul@kernel.org>
Message-Id: <20180709171032.GJ22377@vkoul-mobl>
Date: Mon, 9 Jul 2018 22:40:32 +0530
To: Paul Cercueil <paul@crapouillou.net>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, Mathieu Malaterre <malat@debian.org>, Daniel Silsby <dansilsby@gmail.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
List-ID: <dmaengine.vger.kernel.org>

T24gMDMtMDctMTgsIDE0OjMyLCBQYXVsIENlcmN1ZWlsIHdyb3RlOgoKPiArc3RhdGljIGlubGlu
ZSB2b2lkIGp6NDc4MF9kbWFfY2hhbl9kaXNhYmxlKHN0cnVjdCBqejQ3ODBfZG1hX2RldiAqanpk
bWEsCj4gKwl1bnNpZ25lZCBpbnQgY2huKQo+ICt7Cj4gKwlpZiAoanpkbWEtPnZlcnNpb24gPT0g
SURfSlo0NzcwKQo+ICsJCWp6NDc4MF9kbWFfY3RybF93cml0ZWwoanpkbWEsIEpaX0RNQV9SRUdf
RENLRUMsIEJJVChjaG4pKTsKPiArfQoKdGhpcyBzb3VuZHMgYXMgaGFyZHdhcmUgYmVoYXZpb3Vy
LCBzbyB3aHkgbm90IGRlc2NyaWJlIGFzIGEgcHJvcGVydHkgaW4KRFQ/Cgo+ICsKPiAgc3RhdGlj
IHN0cnVjdCBqejQ3ODBfZG1hX2Rlc2MgKmp6NDc4MF9kbWFfZGVzY19hbGxvYygKPiAgCXN0cnVj
dCBqejQ3ODBfZG1hX2NoYW4gKmp6Y2hhbiwgdW5zaWduZWQgaW50IGNvdW50LAo+ICAJZW51bSBk
bWFfdHJhbnNhY3Rpb25fdHlwZSB0eXBlKQo+IEBAIC0yMjgsOCArMjQ2LDE1IEBAIHN0YXRpYyB2
b2lkIGp6NDc4MF9kbWFfZGVzY19mcmVlKHN0cnVjdCB2aXJ0X2RtYV9kZXNjICp2ZGVzYykKPiAg
CWtmcmVlKGRlc2MpOwo+ICB9Cj4gIAo+IC1zdGF0aWMgdWludDMyX3Qgano0NzgwX2RtYV90cmFu
c2Zlcl9zaXplKHVuc2lnbmVkIGxvbmcgdmFsLCB1aW50MzJfdCAqc2hpZnQpCj4gK3N0YXRpYyBj
b25zdCB1bnNpZ25lZCBpbnQgano0NzgwX2RtYV9vcmRfbWF4W10gPSB7Cj4gKwlbSURfSlo0Nzcw
XSA9IDYsCj4gKwlbSURfSlo0NzgwXSA9IDcsCj4gK307CgpTbyB0aGlzIGdpdmVzIHRoZSB0cmFu
c2ZlciBsZW5ndGggc3VwcG9ydGVkPwo=
